
/********************************************************************20**

     Name:     EnodeB Application

     Type:     C source file

     Desc:     This file contains 
               

     File:     wr_umm_ulnas.c

     Sid:      $SID$ 

     Prg:      Sriky 

*********************************************************************21*/
/* header include files (.h) */
static const char* RLOG_MODULE_NAME="UMM";
static int RLOG_FILE_ID=76;


static int RLOG_MODULE_ID=32;

#include "wr.h"
#include "wr_umm_trans.h"
#include "wr_umm_s1ap_msg.h"
#include "wr_ifm_s1ap.h"
#include "wr_utils.h"
#include "wr_umm_ecsfb_utils.h"
#include "wr_ifm_dam.h"/*ccpu00138576*/
/** @brief This function is used to Process all NAS related message. 
 *
 * @details
 *
 *     Function: wrUmmUlNasProcessor
 *
 *         Processing steps:
 *         -This function is called when an UL Information transfer is 
 *           received from UE. The included NAS is delivered transparently
 *           to MME as S1AP UL NAS message.                                                *
 *
 * @param[in] transCb: Transaction Cb
 * @return S16
 *        -# Success : ROK
 */
PUBLIC S16 wrUmmUlNasProcessor
(
WrUmmTransCb                 *transCb
)
{
   NhuDatIndSdus             *rrcPdu;
   NhuULInfoTfr              *ulInfo;
   TknStrOSXL                *nasPdu;
   SztDatEvntReq        s1UlInfoMsg;
   WrS1ConCb            *s1apConCb;

   NhuDedicatedInfoCDMA2000  *ulCdma1xRtt = NULLP;
   /*
   NhuDedicatedInfoCDMA2000  *ulCdmaHrpd; */
   U8                        choice;
   TknStrOSXL                *encSztSectorIdInfo;
   WrUmmS1UlTnlMsgParams     s1UlTnlMsgParams = {0};
   
   rrcPdu = transCb->msg->u.uuIndPdu;
   ulInfo  = &rrcPdu->sdu.m.ulDcchMsg.dcchMsg.message.val.c1.val.ulInfoTfr;
   /* Get the S1 Con CB */
   s1apConCb =transCb->ueCb->s1ConCb;
   /* ccpu00127612 - temporary fix */
   /* Drop the UL NAS packets when UE-Associated S1 connection is not UP */
   if(s1apConCb == NULLP || ((s1apConCb != NULLP) && 
            (s1apConCb->s1apConnState != WR_S1AP_CONNECTED)))
   {
      wrUmmTransComplete(transCb);
      RETVALUE(RFAILED);
   }
   choice = ulInfo->criticalExtns.val.c1.val.ulInfoTfr_r8.dedicatedInfoTyp.\
                                                            choice.val;
   WR_SET_ZERO(&s1UlInfoMsg, sizeof(SztDatEvntReq));
   if(DEDICATEDINFOTYP_DEDICATEDINFONAS == choice)
   {
      nasPdu = &ulInfo->criticalExtns.val.c1.val.ulInfoTfr_r8.dedicatedInfoTyp.\
               val.dedicatedInfoNAS;

      /*Reset INACTIVITY TIMER by setting dataRcvd flag to TRUE*/               
      wrIfmDamSetDataRcvdFlag(transCb->ueCb->cellId, transCb->ueCb->crnti);

      if(wrUmmS1apBldUlNasPdu(transCb->ueCb, nasPdu, &s1UlInfoMsg.pdu) != ROK)
      {
         wrUmmTransComplete(transCb);
         RETVALUE(ROK);
      }
   }
   else if (DEDICATEDINFOTYP_DEDICATEDINFOCDMA2000_1XRTT == choice)
   {
      /*This EMM API,wrEmmGetCdmaTgtCell will get the details like PnOffset
       * earfcn, MobilityParams, reference cell ID details
       */ 
      /*Call  Encoder to encode Reference Cell Id(for 1xRTT) Sector Id for HRPD
       * Below encoder function shall allocate the memory and store the 
       * address of encoded pdu in encSztSectorIdInfo, whose address is passed as
       * argument
       */
      wrEmmGetCdma1xRttTgtCell(&encSztSectorIdInfo, transCb->ueCb->cellId);
      /* need to check octet string is present or not 
       * then call encSecId */
      ulCdma1xRtt = &ulInfo->criticalExtns.val.c1.val.ulInfoTfr_r8.dedicatedInfoTyp.\
                                                        val.dedicatedInfoCDMA2000_1XRTT;
      s1UlTnlMsgParams.cdmaType          = SztCdma2000RATTyponexRTTEnum;
      s1UlTnlMsgParams.mainSecId         = encSztSectorIdInfo;
      s1UlTnlMsgParams.hoReqdInd         = FALSE;
      s1UlTnlMsgParams.ulCdmaInfo        = ulCdma1xRtt;
  
      if(ROK != wrUmmS1apBldUlCdmaPdu(transCb->ueCb, &s1UlTnlMsgParams, &s1UlInfoMsg.pdu))
      {
         RLOG0(L_ERROR, "  wrUmmS1apBldUlCdmaPdu failed ");
         /*Free encSztSectorIdInfo->val memory, which got allocated in SectorId 
          * Encoder function 
          * wrUmmUtilFreeTknOSXL(encSztSectorIdInfo);
          */

         RETVALUE(RFAILED);
      }
      /*Free encSztSectorIdInfo->val memory, which got allocated in SectorId 
       * Encoder function
       */
   }
   else
   {
       /* HRPD not supported */  
   }

   s1UlInfoMsg.spConnId = s1apConCb->spConnId;
   /* Dispatch the message using S1 interface to the selected MME         */
   if (ROK != WrIfmS1apDatReq(&s1UlInfoMsg))
   {
      RLOG0(L_ERROR, "Sending UPLINK NAS TRANSPORT Failed");
      RETVALUE(RFAILED);
   }
   else
   {
      RLOG_ARG2(L_EVENT, DBG_CRNTI, transCb->ueCb->crnti,"[S1AP] Sending UPLINK NAS TRANSPORT"
            "[MME-UE-S1AP-ID:%lu] [eNB-UE-S1AP-ID:%lu]",
            transCb->ueCb->s1ConCb->mme_ue_s1ap_id,
            transCb->ueCb->s1ConCb->enb_ue_s1ap_id);
   }
   /* Release the transaction CB as the transaction is complete           */
   wrUmmTransComplete(transCb);
   RETVALUE(ROK);
}

/** @brief This function is UL NAS transaction specific release function.   
 *
 * @details
 *
 *     Function: wrUmmUlNasTransRel
 *
 *         Processing steps:
 *
 * @param[in] transCb: Transaction Cb
 * @return S16
 *        -# Success : ROK
 */
PUBLIC S16 wrUmmUlNasTransRel
(
WrUmmTransCb                 *transCb
)
{
   RETVALUE(ROK);
}



/********************************************************************30**

           End of file:    $SID$

*********************************************************************31*/


/********************************************************************40**
  
        Notes:
  
*********************************************************************41*/

/********************************************************************50**

*********************************************************************51*/

   
/********************************************************************60**
  
        Revision history:
  
*********************************************************************61*/
  
/********************************************************************90**
 
     ver       pat    init                  description
------------ -------- ---- ----------------------------------------------
$SID$        ---      Sriky         1. initial release TotaleNodeB 1.1
*********************************************************************91*/
