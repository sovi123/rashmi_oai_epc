/********************************************************************20**

     Name:    RRC - acc test file

     Type:    C file

     Desc:    

     File:    nhac_pjuutl.c

     Sid:      nhac_pjuutl_r9.c@@/main/TeNB_Main_BR/tenb_main_ccb/tenb_5.0_RIB/tenb_5.0_RIB_GA/10 - Mon Feb 15 12:51:25 2016

     Prg:     dm

*********************************************************************21*/

/* header include files (.h) */
#include <stdlib.h>        /* For atoi function */
/* header include files (.h) */
#include "envopt.h"        /* environment options */
#include "envdep.h"        /* environment dependent */
#include "envind.h"        /* environment independent */
#include "gen.h"            /* general layer                */
#include "ssi.h"            /* system services              */
#include "cm5.h"            /* common timer module          */
#include "cm_hash.h"        /* common hash list             */
#include "cm_tkns.h"        /* common tokens                */
#include "cm_inet.h"        /* Inet header file             */
#include "cm_mblk.h"        /* common memory allocation     */
#include "cm_llist.h"      /* common link list */
#include "cm_lte.h"        /* common LTE structures */
#include "ckw.h"            /* C-RLC interface */
#include "kwu.h"            /* D-RLC interface */
#include "crg.h"            /* C-MAC interface */
#include "cpj.h"            /* C-PDCP interface */
#include "pju.h"            /* D-PDCP interface */
#include "nhu.h"           /* RRC Upper Interface */
#include "ctf.h"           /* PHY Interface */
#include "cm_xta.h"
#include "nhac_acc.h"
#include "nh.h"
#include "lnh.h"
#include "cm_pasn.h"
/* external headers */


/* header/extern include files (.x) */
#include "gen.x"            /* general layer                */
#include "ssi.x"            /* system services              */
#include "cm5.x"            /* common timer module          */
#include "cm_lib.x"         /* common library               */
#include "cm_hash.x"        /* common hash list             */
#include "cm_tkns.x"        /* common tokens                */
#include "cm_mblk.x"        /* common memory allocation     */
#include "cm_inet.x"        /* Inet header file             */
#include "cm_llist.x"      /* common link list */
#include "cm_lte.x"        /* common LTE structures */
#include "cm_xta.x"
#include "ckw.x"            /* C-RLC interface */
#include "kwu.x"            /* D-RLC interface */
#include "crg.x"            /* C-MAC interface */
#include "cpj.x"            /* C-PDCP interface */
#include "pju.x"            /* D-PDCP interface */
#include "nhac_asn.x"
using namespace NH_LTERRC_REL9;
#include "nhac_nhu.x"
#include "ctf.x"           /* PHY interface */
#include "lnh.x"
#include "cm_pasn.x"
#include "nh.x"
#include "nhac_db.x"
#include "nh_3gdb.x"
#include "nhac_acc.x"

PUBLIC CmXtaSpCb    *gSpCb;
PUBLIC CmXtaTCCb    *gTcCb;

/*
 *
 *       Fun:    nhAcKwuTstCbFind -
 *
 *       Desc:   Find the test Case Control Block 
 *
 *       Ret:    CMXTA_ERR_NONE     - succeeded
 *               CMXTA_ERR_INT - failed
 *
 *       Notes:  None
 *
 *       File:   nhac_kwuutl.c
 *
 */
#ifdef ANSI
PUBLIC CmXtaTCCb*  nhAcPjuTstCbFind
(
)
#else
PUBLIC CmXtaTCCb*  nhAcPjuTstCbFind ()
#endif
{
   TRC2(nhAcPjuTstCbFind)

   /*-- Optimization, check if only one TC running --*/
#ifdef CMXTA_EXTENSION
   if (cmXtaCb.curTCCb != NULLP)
      RETVALUE(cmXtaCb.curTCCb);
#else
   if ((cmXtaCb.curTCCb != NULLP)   &&
       (cmXtaCb.curTCCb->state != CMXTA_END_SHUTDOWN))
      RETVALUE(cmXtaCb.curTCCb);
#endif

   RETVALUE(NULLP);
}

/*
 *
 *       Fun:    nhAcBuildUpLinkTrfr_r9
 *
 *       Desc:   Build RRC Up Link Transfer
 *
 *       Ret:    Void 
 *
 *       Notes:  None
 *
 *       File:   nhac_pjuutl.c
 *
 */

#ifdef ANSI
PUBLIC S16  nhAcBuildUpLinkTrfr_r9
(
 Buffer **mBuf
 )
#else
PUBLIC S16  nhAcBuildUpLinkTrfr_r9(mBuf)
   Buffer **mBuf;
#endif
{


   NhuDatIndSdus  *pdu;
   NhuUL_DCCH_Msg *upLinkTrfrMsg=NULLP;
   NhuULInfoTfrcriticalExtns *critex=NULLP;
   Mem  sMem; 
   S16 ret = 0;
   Bool dbgFlag = TRUE;  /* Debug Flag */ 
   U32  fLen;      /* Length of static buffer, if applicable */
   CmPAsnErr err;  /* error to be returned back to the caller */ 

   TRC2(nhAcBuildUpLinkTrfr_r9)

   sMem.region = 0;
   sMem.pool = 0;
   fLen = 0;

   CMXTA_ALLOCMBUF(mBuf);

   CMXTA_ALLOC_EVNT(&pdu, sizeof(NhuDatIndSdus),&sMem, NHAC_MEM_PDU_SIZE);


   upLinkTrfrMsg = &(pdu->sdu.m.ulDcchMsg.dcchMsg);

   NHAC_FILL_U8_U32_TKN(upLinkTrfrMsg->pres, TRUE, 1);
   NHAC_FILL_U8_U32_TKN(upLinkTrfrMsg->message.choice,TRUE, 0);
   /* To fill c1 */
   if(!(upLinkTrfrMsg->message.choice.val))
   {
      /* this is for Uplink Transfer */
      NHAC_FILL_U8_U32_TKN(upLinkTrfrMsg->message.val.c1.choice,TRUE, C1_ULINFOTFR);
      if(upLinkTrfrMsg->message.val.c1.choice.val == C1_ULINFOTFR)
      {
         NHAC_FILL_U8_U32_TKN(upLinkTrfrMsg->message.val.c1.val.ulInfoTfr.pres,TRUE, 1);
         critex = &(upLinkTrfrMsg->message.val.c1.val.ulInfoTfr.criticalExtns);

         NHAC_FILL_U8_U32_TKN(critex->choice,TRUE, 0);
         if (!(critex->choice.val))
         {
            NHAC_FILL_U8_U32_TKN(critex->val.c1.choice,TRUE, 0);
            NHAC_FILL_U8_U32_TKN(critex->val.c1.val.ulInfoTfr_r8.pres,TRUE, 1);

            NHAC_FILL_U8_U32_TKN(critex->val.c1.val.ulInfoTfr_r8.dedicatedInfoTyp.choice,TRUE, 0);
            if (!(critex->val.c1.val.ulInfoTfr_r8.dedicatedInfoTyp.choice.val))
            {
                FILL_OCT_STR(critex->val.c1.val.ulInfoTfr_r8.dedicatedInfoTyp.val.dedicatedInfoNAS,1,1,pdu);
            }
            else
            {
               /* CDMA 2000 */
               /* Octet String */
            }

            NHAC_FILL_U8_U32_TKN(critex->val.c1.val.ulInfoTfr_r8.nonCriticalExtn.pres,TRUE, 1);
         }
         else
         {
         }
      }
      else
      {
         /* Invalid message type */
      }
   }
   else
   {
      NHAC_FILL_U8_U32_TKN(upLinkTrfrMsg->message.val.messageClassExtn.pres,TRUE, 1);
   }

   /* Encode the message */
   ret = cmPAsnEncMsgUalign ((TknU8*)(upLinkTrfrMsg), CM_PASN_USE_MBUF, 
            (Void *)(*mBuf),0, nhUL_DCCH_Pdu_r9, &err, &fLen, dbgFlag, FALSE);
   if (ret != ROK)
   {
      sprintf( pbuf,"\n PASN lib Encoding Failed!\n");
      SPrint(  pbuf  );
      CMXTA_FREEMBUF(*mBuf);
      CMXTA_FREEEVNT(pdu);
      RETVALUE(CMXTA_ERR_INT);
   } 
   else 
   {
      sprintf( pbuf,"\n PASN lib Encoding OK\n");
      SPrint(  pbuf  );
   }

   CMXTA_FREEEVNT(pdu);
   RETVALUE (CMXTA_ERR_NONE);
}

/*
 *
 *       Fun:    nhAcBuildRrcStatus
 *
 *       Desc:   Build RRC Status
 *
 *       Ret:    Void 
 *
 *       Notes:  None
 *
 *       File:   nhac_pjuutl.c
 *
 */

#ifdef ANSI
PUBLIC S16  nhAcBuildRrcStatus
(
 Buffer **mBuf
 )
#else
PUBLIC S16  nhAcBuildRrcStatus(mBuf)
   Buffer **mBuf;
#endif
{
   NhuDatIndSdus  *pdu;
   NhuUL_DCCH_Msg *rrcStatusMsg=NULLP;
   /*NhuRRCStatuscriticalExtns *critex=NULLP;*/
   Mem  sMem; 
   S16 ret = 0;
   Bool dbgFlag = TRUE;  /* Debug Flag */ 
   U32  fLen;      /* Length of static buffer, if applicable */
   CmPAsnErr err;  /* error to be returned back to the caller */ 

   TRC2(nhAcBuildRrcStatus)

   sMem.region = 0;
   sMem.pool = 0;
   fLen = 0;

   CMXTA_ALLOCMBUF(mBuf);

   CMXTA_ALLOC_EVNT(&pdu, sizeof(NhuDatIndSdus),&sMem, NHAC_MEM_PDU_SIZE);


   rrcStatusMsg = &(pdu->sdu.m.ulDcchMsg.dcchMsg);

   NHAC_FILL_U8_U32_TKN(rrcStatusMsg->pres, TRUE, 1);
   NHAC_FILL_U8_U32_TKN(rrcStatusMsg->message.choice,TRUE, 0);
   /* To fill c1 */
   if(!(rrcStatusMsg->message.choice.val))
   {
      /* this is for RRC Status */
      NHAC_FILL_U8_U32_TKN(rrcStatusMsg->message.val.c1.choice,TRUE, 5);
   }
   else
   {
      NHAC_FILL_U8_U32_TKN(rrcStatusMsg->message.val.messageClassExtn.pres,TRUE, 1);
   }

   /* Encode the message */
   ret = cmPAsnEncMsgUalign ((TknU8*)(rrcStatusMsg), CM_PASN_USE_MBUF, 
            (Void *)(*mBuf),0, nhUL_DCCH_Pdu_r9, &err, &fLen, dbgFlag, FALSE);
   if (ret != ROK) 
   {
      sprintf( pbuf,"\n PASN lib Encoding Failed!\n");
      SPrint(  pbuf  );
      CMXTA_FREEMBUF(*mBuf);
      CMXTA_FREEEVNT(pdu);
      RETVALUE(CMXTA_ERR_INT);
   } 
   else 
   {
      sprintf( pbuf,"\n PASN lib Encoding OK\n");
      SPrint(  pbuf  );
   }

   CMXTA_FREEEVNT(pdu);
   RETVALUE (CMXTA_ERR_NONE);
}

/*
 *
 *       Fun:    nhAcBuildRRCSecModeFail_r9
 *
 *       Desc:   Build RRC Security Mode Fail
 *
 *       Ret:    Void 
 *
 *       Notes:  None
 *
 *       File:   nhac_pjuutl.c
 *
 */

#ifdef ANSI
PUBLIC S16  nhAcBuildRRCSecModeFail_r9
(
 Buffer **mBuf
 )
#else
PUBLIC S16  nhAcBuildRRCSecModeFail_r9(mBuf)
   Buffer **mBuf;
