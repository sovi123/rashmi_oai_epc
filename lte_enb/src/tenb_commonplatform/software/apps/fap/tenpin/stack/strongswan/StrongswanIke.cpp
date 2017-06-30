///////////////////////////////////////////////////////////////////////////////
//
// StrongswanIke.cpp
//
// Copyright Radisys Limited
//
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
// System Includes
///////////////////////////////////////////////////////////////////////////////

#include <messaging/messages/ike/IkeTunnelConnectInd.h>
#include <messaging/messages/ike/IkeTunnelDisconnectInd.h>
#include <system/Utilities.h>

///////////////////////////////////////////////////////////////////////////////
// Local Includes
///////////////////////////////////////////////////////////////////////////////

#include "TenpinApplication.h"
#include "TenpinStack.h"
#include "TenpinOsLayer.h"
#include "StrongswanIke.h"
#include <fstream>

#define MAX_DIR_LEN 50

using namespace threeway;

///////////////////////////////////////////////////////////////////////////////
// Static Data
///////////////////////////////////////////////////////////////////////////////

shared_ptr<StrongswanIke> StrongswanIke::s_instance;

///////////////////////////////////////////////////////////////////////////////
// Class Functions
///////////////////////////////////////////////////////////////////////////////

class ReconfigureWalker : public IIPsecTunnelDbWalker
{
   public:
      virtual ~ReconfigureWalker() {}

    ReconfigureWalker(StrongswanIke& ike, const std::string& fapId) :
        m_ike(ike),
        m_fapId(fapId)
    {}

    // Implement IIPsecTunnelDbWalker
    bool Tunnel(
        u32                 id,
        const Fqdn&         destFqdn,
        const IPAddress&  destAddr,
        MessagingEntity     owner,
        bool                connected,
        const IPAddress&  tunnelAddr
    )
    {
        return m_ike.ReconfigureTunnel(m_fapId, id, destFqdn, destAddr);
    }

private:
    StrongswanIke&      m_ike;
    const std::string&  m_fapId;
};

StrongswanIke::StrongswanIke()
{
}

shared_ptr<StrongswanIke> StrongswanIke::GetInstance(
      void
      )
{
   if (NULL == s_instance)
   {
      s_instance.reset(new StrongswanIke());
   }

   return s_instance;
}

void StrongswanIke::ConfigFileEmpty(
      void
      )
{
   FILE * fp = TenpinOsLayer::OpenFile("emptying", m_fileConfig.c_str(), "w");

   if (fp) { fclose(fp); }
}

