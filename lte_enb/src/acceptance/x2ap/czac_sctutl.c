
/********************************************************************20**

     Name:     S1AP 

     Type:     C source file

     Desc:     Utility Functions for SCT interface 

     File:     czac_sctutl.c

     Sid:      czac_sctutl.c@@/main/2 - Tue Aug 30 18:35:54 2011

     Prg:      sy

*********************************************************************21*/

/* header include files (.h) */

#include "envopt.h"        /* environment options */
#include "envdep.h"        /* environment dependent */
#include "envind.h"        /* environment independent */

#include "gen.h"           /* general layer */
#include "ssi.h"           /* system services */
#include "cm5.h"           /* timer defines */
#include "cm_hash.h"       /* common hashing */

#include "cm_llist.h"      /* common linked list */
#include "cm_tpt.h"        /* common transport defines */
#include "cm_dns.h"        /* Common DNS library */
#include "cm_mblk.h"       /* common Memory block */


#include "sct.h"
#include "czt.h"
#include "lcz.h"
#ifdef SB
#include "lsb.h"           /* layer management defines for SCTP layer */
#endif /*sb*/
#ifdef HI
#include "lhi.h"            /* TUCL layer managment defines */
#endif /*hi*/
#include "cm_xta.h"
#include "czac_acc.h"


/* header/extern include files (.x) */

#include "gen.x"           /* general layer typedefs */
#include "ssi.x"           /* system services typedefs */
#include "cm5.x"           /* timer typedefs */
#include "cm_lib.x"        /* common library functions typedefs */
#include "cm_hash.x"       /* common hashing */

#include "cm_llist.x"      /* common linked list */
#include "cm_mblk.x"       /* common Memory block */
#include "cm_lib.x"        /* common library */
#include "cm_tpt.x"           /* common transport address */
#include "cm_dns.x"        /* Common DNS library */

#include "sct.x"
#ifdef SB
#include "lsb.x"           /* layer management typedefs for SCTP layer */
#endif /*sb*/
#ifdef HI
#include "lhi.x"           /* TUCL layer managment structures */
#endif /*hi*/

#include "czt.x"
#include "lcz.x"
#include "cm_xta.x"
#include "czac_acc.x"
#include "czac_sct.x"
#include "czac_czt.x"

#ifdef DM

/*
 *
 *       Fun:    czAcSctAssocFindnCreate -
 *
 *       Desc:   Find and Create Association Control Block 
 *
 *       Ret:    ROK     - succeeded
 *               RFAILED - failed
 *
 *       Notes:  None
 *
 *       File:   xx_sctutl.c
 *
 */

#ifdef ANSI
PUBLIC CzAcSctAssocCb* czAcSctAssocFindnCreate
(
CmXtaTCCb    *tcCb,
U32   assocIdx,
UConnId   suAssocId,
UConnId   spAssocId
)
#else /* ANSI */
PUBLIC CzAcSctAssocCb* czAcSctAssocFindnCreate(tcCb, assocIdx,suAssocId,spAssocId)
CmXtaTCCb    *tcCb;
U32       assocIdx;
UConnId   suAssocId;
UConnId   spAssocId;
#endif /* ANSI */
{
   CzAcSctAssocCb* assocCb;

   TRC2(czAcSctAssocFindnCreate)

   assocCb = NULLP;

   CMXTA_DBG_PARAM((_cmxtap, "czAcSctAssocFindnCreate(): \n"));

   /*-- CMXTA_ENHANCE:  Change to Hash Defines --*/
   if (assocIdx >= 10)
   {
      CMXTA_DBG_FATAL((_cmxtap, "czAcSctAssocFindnCreate(): resource error\n"));
      RETVALUE(NULLP);
   }

   assocCb = &czAccCb.sctCb.assoc[assocIdx];

   /*-- DSCTP does not maintain the state of the assocCb, if the user
        tries to reuse the same index again, it will result in the old
        values being overwritten by the new values. This is done to 
        aid the use of the same assocCb between different TCs. TA may
        not reset the values in assocCb between different TCs. All TCs
        on DSCTP anyway will not run in parallel with other TCs --*/

   /*-- Generate spAssocId --*/
   if (suAssocId == CZT_CONNID_NOTUSED)
      suAssocId = ++czAccCb.hitCb.nxtConnId;

   assocCb->suAssocId = suAssocId;

   if (spAssocId == CZT_CONNID_NOTUSED)
      assocCb->spAssocId = suAssocId;
   else
      assocCb->spAssocId = spAssocId;

   /*-- Logic not used --*/
   if (assocCb->inUse == FALSE)
   {
      assocCb->inUse = TRUE;
   }

   RETVALUE(assocCb);
} /* end of czAcSctAssocFindnCreate() */