#endif
{


   NhuDatIndSdus  *pdu;
   NhuUL_DCCH_Msg *secModeFailMsg=NULLP;
   NhuSecModeFailcriticalExtns *critex=NULLP;
   Mem  sMem; 
   S16 ret = 0;

   Bool dbgFlag = TRUE;  /* Debug Flag */ 
   U32  fLen;      /* Length of static buffer, if applicable */
   CmPAsnErr err;  /* error to be returned back to the caller */ 

   TRC2(nhAcBuildRRCSecModeFail_r9)

   sMem.region = 0;
   sMem.pool = 0;
   fLen = 0;

   CMXTA_ALLOCMBUF(mBuf);

   CMXTA_ALLOC_EVNT(&pdu, sizeof(NhuDatIndSdus),&sMem, NHAC_MEM_PDU_SIZE);

   secModeFailMsg = &(pdu->sdu.m.ulDcchMsg.dcchMsg);

   NHAC_FILL_U8_U32_TKN(secModeFailMsg->pres, TRUE, 1);
   NHAC_FILL_U8_U32_TKN(secModeFailMsg->message.choice,TRUE, 0);
   /* To fill c1 */
   if(!(secModeFailMsg->message.choice.val))
   {
      /* this is for Security mode Complete */
      NHAC_FILL_U8_U32_TKN(secModeFailMsg->message.val.c1.choice,TRUE, C1_SECURITYMODEFAIL);
      if(secModeFailMsg->message.val.c1.choice.val == C1_SECURITYMODEFAIL)
      {
         NHAC_FILL_U8_U32_TKN(secModeFailMsg->message.val.c1.val.securityModeFail.pres,TRUE, 1);
         /* RRC TransID */
         NHAC_FILL_U8_U32_TKN(secModeFailMsg->message.val.c1.val.securityModeFail.rrc_TrnsxnId,TRUE, 1);

         critex = &(secModeFailMsg->message.val.c1.val.securityModeFail.criticalExtns);

         NHAC_FILL_U8_U32_TKN(critex->choice,TRUE, 0);
         if (!(critex->choice.val))
         {
            NHAC_FILL_U8_U32_TKN(critex->val.securityModeFail_r8.pres,TRUE, 1);
            NHAC_FILL_U8_U32_TKN(critex->val.securityModeFail_r8.nonCriticalExtn.pres,TRUE, 1);
         }
         else
         {
         }
      }
      else
      {
         /* Invalid message type */
      }
   }
   else
   {
      NHAC_FILL_U8_U32_TKN(secModeFailMsg->message.val.messageClassExtn.pres,TRUE, 1);
   }

   /* Encode the message */
   ret = cmPAsnEncMsgUalign ((TknU8*)(secModeFailMsg), CM_PASN_USE_MBUF, 
           (Void *)(*mBuf),0, nhUL_DCCH_Pdu_r9, &err, &fLen, dbgFlag, FALSE);
   if (ret != ROK) 
   {
      sprintf( pbuf,"\n PASN lib Encoding Failed!\n");
      SPrint(  pbuf  );
      CMXTA_FREEMBUF(*mBuf);
      CMXTA_FREEEVNT(pdu);
      RETVALUE(CMXTA_ERR_INT);
   } 
   else 
   {
      sprintf( pbuf,"\n PASN lib Encoding OK\n");
      SPrint(  pbuf  );
   }

   CMXTA_FREEEVNT(pdu);
   RETVALUE (CMXTA_ERR_NONE);
}


/*
 *
 *       Fun:    nhAcBuildRRCSecModeComplete_r9
 *
 *       Desc:   Build RRC Security Mode Complete
 *
 *       Ret:    Void 
 *
 *       Notes:  None
 *
 *       File:   nhac_pjuutl.c
 *
 */

#ifdef ANSI
PUBLIC S16  nhAcBuildRRCSecModeComplete_r9
(
 Buffer **mBuf
 )
#else
PUBLIC S16  nhAcBuildRRCSecModeComplete_r9(mBuf)
   Buffer **mBuf;
#endif
{


   NhuDatIndSdus  *pdu;
   NhuUL_DCCH_Msg *secModeCompMsg=NULLP;
   NhuSecModeComplcriticalExtns *critex=NULLP;

   Mem  sMem; 
   S16 ret = 0;

   Bool dbgFlag = TRUE;  /* Debug Flag */ 
   U32  fLen;      /* Length of static buffer, if applicable */
   CmPAsnErr err;  /* error to be returned back to the caller */ 

   TRC2(nhAcBuildRRCSecModeComplete_r9)

   sMem.region = 0;
   sMem.pool = 0;
   fLen = 0;

   CMXTA_ALLOCMBUF(mBuf);

   CMXTA_ALLOC_EVNT(&pdu, sizeof(NhuDatIndSdus),&sMem, NHAC_MEM_PDU_SIZE);

   secModeCompMsg = &(pdu->sdu.m.ulDcchMsg.dcchMsg);

   NHAC_FILL_U8_U32_TKN(secModeCompMsg->pres, TRUE, 1);
   NHAC_FILL_U8_U32_TKN(secModeCompMsg->message.choice,TRUE, 0);
   /* To fill c1 */
   if(!(secModeCompMsg->message.choice.val))
   {
      /* this is for Security mode Complete */
      NHAC_FILL_U8_U32_TKN(secModeCompMsg->message.val.c1.choice,TRUE, C1_SECURITYMODECOMPL);
      if(secModeCompMsg->message.val.c1.choice.val == C1_SECURITYMODECOMPL)
      {
         NHAC_FILL_U8_U32_TKN(secModeCompMsg->message.val.c1.val.securityModeCompl.pres,TRUE, 1);
         /* RRC TransID */
         NHAC_FILL_U8_U32_TKN(secModeCompMsg->message.val.c1.val.securityModeCompl.rrc_TrnsxnId,TRUE, 1);
         critex = &(secModeCompMsg->message.val.c1.val.securityModeCompl.criticalExtns);

         NHAC_FILL_U8_U32_TKN(critex->choice,TRUE, 0);
         if (!(critex->choice.val))
         {
            NHAC_FILL_U8_U32_TKN(critex->val.securityModeCompl_r8.pres,TRUE, 1);
            NHAC_FILL_U8_U32_TKN(critex->val.securityModeCompl_r8.nonCriticalExtn.pres,TRUE, 1);
         }
         else
         {
         }
      }
      else
      {
         /* Invalid message type */
      }
   }
   else
   {
      NHAC_FILL_U8_U32_TKN(secModeCompMsg->message.val.messageClassExtn.pres,TRUE, 6);
   }

   /* Encode the message */
   ret = cmPAsnEncMsgUalign ((TknU8*)(secModeCompMsg), CM_PASN_USE_MBUF, 
            (Void *)(*mBuf),0, nhUL_DCCH_Pdu_r9, &err, &fLen, dbgFlag, FALSE);
   if (ret != ROK) 
   {
      sprintf( pbuf,"\n PASN lib Encoding Failed!\n");
      SPrint(  pbuf  );
      CMXTA_FREEMBUF(*mBuf);
      CMXTA_FREEEVNT(pdu);
      RETVALUE(CMXTA_ERR_INT);
   } 
   else 
   {
      sprintf( pbuf,"\n PASN lib Encoding OK\n");
      SPrint(  pbuf  );
   }

   CMXTA_FREEEVNT(pdu);
   RETVALUE (CMXTA_ERR_NONE);
}

/*
 *
 *       Fun:    nhAcBuildRRCConSetupComplete_r9
 *
 *       Desc:   Build RRC Conn. Setup Complete
 *
 *       Ret:    Void 
 *
 *       Notes:  None
 *
 *       File:   nhac_pjuutl.c
 *
 */

#ifdef ANSI
PUBLIC S16  nhAcBuildRRCConSetupComplete_r9
(
 Buffer **mBuf,
 CmXtaSpCb    *spCb
 )
#else
PUBLIC S16  nhAcBuildRRCConSetupComplete_r9(mBuf, spCb)
   Buffer **mBuf;
   CmXtaSpCb    *spCb;
#endif
{
   NhuDatIndSdus  *pdu;
   NhuUL_DCCH_Msg *conSetupCompMsg=NULLP;
   NhuRRCConSetupComplcriticalExtns *critex=NULLP;
   NhuMCC_MNC_Digit *member = NULLP;
   NhuMCC_MNC_Digit *member1 = NULLP;

   U8 noComp = 0, idx = 0;
   U8 optional = 0;

   Mem  sMem; 
   S16 ret = 0;

   Bool dbgFlag = TRUE;  /* Debug Flag */ 
   U32  fLen;      /* Length of static buffer, if applicable */
   CmPAsnErr err;  /* error to be returned back to the caller */ 

   TRC2(nhAcBuildRRCConSetupComplete_r9)

   sMem.region = 0;
   sMem.pool = 0;
   fLen = 0;

   CMXTA_ALLOCMBUF(mBuf);

   CMXTA_ALLOC_EVNT(&pdu, sizeof(NhuDatIndSdus),&sMem, NHAC_MEM_PDU_SIZE);

   conSetupCompMsg = &(pdu->sdu.m.ulDcchMsg.dcchMsg);

   NHAC_FILL_U8_U32_TKN(conSetupCompMsg->pres, TRUE, 1);
   NHAC_FILL_U8_U32_TKN(conSetupCompMsg->message.choice,TRUE, 0);
   /* To fill c1 */
   if(!(conSetupCompMsg->message.choice.val))
   {
      /* this is for Conn setup Complete */
      NHAC_FILL_U8_U32_TKN(conSetupCompMsg->message.val.c1.choice,TRUE, C1_RRCCONSETUPCOMPL);
      if(conSetupCompMsg->message.val.c1.choice.val == C1_RRCCONSETUPCOMPL)
      {
         NHAC_FILL_U8_U32_TKN(conSetupCompMsg->message.val.c1.val.rrcConSetupCompl.pres,TRUE, 1);
         /* RRC TransID */
         NHAC_FILL_U8_U32_TKN(conSetupCompMsg->message.val.c1.val.rrcConSetupCompl.rrc_TrnsxnId,TRUE, 1);

         critex = &(conSetupCompMsg->message.val.c1.val.rrcConSetupCompl.criticalExtns);

         NHAC_FILL_U8_U32_TKN(critex->choice,TRUE, 0);
         if (!(critex->choice.val))
         {
            NHAC_FILL_U8_U32_TKN(critex->val.c1.choice,TRUE, 0);
            NHAC_FILL_U8_U32_TKN(critex->val.c1.val.rrcConSetupCompl_r8.pres,TRUE, 1);
            NHAC_FILL_U8_U32_TKN(critex->val.c1.val.rrcConSetupCompl_r8.selectedPLMN_Identity,TRUE, 3);
            cmXtaXmlGetVal(NULLP, spCb->childStep, CMXTA_ATTRIB_U8, "optional",
                                 &optional);

            NHAC_FILL_U8_U32_TKN(critex->val.c1.val.rrcConSetupCompl_r8.registeredMME.pres,
                  optional, 1);
            if(optional)
            {
               /* Fill It */
               NHAC_FILL_U8_U32_TKN(critex->val.c1.val.rrcConSetupCompl_r8.registeredMME.plmn_Identity.pres,TRUE, 1);

               /* Fill MCC */
               NHAC_FILL_U8_U32_TKN(critex->val.c1.val.rrcConSetupCompl_r8.registeredMME.plmn_Identity.mcc.noComp,TRUE,
                     3);
               noComp = (U8) critex->val.c1.val.rrcConSetupCompl_r8.registeredMME.plmn_Identity.mcc.noComp.val;
               CMXTA_GET_MEM(pdu, (noComp * sizeof(NhuMCC_MNC_Digit)), &member);
               for (idx=0; idx < noComp; idx++)
               {
                  member[idx].pres = TRUE;
                  member[idx].val = 1;
               }
               critex->val.c1.val.rrcConSetupCompl_r8.registeredMME.plmn_Identity.mcc.member = member;

               /* Fill MNC */
               NHAC_FILL_U8_U32_TKN(critex->val.c1.val.rrcConSetupCompl_r8.registeredMME.plmn_Identity.mnc.noComp,TRUE,
                     3);
               noComp = (U8) critex->val.c1.val.rrcConSetupCompl_r8.registeredMME.plmn_Identity.mnc.noComp.val;
               CMXTA_GET_MEM(pdu, (noComp * sizeof(NhuMCC_MNC_Digit)), &member1);
               for (idx=0; idx < noComp; idx++)
               {
                  member1[idx].pres = TRUE;
                  member1[idx].val = 1;
               }
               critex->val.c1.val.rrcConSetupCompl_r8.registeredMME.plmn_Identity.mnc.member = member1;

               /* Bit String */
               FILL_BIT_STR(critex->val.c1.val.rrcConSetupCompl_r8.registeredMME.mmegi,16,1,pdu);
               FILL_BIT_STR(critex->val.c1.val.rrcConSetupCompl_r8.registeredMME.mmec,8,1,pdu);
            }

            /* Octet String -- 1 Octet*/
            FILL_OCT_STR(critex->val.c1.val.rrcConSetupCompl_r8.dedicatedInfoNAS,1,1,pdu);
            NHAC_FILL_U8_U32_TKN(critex->val.c1.val.rrcConSetupCompl_r8.nonCriticalExtn.pres,TRUE, 1);
         }
         else
         {
         }
      }
      else
      {
         /* Invalid message type */
      }
   }
   else
   {
      NHAC_FILL_U8_U32_TKN(conSetupCompMsg->message.val.messageClassExtn.pres,TRUE,
1);
   }

   /* Encode the message */
   ret = cmPAsnEncMsgUalign ((TknU8*)(conSetupCompMsg), CM_PASN_USE_MBUF, 
            (Void *)(*mBuf),0, nhUL_DCCH_Pdu_r9, &err, &fLen, dbgFlag, FALSE);
   if (ret != ROK) 
   {
      sprintf( pbuf,"\n PASN lib Encoding Failed!\n");
      SPrint(  pbuf  );
      CMXTA_FREEMBUF(*mBuf);
      CMXTA_FREEEVNT(pdu);
      RETVALUE(CMXTA_ERR_INT);
   } 
   else 
   {
      sprintf( pbuf,"\n PASN lib Encoding OK\n");
      SPrint(  pbuf  );
   }

   CMXTA_FREEEVNT(pdu);
   RETVALUE (CMXTA_ERR_NONE);
}