void StrongswanIke::ConfigFileSetup(
      void
      )
{
   string installDir = getConfigParam("STRONGSWAN_INSTALL_DIR", "/opt/strongswan-5.3.2");
   string confDir = getConfigParam("STRONGSWAN_CONF_DIR", "/opt/strongswan-5.3.2/etc");
   string scriptDir = getConfigParam("STRONGSWAN_SCRIPT_DIR", "/etc/ipsec.d/scripts");
   string cmdPrefix = getConfigParam("STRONGSWAN_USE_SUDO", "");
   string withBuiltIns = getConfigParam("STRONGSWAN_WITH_BUILT_INS", "YES");

   m_fileConfig = confDir + "/ipsec.conf";
   m_fileScript = scriptDir + "/updown.tenpin";
   m_cmdStart   = cmdPrefix + installDir + "/sbin/ipsec start";

   if (!withBuiltIns.compare("NO"))
   {
      m_cmdStart += "--conf " + m_fileConfig;
   }

   m_cmdup          = cmdPrefix + installDir + "/sbin/ipsec up";
   m_cmdStop        = cmdPrefix + installDir + "/sbin/ipsec stop";
   m_cmdTeardown    = cmdPrefix + installDir + "/sbin/ipsec down";
   m_cmdReconfigure = cmdPrefix + installDir + "/sbin/ipsec reload";

   FILE * fp = TenpinOsLayer::OpenFile("setting up", m_fileConfig.c_str(), "w");

   if (fp)
   {
      const TenpinConfiguration& config = TenpinApplication::GetInstance().GetConfiguration();

      //const char * nat_traversal      = ConfigItemNatTraversal(config);
      u32          period_ikelifetime = ConfigItemPeriodIkeLifeTime(config);
      const char * units_ikelifetime  = ConfigItemUnitsIkeLifeTime(config);
      u32          period_keylife     = ConfigItemPeriodKeyLife(config);
      const char * units_keylife      = ConfigItemUnitsKeyLife(config);
      const char * ikeRekeyLifeTimeUnit = ConfigItemUnitsIkeRekeyLifeTime(config);
      const char * ipsecLifeTimeTimeUnit = ConfigItemUnitsIpsecLifeTimeTime(config);

      u32 replayWindow = 0;
      u32 keepAlive = 0;
      u32 ikeRekeyLifeTime = 0;
      u32 ipsecLifeTimeByte = 0;
      u32 ipsecLifeTimeTime = 0;

      config.Get(CONFIG_IKE_WINDOW_SIZE, replayWindow);
      config.Get(CONFIG_NAT_T_KEEP_ALIVE_TIMER, keepAlive);
      config.Get(CONFIG_IKE_REKEY_LIFETIME, ikeRekeyLifeTime);
      config.Get(CONFIG_IPSEC_LIFETIME_TIME, ipsecLifeTimeTime);
      config.Get(CONFIG_IPSEC_LIFETIME_BYTE, ipsecLifeTimeByte);

      fprintf(fp, "# automatically generated by tenpin\n");
      fprintf(fp, "\n");
      fprintf(fp, "config setup\n");
      fprintf(fp, "    strictcrlpolicy=no\n");
      //fprintf(fp, "    keep_alive=%" PRIu32 "\n",keepAlive);
      fprintf(fp, "\n");
      fprintf(fp, "conn %%default\n");
      fprintf(fp, "    keyexchange=ikev2\n");
      fprintf(fp, "    reauth=no\n");
      fprintf(fp, "    mobike=no\n");
      fprintf(fp, "    ikelifetime=%" PRIu32 "%s\n", period_ikelifetime, units_ikelifetime);
      fprintf(fp, "    keylife=%" PRIu32 "%s\n", period_keylife, units_keylife);
      fprintf(fp, "    leftupdown=%s\n", m_fileScript.c_str());
      fprintf(fp, "    leftsourceip=%%config\n");
      fprintf(fp, "    left=%%defaultroute\n");
      fprintf(fp, "    replay_window=%" PRIu32 "\n", replayWindow);
      fprintf(fp, "    ikelifetime=%" PRIu32 "%s\n", ikeRekeyLifeTime, ikeRekeyLifeTimeUnit);
      fprintf(fp, "    lifebytes=%" PRIu32 "\n", ipsecLifeTimeByte);
      fprintf(fp, "    lifetime=%" PRIu32 "%s\n", ipsecLifeTimeTime, ipsecLifeTimeTimeUnit);
      fprintf(fp, "\n");

      fclose(fp);
   }
}

void StrongswanIke::ConfigFileAppendTunnels(
      const IPsecTunnelDb&    tunnelDb,
      const std::string&      fapId
      )
{
   ReconfigureWalker walker(*this, fapId);
   tunnelDb.Walk(walker);
}

