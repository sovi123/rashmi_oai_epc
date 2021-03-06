/************************************************************************
 
     Name:     LTE MAC Convergence Layer
  
     Type:     C source file
  
     Desc:     C source code for Entry point fucntions
  
     File:     ys_pal_ui.c
  
     Sid:      ys_pal_ui.c@@/main/2 - Thu Dec  2 02:27:20 2010
  
     Prg:      hsingh
  
**********************************************************************/

/** @file ys_pal_ui.c
@brief This module acts as an interface handler for upper interface and 
manages Pst and Sap related information for upper interface APIs.
*/

/* header include files (.h) */
#include "envopt.h"        /* environment options */
#include "envdep.h"        /* environment dependent */
#include "envind.h"        /* environment independent */
#include "gen.h"           /* general layer */
#include "ssi.h"           /* system services */
#include "cm5.h"           /* common timers defines */
#include "cm_hash.h"       /* common hash list defines */
#include "cm_llist.h"      /* common linked list defines */
#include "cm_mblk.h"       /* memory management */
#include "cm_tkns.h"       /* common tokens */
#include "cm_lte.h"
#include "ctf.h"
#include "lys.h"           /* layer management typedefs for CL */
#include "tfu.h"
#include "ys_pal_err.h"        /* YS error defines */
#include "ys_pal.h"

/* header/extern include files (.x) */
#include "gen.x"           /* general layer typedefs */
#include "ssi.x"           /* system services typedefs */
#include "cm5.x"           /* common timers */
#include "cm_hash.x"       /* common hash list */
#include "cm_lib.x"        /* common library */
#include "cm_llist.x"      /* common linked list */
#include "cm_mblk.x"       /* memory management */
#include "cm_tkns.x"       /* common tokens */
#include "cm_lte.x"
#include "ctf.x"
#include "lys.x"           /* layer management typedefs for CL */
#include "tfu.x"
#include "ys_pal.x"

#ifndef LTE_PAL_ENB
/* CL Control Block Structure */
PUBLIC YsCb ysCb;
#endif /* LTE_PAL_ENB */


#ifdef LTE_PAL_ENB

#ifdef ANSI
PUBLIC S16 ysPalInitTti
(
Void
)
#else
PUBLIC S16 ysPalInitTti()
#endif
{
   /* ys002.102: Added missed trace macro */
   TRC2(ysPalInitTti)
   /*ys004.102:Cell Delete Fix CRID:ccpu00117556*/
   ysCb.ttiReady = FALSE;

#ifndef SS_CAVIUM
   /* Start TTI timer task */
   ysPalInitTtiTmrTsk();
#endif /* SS_CAVIUM */

   RETVALUE(ROK);
}  /* ysPalInitTti */



/**
 * @brief API for sending control information MAC to PHY
 *
 * @details
 *
 *     Function: ysPalPrcCntrlReq
 *     
 *     This API is invoked to send control information from MAC to RLC.
 *     It provides PHY with all the control information
 *       - PDCCH
 *       - PHICH
 *       - PCFICH
 *           
 *  @param[in]  pst
 *  @param[in]  spId
 *  @param[in]  cntrlReq pointer to TfuCntrlReqInfo
 *  @return  S16
 *      -# ROK 
 *      -# RFAILED 
 **/
#ifdef ANSI
PUBLIC S16 ysPalPrcCntrlReq
(
YsCellCb        *cellCb,
TfuCntrlReqInfo *cntrlReq
)
#else
PUBLIC S16 ysPalPrcCntrlReq(cellCb, cntrlReq)
YsCellCb        *cellCb;
TfuCntrlReqInfo *cntrlReq;
#endif
{
   S16 ret;

   TRC2(ysPalPrcCntrlReq)
   
   ret = ysPalUtlSetTfuMsg(cellCb, (Void *)cntrlReq, EVTTFUCNTRLREQ, 
                          &cntrlReq->dlTiming); 

   RETVALUE(ret);
}  /* ysPalPrcCntrlReq*/