/*
 *
 *       Fun:    nhAcBuildRRCConReCfgComplete_r9
 *
 *       Desc:   Build RRC Conn. ReCfg Complete
 *
 *       Ret:    Void 
 *
 *       Notes:  None
 *
 *       File:   nhac_pjuutl.c
 *
 */

#ifdef ANSI
PUBLIC S16  nhAcBuildRRCConReCfgComplete_r9
(
 Buffer **mBuf
 )
#else
PUBLIC S16  nhAcBuildRRCConReCfgComplete_r9(mBuf)
   Buffer **mBuf;
#endif
{


   NhuDatIndSdus  *pdu;
   NhuUL_DCCH_Msg *conReCfgCompMsg=NULLP;
   NhuRRCConRecfgnComplcriticalExtns *critex=NULLP;

   Mem  sMem; 
   S16 ret = 0;

   Bool dbgFlag = TRUE;  /* Debug Flag */ 
   U32  fLen;      /* Length of static buffer, if applicable */
   CmPAsnErr err;  /* error to be returned back to the caller */ 
   U8 rrcTransIdPres=1;
   U32 rrc_transId=1;

   TRC2(nhAcBuildRRCConReCfgComplete_r9)

   sMem.region = 0;
   sMem.pool = 0;
   fLen = 0;

   cmXtaXmlGetVal(NULLP,gSpCb->childStep,CMXTA_ATTRIB_U8,"rrcTransIdPres",&rrcTransIdPres);
   cmXtaXmlGetVal(NULLP,gSpCb->childStep,CMXTA_ATTRIB_U32,"rrc_transId",&rrc_transId);

   CMXTA_ALLOCMBUF(mBuf);

   CMXTA_ALLOC_EVNT(&pdu, sizeof(NhuDatIndSdus),&sMem, NHAC_MEM_PDU_SIZE);

   conReCfgCompMsg = &(pdu->sdu.m.ulDcchMsg.dcchMsg);

   NHAC_FILL_U8_U32_TKN(conReCfgCompMsg->pres, TRUE, 1);
   NHAC_FILL_U8_U32_TKN(conReCfgCompMsg->message.choice,TRUE, 0);
   /* To fill c1 */
   if(!(conReCfgCompMsg->message.choice.val))
   {
      /* this is for Conn Recfg Complete */
      NHAC_FILL_U8_U32_TKN(conReCfgCompMsg->message.val.c1.choice,TRUE, 2);
      if(conReCfgCompMsg->message.val.c1.choice.val == 2)
      {
         NHAC_FILL_U8_U32_TKN(conReCfgCompMsg->message.val.c1.val.rrcConRecfgnCompl.pres,TRUE, 1);
         /* RRC TransID */
         if (rrcTransIdPres)
         {
            NHAC_FILL_U8_U32_TKN(conReCfgCompMsg->message.val.c1.val.rrcConRecfgnCompl.rrc_TrnsxnId,TRUE, rrc_transId);
         }
         else
         {
             NHAC_FILL_U8_U32_TKN(conReCfgCompMsg->message.val.c1.val.rrcConRecfgnCompl.rrc_TrnsxnId,FALSE, 0);
         }
         
         critex = &(conReCfgCompMsg->message.val.c1.val.rrcConRecfgnCompl.criticalExtns);
         NHAC_FILL_U8_U32_TKN(critex->choice,TRUE, 0);
         if (!(critex->choice.val))
         {
            NHAC_FILL_U8_U32_TKN(critex->val.rrcConRecfgnCompl_r8.pres,TRUE, 1);
            NHAC_FILL_U8_U32_TKN(critex->val.rrcConRecfgnCompl_r8.nonCriticalExtn.pres,TRUE, 1);
         }
         else
         {
         }
      }
      else
      {
         /* Invalid message type */
      }
   }
   else
   {
      NHAC_FILL_U8_U32_TKN(conReCfgCompMsg->message.val.messageClassExtn.pres,TRUE,
1);
   }

   /* Encode the message */
   ret = cmPAsnEncMsgUalign ((TknU8*)(conReCfgCompMsg), CM_PASN_USE_MBUF, 
            (Void *)(*mBuf), 0, nhUL_DCCH_Pdu_r9, &err, &fLen, dbgFlag, FALSE);
   if (ret != ROK) 
   {
      sprintf( pbuf,"\n PASN lib Encoding Failed!\n");
      SPrint(  pbuf  );
      CMXTA_FREEMBUF(*mBuf);
      CMXTA_FREEEVNT(pdu);
      
      RETVALUE(CMXTA_ERR_INT);
   } 
   else 
   {
      sprintf( pbuf,"\n PASN lib Encoding OK\n");
      SPrint(  pbuf  );
   }

   CMXTA_FREEEVNT(pdu);
   RETVALUE (CMXTA_ERR_NONE);
}

/*
*
*       Fun:   nhAcUtlPjuCb
*
*       Desc:  This function is used to free the Queue Element
*
*       Ret:   None
*
*       Notes: None
*
*       File:  nhac_pjuutl.c
*
*/
#ifdef ANSI
PUBLIC S16 nhAcUtlPjuCb
(
CmXtaMsgQElm *qElm
)
#else
PUBLIC S16 nhAcUtlPjuCb(qElm)
CmXtaMsgQElm *qElm;
#endif /* ANSI */
{
   NhAccMsgQElm  *rrcMsg = NULLP;

   TRC2(nhAcUtlPjuCb)

   CMXTA_DBG_PARAM((_cmxtap, "nhAcUtlPjuCb(): \n"));

   rrcMsg = (NhAccMsgQElm *)qElm->data;
   switch (qElm->pst.event)
   {
      case EVTPJUBNDREQ:
         CMXTA_FREE(rrcMsg, sizeof(NhAccMsgQElm));
         break;
      case EVTPJUUBNDREQ:
         CMXTA_FREE(rrcMsg, sizeof(NhAccMsgQElm));
         break;
      case EVTPJUDATREQ:
         CMXTA_FREE(rrcMsg, sizeof(NhAccMsgQElm));
         break;
      default:
         break;
   } /* end of switch case */

   RETVALUE(CMXTA_ERR_NONE);
} /* End of nhAcUtlPjuCb() */


/*
 *
 *       Fun:    nhAcBuildHndovrPrepTfr_r9
 *
 *       Desc:   Build RRC Security Mode Fail
 *
 *       Ret:    Void    
 *
 *       Notes:  None
 *
 *       File:   nhac_pjuutl.c
 *
 */

#ifdef ANSI
PUBLIC S16  nhAcBuildHndovrPrepTfr_r9
(
Buffer **mBuf
)
#else
PUBLIC S16  nhAcBuildHndovrPrepTfr_r9(mBuf)
Buffer **mBuf;
#endif
{
   NhuDatIndSdus        *pdu           = NULLP;
   NhuUL_DCCH_Msg       *ulDcchMsg     = NULLP;
   NhuULHovrPrepTfr_r8_IEs  *r8Ie          = NULLP;

   Mem  sMem;
   S16 ret = 0;

   Bool dbgFlag = TRUE;  /* Debug Flag */
   U32  fLen;      /* Length of static buffer, if applicable */
   CmPAsnErr err;  /* error to be returned back to the caller */

   TRC2(nhAcBuildHndovrPrepTfr_r9)

   sMem.region = 0;
   sMem.pool = 0;
   fLen = 0;

   CMXTA_ALLOCMBUF(mBuf);

   CMXTA_ALLOC_EVNT(&pdu, sizeof(NhuDatIndSdus),&sMem, NHAC_MEM_PDU_SIZE);

   ulDcchMsg = &(pdu->sdu.m.ulDcchMsg.dcchMsg);

   NHAC_FILL_U8_U32_TKN(ulDcchMsg->pres, TRUE, PRSNT_NODEF);
   NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.choice,TRUE, UL_DCCH_MSGTYP_C1);
   /* Fill c1 */
   if(ulDcchMsg->message.choice.val == UL_DCCH_MSGTYP_C1)
   {
      NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.val.c1.choice,TRUE,
                                       C1_ULHOVRPREPTFR);
      NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.val.c1.val.\
                              ulHovrPrepTfr.pres,TRUE, PRSNT_NODEF);
      /* Fill other paramters*/
      NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.val.c1.val.\
                           ulHovrPrepTfr.criticalExtns.choice, TRUE,
                           CRITICALEXTNS_C1);

      NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.val.c1.val.\
                           ulHovrPrepTfr.criticalExtns.val.c1.choice, TRUE,
                           C1_ULHOVRPREPTFR_R8);
      r8Ie = &(ulDcchMsg->message.val.c1.val.ulHovrPrepTfr\
               .criticalExtns.val.c1.val.ulHovrPrepTfr_r8);
      NHAC_FILL_U8_U32_TKN(r8Ie->pres, TRUE, PRSNT_NODEF);

      /* Fill NhuCDMA2000_Typ */
      NHAC_FILL_U8_U32_TKN(r8Ie->cdma2000_Typ, TRUE, NhuCDMA2000_Typtype1XRTTEnum);

      /* Fill NhuULHovrPrepTfr_r8_IEsmeid */
      FILL_BIT_STR(r8Ie->meid, 56, 0xF, pdu);
      /* Fill NhuDedicatedInfoCDMA2000 */
      FILL_OCT_STR(r8Ie->dedicatedInfo, 10, 0xF, pdu);
   }
   else
   {
      NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.choice,TRUE,
                                          UL_DCCH_MSGTYP_MESSAGECLASSEXTN);
      NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.val.messageClassExtn.pres,TRUE,
                                                               PRSNT_NODEF);
   }

   /* Encode the message */
   ret = cmPAsnEncMsgUalign ((TknU8*)(ulDcchMsg), CM_PASN_USE_MBUF,
            (Void *)(*mBuf),0, nhUL_DCCH_Pdu_r9, &err, &fLen, dbgFlag, FALSE);

   if (ret != ROK)
   {
      sprintf( pbuf,"\n PASN lib Encoding Failed!\n");
      SPrint(  pbuf  );
      CMXTA_FREEMBUF(*mBuf);
      CMXTA_FREEEVNT(pdu);
      RETVALUE(CMXTA_ERR_INT);
   }
   else
   {
      sprintf( pbuf,"\n PASN lib Encoding OK\n");
      SPrint(  pbuf  );
   }

   CMXTA_FREEEVNT(pdu);
   RETVALUE (CMXTA_ERR_NONE);
}

/*
 *
 *       Fun:    nhAcBuildCSFBParamCDMA2000Req_r9
 *
 *       Desc:   Build RRC Security Mode Fail
 *
 *       Ret:    Void    
 *
 *       Notes:  None
 *
 *       File:   nhac_pjuutl.c
 *
 */