void StrongswanIke::ConfigFileAppendTunnel(
      const std::string&  fapId,
      u32                 tunnelId,
      const Fqdn&         destFqdn,
      const IPAddress&  destAddr
      )
{
   string leftcertFilename = getConfigParam("STRONGSWAN_LEFTCERT_FILENAME", "");
   string leftIdStr = getConfigParam("STRONGSWAN_LEFT_ID", "");
   string rightSubnet = getConfigParam("STRONGSWAN_RIGHT_SUBNET", "");
   string rightIdStr = getConfigParam("STRONGSWAN_RIGHT_ID", "");

   FILE * fp = TenpinOsLayer::OpenFile("appending tunnel", m_fileConfig.c_str(), "a");
   if (fp)
   {
      const TenpinConfiguration& config = TenpinApplication::GetInstance().GetConfiguration();
      const char * rightAddr          = destAddr.Get();
      const char * dpdaction          = ConfigItemDpdAction(config);
      u32          period_dpddelay    = ConfigItemPeriodDpdDelay(config);
      const char * units_dpddelay     = ConfigItemUnitsDpdDelay(config);
      u32          authMethod         = ConfigItemAuthMethod(config);
      const char * leftsendcert       = ConfigItemLeftSendCert(config);
      string       ciphersuites_ike   = ConfigItemCipherSuitesIke(config);
      string       ciphersuites_esp   = ConfigItemCipherSuitesEsp(config);
      u32 fragmentation = 0;
      config.Get(CONFIG_CRYPTO_SEC_DF_BIT, fragmentation);

      fprintf(fp, "conn conn-%d\n", tunnelId);
      fprintf(fp, "    keyexchange=ikev2\n");

      // If IKE cipher suites are configured, use them. Else, let strongswan propose them
      if (ciphersuites_ike.compare(""))
      {
         fprintf(fp, "    ike=%s\n", ciphersuites_ike.c_str());
      }

      // If ESP cipher suites are configured, use them. Else, let strongswan propose them
      if (ciphersuites_esp.compare(""))
      {
         fprintf(fp, "    esp=%s\n", ciphersuites_esp.c_str());
      }

      fprintf(fp, "    right=%s\n", rightAddr);

      // Write the leftid and the rightid so that the IPSec peer can identify which connection
      // should be used for this security association.
      // Strongswan proposes it based on availability of certificate. If the certificate has 
      // Subject or SubjectAltName, these will override even if a different leftid is configured.
      // If no certificate is used and the leftid is not configured, the value is set to the FAP
      // IP address.
      if (leftIdStr.compare(""))
      {
         fprintf(fp, "    leftid=%s\n", leftIdStr.c_str());
      }

      // Write the SecGW's address and identities into the IPSEC configuration file
      if (rightIdStr.compare(""))
      {
         fprintf(fp, "    rightid=%s\n", rightIdStr.c_str());
      }
      else
      {
         fprintf(fp, "    rightid=*\n");
      }

      if (authMethod == AUTH_METHOD_PSK)
      {
         fprintf(fp, "    authby=secret\n");
      }
      else
      {
         fprintf(fp, "    leftcert=%s\n", leftcertFilename.c_str());
         fprintf(fp, "    leftsendcert=%s\n", leftsendcert);
         fprintf(fp, "    authby=pubkey\n");
      }
      if (rightSubnet.compare(""))
      {
         fprintf(fp, "    rightsubnet=%s\n", rightSubnet.c_str());
      }
      else
      {
         // If the subnet is not configured, propose tunnel for the entire address range
         // SEC GW responds with the subnet that is reachable behind it as the intersection
         // will always include the virtual subnset. Otherwise, the SEC GW assumes that 
         // FAP proposes just a /32 address as the reachable address range.
         fprintf(fp, "    rightsubnet=0.0.0.0/0\n");
      }
      fprintf(fp, "    dpdaction=%s\n", dpdaction);
      fprintf(fp, "    dpddelay=%" PRIu32 "%s\n", period_dpddelay, units_dpddelay);
      if(true == fragmentation)
      {
         fprintf(fp, "    fragmentation=yes\n");
      }
      else
      {
         fprintf(fp, "    fragmentation=no\n");
      }
      fprintf(fp, "    auto=start\n");
      fprintf(fp, "\n");

      fclose(fp);
   }
}

void StrongswanIke::ServiceStart(
      void
      )
{
   TenpinOsLayer::DoCommand("starting ipsec service", m_cmdStart.c_str());
}

void StrongswanIke::ServiceStop(
      void
      )
{
   TenpinOsLayer::DoCommand("stopping ipsec service", m_cmdStop.c_str());
}

void StrongswanIke::CreateTunnel(
      void
      )
{
   ostringstream command;

   command << m_cmdup << " conn-1" ;

   TenpinOsLayer::DoCommand("set up tunnel", command.str().c_str());
}

void StrongswanIke::ServiceReconfigure(
      void
      )
{
   TenpinOsLayer::DoCommand("reconfiguring ipsec service", m_cmdReconfigure.c_str());
}