/*
 *
 *       Fun:    czAcSctAssocFind -
 *
 *       Desc:   Find the Association Control Block 
 *
 *       Ret:    ROK     - succeeded
 *               RFAILED - failed
 *
 *       Notes:  None
 *
 *       File:   xx_sctutl.c
 *
 */

#ifdef ANSI
PUBLIC CzAcSctAssocCb* czAcSctAssocFind
(
CmXtaTCCb    *tcCb,
U32   assocIdx
)
#else /* ANSI */
PUBLIC CzAcSctAssocCb* czAcSctAssocFind(tcCb, assocIdx)
CmXtaTCCb    *tcCb;
U32   assocIdx;
#endif /* ANSI */
{
   CzAcSctAssocCb* assocCb;

   TRC2(czAcSctAssocFind)

   assocCb = NULLP;

   CMXTA_DBG_PARAM((_cmxtap, "czAcSctAssocFind(): \n"));

   if (assocIdx >= 10)
   {
      CMXTA_DBG_FATAL((_cmxtap, "czAcSctAssocFind(): resource error\n"));
      RETVALUE(NULLP);
   }

   assocCb = &czAccCb.sctCb.assoc[assocIdx];

   /*-- DSCTP does not maintain the state of the assocCb, if the user
        tries to reuse the same index again, it will result in the old
        values being overwritten by the new values. This is done to 
        aid the use of the same assocCb between different TCs. TA may
        not reset the values in assocCb between different TCs. All TCs
        on DSCTP anyway will not run in parallel with other TCs --*/

   /*-- Use this function only if you do want to do validation --*/
   if (assocCb->inUse == FALSE)
   {
#ifndef ALIGN_64BIT   
      CMXTA_DBG_CALLIND((_cmxtap, "Failed : assoc not found: exp (%ld)\n",
                      assocIdx), 2);
#else /* ALIGN_64BIT */ 
      CMXTA_DBG_CALLIND((_cmxtap, "Failed : assoc not found: exp (%d)\n",
                      assocIdx), 2);
#endif /* ALIGN_64BIT */ 
      RETVALUE(NULLP);
   }

   RETVALUE(assocCb);
} /* end of czAcSctAssocFind() */

/*
 *
 *       Fun:    czAcSctTstCbFind -
 *
 *       Desc:   
 *
 *       Ret:    ROK     - succeeded
 *               RFAILED - failed
 *
 *       Notes:  None
 *
 *       File:   xx_sctutl.c
 *
 */
#ifdef ANSI
PUBLIC CmXtaTCCb*  czAcSctTstCbFind
(
)
#else /* ANSI */
PUBLIC CmXtaTCCb*  czAcSctTstCbFind (void)
#endif /* ANSI */
{
   TRC2(czAcSctTstCbFind)

   /*-- Optimization, check if only one TC running --*/
   if (cmXtaCb.curTCCb != NULLP)
      RETVALUE(cmXtaCb.curTCCb);

   RETVALUE(NULLP);
}