#ifdef ANSI
PUBLIC S16  nhAcBuildCSFBParamCDMA2000Req_r9
(
Buffer **mBuf
)
#else
PUBLIC S16  nhAcBuildCSFBParamCDMA2000Req_r9(mBuf)
Buffer **mBuf;
#endif
{
   NhuDatIndSdus        *pdu           = NULLP;
   NhuUL_DCCH_Msg       *ulDcchMsg     = NULLP;
   NhuCSFBParamsRqstCDMA2000_r8_IEs  *r8Ie          = NULLP;

   Mem  sMem;
   S16 ret = 0;

   Bool dbgFlag = TRUE;  /* Debug Flag */
   U32  fLen;      /* Length of static buffer, if applicable */
   CmPAsnErr err;  /* error to be returned back to the caller */

   TRC2(nhAcBuildCSFBParamCDMA2000Req_r9)

   sMem.region = 0;
   sMem.pool = 0;
   fLen = 0;

   CMXTA_ALLOCMBUF(mBuf);

   CMXTA_ALLOC_EVNT(&pdu, sizeof(NhuDatIndSdus),&sMem, NHAC_MEM_PDU_SIZE);

   ulDcchMsg = &(pdu->sdu.m.ulDcchMsg.dcchMsg);

   NHAC_FILL_U8_U32_TKN(ulDcchMsg->pres, TRUE, PRSNT_NODEF);
   NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.choice,TRUE, UL_DCCH_MSGTYP_C1);
   /* Fill c1 */
   if(ulDcchMsg->message.choice.val == UL_DCCH_MSGTYP_C1)
   {
      NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.val.c1.choice,TRUE,
                                       C1_CSFBPARAMSRQSTCDMA2000);
      NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.val.c1.val.\
                              csfbParamsRqstCDMA2000.pres,TRUE, PRSNT_NODEF);
      /* Fill other paramters*/
      NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.val.c1.val.\
                           csfbParamsRqstCDMA2000.criticalExtns.choice, TRUE,
                           CRITICALEXTNS_CSFBPARAMSRSPCDMA2000_R8);
      r8Ie = &(ulDcchMsg->message.val.c1.val.csfbParamsRqstCDMA2000\
               .criticalExtns.val.csfbParamsRqstCDMA2000_r8);
      NHAC_FILL_U8_U32_TKN(r8Ie->pres, TRUE, PRSNT_NODEF);
      NHAC_FILL_U8_U32_TKN(r8Ie->nonCriticalExtn.pres, TRUE, PRSNT_NODEF);
   }
   else
   {
      NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.choice,TRUE,
                                          UL_DCCH_MSGTYP_MESSAGECLASSEXTN);
      NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.val.messageClassExtn.pres,TRUE,
                                                               PRSNT_NODEF);
   }

   /* Encode the message */
   ret = cmPAsnEncMsgUalign ((TknU8*)(ulDcchMsg), CM_PASN_USE_MBUF,
            (Void *)(*mBuf),0, nhUL_DCCH_Pdu_r9, &err, &fLen, dbgFlag, FALSE);

   if (ret != ROK)
   {
      sprintf( pbuf,"\n PASN lib Encoding Failed!\n");
      SPrint(  pbuf  );
      CMXTA_FREEMBUF(*mBuf);
      CMXTA_FREEEVNT(pdu);
      RETVALUE(CMXTA_ERR_INT);
   }
   else
   {
      sprintf( pbuf,"\n PASN lib Encoding OK\n");
      SPrint(  pbuf  );
   }

   CMXTA_FREEEVNT(pdu);
   RETVALUE (CMXTA_ERR_NONE);
}

/*
 *
 *       Fun:    nhAcBuildUeCapInfo_r9
 *
 *       Desc:   Build RRC Security Mode Fail
 *
 *       Ret:    Void    
 *
 *       Notes:  None
 *
 *       File:   nhac_pjuutl.c
 *
 */

#ifdef ANSI
PUBLIC S16  nhAcBuildUeCapInfo_r9
(
Buffer **mBuf
)
#else
PUBLIC S16  nhAcBuildUeCapInfo_r9(mBuf)
Buffer **mBuf;
#endif
{
   NhuDatIndSdus        *pdu           = NULLP;
   NhuUL_DCCH_Msg       *ulDcchMsg     = NULLP;
   NhuUECapInfo_r8_IEs  *r8Ie          = NULLP;
   NhuUE_CapRAT_Cont    *ueCapCont     = NULLP; /* Allocated in this fun */

   Mem  sMem;
   S16 ret = 0;

   Bool dbgFlag = TRUE;  /* Debug Flag */
   U32  fLen;      /* Length of static buffer, if applicable */
   CmPAsnErr err;  /* error to be returned back to the caller */

   TRC2(nhAcBuildUeCapInfo_r9)

   sMem.region = 0;
   sMem.pool = 0;
   fLen = 0;

   CMXTA_ALLOCMBUF(mBuf);

   CMXTA_ALLOC_EVNT(&pdu, sizeof(NhuDatIndSdus),&sMem, NHAC_MEM_PDU_SIZE);

   ulDcchMsg = &(pdu->sdu.m.ulDcchMsg.dcchMsg);

   NHAC_FILL_U8_U32_TKN(ulDcchMsg->pres, TRUE, PRSNT_NODEF);
   NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.choice,TRUE, UL_DCCH_MSGTYP_C1);
   /* Fill c1 */
   if(ulDcchMsg->message.choice.val == UL_DCCH_MSGTYP_C1)
   {
      NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.val.c1.choice,TRUE, C1_UECAPINFO);
      NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.val.c1.val.ueCapInfo.pres,TRUE,
                              PRSNT_NODEF);
      /* RRC TransID */
      NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.val.c1.val.ueCapInfo.rrc_TrnsxnId,
                              TRUE, 1);

      /* Fill container list*/
      NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.val.c1.val.ueCapInfo.\
            criticalExtns.choice, TRUE, CRITICALEXTNS_C1);
      NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.val.c1.val.ueCapInfo.\
            criticalExtns.val.c1.choice, TRUE, C1_UECAPINFO_R8);

      /* Fill EUTRA UE CAP */
      r8Ie = &(ulDcchMsg->message.val.c1.val.ueCapInfo.criticalExtns.val.c1.val.\
                  ueCapInfo_r8);
      NHAC_FILL_U8_U32_TKN(r8Ie->pres, TRUE, PRSNT_NODEF);
      NHAC_FILL_U8_U32_TKN(r8Ie->ue_CapRAT_ContLst.noComp, TRUE, 1);
      CMXTA_GET_MEM(pdu, sizeof(NhuUE_CapRAT_Cont), &(ueCapCont));
      if(NULLP == ueCapCont)
      {
         CMXTA_DBG_FATAL((_cmxtap, "nhAcBuildUeCapInfo_r9(): can't allocate mem\n"));
         CMXTA_FREEEVNT(pdu);
         RETVALUE(CMXTA_ERR_FATAL);
      }

      /* FIll Container Octate string */
      NHAC_FILL_U8_U32_TKN(ueCapCont->pres, TRUE, PRSNT_NODEF);
      NHAC_FILL_U8_U32_TKN(ueCapCont->rat_Typ, TRUE, NhuRAT_TypeutraEnum);
      FILL_OCT_STR(ueCapCont->ueCapRAT_Cont, 10, 1, pdu);

      /* Fill memeber of container list */
      r8Ie->ue_CapRAT_ContLst.member = ueCapCont;
   }
   else
   {
      NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.choice,TRUE,
                                          UL_DCCH_MSGTYP_MESSAGECLASSEXTN);
      NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.val.messageClassExtn.pres,TRUE,
                                                               PRSNT_NODEF);
   }

   /* Encode the message */
   ret = cmPAsnEncMsgUalign ((TknU8*)(ulDcchMsg), CM_PASN_USE_MBUF,
            (Void *)(*mBuf),0, nhUL_DCCH_Pdu_r9, &err, &fLen, dbgFlag, FALSE);

   if (ret != ROK)
   {
      sprintf( pbuf,"\n PASN lib Encoding Failed!\n");
      SPrint(  pbuf  );
      CMXTA_FREEMBUF(*mBuf);
      CMXTA_FREEEVNT(pdu);
      RETVALUE(CMXTA_ERR_INT);
   }
   else
   {
      sprintf( pbuf,"\n PASN lib Encoding OK\n");
      SPrint(  pbuf  );
   }

   CMXTA_FREEEVNT(pdu);
   RETVALUE (CMXTA_ERR_NONE);
}

/*
 *
 *       Fun:    nhAcBuildUeCapInfo_r9
 *
 *       Desc:   Build RRC Security Mode Fail
 *
 *       Ret:    Void    
 *
 *       Notes:  None
 *
 *       File:   nhac_pjuutl.c
 *
 */

#ifdef ANSI
PUBLIC S16  nhAcUtlPjuFillForDecodeFail
(
Buffer **mBuf
)
#else
PUBLIC S16  nhAcUtlPjuFillForDecodeFail(mBuf)
Buffer **mBuf;
#endif
{
   NhuDatIndSdus        *pdu           = NULLP;
   NhuUL_DCCH_Msg       *ulDcchMsg     = NULLP;
   NhuUECapInfo_r8_IEs  *r8Ie          = NULLP;
   NhuUE_CapRAT_Cont    *ueCapCont     = NULLP; /* Allocated in this fun */

   Mem  sMem;
   S16 ret = 0;

   Bool dbgFlag = TRUE;  /* Debug Flag */
   U32  fLen;      /* Length of static buffer, if applicable */
   CmPAsnErr err;  /* error to be returned back to the caller */

   TRC2(nhAcUtlPjuFillForDecodeFail)

   sMem.region = 0;
   sMem.pool = 0;
   fLen = 0;

   CMXTA_ALLOCMBUF(mBuf);

   CMXTA_ALLOC_EVNT(&pdu, sizeof(NhuDatIndSdus),&sMem, NHAC_MEM_PDU_SIZE);

   ulDcchMsg = &(pdu->sdu.m.ulDcchMsg.dcchMsg);

   NHAC_FILL_U8_U32_TKN(ulDcchMsg->pres, TRUE, PRSNT_NODEF);
   NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.choice,TRUE, UL_DCCH_MSGTYP_C1);
   /* Fill c1 */
   if(ulDcchMsg->message.choice.val == UL_DCCH_MSGTYP_C1)
   {
      NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.val.c1.choice,TRUE, C1_UECAPINFO);
      NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.val.c1.val.ueCapInfo.pres,TRUE,
                              PRSNT_NODEF);
      /* RRC TransID */
      NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.val.c1.val.ueCapInfo.rrc_TrnsxnId,
                              TRUE, 1);

      /* Fill container list*/
      NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.val.c1.val.ueCapInfo.\
            criticalExtns.choice, TRUE, CRITICALEXTNS_C1);
      NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.val.c1.val.ueCapInfo.\
            criticalExtns.val.c1.choice, TRUE, C1_UECAPINFO_R8);

      /* Fill EUTRA UE CAP */
      r8Ie = &(ulDcchMsg->message.val.c1.val.ueCapInfo.criticalExtns.val.c1.val.\
                  ueCapInfo_r8);
      /* Skipp filling follwoing elements inoder to make decode failure */
      /*      NHAC_FILL_U8_U32_TKN(r8Ie->pres, TRUE, PRSNT_NODEF);  
      NHAC_FILL_U8_U32_TKN(r8Ie->ue_CapRAT_ContLst.noComp, TRUE, 1); */

      CMXTA_GET_MEM(pdu, sizeof(NhuUE_CapRAT_Cont), &(ueCapCont));
      if(NULLP == ueCapCont)
      {
         CMXTA_DBG_FATAL((_cmxtap, "nhAcBuildUeCapInfo_r9(): can't allocate mem\n"));
         CMXTA_FREEEVNT(pdu);
         RETVALUE(CMXTA_ERR_FATAL);
      }

      /* FIll Container Octate string */
      NHAC_FILL_U8_U32_TKN(ueCapCont->pres, TRUE, PRSNT_NODEF);
      NHAC_FILL_U8_U32_TKN(ueCapCont->rat_Typ, TRUE, NhuRAT_TypeutraEnum);
      FILL_OCT_STR(ueCapCont->ueCapRAT_Cont, 100, 1, pdu);

      /* Fill memeber of container list */
      r8Ie->ue_CapRAT_ContLst.member = ueCapCont;
   }
   else
   {
      NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.choice,TRUE,
                                          UL_DCCH_MSGTYP_MESSAGECLASSEXTN);
      NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.val.messageClassExtn.pres,TRUE,
                                                               PRSNT_NODEF);
   }

   /* Encode the message */
   ret = cmPAsnEncMsgUalign ((TknU8*)(ulDcchMsg), CM_PASN_USE_MBUF,
            (Void *)(*mBuf),0, nhUL_DCCH_Pdu_r9, &err, &fLen, dbgFlag, TRUE);

      sprintf( pbuf,"\n PASN lib Encoding OK\n");
      SPrint(  pbuf  );

   CMXTA_FREEEVNT(pdu);
   RETVALUE (CMXTA_ERR_NONE);
}

#ifdef LTERRC_REL9
/******************************************************************************/
/*PAWAN*/
/*
 *
 *       Fun:    nhAcBuildUeInfoResp_r9
 *
 *       Desc:  To build the UE Informaion Response R9 
 *
 *       Ret:    Void    
 *
 *       Notes:  None
 *
 *       File:   nhac_pjuutl.c
 *
 */