u32 StrongswanIke::TimePeriod(
      u32 val
      )
{
   u32 stride = 0;

   if (val <= 60)
   {
      stride = 0; /* don't round values in seconds */
   }
   else if (val <= 3600)
   {
      stride = 60; /* 60**1 seconds per minute */
   }
   else
   {
      stride = 3600; /* 60**2 seconds per hour */
   }

   if (stride)
   {
      u32 rerror = val % stride; /* rounding error */

      val /= stride;

      if ((stride >> 1) <= rerror)
      {
         val += 1; /* round up */
      }
   }

   return val;
}

const char * StrongswanIke::TimeUnits(
      u32 val
      )
{
   const char * units = NULL;

   if (val <= 60)
   {
      units = "s"; /* seconds */
   }
   else if (val <= 3600)
   {
      units = "m"; /* minutes */
   }
   else
   {
      units = "h"; /* hours */
   }

   return units;
}

u32 StrongswanIke::ConfigItemTimePeriod(
      const TenpinConfiguration&  config,
      TenpinConfigurationItem_e   item
      )
{
   u32 val = 0;
   config.Get(item, val);
   return TimePeriod(val);
}

const char * StrongswanIke::ConfigItemTimeUnits(
      const TenpinConfiguration&  config,
      TenpinConfigurationItem_e   item
      )
{
   u32 val = 0;
   config.Get(item, val);
   return TimeUnits(val);
}

const char * StrongswanIke::ConfigItemNatTraversal(
      const TenpinConfiguration&  config
      )
{
   u32 val;

   if (    (true == config.Get(CONFIG_IPSEC_NAT_T_PORT, val))
         && (4500 != val)
      )
   {
      return "no";
   }

   return "yes";
}

u32 StrongswanIke::ConfigItemPeriodIkeLifeTime(
      const TenpinConfiguration&  config
      )
{
   return ConfigItemTimePeriod(config, CONFIG_IKE_SA_LIFETIME);
}

const char * StrongswanIke::ConfigItemUnitsIkeLifeTime(
      const TenpinConfiguration&  config
      )
{
   return ConfigItemTimeUnits(config, CONFIG_IKE_SA_LIFETIME);
}

const char * StrongswanIke::ConfigItemUnitsIkeRekeyLifeTime(
      const TenpinConfiguration&  config
      )
{
   return ConfigItemTimeUnits(config, CONFIG_IKE_REKEY_LIFETIME);
}

const char * StrongswanIke::ConfigItemUnitsIpsecLifeTimeTime(
      const TenpinConfiguration&  config
      )
{
   return ConfigItemTimeUnits(config, CONFIG_IPSEC_LIFETIME_TIME);
}

u32 StrongswanIke::ConfigItemPeriodKeyLife(
      const TenpinConfiguration&  config
      )
{
   return ConfigItemTimePeriod(config, CONFIG_IPSEC_SA_LIFETIME);
}

const char * StrongswanIke::ConfigItemUnitsKeyLife(
      const TenpinConfiguration&  config
      )
{
   return ConfigItemTimeUnits(config, CONFIG_IPSEC_SA_LIFETIME);
}

u32 StrongswanIke::ConfigItemMarginTime(
      const TenpinConfiguration&  config
      )
{
   u32 val      = 0;
   u32 valIke   = 0;
   u32 valIpsec = 0;

   config.Get(CONFIG_IKE_SA_LIFETIME,   valIke);
   config.Get(CONFIG_IPSEC_SA_LIFETIME, valIpsec);

   /* how many seconds before expiry of SA to initiate rekeying
    * note that this applies to both types of SA
    * therefore need to select a value appropriate for both SAs
    * use the smallest lifetime
    */

   val = (valIke < valIpsec) ? valIke : valIpsec;

   if (val <= 120)
   {
      val = 30; /* 30 seconds before */
   }
   else if (val <= 1200)
   {
      val = 60; /* one minute before */
   }
   else
   {
      val = 600; /* ten minutes before */
   }

   return val;
}

u32 StrongswanIke::ConfigItemPeriodMarginTime(
      const TenpinConfiguration&  config
      )
{
   u32 val = ConfigItemMarginTime(config);
   return TimePeriod(val);
}

const char * StrongswanIke::ConfigItemUnitsMarginTime(
      const TenpinConfiguration&  config
      )
{
   u32 val = ConfigItemMarginTime(config);
   return TimeUnits(val);
}