/*
 *
 *       Fun:    czAcUtlBuildX2APPdu
 *
 *       Desc:   
 *
 *       Ret:    ROK     - succeeded
 *               RFAILED - failed
 *
 *       Notes:  None
 *
 *       File:   xx_sctutl.c
 *
 */
#ifdef ANSI
PUBLIC S16  czAcUtlBuildX2APPdu
(
CmXtaTCCb    *tcCb,    /* tcCb data structure  */
CmXtaSpCb    *spCb,    /* spCb data structure  */
CztEvnt      **cztEvent     /* S1AP PDU structure */
)
#else /* ANSI */
PUBLIC S16  czAcUtlBuildX2APPdu (tcCb, spCb,cztEvent)
CmXtaTCCb    *tcCb;    /* tcCb data structure  */
CmXtaSpCb    *spCb;    /* spCb data structure  */
CztEvnt      **cztEvent;    /* S1AP PDU structure */
#endif /* ANSI */
{
   U8      eventType = 0;
   S16     ret;

   TRC2(czAcUtlBuildX2APPdu);


   ret = ROK;
   cmXtaXmlGetVal(tcCb, spCb->childStep, CMXTA_ATTRIB_ENUM_U8, "eventType", &eventType);

   switch(eventType)
   {
      case CZT_MSG_X2_SETUP:
           czAcUtlCztFillX2SetupReq(tcCb, spCb, (cztEvent));
           break;

      case CZT_MSG_X2_SETUP_RSP:
           czAcUtlCztFillX2SetupRsp(tcCb, spCb, (cztEvent));
           break;

      case CZT_MSG_X2_SETUP_FAIL:
           czAcUtlCztFillX2SetupFail(tcCb, spCb, (cztEvent));
           break;

      case CZT_MSG_RESET:
           czAcUtlCztFillReset(tcCb, spCb, (cztEvent));
           break;

      case CZT_MSG_RESET_RSP:
           czAcUtlCztFillResetAck(tcCb, spCb, (cztEvent));
           break;

      case CZT_MSG_UE_CXT_RELEASE:
           czAcUtlCztFillUeCxtRls(tcCb, spCb, (cztEvent));
           break;
      case CZT_MSG_ERR_IND:
           czAcUtlCztFillErrInd(tcCb, spCb, (cztEvent));
           break;

      case CZT_MSG_HO_REQ:
           czAcUtlCztFillHovrRqst(tcCb, spCb, (cztEvent));
           break;

      case CZT_MSG_HO_ACK:
           czAcUtlCztFillHovrRqstAck(tcCb, spCb, (cztEvent));
           break;


      case CZT_MSG_HO_FAIL:
           czAcUtlCztFillHovrPrepFail(tcCb, spCb, (cztEvent));
           break;

      case CZT_MSG_HO_CANCEL:
           czAcUtlCztFillHovrCancel(tcCb, spCb, (cztEvent));
           break;

      case CZT_MSG_SN_STATUS_TRFR:
           czAcUtlCztFillSnStatusTrfr(tcCb, spCb, (cztEvent));
           break;


      case CZT_MSG_CFG_UPD_REQ:
           czAcUtlCztFillENBConfigUpd(tcCb, spCb, (cztEvent));
           break;

      case CZT_MSG_CFG_UPD_ACK:
           czAcUtlCztFillENBConfigUpdAckg(tcCb, spCb, (cztEvent));
           break;

      case CZT_MSG_CFG_UPD_FAIL:
           czAcUtlCztFillENBConfigUpdFail(tcCb, spCb, (cztEvent));
           break;

      case CZT_MSG_RSRC_ST_REQ:
            czAcUtlCztFillResStatusRqst(tcCb, spCb, cztEvent);
            break;

      case CZT_MSG_RSRC_ST_UPD:
            czAcUtlCztFillResStatusUpd(tcCb, spCb, cztEvent);
            break;

      case CZT_MSG_RSRC_ST_RSP:
            czAcUtlCztResStatusResp(tcCb, spCb, cztEvent);
            break;

      case CZT_MSG_RSRC_ST_FAIL:
            czAcUtlCztFillResStatusFail(tcCb, spCb, cztEvent);
            break;

      case CZT_MSG_LOAD_IND:
            czAcUtlCztFillLoadInd(tcCb, spCb, cztEvent);
            break;

      case CZT_MSG_MOB_CHANGE_REQ:
         {
            czAcUtlCztFillMobChgReq(tcCb, spCb, cztEvent);
            break;
         }

       case CZT_MSG_MOB_CHANGE_ACK:
         {
            czAcUtlCztFillMobChgAck(tcCb, spCb, cztEvent);
            break;
         }

       case CZT_MSG_MOB_CHANGE_FAIL:
         {
            czAcUtlCztFillMobChgFail(tcCb, spCb, cztEvent);
            break;
         }

        case CZT_MSG_RLF_INDICATION:
         {
            czAcUtlCztFillRlfInd(tcCb, spCb, cztEvent);
            break;
         }

       case CZT_MSG_HO_REPORT:
         {
            czAcUtlCztFillHOReport(tcCb, spCb, cztEvent);
            break;
         }

       case CZT_MSG_CELL_ACTIVATION_REQ:
         {
             czAcUtlCztFillCellActReq(tcCb, spCb, cztEvent);
            break;
         }

       case CZT_MSG_CELL_ACTIVATION_RES:
         {
            czAcUtlCztFillCellActRes(tcCb, spCb, cztEvent);
            break;
         }

       case CZT_MSG_CELL_ACTIVATION_FAIL:
         {
             czAcUtlCztFillCellActFail(tcCb, spCb, cztEvent);
            break;
          }

      default:
         ret = RFAILED;
         break;
   }

   RETVALUE(ret);
} /* End of czAcUtlBuildX2APPdu() */