/**
 * @brief This Primitive carries the Data PDUs from MAC to PHY for transmission
 *
 * @details
 *
 *     Function: ysPalPrcDatReq
 *     
 * @details The data being sent in this primitive is meant to be transmitted on
 * the downlink channel PDSCH and PBCH (if present). To facilitate physical
 * layer processing, requisite control information is also sent along with the
 * data. 
 *           
 *  @param[in]  pst
 *  @param[in]  spId
 *  @param[in]  tfuDatReq pointer to TfuDatReqInfo
 *  @return  S16
 *      -# ROK 
 *      -# RFAILED 
 **/
#ifdef ANSI
PUBLIC S16 ysPalPrcDatReq
(
YsCellCb        *cellCb,
TfuDatReqInfo   *datReq
)
#else
PUBLIC S16 ysPalPrcDatReq(cellCb, datReq)
YsCellCb        *cellCb;
TfuDatReqInfo   *datReq;
#endif
{
   S16 ret;
   
   TRC2(ysPalPrcDatReq)
   
   ret = ysPalUtlSetTfuMsg(cellCb, (Void *)datReq, EVTTFUDATREQ, 
                           &datReq->timingInfo);

   RETVALUE(ret);
}  /* ysPalPrcDatReq*/

/**
 * @brief brief This primitive is sent from Scheduler to PHY.
 *
 * @details
 *
 *     Function: ysPalPrcRecpReq
 *     
 * @details This primitive provides PHY with all the information required by 
 * PHY to decode transmissions from the UE on either PUCCH or PUSCH.
 * -# On PUCCH UE can transmit the following
 *    -# SR
 *    -# HARQ feedback
 *    -# CQI report
 *    -# HARQ + CQI
 *    -# HARQ + SR
 * -# On PUSCH UE can transmit the following
 *    -# Data
 *    -# Data + CQI
 *    -# Data + HARQ Feedback
 * This primitive carries all the information for the expected subframe for all
 * the UEs that have been scheduled to transmit.
 *           
 *  @param[in]  pst
 *  @param[in]  spId
 *  @param[in]  recpReq Pointer to the TfuRecpReqInfo structure.
 *  @return  S16
 *      -# ROK 
 *      -# RFAILED 
 **/
#ifdef ANSI
PUBLIC S16 ysPalPrcRecpReq
(
YsCellCb        *cellCb,
TfuRecpReqInfo  *recpReq
)
#else
PUBLIC S16 ysPalPrcRecpReq(cellCb, recpReq)
YsCellCb        *cellCb;
TfuRecpReqInfo  *recpReq;
#endif
{
   S16 ret;
   
   TRC2(ysPalPrcRecpReq)
   
   ret = ysPalUtlSetTfuMsg(cellCb, (Void *)recpReq, EVTTFURECPREQ,
                           &recpReq->timingInfo);

   RETVALUE(ret);
}  /* ysPalPrcRecpReq*/

#else /* LTE_PAL_ENB */

#ifdef ANSI
PUBLIC S16 YsUiTfuRaReqInd
(
Pst             *pst,
SpId            spId,
TfuRaReqIndInfo *raReqInd
)
#else
PUBLIC S16 YsUiTfuRaReqInd(pst, spId, raReqInd)
Pst             *pst;
SpId            spId;
TfuRaReqIndInfo *raReqInd;
#endif
{
   S16 ret;
   
   TRC2(YsUiTfuRaReqInd)
   
   ret = ysPalUtlSetTfuMsg(&ysCb.cellCb, (Void *)raReqInd, EVTTFURAREQIND, 
                           &raReqInd->timingInfo); 

   RETVALUE(ret);
}  /* YsUiTfuRaReqInd */