string StrongswanIke::ConfigItemCipherSuitesIke(
      const TenpinConfiguration&  config
      )
{
   string cipherStr = "";
   u32 encryption3des = 0;
   u32 encryptionAes = 0;
   u32 encryptionNull   = 0;
   u32 integSha = 0;
   u32 integMac = 0;
   u32 dp1024 = 0;
   u32 dp2048 = 0;
   u32 integPrfSha1 = 0;
   u32 integPrfXcbc = 0;

   config.Get(CONFIG_IKE_ENCRYPTION_3DES_ENABLE, encryption3des);
   config.Get(CONFIG_IKE_ENCRYPTION_AES128_ENABLE,   encryptionAes);
   config.Get(CONFIG_IKE_ENCRYPTION_NULL_ENABLE,   encryptionNull);
   config.Get(CONFIG_IKE_INTEGRITY_SHA1_ENABLE, integSha);
   config.Get(CONFIG_IKE_INTEGRITY_MAC_ENABLE, integMac);
   config.Get(CONFIG_IKE_DP1024_ENABLE, dp1024);
   config.Get(CONFIG_IKE_DP2048_ENABLE, dp2048);
   config.Get(CONFIG_IKE_PRF_SHA1_ENABLE, integPrfSha1);
   config.Get(CONFIG_IKE_PRF_XCBC_ENABLE, integPrfXcbc);

   if(integSha)
   {
      if (encryptionAes && dp1024)
      {
         cipherStr += "aes128-sha1-modp1024!";
      }
      if (encryptionAes && dp2048)
      {
         cipherStr += "aes128-sha1-modp2048!";
      }
      if(encryption3des && dp1024)
      {
         cipherStr += "3des-sha1-modp1024!";
      }
      if(encryption3des && dp2048)
      {
         cipherStr += "3des-sha1-modp2048!";
      }
      if(encryptionNull && dp1024)
      {
         cipherStr += "null-sha1-modp1024!";
      }
      if(encryptionNull && dp2048)
      {
         cipherStr += "null-sha1-modp2048!";
      }
   }

   // Strongswan proposes based on its capabilities
   // RSYS_ASSERT(encryption3des || encryptionAes || encryptionNull);

   return cipherStr;
}

string StrongswanIke::ConfigItemCipherSuitesEsp(
      const TenpinConfiguration&  config
      )
{
   string cipherStr = "";
   u32 encryption3des = 0;
   u32 encryptionAes = 0;
   u32 encryptionNull = 0;
   u32 integSha = 0;
   u32 integMac = 0;
   u32 dp1024 = 0;
   u32 dp2048 = 0;

   config.Get(CONFIG_IPSEC_ENCRYPTION_3DES_ENABLE, encryption3des);
   config.Get(CONFIG_IPSEC_ENCRYPTION_AES128_ENABLE,   encryptionAes);
   config.Get(CONFIG_IPSEC_ENCRYPTION_NULL_ENABLE,   encryptionNull);
   config.Get(CONFIG_IPSEC_INTEGRITY_SHA1_ENABLE, integSha);
   config.Get(CONFIG_IPSEC_INTEGRITY_MAC_ENABLE, integMac);
   config.Get(CONFIG_IKE_DP1024_ENABLE, dp1024);
   config.Get(CONFIG_IKE_DP2048_ENABLE, dp2048);

   if(integSha)
   {
      if (encryptionAes && dp1024)
      {
         cipherStr += "aes128-sha1-modp1024!";
      }
      if (encryptionAes && dp2048)
      {
         cipherStr += "aes128-sha1-modp2048!";
      }
      if(encryption3des && dp1024)
      {
         cipherStr += "3des-sha1-modp1024!";
      }
      if(encryption3des && dp2048)
      {
         cipherStr += "3des-sha1-modp2048!";
      }
      if(encryptionNull && dp1024)
      {
         cipherStr += "null-sha1-modp1024!";
      }
      if(encryptionNull && dp2048)
      {
         cipherStr += "null-sha1-modp2048!";
      }
   }

   //RSYS_ASSERT(encryption3des || encryptionAes || encryptionNull);

   return cipherStr;
}

const char * StrongswanIke::ConfigItemLeftSendCert(
      const TenpinConfiguration&  config
      )
{
   return "ifasked";
}