/*
*
*       Fun:   czAcUtlSctCb 
*
*       Desc:  This function is used to 
*
*       Ret:   None
*
*       Notes: None
*
*       File:  xx_lhicb.c
*
*/
#ifdef ANSI
PUBLIC S16 czAcUtlSctCb
(
CmXtaMsgQElm *qElm
)
#else /* ANSI */
PUBLIC S16 czAcUtlSctCb(qElm)
CmXtaMsgQElm *qElm;
#endif /* ANSI */
{
   CzAccMsgQElm  *czMsg;

   TRC2(czAcUtlSctCb)

   CMXTA_DBG_PARAM((_cmxtap, "czAcUtlSctCb(): \n"));

   czMsg = (CzAccMsgQElm *)qElm->data;

   if(czMsg->u.sctInfo.mBuf != NULLP)
   {
      SPutMsg(czMsg->u.sctInfo.mBuf);
   }

   if (czMsg != NULLP)
   {
      CMXTA_FREE(czMsg, sizeof (CzAccMsgQElm));

      qElm->data = NULLP;
   }

   RETVALUE(CMXTA_ERR_NONE);
} /* End of czAcUtlSctCb() */

#endif /* ifdef DM */
/**********************************************************************

         End of file:     czac_sctutl.c@@/main/2 - Tue Aug 30 18:35:54 2011

**********************************************************************/

/********************************************************************40**
 
        Notes:
 
*********************************************************************41*/

/********************************************************************50**
 
*********************************************************************51*/

/********************************************************************60**
 
        Revision history:
 
*********************************************************************61*/

/********************************************************************80**
 
*********************************************************************81*/
/********************************************************************90**
 
     ver       pat    init                  description
------------ -------- ---- ----------------------------------------------
/main/1      ---   sy                    1. LTE-X2AP Initial Release.
/main/2      ---     pt                  1. LTE-X2AP 3.1 release.
*********************************************************************91*/