#ifdef ANSI
PUBLIC S16  nhAcBuildUeInfoResp_r9
(
Buffer **mBuf,
CmXtaTCCb    *tcCb,
CmXtaSpCb    *spCb
)
#else
PUBLIC S16  nhAcBuildUeInfoResp_r9(mBuf, tcCb, spCb)
Buffer **mBuf;
CmXtaTCCb    *tcCb;
CmXtaSpCb    *spCb;
#endif
{
   NhuDatIndSdus        *pdu           = NULLP;
   NhuUL_DCCH_Msg       *ulDcchMsg     = NULLP;
   /*NhuUEInfoRsp_r9criticalExtnsc1 *critExtnsC1 = NULLP;   */
   NhuUEInfoRsp_r9_IEs  *r9IE = NULLP;
   NhuRLF_Report_r9     *rlfRpt = NULLP;
   NhuUEInfoRsp_v930_IEs *nce = NULLP;

   NhuMeasResultLst2EUTRA_r9    *lastEUTRA;

   NhuMCC *mccPtr;
   NhuMNC *mncPtr;
   NhuMCC_MNC_Digit *member = NULLP;
     
   U32  numComp =1;
   U8   idx; 
   U8   idx1,idx2,idx3; 
   Mem  sMem;
   U32  fLen;      /* Length of static buffer, if applicable */
   CmPAsnErr err;  /* error to be returned back to the caller */
   S16 ret = 0;
   Bool dbgFlag = TRUE;  /* Debug Flag */

   TRC2(nhAcBuildUeInfoResp_r9);
   sMem.region = 0;
   sMem.pool = 0;
   fLen = 0;
   
   CMXTA_ALLOCMBUF(mBuf);

   CMXTA_ALLOC_EVNT(&pdu, sizeof(NhuDatIndSdus),&sMem, NHAC_MEM_PDU_SIZE);

   ulDcchMsg = &(pdu->sdu.m.ulDcchMsg.dcchMsg);

   NHAC_FILL_U8_U32_TKN(ulDcchMsg->pres, TRUE, PRSNT_NODEF);
   NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.choice,TRUE, UL_DCCH_MSGTYP_C1);

   /* Fill c1 */
   if(ulDcchMsg->message.choice.val == UL_DCCH_MSGTYP_C1)
   {
      NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.val.c1.choice,TRUE,
                                       C1_UEINFORSP_R9__2);

      /* Step 1: Fill Present field */
      NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.val.c1.val.\
                              ueInfoRsp_r9.pres,TRUE, PRSNT_NODEF);

      /*Step 2: Fill Transaction Id */
      NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.val.c1.val.ueInfoRsp_r9.\
                                      rrc_TrnsxnId, TRUE, 1);

      /*Step 3: Set the choice of critical extension 1*/
       NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.val.c1.val.ueInfoRsp_r9.\
                criticalExtns.choice, TRUE, CRITICALEXTNS_C1);
       
      /*Step 4: TODO:MP: set the critical extention c1 */
       NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.val.c1.val.ueInfoRsp_r9.\
                criticalExtns.val.c1.choice, TRUE, C1_UEINFORSP_R9__28);
                
      /*Step 4: Set the choice of critical extension 2*/
    /*   NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.val.c1.val.ueInfoRsp_r9.\
                criticalExtns.choice, TRUE, C29_UEINFORSP_R9);*/

       r9IE = &(ulDcchMsg->message.val.c1.val.ueInfoRsp_r9.criticalExtns.\
                       val.c1.val.ueInfoRsp_r9);
        
       /*Step 5: Fill the token present */
        NHAC_FILL_U8_U32_TKN(r9IE->pres, TRUE, PRSNT_NODEF);
      
       /*Step 6: Fill rachReport */
        NHAC_FILL_U8_U32_TKN(r9IE->rach_Report_r9.pres, TRUE, PRSNT_NODEF);
        
       /*Step 6.1: Fill numberOfPreamblesSent_r9 */
       /*Setting it to zero*/
       /*TODO:MP:Setting number preamble to one since range is 1 to 200*/
       NHAC_FILL_U8_U32_TKN(r9IE->rach_Report_r9.numberOfPreamblesSent_r9,TRUE,1); 
 
       /*Step 6.2: Fill contentionDetected_r9 */
       /*Setting it to zero*/
       NHAC_FILL_U8_U32_TKN(r9IE->rach_Report_r9.contentionDetected_r9,TRUE,0);

       /*Step 7: Fill rlfReport */
       rlfRpt = &(r9IE->rlfReport_r9);

       /*Step 7.1: Fill  pres*/
        NHAC_FILL_U8_U32_TKN(rlfRpt->pres, TRUE, PRSNT_NODEF);

       /*Step 7.2: Fill  measResultLastServCell_r9 */
        
       /*Step 7.2.1: Fill present filed */
        NHAC_FILL_U8_U32_TKN(rlfRpt->measResultLastServCell_r9.pres, TRUE, PRSNT_NODEF);

       /*Step 7.2.2: Fill rsrpResult_r9 filed */
        NHAC_FILL_U8_U32_TKN(rlfRpt->measResultLastServCell_r9.rsrpResult_r9, TRUE, PRSNT_NODEF);

       /*Step 7.2.3: Fill rsrqResult_r9 filed */
        NHAC_FILL_U8_U32_TKN(rlfRpt->measResultLastServCell_r9.rsrqResult_r9, TRUE, PRSNT_NODEF);
                
       
       /*Step 7.3: Fill measResultNeighCells_r9 */ 
        NHAC_FILL_U8_U32_TKN(rlfRpt->measResultNeighCells_r9.pres,TRUE,MEASOBJECT_MEASOBJECTEUTRA);
       
       /*Step 7.3.1: Fill  Last-EUTRA */
        lastEUTRA = &(rlfRpt->measResultNeighCells_r9.measResultLstEUTRA_r9);
  
        /* Setting the number of components to be 1. */
        NHAC_FILL_U8_U32_TKN(lastEUTRA->noComp,TRUE,numComp);
        CMXTA_GET_MEM(pdu, (numComp * sizeof(NhuMeasResult2EUTRA_r9)),
                            &lastEUTRA->member);
        /*Step 7.3.1.1: Set the present field */
        NHAC_FILL_U8_U32_TKN(lastEUTRA->member->pres, TRUE, PRSNT_NODEF);
        
        /*Step 7.3.1.2: Set the carrierFreq_r9 field */
        NHAC_FILL_U8_U32_TKN(lastEUTRA->member->carrierFreq_r9, TRUE, PRSNT_NODEF);
        
        /*Step 7.3.1.2: Set the measResultLst_r9 field */
        /* Setting the number of components to be 1. */

        NHAC_FILL_U8_U32_TKN(lastEUTRA->member->measResultLst_r9.noComp,TRUE,1);
        CMXTA_GET_MEM(pdu, (1 * sizeof(NhuMeasResultEUTRA)),
                                          &lastEUTRA->member->measResultLst_r9.member);
        
        /*Step 7.3.1.2.1: Set the pres field*/
        /*TODO:MP: Setting of pres field of NhuMeasResultEUTRA is corrected*/ 
         NHAC_FILL_U8_U32_TKN(lastEUTRA->member->measResultLst_r9.member->pres, TRUE, PRSNT_NODEF);

        /*Step 7.3.1.2.2: Set the physCellId field*/
         NHAC_FILL_U8_U32_TKN(lastEUTRA->member->measResultLst_r9.member->physCellId, 
                              TRUE, PRSNT_NODEF);

        /*Step 7.3.1.2.3: Set the cgi_Info field*/
        /*Step 7.3.1.2.3.1: Set the pres field*/
         NHAC_FILL_U8_U32_TKN(lastEUTRA->member->measResultLst_r9.member->cgi_Info.pres, 
                              TRUE, PRSNT_NODEF);

        /*Step 7.3.1.2.3.2: Set the cellGlobalId field*/
        /*Step 7.3.1.2.3.2.1: Set the pres field*/
         NHAC_FILL_U8_U32_TKN(lastEUTRA->member->measResultLst_r9.member->cgi_Info.cellGlobalId.pres,
                              TRUE, PRSNT_NODEF);
        
         /*Step 7.3.1.2.3.2.1: Set the plmn_Identity field*/
         /*Step 7.3.1.2.3.2.1.1: Set the pres field*/
         NHAC_FILL_U8_U32_TKN(lastEUTRA->member->measResultLst_r9.member->cgi_Info.cellGlobalId.plmn_Identity.pres,
                              TRUE, PRSNT_NODEF);

         /*Step 7.3.1.2.3.2.1.2: Set the mcc field*/
         /*Step 7.3.1.2.3.2.1.2.1: Set the noComp field to 1 */
          mccPtr = &(lastEUTRA->member->measResultLst_r9.member->cgi_Info.cellGlobalId.plmn_Identity.mcc);
          numComp = 3;
          NHAC_FILL_U8_U32_TKN(mccPtr->noComp,TRUE,numComp);

          /*Step 7.3.1.2.3.2.1.2.1: Set the member field to 1 */
          CMXTA_GET_MEM(pdu, (numComp * sizeof(NhuMCC_MNC_Digit)),&mccPtr->member);
          /*TODO:MP: memory allocation for member is added*/
          CMXTA_GET_MEM(pdu, (numComp * sizeof(NhuMCC_MNC_Digit)),&member);
          
          for(idx=0;idx<numComp;idx++)
          {
               member[idx].pres = TRUE;
               member[idx].val =1;
          }
          mccPtr->member = member;
          
         /*Step 7.3.1.2.3.2.1.3: Set the mnc field*/
          mncPtr = &(lastEUTRA->member->measResultLst_r9.member->cgi_Info.cellGlobalId.plmn_Identity.mnc);

          numComp = 2;
         /*Step 7.3.1.2.3.2.1.3.1: Set the member field to 1 */
          NHAC_FILL_U8_U32_TKN(mncPtr->noComp,TRUE,numComp);
          CMXTA_GET_MEM(pdu, (numComp * sizeof(NhuMCC_MNC_Digit)),&member);
          for(idx1=0;idx1<numComp;idx1++)
          {
               member[idx1].pres = TRUE;
               member[idx1].val =1;
          }
          mncPtr->member = member;

         /*Step 7.3.1.2.3.2.2: Set the cellIdentity field*//*Check the last argument Pawan*/
          FILL_BIT_STR((lastEUTRA->member->measResultLst_r9.member->cgi_Info.cellGlobalId.cellIdentity),28,1,pdu);

         /*Step 7.3.1.2.3.3: Set the trackingAreaCode field*//*Check the last argument Pawan*/
          FILL_BIT_STR(lastEUTRA->member->measResultLst_r9.member->cgi_Info.trackingAreaCode,16,1,pdu);

         /*Step 7.3.1.2.3.4: Set the plmn_IdentityLst field*/
         /*Step 7.3.1.2.3.4.1: Set the number of components*/
          NHAC_FILL_U8_U32_TKN(
          lastEUTRA->member->measResultLst_r9.member->cgi_Info.plmn_IdentityLst.noComp,
          TRUE,1);
         
          /*Step 7.3.1.2.3.4.2: Get the memory for member*/
          CMXTA_GET_MEM(pdu, (1 * sizeof(NhuPLMN_Identity)),
                       &(lastEUTRA->member->measResultLst_r9.member->cgi_Info.plmn_IdentityLst.member));
          
          /*Step 7.3.1.2.3.4.2.1: Set the present field*/
           NHAC_FILL_U8_U32_TKN(
           lastEUTRA->member->measResultLst_r9.member->cgi_Info.plmn_IdentityLst.member->pres,
           TRUE, PRSNT_NODEF);


          /*Step 7.3.1.2.3.4.2.2: Set the mcc field*/
           mccPtr = &(lastEUTRA->member->measResultLst_r9.member->cgi_Info.plmn_IdentityLst.member->mcc);
           numComp = 3;
           NHAC_FILL_U8_U32_TKN(mccPtr->noComp,TRUE,numComp);
           CMXTA_GET_MEM(pdu, (numComp * sizeof(NhuMCC_MNC_Digit)),&member);
           for(idx2=0;idx2<numComp;idx2++)
           { 
               member[idx2].pres = TRUE;
               member[idx2].val =1;
           }
           mccPtr->member = member;

           /*Step 7.3.1.2.3.4.2.3: Set the mnc field*/
           mncPtr = &(lastEUTRA->member->measResultLst_r9.member->cgi_Info.plmn_IdentityLst.member->mnc);
           /*Step 7.3.1.2.3.4.4.2.2: Set the member field to 1 */
           numComp = 2;
           NHAC_FILL_U8_U32_TKN(mncPtr->noComp,TRUE,numComp);
           CMXTA_GET_MEM(pdu, (numComp * sizeof(NhuMCC_MNC_Digit)),&mncPtr->member);
           for(idx3=0;idx3<numComp;idx3++)
           { 
               member[idx3].pres = TRUE;
               member[idx3].val =1;
           }
           mncPtr->member = member;


          /*Step 7.3.1.2.4: Set the measResult field */

          /*Step 7.3.1.2.4.1: Set the present field */
           NHAC_FILL_U8_U32_TKN(lastEUTRA->member->measResultLst_r9.member->measResult.pres,
           TRUE, PRSNT_NODEF);

          /*Step 7.3.1.2.4.2: Set the rsrpResult field */
           NHAC_FILL_U8_U32_TKN(lastEUTRA->member->measResultLst_r9.member->measResult.rsrpResult,
           TRUE, PRSNT_NODEF);

          /*Step 7.3.1.2.4.3: Set the rsrqResult field */
           NHAC_FILL_U8_U32_TKN(lastEUTRA->member->measResultLst_r9.member->measResult.rsrqResult,
            TRUE, PRSNT_NODEF);

          /*Step 7.3.1.2.4.4: Set the extaddgrp_r9 field */
          /*Step 7.3.1.2.4.4.1: Set the pres field */