const char * StrongswanIke::ConfigItemDpdAction(
      const TenpinConfiguration&  config
      )
{
   return "clear";
}

u32 StrongswanIke::ConfigItemPeriodDpdDelay(
      const TenpinConfiguration&  config
      )
{
   u32 val = 0;
   config.Get(CONFIG_IKE_DPD_INTERVAL, val);
   return val;
}

u32 StrongswanIke::ConfigItemAuthMethod(
      const TenpinConfiguration&  config
      )
{
   u32 val = 0;
   config.Get(CONFIG_IPSEC_AUTH_METHOD, val);
   return val;
}
const char * StrongswanIke::ConfigItemUnitsDpdDelay(
      const TenpinConfiguration&  config
      )
{
   /* trial and error shows that this appears to be unit-less */
   return "";
}

void StrongswanIke::Start(
      const IPsecTunnelDb&    tunnelDb,
      const std::string&      fapId
      )
{

   ConfigFileEmpty();
   ConfigFileSetup();
   ConfigFileAppendTunnels(tunnelDb, fapId);
   ServiceStart();
}

void StrongswanIke::Stop(
      void
      )
{
   ServiceStop();
}

void StrongswanIke::RegisterCli(
      shared_ptr<CliHandler>  handler
      )
{
   CliCmdDescriptor ikeShowConfig = { "show-config", 0, 0, "dev", "show-config", "Show IKE configuration" };
   handler->RegisterCliCmd(ikeShowConfig, &StrongswanIke::CliShowConfig);
}

shared_ptr<CliResponse> StrongswanIke::CliShowConfig(
      const CliArguments& cliArgs
      )
{
   return TenpinApplication::GetInstance().GetConfiguration().CliShowConfig(cliArgs);
}

void StrongswanIke::Teardown(
      IPsecTunnelDb&  tunnelDb,
      u32             tunnelId
      )
{
   IPAddress destAddr;

   tunnelDb.GetTunnelDestAddr(tunnelId, destAddr);

   ostringstream reason;
   ostringstream command;

   reason << "tearing down tunnel " << tunnelId;
   command << m_cmdTeardown << " conn-" << tunnelId;

   TenpinOsLayer::DoCommand(reason.str().c_str(), command.str().c_str());
}

void StrongswanIke::Reconfigure(
      const IPsecTunnelDb&    tunnelDb,
      const std::string&      fapId
      )
{
   ConfigFileSetup();
   ConfigFileAppendTunnels(tunnelDb, fapId);
   ServiceReconfigure();
}

const char * StrongswanIke::FilenameCertificate(
      TenpinCertificate_e tc
      )
{
   switch (tc)
   {
      case CERTIFICATE_RADISYS_ROOT_1: return "/etc/ipsec.d/cacerts/radisys_root1.cer";
      case CERTIFICATE_RADISYS_ROOT_2: return "/etc/ipsec.d/cacerts/radisys_root2.cer";
      case CERTIFICATE_RADISYS_BATCH:  return "/etc/ipsec.d/cacerts/radisys_batch.cer";
      case CERTIFICATE_RADISYS_FAP:    return "/etc/ipsec.d/certs/fap.cer";
   }

   return NULL;
}

bool StrongswanIke::CheckCertificates(
      void
      )
{
   /* TODO - relies on useful X509 component */
   return true;
}

void StrongswanIke::GetTrustedCAs(
      unsigned char * theCAs,
      unsigned int *  lenCAs
      )
{
   /* nothing to do */
}

void StrongswanIke::GetOwnRootCAs(
      unsigned char * theCAs,
      unsigned int *  lenCAs
      )
{
   /* nothing to do */
}

void StrongswanIke::GetOwnIntermediateCAs(
      unsigned char * theCAs,
      unsigned int *  lenCAs
      )
{
   /* nothing to do */
}

bool StrongswanIke::ReconfigureTunnel(
      const std::string&  fapId,
      u32                 tunnelId,
      const Fqdn&         destFqdn,
      const IPAddress&  destAddr
      )
{
   ConfigFileAppendTunnel(fapId, tunnelId, destFqdn, destAddr);
   return true;
}