#ifdef ANSI
PUBLIC S16 YsUiTfuTimingAdvInd
(
Pst             *pst,
SpId            spId,
TfuTimingAdvIndInfo *taIndInfo
)
#else
PUBLIC S16 YsUiTfuTimingAdvInd(pst, spId, taIndInfo)
Pst             *pst;
SpId            spId;
TfuTimingAdvIndInfo *taIndInfo;
#endif
{
   S16 ret;
   
   TRC2(YsUiTfuTimingAdvInd)
   
   ret = ysPalUtlSetTfuMsg(&ysCb.cellCb, (Void *)taIndInfo, EVTTFUTIMINGADVIND, 
                           &taIndInfo->timingInfo); 

   RETVALUE(ret);
}  /* YsUiTfuTimingAdvInd */

#ifdef ANSI
PUBLIC S16 YsUiTfuHqInd
(
Pst             *pst,
SpId            spId,
TfuHqIndInfo    *hqInd
)
#else
PUBLIC S16 YsUiTfuHqInd(pst, spId, hqInd)
Pst             *pst;
SpId            spId;
TfuHqIndInfo    *hqInd;
#endif
{
   S16 ret;
   
   TRC2(YsUiTfuHqInd)
   
   ret = ysPalUtlSetTfuMsg(&ysCb.cellCb, (Void *)hqInd, EVTTFUHQIND, 
                           &hqInd->timingInfo); 

   RETVALUE(ret);
}  /* YsUiTfuHqInd */

#ifdef ANSI
PUBLIC S16 YsUiTfuSrInd
(
Pst             *pst,
SpId            spId,
TfuSrIndInfo    *srInd
)
#else
PUBLIC S16 YsUiTfuSrInd(pst, spId, srInd)
Pst             *pst;
SpId            spId;
TfuSrIndInfo    *srInd;
#endif
{
   S16 ret;
   
   TRC2(YsUiTfuSrInd)
   
   ret = ysPalUtlSetTfuMsg(&ysCb.cellCb, (Void *)srInd, EVTTFUSRIND, 
                           &srInd->timingInfo); 

   RETVALUE(ret);
}  /* YsUiTfuSrInd */

#ifdef ANSI
PUBLIC S16 YsUiTfuDatInd
(
Pst             *pst,
SpId            spId,
TfuDatIndInfo   *datInd
)
#else
PUBLIC S16 YsUiTfuDatInd(pst, spId, datInd)
Pst             *pst;
SpId            spId;
TfuDatIndInfo   *datInd;
#endif
{
   S16 ret;
   
   TRC2(YsUiTfuDatInd)
   
   ret = ysPalUtlSetTfuMsg(&ysCb.cellCb, (Void *)datInd, EVTTFUDATIND,
                           &datInd->timingInfo); 

   RETVALUE(ret);
}  /* YsUiTfuDatInd */

#ifdef ANSI
PUBLIC S16 YsUiTfuDlCqiInd
(
Pst             *pst,
SpId            spId,
TfuDlCqiIndInfo *cqiInd
)
#else
PUBLIC S16 YsUiTfuDlCqiInd(pst, spId, cqiInd)
Pst             *pst;
SpId            spId;
TfuDlCqiIndInfo    *cqiInd;
#endif
{
   S16 ret;
   
   TRC2(YsUiTfuDlCqiInd)
   
   ret = ysPalUtlSetTfuMsg(&ysCb.cellCb, (Void *)cqiInd, EVTTFUDLCQIIND, 
                           &cqiInd->timingInfo); 

   RETVALUE(ret);
}  /* YsUiTfuSrInd */
#endif /* LTE_PAL_ENB */

/********************************************************************30**
  
         End of file:     ys_pal_ui.c@@/main/2 - Thu Dec  2 02:27:20 2010
  
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
----------- -------- ---- -----------------------------------------------
/main/2      ---     sgm                   1. eNodeB 1.2 release
/main/2    ys002.102  rk                   1. Added missed trace macro.
/main/2    ys004.102  pkd                  1.Cell Delete Fix CRID:ccpu00117556
*********************************************************************91*/