#if 0
           NHAC_FILL_U8_U32_TKN(lastEUTRA->member->measResultLst_r9.member->measResult.extaddgrp_r9.pres,
           TRUE, PRSNT_NODEF);

          /*Step 7.3.1.2.4.4.2: Set the additionalSI_Info_r9 field */
          /*Step 7.3.1.2.4.4.2.1: Set the present field */
          /*TODO:MP:Verify why decoding is getting failed. additionalSI_Info_r9.pres
           *is made false since the decoding of csg_Identity_r9
            is getting failed*/
           NHAC_FILL_U8_U32_TKN(lastEUTRA->member->measResultLst_r9.member->measResult.\
                                extaddgrp_r9.additionalSI_Info_r9.pres, TRUE, PRSNT_NODEF);
 
 #if 1
          /*Step 7.3.1.2.4.4.2.2: Set the csg_MemberStatus_r9 field */
          /*TODO:MP: enum value is assigned in the value of csg_MemberStatus_r9*/ 
           NHAC_FILL_U8_U32_TKN(lastEUTRA->member->measResultLst_r9.member->measResult.extaddgrp_r9.\
                                additionalSI_Info_r9.csg_MemberStatus_r9,TRUE, 
                                NhuAdditionalSI_Info_r9csg_MemberStatus_r9memberEnum);

          /*Step 7.3.1.2.4.4.2.3: Set the csg_Identity_r9 field *//*Check the last argument Pawan*/
          FILL_BIT_STR((lastEUTRA->member->measResultLst_r9.member->measResult.extaddgrp_r9.\
                        additionalSI_Info_r9.csg_Identity_r9),27,1,pdu);
#endif
#endif
#if 1
           NHAC_FILL_U8_U32_TKN(lastEUTRA->member->measResultLst_r9.member->measResult.extaddgrp_r9.pres,
           TRUE, PRSNT_NODEF);

          /*Step 7.3.1.2.4.4.2: Set the additionalSI_Info_r9 field */
          /*Step 7.3.1.2.4.4.2.1: Set the present field */
          /*TODO:MP:Verify why decoding is getting failed. additionalSI_Info_r9.pres
           *is made false since the decoding of csg_Identity_r9
            is getting failed*/
           NHAC_FILL_U8_U32_TKN(lastEUTRA->member->measResultLst_r9.member->measResult.\
                                extaddgrp_r9.additionalSI_Info_r9.pres, TRUE, PRSNT_NODEF);
 
 #if 1
          /*Step 7.3.1.2.4.4.2.2: Set the csg_MemberStatus_r9 field */
          /*TODO:MP: enum value is assigned in the value of csg_MemberStatus_r9*/ 
           NHAC_FILL_U8_U32_TKN(lastEUTRA->member->measResultLst_r9.member->measResult.extaddgrp_r9.\
                                additionalSI_Info_r9.csg_MemberStatus_r9,TRUE, 
                                NhuAdditionalSI_Info_r9csg_MemberStatus_r9memberEnum);

          /*Step 7.3.1.2.4.4.2.3: Set the csg_Identity_r9 field *//*Check the last argument Pawan*/
          FILL_BIT_STR((lastEUTRA->member->measResultLst_r9.member->measResult.extaddgrp_r9.\
                        additionalSI_Info_r9.csg_Identity_r9),27,1,pdu);
#endif
#endif
          /*Step 8: Fill nonCritical Extn */
          nce = &(r9IE->nonCriticalExtn);
          
          /*Step 8.1: Fill present field */
         NHAC_FILL_U8_U32_TKN(nce->pres, FALSE, NOTPRSNT);

   }
   else
   {
      NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.choice,TRUE,
                                          UL_DCCH_MSGTYP_MESSAGECLASSEXTN);
      NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.val.messageClassExtn.pres,TRUE,
                                                               PRSNT_NODEF);
   }

   /* Encode the message */
   ret = cmPAsnEncMsgUalign ((TknU8*)(ulDcchMsg), CM_PASN_USE_MBUF,
            (Void *)(*mBuf),0, nhUL_DCCH_Pdu_r9, &err, &fLen, dbgFlag, TRUE);

    if (ret != ROK)
   {
      sprintf( pbuf,"\n PASN lib Encoding Failed!\n");
      SPrint(  pbuf  );
      CMXTA_FREEMBUF(*mBuf);
      CMXTA_FREEEVNT(pdu);
      RETVALUE(CMXTA_ERR_INT);
   }
   
   sprintf( pbuf,"\n PASN lib Encoding OK\n");
   SPrint(  pbuf  );

   CMXTA_FREEEVNT(pdu);
   RETVALUE (CMXTA_ERR_NONE);
}

/******************************************************************************/

/******************************************************************************/
/*PAWAN*/
/*
 *
 *       Fun:    nhAcBuildProximityInd_r9
 *
 *       Desc:  To build the Proximity Indication R9 
 *
 *       Ret:    Void    
 *
 *       Notes:  None
 *
 *       File:   nhac_pjuutl.c
 *
 */
#ifdef ANSI
PUBLIC S16  nhAcBuildProximityInd_r9
(
Buffer **mBuf,
CmXtaTCCb    *tcCb,
CmXtaSpCb    *spCb
)
#else
PUBLIC S16  nhAcBuildProximityInd_r9(mBuf, tcCb, spCb)
Buffer **mBuf;
CmXtaTCCb    *tcCb;
CmXtaSpCb    *spCb;
#endif
{
   NhuDatIndSdus        *pdu           = NULLP;
   NhuUL_DCCH_Msg       *ulDcchMsg     = NULLP;
   NhuProximityInd_r9_IEs  *r9Ie       = NULLP; 
   
   Bool dbgFlag = TRUE;  /* Debug Flag */
   U32  fLen;      /* Length of static buffer, if applicable */
   CmPAsnErr err;  /* error to be returned back to the caller */
   Mem  sMem;
   S16 ret = 0;

   TRC2(nhAcBuildProximityInd_r9)

   /*TODO:MP: region and pool are initialized */
   sMem.region = 0;
   sMem.pool = 0;
   fLen = 0;
   CMXTA_ALLOCMBUF(mBuf);

   CMXTA_ALLOC_EVNT(&pdu, sizeof(NhuDatIndSdus),&sMem, NHAC_MEM_PDU_SIZE);

   ulDcchMsg = &(pdu->sdu.m.ulDcchMsg.dcchMsg);

   NHAC_FILL_U8_U32_TKN(ulDcchMsg->pres, TRUE, PRSNT_NODEF);
   NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.choice,TRUE, UL_DCCH_MSGTYP_C1);
    /* Fill c1 */
   if(ulDcchMsg->message.choice.val == UL_DCCH_MSGTYP_C1)
   {
     NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.val.c1.choice,TRUE,
                                       C1_PROXIMITYIND_R9__2);
     NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.val.c1.val.\
                              proximityInd_r9.pres,TRUE, PRSNT_NODEF);

      NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.val.c1.val.proximityInd_r9.\
                criticalExtns.choice, TRUE, CRITICALEXTNS_C1);
      NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.val.c1.val.proximityInd_r9.\
                  criticalExtns.val.c1.choice, TRUE, C1_PROXIMITYIND_R9__14);
      r9Ie = &(ulDcchMsg->message.val.c1.val.proximityInd_r9.criticalExtns.\
             val.c1.val.proximityInd_r9);

      /*Step 1: Fill present field */
      NHAC_FILL_U8_U32_TKN(r9Ie->pres,TRUE,PRSNT_NODEF);

      /*Step 2: Fill type_r9 field */
      NHAC_FILL_U8_U32_TKN(r9Ie->type_r9,TRUE,PRSNT_NODEF);

      /*Step 3: Fill carrierFreq_r9 field */
      /*Step 3.1: Fill choice field */
      NHAC_FILL_U8_U32_TKN(r9Ie->carrierFreq_r9.choice,TRUE,CARRIERFREQ_R9_EUTRA_R9);

      /*Step 3.1: Fill eutra_r9 field */ 
      NHAC_FILL_U8_U32_TKN(r9Ie->carrierFreq_r9.val.eutra_r9,TRUE,PRSNT_NODEF); 

      /*Step 4: Fill nonCriticalExtn field */
      /*Step 4.1: Fill pres field */
      NHAC_FILL_U8_U32_TKN(r9Ie->nonCriticalExtn.pres,TRUE,PRSNT_NODEF);

      /*Step 4.2: Fill latenoncriticalextn field */
      FILL_OCT_STR(r9Ie->nonCriticalExtn.lateNonCriticalExtn,4,1,pdu); 
      /*Step 4.3: Fill noncriticalextn field */
      NHAC_FILL_U8_U32_TKN(r9Ie->nonCriticalExtn.nonCriticalExtn.pres,FALSE,NOTPRSNT);

   }
   else
   {
      NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.choice,TRUE,
                                          UL_DCCH_MSGTYP_MESSAGECLASSEXTN);
      NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.val.messageClassExtn.pres,TRUE,
                                                               PRSNT_NODEF);
   }
   /* Encode the message */
   ret = cmPAsnEncMsgUalign ((TknU8*)(ulDcchMsg), CM_PASN_USE_MBUF,
            (Void *)(*mBuf),0, nhUL_DCCH_Pdu_r9, &err, &fLen, dbgFlag, FALSE);

   if (ret != ROK)
   {
      sprintf( pbuf,"\n PASN lib Encoding Failed!\n");
      SPrint(  pbuf  );
      CMXTA_FREEMBUF(*mBuf);
      CMXTA_FREEEVNT(pdu);
      RETVALUE(CMXTA_ERR_INT);
   }
   else
   {
      sprintf( pbuf,"\n PASN lib Encoding OK\n");
      SPrint(  pbuf  );
   }

   CMXTA_FREEEVNT(pdu);
   RETVALUE (CMXTA_ERR_NONE);
}
#endif /*LTERRC_REL9*/
/******************************************************************************/
/*
 *
 *       Fun:    nhAcBuildCountChkResp_r9
 *
 *       Desc:   Build RRC Security Mode Fail
 *
 *       Ret:    Void    
 *
 *       Notes:  None
 *
 *       File:   nhac_pjuutl.c
 *
 */

#ifdef ANSI
PUBLIC S16  nhAcBuildCountChkResp_r9
(
Buffer **mBuf,
CmXtaTCCb    *tcCb,
CmXtaSpCb    *spCb
)
#else
PUBLIC S16  nhAcBuildCountChkResp_r9(mBuf, tcCb, spCb)
Buffer **mBuf;
CmXtaTCCb    *tcCb;
CmXtaSpCb    *spCb;
#endif
{
   NhuDatIndSdus        *pdu           = NULLP;
   NhuUL_DCCH_Msg       *ulDcchMsg     = NULLP;
   NhuCounterCheckRsp_r8_IEs  *r8Ie    = NULLP;
   U8                   idx;
   U16                  len;
   U8                   drbIds[12];
   U8                   numOfDrbs;
   Txt                  frstWrd[3];
   Txt                  msgStr[100];

   Mem  sMem;
   S16 ret = 0;

   Bool dbgFlag = TRUE;  /* Debug Flag */
   U32  fLen;      /* Length of static buffer, if applicable */
   CmPAsnErr err;  /* error to be returned back to the caller */

   TRC2(nhAcBuildCountChkResp_r9)

   sMem.region = 0;
   sMem.pool = 0;
   fLen = 0;

   CMXTA_ALLOCMBUF(mBuf);

   CMXTA_ALLOC_EVNT(&pdu, sizeof(NhuDatIndSdus),&sMem, NHAC_MEM_PDU_SIZE);

   ulDcchMsg = &(pdu->sdu.m.ulDcchMsg.dcchMsg);

   NHAC_FILL_U8_U32_TKN(ulDcchMsg->pres, TRUE, PRSNT_NODEF);
   NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.choice,TRUE, UL_DCCH_MSGTYP_C1);

   /* Fill c1 */
   if(ulDcchMsg->message.choice.val == UL_DCCH_MSGTYP_C1)
   {
      NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.val.c1.choice,TRUE,
                                       C1_COUNTERCHECKRSP);
      NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.val.c1.val.\
                              counterCheckRsp.pres,TRUE, PRSNT_NODEF);
      /* Fill rrc_TrnsxnId */
      NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.val.c1.val.counterCheckRsp.\
                                      rrc_TrnsxnId, TRUE, 1);
      NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.val.c1.val.counterCheckRsp.\
                criticalExtns.choice, TRUE, CRITICALEXTNS_COUNTERCHECKRSP_R8);
      r8Ie = &(ulDcchMsg->message.val.c1.val.counterCheckRsp.criticalExtns.\
                  val.counterCheckRsp_r8);

      NHAC_FILL_U8_U32_TKN(r8Ie->pres, TRUE, PRSNT_NODEF);

      /* By default set number of DRBs to 1 */
      cmXtaXmlGetVal(NULLP, spCb->childStep, CMXTA_ATTRIB_TXT, "drbIdStr",&msgStr);
      len = 0;
      numOfDrbs = 0;
      while(len <= strlen(msgStr))
      {
         CMXTA_ZERO(frstWrd, sizeof(frstWrd));
         nhAcCpjUtlStrToken(&msgStr[len], frstWrd, ',');
         len = len + strlen(frstWrd) + 1;
         drbIds[numOfDrbs] = atoi(frstWrd);
         numOfDrbs++;
      }

      if (numOfDrbs == 0)
      {
         CMXTA_DBG_ERR((_cmxtap,"nhAcBuildCountChkResp_r9(): No drb IDs found\n"));
         RETVALUE(CMXTA_ERR_INT);
      }


      NHAC_FILL_U8_U32_TKN(r8Ie->drb_CountInfoLst.noComp, TRUE, numOfDrbs);
      CMXTA_GET_MEM(pdu, (numOfDrbs * sizeof(NhuDRB_CountInfo)),
                                          &r8Ie->drb_CountInfoLst.member);
      if (NULLP == &r8Ie->drb_CountInfoLst.member)
      {
         CMXTA_DBG_FATAL((_cmxtap, "nhAcBuildCountChkResp_r9(): can't allocate mem\n"));
         CMXTA_FREEEVNT(pdu);
         RETVALUE(CMXTA_ERR_FATAL);
      }
      for (idx = 0; idx < numOfDrbs; idx++)
      {
         NHAC_FILL_U8_U32_TKN(r8Ie->drb_CountInfoLst.member[idx].pres,
                  TRUE, PRSNT_NODEF);

         /* Use idx to fill DRB Id */
         NHAC_FILL_U8_U32_TKN(r8Ie->drb_CountInfoLst.member[idx].drb_Identity,
                  TRUE, drbIds[idx]);

         /* Fill ULcount with some arbitrary value */
         NHAC_FILL_U8_U32_TKN(r8Ie->drb_CountInfoLst.member[idx].count_Ulnk,
                  TRUE, 10 * idx);

         /* Fill DLcount with some arbitrary value */
         NHAC_FILL_U8_U32_TKN(r8Ie->drb_CountInfoLst.member[idx].count_Dlnk,
                  TRUE, 30 * idx);
      }
   }
   else
   {
      NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.choice,TRUE,
                                          UL_DCCH_MSGTYP_MESSAGECLASSEXTN);
      NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.val.messageClassExtn.pres,TRUE,
                                                               PRSNT_NODEF);
   }

   /* Encode the message */
   ret = cmPAsnEncMsgUalign ((TknU8*)(ulDcchMsg), CM_PASN_USE_MBUF,
            (Void *)(*mBuf),0, nhUL_DCCH_Pdu_r9, &err, &fLen, dbgFlag, FALSE);

   if (ret != ROK)
   {
      sprintf( pbuf,"\n PASN lib Encoding Failed!\n");
      SPrint(  pbuf  );
      CMXTA_FREEMBUF(*mBuf);
      CMXTA_FREEEVNT(pdu);
      RETVALUE(CMXTA_ERR_INT);
   }
   else
   {
      sprintf( pbuf,"\n PASN lib Encoding OK\n");
      SPrint(  pbuf  );
   }

   CMXTA_FREEEVNT(pdu);
   RETVALUE (CMXTA_ERR_NONE);
}

/*
 *
 *       Fun:    nhAcBuildMeasRpt_r9
 *
 *       Desc:   Build RRC Security Mode Fail
 *
 *       Ret:    Void    
 *
 *       Notes:  None
 *
 *       File:   nhac_pjuutl.c
 *
 */

#ifdef ANSI
PUBLIC S16  nhAcBuildMeasRpt_r9
(
Buffer **mBuf
)
#else
PUBLIC S16  nhAcBuildMeasRpt_r9(mBuf)
Buffer **mBuf;
#endif
{
   NhuDatIndSdus        *pdu           = NULLP;
   NhuUL_DCCH_Msg       *ulDcchMsg     = NULLP;
   NhuMeasurementReport_r8_IEs  *r8Ie    = NULLP;

   Mem  sMem;
   S16 ret = 0;

   Bool dbgFlag = TRUE;  /* Debug Flag */
   U32  fLen;      /* Length of static buffer, if applicable */
   CmPAsnErr err;  /* error to be returned back to the caller */

   TRC2(nhAcBuildMeasRpt_r9)

   sMem.region = 0;
   sMem.pool = 0;
   fLen = 0;

   CMXTA_ALLOCMBUF(mBuf);

   CMXTA_ALLOC_EVNT(&pdu, sizeof(NhuDatIndSdus),&sMem, NHAC_MEM_PDU_SIZE);

   ulDcchMsg = &(pdu->sdu.m.ulDcchMsg.dcchMsg);

   NHAC_FILL_U8_U32_TKN(ulDcchMsg->pres, TRUE, PRSNT_NODEF);
   NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.choice,TRUE, UL_DCCH_MSGTYP_C1);

   /* Fill c1 */
   if(ulDcchMsg->message.choice.val == UL_DCCH_MSGTYP_C1)
   {
      NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.val.c1.choice,TRUE,
                                       C1_MEASUREMENTREPORT);
      NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.val.c1.val.\
                              measurementReport.pres,TRUE, PRSNT_NODEF);

      NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.val.c1.val.measurementReport.\
                criticalExtns.choice, TRUE, CRITICALEXTNS_C1);
      NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.val.c1.val.measurementReport.\
                criticalExtns.val.c1.choice, TRUE, C1_MEASUREMENTREPORT_R8);

      r8Ie = &(ulDcchMsg->message.val.c1.val.measurementReport.criticalExtns.\
                  val.c1.val.measurementReport_r8);

      NHAC_FILL_U8_U32_TKN(r8Ie->pres, TRUE, PRSNT_NODEF);
      NHAC_FILL_U8_U32_TKN(r8Ie->measResults.pres, TRUE, PRSNT_NODEF);
      NHAC_FILL_U8_U32_TKN(r8Ie->measResults.measId, TRUE, 1);
      NHAC_FILL_U8_U32_TKN(r8Ie->measResults.measResultServCell.pres, TRUE,
                                             PRSNT_NODEF);
      NHAC_FILL_U8_U32_TKN(r8Ie->measResults.measResultServCell.rsrpResult, TRUE,
                                             20);
      NHAC_FILL_U8_U32_TKN(r8Ie->measResults.measResultServCell.rsrqResult, TRUE,
                                             30);
   }
   else
   {
      NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.choice,TRUE,
                                          UL_DCCH_MSGTYP_MESSAGECLASSEXTN);
      NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.val.messageClassExtn.pres,TRUE,
                                                               PRSNT_NODEF);
   }

   /* Encode the message */
   ret = cmPAsnEncMsgUalign ((TknU8*)(ulDcchMsg), CM_PASN_USE_MBUF,
            (Void *)(*mBuf),0, nhUL_DCCH_Pdu_r9, &err, &fLen, dbgFlag, FALSE);

   if (ret != ROK)
   {
      sprintf( pbuf,"\n PASN lib Encoding Failed!\n");
      SPrint(  pbuf  );
      CMXTA_FREEMBUF(*mBuf);
      CMXTA_FREEEVNT(pdu);
      RETVALUE(CMXTA_ERR_INT);
   }
   else
   {
      sprintf( pbuf,"\n PASN lib Encoding OK\n");
      SPrint(  pbuf  );
   }

   CMXTA_FREEEVNT(pdu);
   RETVALUE (CMXTA_ERR_NONE);
}

/*
 *
 *       Fun:    nhAcBuildRRCReEstCmp_r9
 *
 *       Desc:   Build RRC Security Mode Fail
 *
 *       Ret:    Void    
 *
 *       Notes:  None
 *
 *       File:   nhac_pjuutl.c
 *
 */

#ifdef ANSI
PUBLIC S16  nhAcBuildRRCReEstCmp_r9
(
Buffer **mBuf
)
#else
PUBLIC S16  nhAcBuildRRCReEstCmp_r9(mBuf)
Buffer **mBuf;
#endif
{
   NhuDatIndSdus        *pdu           = NULLP;
   NhuUL_DCCH_Msg       *ulDcchMsg     = NULLP;
   NhuRRCConReestbCompl_r8_IEs  *r8Ie  = NULLP;

   Mem  sMem;
   S16 ret = 0;

   Bool dbgFlag = TRUE;  /* Debug Flag */
   U32  fLen;      /* Length of static buffer, if applicable */
   CmPAsnErr err;  /* error to be returned back to the caller */

   TRC2(nhAcBuildRRCReEstCmp_r9)

   sMem.region = 0;
   sMem.pool = 0;
   fLen = 0;

   CMXTA_ALLOCMBUF(mBuf);

   CMXTA_ALLOC_EVNT(&pdu, sizeof(NhuDatIndSdus),&sMem, NHAC_MEM_PDU_SIZE);

   ulDcchMsg = &(pdu->sdu.m.ulDcchMsg.dcchMsg);

   NHAC_FILL_U8_U32_TKN(ulDcchMsg->pres, TRUE, PRSNT_NODEF);
   NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.choice,TRUE, UL_DCCH_MSGTYP_C1);

   /* Fill c1 */
   if(ulDcchMsg->message.choice.val == UL_DCCH_MSGTYP_C1)
   {
      NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.val.c1.choice,TRUE,
                                       C1_RRCCONREESTBCOMPL);
      NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.val.c1.val.\
                              rrcConReestbCompl.pres,TRUE, PRSNT_NODEF);

      /* Fill rrc_TrnsxnId */
      NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.val.c1.val.rrcConReestbCompl.\
                                      rrc_TrnsxnId, TRUE, 1);

      NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.val.c1.val.rrcConReestbCompl.\
                criticalExtns.choice, TRUE, CRITICALEXTNS_RRCCONREESTBREJ_R8);

      r8Ie = &(ulDcchMsg->message.val.c1.val.rrcConReestbCompl.criticalExtns.\
                  val.rrcConReestbCompl_r8);

      NHAC_FILL_U8_U32_TKN(r8Ie->pres, TRUE, PRSNT_NODEF);
   }
   else
   {
      NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.choice,TRUE,
                                          UL_DCCH_MSGTYP_MESSAGECLASSEXTN);
      NHAC_FILL_U8_U32_TKN(ulDcchMsg->message.val.messageClassExtn.pres,TRUE,
                                                               PRSNT_NODEF);
   }

   /* Encode the message */
   ret = cmPAsnEncMsgUalign ((TknU8*)(ulDcchMsg), CM_PASN_USE_MBUF,
            (Void *)(*mBuf),0, nhUL_DCCH_Pdu_r9, &err, &fLen, dbgFlag, FALSE);

   if (ret != ROK)
   {
      sprintf( pbuf,"\n PASN lib Encoding Failed!\n");
      SPrint(  pbuf  );
      CMXTA_FREEMBUF(*mBuf);
      CMXTA_FREEEVNT(pdu);
      RETVALUE(CMXTA_ERR_INT);
   }
   else
   {
      sprintf( pbuf,"\n PASN lib Encoding OK\n");
      SPrint(  pbuf  );
   }

   CMXTA_FREEEVNT(pdu);
   RETVALUE (CMXTA_ERR_NONE);
}


/*
 *
 *       Fun:    nhAcConstructAndEncode
 *
 *       Desc:   Construct the message and encode
 *
 *       Ret:    Integer
 *
 *       Notes:  None
 *
 *       File:   nhac_pjuutl.c
 *
 */
#ifdef ANSI
PUBLIC S16  nhAcConstructAndEncode
(
 Pst *pst,
 U16 msgType,
 Buffer **mBuf,
 CmXtaSpCb    *spCb,
 CmXtaTCCb    *tcCb
 )
#else
PUBLIC S16  nhAcConstructAndEncode(pst,msgType,mBuf,spCb,tcCb)
   Pst *pst;
   U16 msgType;
   Buffer  **mBuf;
   CmXtaSpCb    *spCb;
   CmXtaTCCb    *tcCb;
#endif
{
   S16       ret;
   U8 pdcpRel=9;
   TRC2(nhAcConstructAndEncode)

   gSpCb=spCb;
   gTcCb=tcCb;

   cmXtaXmlGetVal(NULLP, spCb->childStep, CMXTA_ATTRIB_U8, "pdcpRel",
                                 &pdcpRel);
   if(pdcpRel == 9)
   {
   switch(msgType)
   {
      case C1_RRCCONRECFGNCOMPL:
         ret = nhAcBuildRRCConReCfgComplete_r9(mBuf);
         if (ret != CMXTA_ERR_NONE)
         {
            CMXTA_DBG_ERR((_cmxtap, "Bulding Message (%d) failed\n",msgType));
         }
         break;

      case C1_RRCCONSETUPCOMPL:
         ret = nhAcBuildRRCConSetupComplete_r9(mBuf, spCb);
         if (ret != CMXTA_ERR_NONE)
         {
            CMXTA_DBG_ERR((_cmxtap, "Bulding Message (%d) failed\n",msgType));
         }
         break;

      case C1_SECURITYMODECOMPL:
         ret = nhAcBuildRRCSecModeComplete_r9(mBuf);
         if (ret != CMXTA_ERR_NONE)
         {
            CMXTA_DBG_ERR((_cmxtap, "Bulding Message (%d) failed\n",msgType));
         }
         break;

      case C1_SECURITYMODEFAIL:
         ret = nhAcBuildRRCSecModeFail_r9(mBuf);
         if (ret  != CMXTA_ERR_NONE)
         {
            CMXTA_DBG_ERR((_cmxtap, "Bulding Message (%d) failed\n",msgType));
            RETVALUE(CMXTA_ERR_INT);
         }
         break;

      case C1_ULINFOTFR:
         ret = nhAcBuildUpLinkTrfr_r9(mBuf);
         if (ret  != CMXTA_ERR_NONE)
         {
            CMXTA_DBG_ERR((_cmxtap, "Bulding Message (%d) failed\n",msgType));
            RETVALUE(CMXTA_ERR_INT);
         }
         break;

      case C1_MEASUREMENTREPORT:
         ret = nhAcBuildMeasRpt_r9(mBuf);
         if (ret  != CMXTA_ERR_NONE)
         {
            CMXTA_DBG_ERR((_cmxtap, "Bulding Message (%d) failed\n",msgType));
            RETVALUE(CMXTA_ERR_INT);
         }
         break;

      case C1_RRCCONREESTBCOMPL:
         ret = nhAcBuildRRCReEstCmp_r9(mBuf);
         if (ret  != CMXTA_ERR_NONE)
         {
            CMXTA_DBG_ERR((_cmxtap, "Bulding Message (%d) failed\n",msgType));
            RETVALUE(CMXTA_ERR_INT);
         }
         break;

      case C1_ULHOVRPREPTFR:
         ret = nhAcBuildHndovrPrepTfr_r9(mBuf);
         if (ret  != CMXTA_ERR_NONE)
         {
            CMXTA_DBG_ERR((_cmxtap, "Bulding Message (%d) failed\n",msgType));
            RETVALUE(CMXTA_ERR_INT);
         }
         break;

      case C1_CSFBPARAMSRQSTCDMA2000:
         ret = nhAcBuildCSFBParamCDMA2000Req_r9(mBuf);
         if (ret  != CMXTA_ERR_NONE)
         {
            CMXTA_DBG_ERR((_cmxtap, "Bulding Message (%d) failed\n",msgType));
            RETVALUE(CMXTA_ERR_INT);
         }
         break;

      case C1_UECAPINFO:
         ret = nhAcBuildUeCapInfo_r9(mBuf);
         if (ret  != CMXTA_ERR_NONE)
         {
            CMXTA_DBG_ERR((_cmxtap, "Bulding Message (%d) failed\n",msgType));
            RETVALUE(CMXTA_ERR_INT);
         }
         break;

      case C1_COUNTERCHECKRSP:
         ret = nhAcBuildCountChkResp_r9(mBuf, tcCb, spCb);
         if (ret  != CMXTA_ERR_NONE)
         {
            CMXTA_DBG_ERR((_cmxtap, "Bulding Message (%d) failed\n",msgType));
            RETVALUE(CMXTA_ERR_INT);
         }
         break;

#ifdef LTERRC_REL9
/*TODO:MP: UE Information Response */
      case C1_UEINFORSP_R9__2:
         ret = nhAcBuildUeInfoResp_r9(mBuf, tcCb, spCb);
         if (ret  != CMXTA_ERR_NONE)
         {
            CMXTA_DBG_ERR((_cmxtap, "Bulding Message (%d) failed\n",msgType));
            RETVALUE(CMXTA_ERR_INT);
         }
         break;

/*TODO:MP: Proximity Indication */
      case C1_PROXIMITYIND_R9__2:
         ret = nhAcBuildProximityInd_r9(mBuf, tcCb, spCb);
         if (ret  != CMXTA_ERR_NONE)
         {
            CMXTA_DBG_ERR((_cmxtap, "Bulding Message (%d) failed\n",msgType));
            RETVALUE(CMXTA_ERR_INT);
         }
         break;
         
#endif /*LTERRC_REL9*/         
         
      default:
         break;
   }/* End of switch */
   }
   else
   {

      printf("R!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n");
   switch(msgType)
   {
      case C1_RRCCONRECFGNCOMPL:
         ret = nhAcBuildRRCConReCfgComplete_r11(mBuf);
         if (ret != CMXTA_ERR_NONE)
         {
            CMXTA_DBG_ERR((_cmxtap, "Bulding Message (%d) failed\n",msgType));
         }
         break;

      case C1_RRCCONSETUPCOMPL:
         ret = nhAcBuildRRCConSetupComplete_r11(mBuf, spCb);
         if (ret != CMXTA_ERR_NONE)
         {
            CMXTA_DBG_ERR((_cmxtap, "Bulding Message (%d) failed\n",msgType));
         }
         break;

      case C1_SECURITYMODECOMPL:
         ret = nhAcBuildRRCSecModeComplete_r11(mBuf);
         if (ret != CMXTA_ERR_NONE)
         {
            CMXTA_DBG_ERR((_cmxtap, "Bulding Message (%d) failed\n",msgType));
         }
         break;

      case C1_SECURITYMODEFAIL:
         ret = nhAcBuildRRCSecModeFail_r11(mBuf);
         if (ret  != CMXTA_ERR_NONE)
         {
            CMXTA_DBG_ERR((_cmxtap, "Bulding Message (%d) failed\n",msgType));
            RETVALUE(CMXTA_ERR_INT);
         }
         break;

      case C1_ULINFOTFR:
         ret = nhAcBuildUpLinkTrfr_r11(mBuf);
         if (ret  != CMXTA_ERR_NONE)
         {
            CMXTA_DBG_ERR((_cmxtap, "Bulding Message (%d) failed\n",msgType));
            RETVALUE(CMXTA_ERR_INT);
         }
         break;

      case C1_MEASUREMENTREPORT:
         ret = nhAcBuildMeasRpt_r11(mBuf);
         if (ret  != CMXTA_ERR_NONE)
         {
            CMXTA_DBG_ERR((_cmxtap, "Bulding Message (%d) failed\n",msgType));
            RETVALUE(CMXTA_ERR_INT);
         }
         break;

      case C1_RRCCONREESTBCOMPL:
         ret = nhAcBuildRRCReEstCmp_r11(mBuf);
         if (ret  != CMXTA_ERR_NONE)
         {
            CMXTA_DBG_ERR((_cmxtap, "Bulding Message (%d) failed\n",msgType));
            RETVALUE(CMXTA_ERR_INT);
         }
         break;

      case C1_ULHOVRPREPTFR:
         ret = nhAcBuildHndovrPrepTfr_r11(mBuf);
         if (ret  != CMXTA_ERR_NONE)
         {
            CMXTA_DBG_ERR((_cmxtap, "Bulding Message (%d) failed\n",msgType));
            RETVALUE(CMXTA_ERR_INT);
         }
         break;

      case C1_CSFBPARAMSRQSTCDMA2000:
         ret = nhAcBuildCSFBParamCDMA2000Req_r11(mBuf);
         if (ret  != CMXTA_ERR_NONE)
         {
            CMXTA_DBG_ERR((_cmxtap, "Bulding Message (%d) failed\n",msgType));
            RETVALUE(CMXTA_ERR_INT);
         }
         break;

      case C1_UECAPINFO:
         ret = nhAcBuildUeCapInfo_r11(mBuf);
         if (ret  != CMXTA_ERR_NONE)
         {
            CMXTA_DBG_ERR((_cmxtap, "Bulding Message (%d) failed\n",msgType));
            RETVALUE(CMXTA_ERR_INT);
         }
         break;

      case C1_COUNTERCHECKRSP:
         ret = nhAcBuildCountChkResp_r11(mBuf, tcCb, spCb);
         if (ret  != CMXTA_ERR_NONE)
         {
            CMXTA_DBG_ERR((_cmxtap, "Bulding Message (%d) failed\n",msgType));
            RETVALUE(CMXTA_ERR_INT);
         }
         break;

#ifdef LTERRC_REL9
/*TODO:MP: UE Information Response */
      case C1_UEINFORSP_R9__2:
         ret = nhAcBuildUeInfoResp_r11(mBuf, tcCb, spCb);
         if (ret  != CMXTA_ERR_NONE)
         {
            CMXTA_DBG_ERR((_cmxtap, "Bulding Message (%d) failed\n",msgType));
            RETVALUE(CMXTA_ERR_INT);
         }
         break;

/*TODO:MP: Proximity Indication */
      case C1_PROXIMITYIND_R9__2:
         ret = nhAcBuildProximityInd_r11(mBuf, tcCb, spCb);
         if (ret  != CMXTA_ERR_NONE)
         {
            CMXTA_DBG_ERR((_cmxtap, "Bulding Message (%d) failed\n",msgType));
            RETVALUE(CMXTA_ERR_INT);
         }
         break;
         
#endif /*LTERRC_REL9*/         
         
#ifdef RRC_REL11
         /* RN reconfig complete */
      case C1_RNRECFGNCOMPL_R10__2:
         ret = nhAcBuildRNReCfgComplete(mBuf);
         if (ret != CMXTA_ERR_NONE)
         {
            CMXTA_DBG_ERR((_cmxtap, "Bulding Message (%d) failed\n",msgType));
         }
         break;
         /* MBMS Counting response complete */
      case C1_MBMSCOUNTINGRSP_R10:
         ret = nhAcBuildMBMSCountingRsp(mBuf);
         if (ret != CMXTA_ERR_NONE)
         {
            CMXTA_DBG_ERR((_cmxtap, "Bulding Message (%d) failed\n",msgType));
         }
         break;
         /* Inter Frequency RSTD Measurement Indication */
      case C1_INTERFREQRSTDMEASUREMENTIND_R10__2:
         ret = nhAcBuildInterFreqRSTDMeasurementInd(mBuf);
         if (ret != CMXTA_ERR_NONE)
         {
            CMXTA_DBG_ERR((_cmxtap, "Bulding Message (%d) failed\n",msgType));
         }
         break;


#endif

      default:
         break;
   }/* End of switch */
   }
   RETVALUE(CMXTA_ERR_NONE);
}



/**********************************************************************
         End of file:     nhac_pjuutl_r9.c@@/main/TeNB_Main_BR/tenb_main_ccb/tenb_5.0_RIB/tenb_5.0_RIB_GA/10 - Mon Feb 15 12:51:25 2016
**********************************************************************/
/**********************************************************************

        Revision history:

**********************************************************************/
/********************************************************************90**

   ver       pat    init                  description
------------ -------- ---- ----------------------------------------------
/main/1      ---    dm               1. LTE RRC Initial Release.
/main/2      ---    chebli           1. RRC Release 2.1.
/main/3      ---    sbalakrishna     1. Updated for Release of 3.1.
*********************************************************************91*/
