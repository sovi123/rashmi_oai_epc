



/************************************************************************
 
     Name:     LTE-MAC layer
  
     Type:     C source file
  
     Desc:     C source code for Entry point fucntions
  
     File:     rg_sch_tom.c 
  
     Sid:      gk_sch_tom.c@@/main/2 - Sat Jul 30 02:21:51 2011
  
     Prg:      sd 
  
**********************************************************************/

/** @file rg_sch_tom.c 
@brief This module does processing related to handling of lower interface APIs 
invoked by PHY towards scheduler.
*/
static const char* RLOG_MODULE_NAME="MAC";
static int RLOG_FILE_ID=228;
static int RLOG_MODULE_ID=4096;

/* header include files -- defines (.h) */
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
#include "cm_lte.h"       /* common tokens */
#include "tfu.h"           /* RGU defines */
#include "lrg.h"           /* layer management defines for LTE-MAC */
#include "rgr.h"           /* layer management defines for LTE-MAC */
#include "rgm.h"           /* layer management defines for LTE-MAC */
#include "rg_env.h"        /* defines and macros for MAC */
#include "rg_sch_err.h"    /* defines and macros for MAC */
#include "rg_sch_inf.h"    /* defines and macros for MAC */
#include "rg_sch.h"        /* defines and macros for MAC */
#include "rg_sch_cmn.h"    /* typedefs for MAC */
#include "rl_interface.h"
#include "rl_common.h"


/* header/extern include files (.x) */
#include "gen.x"           /* general layer typedefs */
#include "ssi.x"           /* system services typedefs */
#include "cm5.x"           /* common timers */
#include "cm_hash.x"       /* common hash list */
#include "cm_lib.x"        /* common library */
#include "cm_llist.x"      /* common linked list */
#include "cm_mblk.x"       /* memory management */
#include "cm_tkns.x"       /* common tokens */
#include "cm_lte.x"       /* common tokens */
#include "tfu.x"           /* RGU types */
#include "lrg.x"           /* layer management typedefs for MAC */
#include "rgr.x"           /* layer management typedefs for MAC */
#include "rgm.x"           /* layer management typedefs for MAC */
#include "rg_sch_inf.x"    /* typedefs for Scheduler */
#include "rg_sch.x"        /* typedefs for MAC */
#include "rg_sch_cmn.x"    /* typedefs for MAC */

/* local defines */
#ifdef TIP_LOWER_L2
EXTERN S16 tipResetActTmr(RgSchUeCb *ue);
EXTERN Void tipTrackUeInactivity(RgSchUeCb *ue);
#endif

#ifdef CA_DBG

U32 gPCellTb1AckCount=0,gPCellTb2AckCount=0,gPCellTb1NackCount=0,gPCellTb2NackCount=0;
U32 gSCellSchedCount=0,gPrimarySchedCount=0;
U32 gSCellTb1AckCount=0,gSCellTb2AckCount=0,gSCellTb1NackCount=0,gSCellTb2NackCount=0;
U32 gPCellTb1DtxCount = 0, gPCellTb2DtxCount = 0, gSCellTb1DtxCount = 0, gSCellTb2DtxCount = 0;
U32 gHqFdbkCount = 0;

U32 gCqiRecpCount = 0;
U32 gCqiRecpPuschCount = 0;
U32 gCqiRcvdCount = 0;
Bool gF1bCsPres = FALSE;
U32  gRiReqCount = 0;
U32 gCqiReqCount = 0;
U32 gF1bCsCount = 0;
U32 gACqiRcvdCount = 0;
U32 gCqiReptToAppCount = 0;
U32 gRawACqiCount= 0;
extern U32 gCqiDropCount,gPucchDropCount;
U32 gDci0Count = 0;
U32 gUlCrcFailCount = 0;
U32 gUlCrcPassCount = 0;
U32 gPuschCqiDropCount = 0;
U32 gCaDbgCaFrmt = 0;
U32 gCaDbgNonCaFrmt = 0;
U32 gPcellZeroBoOcc=0,gScellZeroBoOcc=0;
#endif
/* local typedefs */
PUBLIC U32 rgBwAlloInfo[RGSCH_NUM_SUB_FRAMES]; /* Num of Rbs Allocated in each SF */ 
PUBLIC U32 rgBwAlcnt[RGSCH_NUM_SUB_FRAMES];   /*Num of times Allocation done in each Subframe */

/* local externs */
/* rg006.201: [ccpu000111706, ccpu00112394]: Separated UL and DL TTI
 * processing */
#ifdef LTE_L2_MEAS
   U64     glblTtiCnt = 0;
#endif
U32 ri1Cnt ;
U32 ri2Cnt ;  
U32 gDlNumUePerTti[20] = {0};
U32 gUlNumUePerTti[20] = {0};
PRIVATE S16 rgSCHTomUtlProcDlSf ARGS((
         RgSchDlSf        *dlSf,
         RgSchDlSf        *ulSf,
         RgSchCellCb      *cell,
         RgSchErrInfo     *err));
#ifdef RG_ULSCHED_AT_CRC
PRIVATE S16 rgSCHTomUtlProcDlSfAtCrc ARGS((
         RgSchDlSf        *ulSf,
	 CmLteTimingInfo  crntUlFrm,
         RgSchCellCb      *cell,
         RgSchErrInfo     *err));
#endif /* RG_ULSCHED_AT_CRC */
#ifdef LTE_TDD
#ifdef TFU_UPGRADE
PRIVATE S16 rgSCHTomUtlPrcUlTddSpclSf ARGS((
         RgSchCellCb        *cell,
         RgSchErrInfo       *err));
#endif /* TFU_UPGRADE */
#endif

PRIVATE S16 rgSCHTomUtlProcUlSf ARGS((
         RgSchCellCb      *cell,
         RgSchErrInfo     *err));

PRIVATE S16 rgSCHTomUtlFillPhich ARGS((
         RgSchCellCb     *cell,
         TfuCntrlReqInfo  *cntrlInfo,
         RgSchDlSf        *dlSf,
         RgSchErrInfo     *err));

PRIVATE S16 rgSCHTomUtlFillDlPdcch ARGS((
         RgSchCellCb      *cell,
         TfuCntrlReqInfo  *cntrlInfo,
         RgSchDlSf        *dlSf,
         RgSchErrInfo     *err));
PRIVATE S16 rgSCHTomUtlFillUlPdcch ARGS((
         RgSchCellCb       *cell,
         TfuCntrlReqInfo  *cntrlInfo,
         RgSchDlSf        *ulSf,
         RgSchErrInfo     *err));

PRIVATE S16 rgSCHTomUtlProcTA ARGS((
         RgSchCellCb      *cell));
#ifdef TFU_UPGRADE
PRIVATE S16 rgSCHTomUtlFillHqFdbkRecpReq ARGS((
         TfuRecpReqInfo   *recpReq,
         RgSchCellCb      *cell,
         U16              validIdx,
        RgSchErrInfo     *err));
#else
PRIVATE S16 rgSCHTomUtlFillHqFdbkRecpReq ARGS((
         TfuRecpReqInfo   *recpReq,
         RgSchCellCb      *cell,
         RgSchErrInfo     *err));
#endif
#ifdef TFU_UPGRADE
PRIVATE S16 rgSCHTomUtlDecodeRawCqi ARGS
(( 
 RgSchUeCb          *ueCb,
 TfuDlCqiRpt        *dlCqiRpt,
 TfuRawCqiRpt       *rawCqiRpt,
 CmLteTimingInfo    timingInfo,
 Bool               *skipPerCqiRpt
));

PRIVATE S16 rgSCHTomUtlDecodeRawAcqi ARGS
(( 
 RgSchCellCb        *cellCb,
 RgSchUeCb          *ueCb,
 TfuDlCqiPusch               *puschCqi,
 RgSchPuschRawCqiInfoPerCell *puschCqiBitWidth,
 TfuRawCqiRpt       *rawCqiRpt,
 U8                          cqiRiIdx,
 U8                          ri,
 U8                          *leastSignBit
));

PRIVATE Void rgSCHTomUtlDecodeRawAcqiPuschMode31 ARGS
((
 RgSchCellCb        *cellCb,
 RgSchUeCb          *ueCb,
 U8*                  revArray,
 RgSchCqiRawPuschMode31   *mode31Info,
 TfuCqiPuschMode31   *psMode31,
 U8                  ri,
 U32                 numTxAnt,
 RgSchUeACqiCb       *acqiCb,
 U8                  *leastSignBit
));
PRIVATE Void rgSCHTomUtlDecodeRawAcqiPuschMode12 ARGS
((
 RgSchUeCb          *ueCb,
 U8*                  revArray,
 RgSchCqiRawPuschMode12   *mode12Info,
 TfuCqiPuschMode12   *psMode12,
 U8                  ri,
 U32                 numTxAnt,
 RgSchUeACqiCb       *acqiCb,
 U8                  *leastSignBit
));
PRIVATE Void rgSCHTomUtlDecodeRawAcqiPuschMode22 ARGS
((
 RgSchUeCb          *ueCb,
 U8*                  revArray,
 RgSchCqiRawPuschMode22   *mode22Info,
 TfuCqiPuschMode22   *psMode22,
 U8                  ri,
 U32                 numTxAnt,
 RgSchUeACqiCb       *acqiCb,
 U8                  *leastSignBit
));

PRIVATE Void rgSCHTomUtlDecodeRawPcqiPucchMode21 ARGS
(( 
 U8*                 revArray,
 TfuCqiPucchMode21  *puMode21,
 TfuCqiPucchMode21    *mode21,
 U8*                   ri
));
PRIVATE S16 rgSCHTomUtlDecodeRawPcqi ARGS
(( 
 RgSchCellCb        *cellCb,
 RgSchUeCb          *ueCb,
 TfuDlCqiPucch      *pucchCqi,
 TfuRawCqiRpt       *rawCqiRpt,
 U8                 cqiRiIdx,
 Bool               *skipPerCqiRpt
));


PRIVATE S16 rgSCHTomFillOnlySrsRecpReq ARGS
((
 RgSchCellCb       *cell,
 RgSchUlAlloc      *alloc,
 TfuUeRecpReqInfo  *datRecpInfo
 ));

PRIVATE S16 rgSCHTomUtlFillCqiSrsWithSr ARGS
((
 RgSchCellCb       *cell,
 RgSchUeCb         *ue, 
 TfuRecpReqInfo    *recpReqInfo,
 TfuUeRecpReqInfo  *pucchRecpInfo,
 U16               validIdx
 ));

PRIVATE S16 rgSCHTomUtlFillCqiSrSrsWithHq ARGS
((
 RgSchCellCb         *cell,
 TfuRecpReqInfo      *recpReqInfo,
 RgSchUeCb           *ue,
 TfuUeRecpReqInfo    *pucchRecpInfo,
 U16                  validIdx,
 Bool                 isDatPresOnSecCell
 ));

PUBLIC S16 rgSCHTomUtlFillRiBitWidthInfo ARGS
((
 RgSchUeCb          *ueCb
));

PUBLIC U8 rgSCHTomUtlFetchPcqiBitSz ARGS
((
RgSchUeCb          *ueCb, 
U8                 numTxAnt,
U8                 *ri
));

PUBLIC U8 rgSCHTomUtlFetchPcqiBitSzPucchMode21 ARGS
((
RgSchUeCb          *ueCb, 
TfuCqiPucchMode21   *mode21Info,
U8                 numTxAnt,
U8                 *ri
));

PRIVATE S16 rgSCHTomUtlMoveNxtOccasion ARGS
((
RgSchCellCb        *cell,
RgSchUeCb          *ueCb,
U16                validIdx
));

PRIVATE S16 rgSCHTomUtlMovePcqiNxtOccasion ARGS
((
RgSchCellCb     *cell,
RgSchUeCb       *ue,
RgSchUePCqiCb   *cqiCb
));

PRIVATE S16 rgSCHTomUtlMovePriNxtOccasion ARGS
((
RgSchCellCb     *cell,
RgSchUeCb       *ue,
RgSchUePCqiCb   *riCb
));

PRIVATE S16 rgSCHTomUtlMoveSrNxtOccasion ARGS
((
RgSchCellCb     *cell,
RgSchUeCb       *ue
));

PRIVATE S16 rgSCHTomUtlMoveSrsNxtOccasion ARGS
((
RgSchCellCb     *cell,
RgSchUeCb       *ue
));

PRIVATE Bool rgSCHTomUtlFillDatHarqRecpReq ARGS
((
 RgSchCellCb       *cell,
 RgSchUlAlloc      *alloc,
 TfuUeRecpReqInfo  *datRecpInfo,
 TfuRecpReqInfo    *recpReqInfo
 ));

PRIVATE S16 rgSCHTomUtlFillDatAperRecpReq ARGS
((
RgSchCellCb       *cell,
U8                cqiReq,
RgSchUlAlloc      *alloc,
TfuUeRecpReqInfo  *datRecpInfo,
CmLteTimingInfo   *timeInfo,
Bool              hqPres,
U16               validIdx
));

PRIVATE S16 rgSCHTomUtlFillDatPriRecpReq ARGS
((
RgSchCellCb       *cell,
RgSchUlAlloc      *alloc,
TfuUeRecpReqInfo  *datRecpInfo,
CmLteTimingInfo   *timeInfo,
Bool              hqPres,
U16               validIdx
));

PRIVATE S16 rgSCHTomUtlFillDatPCqiRecpReq ARGS
((
RgSchCellCb       *cell,
RgSchUlAlloc      *alloc,
TfuUeRecpReqInfo  *datRecpInfo,
CmLteTimingInfo   *timeInfo,
Bool              hqPres,
U16               validIdx
));

PRIVATE S16 rgSCHTomUtlFillDatSrsRecpReq ARGS
((
RgSchCellCb       *cell,
RgSchUlAlloc      *alloc,
TfuUeRecpReqInfo  *datRecpInfo,
CmLteTimingInfo   *timeInfo,
Bool              hqPres
));


PRIVATE S16 rgSCHTomUtlFillSrRecpReq ARGS((
         TfuRecpReqInfo   *recpReq,
         RgSchCellCb      *cell,
         U16              validIdx,
         RgSchErrInfo     *err));

PRIVATE S16 rgSCHTomUtlWillUeRprtCqiRi ARGS((
         RgSchUeCb        *ue,
         Bool             *willueRprtCqiRii));

PRIVATE S16 rgSCHTomUtlFillRiRecpReq ARGS((
         TfuRecpReqInfo   *recpReq,
         RgSchCellCb      *cell,
         U16              validIdx,
         RgSchErrInfo     *err));

PRIVATE S16 rgSCHTomUtlFillPcqiRecpReq ARGS((
         TfuRecpReqInfo   *recpReq,
         RgSchCellCb      *cell,
         U16              validIdx,
         RgSchErrInfo     *err));

PRIVATE S16 rgSCHTomUtlFillSrsRecpReq ARGS((
         TfuRecpReqInfo   *recpReq,
         RgSchCellCb      *cell,
         U16              validIdx,
         RgSchErrInfo     *err));
         
PRIVATE S16 rgSCHTomUtlGenIndices ARGS((
         U32      label,
         U8        posM,
         U8        valN,
         U8        valK,
         TfuSubbandInfo*    sbInfo));

#endif 
#ifdef TFU_UPGRADE
PRIVATE S16 rgSCHTomUtlFillDatRecpReq ARGS((
         TfuRecpReqInfo   *recpReq,
         RgSchCellCb      *cell,
         U16              validIdx,
         RgSchErrInfo     *err));
#else
PRIVATE S16 rgSCHTomUtlFillDatRecpReq ARGS((
         TfuRecpReqInfo   *recpReq,
         RgSchCellCb      *cell,
         RgSchErrInfo     *err));
#endif

#ifdef LTE_TDD
#ifdef TFU_UPGRADE
PRIVATE S16 rgSCHTomUtlFillSfRepHqFdbk ARGS((
      TfuRecpReqInfo *recpReqInfo,
      RgSchCellCb    *cell,
      RgSchErrInfo   *err,
      RgSchDlSf      *dlSf,
      U8             noFdbks,
      CmMemListCp    *memCp,
      U8             elemIdx,
      RgSchDlSf      *nxtDlsf,
      U16              validIdx
     ));
#else
PRIVATE S16 rgSCHTomUtlFillSfRepHqFdbk ARGS((
      TfuRecpReqInfo *recpReqInfo,
      RgSchCellCb    *cell,
      RgSchErrInfo   *err,
      RgSchDlSf      *dlSf,
      U8             noFdbks,
      CmMemListCp    *memCp,
      U8             elemIdx,
      RgSchDlSf      *nxtDlsf
     ));
#endif
#ifdef TFU_UPGRADE
PRIVATE S16 rgSCHTomUtlFillSfHqFdbk ARGS((
      TfuRecpReqInfo *recpReqInfo,
      RgSchCellCb    *cell,
      RgSchErrInfo   *err,
      RgSchDlSf      *dlSf,
      U8             noFdbks,
      CmMemListCp    *memCp,
      U8             elemIdx,
      RgSchDlSf      *nxtDlsf,
      U16              validIdx
     ));
#else
PRIVATE S16 rgSCHTomUtlFillSfHqFdbk ARGS((
      TfuRecpReqInfo *recpReqInfo,
      RgSchCellCb    *cell,
      RgSchErrInfo   *err,
      RgSchDlSf      *dlSf,
      U8             noFdbks,
      CmMemListCp    *memCp,
      U8             elemIdx,
      RgSchDlSf      *nxtDlsf
     ));
#endif

PRIVATE S16 rgSCHTomUtlFillSfHqFdbkForOneUe ARGS((
      RgSchDlHqProcCb         *hqCb,
      TfuRecpReqInfo          *recpReqInfo,
      RgSchCellCb             *cellCb,
      RgSchErrInfo            *err,
      RgSchDlSf               *dlSf,
      U8                      noFdbks,
      CmMemListCp             *memCp,
      U8                      elemIdx,
      RgSchDlSf               *nxtDlsf,
      CmLteRnti               rnti,
      RgrTddAckNackMode       ackNackMode,
      RgSchUePucchRecpInfo    **pucchInfoRef,
      RgSchPdcch              *pdcch,
      TknU16                  n1PucchTkn,
      Bool                    *allocRef,
      U8                      hqSz
      ));
#endif
#ifdef LTEMAC_SPS
EXTERN PUBLIC Void rgSCHCmnDlSpsSch (RgSchCellCb *cell);
#ifndef LTE_TDD
#ifdef TFU_UPGRADE
PRIVATE S16 rgSCHTomCnsdrRelPdcch ARGS
((
 RgSchCellCb   *cell,
 RgSchDlSf       *dlSf,
 TfuRecpReqInfo          *recpReqInfo,
 U16 validIdx,
 RgSchErrInfo    *err
 ));
#else
 PRIVATE S16 rgSCHTomCnsdrRelPdcch ARGS
((
 RgSchCellCb   *cell,
 RgSchDlSf       *dlSf,
 TfuRecpReqInfo          *recpReqInfo,
 RgSchErrInfo    *err
 ));
#endif
#endif
#endif

PRIVATE Void rgSchTomTtiMiscFunctions ARGS
((
RgSchCellCb  *cell
));

PRIVATE Void rgSchTomTtiUlAndDlCmnChSch ARGS
((
RgSchCellCb  *cell
));

PRIVATE Void rgSchTomTtiDlSch ARGS
((
RgSchCellCb  *cell
));

PRIVATE Void rgSchTomTtiCnsldtSfAlloc ARGS
((
RgSchCellCb  *cell
));

PRIVATE Void rgSchTomTtiL1DlAndUlCfg ARGS
((
RgSchCellCb  *cell
));

#ifdef RGR_RRM_TICK   
PRIVATE Void rgSCHTomUtlSendSfnTick ARGS
((
RgSchCellCb  *cell
));
#endif

PRIVATE Void rgSchTomFillCellTtiInfo ARGS
((
TfuTtiIndInfo      *ttiInd,
Inst               schInst,
U8                 *nCell,
RgSchCellCb        *cells[]
));
#ifdef LTE_TDD
PRIVATE Void rgSchTomUtlTddRlsSfAndHarq ARGS
((
RgSchCellCb        *cell
));
PRIVATE Void rgSCHTomUtlProcTddUlSf ARGS
((
RgSchCellCb        *cell
));
#ifdef LTE_ADV
PRIVATE Void rgSCHTomUtlGethqRes ARGS
((
U8                      noFdbks,
RgSchDlSf               *dlSf,
RgSchPdcch              *pdcch,
RgSchCellCb             *cellCb,
U16                     *hqRes
));
PRIVATE Void rgSCHTomUtlFillSfHqFdbkForFrmt1BCSForM1 ARGS
((
 RgSchDlHqProcCb     *hqCb,
 TfuUePucchRecpReq   *hqRecpReq,
 U8                  noFdbks,
 RgSchDlSf           *dlSf,
 RgSchPdcch          *pdcch,
 RgSchCellCb         *cellCb
));
PRIVATE Void rgSCHTomUtlFillSfHqFdbkForFrmt1BCSForM234 ARGS
((
 RgSchDlHqProcCb         *hqCb,
 TfuUePucchRecpReq       *hqRecpReq,
 U8                      noFdbks,
 RgSchDlSf               *dlSf,
 RgSchPdcch              *pdcch,
 RgSchCellCb             *cellCb,
 U8                      elemIdx
));
#endif/*LTE_ADV*/
#endif/*LTE_TDD*/

PUBLIC U32 rgDlCqiRptCnt[16], rgTotDlCqiRpt;

/* forward references */
#ifdef TFU_UPGRADE
/*HARQ Feedback interpretation in accordance with Femto Forum.
Note: There is no value as '0' in Femto Forum Spec but in order to retain
the existing usage in MAC (and its Acceptance), its being considered*/
CONSTANT PRIVATE U8 rgSchTomHqFbkMap[8] = {0,1,0,0,4,4,4,4};
/*added #defines instead of magic numbers*/
CONSTANT PRIVATE U32 rgSCHTomBinCoe[RG_SCH_MAX_NUM_UE_SEL_SUBBANDS][RG_SCH_MAX_TOT_NUM_SUBBANDS]={
{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28},
{0,1,3,6,10,15,21,28,36,45,55,66,78,91,105,120,136,153,171,190,210,231,253,276,300,325,351,378},
{0,0,1,4,10,20,35,56,84,120,165,220,286,364,455,560,680,816,969,1140,1330,1540,1771,2024,2300,2600,2925,3276},
{0,0,0,1,5,15,35,70,126,210,330,495,715,1001,1365,1820,2380,3060,3876,4845,5985,7315,8855,10626,12650,14950,17550,20475},
{0,0,0,0,1,6,21,56,126,252,462,792,1287,2002,3003,4368,6188,8568,11628,15504,20349,26334,33649,42504,53130,65780,80730,98280},
{0,0,0,0,0,1,7,28,84,210,462,924,1716,3003,5005,8008,12376,18564,27132,38760,54264,74613,100947,134596,177100,230230,296010,376740}
};


/*ccpu00116923 - ADD - SRS present support*/
/*Tables Derived from 3GPP TS 36.211 Section 5.5.3.3 */
/* Table 5.5.3.3-1 */
#ifndef LTE_TDD
CONSTANT PUBLIC RgSchFddCellSpSrsSubfrmTbl rgSchFddCellSpSrsSubfrmTbl = {
   {TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE},
   {TRUE, FALSE, TRUE, FALSE, TRUE, FALSE, TRUE, FALSE, TRUE, FALSE},
   {FALSE, TRUE, FALSE, TRUE, FALSE, TRUE, FALSE, TRUE, FALSE, TRUE},
   {TRUE, FALSE, FALSE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE, FALSE},
   {FALSE, TRUE, FALSE, FALSE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE},
   {FALSE, FALSE, TRUE, FALSE, FALSE, FALSE, FALSE, TRUE, FALSE, FALSE},
   {FALSE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE, FALSE, TRUE, FALSE},
   {TRUE, TRUE, FALSE, FALSE, FALSE, TRUE, TRUE, FALSE, FALSE, FALSE},
   {FALSE, FALSE, TRUE, TRUE, FALSE, FALSE, FALSE, TRUE, TRUE, FALSE},
   {TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE},
   {FALSE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE},
   {FALSE, FALSE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE},
   {FALSE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE},
   {TRUE, TRUE, TRUE, TRUE, TRUE, FALSE, TRUE, FALSE, TRUE, FALSE},
   {TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, FALSE, TRUE, FALSE},
   {FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE}
};
#else
/* Table 5.5.3.3-2 */
CONSTANT PUBLIC RgSchTddCellSpSrsSubfrmTbl rgSchTddCellSpSrsSubfrmTbl = {
   {FALSE, TRUE, FALSE, FALSE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE},
   {FALSE, TRUE, TRUE, FALSE, FALSE, FALSE, TRUE, TRUE, FALSE, FALSE},
   {FALSE, TRUE, FALSE, TRUE, FALSE, FALSE, TRUE, FALSE, TRUE, FALSE},
   {FALSE, TRUE, FALSE, FALSE, TRUE, FALSE, TRUE, FALSE, FALSE, TRUE},
   {FALSE, TRUE, TRUE, TRUE, FALSE, FALSE, TRUE, TRUE, TRUE, FALSE},
   {FALSE, TRUE, TRUE, FALSE, TRUE, FALSE, TRUE, TRUE, FALSE, TRUE},
   {FALSE, TRUE, FALSE, TRUE, TRUE, FALSE, TRUE, FALSE, TRUE, TRUE},
   {FALSE, TRUE, TRUE, TRUE, TRUE, FALSE, TRUE, TRUE, TRUE, TRUE},
   {FALSE, TRUE, TRUE, FALSE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE},
   {FALSE, TRUE, FALSE, TRUE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE},
   {FALSE, TRUE, FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, FALSE, FALSE},
   {FALSE, TRUE, TRUE, FALSE, FALSE, FALSE, TRUE, FALSE, TRUE, FALSE},
   {FALSE, TRUE, FALSE, TRUE, FALSE, FALSE, TRUE, FALSE, FALSE, TRUE},
   {FALSE, TRUE, FALSE, FALSE, TRUE, FALSE, TRUE, TRUE, FALSE, FALSE},
   {FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE},
   {FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE}
};
#endif
PUBLIC S8 rgSchCmnAper20n22DiffCqi[4] = {1, 2, 3, 4};
PUBLIC S8 rgSchCmnAper30n31DiffCqi[4] = {0, 1, 2, -1};
#endif 

/**
 * @brief Handler for processing Random Access request indication 
 * recieved from PHY.
 *
 * @details
 *
 *     Function: rgSCHTomRaReqInd
 *
 *     Handler for processing Random Access request indication recieved from
 *     PHY.
 *
 *     Invoked by: RgLiTfuRaReqInd of LIM
 *
 *     Processing Steps: 
 *      - Validate the information received: cellId value and raRnti values
 *      - Process the request: Call rgSCHRamProcRaReq (cell, raRnti, raReqInd)
 *           
 *  @param[in] RgSchCellCb     *cell
 *  @param[in] TfuRaReqIndInfo *raReqInd
 *  @return  S16
 *      -# ROK 
 *      -# RFAILED 
 **/
#ifdef ANSI
PUBLIC S16 rgSCHTomRaReqInd
(
RgSchCellCb     *cell,
TfuRaReqIndInfo *raReqInd
)
#else
PUBLIC S16 rgSCHTomRaReqInd(cell, raReqInd)
RgSchCellCb     *cell; 
TfuRaReqIndInfo *raReqInd;
#endif
{
   S16           ret;
   U8            raRntiCnt;
   RgSchErrInfo  err;
   TRC2(rgSCHTomRaReqInd);

   if(cell->cellId != raReqInd->cellId)
   {
      err.errType    = RGSCHERR_TOM_RAREQIND;
      err.errCause   = RGSCHERR_TOM_INV_CELL_ID;
      RLOG_ARG3(L_ERROR,DBG_CELLID,cell->cellId, 
         "rgSCHTomRaReqInd(): No cell found with raReq cellId = (%d) errorType (%d)"
         " errorCause(%d)",raReqInd->cellId, err.errType, err.errCause);
      RETVALUE(RFAILED);
   } 

   for (raRntiCnt=0; raRntiCnt < raReqInd->nmbOfRaRnti; raRntiCnt++)
   {
#if (ERRCLASS & ERRCLS_DEBUG)
      if(raReqInd->rachInfoArr[raRntiCnt].raRnti > RGSCH_MAX_RA_RNTI)
      {
         RGSCHLOGERROR(cell->instIdx, ERRCLS_INT_PAR, ERG013, 
               (ErrVal)raReqInd->rachInfoArr[raRntiCnt].raRnti, 
               ("rgSCHTomRaReqInd(): raRnti  is out of range\n"));
         continue;
      }
#endif
      ret = rgSCHRamProcRaReq(cell, raReqInd->rachInfoArr[raRntiCnt].raRnti, 
            (TfuRachInfo *)&raReqInd->rachInfoArr[raRntiCnt],
            raReqInd->timingInfo, &err);
      if(ret == RFAILED)
      {
         err.errType = RGSCHERR_TOM_RAREQIND;
         RLOG_ARG3(L_ERROR,DBG_CELLID,cell->cellId,
            "RARNTI:%d rgSCHTomRaReqInd(): RAM processing failed errType(%d) "
            "errCause(%d)", raReqInd->rachInfoArr[raRntiCnt].raRnti, 
            err.errType, err.errCause);
         continue;
      }
   }
   RETVALUE(ROK);
}  /* rgSCHTomRaReqInd */


/**
 * @brief Handler for processing uplink CQI indication recieved from PHY.
 *
 * @details
 *
 *     Function: rgSCHTomUlCqiInd
 *
 *     Handler for processing uplink CQI indication recieved from PHY.
 *
 *     Invoked by: RgLiTfuUlCqiInd 
 *
 *     Processing Steps:
 *     - Gets UE
 *     - Invoke scheduler to push reported CQI info rgSCHUtlUlCqiInd 
 *           
 *  @param[in] RgSchCellCb     *cell
 *  @param[in] TfuUlCqiIndInfo *ulCqiInd
 *  @return  S16
 *      -# ROK 
 *      -# RFAILED 
 **/
#ifdef ANSI
PUBLIC S16 rgSCHTomUlCqiInd
( 
RgSchCellCb     *cell,
TfuUlCqiIndInfo *ulCqiInd
)
#else
PUBLIC S16 rgSCHTomUlCqiInd(cell, ulCqiInd)
RgSchCellCb     *cell; 
TfuUlCqiIndInfo *ulCqiInd;
#endif
{
   RgSchUeCb    *ue;
   CmLList      *node;
   TfuUlCqiRpt  *ulCqiInfo;
   TRC2(rgSCHTomUlCqiInd);

   node =  ulCqiInd->ulCqiRpt.first;
   if(cell->cellId != ulCqiInd->cellId)
   {
      RLOG_ARG1(L_ERROR,DBG_CELLID,cell->cellId,
         "rgSCHTomUlCqiInd() Unable to get the ulCqiInd cell with id(%d)", 
         ulCqiInd->cellId);
      RETVALUE(RFAILED);
   }

   for (;node; node=node->next)
   {
      ulCqiInfo = (TfuUlCqiRpt *)node->node;
#if (ERRCLASS & ERRCLS_DEBUG)
      if(ulCqiInfo->numSubband == 0)
      {
         RLOG_ARG1(L_ERROR,DBG_CELLID,cell->cellId,"Num Subband is"
            "out of range RNTI:%d",ulCqiInfo->rnti);
         continue;
      }
#endif
      if((ue = rgSCHDbmGetUeCb(cell, ulCqiInfo->rnti)) == NULLP)
      {
#ifdef LTEMAC_SPS
         if((ue = rgSCHDbmGetSpsUeCb(cell, ulCqiInfo->rnti)) == NULLP)
#endif
         {
            RLOG_ARG1(L_ERROR,DBG_CELLID,cell->cellId,"Unable to get "
                     "the ue for RNTI:%d", ulCqiInfo->rnti);
            continue;
         }
      }
      /* wideband cqi is directly reported now. and also isTxPort0 */
      rgSCHUtlUlCqiInd(cell, ue, ulCqiInfo);
   }
   RETVALUE(ROK);
}  /* rgSCHTomUlCqiInd */

/**
 * @brief Handler for processing PUCCH power adjustment indication
 *
 * @details
 *
 *     Function: rgSCHTomPucchDeltaPwrInd
 *
 *     Handler for processing PUCCH power adjustment indication
 *     received from PHY.
 *
 *     Invoked by: RgLiTfuPucchDeltaPwrInd 
 *
 *     Processing Steps:
 *     - Gets UE
 *     - Invoke scheduler to push reported CQI info rgSCHUtlPucchDeltaPwrInd 
 *           
 *  @param[in] RgSchCellCb             *cell
 *  @param[in] TfuPucchDeltaPwrIndInfo *pucchDeltaPwr
 *  @return  S16
 *      -# ROK 
 *      -# RFAILED 
 **/
#ifdef ANSI
PUBLIC S16 rgSCHTomPucchDeltaPwrInd
( 
RgSchCellCb             *cell,
TfuPucchDeltaPwrIndInfo *pucchDeltaPwr
)
#else
PUBLIC S16 rgSCHTomPucchDeltaPwrInd(cell, pucchDeltaPwr)
RgSchCellCb             *cell; 
TfuPucchDeltaPwrIndInfo *pucchDeltaPwr;
#endif
{
   RgSchUeCb       *ue;
   CmLList         *node;
   TfuPucchDeltaPwr  *ueElem;

   TRC2(rgSCHTomPucchDeltaPwrInd);

   if(cell->cellId != pucchDeltaPwr->cellId)
   {
      RLOG_ARG1(L_ERROR,DBG_CELLID,cell->cellId,
         "rgSCHTomPucchDeltaPwrInd() Unable to get the pucchDeltaPwr cell with id(%d)", 
         pucchDeltaPwr->cellId);
      RETVALUE(RFAILED);
   }

   node =  pucchDeltaPwr->pucchDeltaPwrLst.first;
   for (;node; node=node->next)
   {
      ueElem = (TfuPucchDeltaPwr *)node->node;
      if((ue = rgSCHDbmGetUeCb(cell, ueElem->rnti)) == NULLP)
      {
#ifdef LTEMAC_SPS 
         if((ue = rgSCHDbmGetSpsUeCb(cell, ueElem->rnti)) == NULLP)
#endif
         {
            RLOG_ARG1(L_ERROR,DBG_CELLID,cell->cellId,"RNTI:%d "
                     "rgSCHTomPucchDeltaPwrInd() Unable to get the ue ", 
                     ueElem->rnti);
            continue;
         }
      }
      rgSCHUtlPucchDeltaPwrInd(cell, ue, ueElem->pucchDeltaPwr);
   }
   RETVALUE(ROK);
}  /* rgSCHTomPucchDeltaPwrInd */

/**
 * @brief Handler for processing harq ACK/NACK indication recieved from PHY.
 *
 * @details
 *
 *     Function: rgSCHTomHarqAckInd
 *
 *     Handler for processing harq ACK/NACK indication recieved from PHY.
 *
 *     Invoked by: RgLiTfuHqInd
 *
 *     Processing Steps:
 *     For each HqAckInfo received
 *     - Get UE
 *     - If UE doesnt exist look for a RaCb and invoke rgSCHRamMsg4FdbkInd
 *     - Invoke HARQ module to pass HARQ-ACK info rgSCHDhmHqFdbkInd
 *           
 *  @param[in]  TfuHqIndInfo *harqAckInd
 *  @return  S16
 *      -# ROK 
 *      -# RFAILED 
 **/
#ifdef ANSI
PUBLIC S16 rgSCHTomHarqAckInd
(
RgSchCellCb     *cell,
TfuHqIndInfo    *harqAckInd
)
#else
PUBLIC S16 rgSCHTomHarqAckInd(cell, harqAckInd)
RgSchCellCb     *cell; 
TfuHqIndInfo    *harqAckInd;
#endif
{
   RgSchErrInfo    err;
   RgSchUeCb       *ue;
   RgSchRaCb       *raCb;
   CmLList         *node;
   TfuHqInfo       *hqInfo;
   Pst             pst;
#ifdef TFU_UPGRADE
   U8              tbCnt;
#endif 

   RgInfRlsHqInfo  *rlsHqBufs = &(cell->rlsHqArr[cell->crntHqIdx]);
#ifdef LTEMAC_SPS 
   RgSchDlHqEnt          *hqEnt = NULLP;
#endif
   U32            cellIdx;
   RgSchCellCb     *iterCellP; 
   
   TRC2(rgSCHTomHarqAckInd);

   if(cell->cellId != harqAckInd->cellId)
   {
      RLOG_ARG1(L_ERROR,DBG_CELLID,cell->cellId,"rgSCHTomHarqAckInd() Unable to get"
         " the cell for cellId (%d)", harqAckInd->cellId);
      err.errType = RGSCHERR_TOM_HARQACKIND;
      err.errCause = RGSCHERR_TOM_INV_CELL_ID;
      RETVALUE(RFAILED);
   }

   rlsHqBufs->numUes = 0;
   node =  harqAckInd->hqIndLst.first;
   for (;node; node=node->next)
   {
      hqInfo = (TfuHqInfo *)node->node;
#ifdef LTE_TDD
      if(hqInfo->hqFdbkMode != TFU_ACK_NACK_SPECIAL_BUNDLING)
      {
         /*ccpu00130520 - MOD - Avoiding the HqFdbk Mapping for special bundling case
           "hqFdbkMode" is given by CL, if its not it will be 0, so this loop will enter
           */
#endif 
         for(tbCnt=0; tbCnt<TFU_MAX_HARQ_FDBKS; tbCnt++)
         {
            hqInfo->isAck[tbCnt]=(TfuHqFdbk)rgSchTomHqFbkMap[hqInfo->isAck[tbCnt]];
         }
#ifdef LTE_TDD
      }
#endif/*LTE_TDD*/ 
      raCb = rgSCHDbmGetRaCb (cell, hqInfo->rnti);
      ue = rgSCHDbmGetUeCb (cell, hqInfo->rnti);
      if (ue == NULLP && raCb != NULLP)
      {
#ifdef LTEMAC_SPS 
         ue = rgSCHDbmGetSpsUeCb (cell, hqInfo->rnti);
         if (ue == NULLP)
    {
#endif
#ifdef RG_UNUSED
         rgSCHRamMsg4FdbkInd (raCb);
#endif
         if ((rgSCHDhmHqFdbkInd (raCb, RGSCH_HQ_FDB_IND_CB_TYPE_RA_CB, 
                     cell, harqAckInd->timingInfo, hqInfo, rlsHqBufs, &err)) != ROK)
         {
            err.errType = RGSCHERR_TOM_HARQACKIND;
            RLOG_ARG2(L_ERROR,DBG_CELLID,cell->cellId,"rgSCHTomHarqAckInd() HARQ"
               " feedback processing failed errType(%d) errCause(%d)", 
               err.errType, err.errCause); 
            continue;
         }
#ifdef LTEMAC_SPS
         }
         else /* UE found with SPS-RNTI */
         {
            if ((rgSCHDhmHqFdbkInd (ue, RGSCH_HQ_FDB_IND_CB_TYPE_HQ_ENT, 
                        cell, harqAckInd->timingInfo, hqInfo, rlsHqBufs, &err)) != ROK)
            {
               err.errType = RGSCHERR_TOM_HARQACKIND;
               RLOG_ARG2(L_ERROR,DBG_CELLID,cell->cellId,"rgSCHTomHarqAckInd() "
                  "HARQ feedback processing failed errType(%d)errCause(%d)n",
                  err.errType, err.errCause); 
               continue;
            }
         }
#endif /* LTEMAC_SPS */
         continue;
      }
      else if (ue != NULLP && raCb == NULLP)
      {
         /* Get the Downlink HARQ entity from ue */
         if ((rgSCHDhmHqFdbkInd (ue, RGSCH_HQ_FDB_IND_CB_TYPE_HQ_ENT, 
                     cell, harqAckInd->timingInfo, hqInfo, rlsHqBufs, &err)) != ROK)
         {
            err.errType = RGSCHERR_TOM_HARQACKIND;
            RLOG_ARG2(L_ERROR,DBG_CELLID,cell->cellId,"rgSCHTomHarqAckInd() "
               "HARQ feedback processing failed errType(%d)errCause(%d)n",
               err.errType, err.errCause);
            continue;
         }
      }
      else if (ue != NULLP && raCb != NULLP)
      {
         if ((rgSCHDhmHqFdbkInd (raCb, RGSCH_HQ_FDB_IND_CB_TYPE_RA_CB, 
                     cell, harqAckInd->timingInfo, hqInfo, rlsHqBufs, &err)) != ROK)
         {
            err.errType = RGSCHERR_TOM_HARQACKIND;
            RLOG_ARG2(L_ERROR,DBG_CELLID,cell->cellId,"rgSCHTomHarqAckInd() HARQ"
               " feedback processing failed errType(%d) errCause(%d).", 
               err.errType, err.errCause); 
            continue;
         }
      }
      else
      {
#ifdef LTEMAC_SPS 
         ue = rgSCHDbmGetSpsUeCb (cell, hqInfo->rnti);
         
         if ((ue == NULLP)||((hqEnt = RG_SCH_CMN_GET_UE_HQE(ue, cell)) == NULLP))
         {
#endif /* (LTEMAC_SPS & LTE_TDD) */
            RLOG_ARG1(L_ERROR,DBG_CELLID,cell->cellId,"RNTI:%d Unable to get the "
                     "UE CB or RA CB ", hqInfo->rnti);
            err.errType = RGSCHERR_TOM_HARQACKIND;
            continue;
#ifdef LTEMAC_SPS
         }
         else /* UE found with SPS-RNTI */
         {
            if ((rgSCHDhmHqFdbkInd (ue, RGSCH_HQ_FDB_IND_CB_TYPE_HQ_ENT, 
                        cell, harqAckInd->timingInfo, hqInfo, rlsHqBufs, &err)) != ROK)
            {
               err.errType = RGSCHERR_TOM_HARQACKIND;
               RLOG_ARG3(L_ERROR,DBG_CELLID,cell->cellId,"HARQ feedback processing "
                  "failed errType(%d) errCause(%d) RNTI:%d",err.errType, err.errCause,hqInfo->rnti);
               continue;
            }
         }
#endif /* LTEMAC_SPS */
      }
   }

   /* Check with TDD call DHM*/
   if ((rgSCHDhmRlsDlsfHqProc (cell, harqAckInd->timingInfo)) != ROK)
   {
      RLOG_ARG1(L_ERROR,DBG_CELLID,cell->cellId,"Unable to Release Downlink "
         "subframe for cellId (%d) ", harqAckInd->cellId);
      err.errType = RGSCHERR_TOM_HARQACKIND;
   }

   for (cellIdx = 0; cellIdx < CM_LTE_MAX_CELLS; cellIdx++)
   {
      if (NULLP != rgSchCb[cell->instIdx].cells[cellIdx])
      {
         iterCellP = rgSchCb[cell->instIdx].cells[cellIdx];

         rlsHqBufs = &(iterCellP->rlsHqArr[iterCellP->crntHqIdx]);
         if(rlsHqBufs->numUes)
         {
            rgSCHUtlGetPstToLyr(&pst, &rgSchCb[cell->instIdx], iterCellP->macInst);
            RgSchMacRlsHq (&pst, rlsHqBufs);
         }
         rlsHqBufs->numUes = 0;
      }
   }
   RETVALUE(ROK);
}  /* rgSCHTomHarqAckInd */


/**
 * @brief Handler for processing Scheduling Request indication 
 * recieved from PHY for a list of UEs.
 *
 * @details
 *
 *     Function: rgSCHTomSrInd
 *
 *     Handler for processing Scheduling Request indication recieved from PHY
 *     for UEs.
 *
 *     Invoked by: RgLiTfuSrInd
 *
 *     Processing Steps:
 *     - Get UE
 *     - Invoke scheduler to indicate SR rgSCHUtlSrRcvd 
 *           
 *  @param[in]  TfuSrIndInfo *srInd
 *  @return  S16
 *      -# ROK 
 *      -# RFAILED 
 **/
#ifdef ANSI
PUBLIC S16 rgSCHTomSrInd
(
RgSchCellCb     *cell,
TfuSrIndInfo    *srInd
)
#else
PUBLIC S16 rgSCHTomSrInd(cell, srInd)
RgSchCellCb     *cell; 
TfuSrIndInfo    *srInd;
#endif
{
   S16          ret = RFAILED;
   RgSchErrInfo err;
   RgSchUeCb    *ue;
   CmLList      *node;
   TfuSrInfo    *srInfo;

   TRC2(rgSCHTomSrInd);

   if(cell->cellId != srInd->cellId)
   {
      RLOG_ARG1(L_ERROR,DBG_CELLID,cell->cellId,"Unable to get the cell for srcInd cellId"
         ":%d ", srInd->cellId);
      err.errType = RGSCHERR_TOM_SRIND;
      err.errCause = RGSCHERR_TOM_INV_CELL_ID;
      RETVALUE(RFAILED);
   }


   node =  srInd->srLst.first;
   for (;node; node=node->next)
   {
      rgNumSrRecvd++;
	  
      srInfo = (TfuSrInfo *)node->node;
      ue = rgSCHDbmGetUeCb (cell, srInfo->rnti);
      if (ue == NULLP)
      {
         RLOG_ARG1(L_ERROR,DBG_CELLID,cell->cellId,"RNTI:%d Unable to get the UE CB",
            srInfo->rnti);
         continue;
      }
      rgSCHUtlHdlUlTransInd(cell, ue, srInd->timingInfo);
      /*Need to activate UE as SR received*/
      if (ue->isDrxEnabled)
      {
         rgSCHDrxSrInd(cell, ue);
      }
      ret = rgSCHUtlSrRcvd (cell, ue, srInd->timingInfo, &err);
      if (ret != ROK)
      {
         err.errType = RGSCHERR_TOM_SRIND;
         RLOG_ARG3(L_ERROR,DBG_CELLID,cell->cellId,"Scheduler processing failed "
             "errType(%d) errCause(%d) RNTI:%d", err.errType, err.errCause,srInfo->rnti);
         continue;
      }
   }
   RETVALUE(ret);
}  /* end of rgSCHTomSrInd */

/**
 * @brief Handler for processing downlink CQI indication recieved from 
 * PHY for a UE.
 *
 * @details
 *
 *     Function:  rgSCHTomDoaInd  
 *
 *     Handler for processing DOA recieved from PHY
 *     for a set of UEs.
 *
 *     Invoked by: RgLiTfuDoaInd
 *
 *     Processing Steps:
 *     - Get UE
 *     - Invoke scheduler to indicate DOA rgSCHUtlDoaInd
 *           
 *  @param[in]  TfuDoaIndInfo *doaInd
 *  @return  S16
 *      -# ROK 
 *      -# RFAILED 
 **/
#ifdef ANSI
PUBLIC S16 rgSCHTomDoaInd
(
RgSchCellCb     *cell,
TfuDoaIndInfo   *doaInd
)
#else
PUBLIC S16 rgSCHTomDoaInd(cell, doaInd )
RgSchCellCb     *cell;
TfuDoaIndInfo   *doaInd;
#endif
{
   RgSchUeCb    *ue;
   CmLList      *node;
   TfuDoaRpt    *doaInfo;
   TRC2(rgSCHTomDoaInd);

   if(cell->cellId != doaInd->cellId)
   {
      RLOG_ARG1(L_ERROR,DBG_CELLID,cell->cellId,"Unable to get the cell for doaInd cellId"
         ":%d", doaInd->cellId);
      RETVALUE(RFAILED);
   }


   node =  doaInd->doaRpt.first;
   for (;node; node=node->next)
   {
      doaInfo = (TfuDoaRpt *)node->node;
      ue = rgSCHDbmGetUeCb (cell, doaInfo->rnti);
      if (ue == NULLP)
      {
         RLOG_ARG1(L_ERROR,DBG_CELLID,cell->cellId,"RNTI:%d Unable to get the UE CB",
            doaInfo->rnti);
         continue;
      }
      rgSCHUtlDoaInd(cell, ue, doaInfo);
   }
   RETVALUE(ROK);
}  /* rgSCHTomDoaInd */
/**
 * @brief Handler for processing downlink CQI indication recieved from 
 * PHY for a UE.
 *
 * @details
 *
 *     Function: rgSCHTomDlCqiInd
 *
 *     Handler for processing downlink CQI indication recieved from PHY
 *     for a set of UEs.
 *
 *     Invoked by: RgLiTfuDlCqiInd
 *
 *     Processing Steps:
 *     - Get UE
 *     - Invoke scheduler to indicate DL CQI rgSCHUtlDlCqiInd
 *           
 *  @param[in]  TfuDlCqiIndInfo *dlCqiInd
 *  @return  S16
 *      -# ROK 
 *      -# RFAILED 
 **/
#ifdef ANSI
PUBLIC S16 rgSCHTomDlCqiInd
(
RgSchCellCb     *cell,
TfuDlCqiIndInfo *dlCqiInd
)
#else
PUBLIC S16 rgSCHTomDlCqiInd(cell, dlCqiInd)
RgSchCellCb     *cell;
TfuDlCqiIndInfo *dlCqiInd;
#endif
{
   RgSchUeCb    *ue;
   CmLList      *node;
   TfuDlCqiRpt  *dlCqiInfo;
   TRC2(rgSCHTomDlCqiInd);

   if(cell->cellId != dlCqiInd->cellId)
   {
      RLOG_ARG1(L_ERROR,DBG_CELLID,cell->cellId,"Unable to get the cell for cellId"
         ":%d", dlCqiInd->cellId);
      RETVALUE(RFAILED);
   }


   node =  dlCqiInd->dlCqiRptsLst.first;
   for (;node; node=node->next)
   {
      dlCqiInfo = (TfuDlCqiRpt *)node->node;
      ue = rgSCHDbmGetUeCb (cell, dlCqiInfo->rnti);
      if (ue == NULLP)
      {
         RLOG_ARG1(L_ERROR,DBG_CELLID,cell->cellId,"RNTI:%dUnable to get the UE CB",
            dlCqiInfo->rnti);
         continue;
      }
      rgSCHUtlDlCqiInd(cell, ue, dlCqiInfo, dlCqiInd->timingInfo);
      rgSCHUtlHdlUlTransInd(cell, ue, dlCqiInd->timingInfo);
   }
   RETVALUE(ROK);
}  /* rgSCHTomDlCqiInd */
#ifdef TFU_UPGRADE

/**
 * @brief Handler for moving PCQI instance for the next periodic occasion
 *
 * @details
 *
 *     Function: rgSCHTomUtlMovePcqiNxtOccasion
 *
 *     Handler for moving PCQI instance for the next periodic occasion
 *
 *     Invoked by: rgSCHTomUtlFill*
 *
 *     Processing Steps:
 *     - For a UE move its occurence instance to next occasion 
 *        depending on its periodicity 
 *     - Remove it from the current list and insert it to the list 
 *        having the index matching with the derived number. 
 *           
 *  @param[in]  RgSchCellCb     *cell,
 *               [in]        RgSchUeCb      *ue
 *  @return  S16
 *      -# ROK 
 *      -# RFAILED 
 **/
#ifdef ANSI
PRIVATE S16 rgSCHTomUtlMovePcqiNxtOccasion
(
 RgSchCellCb     *cell,
 RgSchUeCb      *ue,
 RgSchUePCqiCb   *cqiCb
 )
#else
PRIVATE S16 rgSCHTomUtlMovePcqiNxtOccasion(cell, ue, cqiCb)
   RgSchCellCb     *cell;
   RgSchUeCb      *ue;
   RgSchUePCqiCb   *cqiCb;
#endif
{
   U16   cqiIdx;

   CmLteTimingInfo timingInfo;
   TRC2(rgSCHTomUtlMovePcqiNxtOccasion);

   if(cqiCb->cqiCfg.cqiSetup.cqiRepType == RGR_UE_PCQI_SB_REP)
   {
#ifdef xLTE_TDD
      RG_SCH_ADD_TO_CRNT_TIME(cell->crntTime, timingInfo, TFU_DELTA);
#else
      RG_SCH_ADD_TO_CRNT_TIME(cell->crntTime, timingInfo,
            TFU_RECPREQ_DLDELTA);
#endif
      RG_SCH_ADD_TO_CRNT_TIME(timingInfo,timingInfo,cqiCb->cqiPeri);
      rgSCHTomUtlPcqiSbCalcBpIdx(timingInfo,ue,cqiCb); 
   }

   /* Compute Next Transmission Instance */ 
   cqiIdx = cqiCb->cqiPeri + cqiCb->nCqiTrIdx;
   cqiIdx = cqiIdx%RG_SCH_PCQI_SRS_SR_TRINS_SIZE;  
   /* Delete from current List and move to new list */ 
   if (NULLP == cmLListDelFrm(&cell->pCqiSrsSrLst[cqiCb->nCqiTrIdx].cqiLst,
            &cqiCb->cqiLstEnt))
   {
      RLOG_ARG1(L_ERROR,DBG_CELLID,cell->cellId,"RNTI:%d Unable to remove node",
         ue->ueId);
   }
   cqiCb->nCqiTrIdx = cqiIdx;
   cmLListAdd2Tail(&(cell->pCqiSrsSrLst[cqiCb->nCqiTrIdx].cqiLst), 
         &(cqiCb->cqiLstEnt));
#ifdef LTE_ADV
   rgSCHUtlSCellHndlCqiCollsn(cqiCb);
#endif

   RETVALUE(ROK);
}  /* rgSCHTomUtlMovePcqiNxtOccasion */

/**
 * @brief Handler for moving RI instance for the next periodic occasion
 *
 * @details
 *
 *     Function: rgSCHTomUtlMovePriNxtOccasion
 *
 *     Handler for moving PCQI instance for the next periodic occasion
 *
 *     Invoked by: rgSCHTomUtlFill*
 *
 *     Processing Steps:
 *     - For a UE move its occurence instance to next occasion 
 *        depending on its periodicity 
 *     - Remove it from the current list and insert it to the list 
 *        having the index matching with the derived number. 
 *           
 *  @param[in]  RgSchCellCb     *cell,
 *               [in]        RgSchUeCb      *ue
 *  @return  S16
 *      -# ROK 
 *      -# RFAILED 
 **/
#ifdef ANSI
PRIVATE S16 rgSCHTomUtlMovePriNxtOccasion
(
 RgSchCellCb    *cell,
 RgSchUeCb      *ue, 
 RgSchUePCqiCb  *riCb
 )
#else
PRIVATE S16 rgSCHTomUtlMovePriNxtOccasion(cell, ue, riCb)
 RgSchCellCb     *cell;
 RgSchUeCb       *ue;
 RgSchUePCqiCb   *riCb;
#endif
{
   U16   riIdx;
   U16   riDist=0;
   U16   effPeriodicity;
   U16   riTrInsTime;  
   U16   crntTime;
   U16   tempIdx; 

   TRC2(rgSCHTomUtlMovePriNxtOccasion);
   crntTime = (cell->crntTime.sfn * RGSCH_NUM_SUB_FRAMES)
      +(cell->crntTime.subframe);

   /* Compute Next Transmission Instance */ 
   if (riCb->cqiCfg.cqiSetup.cqiRepType == RGR_UE_PCQI_WB_REP)
   {
      effPeriodicity = riCb->cqiPeri * riCb->riPeri;
      tempIdx = effPeriodicity + riCb->nRiTrIdx;
   }
   else 
   {
      effPeriodicity = (riCb->h * riCb->cqiPeri * riCb->riPeri);
      /* In case of SFN wraparound, the SB CQI reporting cycle breaks
       * and RI->WB CQI->SBCQI.. should resume. RI is repositioned 
       * accordingly. WBCQI handling is naturally accomplished */
      if ((crntTime + TFU_RECPREQ_DLDELTA + effPeriodicity) > 
          (RGSCH_MAX_SUBFRM - 1))
      {
         riTrInsTime = (effPeriodicity - riCb->cqiOffset + riCb->riOffset) % effPeriodicity; 
         tempIdx = RGSCH_MAX_SUBFRM + (effPeriodicity - riTrInsTime);
         /*  In case of SFN wraparound, riDist should be distance from crntTime
          *  + TFU_RECPREQ_DLDELTA to tempIdx. Updating effPeriodicity 
          *  to make riDist calculation consistent for both SFN wraparound 
          *  case and normal case */
         effPeriodicity = tempIdx - TFU_RECPREQ_DLDELTA - crntTime;
      }
      else
      {
         tempIdx = effPeriodicity + riCb->nRiTrIdx;
      }
   }
   riIdx = tempIdx % RG_SCH_PCQI_SRS_SR_TRINS_SIZE;
   if (effPeriodicity >= RG_SCH_PCQI_SRS_SR_TRINS_SIZE)
   {
      riDist = rgSCHUtlFindDist((U16)(crntTime + TFU_RECPREQ_DLDELTA), 
      (U16)(crntTime + TFU_RECPREQ_DLDELTA + effPeriodicity));  
   }
   else
   {
      riDist = 0; 
   }

   /* ccpu00138306- If Periodicity is equal to Queue Size or multiple of it 
    * then the next occasion idx will be same as current Idx, Hence need not 
    * to delete and add 
    */
   if((effPeriodicity%RG_SCH_PCQI_SRS_SR_TRINS_SIZE) != 0)
   {
      /* Delete from current List and move to new list */ 
      if (NULLP == cmLListDelFrm(&cell->pCqiSrsSrLst[riCb->nRiTrIdx].riLst,
            &riCb->riLstEnt))
      {
         RLOG_ARG1(L_ERROR,DBG_CELLID,cell->cellId,"[%d]UEID:Unable to remove node",
            ue->ueId);
      }
      RG_SCH_RECORD(&riCb->histElem,RGSCH_ACTION_DEL, &cell->pCqiSrsSrLst[riCb->nRiTrIdx].riLst);
      cmLListAdd2Tail(&cell->pCqiSrsSrLst[riIdx].riLst, 
            &riCb->riLstEnt);
      RG_SCH_RECORD(&riCb->histElem,RGSCH_ACTION_ADD, &cell->pCqiSrsSrLst[riIdx].riLst);
   }
   else
   {
      if(riDist > 0) 
      {   
         riDist--;
      }
   }
   riCb->nRiTrIdx = riIdx;
   riCb->riDist = riDist;

#ifdef LTE_ADV
   rgSCHUtlSCellHndlRiCollsn(riCb);
#endif
   RETVALUE(ROK);
}  /* rgSCHTomUtlMovePriNxtOccasion */

/**
 * @brief Handler for moving SR instance for the next periodic occasion
 *
 * @details
 *
 *     Function: rgSCHTomUtlMoveSrNxtOccasion
 *
 *     Handler for moving SR instance for the next periodic occasion
 *
 *     Invoked by: rgSCHTomUtlFill*
 *
 *     Processing Steps:
 *     - For a UE move its occurence instance to next occasion 
 *        depending on its periodicity 
 *     - Remove it from the current list and insert it to the list 
 *        having the index matching with the derived number. 
 *           
 *  @param[in]  RgSchCellCb     *cell,
 *               [in]        RgSchUeCb      *ue
 *  @return  S16
 *      -# ROK 
 *      -# RFAILED 
 **/
#ifdef ANSI
PRIVATE S16 rgSCHTomUtlMoveSrNxtOccasion
(
 RgSchCellCb     *cell,
 RgSchUeCb      *ue
 )
#else
PRIVATE S16 rgSCHTomUtlMoveSrNxtOccasion(cell, ue)
   RgSchCellCb     *cell;
   RgSchUeCb      *ue;
#endif
{
   U16   srIdx;

   TRC2(rgSCHTomUtlMoveSrNxtOccasion);

   /* Compute Next Transmission Instance */ 
   srIdx = ue->srCb.peri + ue->srCb.nSrTrIdx;
   srIdx = srIdx%RG_SCH_PCQI_SRS_SR_TRINS_SIZE;  
   /* Delete from current List and move to new list */ 
   if (NULLP == cmLListDelFrm(&cell->pCqiSrsSrLst[ue->srCb.nSrTrIdx].srLst,
            &ue->srCb.srLstEnt))
   {
      RLOG_ARG1(L_ERROR,DBG_CELLID,cell->cellId,"RNTI:%d Unable to remove node",
         ue->ueId);
   }
   ue->srCb.nSrTrIdx = srIdx;
   cmLListAdd2Tail(&cell->pCqiSrsSrLst[ue->srCb.nSrTrIdx].srLst, 
         &ue->srCb.srLstEnt);

   RETVALUE(ROK);
}  /* rgSCHTomUtlMoveSrNxtOccasion */

/**
 * @brief Handler for moving SRS instance for the next periodic occasion
 *
 * @details
 *
 *     Function: rgSCHTomUtlMoveSrsNxtOccasion
 *
 *     Handler for moving SRS instance for the next periodic occasion
 *
 *     Invoked by: rgSCHTomUtlFill*
 *
 *     Processing Steps:
 *     - For a UE move its occurence instance to next occasion 
 *        depending on its periodicity 
 *     - Remove it from the current list and insert it to the list 
 *        having the index matching with the derived number. 
 *           
 *  @param[in]  RgSchCellCb     *cell,
 *               [in]        RgSchUeCb      *ue
 *  @return  S16
 *      -# ROK 
 *      -# RFAILED 
 **/
#ifdef ANSI
PRIVATE S16 rgSCHTomUtlMoveSrsNxtOccasion
(
 RgSchCellCb     *cell,
 RgSchUeCb      *ue
 )
#else
PRIVATE S16 rgSCHTomUtlMoveSrsNxtOccasion(cell, ue)
   RgSchCellCb     *cell;
   RgSchUeCb      *ue;
#endif
{
   U16   srsIdx;
   U16   srsDist;
   U16   tempIdx;
   U16   crntTime; 


   TRC2(rgSCHTomUtlMoveSrsNxtOccasion);
   crntTime = (cell->crntTime.sfn * RGSCH_NUM_SUB_FRAMES)
      +(cell->crntTime.subframe);

   /* Compute Next Transmission Instance */ 
   tempIdx = ue->srsCb.peri + ue->srsCb.nSrsTrIdx;
   srsIdx = tempIdx %RG_SCH_PCQI_SRS_SR_TRINS_SIZE;  
   if (ue->srsCb.peri > RG_SCH_PCQI_SRS_SR_TRINS_SIZE)
   {
      srsDist = rgSCHUtlFindDist((U16)(crntTime + TFU_RECPREQ_DLDELTA), 
      (U16)(crntTime + TFU_RECPREQ_DLDELTA + ue->srsCb.peri));  
   }
   else
   {
      srsDist =0; 
   }

   /* ccpu00138306- If Periodicity is equal to Queue Size or multiple of it 
    * then the next occasion idx will be same as current Idx, Hence need not 
    * to delete and add 
    */
   if((ue->srsCb.peri%RG_SCH_PCQI_SRS_SR_TRINS_SIZE) != 0)
   {
      /* Delete from current List and move to new list */ 
      if (NULLP == cmLListDelFrm(&cell->pCqiSrsSrLst[ue->srsCb.nSrsTrIdx].srsLst,
            &ue->srsCb.srsLstEnt))
      {
         RLOG_ARG1(L_ERROR,DBG_CELLID,cell->cellId,"RNTI:%d Unable to remove node",
            ue->ueId);
      }
      cmLListAdd2Tail(&cell->pCqiSrsSrLst[srsIdx].srsLst,
            &ue->srsCb.srsLstEnt);
   }
   else
   {
      if(srsDist > 0)
      {
         srsDist--; 
      }   
   }   
   ue->srsCb.nSrsTrIdx = srsIdx;
   ue->srsCb.srsDist = srsDist; 

   RETVALUE(ROK);
}  /* rgSCHTomUtlMoveSrsNxtOccasion */


/**
 * @brief Handler for processing RAW CQI indication recieved from 
 * PHY for a UE.
 *
 * @details
 *
 *     Function: rgSCHTomRawCqiInd
 *
 *     Handler for processing RAW CQI indication recieved from PHY
 *     for a set of UEs.
 *
 *     Invoked by: RgLiTfuRawCqiInd
 *
 *     Processing Steps:
 *     - Get UE
 *     - Invoke scheduler to indicate Raw CQI rgSCHUtlRawCqiInd
 *           
 *  @param[in]  TfuRawCqiIndInfo *rawCqiInd
 *  @return  S16
 *      -# ROK 
 *      -# RFAILED 
 **/
#ifdef ANSI
PUBLIC S16 rgSCHTomRawCqiInd
(
 RgSchCellCb     *cell,
 TfuRawCqiIndInfo *rawCqiInd
)
#else
PUBLIC S16 rgSCHTomRawCqiInd(cell, rawCqiInd)
   RgSchCellCb     *cell;
   TfuRawCqiIndInfo *rawCqiInd;
#endif
{
   RgSchUeCb    *ue;
   CmLList      *node;
   TfuRawCqiRpt* rawCqiInfo;

   TfuDlCqiRpt  dlCqiInfo;
   Bool         skipPerCqiRpt = FALSE;
   TRC2(rgSCHTomRawCqiInd);

   if(cell->cellId != rawCqiInd->cellId)
   {
      RLOG_ARG1(L_ERROR,DBG_CELLID,cell->cellId,"Unable to get the cell for cellId"
         ":%d", rawCqiInd->cellId);
      RETVALUE(RFAILED);
   }


   node =  rawCqiInd->rawCqiRpt.first;
   for (;node; node=node->next)
   {
      rawCqiInfo = (TfuRawCqiRpt *)node->node;
      ue = rgSCHDbmGetUeCb (cell, rawCqiInfo->crnti);
      if (ue == NULLP)
      {
         RLOG_ARG1(L_ERROR,DBG_CELLID,cell->cellId,"CRNTI:%d Unable to get the UECB",
            rawCqiInfo->crnti);
         continue;
      }
      U8     indx;
      U8     cqiRiIdx = 0;
      for(indx = ue->cqiRiReadIdx; 
            indx < (ue->cqiRiReadIdx + MAX_CQI_RI_RPT_BUFF); 
            indx++)
      {
         cqiRiIdx = indx % MAX_CQI_RI_RPT_BUFF;
         if((rawCqiInd->timingInfo.sfn == ue->rawCqiBitW[cqiRiIdx].recvTime.sfn) &&
               (rawCqiInd->timingInfo.subframe == ue->rawCqiBitW[cqiRiIdx].recvTime.subframe))
         {
            break;
         }
      }
      if(indx == (ue->cqiRiReadIdx + MAX_CQI_RI_RPT_BUFF))
      {
         RLOG_ARG1(L_ERROR,DBG_CELLID,cell->cellId,"ERR: Cqi time"
                  " not found CRNTI:%d",rawCqiInfo->crnti);
         continue;
      }

      ue->cqiRiReadIdx = cqiRiIdx;
      skipPerCqiRpt = FALSE;
      
      if (ROK != rgSCHTomUtlDecodeRawCqi(ue, &dlCqiInfo, rawCqiInfo, 
                              rawCqiInd->timingInfo, &skipPerCqiRpt))
      {
         continue;
      }
      if (!skipPerCqiRpt)
      {
         /* Skip sending recp req for those CQIs which
          * are invalidated due to aperRi != perRi */
#ifdef TIP_LOWER_L2
         /* As per TIP design, activity timer would be maintained for each UE.
          * If there is no CQI reported by UE for 5 seconds continuously UE would be released */
         tipResetActTmr(ue);
#endif
         rgSCHUtlDlCqiInd(cell, ue, &dlCqiInfo, rawCqiInd->timingInfo);
      }
      rgSCHUtlHdlUlTransInd(cell, ue, rawCqiInd->timingInfo);
      /* update the read index*/
      RG_SCH_INCR_CQIRI_INDEX(cqiRiIdx);
      ue->cqiRiReadIdx = cqiRiIdx;
   }
   RETVALUE(ROK);
}  /* rgSCHTomRawCqiInd */

/**
 * @brief Handler for processing SRS indication recieved from 
 * PHY for a UE.
 *
 * @details
 *
 *     Function: rgSCHTomSrsInd
 *
 *     Handler for SRS indication recieved from PHY
 *     for a set of UEs.
 *
 *     Invoked by: RgLiTfuSrsInd
 *
 *     Processing Steps:
 *     - Get UE
 *     - Invoke scheduler to indicate UL SRS  rgSCHUtlSrsInd
 *           
 *  @param[in]  TfuSrsIndInfo *srsInd
 *  @return  S16
 *      -# ROK 
 *      -# RFAILED 
 **/
#ifdef ANSI
PUBLIC S16 rgSCHTomSrsInd
(
 RgSchCellCb     *cell,
 TfuSrsIndInfo *srsInd
 )
#else
PUBLIC S16 rgSCHTomSrsInd(cell, srsInd)
   RgSchCellCb     *cell;
   TfuSrsIndInfo *srsInd;
#endif
{
   RgSchUeCb    *ue;
   CmLList      *node;
   TfuSrsRpt* srsInfo;

   TRC2(rgSCHTomSrsInd);

   if(cell->cellId != srsInd->cellId)
   {
      RLOG_ARG1(L_ERROR,DBG_CELLID,cell->cellId,"Unable to get the cell for cellId"
         ":%d", srsInd->cellId);
      RETVALUE(RFAILED);
   }

   node =  srsInd->srsRpt.first;
   for (;node; node=node->next)
   {
      srsInfo = (TfuSrsRpt *)node->node;
      ue = rgSCHDbmGetUeCb (cell, srsInfo->ueId);
      if (ue == NULLP)
      {
         RLOG_ARG1(L_ERROR,DBG_CELLID,cell->cellId,"RNTI:%d Unable to get the "
            "UE CB", srsInfo->ueId);
         continue;
      }
      rgSCHUtlSrsInd(cell, ue, srsInfo, srsInd->timingInfo);
      rgSCHUtlHdlUlTransInd(cell, ue, srsInd->timingInfo);
   }
   RETVALUE(ROK);
}  /* rgSCHTomSrsInd */

/**
 * @brief Function which decodes Raw PCQI Info and fills the DLCqiRpt.
 *
 * @details
 *
 *     Function: rgSCHTomUtlDecodeRawPcqi
 *
 *     Function which decodes Raw PCQI Info and fills the DLCqiRpt structure.
 *
 *     Invoked by: rgSCHTomUtlDecodeRawCqi 
 *
 *     Processing Steps:
 *     - Depending on the Raw PCQI Info stored during Reception Request
 *        decode the Raw PCQI Report 
 *     - Fill the DL CQI Report structure accordingly for the decoded Raw PCQI
 *           
 *  @param[in] RgSchCellCb     *cellCb
 *  @param[in] RgSchUeCb       *ueCb
 *  @param[out] TfuDlCqiPucch  *pucchCqi
 *  @param[in] TfuRawCqiRpt    *rawCqiRpt
 *  @param[in] Bool            *skipPerCqiRpt
 *  @return  S16
 *      -# ROK 
 *      -# RFAILED 
 **/
#ifdef ANSI
PRIVATE S16 rgSCHTomUtlDecodeRawPcqi
( 
 RgSchCellCb        *cellCb,
 RgSchUeCb          *ueCb,
 TfuDlCqiPucch      *pucchCqi,
 TfuRawCqiRpt       *rawCqiRpt,
 U8                 cqiRiIdx,
 Bool               *skipPerCqiRpt
 )
#else
PRIVATE S16 rgSCHTomUtlDecodeRawPcqi(cellCb, ueCb, pucchCqi, 
      rawCqiRpt, cqiRiIdx, skipPerCqiRpt)
RgSchCellCb        *cellCb;
RgSchUeCb          *ueCb;
TfuDlCqiPucch      *pucchCqi;
TfuRawCqiRpt       *rawCqiRpt;
U8                 cqiRiIdx;
Bool               *skipPerCqiRpt;
#endif
{
   TfuCqiPucchMode10    *mode10, *puMode10;   
   TfuCqiPucchMode11    *mode11, *puMode11;   
   TfuCqiPucchMode20    *mode20, *puMode20;   
   TfuCqiPucchMode21    *mode21, *puMode21;

   CONSTANT U8 leastSignBit = 0;
   RgSchUePCqiCb *cqiCb = NULLP;

   TRC2(rgSCHTomUtlDecodeRawPcqi);

   /* MS_WORKAROUND for ccpu00123929 : This step looks irrelevant. Need to check */
   /* Reversal of CQI data from CL is not required*/
#if 1
#else
   cmMemcpy((U8 *)revArray, (U8 *)rawCqiRpt->cqiBits, TFU_MAX_CQI_BYTES);
#endif
   pucchCqi->cellIdx = RG_SCH_GET_SCELL_INDEX(ueCb, cellCb);
   switch(ueCb->rawCqiBitW[cqiRiIdx].u.pucch.pucchRawCqiInfo.mode)
   {
      case TFU_PUCCH_CQI_MODE10:
         {
            pucchCqi->mode = TFU_PUCCH_CQI_MODE10;
            puMode10 = &pucchCqi->u.mode10Info;
            mode10 = &ueCb->rawCqiBitW[cqiRiIdx].u.pucch.pucchRawCqiInfo.u.mode10Info;
            if (mode10->type == TFU_RPT_CQI)
            {
               cqiCb = &ueCb->cellInfo[ueCb->rawCqiBitW[ueCb->cqiRiReadIdx].u.pucch.sCellIdx]->cqiCb;
               if (cqiCb->invalidateCqi)
               {
                  *skipPerCqiRpt = TRUE;
                  RETVALUE(ROK);
               }
               puMode10->type = TFU_RPT_CQI;
               puMode10->u.cqi = (U8)rgSCHUtlParse(rawCqiRpt->cqiBits,
                     leastSignBit,(U8)(leastSignBit+mode10->u.cqi), (U8)TFU_MAX_CQI_BYTES);
               ++rgDlCqiRptCnt[puMode10->u.cqi];
               ++rgTotDlCqiRpt;
            }
            else if (mode10->type == TFU_RPT_RI)
            {
               puMode10->type = TFU_RPT_RI;
               puMode10->u.ri = (U8)(rgSCHUtlParse(&rawCqiRpt->ri[0],
                      (8-mode10->u.ri), 8, (U8)1) + 1);

               if(puMode10->u.ri == 1)
               {
                  ri1Cnt++;
               }   
               else if(puMode10->u.ri == 2)
               {
                  ri2Cnt++;
               }   

            }
         }
         break;

      case TFU_PUCCH_CQI_MODE11:
         {
            pucchCqi->mode = TFU_PUCCH_CQI_MODE11;
            puMode11 = &pucchCqi->u.mode11Info;
            mode11 = &ueCb->rawCqiBitW[cqiRiIdx].u.pucch.pucchRawCqiInfo.u.mode11Info;
            if (mode11->type == TFU_RPT_CQI)
            {
               cqiCb = &ueCb->cellInfo[ueCb->rawCqiBitW[ueCb->cqiRiReadIdx].u.pucch.sCellIdx]->cqiCb;
               if (cqiCb->invalidateCqi)
               {
                  *skipPerCqiRpt = TRUE;
                  RETVALUE(ROK);
               }
               puMode11->type = TFU_RPT_CQI;
               puMode11->u.cqi.cqi = (U8)rgSCHUtlParse(rawCqiRpt->cqiBits,
                     leastSignBit, (U8)(leastSignBit+mode11->u.cqi.cqi), (U8)TFU_MAX_CQI_BYTES);
               if (mode11->u.cqi.wideDiffCqi.pres)
               {
                  puMode11->u.cqi.wideDiffCqi.pres = TRUE;
                  puMode11->u.cqi.wideDiffCqi.val = 
                     (U8 )rgSCHUtlParse(rawCqiRpt->cqiBits,(U8)(leastSignBit+mode11->u.cqi.cqi),
                      (U8)(leastSignBit+(mode11->u.cqi.cqi+mode11->u.cqi.wideDiffCqi.val)),
                      (U8)TFU_MAX_CQI_BYTES);
                  puMode11->u.cqi.pmi = (U8)rgSCHUtlParse(rawCqiRpt->cqiBits,
                   (U8)(leastSignBit+(mode11->u.cqi.cqi+mode11->u.cqi.wideDiffCqi.val)),
                   (U8)(leastSignBit+(mode11->u.cqi.cqi+mode11->u.cqi.wideDiffCqi.val+
                   mode11->u.cqi.pmi)),(U8)TFU_MAX_CQI_BYTES);
               }
               else
               {
                  puMode11->u.cqi.wideDiffCqi.pres = FALSE;
                  puMode11->u.cqi.pmi = (U8)rgSCHUtlParse(rawCqiRpt->cqiBits,
                   (U8)(leastSignBit+mode11->u.cqi.cqi),
                   (U8)(leastSignBit+(mode11->u.cqi.cqi+mode11->u.cqi.pmi)), 
                        (U8)TFU_MAX_CQI_BYTES);
               }
            }
            else if (mode11->type == TFU_RPT_RI)
            {
               puMode11->type = TFU_RPT_RI;
               puMode11->u.ri = (U8)(rgSCHUtlParse(&rawCqiRpt->ri[0],
                     (8-mode11->u.ri), 8, 1) + 1);
               if(puMode11->u.ri == 1)
               {
                  ri1Cnt++;
               }   
               else if(puMode11->u.ri == 2)
               {
                  ri2Cnt++;
               }   
            }
         }
         break;

      case TFU_PUCCH_CQI_MODE20:
         {
            pucchCqi->mode = TFU_PUCCH_CQI_MODE20;
            puMode20 = &pucchCqi->u.mode20Info;
            mode20 = &ueCb->rawCqiBitW[cqiRiIdx].u.pucch.pucchRawCqiInfo.u.mode20Info;
            if (mode20->type == TFU_RPT_CQI)
            {
               cqiCb = &ueCb->cellInfo[ueCb->rawCqiBitW[ueCb->cqiRiReadIdx].u.pucch.sCellIdx]->cqiCb;
               if (cqiCb->invalidateCqi)
               {
                  *skipPerCqiRpt = TRUE;
                  RETVALUE(ROK);
               }
               puMode20->type = TFU_RPT_CQI;
               if (mode20->u.cqi.isWideband)
               {
                  puMode20->u.cqi.isWideband = TRUE; 
                  puMode20->u.cqi.u.wideCqi = 
                   (U8)rgSCHUtlParse(rawCqiRpt->cqiBits,leastSignBit,
                   (U8)(leastSignBit+mode20->u.cqi.u.wideCqi),(U8)TFU_MAX_CQI_BYTES);
               }
               else
               {
                  puMode20->u.cqi.isWideband = FALSE; 
                  puMode20->u.cqi.u.subCqi.cqi = 
                  rgSCHUtlParse(rawCqiRpt->cqiBits,leastSignBit,
                  (U8)(leastSignBit+mode20->u.cqi.u.subCqi.cqi), (U8)TFU_MAX_CQI_BYTES);
                  puMode20->u.cqi.u.subCqi.l = 
                  rgSCHUtlParse(rawCqiRpt->cqiBits,
                    (U8)(leastSignBit+mode20->u.cqi.u.subCqi.cqi), 
                    (U8)(leastSignBit+(mode20->u.cqi.u.subCqi.cqi+ 
                     mode20->u.cqi.u.subCqi.l)), (U8)TFU_MAX_CQI_BYTES);
               }
            }
            else if (mode20->type == TFU_RPT_RI)
            {
               puMode20->type = TFU_RPT_RI;
               puMode20->u.ri = (U8)(rgSCHUtlParse(&rawCqiRpt->ri[0],
                     (8-mode20->u.ri), 8, 1)+1);
               if(puMode20->u.ri == 1)
               {
                  ri1Cnt++;
               }   
               else if(puMode20->u.ri == 2)
               {
                  ri2Cnt++;
               }   
            }
         }
         break;

      case TFU_PUCCH_CQI_MODE21:
         {
            pucchCqi->mode = TFU_PUCCH_CQI_MODE21;
            puMode21 = &pucchCqi->u.mode21Info;
            mode21 = &ueCb->rawCqiBitW[cqiRiIdx].u.pucch.pucchRawCqiInfo.u.mode21Info;
            if (mode21->type == TFU_RPT_CQI)
            {
               cqiCb = &ueCb->cellInfo[ueCb->rawCqiBitW[ueCb->cqiRiReadIdx].u.pucch.sCellIdx]->cqiCb;
               if (cqiCb->invalidateCqi)
               {
                  *skipPerCqiRpt = TRUE;
                  RETVALUE(ROK);
               }
            }
            rgSCHTomUtlDecodeRawPcqiPucchMode21(rawCqiRpt->cqiBits,puMode21,
                    mode21,&rawCqiRpt->ri[0]);
         }
         break;
      default:
         *skipPerCqiRpt = TRUE;
         break; 
   }
   RETVALUE(ROK);
}  /* rgSCHTomUtlDecodeRawPcqi */

/**
 * @brief Function which decodes Raw ACQI Info and fills the DLCqiRpt.
 *
 * @details
 *
 *     Function: rgSCHTomUtlDecodeRawACqi
 *
 *     Function which decodes Raw ACQI Info and fills the DLCqiRpt structure.
 *
 *     Invoked by: rgSCHTomUtlDecodeRawCqi 
 *
 *     Processing Steps:
 *     - Depending on the Raw ACQI Info stored during Reception Request
 *        decode the Raw CQI Report 
 *     - Fill the DL CQI Report structure accordingly for the decoded Raw ACQI
 *           
 *  @param[in] RgSchCellCb     *cellCb
 *  @param[in] RgSchUeCb       *ueCb
 *  @param[out] TfuDlCqiPusch  *puschCqi
 *  @param[in] TfuRawCqiRpt     *rawCqiRpt
 *  @return  S16
 *      -# ROK 
 *      -# RFAILED 
 **/
#ifdef ANSI
PRIVATE S16 rgSCHTomUtlDecodeRawAcqi
( 
 RgSchCellCb        *cellCb,
 RgSchUeCb          *ueCb,
 TfuDlCqiPusch               *puschCqi,
 RgSchPuschRawCqiInfoPerCell *puschCqiBitWidth,
 TfuRawCqiRpt       *rawCqiRpt,
 U8                          cqiRiIdx,
 U8                          ri,
 U8                          *leastSignBit
 )
#else
PRIVATE S16 rgSCHTomUtlDecodeRawAcqi(cellCb, sCellIdx, ueCb, puschCqi, 
      puschCqiBitWidth, rawCqiRpt, cqiRiIdx, leastSignBit)
RgSchCellCb        *cellCb;
RgSchUeCb          *ueCb;
TfuDlCqiPusch                *puschCqi;
RgSchPuschRawCqiInfoPerCell  *puschCqiBitWidth,
TfuRawCqiRpt       *rawCqiRpt;
U8                 cqiRiIdx;
U8                           ri;
U8                           *leastSignBit;
#endif
{
   RgSchCqiRawPuschMode12   *mode12Info;    
   RgSchCqiRawPuschMode20   *mode20Info;    
   RgSchCqiRawPuschMode22   *mode22Info;   
   RgSchCqiRawPuschMode30   *mode30Info;    
   RgSchCqiRawPuschMode31   *mode31Info;
   TfuCqiPuschMode12   *psMode12;    
   TfuCqiPuschMode20   *psMode20;    
   TfuCqiPuschMode22   *psMode22;   
   TfuCqiPuschMode30   *psMode30;    
   TfuCqiPuschMode31   *psMode31;    
   U8 loop, sbOffst, indx;
   U32 label =0, numTxAnt =0;
   U8 diffCqiVal;
   RgSchUeACqiCb *acqiCb = RG_SCH_CMN_GET_ACQICB(ueCb,cellCb);

   TRC2(rgSCHTomUtlDecodeRawAcqi);

   indx = TFU_MAX_CQI_BYTES-1; 
   numTxAnt = cellCb->numTxAntPorts;
   puschCqi->cellIdx = RG_SCH_GET_SCELL_INDEX(ueCb, cellCb);
   if((ueCb->mimoInfo.txMode != RGR_UE_TM_3) && 
         (ueCb->mimoInfo.txMode != RGR_UE_TM_4))
   {
      ri = 1;
   }
   else
   {
      puschCqi->ri.pres = TRUE;
      puschCqi->ri.val = ri;
   }      
   switch(puschCqiBitWidth->puschRawCqiInfo.mode)
   {
      case TFU_PUSCH_CQI_MODE_12:
         {
            puschCqi->mode = TFU_PUSCH_CQI_MODE_12;
            psMode12 = &puschCqi->u.mode12Info;
            mode12Info = &puschCqiBitWidth->puschRawCqiInfo.u.mode12Info;
            rgSCHTomUtlDecodeRawAcqiPuschMode12(ueCb,rawCqiRpt->cqiBits,
                             mode12Info,psMode12,ri,numTxAnt,acqiCb,leastSignBit);
         }
         break;

      case TFU_PUSCH_CQI_MODE_20:
         {
            puschCqi->mode = TFU_PUSCH_CQI_MODE_20;
            psMode20 = &puschCqi->u.mode20Info;
            psMode20->numSubband = acqiCb->M;
            mode20Info = &puschCqiBitWidth->puschRawCqiInfo.u.mode20Info;
            psMode20->wideBandCqi= rgSCHUtlParse(rawCqiRpt->cqiBits,
                  *leastSignBit, (U8)(*leastSignBit+mode20Info->wideBCqiCw), TFU_MAX_CQI_BYTES);
            psMode20->cqiIdx = rgSCHUtlParse(rawCqiRpt->cqiBits,
                  (U8)(*leastSignBit+mode20Info->wideBCqiCw),
                  (U8)(*leastSignBit+(mode20Info->wideBCqiCw+mode20Info->subBandDiffCqi)), 
                  TFU_MAX_CQI_BYTES);
            /*Extract and Store Pos of M selected Subbands */
            label = rgSCHUtlParse(rawCqiRpt->cqiBits,\
                  (U8)(*leastSignBit+ (mode20Info->wideBCqiCw+mode20Info->subBandDiffCqi)), 
                  (U8)(*leastSignBit+ (mode20Info->wideBCqiCw+mode20Info->subBandDiffCqi+
                         mode20Info->posOfM)), TFU_MAX_CQI_BYTES);
               /*Arg-5 has been not been casted to TfuSubbandInfo as this is  
                * defined only under MIMO */
            RGSCH_ARRAY_BOUND_CHECK(ueCb->cell->instIdx, psMode20->subbandArr, acqiCb->M);
            rgSCHTomUtlGenIndices(label, acqiCb->M, 
                  acqiCb->N, acqiCb->k, psMode20->subbandArr);
            *leastSignBit += (mode20Info->wideBCqiCw+mode20Info->subBandDiffCqi + mode20Info->posOfM);
         }
         break;

      case TFU_PUSCH_CQI_MODE_22:
         {
            puschCqi->mode = TFU_PUSCH_CQI_MODE_22;
            psMode22 = &puschCqi->u.mode22Info;
            mode22Info = &puschCqiBitWidth->puschRawCqiInfo.u.mode22Info;
            rgSCHTomUtlDecodeRawAcqiPuschMode22(ueCb,rawCqiRpt->cqiBits,
                             mode22Info,psMode22,ri,numTxAnt,acqiCb,leastSignBit);
         }
         break;

      case TFU_PUSCH_CQI_MODE_30:
         {
            puschCqi->mode = TFU_PUSCH_CQI_MODE_30;
            psMode30 = &puschCqi->u.mode30Info;
            mode30Info = &puschCqiBitWidth->puschRawCqiInfo.u.mode30Info;
            psMode30->wideBandCqi = rgSCHUtlParse(rawCqiRpt->cqiBits,
                  *leastSignBit, (U8)(*leastSignBit+mode30Info->wideBCqiCw), TFU_MAX_CQI_BYTES);
            psMode30->numSubband = acqiCb->N; 
            sbOffst = *leastSignBit+mode30Info->wideBCqiCw;
            for(loop =0; loop<mode30Info->totLenSbDiffCqi/2; loop++)
            {
               diffCqiVal = rgSCHUtlParse(rawCqiRpt->cqiBits,sbOffst,
                        (U8)(sbOffst+2), (U8)TFU_MAX_CQI_BYTES);
               psMode30->subbandArr[loop].cqi = psMode30->wideBandCqi + 
                                     rgSchCmnAper30n31DiffCqi[diffCqiVal];
               sbOffst+=2;
               psMode30->subbandArr[loop].subBand.rbStart = 
                  acqiCb->k * loop;
               psMode30->subbandArr[loop].subBand.numRb = acqiCb->k;
            }
            /* ccpu00141110- numRb is not k for all the subbands. 
             * Last dificit SB will have less than k*/
            if(cellCb->bwCfg.dlTotalBw < acqiCb->k * loop)
            {
               psMode30->subbandArr[loop-1].subBand.numRb = 
                 cellCb->bwCfg.dlTotalBw - (acqiCb->k * (loop-1));
            }
            *leastSignBit = sbOffst;
#ifdef CA_DBG
            {
               extern U32 gRawACqiCount;
               gRawACqiCount++;
            }
#endif
         }
         break;

      case TFU_PUSCH_CQI_MODE_31:
         {
            puschCqi->mode = TFU_PUSCH_CQI_MODE_31;
            psMode31 = &puschCqi->u.mode31Info;
            mode31Info =  &puschCqiBitWidth->puschRawCqiInfo.u.mode31Info;
            rgSCHTomUtlDecodeRawAcqiPuschMode31(cellCb,ueCb,rawCqiRpt->cqiBits,
                             mode31Info,psMode31,ri,numTxAnt,acqiCb,leastSignBit);
            
         }
         break;
      default:
         break; 
   }
   RETVALUE(ROK);
}  /* rgSCHTomUtlDecodeRawAcqi */

/**
 * @brief Function which decodes Raw CQI Info and fills the DLCqiRpt.
 *
 * @details
 *
 *     Function: rgSCHTomUtlDecodeRawCqi
 *
 *     Function which decodes Raw CQI Info and fills the DLCqiRpt structure.
 *
 *     Invoked by: rgSCHTomRawCqiInd 
 *
 *     Processing Steps:
 *     - Depending on the Raw CQI Info stored during Reception Request
 *        decode the Raw CQI Report 
 *     - Fill the DL CQI Report structure accordingly for the decoded Raw CQI
 *           
 *  @param[in] RgSchCellCb     *cell
 *  @param[in] TfuUlCqiIndInfo *ulCqiInd
 *  @return  S16
 *      -# ROK 
 *      -# RFAILED 
 **/
#ifdef ANSI
PRIVATE S16 rgSCHTomUtlDecodeRawCqi
( 
 RgSchUeCb          *ueCb,
 TfuDlCqiRpt           *dlCqiRpt,
 TfuRawCqiRpt      *rawCqiRpt,
 CmLteTimingInfo    timingInfo,
 Bool               *skipPerCqiRpt
 )
#else
PRIVATE S16 rgSCHTomUtlDecodeRawCqi(ueCb, dlCqiRpt, 
rawCqiRpt, timingInfo, skipPerCqiRpt)
   RgSchUeCb         *ueCb;
   TfuDlCqiRpt       *dlCqiRpt;
   TfuRawCqiRpt      *rawCqiRpt;
   CmLteTimingInfo   timingInfo;
   Bool              *skipPerCqiRpt;
#endif
{
   RgSchCellCb  *sCellCb = NULLP;
   TRC2(rgSCHTomUtlDecodeRawCqi);

   if (ueCb->rawCqiBitW[ueCb->cqiRiReadIdx].type == TFU_RECP_REQ_PUCCH)
   {
      dlCqiRpt->rnti = rawCqiRpt->crnti;
      dlCqiRpt->isPucchInfo = TRUE;
      sCellCb = ueCb->cellInfo[ueCb->rawCqiBitW[ueCb->cqiRiReadIdx].u.pucch.sCellIdx]->cell;
      rgSCHTomUtlDecodeRawPcqi(sCellCb, ueCb, &dlCqiRpt->dlCqiInfo.pucchCqi, rawCqiRpt, \
            ueCb->cqiRiReadIdx, skipPerCqiRpt);
   }
   else if(ueCb->rawCqiBitW[ueCb->cqiRiReadIdx].type == TFU_RECP_REQ_PUSCH)
   {
      U8 leastSignBit = 0;
      U32 idx;
      dlCqiRpt->rnti = rawCqiRpt->crnti;
      dlCqiRpt->isPucchInfo = FALSE;
      dlCqiRpt->dlCqiInfo.pusch.numOfCells = ueCb->rawCqiBitW[ueCb->cqiRiReadIdx].u.pusch.numOfCells;
      for (idx = 0; idx < dlCqiRpt->dlCqiInfo.pusch.numOfCells; idx++)
      {
         sCellCb = ueCb->cellInfo[ueCb->rawCqiBitW[ueCb->cqiRiReadIdx].u.pusch.\
                   cqiBitWidth[idx].sCellIdx]->cell;
         rgSCHTomUtlDecodeRawAcqi(sCellCb, ueCb, &dlCqiRpt->dlCqiInfo.pusch.puschCqi[idx], \
               &ueCb->rawCqiBitW[ueCb->cqiRiReadIdx].u.pusch.cqiBitWidth[idx], \
               rawCqiRpt, ueCb->cqiRiReadIdx, (rawCqiRpt->ri[idx] + 1), &leastSignBit);
      }
   }
   else
   {
      RETVALUE(RFAILED);
   }
   
   RETVALUE(ROK);
}  /* rgSCHTomUtlDecodeRawCqi */

/*
*
*       Fun:   rgSCHTomUtlGenIndices
*
*       Desc:  This function reconstructs the Subband Indices for
*       of M selected Subbands conveyed by the UE for APeriodic Modes
*       2-0 and 2-2. It decodes the Label which uniquely encodes M out
*       of N subbands.
*                   
*
*       Ret:   ROK
*
*       Notes: None
*
*       File:  rg_sch_utl.c
*
*/
#ifdef ANSI
PRIVATE S16 rgSCHTomUtlGenIndices
(
 U32      label,
 U8        posM,
 U8        valN,
 U8        valK,
 TfuSubbandInfo*    sbInfo
 )
#else
PRIVATE S16 rgSCHTomUtlGenIndices(label, posM, valN, valK, sbInfo)
   U32      label;
   U8        posM;
   U8        valN;
   U8        valK;
   TfuSubbandInfo*    sbInfo;
#endif
{
   U8 idx, kval, xval, xmin;
   U32 binCoe;
   xmin =1;
   for(kval=0; kval<posM;kval++)
   {
      xval = xmin;
      RGSCH_ARRAY_BOUND_CHECK_WITH_POS_IDX(0, rgSCHTomBinCoe, (posM-kval-1));
      RGSCH_ARRAY_BOUND_CHECK_WITH_POS_IDX(0, rgSCHTomBinCoe[posM-kval-1], (valN-xval-1));
      binCoe = rgSCHTomBinCoe[posM-kval-1][valN-xval-1];
      while(binCoe>label)
      {
         xval = xval+1;
         RGSCH_ARRAY_BOUND_CHECK_WITH_POS_IDX(0, rgSCHTomBinCoe[posM-kval-1], (valN-xval-1));
         binCoe = rgSCHTomBinCoe[posM-kval-1][valN-xval-1];
      }
      idx = xval;
      sbInfo[kval].numRb = valK;
      sbInfo[kval].rbStart = idx*valK;
      xmin = idx+1;
      label = label-binCoe;
   }
   RETVALUE(ROK);
} /* end of rgSCHTomUtlGenIndices*/
#endif 
/**
 * @brief Handler for processing decode failure indication recieved from 
 * PHY for a UE.
 *
 * @details
 *
 *     Function: rgSCHTomCrcInd
 *
 *     Handler for processing decode failure indication recieved from 
 *     PHY for a set of UEs.
 *
 *     Invoked by: RgLiTfuCrcInd of rg_sch.x 
 *
 *     Processing Steps:
 *     - Validate the information received and retrieve cell and ue.
 *     - Process Decode failure Indication: Call rgSCHUhmProcHqFailure().
 *           
 *  @param[in]  TfuCrcIndInfo *crcInd
 *  @return  S16
 *      -# ROK 
 *      -# RFAILED 
 **/
#ifdef ANSI
PUBLIC S16 rgSCHTomCrcInd
(
RgSchCellCb       *cell,
TfuCrcIndInfo *crcInd
)
#else
PUBLIC S16 rgSCHTomCrcInd(cell, crcInd)
RgSchCellCb       *cell;
TfuCrcIndInfo *crcInd;
#endif
{
   RgSchUeCb      *ue;
   RgSchRaCb      *raCb = NULLP;
   CmLList        *node;
   TfuCrcInfo     *crcInfo;
#ifdef RG_ULSCHED_AT_CRC
   RgSchErrInfo    err;
   RgSchDlSf       *ulSf;
   CmLteTimingInfo crntHiDci0Frm;
   RgSchCmnUlCell  *cellUl; 
#ifdef LTE_TDD
   U8              Mval;
   U8              idx;
#endif
#endif
#ifdef LTE_TDD
   RgSchUlHqProcCb   *hqProc;
#endif

#ifdef LTE_L2_MEAS
   RgSchUlHqProcCb   *ulHqProc;
#endif   

   TRC2(rgSCHTomCrcInd);

   if(cell->cellId != crcInd->cellId)
   {
      RLOG_ARG1(L_ERROR,DBG_CELLID,cell->cellId,"Unable to get the cell for cellId"
         ":%d", crcInd->cellId);
      RETVALUE(RFAILED);
   }
#ifdef RG_ULSCHED_AT_CRC
#ifndef LTE_ADV
   {
      static CmLteTimingInfo lastCrc = {2000,0};
      CmLteTimingInfo crntCrc = cell->crntTime;
      if (RGSCH_TIMEINFO_SAME(lastCrc, crntCrc))
      {
         /*Removed the WA to drop 2nd CRC*/
         RLOG_ARG2(L_ERROR,DBG_CELLID,cell->cellId,"Recieved CRC "
            "twice per TTI @(%u,%u)", cell->crntTime.sfn,
            cell->crntTime.subframe);
      }
      lastCrc = crntCrc;
   }
#endif
#endif
   node =  crcInd->crcLst.first;
   for (;node; node=node->next)
   {
      crcInfo = (TfuCrcInfo*)node->node;
      ue = rgSCHDbmGetUeCb (cell, crcInfo->rnti);
      if (ue == NULLP)
      {
#ifdef LTEMAC_SPS
         /* Fetch from SPS List */
         ue = rgSCHDbmGetSpsUeCb(cell, crcInfo->rnti);
         if (ue == NULLP)         
#endif 
         {
            raCb = rgSCHDbmGetRaCb (cell, crcInfo->rnti);
            if (raCb == NULLP)
            {
               continue;
            }
         }
      }
      /* Added Ul TB count for Uplink data scheduled*/
#ifdef LTE_L2_MEAS
      if(raCb)
      {
         ulHqProc = &(raCb->msg3HqProc);
         if(ulHqProc->remTx == (cell->rachCfg.maxMsg3Tx -1))
         {
            cell->dlUlTbCnt.tbTransUlTotalCnt++;
         }   
      }  
      else
      {
         rgSCHUtlUlHqProcForUe(cell, crcInd->timingInfo, ue, &ulHqProc); 
         if(ulHqProc->remTx == ((RgUeUlHqCb*)ulHqProc->hqEnt)->maxHqRetx) 
         {
            cell->dlUlTbCnt.tbTransUlTotalCnt++;
         }   
      }   
#endif

      if (crcInfo->isFailure == FALSE)
      {
         if(raCb)
         {
            rgSCHRamMsg3DatInd(raCb);
#ifdef LTE_TDD
            /*ccpu00128820 - MOD - Msg3 alloc double delete issue*/
            hqProc = &(raCb->msg3HqProc);
            RGSCH_UPD_PHICH(cell->ulDlCfgIdx, crcInd->timingInfo.subframe,
                    hqProc);
#endif
            raCb = NULLP;
         }
         else
         {
#ifdef CA_DBG
            gUlCrcPassCount++;
#endif
            RGSCHCPYTIMEINFO(crcInd->timingInfo, ue->datIndTime);
#ifndef MAC_SCH_STATS
            rgSCHUhmProcDatInd(cell, ue, crcInd->timingInfo);

#else 
            /** Stats update over here 
            */
            {
               RgSchCmnUe     *cmnUe = RG_SCH_CMN_GET_UE(ue,cell);

               rgSCHUhmProcDatInd(cell, ue, crcInd->timingInfo, cmnUe->ul.crntUlCqi[0]);
            }
#endif /* MAC_SCH_STATS */

            rgSCHUtlHdlUlTransInd(cell, ue, crcInd->timingInfo);
#ifdef LTEMAC_SPS
            rgSCHUtlHdlCrcInd(cell, ue, crcInd->timingInfo);
#endif
         }
      }
      else
      {
         if(raCb)
         {
            /* SR_RACH_STATS : MSG3 Nack / DTX*/
            if (crcInfo->isDtx == TRUE)
            {
               rgNumMsg3DtxRcvd++;
            }
            else
            {
               rgNumMsg3CrcFailed++;
            }

            rgSCHRamMsg3FailureInd(raCb);
#ifdef LTE_TDD
            /*ccpu00128820 - MOD - Msg3 alloc double delete issue*/
            hqProc = &(raCb->msg3HqProc);
            RGSCH_UPD_PHICH(cell->ulDlCfgIdx, crcInd->timingInfo.subframe,
                    hqProc);
#endif
            /* Added Ul TB count for CRC Failure of MSG3 */
#ifdef LTE_L2_MEAS            
            ulHqProc = &(raCb->msg3HqProc);
            if(ulHqProc->remTx == (cell->rachCfg.maxMsg3Tx -1))
            {
               cell->dlUlTbCnt.tbTransUlFaulty++;
            }
#endif
            raCb = NULLP;
         }
         else
         {
#ifdef CA_DBG
            gUlCrcFailCount++;
#endif
#ifndef MAC_SCH_STATS
            rgSCHUhmProcHqFailure (cell, ue, crcInd->timingInfo, crcInfo->rv);
#else
            {
               RgSchCmnUe     *cmnUe = RG_SCH_CMN_GET_UE(ue,cell);

               rgSCHUhmProcHqFailure (cell, ue, crcInd->timingInfo, crcInfo->rv, cmnUe->ul.crntUlCqi[0]);
            }
#endif /* MAC_SCH_STATS */
            rgSCHUtlHdlUlTransInd(cell, ue, crcInd->timingInfo);
#ifdef LTEMAC_SPS
            rgSCHUtlHdlCrcFailInd(cell, ue, crcInd->timingInfo);
#endif
            /* Added Ul TB count for CRC Failure of Uplink data */
#ifdef LTE_L2_MEAS            
            rgSCHUtlUlHqProcForUe(cell, crcInd->timingInfo, ue, &ulHqProc); 
            if(ulHqProc->remTx == ((RgUeUlHqCb*)ulHqProc->hqEnt)->maxHqRetx) 
            {
               cell->dlUlTbCnt.tbTransUlFaulty++;
            }   
#endif            
         }
      }
   }

/* ccpu00132653-ADD Added Sched_At_Crc Changes for TDD and optimized here 
   the codebase across TDD and FDD*/
#ifdef RG_ULSCHED_AT_CRC
   /* Changes to do uplink scheduling at CRC Indication */
   cellUl = RG_SCH_CMN_GET_UL_CELL(cell);
   RG_SCH_ADD_TO_CRNT_TIME(cell->crntTime, crntHiDci0Frm, TFU_ULCNTRL_DLDELTA);

#ifndef LTE_TDD
   /* Append the PHICH information */
   if (rgSCHUhmAppendPhich(cell, crntHiDci0Frm,0)!= ROK)
   {
      RLOG_ARG1(L_ERROR,DBG_CELLID,cell->cellId,"Unable to append PHICH cellId"
            ":%d", crcInd->cellId);
   }

   rgSCHCmnRlsUlSf(cell,0);
#else

   Mval = rgSchTddPhichMValTbl[cell->ulDlCfgIdx][crntHiDci0Frm.subframe];
   /* ccpu00130980 - PHICH need to be sent only if MVal is non-zero.
    * and Mval=2 (config 0) is also taken care here */
   if(Mval)
   {
      for(idx=0; idx < Mval; idx++)
      {
         if (rgSCHUhmAppendPhich(cell, crntHiDci0Frm, idx)!= ROK)
         {
            RLOG_ARG0(L_ERROR,DBG_CELLID,cell->cellId, 
                     "rgSCHTomTtiInd() Unable to append PHICH ");
            err.errType = RGSCHERR_TOM_TTIIND;
         }
         rgSCHCmnRlsUlSf(cell,idx);
      }
#endif

      rgSCHCmnUlSch(cell);
#ifdef LTE_L2_MEAS
        rgSCHL2Meas(cell,TRUE);
#endif
      /* Also, sending UL DCI and PHICH for just scheduled subframe */
      ulSf = rgSCHUtlSubFrmGet (cell, crntHiDci0Frm);

      if ((rgSCHTomUtlProcDlSfAtCrc (ulSf, crntHiDci0Frm, cell, &err)) != ROK)
      {
         RLOG_ARG1(L_ERROR,DBG_CELLID,cell->cellId,"rgSCHTomCrcInd() Unable to process"
                  " downlink subframe for cellId %d", crcInd->cellId);
         err.errType = RGSCHERR_TOM_TTIIND;
         RETVALUE(RFAILED);
      }
#ifdef LTE_TDD
   }
#ifdef LTEMAC_SPS
   else
   {
      rgSCHCmnSpsUlTti(cell, NULLP);
   }
#endif /* LTEMAC_SPS */
#endif /* LTE_TDD */
#endif /* RG_ULSCHED_AT_CRC */
   RETVALUE(ROK);
}  /* rgSCHTomCrcInd */

/**
 * @brief Handler for processing timing Advance indication recieved from 
 * PHY for a UE.
 *
 * @details
 *
 *     Function: rgSCHTomTimingAdvInd
 *
 *     Handler for processing timing advance indication recieved from PHY
 *     for a set of UEs.
 *
 *     Invoked by: RgLiTfuTimingAdvInd
 *
 *     Processing Steps:
 *     - Get UE.
 *     - Call DHM to update value of Timing Advance rgSCHDhmUpdTa.
 *           
 *  @param[in] TfuTimingAdvIndInfo *timingAdvInd
 *  @return  S16
 *      -# ROK 
 *      -# RFAILED 
 **/
#ifdef ANSI
PUBLIC S16 rgSCHTomTimingAdvInd
(
RgSchCellCb         *cell,
TfuTimingAdvIndInfo *timingAdvInd
 )
#else
PUBLIC S16 rgSCHTomTimingAdvInd(cell, timingAdvInd)
RgSchCellCb         *cell;
TfuTimingAdvIndInfo *timingAdvInd;
#endif
{
   RgSchUeCb        *ue;
   CmLList          *node;
   TfuTimingAdvInfo *timingAdvInfo;


   TRC2(rgSCHTomTimingAdvInd);

   if(cell->cellId != timingAdvInd->cellId)
   {
      RLOG_ARG1(L_ERROR,DBG_CELLID,cell->cellId,"Unable to get the cell for cellId"
         "=(%d)", timingAdvInd->cellId);
      RETVALUE(RFAILED);
   }


   node =  timingAdvInd->timingAdvLst.first;
   for (;node; node=node->next)
   {
      timingAdvInfo = (TfuTimingAdvInfo *)node->node;
      ue = rgSCHDbmGetUeCb (cell, timingAdvInfo->rnti);
      if (ue == NULLP)
      {
         RLOG_ARG1(L_ERROR,DBG_CELLID,cell->cellId,"RNTI:%d Unable to get the UE CB",
            timingAdvInfo->rnti);
         continue;
      }
      rgSCHDhmUpdTa (cell, ue, timingAdvInfo->timingAdv);
   }
   RETVALUE(ROK);
}  /* rgSCHTomTimingAdvInd */

/**
 * @brief Handler for processing TTI indication recieved from 
 * PHY for 'n' cells.
 *
 * @details
 *
 *     Function: rgSCHTomTtiInd
 *
 *     Handler for processing TTI indication recieved from PHY
 *     for a cell. This is split into the below Steps. 
 *     
 *     1: Complete the Uplink and Common Channel Scheduling for each Cell
 *     2: Complete the UE specific Scheduling for each Cell / across Cells.
 *     3: Consolidate the subframe allocations and send to each MAC instance
 *     4: Fill the Tfu structures for DL and UL Config requests  
 *     5: Handle the RGR Config messages per Cell
 *
 *  @param[in] TfuTtiIndInfo *ttiInd
 *  @param[in] Inst           schInst
 *  @return  Void
 **/
#ifdef ANSI
PUBLIC Void rgSCHTomTtiInd
(
TfuTtiIndInfo      *ttiInd,
Inst               schInst
)
#else
PUBLIC Void rgSCHTomTtiInd(ttiInd, schInst)
TfuTtiIndInfo      *ttiInd;
Inst               schInst;
#endif
{
   RgInfSfAlloc      *subfrmAlloc;
   U8                i;
   U8                nCell = 0;
   RgSchCellCb       *cell[CM_LTE_MAX_CELLS];
   RgSchCellCb       *cellLst[CM_LTE_MAX_CELLS];
   
   TRC2(rgSCHTomTtiInd);
   
#ifdef LTE_L2_MEAS
   glblTtiCnt++;
#endif

   rgSchTomFillCellTtiInfo(ttiInd, schInst, &nCell, &cell[0]);
  
   for (i = 0; i < nCell; i++)
   {
      /* Perform UL and DL Common Channel scheduling */
      rgSchTomTtiUlAndDlCmnChSch (cell[i]);
   }

   /* Perform scheduling in Order of
    * 1. SPS
    * 2. CEs
    * 3. Retx */
   for (i = 0; i < nCell; i++)
   {
      
      if (cell[i]->isDlDataAllwd && (cell[i]->stopDlSch == FALSE))
      {
         RgSchCmnCell *cellSch = RG_SCH_CMN_GET_CELL(cell[i]);
#ifdef LTEMAC_SPS 
         /* Perform DL SPS scheduling */
         rgSCHCmnDlSpsSch(cell[i]);
#endif
#ifdef LTE_ADV
         /*LAA: LAA specific scheduling on PCell and SCell*/
         rgSCHLaaSch(cell[i]);
#endif
         if( (RG_SCH_ABS_ENABLED_ABS_SF == cell[i]->lteAdvCb.absDlSfInfo) &&
                              (cell[i]->lteAdvCb.absCfg.absPatternType & RGR_ABS_MUTE) )
         {
            /* The pattern type is RGR_ABS_MUTE, then eNB need to blank the subframe */
         }
         else
         {
            /* Perform DL CE scheduling */
            cellSch->apisDl->rgSCHDlCeSched(cell[i], &cellSch->allocInfo);      

            /* Perform DL Retx scheduling */
            cellSch->apisDl->rgSCHDlRetxSched(cell[i], &cellSch->allocInfo);      
         }
      }
   }

   rgSchCmnPreDlSch(cell, nCell, cellLst);
   for (i = 0; i < nCell; i++)
   {
      /* Perform DL scheduling */
      rgSchTomTtiDlSch (cellLst[i]);
   }
   rgSchCmnPstDlSch(cell[0]);

   for (i = 0; i < nCell; i++)
   {
#ifdef LTE_TDD
#ifndef RG_ULSCHED_AT_CRC      
      /* Perform UL scheduling for TDD */
      rgSCHCmnUlSch (cell[i]);
#endif      
#endif
   }
   /* Init SF Alloc info per Cell */
   for (i = 0; i < nCell; i++)
   {
      subfrmAlloc = &(cell[i]->sfAllocArr[cell[i]->crntSfIdx]);
      rgSCHUtlResetSfAlloc(subfrmAlloc,FALSE,TRUE);
   }
   for (i = 0; i < nCell; i++)
   {
      if (cell[i]->isDlDataAllwd && (cell[i]->stopSiSch == FALSE))
      {
         /* Consolidate the Allocations and send response to MAC instances */
         rgSchTomTtiCnsldtSfAlloc (cell[i]);
      }
   }

   for (i = 0; i < nCell; i++)
   {
      if (cell[i]->isDlDataAllwd && (cell[i]->stopSiSch == FALSE))
      {
         /* Send the consolidated Alloc Info to MAC instances */
         rgSCHCmnSndCnsldtInfo (cell[i]);
      }
   }

   for (i = 0; i < nCell; i++)
   {
      /* Fill the TFU structures and send to CL */
      rgSchTomTtiL1DlAndUlCfg  (cell[i]);
   }
#ifdef RGR_RRM_TICK   
   rgSCHTomUtlSendSfnTick(cell[0]);
#endif

   for (i = 0; i < nCell; i++)
   {
      /* Invoke non critical functions like measurements, etc */
      rgSchTomTtiMiscFunctions (cell[i]);
   }

#ifdef CA_DBG
   {
      static U32 gTtiCount = 0;
      gTtiCount++;

      if(gTtiCount == 3000)
      {
         printf("SChed:: (P/S)::(%ld/%ld) \n",
               gPrimarySchedCount,gSCellSchedCount);

         printf("\n HQFDBK :: %ld\n",gHqFdbkCount);
         
         printf("\n PCell:: TB1:: (A/N/D)::(%ld/%ld/%ld)  TB2:: (A/N/D)::(%ld/%ld/%ld)\n",
               gPCellTb1AckCount,gPCellTb1NackCount,gPCellTb1DtxCount,
               gPCellTb2AckCount,gPCellTb2NackCount,gPCellTb2DtxCount);

         printf("\n SCell:: TB1:: (A/N/D)::(%ld/%ld/%ld)  TB2:: (A/N/D)::(%ld/%ld/%ld)\n",
               gSCellTb1AckCount,gSCellTb1NackCount,gSCellTb1DtxCount,
               gSCellTb2AckCount,gSCellTb2NackCount,gSCellTb2DtxCount);

         printf("\n CQI:: Recp(Pucch/Pusch):Rcvd(pcqi/rawacqireport/apcqi/AppReprt)::(%ld/%ld):(%ld/%ld/%ld/%ld)\n",
               gCqiRecpCount,gCqiRecpPuschCount,gCqiRcvdCount,gRawACqiCount,
               gACqiRcvdCount,gCqiReptToAppCount);
              
         printf("\n (F1BCS Count/Cqi/Ri/CqiDrop/PucchDrop/PuschCqiDrop)::(%ld/%ld/%ld/%ld/%ld/%ld)\n",
               gF1bCsCount,gCqiReqCount,gRiReqCount,gCqiDropCount,gPucchDropCount,gPuschCqiDropCount); 

         printf("UL::(DCI0/CrcPass/CrcFail)::(%ld/%ld/%ld)\n"
               "gPcellZeroBoOcc:%ld\t gScellZeroBoOcc:%ld\n",
               gDci0Count,
               gUlCrcPassCount,
               gUlCrcFailCount,
               gPcellZeroBoOcc,
               gScellZeroBoOcc);
               
         
         gCaDbgNonCaFrmt = 0;
         gCaDbgCaFrmt = 0;
         
         gF1bCsCount = 0;
         gCqiReqCount = 0;
         gACqiRcvdCount = 0;
         gRawACqiCount= 0;
         gRiReqCount = 0;
         gCqiDropCount = 0;
         gPucchDropCount= 0;

         gPuschCqiDropCount = 0;

         gDci0Count = 0;
         gUlCrcPassCount = 0;
         gUlCrcFailCount = 0;
         
         gCqiRecpCount = 0;
         gCqiRecpPuschCount = 0;
         gCqiRcvdCount = 0;
         
         gCqiReptToAppCount = 0;
      
         gTtiCount = 0;

         gHqFdbkCount       = 0;
         gPrimarySchedCount = 0;
         gSCellSchedCount   = 0;
         gSCellTb1AckCount  = 0;
         gSCellTb2AckCount  = 0;
         gSCellTb2AckCount  = 0;
         gSCellTb2NackCount = 0;
         gPCellTb1AckCount  = 0;
         gPCellTb1NackCount  = 0;
         gPCellTb2AckCount  = 0;
         gPCellTb2NackCount  = 0;
         gSCellTb1NackCount=0;

         gPCellTb1DtxCount  = 0;
         gPCellTb2DtxCount  = 0;
         gSCellTb1DtxCount  = 0;
         gSCellTb2DtxCount  = 0;
         gPcellZeroBoOcc    = 0;
         gScellZeroBoOcc    = 0;
      }
   
   }

#endif
   RETVOID;
}  /* rgSCHTomTtiInd */

/** @brief This function does the TTI processin for the uplink subframe,
 * already populated by the scheduler.
 *
 * @details
 *
 *     Function: rgSCHTomUtlProcUlSf
 *
 *         Processing steps:
 *         - Loop through the Uplink allocations present in the uplink subframe.
 *         - For each allocation Fill a data reception request to be sent to PHY
 *         - Also fills the harq reception requests for the expected HQ feedbacks.
 *
 *
 * @param  [in]  RgSchCellCb   *cell
 * @param  [out] RgSchErrInfo  *err
 * @return  S16
 *      -# ROK 
 *      -# RFAILED 
 */
#ifdef ANSI
PRIVATE S16 rgSCHTomUtlProcUlSf 
(
RgSchCellCb        *cell,
RgSchErrInfo       *err
)
#else
PRIVATE S16 rgSCHTomUtlProcUlSf (cell, err)
RgSchCellCb        *cell;
RgSchErrInfo       *err;
#endif
{
   S16             ret;
   TfuRecpReqInfo  *recpReqInfo;
#ifdef TFU_UPGRADE
   U16             validIdx; /* Index computed from recreq's timing info*/
#endif 
   Inst            inst = cell->instIdx;

   TRC2(rgSCHTomUtlProcUlSf)

   if ((ret = rgSCHUtlAllocEventMem(inst, (Ptr *)&recpReqInfo, 
                            sizeof(TfuRecpReqInfo))) != ROK)
   {
      RLOG_ARG0(L_ERROR,DBG_CELLID,cell->cellId,"Unable to Allocate TfuRecpReqInfo "
         "for cell");
      err->errCause = RGSCHERR_TOM_MEM_EXHAUST;
      RETVALUE(ret);
   }    
   recpReqInfo->cellId = cell->cellId;
   cmLListInit(&recpReqInfo->ueRecpReqLst);
#ifdef xLTE_TDD /*vrr*/
   RG_SCH_ADD_TO_CRNT_TIME(cell->crntTime, recpReqInfo->timingInfo, TFU_DELTA);
#else
   RG_SCH_ADD_TO_CRNT_TIME(cell->crntTime, recpReqInfo->timingInfo,
                      TFU_RECPREQ_DLDELTA);
#endif
/* ACC-TDD vrr*/
   /* This is done to send Reception Request for every subframe */

#ifdef TFU_UPGRADE
   RG_SCH_GET_IDX_PCQISRSSR(recpReqInfo->timingInfo, validIdx);
   /*ccpu00116923 - ADD - SRS present support - Start*/

   /*ccpu00130768 - ADD - check whether cell specific SRS is configured or not*/
#ifdef LTE_TDD
   if(cell->srsCfg.isSrsCfgPres && rgSchTddCellSpSrsSubfrmTbl[cell->srsCfg.srsSubFrameCfg][recpReqInfo->timingInfo.subframe])
#else
   if(cell->srsCfg.isSrsCfgPres && rgSchFddCellSpSrsSubfrmTbl[cell->srsCfg.srsSubFrameCfg][recpReqInfo->timingInfo.subframe])
#endif
   {
      recpReqInfo->srsPres = TRUE;
   }
   else
   {
      recpReqInfo->srsPres = FALSE;
   }
   /*ccpu00116923 - ADD - SRS present support - End*/
#endif 
   /* Filling data Reception requests */
   ret = rgSCHTomUtlFillDatRecpReq(recpReqInfo, cell, 
#ifdef TFU_UPGRADE
         validIdx,
#endif 
         err);
   if (ret != ROK)
   {
      RLOG_ARG0(L_ERROR,DBG_CELLID,cell->cellId,"Unable to fill Data recption "
         "requests for cell");
      RGSCH_FREE_MEM(recpReqInfo);
      RETVALUE(ret);
   } 
   /* Filling HARQ Reception requests */
#ifdef TFU_UPGRADE
   ret = rgSCHTomUtlFillHqFdbkRecpReq (recpReqInfo, cell, validIdx,err);
#else
 ret = rgSCHTomUtlFillHqFdbkRecpReq (recpReqInfo, cell, err);
#endif

   if (ret != ROK)
   {
      RLOG_ARG0(L_ERROR,DBG_CELLID,cell->cellId,"Unable to fill Harq Feedback "
         "reception requests for cell");
      RGSCH_FREE_MEM(recpReqInfo);
      RETVALUE(ret);
   }
#ifdef TFU_UPGRADE
   /* Filling SR Reception requests */
   ret = rgSCHTomUtlFillSrRecpReq (recpReqInfo, cell, validIdx, err);
   if (ret != ROK)
   {
      RLOG_ARG0(L_ERROR,DBG_CELLID,cell->cellId,"Unable to fill SR reception "
         "requests for cell");
      RGSCH_FREE_MEM(recpReqInfo);
      RETVALUE(ret);
   }

   /* Filling RI Reception requests */
   ret = rgSCHTomUtlFillRiRecpReq (recpReqInfo, cell, validIdx, err);
   if (ret != ROK)
   {
      RLOG_ARG0(L_ERROR,DBG_CELLID,cell->cellId,"Unable to fill RI reception "
         "requests for cell");
      RGSCH_FREE_MEM(recpReqInfo);
      RETVALUE(ret);
   }

   /* Filling PCQI Reception requests */
   ret = rgSCHTomUtlFillPcqiRecpReq (recpReqInfo, cell, validIdx, err);
   if (ret != ROK)
   {
      RLOG_ARG0(L_ERROR,DBG_CELLID,cell->cellId,"Unable to fill PCQI reception "
         "requests for cell");
      RGSCH_FREE_MEM(recpReqInfo);
      RETVALUE(ret);
   }

   /* Filling SRS Reception requests */
   ret = rgSCHTomUtlFillSrsRecpReq (recpReqInfo, cell, validIdx, err);
   if (ret != ROK)
   {
      RLOG_ARG0(L_ERROR,DBG_CELLID,cell->cellId,"Unable to fill Harq Feedback "
         "recption requests for cell");
      RGSCH_FREE_MEM(recpReqInfo);
      RETVALUE(ret);
   }
#endif
#if (defined (LTE_ADV) && defined (LTE_TDD))
   /* Initialize the N1 Used list associated with this UL subframe */
   cmLListInit(&cell->n1ResUsedLst[recpReqInfo->timingInfo.subframe]);
#endif
   /* sending the RecpReq to Phy */
   if (rgSCHUtlTfuRecpReq(inst, cell->tfuSap->sapCfg.suId, recpReqInfo) != ROK)
   {
      RLOG_ARG0(L_ERROR,DBG_CELLID,cell->cellId,"Unable to send Cntrl info for cell");
   }
   RETVALUE(ROK);
} /* end of rgSCHTomUtlProcUlSf */ 

#ifdef LTE_TDD
#ifdef TFU_UPGRADE
/** @brief This function does the TTI processin for the uplink subframe,
 * already populated by the scheduler.
 *
 * @details
 *
 *     Function: rgSCHTomUtlPrcUlTddSpclSf
 *
 *         Processing steps:
 *         - Fill the SRS Info for the Special Subframe in Reception Req.
 *         - Send the Reception Req to TFU 
 *
 *
 * @param  [in]  RgSchCellCb   *cell
 * @param  [out] RgSchErrInfo  *err
 * @return  S16
 *      -# ROK 
 *      -# RFAILED 
 */
#ifdef ANSI
PRIVATE S16 rgSCHTomUtlPrcUlTddSpclSf 
(
RgSchCellCb        *cell,
RgSchErrInfo       *err
)
#else
PRIVATE S16 rgSCHTomUtlPrcUlTddSpclSf (cell, err)
RgSchCellCb        *cell;
RgSchErrInfo       *err;
#endif
{
   S16             ret;
   TfuRecpReqInfo  *recpReqInfo;
   U16             validIdx; /* Index computed from recreq's timing info*/
   Inst            inst = cell->instIdx;

   TRC2(rgSCHTomUtlPrcUlTddSpclSf)

   if ((ret = rgSCHUtlAllocEventMem(inst, (Ptr *)&recpReqInfo, 
                            sizeof(TfuRecpReqInfo))) != ROK)
   {
      RLOG_ARG0(L_ERROR,DBG_CELLID,cell->cellId,"rgSCHTomUtlPrcUlTddSpclSf() Unable to "
               "Allocate TfuRecpReqInfo for cell");
      err->errCause = RGSCHERR_TOM_MEM_EXHAUST;
      RETVALUE(ret);
   }    
   recpReqInfo->cellId = cell->cellId;
   cmLListInit(&recpReqInfo->ueRecpReqLst);

   RG_SCH_ADD_TO_CRNT_TIME(cell->crntTime, recpReqInfo->timingInfo, TFU_RECPREQ_DLDELTA);

   RG_SCH_GET_IDX_PCQISRSSR(recpReqInfo->timingInfo, validIdx);

   /*ccpu00130768  */ 
   if(cell->srsCfg.isSrsCfgPres && 
      rgSchTddCellSpSrsSubfrmTbl[cell->srsCfg.srsSubFrameCfg][recpReqInfo->timingInfo.subframe])
   {
      recpReqInfo->srsPres = TRUE;
   }
   else
   {
      recpReqInfo->srsPres = FALSE;
   }  

   /* Filling SRS Reception requests */
   ret = rgSCHTomUtlFillSrsRecpReq (recpReqInfo, cell, validIdx, err);
   if (ret != ROK)
   {
      RLOG_ARG0(L_ERROR,DBG_CELLID,cell->cellId,"rgSCHTomUtlPrcUlTddSpclSf() Unable to fill"
            " SRS recption requests for cell");;
      RGSCH_FREE_MEM(recpReqInfo);
      RETVALUE(ret);
   }
   /* sending the RecpReq to Phy */
   if (rgSCHUtlTfuRecpReq(inst, cell->tfuSap->sapCfg.suId, recpReqInfo) != ROK)
   {
      RLOG_ARG0(L_ERROR,DBG_CELLID,cell->cellId,"rgSCHTomUtlPrcUlTddSpclSf() Unable to send "
                               "Cntrl info for cell");
   }
   RETVALUE(ROK);
} /* end of rgSCHTomUtlPrcUlTddSpclSf */ 
#endif
#endif
/** @brief This function does all the processing related to a single downlink
 * subframe.
 *
 * @details 
 *
 *     Function: rgSCHTomUtlProcDlSf
 *
 *         Processing steps:
 *         - collate control data for all UEs and send to PHY 
 *         - collate data buffers for all UEs and send to PHY 
 *
 * @param  [in] RgSchDlSf     *dlSf
 * @param  [in] RgSchDlSf     *ulSf
 * @param  [in] RgSchCellCb   *cell
 * @param  [out] RgSchErrInfo *err
 * @return S16
 */
#ifdef ANSI
PRIVATE S16 rgSCHTomUtlProcDlSf
(
RgSchDlSf            *dlSf,
RgSchDlSf            *ulSf,
RgSchCellCb          *cell,
RgSchErrInfo         *err
)
#else
PRIVATE S16 rgSCHTomUtlProcDlSf (dlSf, ulSf, cell, err)
RgSchDlSf            *dlSf;
RgSchDlSf            *ulSf;
RgSchCellCb          *cell;
RgSchErrInfo         *err;
#endif
{
   TfuCntrlReqInfo   *cntrlInfo;
   Inst              inst = cell->instIdx;
   S16               ret;
   U8                sfTyp = 1; /* Dl Subframe */

   TRC2(rgSCHTomUtlProcDlSf);

   /* Fill control data from scheduler to PHY */   
   if ((ret = rgSCHUtlAllocEventMem(inst, (Ptr *)&cntrlInfo, 
                            sizeof(TfuCntrlReqInfo))) != ROK)
   {
      RLOG_ARG0(L_ERROR,DBG_CELLID,cell->cellId,"Unable to Allocate TfuCntrlReqInfo"
         " for cell");
      RETVALUE(ret);
   }
   else
   {
      cntrlInfo->numDlActvUes = 0;
      cmLListInit(&cntrlInfo->phichLst);
      cmLListInit(&cntrlInfo->dlPdcchLst);
      cmLListInit(&cntrlInfo->ulPdcchLst);
      
#ifdef TFU_ALLOC_EVENT_NO_INIT
      cntrlInfo->ulTiming.sfn = cntrlInfo->ulTiming.subframe = 0;
#endif
      cntrlInfo->dlTiming = cell->dlDciTime;
      cntrlInfo->cellId   = cell->cellId;
      cntrlInfo->ulTiming = cell->hiDci0Time;
      /* Fill PCFICH info */
      /* Fix for DCFI FLE issue: when DL delta is 1 and UL delta is 0 and CFI
       *change happens in that SF then UL PDCCH allocation happens with old CFI
       *but CFI in control Req goes updated one since it was stored in the CELL
       */
      cntrlInfo->cfi = dlSf->pdcchInfo.currCfi;
#ifndef RG_ULSCHED_AT_CRC
      U8                Mval  = 1;
#ifdef LTE_TDD
      Mval = rgSchTddPhichMValTbl[cell->ulDlCfgIdx]
                                 [cell->hiDci0Time.subframe];
      if(dlSf->sfType == RG_SCH_SPL_SF_DATA)
      {
         RGSCH_GET_SPS_SF_CFI(cell->bwCfg.dlTotalBw, cntrlInfo->cfi);
      }
#endif
      if(Mval)
      {
         /* Fill PHICH info */
         if ((ret = rgSCHTomUtlFillPhich (cell, cntrlInfo, ulSf, err)) != ROK)
         {
            RGSCHDBGERRNEW(inst,(rgSchPBuf(inst),"Unable to send PHICH info "
                     "for cellId (%d)\n", cell->cellId));
            RGSCH_FREE_MEM(cntrlInfo);
            RETVALUE(ret);
         }
         if ((ret = rgSCHTomUtlFillUlPdcch (cell, cntrlInfo, ulSf, err)) != 
                        ROK)
         {
            RGSCHDBGERRNEW(inst,(rgSchPBuf(inst),"Unable to send PDCCH info "
                     "for cellId (%d)\n", cell->cellId));
            RGSCH_FREE_MEM(cntrlInfo);
            RETVALUE(ret);
         }
      }
#endif
#ifdef LTE_TDD
      sfTyp = rgSchTddUlDlSubfrmTbl[cell->ulDlCfgIdx]
                                   [cell->dlDciTime.subframe]; 
#endif      
      if (sfTyp != 2) /* Uplink subframe */   
      {
         /* Fill PDCCH info */
         if ((ret = rgSCHTomUtlFillDlPdcch(cell,cntrlInfo, dlSf, err)) != ROK)
         {
            RGSCHDBGERRNEW(inst,(rgSchPBuf(inst),"Unable to send PDCCH info "
                     "for cellId (%d)\n", cell->cellId));
            RGSCH_FREE_MEM(cntrlInfo);
            RETVALUE(ret);
         }
         rgBwAlloInfo[dlSf->sfNum] += dlSf->bwAssigned;
         rgBwAlcnt[dlSf->sfNum] ++;

      }
#ifdef LTEMAC_SPS /* SPS_NEW_CHGS */
      cntrlInfo->isSPSOcc = dlSf->isSPSOcc;
#endif
      cntrlInfo->numDlActvUes = dlSf->numDlActvUes;  /* 4UE_TTI_DELTA */
      dlSf->numDlActvUes      = 0;

      /* Now always sending down a cntrl req */
      /* sending the cntrl data to Phy */
      if (rgSCHUtlTfuCntrlReq(inst, cell->tfuSap->sapCfg.suId, cntrlInfo) 
            != ROK)
      {
         RLOG_ARG0(L_ERROR,DBG_CELLID,cell->cellId,"Unable to send Cntrl info "
            "for cell");
      }
   }

   RETVALUE(ROK);
} 


/** @brief This function handles sending of the PHICH information for the
 * downlink subframe to be sent in the next TTI.
 *
 * @details
 *
 *     Function: 
 *
 *         Processing steps:
 *         - Loop through the PHICH information present in the downlink
 *         subframe and fill the information in cntrlInfo.
 *
 * @param  [out] TfuCntrlReqInfo *cntrlInfo 
 * @param  [in]  RgSchDlSf   *dlSf
 * @param  [out] RgSchErrInfo *err
 * @return  S16
 *      -# ROK 
 *      -# RFAILED 
 */
#ifdef ANSI
PRIVATE S16 rgSCHTomUtlFillPhich
(
RgSchCellCb     *cell,
TfuCntrlReqInfo    *cntrlInfo,
RgSchDlSf          *dlSf,
RgSchErrInfo       *err
 )
#else
PRIVATE S16 rgSCHTomUtlFillPhich(cell, cntrlInfo, dlSf, err)
RgSchCellCb     *cell;
TfuCntrlReqInfo    *cntrlInfo;
RgSchDlSf          *dlSf;
RgSchErrInfo       *err;
#endif
{
   S16             ret;
   CmLList         *node;
   RgSchPhich      *phich;
   TfuPhichInfo    *harqAck;
#ifdef TFU_UPGRADE
   RgSchCmnDlCell   *cellDl = RG_SCH_CMN_GET_DL_CELL(cell);
#endif

   TRC2(rgSCHTomUtlFillPhich)
   ret = ROK;
   /* Traversing the list of Phichs */
   node =  dlSf->phichInfo.phichs.first;
   while (node)
   {
      phich = (RgSchPhich*)node->node;
      if ((ret = rgSCHUtlGetEventMem((Ptr *)&harqAck, sizeof(TfuPhichInfo), 
                                &(cntrlInfo->memCp))) != ROK)
      {
         err->errCause = RGSCHERR_TOM_MEM_EXHAUST;
         RETVALUE(ret);
      }
#ifdef TFU_ALLOC_EVENT_NO_INIT
      harqAck->txPower = 0;
#endif
      /* fill in the tfu structure from the information present in the
       * phich node */
      harqAck->rbStart     = phich->rbStart;
      harqAck->nDmrs       = phich->nDmrs;
      harqAck->isAck       = phich->hqFeedBack;
      harqAck->isForMsg3   = phich->isForMsg3;  /*SR_RACH_STATS : PHICH ACK/NACK for MSG3 */
#ifdef LTE_TDD
      /* Changes for passing iPhich at TFU interface*/
      harqAck->iPhich      = phich->iPhich;
#endif
  /* ccpu00138898 - Added Tx pwr offset for PHICH Tx*/
#ifdef TFU_UPGRADE
      harqAck->txPower       = cellDl->phichTxPwrOffset;
#endif
      cmLListAdd2Tail(&cntrlInfo->phichLst, &(harqAck->lnk));
      harqAck->lnk.node = (PTR)harqAck;
      node = node->next;
   } /* end of while */
   RETVALUE(ret);
} /* end of */ 


#ifdef LTE_ADV
/** @brief This function is a utility function to restart 
 * deactivation timer.
 *
 * @details
 *
 *     Function: rgSCHTmrRestartScellDeactTmr 
 *
 *         Processing steps:
 *         - Starts timer at scheduler
 *         
 *   @param[in]  RgSchCellCb    *cell
 *   @param[in]  CmLteRnti       rnti
 *   @return  Void
 */
#ifdef ANSI
PRIVATE Void rgSCHTmrRestartScellDeactTmr
(
 RgSchCellCb     *cell,
 RgSchUeCb       *ueCb
 )
#else
PRIVATE Void rgSCHTmrRestartScellDeactTmr (cell, ueCb)
   RgSchCellCb     *cell;
   RgSchUeCb       *ueCb;

#endif
{
   RgSchUeCellInfo   *sCellInfo = NULLP;
   
   if(NULLP != ueCb)
   {
      if(RG_SCH_IS_CELL_SEC(ueCb, cell))
      {
         sCellInfo = ueCb->cellInfo[(ueCb->cellIdToCellIdxMap[RG_SCH_CELLINDEX(cell)])];

         if(sCellInfo->deactTmr.tmrEvnt != TMR_NONE)
         {
            rgSCHTmrStopTmr(cell, RG_SCH_TMR_SCELL_DEACT, sCellInfo);
         }
         if(PRSNT_NODEF == ueCb->sCellDeactTmrVal.pres)
         {
            rgSCHTmrStartTmr(cell,sCellInfo,RG_SCH_TMR_SCELL_DEACT,
                  ueCb->sCellDeactTmrVal.val);
         }
      }
   }
}/*end of rgSCHTmrRestartScellDeactTmr*/
#endif

/** @brief This function will send all the PDCCH's for the given downlink
 * subframe.
 *
 * @details
 *
 *     Function: 
 *
 *         Processing steps:
 *         - Loop through all the scheduled HARQ processes and fill
 *           the PDCCH information in cntrlInfo.
 *
 * @param  [out] TfuCntrlReqInfo *cntrlInfo 
 * @param  [in]  RgSchDlSf   *dlSf
 * @param  [out] RgSchErrInfo *err
 *  @return  S16
 *      -# ROK 
 *      -# RFAILED 
 */
#ifdef ANSI
PRIVATE S16 rgSCHTomUtlFillDlPdcch
(
RgSchCellCb     *cell,
TfuCntrlReqInfo *cntrlInfo,
RgSchDlSf       *dlSf,
RgSchErrInfo    *err
 )
#else
PRIVATE S16 rgSCHTomUtlFillDlPdcch(cell,cntrlInfo, dlSf, err)
RgSchCellCb          *cell;
TfuCntrlReqInfo *cntrlInfo;
RgSchDlSf       *dlSf;
RgSchErrInfo    *err;
#endif
{
   S16          ret;
   CmLList      *node;
   RgSchPdcch   *pdcch;
   TfuPdcchInfo *tfuPdcch;
   U8 isDcivld = FALSE;
   U8            numUePerTti = 0;

   TRC2(rgSCHTomUtlFillDlPdcch)
   ret = ROK;
   /* Traversing the scheduled Harq processes */
   node =  dlSf->pdcchInfo.pdcchs.first;
   while (node)
   {
      pdcch = (RgSchPdcch*)node->node;
       switch(pdcch->dci.dciFormat)
       {
          case TFU_DCI_FORMAT_3:
             isDcivld = (pdcch->dci.u.format3Info.isPucch) ? TRUE : FALSE;
             break;

          case TFU_DCI_FORMAT_3A:
             isDcivld = (pdcch->dci.u.format3AInfo.isPucch) ? TRUE : FALSE;
             break;

          default:
             isDcivld = TRUE;
             break;
       }
      if(!isDcivld) 
      {
         node = node->next;
         continue;
      }    

      /*ccpu00117179 - ADD - Build only non DCI format-0 messages */
      if(pdcch->dci.dciFormat == TFU_DCI_FORMAT_0)
      {
         node = node->next;
         continue;
      }


#ifdef RGSCH_SPS_STATS
      if((pdcch->dci.dciFormat == TFU_DCI_FORMAT_1A) &&
         (pdcch->dci.u.format1aInfo.t.pdschInfo.allocInfo.mcs == 0x1F) &&
         (pdcch->dci.u.format1aInfo.t.pdschInfo.allocInfo.alloc.type == TFU_ALLOC_TYPE_RIV) &&
         (pdcch->dci.u.format1aInfo.t.pdschInfo.allocInfo.alloc.u.riv == 0xFFFFFFFF))
      {
         numdlSpsRelSentToTf++;
      }
#endif

      if ((ret = rgSCHUtlGetEventMem((Ptr *)&tfuPdcch, sizeof(TfuPdcchInfo),
                                &(cntrlInfo->memCp))) != ROK)
      {
         err->errCause = RGSCHERR_TOM_MEM_EXHAUST;
         RETVALUE(ret);
      }
#ifdef LTEMAC_SPS
      tfuPdcch->crnti       = pdcch->crnti;
      tfuPdcch->isSpsRnti   = pdcch->isSpsRnti;
#endif
      tfuPdcch->rnti       = pdcch->rnti;
      
#ifdef LTE_ADV
      rgSCHTmrRestartScellDeactTmr(cell,pdcch->ue);
#endif
      tfuPdcch->dciNumOfBits = pdcch->dciNumOfBits;

      tfuPdcch->nCce       = pdcch->nCce;
      tfuPdcch->aggrLvl    = pdcch->aggrLvl;
      tfuPdcch->dci        = pdcch->dci;
      /* SR_RACH_STATS : Reset isTBMsg4 */
      pdcch->dci.u.format1aInfo.t.pdschInfo.isTBMsg4 = FALSE;        
      /* To be enhanced later for 2.1 */
      cmLListAdd2Tail(&cntrlInfo->dlPdcchLst, &(tfuPdcch->lnk));
      tfuPdcch->lnk.node = (PTR)tfuPdcch;
      node = node->next;
#if 1
      if((pdcch->rnti > 60) && (pdcch->rnti < 5000))
      {
         numUePerTti++;
      }
#endif
   } /* end of while */

   if((numUePerTti) && (numUePerTti < RG_MAX_NUM_UE_PER_TTI ))
   {
      cell->dlNumUeSchedPerTti[numUePerTti-1]++;
#if 1
      {
         gDlNumUePerTti[numUePerTti-1]++;
      }
#endif
   }
   RETVALUE(ret);
} /* end of rgSCHTomUtlFillDlPdcch*/ 

#ifdef RGSCH_SPS_STATS
extern U32 rgSchSpsRelSentToTf;
extern U32 rgSchSpsRelPdcchAllocd; 
#endif
/** @brief This function will send all the UL PDCCH's for the given
 * subframe.
 *
 * @details
 *
 *     Function: 
 *
 *         Processing steps:
 *         - Loop through all the scheduled HARQ processes and fill
 *           the PDCCH information in cntrlInfo.
 *
 * @param  [out] TfuCntrlReqInfo *cntrlInfo 
 * @param  [in]  RgSchDlSf   *dlSf
 * @param  [out] RgSchErrInfo *err
 *  @return  S16
 *      -# ROK 
 *      -# RFAILED 
 */
#ifdef ANSI
PRIVATE S16 rgSCHTomUtlFillUlPdcch
(
RgSchCellCb       *cell,
TfuCntrlReqInfo *cntrlInfo,
RgSchDlSf       *dlSf,
RgSchErrInfo    *err
 )
#else
PRIVATE S16 rgSCHTomUtlFillUlPdcch(cntrlInfo, dlSf, err)
RgSchCellCb       *cell;
TfuCntrlReqInfo *cntrlInfo;
RgSchDlSf       *dlSf;
RgSchErrInfo    *err;
#endif
{
   S16          ret;
   CmLList      *node;
   RgSchPdcch   *pdcch;
   TfuPdcchInfo *tfuPdcch;
   U8 isDcivld = FALSE;

   TRC2(rgSCHTomUtlFillUlPdcch)
   ret = ROK;
   /* Traversing the scheduled Harq processes */
   node =  dlSf->pdcchInfo.pdcchs.first;
   while (node)
   {
      pdcch = (RgSchPdcch*)node->node;
      node = node->next;
      /*ccpu00116712- Function should pick only UL allocation related control
       * info- start */
       switch(pdcch->dci.dciFormat)
       {
          case TFU_DCI_FORMAT_0:
             isDcivld = TRUE;
             break;

          case TFU_DCI_FORMAT_3:
             isDcivld = (pdcch->dci.u.format3Info.isPucch) ? FALSE : TRUE;
             break;

          case TFU_DCI_FORMAT_3A:
             isDcivld = (pdcch->dci.u.format3AInfo.isPucch) ? FALSE : TRUE;
             break;

          default:
             isDcivld = FALSE;
             break;
       }
      if(!isDcivld) 
      {    
         continue;
      } 
#ifdef CA_DBG
      gDci0Count++;
#endif

      /*ccpu00116712- Function should pick only UL allocation related control
       * info- end */
      if ((ret = rgSCHUtlGetEventMem((Ptr *)&tfuPdcch, sizeof(TfuPdcchInfo),
                  &(cntrlInfo->memCp))) != ROK)
      {
         err->errCause = RGSCHERR_TOM_MEM_EXHAUST;
         RETVALUE(ret);
      }

#ifdef LTEMAC_SPS
      tfuPdcch->crnti       = pdcch->crnti;
      tfuPdcch->isSpsRnti   = pdcch->isSpsRnti;
#endif
#ifdef RGSCH_SPS_STATS
      if ((pdcch->dci.dciFormat == TFU_DCI_FORMAT_0) &&
         (pdcch->dci.u.format0Info.mcs == 0x1F) &&
#ifdef TFU_UPGRADE
           (pdcch->dci.u.format0Info.riv == 0xFFFFFFFF) &&
#endif /* TFU_UPGRADE */
            (pdcch->dci.u.format0Info.rbStart == 0xFF))
      {
         rgSchSpsRelSentToTf++;
      }
#endif
      tfuPdcch->rnti       = pdcch->rnti;
#ifdef LTE_ADV
      rgSCHTmrRestartScellDeactTmr(cell,pdcch->ue);
#endif
      tfuPdcch->dciNumOfBits = pdcch->dciNumOfBits;

      tfuPdcch->nCce       = pdcch->nCce;
      tfuPdcch->aggrLvl    = pdcch->aggrLvl;
      tfuPdcch->dci        = pdcch->dci;

#ifdef LTEMAC_SPS
      if ((pdcch->dci.dciFormat == TFU_DCI_FORMAT_0) &&
         (pdcch->dci.u.format0Info.mcs == 0x1F) &&
#ifdef TFU_UPGRADE
           (pdcch->dci.u.format0Info.riv == 0xFFFFFFFF) &&
#endif /* TFU_UPGRADE */
            (pdcch->dci.u.format0Info.rbStart == 0xFF))
      {
         pdcch->dci.dciFormat = TFU_DCI_FORMAT_INVALID;
         rgSCHUtlPdcchPut(cell, &dlSf->pdcchInfo, pdcch);
      }
#endif
      /* To be enhanced later for 2.1 */
      cmLListAdd2Tail(&cntrlInfo->ulPdcchLst, &(tfuPdcch->lnk));
      tfuPdcch->lnk.node = (PTR)tfuPdcch;
   } /* end of while */

#ifdef RGSCH_SPS_STATS
   if (rgSchSpsRelSentToTf != rgSchSpsRelPdcchAllocd)
   {
     //   abort();
   }
#endif
   RETVALUE(ret);
} /* end of rgSCHTomUtlFillUlPdcch*/ 

/** @brief This function does the processing for Timing adjustment.
 *
 * @details
 *
 *     Function: 
 *
 *         Processing steps:
 *         - Loop through the ue present ueTimeLst, decrement the remaining
 *         frames left. 
 *
 *
 * @param  [in] RgSchCellCb   *cell
 *  @return  S16
 *      -# ROK 
 *      -# RFAILED 
 */
#ifdef ANSI
PRIVATE S16 rgSCHTomUtlProcTA
(
RgSchCellCb    *cell
)
#else
PRIVATE S16 rgSCHTomUtlProcTA (cell)
RgSchCellCb    *cell;
#endif
{
   CmLList     *node;
   RgSchUeCb   *ue;

   TRC2(rgSCHTomUtlProcTA);

   node =  cell->taUeLst.first;
   while (node)
   {
      ue = (RgSchUeCb *)node->node;
      node = node->next;
      if (ue->dl.taCb.numRemSf == 0)
      {
         ue->dl.taCb.state = RGSCH_TA_IDLE;
         /* If Outstanding Ta is present, schedule it */
         if(ue->dl.taCb.outStndngTa == TRUE)
         {
            rgSCHUtlReTxTa(cell, ue);
         }
         else
         {
            /* We need to reset state and also value of TA, 
             * then we start the timer */
            ue->dl.taCb.ta = RGSCH_NO_TA_RQD;
            /* Start the timer only if TA is cfgd as FINITE value */
            if (ue->dl.taCb.cfgTaTmr)
            {
               rgSCHTmrStartTmr (cell, ue, RG_SCH_TMR_TA, ue->dl.taCb.cfgTaTmr);
            }
         }
         /* need to delete from the link list */
         cmLListDelFrm(&(cell->taUeLst), &(ue->taLnk));
         ue->taLnk.node = NULLP;
      }
      else
      {
         ue->dl.taCb.numRemSf--;
      }
   } /* end of taUeLst */

   RETVALUE(ROK);
} /* end of rgSCHTomUtlProcTA */ 

/** @brief This function handles filling of filling format type
 *
 * @details
 *
 *     Function:  rgSchSetFormatType
 *
 *         Processing steps:
 *
 * @param  [in]  CmLteTimingInfo recpTimeInfo
 * @param  [out] RgSchUeCb     *ue
 * @param  [in]  RgSchDlSf     *dlSf
 *  @return  RETVOID
 */
#ifdef ANSI
PRIVATE Void rgSchSetFormatType
(
 CmLteTimingInfo recpTimeInfo,
 RgSchUeCb     *ue,
 RgSchDlSf     *dlSf
)
#else
PRIVATE Void rgSchSetFormatType(recpTimeInfo, ue, dlSf)
 CmLteTimingInfo recpTimeInfo,
 RgSchUeCb     *ue,
 RgSchDlSf *dlSf;
#endif
{
   ue->dl.dlSfHqInfo[dlSf->dlIdx].uciFrmtTyp = RG_SCH_UCI_FORMAT_NON_CA;
#ifdef LTE_ADV
   /* F1BCS or PUCCH format 3 will be used when the number
    * of configured serving cells are more than 1*/
   /* TODO:: Support for PUCCH format 3 is yet to be added*/
   if(ue->numSCells == 0)
   {/* Non CA Ue */
      ue->dl.dlSfHqInfo[dlSf->dlIdx].uciFrmtTyp = RG_SCH_UCI_FORMAT_NON_CA;
#ifdef CA_DBG
      {
         extern U32 gCaDbgNonCaFrmt;
         gCaDbgNonCaFrmt++;
      }
#endif
   }
   else if(ue->numSCells == 1)
   {/* 1B CS */
#ifdef CA_DBG
      {
         extern U32 gCaDbgCaFrmt;
         gCaDbgCaFrmt++;
      }
#endif

      ue->dl.dlSfHqInfo[dlSf->dlIdx].uciFrmtTyp = ue->uciFrmtTyp; /* RG_SCH_UCI_FORMAT1B_CS; */
   }
   else
   {/* Format 3 */
      ue->dl.dlSfHqInfo[dlSf->dlIdx].uciFrmtTyp = RG_SCH_UCI_FORMAT3;
   }
#endif

   RETVOID;
}/*end of rgSchSetFormatType*/

#ifdef LTE_TDD
/** @brief This function handles filling of HARQ feedback reception request to
 * PHY.
 *
 * @details
 *
 *     Function:
 *
 *         Processing steps:
 *
 * @param  [out] TfuRecpReqInfo  *recpReqInfo
 * @param  [in]  RgSchCellCb     *cellCb
 * @param  [out] RgSchErrInfo    *err
 *  @return  S16
 *      -# ROK
 *      -# RFAILED
 */
#ifdef TFU_UPGRADE
#ifdef ANSI
PRIVATE S16 rgSCHTomUtlFillHqFdbkRecpReq
(
 TfuRecpReqInfo   *recpReqInfo,
 RgSchCellCb      *cellCb,
 U16              validIdx,
 RgSchErrInfo     *err
 )
#else
PRIVATE S16 rgSCHTomUtlFillHqFdbkRecpReq (recpReqInfo, cellCb, validIdx, err)
   TfuRecpReqInfo   *recpReqInfo;
   RgSchCellCb      *cellCb;
   U16              validIdx; 
   RgSchErrInfo     *err;
#endif
#else
#ifdef ANSI
PRIVATE S16 rgSCHTomUtlFillHqFdbkRecpReq
(
 TfuRecpReqInfo   *recpReqInfo,
 RgSchCellCb      *cellCb,
 RgSchErrInfo     *err
 )
#else
PRIVATE S16 rgSCHTomUtlFillHqFdbkRecpReq (recpReqInfo, cellCb, err)
   TfuRecpReqInfo   *recpReqInfo;
   RgSchCellCb      *cellCb;
   RgSchErrInfo     *err;
#endif
#endif
{
   CmLteTimingInfo         uciTime;
   CmLteTimingInfo         dlSfTime;
   CmLteTimingInfo         nxtfrm;
   RgSchDlSf               *dlSf;
   RgSchDlSf               *nxtDlsf=NULLP;
   S16                     ret;
   U8                      loop;
   U8                      ulDlCfgIdx = cellCb->ulDlCfgIdx;
   U8                      noFdbks;
   RgSchTddDlAscSetIdxK    ascIdx;
   CmMemListCp             *memCp;
   RgSchUePucchRecpInfo    *pucchInfo = NULLP;

   TRC2(rgSCHTomUtlFillHqFdbkRecpReq);
   ret = rgSCHUtlAllocEventMem(cellCb->instIdx, (Ptr *)&memCp,
               sizeof(CmMemListCp));
   if (ret != ROK)            
   {
      RLOG_ARG0(L_ERROR,DBG_CELLID,cellCb->cellId,"Unable to "
         "Allocate TfuRecpReqInfo for cell");
      err->errCause = RGSCHERR_TOM_MEM_EXHAUST;
      RETVALUE(ret);
   }

   RG_SCH_ADD_TO_CRNT_TIME(cellCb->crntTime, uciTime, TFU_RECPREQ_DLDELTA);

   /* ccpu132282-MOD- Smallest m Value should be picked instead of last 
    * one from K-set*/
   ascIdx = rgSchTddDlHqPucchResCalTbl[ulDlCfgIdx][uciTime.subframe];
   noFdbks = ascIdx.numFdbkSubfrms;

   for(loop=0; loop < noFdbks; loop++)
   {
      /* Get the subframe and sfn for which HARQ Ack/Nack
       * has to be sent */
      /* ccpu00132341-MOD- optimized getting DLSF time using macro*/
      /* ccpu00133109: Removed RGSCHSUBFRMCRNTTIME as it is not giving proper 
       * output if diff is more than 10. Instead using RGSCHDECRFRMCRNTTIME() 
       * as it is serving the purpose */
      RGSCHDECRFRMCRNTTIME(uciTime, dlSfTime, ascIdx.subfrmNum[loop]);
      dlSf = rgSCHUtlSubFrmGet (cellCb, dlSfTime);
      if(cellCb->ulDlCfgIdx != 5)
      {
         rgSCHUtlGetNxtDlSfInfo(dlSfTime, cellCb, dlSf, &nxtDlsf, &nxtfrm);
      }

      /* Fills Harq Ack/Nack Repetition Feedback reception request 
       * for a subframe */
#ifdef TFU_UPGRADE
      ret = rgSCHTomUtlFillSfRepHqFdbk(recpReqInfo, cellCb, err, 
            dlSf, noFdbks, memCp, loop, nxtDlsf, validIdx);
#else
      ret = rgSCHTomUtlFillSfRepHqFdbk(recpReqInfo, cellCb, err, 
            dlSf, noFdbks, memCp, loop, nxtDlsf);
#endif

      if(ret != ROK)
      {
         RETVALUE(RFAILED);
      }

      /* Fills Harq Ack/Nack Feedback reception request 
       * for a subframe */
#ifdef TFU_UPGRADE
      ret = rgSCHTomUtlFillSfHqFdbk(recpReqInfo, cellCb, err, 
            dlSf, noFdbks, memCp, loop, nxtDlsf, validIdx);
#else
      ret = rgSCHTomUtlFillSfHqFdbk(recpReqInfo, cellCb, err, 
            dlSf, noFdbks, memCp, loop, nxtDlsf);
#endif

      if(ret != ROK)
      {
         RETVALUE(RFAILED);
      }
   } /* end of for */

   /* For remaining UEs for which TFU request was not sent */
   for(;;)
   {
      ret = cmHashListGetNext(&cellCb->ueTfuPendLst, NULLP,
            (PTR *) &pucchInfo);
      if(ret != ROK)
      {
         break;
      }
#ifndef TFU_UPGRADE
      pucchInfo->pucchRecpInfo->t.pucchRecpReq.type = TFU_UCI_HARQ;
#else
      pucchInfo->pucchRecpInfo->type = TFU_RECP_REQ_PUCCH;
#endif
      cmLListAdd2Tail(&recpReqInfo->ueRecpReqLst, 
            &(pucchInfo->pucchRecpInfo->lnk));
      pucchInfo->pucchRecpInfo->lnk.node = (PTR)pucchInfo->pucchRecpInfo;
      cmHashListDelete(&cellCb->ueTfuPendLst, (PTR) pucchInfo);
   }

   RGSCH_FREE_MEM(memCp);

   RETVALUE(ROK);
} /* end of rgSCHTomUtlFillHqFdbkRecpReq */

#else
#ifdef LTEMAC_SPS
/** @brief This function will prepare the HQ Reception request for 
 * for a UE with a release-PDCCH 
 *
 * @details
 *
 *     Function: 
 *
 *         Processing steps:
 *         - Allocates PUCCH RR and sends a HQ reception request
 *           
 *
 * @param  [in] RgSchCellCb   *cell,
 * @param  [in] RgSchDlSf       *dlSf,
 * @param  [in] TfuRecpReqInfo          *recpReqInfo,
 * @param  [in] U16 validIdx,
 * @param  [in] RgSchErrInfo    *err

 *  @return  S16
 *      -# ROK 
 *      -# RFAILED 
 */
#ifdef TFU_UPGRADE
#ifdef ANSI
PRIVATE S16 rgSCHTomCnsdrRelPdcch
(
 RgSchCellCb   *cell,
 RgSchDlSf       *dlSf,
 TfuRecpReqInfo          *recpReqInfo,
 U16 validIdx,
 RgSchErrInfo    *err
 )
#else
PRIVATE S16 rgSCHTomCnsdrRelPdcch(cell, dlSf, recpReqInfo, validIdx, err)
  RgSchCellCb    *cell;
   RgSchDlSf       *dlSf;
   TfuRecpReqInfo          *recpReqInfo;
   U16   validIdx;
   RgSchErrInfo    *err;
#endif
#else
#ifdef ANSI
PRIVATE S16 rgSCHTomCnsdrRelPdcch
(
 RgSchCellCb   *cell,
 RgSchDlSf       *dlSf,
 TfuRecpReqInfo          *recpReqInfo,
 RgSchErrInfo    *err
 )
#else
PRIVATE S16 rgSCHTomCnsdrRelPdcch(cell, dlSf, recpReqInfo, err)
  RgSchCellCb    *cell;
   RgSchDlSf       *dlSf;
   TfuRecpReqInfo          *recpReqInfo;
   RgSchErrInfo    *err;
#endif
#endif
{
   S16          ret;
   TfuUeRecpReqInfo     *pucchRecpInfo;
#ifdef TFU_UPGRADE   
   RgSchUeCb *ue;
#endif
   RgSchPdcch *relPdcch = dlSf->relPdcch;
   TRC2(rgSCHTomCnsdrRelPdcch)
   ret = ROK;
      /* A feedback reception request needs to be sent for release PDCCH */
      if ((ret = rgSCHUtlGetEventMem((Ptr *)&pucchRecpInfo,
                  sizeof(TfuUeRecpReqInfo), 
                  &(recpReqInfo->memCp))) != ROK)
      {
         RLOG_ARG0(L_ERROR,DBG_CELLID,cell->cellId,"Unable to Allocate "
            "TfuUeRecpReqInfo for cell");
         err->errCause = RGSCHERR_TOM_MEM_EXHAUST;
         RETVALUE(ret);
      }
      pucchRecpInfo->type = TFU_RECP_REQ_PUCCH;
      /* Assumed UE will not be NULLP for a release PDCCH */
      pucchRecpInfo->rnti = relPdcch->rnti;
#ifndef TFU_UPGRADE
#ifndef TFU_TDD         
      pucchRecpInfo->t.pucchRecpReq.hqType = TFU_HQ_RECP_REQ_NORMAL;
      pucchRecpInfo->t.pucchRecpReq.t.nCce = relPdcch->nCce;
#endif
      /* Handling of other types */
      pucchRecpInfo->t.pucchRecpReq.type = TFU_UCI_HARQ;
#else   /* TFU_UPGRADE */
      pucchRecpInfo->t.pucchRecpReq.uciInfo = TFU_PUCCH_HARQ;
      pucchRecpInfo->t.pucchRecpReq.hqInfo.hqRes[0] = (relPdcch->nCce +
            cell->pucchCfg.n1PucchAn);
      pucchRecpInfo->t.pucchRecpReq.hqInfo.hqSz = 1; /* NON-MIMO */ 
      ue = rgSCHDbmGetUeCb (cell, dlSf->relPdcch->rnti);
      rgSCHTomUtlFillCqiSrSrsWithHq(cell,recpReqInfo, ue, 
                  pucchRecpInfo, validIdx,FALSE);  
#endif /* TFU_UPGRADE */
      cmLListAdd2Tail(&recpReqInfo->ueRecpReqLst, &(pucchRecpInfo->lnk));
      pucchRecpInfo->lnk.node = (PTR)pucchRecpInfo;   
   RETVALUE(ret);
} /* end of rgSCHTomCnsdrRelPdcch*/ 
#endif

/** @brief This function handles filling of Hq reception request to
 *   Per Hq Proc.
 *
 * @details
 *
 *     Function: 
 *
 *         Processing steps:
 *
 *  @return  S16
 *      -# ROK 
 *      -# RFAILED 
 */
#ifdef TFU_UPGRADE
#ifdef ANSI
PRIVATE S16 rgSCHTomUtlFillHqFdbkInfo
(
 TfuRecpReqInfo          *recpReqInfo,
 RgSchCellCb             *cell,
 U16                     validIdx,
 RgSchDlHqProcCb         *hqCb,
 RgSchDlSf               *nxtDlsf,
 TfuUeRecpReqInfo        *pucchRecpInfo,
 RgSchDlHqProcCb         *prvHqCb,
 RgSchErrInfo            *err
 )
#else
PRIVATE S16 rgSCHTomUtlFillHqFdbkInfo (recpReqInfo, cell, validIdx, hqCb, nxtDlsf, pucchRecpInfo, prvHqCb, err)
   TfuRecpReqInfo          *recpReqInfo;
   RgSchCellCb             *cell;
   U16                     validIdx; 
   RgSchDlHqProcCb         *hqCb;
   RgSchDlSf               *nxtDlsf;
   TfuUeRecpReqInfo        *pucchRecpInfo;
   RgSchDlHqProcCb         *prvHqCb;
   RgSchErrInfo            *err;
#endif
#else
#ifdef ANSI
PRIVATE S16 rgSCHTomUtlFillHqFdbkInfo
(
TfuRecpReqInfo          *recpReqInfo,
RgSchCellCb             *cell,
RgSchDlHqProcCb         *hqCb,
RgSchDlSf               *nxtDlsf,
TfuUeRecpReqInfo        *pucchRecpInfo,
RgSchDlHqProcCb         *prvHqCb,
RgSchErrInfo            *err
)
#else
PRIVATE S16 rgSCHTomUtlFillHqFdbkInfo (recpReqInfo, cell, hqCb, nxtDlsf, pucchRecpInfo, prvHqCb, err)
TfuRecpReqInfo          *recpReqInfo;
RgSchCellCb             *cell;
RgSchDlHqProcCb         *hqCb;
RgSchDlSf               *nxtDlsf;
TfuUeRecpReqInfo        *pucchRecpInfo;
RgSchDlHqProcCb         *prvHqCb;
RgSchErrInfo            *err;
#endif
#endif 
{ 
   S16                  ret;
   RgSchDlHqTbCb        *tbCb;
   U32                  idx;


   for (idx = 0 ;idx < 2; idx++)
   {
      if (HQ_TB_WAITING == hqCb->tbInfo[idx].state)
      {
         tbCb = &hqCb->tbInfo[idx];

         /* FOR ACK NAK REP */
         if ((hqCb->hqE->ue != NULLP) &&
               (hqCb->hqE->ue->measGapCb.isMeasuring == TRUE))
         {
            if ((tbCb->fbkRecpRepCntr) && 
                  (--tbCb->fbkRecpRepCntr))
            {
               /* Add to next subfarme */
               /* Add this hqCb to the next dlSf's ackNakRepQ */
               cmLListAdd2Tail (&(nxtDlsf->ackNakRepQ), 
                     &(tbCb->anRepLnk[tbCb->fbkRecpRepCntr]));
               tbCb->anRepLnk[tbCb->fbkRecpRepCntr].node = (PTR)tbCb;
               tbCb->crntSubfrm[tbCb->fbkRecpRepCntr] = nxtDlsf;
            }
#ifdef TFU_UPGRADE
            rgSCHTomUtlMoveNxtOccasion(cell, hqCb->hqE->ue, validIdx);
#endif 
            continue;
         }
#ifdef TFU_UPGRADE
         if (hqCb->tbCnt) 
         {
            hqCb->tbCnt--;
            /* Go to the next node */
            continue;
         }
#endif


         //if (hqCb != prvHqCb) 
         {
            ret = rgSCHUtlGetEventMem((Ptr *)&pucchRecpInfo,
                  sizeof(TfuUeRecpReqInfo), &(recpReqInfo->memCp));
            if (ret != ROK)
            {
               RLOG_ARG0(L_ERROR,DBG_CELLID,cell->cellId,"Unable to Allocate "
                        "TfuUeRecpReqInfo for cell");
               err->errCause = RGSCHERR_TOM_MEM_EXHAUST;
               RETVALUE(ret);
            }
            pucchRecpInfo->type = TFU_RECP_REQ_PUCCH;
            if ((hqCb->hqE->ue != NULLP) /*&& 
                                           ((tbCb->lchSchdData[0].lcId != 0) || (tbCb->taSnt ==
                                           TRUE))*/
               )
            {
               pucchRecpInfo->rnti = hqCb->hqE->ue->ueId;
            }
            else
            {
               if (hqCb->hqE->raCb)
               {
                  pucchRecpInfo->rnti    =  hqCb->hqE->raCb->tmpCrnti;
               }
            }
#ifndef TFU_UPGRADE
#ifndef TFU_TDD         
#ifdef LTEMAC_SPS
            if (!hqCb->spsN1PucchRes.pres)
#endif
            {
               pucchRecpInfo->t.pucchRecpReq.hqType = 
                  TFU_HQ_RECP_REQ_NORMAL;
               pucchRecpInfo->t.pucchRecpReq.t.nCce = 
                  hqCb->pdcch->nCce;
            }
#ifdef LTEMAC_SPS
            else
            {
               pucchRecpInfo->t.pucchRecpReq.hqType = 
                  TFU_HQ_RECP_REQ_N1PUCCH;
               pucchRecpInfo->t.pucchRecpReq.t.n1Pucch =
                  hqCb->spsN1PucchRes.val;
            }
#endif
#endif
            /* Handling of other types */
            pucchRecpInfo->t.pucchRecpReq.type = TFU_UCI_HARQ;
#else   /* TFU_UPGRADE */
            pucchRecpInfo->t.pucchRecpReq.uciInfo = TFU_PUCCH_HARQ;
            if ((hqCb->tbInfo[0].state == HQ_TB_WAITING) && 
                  (hqCb->tbInfo[1].state == HQ_TB_WAITING))
            {
               pucchRecpInfo->t.pucchRecpReq.hqInfo.hqSz = 2; /* MIMO */
            }
            else
            {
               pucchRecpInfo->t.pucchRecpReq.hqInfo.hqSz = 1; /* NON-MIMO */ 
            }
            {
#ifdef LTEMAC_SPS
               /* PucchRecpReq needs to be filled up for n1Pucch resource for SPS
                * ocassions */
               if (hqCb->spsN1PucchRes.pres)
               {
                  pucchRecpInfo->t.pucchRecpReq.hqInfo.hqRes[0] = hqCb->spsN1PucchRes.val;
               }
               else
#endif /* LTEMAC_SPS */
               {
                  pucchRecpInfo->t.pucchRecpReq.hqInfo.hqRes[0] = (hqCb->pdcch->nCce +
                        cell->pucchCfg.n1PucchAn);
               }
            }
#endif/*TFU_UPGRADE*/

#ifdef TFU_UPGRADE
            rgSCHTomUtlFillCqiSrSrsWithHq(cell,recpReqInfo, hqCb->hqE->ue, 
                  pucchRecpInfo, validIdx,FALSE);    
#endif 

            cmLListAdd2Tail(&recpReqInfo->ueRecpReqLst, &(pucchRecpInfo->lnk));
            pucchRecpInfo->lnk.node = (PTR)pucchRecpInfo;
         }

         if ((tbCb->fbkRecpRepCntr) && 
               (--tbCb->fbkRecpRepCntr))
         {
            /* Add to next subfarme */
            /* Add this hqCb to the next dlSf's ackNakRepQ */
            cmLListAdd2Tail (&(nxtDlsf->ackNakRepQ), 
                  &(tbCb->anRepLnk[tbCb->fbkRecpRepCntr]));
            tbCb->anRepLnk[tbCb->fbkRecpRepCntr].node = (PTR)tbCb;
            tbCb->crntSubfrm[tbCb->fbkRecpRepCntr] = nxtDlsf;
         }
         break;
      }
   }
   RETVALUE(ROK);
}/* end of rgSCHTomUtlFillHqFdbkInfo */

#ifdef LTE_ADV
/** @brief This function handles filling of Hq reception request to
 *   Per Hq Proc.
 *
 * @details
 *
 *     Function:rgSCHTomUtlFillHqFdbkForFrmt1B 
 *
 *         Processing steps:
 *         Allocates the N1Pucch Resources based on teh A Value
 *
 * @param  [out] TfuRecpReqInfo   *recpReqInfo
 * @param  [in]  RgSchCellCb      *cell
 * @param  [in]  U16              validIdx,
 * @param  [in]  RgSchDlHqInfo    *dlSfHqInfo,
 * @param  [in]  RgSchDlSf        *dlSf,
 * @param  [in]  TfuUeRecpReqInfo *pucchRecpInfo,
 * @param  [out] RgSchErrInfo     *err
 *
 *  @return  S16
 *      -# ROK 
 *      -# RFAILED 
 */
#ifdef TFU_UPGRADE
#ifdef ANSI
PRIVATE S16 rgSCHTomUtlFillHqFdbkForFrmt1B
(
 TfuRecpReqInfo          *recpReqInfo,
 RgSchCellCb             *cell,
 U16                     validIdx,
 RgSchDlHqInfo           *dlSfHqInfo,
 RgSchDlSf               *dlSf,
 TfuUeRecpReqInfo        *pucchRecpInfo,
 RgSchErrInfo            *err
 )
#else
PRIVATE S16 rgSCHTomUtlFillHqFdbkForFrmt1B (recpReqInfo, cell, validIdx, hqCb, dlSf, pucchRecpInfo, err)
   TfuRecpReqInfo          *recpReqInfo;
   RgSchCellCb             *cell;
   U16                     validIdx; 
   RgSchDlHqInfo           *dlSfHqInfo;
   RgSchDlSf               *dlSf;
   TfuUeRecpReqInfo        *pucchRecpInfo;
   RgSchErrInfo            *err;
#endif
#else
#ifdef ANSI
PRIVATE S16 rgSCHTomUtlFillHqFdbkForFrmt1B
(
TfuRecpReqInfo          *recpReqInfo,
RgSchCellCb             *cell,
RgSchDlHqInfo           *dlSfHqInfo,
RgSchDlSf               *dlSf,
TfuUeRecpReqInfo        *pucchRecpInfo,
RgSchErrInfo            *err
)
#else
PRIVATE S16 rgSCHTomUtlFillHqFdbkForFrmt1B (recpReqInfo, cell, hqCb, dlSf, pucchRecpInfo, err)
TfuRecpReqInfo          *recpReqInfo;
RgSchCellCb             *cell;
RgSchDlHqInfo           *dlSfHqInfo;
RgSchDlSf               *dlSf;
TfuUeRecpReqInfo        *pucchRecpInfo;
RgSchErrInfo            *err;
#endif
#endif 
{ 
#ifdef DEBUGP
   Inst                 inst = cell->instIdx;
#endif
   S16                  ret;
   CmLList              *hqPNode;
   RgSchDlHqProcCb      *hqCb = NULLP;
   RgSchUeCb            *ue;
   TfuUePucchRecpReq    *pucchReqInfo = NULLP;
   Bool                 isDatPresOnSecCell = FALSE;
   U8                   primCellTbCount = 0;

   hqPNode = dlSfHqInfo->hqPLst.first;
   ue = (RgSchUeCb*)dlSfHqInfo->dlSfUeLnk.node;
   
   if (ue == NULLP)
   {
      RETVALUE(RFAILED);
   }
   ret = rgSCHUtlGetEventMem((Ptr *)&pucchRecpInfo,
         sizeof(TfuUeRecpReqInfo), &(recpReqInfo->memCp));
   if (ret != ROK)
   {
      RGSCHDBGERRNEW(inst,(rgSchPBuf(inst),"Unable to Allocate "
               "TfuUeRecpReqInfo for cellId=%d \n", cell->cellId));
      err->errCause = RGSCHERR_TOM_MEM_EXHAUST;
      RETVALUE(ret);
   }
   pucchRecpInfo->type = TFU_RECP_REQ_PUCCH;
   pucchRecpInfo->rnti = ue->ueId; /* Even for Rel pdcch also setting CRNTI
                                      * instead of SPS-CRNTI */

   pucchReqInfo = &(pucchRecpInfo->t.pucchRecpReq);

#ifndef TFU_UPGRADE
   pucchReqInfo->hqType = TFU_HQ_RECP_REQ_NORMAL;
   /* Handling of other types */
   pucchReqInfo->type = TFU_UCI_HARQ;
#else   /* TFU_UPGRADE */
   pucchReqInfo->uciInfo = TFU_PUCCH_HARQ;
   /* Fill hqFdbkMode by using uciFrmtTyp from dlSfHqInfo */
   pucchReqInfo->hqInfo.hqFdbkMode = rgSchUtlGetFdbkMode(dlSfHqInfo->uciFrmtTyp);
   /* Fill HqSz by using totalTbCnt based on the TM mode and
    * the number of serv cells configured*/

   pucchReqInfo->hqInfo.hqSz = ue->f1bCsAVal;
   pucchReqInfo->hqInfo.pucchResCnt = ue->f1bCsAVal;

  cmMemset((U8 *)pucchReqInfo->hqInfo.hqRes,0xff,sizeof(U16)*TFU_MAX_HQ_RES);
#ifdef LTEMAC_SPS
   /* Two Resources needs to be configured if the 
    * serving cell is in mimo mode else single
    * resource */
   if ((dlSf->relPdcch != NULLP) && 
         (RGSCH_TIMEINFO_SAME(recpReqInfo->timingInfo, ue->relPdcchFbkTiming)))
   {/* Pcell is having sps rel pdcch present */
      if(rgSCHUtlGetMaxTbSupp(ue->mimoInfo.txMode) > 1)
      {/* prim cell is in mimo mode, use 0 and 1 */
         pucchReqInfo->hqInfo.hqRes[0] = (dlSf->relPdcch->nCce +
                                          cell->pucchCfg.n1PucchAn);
         pucchReqInfo->hqInfo.hqRes[1] = pucchReqInfo->hqInfo.hqRes[0] + 1; 
                                        
             
      }else
      {
         pucchReqInfo->hqInfo.hqRes[2] = (dlSf->relPdcch->nCce +
                                          cell->pucchCfg.n1PucchAn);
      }
      /* Release the pdcch  so that it will not further processed */
      rgSCHUtlPdcchPut(ue->cell,&dlSf->pdcchInfo, dlSf->relPdcch);
      dlSf->relPdcch = NULLP;/* only one UE will be scheduled for release pdcch order in one tti */
   }
#endif/*LTEMAC_SPS*/
#endif/*TFU_UPGRADE*/
   while(hqPNode)
   {
      hqCb = (RgSchDlHqProcCb *)hqPNode->node;
      hqPNode = hqPNode->next;
      /* In case of CSI + 1BCS , CSI will be 
       * dropped if scheduling is present on
       * seconday cell.36.213 10.1.1
       * */
      if(RG_SCH_IS_CELL_SEC(ue,hqCb->hqE->cell))
      {
         isDatPresOnSecCell = TRUE;
      }else
      {
         if ((hqCb->tbInfo[0].state == HQ_TB_WAITING) && 
             (hqCb->tbInfo[1].state == HQ_TB_WAITING))
         {
            primCellTbCount = 2;
         }else
         {
            primCellTbCount = 1;
         }
      }
#ifndef TFU_UPGRADE
      pucchReqInfo->t.nCce = hqCb->pdcch->nCce;
#else
      {
         switch(ue->f1bCsAVal)
         {/* A Value */
            case RG_SCH_A_VAL_2:
               /* harq(0) is primary harq(1) is secondary) */
               if(RG_SCH_IS_CELL_SEC(ue,hqCb->hqE->cell))
               {
                   pucchReqInfo->hqInfo.hqRes[1] = ue->n1PucchF1bResCb.\
                                                   cw1N1Res[hqCb->tpc].n1PucchIdx;
               }
               else/* primary cell */
               {
#ifdef LTEMAC_SPS
                  /* Need to consider only sps occasions */
                  if (hqCb->spsN1PucchRes.pres)
                  {
                     pucchReqInfo->hqInfo.hqRes[0] = hqCb->spsN1PucchRes.val;
                  }
                  else
#endif /* LTEMAC_SPS */
                  {

                     pucchReqInfo->hqInfo.hqRes[0] = (hqCb->pdcch->nCce +
                           cell->pucchCfg.n1PucchAn);
                  }
               }
               break;
            case RG_SCH_A_VAL_3:
               /* Serving cell in mimo mode should be
                * in 0 and 1 and the serving cell in siso
                * mode should be in 2 indices */
               if(RG_SCH_IS_CELL_SEC(ue,hqCb->hqE->cell))
               {
                   U8 cellIdx = ue->cellIdToCellIdxMap[RG_SCH_CELLINDEX(hqCb->hqE->cell)];
                   if(rgSCHUtlGetMaxTbSupp(ue->cellInfo[cellIdx]->txMode.txModeEnum) > 1)
                   {/* Sec cell is in mimo mode, use 0 and 1 */
                      pucchReqInfo->hqInfo.hqRes[0] = 
                         ue->n1PucchF1bResCb.cw1N1Res[hqCb->tpc].n1PucchIdx;

                      pucchReqInfo->hqInfo.hqRes[1] = 
                            ue->n1PucchF1bResCb.cw2N1Res[hqCb->tpc].n1PucchIdx;
                   }
                   else
                   {/* Sec cell is in siso mode, use 2 */
                      pucchReqInfo->hqInfo.hqRes[2] = 
                         ue->n1PucchF1bResCb.cw1N1Res[hqCb->tpc].n1PucchIdx;
                   }   
               }
               else
               {/* primary cell hq */
                  if(rgSCHUtlGetMaxTbSupp(ue->mimoInfo.txMode) > 1)
                  {/* prim cell is in mimo mode, use 0 and 1 */
#ifdef LTEMAC_SPS
                     if (hqCb->spsN1PucchRes.pres)
                     {/* SPS occasions */
                        pucchReqInfo->hqInfo.hqRes[0] = hqCb->spsN1PucchRes.val;
                        pucchReqInfo->hqInfo.hqRes[1] = hqCb->spsN1PucchRes.val + 1;
                     }
                     else
#endif /* LTEMAC_SPS */
                     {
                        pucchReqInfo->hqInfo.hqRes[0] = (hqCb->pdcch->nCce +
                              cell->pucchCfg.n1PucchAn);
                        pucchReqInfo->hqInfo.hqRes[1] = (hqCb->pdcch->nCce +
                                 cell->pucchCfg.n1PucchAn + 1);
                     }
                  }
                  else
                  {/* prim cell is in siso mode use 2 */
#ifdef LTEMAC_SPS
                     /* Need to consider only sps occasions */
                     if (hqCb->spsN1PucchRes.pres)
                     {
                        pucchReqInfo->hqInfo.hqRes[2] = hqCb->spsN1PucchRes.val;
                     }
                     else
#endif /* LTEMAC_SPS */
                     {

                        pucchReqInfo->hqInfo.hqRes[2] = (hqCb->pdcch->nCce +
                              cell->pucchCfg.n1PucchAn);

                     }
                  }
               }
               break;
            case RG_SCH_A_VAL_4:
               {
                  if(RG_SCH_IS_CELL_SEC(ue,hqCb->hqE->cell))
                  {/*  2 and 3 for sec cell */
                     pucchReqInfo->hqInfo.hqRes[2] = 
                        ue->n1PucchF1bResCb.cw1N1Res[hqCb->tpc].n1PucchIdx;
                     pucchReqInfo->hqInfo.hqRes[3] = 
                        ue->n1PucchF1bResCb.cw2N1Res[hqCb->tpc].n1PucchIdx;
                  }
                  else/* primary cell */
                  {/* 0 and 1 are for primary cell */
#ifdef LTEMAC_SPS
                     /* Need to consider only sps occasions */
                     if (hqCb->spsN1PucchRes.pres)
                     {
                        pucchReqInfo->hqInfo.hqRes[0] = hqCb->spsN1PucchRes.val;
                        pucchReqInfo->hqInfo.hqRes[1] = hqCb->spsN1PucchRes.val + 1;
                     }
                     else
#endif /* LTEMAC_SPS */
                     {

                        pucchReqInfo->hqInfo.hqRes[0] = (hqCb->pdcch->nCce +
                              cell->pucchCfg.n1PucchAn);
                        pucchReqInfo->hqInfo.hqRes[1] = (hqCb->pdcch->nCce +
                              cell->pucchCfg.n1PucchAn + 1);
                     }
                  }
               }

               break;
            default:
               /* TOD:: Add error print */
               break;
         }
      }
#endif/*TFU_UPGRADE*/
   }
#ifdef TFU_UPGRADE

#ifdef CA_DBG
   {
      gF1bCsCount++;
      gF1bCsPres = TRUE;
   }

#endif
   rgSCHTomUtlFillCqiSrSrsWithHq(cell,recpReqInfo, ue, 
         pucchRecpInfo, validIdx,isDatPresOnSecCell);    

   /* Channel selection wil not be used in case of
    * CQI + HARQ. if the data was present only on 
    * primary cell */
#if 1
   if((isDatPresOnSecCell == FALSE) &&
      (dlSfHqInfo->uciFrmtTyp == RG_SCH_UCI_FORMAT1B_CS))
   {/* Data is present only on primary cell */
    
      switch(pucchReqInfo->uciInfo)
      {
         case TFU_PUCCH_HARQ_SRS:
         case TFU_PUCCH_HARQ_CQI:
         case TFU_PUCCH_HARQ_SR_SRS:
         case TFU_PUCCH_HARQ_SR_CQI:
            {
               dlSfHqInfo->uciFrmtTyp          = RG_SCH_UCI_FORMAT1A_1B;
               pucchReqInfo->hqInfo.hqSz       = primCellTbCount;
               pucchReqInfo->hqInfo.hqFdbkMode = rgSchUtlGetFdbkMode(dlSfHqInfo->uciFrmtTyp);
            }
            break;
         default:
            {
               break;
            }
      }
   }
#endif
#endif/*TFU_UPGRADE*/
   cmLListAdd2Tail(&recpReqInfo->ueRecpReqLst, &(pucchRecpInfo->lnk));
   pucchRecpInfo->lnk.node = (PTR)pucchRecpInfo;
   RETVALUE(ROK);
}/* end of rgSCHTomUtlFillHqFdbkForFrmt1B */

#endif/*LTE_ADV*/

/** @brief This function handles filling of HARQ feedback recption request to
 * PHY.
 *
 * @details
 *
 *     Function: 
 *
 *         Processing steps:
 *
 * @param  [out] TfuRecpReqInfo *recpReqInfo
 * @param  [in]  RgSchCellCb   *cell
 * @param  [out] RgSchErrInfo *err
 *  @return  S16
 *      -# ROK 
 *      -# RFAILED 
 */
#ifdef TFU_UPGRADE
#ifdef ANSI
PRIVATE S16 rgSCHTomUtlFillHqFdbkRecpReq
(
 TfuRecpReqInfo          *recpReqInfo,
 RgSchCellCb             *cell,
 U16                  validIdx,
 RgSchErrInfo            *err
 )
#else
PRIVATE S16 rgSCHTomUtlFillHqFdbkRecpReq (recpReqInfo, cell, validIdx, err)
   TfuRecpReqInfo          *recpReqInfo;
   RgSchCellCb             *cell;
   U16                  validIdx; 
   RgSchErrInfo            *err;
#endif
#else
#ifdef ANSI
PRIVATE S16 rgSCHTomUtlFillHqFdbkRecpReq
(
TfuRecpReqInfo          *recpReqInfo,
RgSchCellCb             *cell,
RgSchErrInfo            *err
)
#else
PRIVATE S16 rgSCHTomUtlFillHqFdbkRecpReq (recpReqInfo, cell, err)
TfuRecpReqInfo          *recpReqInfo;
RgSchCellCb             *cell;
RgSchErrInfo            *err;
#endif
#endif 
{
   CmLList              *node;
   CmLList              *hqPNode;
   RgSchDlHqProcCb      *hqCb;
   CmLteTimingInfo      futTime;
   RgSchDlSf            *dlSf;
   RgSchDlSf            *nxtDlsf;
   TfuUeRecpReqInfo     *pucchRecpInfo = NULLP;
   S16                  ret;
#ifdef DEBUGP
   Inst                 inst = cell->instIdx;
#endif
   RgSchUeCb            *ue;
   RgSchDlHqTbCb        *tbCb;
   RgSchDlHqProcCb      *prvHqCb=NULLP;

   TRC2(rgSCHTomUtlFillHqFdbkRecpReq);

#ifdef CA_DBG
   {
      gF1bCsPres = FALSE;
   }
#endif
   /* ccpu00133109: Removed RGSCHSUBFRMCRNTTIME as it is not giving proper output 
    * if diff is more than 10. Instead using RGSCHDECRFRMCRNTTIME() as it is 
    * serving the purpose */
   RGSCHDECRFRMCRNTTIME(cell->crntTime, futTime, (RG_SCH_CMN_HARQ_INTERVAL - 
       TFU_RECPREQ_DLDELTA));
   dlSf = rgSCHUtlSubFrmGet (cell, futTime);
   /* Get the next dlsf as well */
   RG_SCH_ADD_TO_CRNT_TIME(futTime, futTime, 1)
   nxtDlsf = rgSCHUtlSubFrmGet (cell, futTime);

   /* FOR ACK NACK REP */
   node = dlSf->ackNakRepQ.first;
   while (node)
   {
      tbCb = (RgSchDlHqTbCb *)(node->node);
      hqCb = tbCb->hqP;
      ue = hqCb->hqE->ue;
      /* FOR ACK NAK REP */
      if ((tbCb->fbkRecpRepCntr) && 
            (--tbCb->fbkRecpRepCntr))
      {
         /* Add to next subfarme */
         /* Add this hqCb to the next dlSf's ackNakRepQ */
         cmLListAdd2Tail (&(nxtDlsf->ackNakRepQ), 
               &(tbCb->anRepLnk[tbCb->fbkRecpRepCntr]));
         tbCb->anRepLnk[tbCb->fbkRecpRepCntr].node = (PTR)tbCb;
         tbCb->crntSubfrm[tbCb->fbkRecpRepCntr] = nxtDlsf;
      }
      /* In case the HARQ feedback comes with PUSCH */
#ifdef TFU_UPGRADE
      if (hqCb->tbCnt) 
      {
         hqCb->tbCnt--;
         /* Go to the next node */
         node = node->next;
         continue;
      }
#endif
      if ((hqCb->hqE->ue != NULLP) &&
            (hqCb->hqE->ue->measGapCb.isMeasuring != TRUE)
            && (hqCb != prvHqCb)
         )
      {
         /* We need to add the recp request to be sent on the pucchANRep
          * value.
          */
          ret = rgSCHUtlGetEventMem((Ptr *)&pucchRecpInfo,
                     sizeof(TfuUeRecpReqInfo), &(recpReqInfo->memCp));
         if (ret != ROK)
         {
            RGSCHDBGERRNEW(inst,(rgSchPBuf(inst),"Unable to Allocate "
               "TfuUeRecpReqInfo for cellId=%d \n", cell->cellId));
            err->errCause = RGSCHERR_TOM_MEM_EXHAUST;
            RETVALUE(ret);
         }
         pucchRecpInfo->rnti    =  ue->ueId;
         /*ccpu00116711- Missing TFU_RECP_REQ_PUCCH field assignment*/
         pucchRecpInfo->type    =  TFU_RECP_REQ_PUCCH;
#ifndef TFU_UPGRADE
         pucchRecpInfo->t.pucchRecpReq.type = TFU_UCI_HARQ;
#else
         pucchRecpInfo->t.pucchRecpReq.uciInfo = TFU_PUCCH_HARQ;
         if ((hqCb->tbInfo[0].state == HQ_TB_WAITING) && 
               (hqCb->tbInfo[1].state == HQ_TB_WAITING))
         {
            pucchRecpInfo->t.pucchRecpReq.hqInfo.hqSz = 2; /* MIMO */
         }
         else
         {
            pucchRecpInfo->t.pucchRecpReq.hqInfo.hqSz = 1; /* NON MIMO */
         }
         pucchRecpInfo->t.pucchRecpReq.hqInfo.hqRes[0] = 
            ue->ackNakRepCb.pucchRes; 
#endif /* TFU_UPGRADE */

#ifndef TFU_UPGRADE
         pucchRecpInfo->t.pucchRecpReq.hqType = TFU_HQ_RECP_REQ_N1PUCCH;
         pucchRecpInfo->t.pucchRecpReq.t.n1Pucch = ue->ackNakRepCb.pucchRes;
#endif /* TFU_UPGRADE */
         cmLListAdd2Tail(&recpReqInfo->ueRecpReqLst, &(pucchRecpInfo->lnk));
         pucchRecpInfo->lnk.node = (PTR)pucchRecpInfo;
      }
      /* In a given dlSf, if there is 2 TBs context 
       * stored for a given harq, then they are added
       * adjacent to each other in the subframe. To avoid
       * adding duplicate recpnInfo for each TB, store this
       * hqCb in prvHqCb. If nextHqCb is same as prvHqCb then
       * do not add reception req info.*/
      prvHqCb = hqCb;
#ifdef TFU_UPGRADE
      if(hqCb->hqE->ue)
      {
         rgSCHTomUtlMoveNxtOccasion(cell, hqCb->hqE->ue, validIdx);
      }
#endif 
      /* Go to the next node */
      node = node->next;
   }

   prvHqCb = NULLP;

   if (dlSf->ueLst.count != 0)
   {
      node =  dlSf->ueLst.first;
      while (node)
      {
         ue = (RgSchUeCb *)(node->node);
         node = node->next;

         if(ue->dl.dlSfHqInfo[dlSf->dlIdx].isPuschHarqRecpPres == TRUE)
         {/* This UE is already considered for PUSCH
             Ignore for PUCCH */
            continue;
         }
         hqPNode = ue->dl.dlSfHqInfo[dlSf->dlIdx].hqPLst.first;
         rgSchSetFormatType(recpReqInfo->timingInfo,ue, dlSf);
#ifdef LTE_ADV
         if(RG_SCH_UCI_FORMAT1B_CS == 
               ue->dl.dlSfHqInfo[dlSf->dlIdx].uciFrmtTyp)
         {
            /* Call a function to fill reception request at Harq Proc Level and
             * not for each harq proc */
#ifdef TFU_UPGRADE
               rgSCHTomUtlFillHqFdbkForFrmt1B(recpReqInfo, cell, validIdx, 
                     &ue->dl.dlSfHqInfo[dlSf->dlIdx], dlSf, pucchRecpInfo, err);
#else
               rgSCHTomUtlFillHqFdbkForFrmt1B(recpReqInfo, cell, &ue->dl.dlSfHqInfo[dlSf->dlIdx], 
                                            dlSf, pucchRecpInfo, err);
#endif

         }
         else    /* [TODO] : Need to Handle format 3 here */
#endif
         {
            while (hqPNode)
            {
               hqCb = (RgSchDlHqProcCb *)hqPNode->node;
               hqPNode = hqPNode->next;
#ifdef TFU_UPGRADE
               rgSCHTomUtlFillHqFdbkInfo (recpReqInfo, cell, validIdx, hqCb, nxtDlsf, pucchRecpInfo, prvHqCb, err);
#else
               rgSCHTomUtlFillHqFdbkInfo (recpReqInfo, cell, hqCb, nxtDlsf, pucchRecpInfo, prvHqCb, err);
#endif
               prvHqCb = hqCb; 
            }
         }
      } /* end of while */
   } /* If hq is expected */

   if (dlSf->msg4HqPLst.count != 0)
   {
      prvHqCb = NULLP;
      node =  dlSf->msg4HqPLst.first;
      while (node)
      {
         hqCb = (RgSchDlHqProcCb*)(node->node);
         node = node->next;
#ifdef TFU_UPGRADE
         rgSCHTomUtlFillHqFdbkInfo (recpReqInfo, cell, validIdx, hqCb, nxtDlsf, pucchRecpInfo, prvHqCb, err);
#else
         rgSCHTomUtlFillHqFdbkInfo (recpReqInfo, cell, hqCb, nxtDlsf, pucchRecpInfo, prvHqCb, err);
#endif
         prvHqCb = hqCb; 
      } /* end of while */
   }

#ifdef LTEMAC_SPS
   if (dlSf->relPdcch)
   {
#ifdef TFU_UPGRADE
      rgSCHTomCnsdrRelPdcch(cell, dlSf, recpReqInfo, validIdx, err);
#else
      rgSCHTomCnsdrRelPdcch(cell, dlSf, recpReqInfo, err);
#endif
   }
#endif /* LTEMAC_SPS */

   /* Check with TDD Code */
   /* FOR ACK NACK REP */
   RETVALUE(ROK);
} /* end of rgSCHTomUtlFillHqFdbkRecpReq */ 
#endif
#ifdef TFU_UPGRADE 
/** @brief This function handles filling of SR reception request to
 * PHY.
 *
 * @details
 *
 *     Function: 
 *
 *         Processing steps:
 *
 * @param  [out] TfuRecpReqInfo *recpReqInfo
 * @param  [in]  RgSchCellCb   *cell
 * @param  [out] RgSchErrInfo *err
 *  @return  S16
 *      -# ROK 
 *      -# RFAILED 
 */
#ifdef ANSI
PRIVATE S16 rgSCHTomUtlFillSrRecpReq
(
 TfuRecpReqInfo          *recpReqInfo,
 RgSchCellCb             *cell,
 U16                  validIdx,
 RgSchErrInfo            *err
 )
#else
PRIVATE S16 rgSCHTomUtlFillSrRecpReq (recpReqInfo, cell, validIdx, err)
   TfuRecpReqInfo          *recpReqInfo;
   RgSchCellCb             *cell;
   U16                  validIdx; 
   RgSchErrInfo            *err;
#endif
{
   CmLList              *node;
   TfuUeRecpReqInfo     *pucchRecpInfo;
   S16                  ret;

   RgSchUeCb            *ue;

#ifdef LTEMAC_SPS
   RgSchCmnUlUeSpsInfo   *ulSpsUe = NULL;
#endif


   TRC2(rgSCHTomUtlFillSrRecpReq);

   node = cell->pCqiSrsSrLst[validIdx].srLst.first;
   while(node)
   {
      ue = (RgSchUeCb *)(node->node);
      /* Fix: ccpu00124011: Fix for missing reception request for UE with same offset */
      node = node->next;
      if(ue == NULLP)
      {
         continue;
      }
      if ((ret = rgSCHUtlGetEventMem((Ptr *)&pucchRecpInfo,
                  sizeof(TfuUeRecpReqInfo),&(recpReqInfo->memCp))) != ROK)
      {
         RLOG_ARG1(L_ERROR,DBG_CELLID,cell->cellId,"Unable to Allocate "
            "TfuUeRecpReqInfo for cell RNTI:%d",ue->ueId);
         err->errCause = RGSCHERR_TOM_MEM_EXHAUST;
         RETVALUE(ret);
      }
#ifdef TFU_ALLOC_EVENT_NO_INIT
     cmMemset((U8 *)&pucchRecpInfo->t.pucchRecpReq, 0, sizeof(TfuUePucchRecpReq));
      pucchRecpInfo->type = TFU_RECP_REQ_PUCCH;
#endif      
      /*Fill SR params*/


#ifdef LTEMAC_SPS
      /* Should we check for Rel8 and above???
       * Dont send SR recp req if logicalChannelSR-Mask enabled and UL SPS is
       * active*/
      ulSpsUe =  RG_SCH_CMN_GET_UL_SPS_UE(ue, cell);
      /* Avoiding check for ulSpsEnabled as isUlSpsActv FALSE if sps is not enabled*/
      if((ue->ul.ulSpsCfg.isLcSRMaskEnab) &&
         (ulSpsUe->isUlSpsActv))
      {
         rgSCHTomUtlMoveSrNxtOccasion(cell, ue);
         continue;
      }
#endif

      pucchRecpInfo->rnti =  ue->ueId; 
      pucchRecpInfo->t.pucchRecpReq.srInfo.n1PucchIdx = 
      ue->srCb.srCfg.srSetup.srResIdx;
      pucchRecpInfo->t.pucchRecpReq.uciInfo = TFU_PUCCH_SR;
      rgSCHTomUtlMoveSrNxtOccasion(cell, ue);
      rgSCHTomUtlFillCqiSrsWithSr(cell, ue, recpReqInfo,  
                  pucchRecpInfo, validIdx); 
      cmLListAdd2Tail(&recpReqInfo->ueRecpReqLst, &(pucchRecpInfo->lnk));
      pucchRecpInfo->lnk.node = (PTR)pucchRecpInfo;
   }
   RETVALUE(ROK);
}/* end of rgSCHTomUtlFillSrRecpReq */


/** @brief This function tells will the UE has a periodic CQI/PMI/RI 
 *  reporting
 *
 * @details
 *
 *     Function: 
 *
 *         Processing steps:
 *
 *  @param  [in]   RgSchUeCb        *ue 
 *  @param  [out]  Bool             *willueRprtCqiRi  
 *  @return  S16
 *      -# ROK 
 *      -# RFAILED 
 */

#ifdef ANSI
PRIVATE S16 rgSCHTomUtlWillUeRprtCqiRi
(
 RgSchUeCb        *ue,
 Bool             *willueRprtCqiRi
 )
#else
PRIVATE S16 rgSCHTomUtlWillUeRprtCqiRi ( ue, willueRprtCqiRi)
 RgSchUeCb        *ue;
 Bool             *willueRprtCqiRi;
#endif
{
   TRC2(rgSCHTomUtlWillUeRprtCqiRi);
  
   /* Intialising Reporting probability as TRUE */ 
   *willueRprtCqiRi = TRUE; 

   /* Checking the cases in which UE will not report CQIPMI/RI */
   if(ue->isDrxEnabled && ue->drxCb)
   {
#ifdef LTEMAC_R9
      if(ue->drxCb->cqiMask.pres && ue->drxCb->cqiMask.val == RGR_DRX_SETUP)
      {/*cqiMask is setup by upper layers */                                
         if((ue->drxCb->drxUlInactvMask & RG_SCH_DRX_ONDUR_BITMASK) ==
               RG_SCH_DRX_ONDUR_BITMASK)
         {/*onDuration NOT running, do not expect cqi/pmi/ri*/
            *willueRprtCqiRi = FALSE;
         }
         RETVALUE(ROK);
      }
#endif /*end of LTEMAC_R9*/
      /* ccpu00134258: Fix for CQI DRX issue*/
      if(ue->drxCb->onDurTmrLen > 2)
      {
         if ( !RG_SCH_DRX_UL_IS_UE_ACTIVE(ue->drxCb) ) 
         {/*UE is not active, do not expect cqi/pmi/ri*/                                  
            *willueRprtCqiRi = FALSE; 
         }
      }
   }/*ue->isDrxEnabled*/
   
   RETVALUE(ROK);
} /*End of rgSCHTomUtlWillUeRprtCqiRi*/

/** @brief This function handles filling of RI reception request to
 * PHY.
 *
 * @details
 *
 *     Function: 
 *
 *         Processing steps:
 *
 * @param  [out] TfuRecpReqInfo *recpReqInfo
 * @param  [in]  RgSchCellCb   *cell
 * @param  [in]  U16           validIdx
 * @param  [out] RgSchErrInfo *err
 *  @return  S16
 *      -# ROK 
 *      -# RFAILED 
 */
#ifdef ANSI
PRIVATE S16 rgSCHTomUtlFillRiRecpReq
(
 TfuRecpReqInfo       *recpReqInfo,
 RgSchCellCb          *cell,
 U16                  validIdx,
 RgSchErrInfo         *err
 )
#else
PRIVATE S16 rgSCHTomUtlFillRiRecpReq (recpReqInfo, cell, validIdx, err)
   TfuRecpReqInfo       *recpReqInfo;
   RgSchCellCb          *cell;
   U16                  validIdx; 
   RgSchErrInfo         *err;
#endif
{
   CmLList              *node;
   TfuUeRecpReqInfo     *pucchRecpInfo;
   S16                  ret;
   U16                  effPeriodicity;
   RgSchUeCb            *ue;
   Bool                  willUeRprtCqi; /* Flag set due to CQI Mask
                                       and UE inactive state (DRX) */
   RgSchUePCqiCb *riCb = NULLP;
   TRC2(rgSCHTomUtlFillRiRecpReq);

   node = cell->pCqiSrsSrLst[validIdx].riLst.first;
   while(node)
   {
      riCb = (RgSchUePCqiCb *)(node->node);
      ue = riCb->servCellInfo->ue;
      /* Fix: ccpu00124011: Fix for missing reception request for UE with same offset */
      effPeriodicity = (riCb->h * riCb->cqiPeri * riCb->riPeri);
      node = node->next;
      if(riCb->riRecpPrcsd)
      {
         /*ccpu00140578:: RI Proecssing is already done for this TTI
          * as part of PUSCH reception process or HARQ 
          * Reception processing. Hence skipping this UE
          * */
         riCb->riRecpPrcsd = FALSE;
         continue;
      }
      if(riCb->riDist ==0)
      {
         rgSCHTomUtlWillUeRprtCqiRi(ue, &willUeRprtCqi);
#ifdef LTE_ADV
         if((TRUE == riCb->isRiIgnoByCollsn) 
               || (willUeRprtCqi == FALSE))
#else
         if(willUeRprtCqi == FALSE)
#endif
         {    
            rgSCHTomUtlMovePriNxtOccasion(cell, ue, riCb);
            continue;
         }  
         if ((ret = rgSCHUtlGetEventMem((Ptr *)&pucchRecpInfo,
                     sizeof(TfuUeRecpReqInfo),&(recpReqInfo->memCp))) != ROK)
         {
            RLOG_ARG1(L_ERROR,DBG_CELLID,cell->cellId,"Unable to Allocate "
               "TfuUeRecpReqInfo for cell RNTI:%d",ue->ueId);
            err->errCause = RGSCHERR_TOM_MEM_EXHAUST;
            RETVALUE(ret);
         }
#ifdef TFU_ALLOC_EVENT_NO_INIT
         cmMemset((U8 *)&pucchRecpInfo->t.pucchRecpReq, 0, sizeof(TfuUePucchRecpReq));
         pucchRecpInfo->type = TFU_RECP_REQ_PUCCH;
#endif
         /*Fill RI params*/
         pucchRecpInfo->rnti =  ue->ueId; 
         pucchRecpInfo->t.pucchRecpReq.cqiInfo.n2PucchIdx = 
            riCb->cqiCfg.cqiSetup.cqiPResIdx; 
         pucchRecpInfo->t.pucchRecpReq.cqiInfo.cqiPmiSz = riCb->riNumBits; 
         pucchRecpInfo->t.pucchRecpReq.uciInfo = TFU_PUCCH_CQI;
         ue->rawCqiBitW[ue->cqiRiWritIdx].recvTime = recpReqInfo->timingInfo;
#ifdef LTE_ADV
         ue->rawCqiBitW[ue->cqiRiWritIdx].u.pucch.sCellIdx =
            riCb->servCellInfo->sCellIdx;
#endif
         rgSCHTomUtlFillRiBitWidthInfo(ue);
         rgSCHTomUtlMovePriNxtOccasion(cell, ue, riCb);
         if (ue->nPCqiCb->nCqiTrIdx == validIdx)
         {
            rgSCHTomUtlMovePcqiNxtOccasion(cell, ue, ue->nPCqiCb); 
         }
         if((ue->srsCb.nSrsTrIdx == validIdx) && (ue->srsCb.srsDist ==0))
         {
            rgSCHTomUtlMoveSrsNxtOccasion(cell, ue);
         }
         cmLListAdd2Tail(&recpReqInfo->ueRecpReqLst, &(pucchRecpInfo->lnk));
         pucchRecpInfo->lnk.node = (PTR)pucchRecpInfo;
      }
      else
      {
         riCb->riDist--; 
      }     
   }
   RETVALUE(ROK);
}/* end of rgSCHTomUtlFillRiRecpReq */


/** @brief This function handles filling of PCQI reception request to
 * PHY.
 *
 * @details
 *
 *     Function: 
 *
 *         Processing steps:
 *
 * @param  [out] TfuRecpReqInfo *recpReqInfo
 * @param  [in]  RgSchCellCb   *cell
 * @param  [in]  U16           validIdx
 * @param  [out] RgSchErrInfo *err
 *  @return  S16
 *      -# ROK 
 *      -# RFAILED 
 */
#ifdef ANSI
PRIVATE S16 rgSCHTomUtlFillPcqiRecpReq
(
 TfuRecpReqInfo       *recpReqInfo,
 RgSchCellCb          *cell,
 U16                  validIdx, 
 RgSchErrInfo         *err
 )
#else
PRIVATE S16 rgSCHTomUtlFillPcqiRecpReq (recpReqInfo, cell, validIdx, err)
   TfuRecpReqInfo     *recpReqInfo;
   RgSchCellCb        *cell;
   U16                validIdx; 
   RgSchErrInfo       *err;
#endif
{
   CmLList              *node;
   TfuUeRecpReqInfo     *pucchRecpInfo;
   S16                  ret;

   RgSchUeCb            *ue;
   U8                    ri; /*RI value*/
   Bool                  willUeRprtCqi;   /* Flag set due to CQI Mask 
                                        and UE Inactive state (DRX)*/
   U8                    cqiPmiSz; 
   RgSchUePCqiCb        *cqiCb = NULLP;

   TRC2(rgSCHTomUtlFillPcqiRecpReq);

   node = cell->pCqiSrsSrLst[validIdx].cqiLst.first;
   while(node)
   {
      cqiCb = (RgSchUePCqiCb*)(node->node);
      ue = cqiCb->servCellInfo->ue;
      /* Fix: ccpu00124011: Fix for missing reception request for UE with same offset */
      node = node->next;
      rgSCHTomUtlWillUeRprtCqiRi(ue, &willUeRprtCqi);
#ifdef LTE_ADV
      if ((cqiCb->isCqiIgnoByCollsn == TRUE) ||
            (willUeRprtCqi == FALSE))
#else
      if(willUeRprtCqi == FALSE)
#endif
      {
         rgSCHTomUtlMovePcqiNxtOccasion(cell, ue, cqiCb);  
         continue;
      }

      ue->rawCqiBitW[ue->cqiRiWritIdx].recvTime = recpReqInfo->timingInfo;
#ifdef LTE_ADV
      ue->rawCqiBitW[ue->cqiRiWritIdx].u.pucch.sCellIdx =
         cqiCb->servCellInfo->sCellIdx;
#endif
      cqiPmiSz = rgSCHTomUtlFetchPcqiBitSz(ue, cell->numTxAntPorts, &ri); 
      if(!cqiPmiSz)
      {
         RLOG_ARG1(L_ERROR,DBG_CELLID,cell->cellId,"RNTI:%d Unable to Fill CqiPmi "
            "size", ue->ueId);
         continue;
      }

      if ((ret = rgSCHUtlGetEventMem((Ptr *)&pucchRecpInfo,
                  sizeof(TfuUeRecpReqInfo),&(recpReqInfo->memCp))) != ROK)
      {
         RLOG_ARG1(L_ERROR,DBG_CELLID,cell->cellId,"Unable to Allocate "
            "TfuUeRecpReqInfo for cell RNTI:%d ", ue->ueId);
         err->errCause = RGSCHERR_TOM_MEM_EXHAUST;
         RETVALUE(ret);
      }
#ifdef TFU_ALLOC_EVENT_NO_INIT
      cmMemset((U8 *)&pucchRecpInfo->t.pucchRecpReq, 0, sizeof(TfuUePucchRecpReq));
      pucchRecpInfo->type = TFU_RECP_REQ_PUCCH;     
#endif
      
      /*Fill PCQI params*/
      pucchRecpInfo->rnti =  ue->ueId; 
      pucchRecpInfo->t.pucchRecpReq.cqiInfo.n2PucchIdx = 
         cqiCb->cqiCfg.cqiSetup.cqiPResIdx; 
      pucchRecpInfo->t.pucchRecpReq.cqiInfo.cqiPmiSz = cqiPmiSz; 
      pucchRecpInfo->t.pucchRecpReq.uciInfo = TFU_PUCCH_CQI;
      rgSCHTomUtlMovePcqiNxtOccasion(cell, ue, cqiCb);
#ifdef TIP_LOWER_L2
      /* If UE doesn't send CQI report for TIP_MAX_RLF_EXPIRY_TMR continuously, UE
       * would be released */
      tipTrackUeInactivity(ue);
#endif
      if((ue->srsCb.nSrsTrIdx == validIdx) && (ue->srsCb.srsDist ==0))
      {
         rgSCHTomUtlMoveSrsNxtOccasion(cell, ue);
      }
      cmLListAdd2Tail(&recpReqInfo->ueRecpReqLst, &(pucchRecpInfo->lnk));
      pucchRecpInfo->lnk.node = (PTR)pucchRecpInfo;
   }
   RETVALUE(ROK);
}/* end of rgSCHTomUtlFillPcqiRecpReq */

/** @brief This function handles filling of SRS reception request to
 * PHY.
 *
 * @details
 *
 *     Function: 
 *
 *         Processing steps:
 *
 * @param  [out] TfuRecpReqInfo *recpReqInfo
 * @param  [in]  RgSchCellCb   *cell
 * @param  [in]  U16           validIdx
 * @param  [out] RgSchErrInfo *err
 *  @return  S16
 *      -# ROK 
 *      -# RFAILED 
 */
#ifdef ANSI
PRIVATE S16 rgSCHTomUtlFillSrsRecpReq
(
 TfuRecpReqInfo       *recpReqInfo,
 RgSchCellCb          *cell,
 U16                  validIdx,
 RgSchErrInfo         *err
 )
#else
PRIVATE S16 rgSCHTomUtlFillSrsRecpReq (recpReqInfo, cell, validIdx, err)
   TfuRecpReqInfo       *recpReqInfo;
   RgSchCellCb          *cell;
   U16                  validIdx; 
   RgSchErrInfo         *err;
#endif
{
   CmLList              *node;
   TfuUeRecpReqInfo     *pucchRecpInfo;
   S16                  ret;
   RgSchUeCb            *ue;

   TRC2(rgSCHTomUtlFillSrsRecpReq);

   node = cell->pCqiSrsSrLst[validIdx].srsLst.first;
   while(node)
   {
      ue = (RgSchUeCb *)(node->node);
      /* Fix: ccpu00124011: Fix for missing reception request for UE with same offset */
      node = node->next;
      if(ue->srsCb.srsRecpPrcsd)
      {
         /* ccpu00140578::SRS Proecssing is already done for this TTI
          * as part of PUSCH or HARQ reception process and
          * hence skipping this UE */
         ue->srsCb.srsRecpPrcsd = FALSE;
         continue;
      }

      if(ue->srsCb.srsDist ==0)
      {
         /* We need to add the recp request to be sent on the pucchANRep value. */
         if ((ret = rgSCHUtlGetEventMem((Ptr *)&pucchRecpInfo,
                     sizeof(TfuUeRecpReqInfo),&(recpReqInfo->memCp))) != ROK)
         {
            RLOG_ARG1(L_ERROR,DBG_CELLID,cell->cellId,"Unable to Allocate "
               "TfuUeRecpReqInfo for RNTI:%d ",ue->ueId);
            err->errCause = RGSCHERR_TOM_MEM_EXHAUST;
            RETVALUE(ret);
         }

#ifdef TFU_ALLOC_EVENT_NO_INIT
         pucchRecpInfo->type = TFU_RECP_REQ_PUCCH;
#endif
         
         /*Fill SRS params*/
         pucchRecpInfo->rnti = ue->ueId;
         pucchRecpInfo->t.pucchRecpReq.srsInfo.srsBw = 
            (TfuUlSrsBwInfo)ue->srsCb.srsCfg.srsSetup.srsBw;
         pucchRecpInfo->t.pucchRecpReq.srsInfo.nRrc = 
            ue->srsCb.srsCfg.srsSetup.fDomPosi;
         pucchRecpInfo->t.pucchRecpReq.srsInfo.srsHopBw = 
            (TfuUlSrsHoBwInfo)ue->srsCb.srsCfg.srsSetup.srsHopBw;
         pucchRecpInfo->t.pucchRecpReq.srsInfo.transComb = 
            ue->srsCb.srsCfg.srsSetup.txComb;
         pucchRecpInfo->t.pucchRecpReq.srsInfo.srsCfgIdx = 
            ue->srsCb.srsCfg.srsSetup.srsCfgIdx;
         pucchRecpInfo->t.pucchRecpReq.srsInfo.srsCyclicShft = 
            (TfuUlSrsCycShiftInfo)ue->srsCb.srsCfg.srsSetup.cycShift;
         
         pucchRecpInfo->t.pucchRecpReq.uciInfo = TFU_PUCCH_SRS;
         rgSCHTomUtlMoveSrsNxtOccasion(cell, ue);
         cmLListAdd2Tail(&recpReqInfo->ueRecpReqLst, &(pucchRecpInfo->lnk));
         pucchRecpInfo->lnk.node = (PTR)pucchRecpInfo;
      }
      else
      {
         ue->srsCb.srsDist--; 
      }
   }
   RETVALUE(ROK);
}/* end of rgSCHTomUtlFillSrsRecpReq */
#endif 
#ifndef TFU_UPGRADE
/** @brief This function handles filling of data reception requests for
 *  PUSCH and MSG3.
 *
 * @details
 *
 *     Function: 
 *
 *         Processing steps:
 *
 * @param  [out] TfuRecpReqInfo *recpReqInfo
 * @param  [in]  RgSchCellCb   *cell
 * @param  [out] RgSchErrInfo *err
 *  @return  S16
 *      -# ROK 
 *      -# RFAILED 
 */
#ifdef ANSI
PRIVATE S16 rgSCHTomUtlFillDatRecpReq
(
TfuRecpReqInfo       *recpReqInfo,
RgSchCellCb          *cell,
RgSchErrInfo         *err
)
#else
PRIVATE S16 rgSCHTomUtlFillDatRecpReq (recpReqInfo, cell, err)
TfuRecpReqInfo       *recpReqInfo;
RgSchCellCb          *cell;
RgSchErrInfo         *err;
#endif
{
   S16               ret;
   RgSchUlAlloc      *alloc;
   TfuUeRecpReqInfo  *datRecpInfo;

   TRC2(rgSCHTomUtlFillDatRecpReq)

   /* processing steps are 
    * - Run through the UL allocations going out in this subframe.
    * - Run through the UL receptions expected the next subframe.
    */
   alloc = rgSCHUtlFirstRcptnReq (cell);
   while(alloc)
   {
      /* FOR ACK NACK REP */
      if (NULLP != alloc->ue)
      {
         /* If measuring or ackNakRep we shall not send dat RecpReq */
         if ((alloc->ue->measGapCb.isMeasuring == TRUE) ||
               (alloc->ue->ackNakRepCb.isAckNakRep == TRUE))
         {
            alloc = rgSCHUtlNextRcptnReq (cell, alloc);
            continue;
         }

      }
      if ((ret = rgSCHUtlGetEventMem((Ptr *)&datRecpInfo,
                                sizeof(TfuUeRecpReqInfo), 
                                &(recpReqInfo->memCp))) != ROK)
      {
         RLOG_ARG1(L_ERROR,DBG_CELLID,cell->cellId,"Unable to Allocate "
            "TfuUeRecpReqInfo for RNTI:%d ", alloc->ue->ueId);
         err->errCause = RGSCHERR_TOM_MEM_EXHAUST;
         RETVALUE(ret);
      }
      if (!alloc->forMsg3)
      {
         datRecpInfo->type = TFU_RECP_REQ_PUSCH;
         rgSCHUtlAllocRcptInfo (alloc, 
            &datRecpInfo->rnti,
            &datRecpInfo->t.puschRecpReq.mcs,
            &datRecpInfo->t.puschRecpReq.rbStart,
            &datRecpInfo->t.puschRecpReq.numRb,
            &datRecpInfo->t.puschRecpReq.rv,
            &datRecpInfo->t.puschRecpReq.size,
            &datRecpInfo->t.puschRecpReq.modType,
            &datRecpInfo->t.puschRecpReq.isRtx,
            &datRecpInfo->t.puschRecpReq.nDmrs,
            &datRecpInfo->t.puschRecpReq.ndi,
            &datRecpInfo->t.puschRecpReq.harqProcId
            );
      }
      else
      {
         datRecpInfo->type = TFU_RECP_REQ_MSG3;
         rgSCHUtlAllocRcptInfo (alloc, 
            &datRecpInfo->rnti,
            &datRecpInfo->t.msg3RecpReq.mcs,
            &datRecpInfo->t.msg3RecpReq.rbStart,
            &datRecpInfo->t.msg3RecpReq.numRb,
			/*ccpu00128993 - MOD - fix for msg3 softcombining bug*/
            &datRecpInfo->t.msg3RecpReq.rv,
            &datRecpInfo->t.msg3RecpReq.size,
            &datRecpInfo->t.msg3RecpReq.modType,
            &datRecpInfo->t.msg3RecpReq.isRtx,
            &datRecpInfo->t.msg3RecpReq.nDmrs,
            &datRecpInfo->t.msg3RecpReq.ndi,
            &datRecpInfo->t.msg3RecpReq.harqProcId
            );
         
      }
      /* Other fields of datRecpInfo shall be filled 
       * here for new features */
      cmLListAdd2Tail(&recpReqInfo->ueRecpReqLst, &(datRecpInfo->lnk));
      datRecpInfo->lnk.node = (PTR)datRecpInfo;
      
      alloc = rgSCHUtlNextRcptnReq (cell, alloc);
   } /* end of while */
   RETVALUE(ROK); 
} /* end of rgSCHTomUtlFillDatRecpReq */

#else
/** @brief This function handles filling of data reception requests for
 *  PUSCH and MSG3.
 *
 * @details
 *
 *     Function: 
 *
 *         Processing steps:
 *
 * @param  [out] TfuRecpReqInfo *recpReqInfo
 * @param  [in]  RgSchCellCb   *cell
 * @param  [in]  U16           validIdx
 * @param  [out] RgSchErrInfo *err
 *  @return  S16
 *      -# ROK 
 *      -# RFAILED 
 */
#ifdef ANSI
PRIVATE S16 rgSCHTomUtlFillDatRecpReq
(
 TfuRecpReqInfo       *recpReqInfo,
 RgSchCellCb          *cell,
 U16                  validIdx,
 RgSchErrInfo         *err
 )
#else
PRIVATE S16 rgSCHTomUtlFillDatRecpReq (recpReqInfo, cell, validIdx, err)
   TfuRecpReqInfo       *recpReqInfo;
   RgSchCellCb          *cell;
   U16                  validIdx;
   RgSchErrInfo         *err;
#endif
{
   CmLteTimingInfo   dci0Time;
   U8                idx;
   Bool              recvCtrl = TRUE;
   S16               ret;
   RgSchUlAlloc      *alloc;
   TfuUeRecpReqInfo  *datRecpInfo;

   Bool              hqPres;   /*Set when HARQ Rec Req is present*/
   Bool              isAperiodic = FALSE; /*Set when Aperiodic CQI is expected */
   U8                numUePerTti = 0;
   RgSchDlHqEnt          *hqEnt = NULLP;
   TRC2(rgSCHTomUtlFillDatRecpReq);

   /* processing steps are 
    * - Run through the UL allocations going out in this subframe.
    * - Run through the UL receptions expected the next subframe.
    */

   alloc = rgSCHUtlFirstRcptnReq (cell);
   while(alloc)
   {
      isAperiodic = FALSE;
      /* FOR ACK NACK REP */
      if (NULLP != alloc->ue)
      {
         /* If measuring or ackNakRep we shall not send dat RecpReq */
         if ((alloc->ue->measGapCb.isMeasuring == TRUE) ||
               (alloc->ue->ackNakRepCb.isAckNakRep == TRUE))
         {
            rgSCHTomUtlMoveNxtOccasion(cell, alloc->ue, validIdx);
            alloc = rgSCHUtlNextRcptnReq (cell, alloc);
            continue;
         }

      }
      ret = rgSCHUtlGetEventMem((Ptr *)&datRecpInfo,
            sizeof(TfuUeRecpReqInfo), &(recpReqInfo->memCp));
      if(ret != ROK)            
      {
         RLOG_ARG1(L_ERROR,DBG_CELLID,cell->cellId,"Unable to Allocate "
            "TfuUeRecpReqInfo for RNTI:%d ", alloc->rnti);
         err->errCause = RGSCHERR_TOM_MEM_EXHAUST;
         RETVALUE(ret);
      }
#ifdef TFU_ALLOC_EVENT_NO_INIT
      datRecpInfo->t.puschRecpReq.initialNSrs.pres = FALSE;
      datRecpInfo->t.puschRecpReq.initialNumRbs.pres = FALSE;
#endif
      datRecpInfo->type = TFU_RECP_REQ_PUSCH;
      /* ccpu00131944 - Intializing hqPres in each iteration*/
      hqPres = FALSE;
      /* Check if this if for MSG3 - no scope for feedback along with it. */
      if ((FALSE == alloc->forMsg3))
      {
         /*  Check if any DL HARQ processes has a feedback coming at the time of
          *  this reception request. 
          */
/* ACC-TDD */    	  

         if ((alloc->ue) && 
               ((hqEnt =  RG_SCH_CMN_GET_UE_HQE(alloc->ue, cell)) != NULLP))
         {
            RGSCHDECRFRMCRNTTIME(cell->crntTime,dci0Time,(RGSCH_ULCTRL_RECP_DIST));
            
            idx = (dci0Time.sfn * RGSCH_NUM_SUB_FRAMES + dci0Time.subframe)%
                     RGSCH_ULCTRL_RECP_DIST; 
            if (alloc->ue->ul.ctrlOnServCellIdx[idx] != 
                  alloc->ue->cellIdToCellIdxMap[RG_SCH_CELLINDEX(cell)])
            {
               recvCtrl = FALSE;
            }

            if ( (TRUE == recvCtrl) && NULLP != hqEnt->inUse.first)
            {
               hqPres = rgSCHTomUtlFillDatHarqRecpReq(cell,alloc, 
                     datRecpInfo, recpReqInfo);
            }       

            if(alloc->pdcch && alloc->pdcch->dci.u.format0Info.cqiReq) 
            {
               /* Filling Aperiodic Cqi reception timing*/
               alloc->ue->rawCqiBitW[alloc->ue->cqiRiWritIdx].recvTime =
                   recpReqInfo->timingInfo;
#ifdef LTE_ADV
               alloc->ue->rawCqiBitW[alloc->ue->cqiRiWritIdx].u.pucch.sCellIdx =
                  RGSCH_PCELL_INDEX;
#endif
               /* Aperiodic CQI has to be received */
               rgSCHTomUtlFillDatAperRecpReq(cell, alloc->pdcch->dci.u.format0Info.cqiReq, \
                     alloc, datRecpInfo, &recpReqInfo->timingInfo, hqPres, validIdx);
               isAperiodic = TRUE; 
            }
            else if((TRUE == recvCtrl) && (alloc->ue->nPRiCb->nRiTrIdx == validIdx) && 
                    (alloc->ue->nPRiCb->riDist == 0))
            {
               /*ccpu00126993 - RLF Issue Fix due to Improper Timing Info Update */
               alloc->ue->rawCqiBitW[alloc->ue->cqiRiWritIdx].recvTime =
                   recpReqInfo->timingInfo;
#ifdef LTE_ADV
               alloc->ue->rawCqiBitW[alloc->ue->cqiRiWritIdx].u.pucch.sCellIdx =
                  alloc->ue->nPRiCb->servCellInfo->sCellIdx;
#endif
               /* Periodic RI has to be received */
               rgSCHTomUtlFillDatPriRecpReq(cell,alloc, datRecpInfo, 
                     &recpReqInfo->timingInfo, hqPres, validIdx);
            }
            else if((TRUE == recvCtrl) && alloc->ue->nPCqiCb->nCqiTrIdx == validIdx)
            {
               /*ccpu00126993 - RLF Issue Fix due to Improper Timing Info Update */
               alloc->ue->rawCqiBitW[alloc->ue->cqiRiWritIdx].recvTime =
                   recpReqInfo->timingInfo;
#ifdef LTE_ADV
               alloc->ue->rawCqiBitW[alloc->ue->cqiRiWritIdx].u.pucch.sCellIdx =
                  alloc->ue->nPCqiCb->servCellInfo->sCellIdx;
#endif
               /* Periodic CQI has to be received */
               rgSCHTomUtlFillDatPCqiRecpReq(cell,alloc, datRecpInfo, 
                   &recpReqInfo->timingInfo, hqPres, validIdx);
            }
            else if((TRUE == recvCtrl) && (alloc->ue->srsCb.nSrsTrIdx == validIdx) && 
                  (alloc->ue->srsCb.srsDist ==0))
            {
               /* SRS has to be received */
               rgSCHTomUtlFillDatSrsRecpReq(cell,alloc, datRecpInfo, 
                     &recpReqInfo->timingInfo, hqPres);  
            }
            else
            {
               if(hqPres)
               {
                  datRecpInfo->t.puschRecpReq.rcpInfo = TFU_PUSCH_DATA_HARQ;
               }
               else
               {
                  datRecpInfo->t.puschRecpReq.rcpInfo = TFU_PUSCH_DATA;
               }
               datRecpInfo->rnti = alloc->rnti;
               rgSCHUtlAllocRcptInfo (cell,alloc, &recpReqInfo->timingInfo,
                        &datRecpInfo->t.puschRecpReq.ulSchInfo);
            }
            if (recvCtrl == TRUE)
            {
               rgSCHTomUtlMoveNxtOccasion(cell, alloc->ue, validIdx);
            }
         }
      }
      else /*Enters for Msg3 == TRUE condition*/
      {
         /* ccpu00130884 - ADD - HO case when Msg3 alloc and Cqi/Ri/SRS opportunity 
          * occur at same time */
         if(NULLP != alloc->ue)
         {
            /* SYED : TODO: Removing aperiodic CQI code here for which wrong check was added, 
               should be added as part of 3.0 with a proper check*/
            /* ccpu00132813: Aperiodic CQI request flag is sent in RAR for MSG3 case*/
            if(alloc->ue->ul.rarGrnt.cqiReqBit) 
            {
               /* Filling Aperiodic Cqi reception timing*/
               alloc->ue->rawCqiBitW[alloc->ue->cqiRiWritIdx].recvTime =
                   recpReqInfo->timingInfo;
#ifdef LTE_ADV
               alloc->ue->rawCqiBitW[alloc->ue->cqiRiWritIdx].u.pucch.sCellIdx =
                  RGSCH_PCELL_INDEX;
#endif
               /* Aperiodic CQI has to be received */
               rgSCHTomUtlFillDatAperRecpReq(cell, (U8)RG_SCH_APCQI_SERVING_CC, alloc, datRecpInfo,
                     &recpReqInfo->timingInfo, hqPres, validIdx);
               isAperiodic = TRUE; 
            }
            else if((alloc->ue->nPRiCb->nRiTrIdx == validIdx) && 
                    (alloc->ue->nPRiCb->riDist == 0))
            {
               /*ccpu00126993 - RLF Issue Fix due to Improper Timing Info Update */
               alloc->ue->rawCqiBitW[alloc->ue->cqiRiWritIdx].recvTime =
                   recpReqInfo->timingInfo;
#ifdef LTE_ADV
               alloc->ue->rawCqiBitW[alloc->ue->cqiRiWritIdx].u.pucch.sCellIdx =
                  alloc->ue->nPRiCb->servCellInfo->sCellIdx;
#endif
               /* Periodic RI has to be received */
               rgSCHTomUtlFillDatPriRecpReq(cell,alloc, datRecpInfo, 
                     &recpReqInfo->timingInfo, hqPres, validIdx);
            }
            else if(alloc->ue->nPCqiCb->nCqiTrIdx == validIdx)
            {
               /*ccpu00126993 - RLF Issue Fix due to Improper Timing Info Update */
               alloc->ue->rawCqiBitW[alloc->ue->cqiRiWritIdx].recvTime =
                   recpReqInfo->timingInfo;
#ifdef LTE_ADV
               alloc->ue->rawCqiBitW[alloc->ue->cqiRiWritIdx].u.pucch.sCellIdx =
                  alloc->ue->nPCqiCb->servCellInfo->sCellIdx;
#endif
               /* Periodic CQI has to be received */
               rgSCHTomUtlFillDatPCqiRecpReq(cell,alloc, datRecpInfo, 
                   &recpReqInfo->timingInfo, hqPres, validIdx);
            }
            else if((alloc->ue->srsCb.nSrsTrIdx == validIdx) && 
                  (alloc->ue->srsCb.srsDist ==0))
            {
               /* SRS has to be received */
               rgSCHTomUtlFillDatSrsRecpReq(cell,alloc, datRecpInfo, 
                     &recpReqInfo->timingInfo, hqPres);  
            }
            else
            {		 
               /* Only DATA is expected */
               datRecpInfo->t.puschRecpReq.rcpInfo = TFU_PUSCH_DATA;
               datRecpInfo->rnti = alloc->rnti;
               rgSCHUtlAllocRcptInfo (cell,alloc, &recpReqInfo->timingInfo,
   	               &datRecpInfo->t.puschRecpReq.ulSchInfo);
            }
            rgSCHTomUtlMoveNxtOccasion(cell, alloc->ue, validIdx);
         }
         else
         {		 
            /* Only DATA is expected */
            datRecpInfo->t.puschRecpReq.rcpInfo = TFU_PUSCH_DATA;
            datRecpInfo->rnti = alloc->rnti;
            rgSCHUtlAllocRcptInfo (cell,alloc, &recpReqInfo->timingInfo,
               &datRecpInfo->t.puschRecpReq.ulSchInfo);
         }
      }
      if(alloc->ue)
      {
         if(datRecpInfo->t.puschRecpReq.rcpInfo != TFU_PUSCH_DATA &&
               datRecpInfo->t.puschRecpReq.rcpInfo != TFU_PUSCH_DATA_SRS &&
               isAperiodic == FALSE)
         {
            datRecpInfo->t.puschRecpReq.initialNumRbs.pres = TRUE;
            datRecpInfo->t.puschRecpReq.initialNumRbs.val = alloc->ue->initNumRbs;
         }
         else
         {
            datRecpInfo->t.puschRecpReq.initialNumRbs.pres = FALSE;
         }
      }
      cmLListAdd2Tail(&recpReqInfo->ueRecpReqLst, &(datRecpInfo->lnk));
      datRecpInfo->lnk.node = (PTR)datRecpInfo;
      alloc = rgSCHUtlNextRcptnReq (cell, alloc);
      numUePerTti++;
   } /* end of while */

   if(numUePerTti && (numUePerTti < RG_MAX_NUM_UE_PER_TTI))
   {
      cell->ulNumUeSchedPerTti[numUePerTti-1]++;
#if 1
      gUlNumUePerTti[numUePerTti - 1]++;
#endif 
   }
   RETVALUE(ROK); 
} /* end of rgSCHTomUtlFillDatRecpReq */
#endif
/* rg009.201. Added changes of TFU_UPGRADE */
#ifdef TFU_UPGRADE
/***********************************************************
 *
 *     Func : rgSCHTomUtlFillRiBitWidthInfo
 *
 *
 *     Desc : Fills the RI BitWidth and stores it for decoding.
 *
 *     Ret  : S16
 *            ROK - Success
 *
 *     Notes:
 *
 *     File :
 *
 **********************************************************/
#ifdef ANSI
PUBLIC S16 rgSCHTomUtlFillRiBitWidthInfo
(
 RgSchUeCb     *ueCb
 )
#else
PUBLIC S16 rgSCHTomUtlFillRiBitWidthInfo(ueCb)
   RgSchUeCb   *ueCb;
#endif
{
   RgSchUePCqiCb *riCb = ueCb->nPRiCb;
   TRC2(rgSCHTomUtlFillRiBitWidthInfo);
   
   if (ueCb->mimoInfo.txMode != RGR_UE_TM_3 &&
             ueCb->mimoInfo.txMode != RGR_UE_TM_4)
   {
      RETVALUE(RFAILED);
   }

   ueCb->rawCqiBitW[ueCb->cqiRiWritIdx].type = TFU_RECP_REQ_PUCCH;
   ueCb->rawCqiBitW[ueCb->cqiRiWritIdx].u.pucch.pucchRawCqiInfo.mode= 
      (TfuDlCqiPucchMode)riCb->cqiCfg.cqiSetup.prdModeEnum;
   switch(ueCb->rawCqiBitW[ueCb->cqiRiWritIdx].u.pucch.pucchRawCqiInfo.mode)
   {
      case TFU_PUCCH_CQI_MODE10:
         ueCb->rawCqiBitW[ueCb->cqiRiWritIdx].u.pucch.pucchRawCqiInfo.u.mode10Info.type = TFU_RPT_RI;
         ueCb->rawCqiBitW[ueCb->cqiRiWritIdx].u.pucch.pucchRawCqiInfo.u.mode10Info.u.ri = 
            riCb->riNumBits;
         break;
      case TFU_PUCCH_CQI_MODE11:
         ueCb->rawCqiBitW[ueCb->cqiRiWritIdx].u.pucch.pucchRawCqiInfo.u.mode11Info.type = TFU_RPT_RI;
         ueCb->rawCqiBitW[ueCb->cqiRiWritIdx].u.pucch.pucchRawCqiInfo.u.mode11Info.u.ri = 
            riCb->riNumBits;
         break;
      case TFU_PUCCH_CQI_MODE20:
         ueCb->rawCqiBitW[ueCb->cqiRiWritIdx].u.pucch.pucchRawCqiInfo.u.mode20Info.type = TFU_RPT_RI;
         ueCb->rawCqiBitW[ueCb->cqiRiWritIdx].u.pucch.pucchRawCqiInfo.u.mode20Info.u.ri = 
            riCb->riNumBits;
         break;
      case TFU_PUCCH_CQI_MODE21:
         ueCb->rawCqiBitW[ueCb->cqiRiWritIdx].u.pucch.pucchRawCqiInfo.u.mode21Info.type = TFU_RPT_RI;
         ueCb->rawCqiBitW[ueCb->cqiRiWritIdx].u.pucch.pucchRawCqiInfo.u.mode21Info.u.ri = 
            riCb->riNumBits;
         break;
      default:
         break;
   }
   
   RG_SCH_INCR_CQIRI_INDEX(ueCb->cqiRiWritIdx);
   RETVALUE(ROK);
}

/***********************************************************
 *
 *     Func : rgSCHTomUtlFetchPcqiBitSz
 *
 *
 *     Desc : Fetch the CQI/PMI bits for a UE based on the mode, periodicity.
 *
 *     Ret  : U8
 *            ROK - Success
 *
 *     Notes:
 *
 *     File :
 *
 **********************************************************/
#ifdef ANSI
PUBLIC U8 rgSCHTomUtlFetchPcqiBitSz
(
 RgSchUeCb    *ueCb, 
 U8           numTxAnt,
 U8           *ri
 )
#else
PUBLIC U8 rgSCHTomUtlFetchPcqiBitSz(ueCb, numTxAnt, ri)
   RgSchUeCb     *ueCb;
   U8            numTxAnt;
   U8            *ri;
#endif
{
   U8 confRepMode;
   U8 pcqiSz;
   TfuCqiPucchMode10   *mode10Info;    
   TfuCqiPucchMode11   *mode11Info;    
   TfuCqiPucchMode20   *mode20Info;   
   TfuCqiPucchMode21   *mode21Info;    
   RgSchUePCqiCb *cqiCb = ueCb->nPCqiCb;

   TRC3(rgSCHTomUtlFetchPcqiBitSz);

   confRepMode = cqiCb->cqiCfg.cqiSetup.prdModeEnum;
   if((ueCb->mimoInfo.txMode != RGR_UE_TM_3) && 
         (ueCb->mimoInfo.txMode != RGR_UE_TM_4))
   {
      *ri =1;
   }
   else
   {
      *ri = cqiCb->perRiVal;
   }
   ueCb->rawCqiBitW[ueCb->cqiRiWritIdx].type = TFU_RECP_REQ_PUCCH;
   ueCb->rawCqiBitW[ueCb->cqiRiWritIdx].u.pucch.pucchRawCqiInfo.mode= 
       (TfuDlCqiPucchMode)confRepMode;
   switch(confRepMode)
   {
      case RGR_PRD_CQI_MOD10:
         {
            mode10Info = &ueCb->rawCqiBitW[ueCb->cqiRiWritIdx].u.pucch.pucchRawCqiInfo.u.mode10Info;
            pcqiSz = 4;
            mode10Info->type = TFU_RPT_CQI;
            mode10Info->u.cqi = 4;
         }
         break;

      case RGR_PRD_CQI_MOD11:
         {
            mode11Info = &ueCb->rawCqiBitW[ueCb->cqiRiWritIdx].u.pucch.pucchRawCqiInfo.u.mode11Info;
            mode11Info->type = TFU_RPT_CQI;
            if(numTxAnt == 2)
            {
               if (*ri ==1)
               {
                  pcqiSz = 6;
                  mode11Info->u.cqi.cqi = 4;
                  mode11Info->u.cqi.wideDiffCqi.pres = FALSE;
                  mode11Info->u.cqi.pmi = 2;
               }
               else
               {
                  pcqiSz = 8;
                  mode11Info->u.cqi.cqi = 4;
                  mode11Info->u.cqi.wideDiffCqi.pres = TRUE;
                  mode11Info->u.cqi.wideDiffCqi.val = 3;
                  mode11Info->u.cqi.pmi = 1;
               }
            }
            else if(numTxAnt == 4)
            {
               if (*ri ==1)
               {
                  pcqiSz = 8;
                  mode11Info->u.cqi.cqi = 4;
                  mode11Info->u.cqi.wideDiffCqi.pres = FALSE;
                  mode11Info->u.cqi.pmi = 4;
               }
               else
               {
                  pcqiSz = 11;
                  mode11Info->u.cqi.cqi = 4;
                  mode11Info->u.cqi.wideDiffCqi.pres = TRUE;
                  mode11Info->u.cqi.wideDiffCqi.val = 3;
                  mode11Info->u.cqi.pmi = 4;
               }
            }
            else
            {
               /* This is number of antenna case 1.
                * This is not applicable for Mode 1-1. 
                * So setting it to invalid value */
               pcqiSz = 0;
            }
         }
         break;

      case RGR_PRD_CQI_MOD20:
         {
            mode20Info = &ueCb->rawCqiBitW[ueCb->cqiRiWritIdx].u.pucch.pucchRawCqiInfo.u.mode20Info;
            mode20Info->type = TFU_RPT_CQI;
            if(cqiCb->isWb)
            {
               pcqiSz = 4;
               mode20Info->u.cqi.isWideband = TRUE;
               mode20Info->u.cqi.u.wideCqi = 4;
            }
            else
            {
               pcqiSz = 4 + cqiCb->label;
               mode20Info->u.cqi.isWideband = FALSE;
               mode20Info->u.cqi.u.subCqi.cqi = 4;
               mode20Info->u.cqi.u.subCqi.l = cqiCb->label;
            }
         }
         break;

      case RGR_PRD_CQI_MOD21:
         {
            mode21Info = &ueCb->rawCqiBitW[ueCb->cqiRiWritIdx].u.pucch.pucchRawCqiInfo.u.mode21Info;
            mode21Info->type = TFU_RPT_CQI;
            pcqiSz = rgSCHTomUtlFetchPcqiBitSzPucchMode21(ueCb, 
                                 mode21Info, numTxAnt, ri);
         }
         break;
      default:
          pcqiSz = 0;
          break;
   }
   
   RG_SCH_INCR_CQIRI_INDEX(ueCb->cqiRiWritIdx);
   RETVALUE(pcqiSz);
}


/***********************************************************
 *
 *     Func : rgSCHTomUtlPcqiSbCalcBpIdx
 *
 *
 *     Desc : Determines the BP index from the timing info
 *
 *     Ret  : S16
 *            ROK - Success
 *
 *     Notes:
 *
 *     File :
 *
 **********************************************************/
#ifdef ANSI
PUBLIC S16 rgSCHTomUtlPcqiSbCalcBpIdx
(
 CmLteTimingInfo    crntTimInfo,
 RgSchUeCb          *ueCb,
 RgSchUePCqiCb   *cqiCb
 )
#else
PUBLIC S16 rgSCHTomUtlPcqiSbCalcBpIdx(crntTimInfo, ueCb, cqiCb)
   CmLteTimingInfo  crntTimInfo;
   RgSchUeCb        *ueCb;
   RgSchUePCqiCb   *cqiCb;
#endif
{
   U16 tti = (crntTimInfo.sfn * RGSCH_NUM_SUB_FRAMES + crntTimInfo.subframe);
   U16  prdNum = tti/cqiCb->cqiPeri;

   TRC2(rgSCHTomUtlPcqiSbCalcBpIdx);
   if((prdNum % cqiCb->h) == 0)
   {
      cqiCb->isWb = TRUE;
#ifdef LTE_ADV
      cqiCb->prioLvl = RG_SCH_CQI_PRIO_LVL_1;
#endif
   }
   else
   {
      cqiCb->isWb = FALSE;
      cqiCb->bpIdx = ((prdNum % cqiCb->h) - 1) % cqiCb->J;  
#ifdef LTE_ADV
      cqiCb->prioLvl = RG_SCH_CQI_PRIO_LVL_0;
#endif
   }
   RETVALUE(ROK);
}


/**
 * @brief Function which moves PCQI, RI, SR and SRS to next periodicity
 *           Occasions as that needs to be done in case of Ack/Nack repetition
 *           reception request occasions or during Measurement Gap occasions.
 *
 * @details
 *
 *     Function: rgSCHTomUtlMoveNxtOccasion
 *
 *       Function which moves PCQI, RI, SR and SRS to next perodicity
 *      Occasions as that needs to be done in case of Ack/Nack repetition
 *      reception request occasions or during Measurement Gap occasions.
 *
 *     Invoked by: rgSCHTomUtlFillDatRecpReq of rg_sch_tom.c 
 *
 *     Processing Steps:
 *     - Check whether the current Tx Instance matches with the rec req time
 *     - If true, then move them to their next Tx Instance
 *           
 *  @param[in]   RgSchCellCb    *cell,
 *               RgSchUeCb      *ue,
 *               U16            validIdx
 *  @return  S16
 *      -# ROK 
 *      -# RFAILED 
 **/
#ifdef ANSI
PRIVATE S16 rgSCHTomUtlMoveNxtOccasion
(
 RgSchCellCb    *cell,
 RgSchUeCb      *ue,
 U16            validIdx
 )
#else
PRIVATE S16 rgSCHTomUtlMoveNxtOccasion(cell, ue, validIdx)
   RgSchCellCb    *cell;
   RgSchUeCb      *ue;
   U16            validIdx;
#endif
{
   RgSchUePCqiCb *cqiCb = ue->nPCqiCb;
   RgSchUePCqiCb *riCb = ue->nPRiCb;
   TRC2(rgSCHTomUtlMoveNxtOccasion);
 
   /* ccpu00140578::Skip the UE if already RI recpetion 
    * is processed in the same subframe */
   if ((riCb->nRiTrIdx == validIdx) &&
      (riCb->riRecpPrcsd == FALSE))
   {
      if(riCb->riDist ==0)
      {
         rgSCHTomUtlMovePriNxtOccasion(cell, ue, riCb); 
      }
      else
      {
         riCb->riDist--; 
      }
      /* ccpu00140578:: As this UE is considered for this TTI
       * Same UE should not get processed for RI reception 
       * or for updating th RI distance.*/
      if(riCb->nRiTrIdx == validIdx)
      {
         riCb->riRecpPrcsd = TRUE;
      }
   }
   if (cqiCb->nCqiTrIdx == validIdx)
   {
      rgSCHTomUtlMovePcqiNxtOccasion(cell, ue, cqiCb); 
   }

      /* ccpu00140578::Skip the UE if SRS recpetion 
       * is already processed in the same subframe */
   if ((ue->srsCb.nSrsTrIdx == validIdx) &&
       (ue->srsCb.srsRecpPrcsd == FALSE))  
   {
      if(ue->srsCb.srsDist ==0)
      {
         rgSCHTomUtlMoveSrsNxtOccasion(cell, ue);  
      }
      else
      {
         ue->srsCb.srsDist--; 
      }
      /* ccpu00140578:: As this UE is considered for this TTI
       * Same UE should not get processed for SRS reception 
       * or for updating th SRS distance.*/
      if(ue->srsCb.nSrsTrIdx == validIdx)
      {
         ue->srsCb.srsRecpPrcsd = TRUE;
      }
   }
   if (ue->srCb.nSrTrIdx == validIdx)
   {
      rgSCHTomUtlMoveSrNxtOccasion(cell, ue); 
   }
   RETVALUE(ROK);
}  /* rgSCHTomUtlMoveNxtOccasion */


/**
 * @brief Function which handles the filling of HARQ reception
 * request values which arrives along with UL Data on ULSCH
 *
 * @details
 *
 *     Function: rgSCHTomUtlFillDatHarqRecpReq
 *
 *    Function which handles the filling of HARQ reception
 *    request values which arrives along with UL Data on ULSCH
 *
 *     Invoked by: rgSCHTomUtlFillDatRecpReq of rg_sch_tom.c 
 *
 *     Processing Steps:

 *     - Fill the reception request for the data arriving on the ULSCH
 *     - Fill the reception request information for the HARQ
 *           
 *  @param[in]  RgSchCellCb       *cell,
 *                      RgSchUlAlloc      *alloc,
 *                      CmLteTimingInfo         *timeInfo,
 *                      U8                     tbCount
 *  @return  S16
 *      -# ROK 
 *      -# RFAILED 
 **/

#ifdef ANSI
PRIVATE Bool rgSCHTomUtlFillDatHarqRecpReq
(
 RgSchCellCb       *cell,
 RgSchUlAlloc      *alloc,
 TfuUeRecpReqInfo  *datRecpInfo,
 TfuRecpReqInfo    *recpReqInfo
 )
#else
PRIVATE Bool rgSCHTomUtlFillDatHarqRecpReq(cell, alloc, datRecpInfo, recpReqInfo)
   RgSchCellCb       *cell;
   RgSchUlAlloc      *alloc;
   TfuUeRecpReqInfo  *datRecpInfo;
   TfuRecpReqInfo    *recpReqInfo;
#endif
{
   U8                tbIdx;
   U8                tbCount = 0;
   U8                hqSz = 1;
#ifdef LTE_TDD
#ifdef LTE_ADV
   U8                wUlDai = 0; /* max UL DAI in all serving cells */
#endif
   //U8                hqSz = 1;
   RgSchTddDlAscSetIdxK    ascIdx;
   CmLteTimingInfo   dlSfTime;
#endif
   RgSchDlHqTbCb     *tbCb;
   RgSchDlHqProcCb   *dlHq;
   TfuUePuschHqRecpInfo   *hqRecpReqInfo;
   CmLteTimingInfo         timeInfo;
   Bool hqPres= FALSE; 
   CmLList           *node;
   RgSchDlSf          *sf;
   CmLListCp          *hqPLst;
   U8                 loop;
   U8                      noFdbks;

   TRC2(rgSCHTomUtlFillDatHarqRecpReq);

#ifdef LTE_TDD
   RG_SCH_ADD_TO_CRNT_TIME(cell->crntTime, timeInfo, TFU_RECPREQ_DLDELTA);
   ascIdx = rgSchTddDlHqPucchResCalTbl[cell->ulDlCfgIdx][timeInfo.subframe];
   noFdbks = ascIdx.numFdbkSubfrms;
#else
   RGSCHDECRFRMCRNTTIME(recpReqInfo->timingInfo, timeInfo, 4);
   /* in case of FDD noFdbks is 1 */
   noFdbks = 1;
#endif
   for(loop=0; loop < noFdbks; loop++)
   {
      /* Get the subframe and sfn for which HARQ Ack/Nack
       * has to be sent */
      /* ccpu00132341-MOD- optimized getting DLSF time using macro*/
      /* ccpu00133109: Removed RGSCHSUBFRMCRNTTIME as it is not giving proper 
       * output if diff is more than 10. Instead using RGSCHDECRFRMCRNTTIME() 
       * as it is serving the purpose */
#ifdef LTE_TDD
      RGSCHDECRFRMCRNTTIME(timeInfo, dlSfTime, ascIdx.subfrmNum[loop]);
      sf = rgSCHUtlSubFrmGet(cell, dlSfTime); 
#else
      sf = rgSCHUtlSubFrmGet(cell, timeInfo);
#endif

      hqPLst    = &alloc->ue->dl.dlSfHqInfo[sf->dlIdx].hqPLst;
      /*ccpu00118540-MOD-new variables introduced */
      node      = hqPLst->first; 

      /*ccpu00118540-MOD-modified the logic to match timinInfo with
       * fdbkTime. Assume, DL data for a UE is sent at (x,8). 
       * Reception request will generated at (x+1,0). At (x+1,1),
       * assume, we send DL data + UL Pdcch for the same UE. 
       * At (x+1,3),we expect Harq feedack for the first DL transmission 
       * and Recp Req for ULData + Harq for second DL transmission. However,
       * it is possible at the time of generation RecpReq, Feedback
       * has not been received for first DL transmission (ergo Hq proc
       * is still in use). Therefore, we now compare timingInfo 
       * 4+TFU_HQFBKIND_ULDELTA deep in the link list 
       */
      /*ccpu00130166 - MOD - chganges to handle both DATA 
        and HqFeedback in single UL subframe.*/
      while (node)
      {
         dlHq = (RgSchDlHqProcCb*)(node->node);

         if ( dlHq == (RgSchDlHqProcCb *)NULLP )
         {
            continue;
         }
#ifdef BRDCM
         dlHq->isPuschFdbk = 1;
#endif
         for (tbIdx = 0; tbIdx < 2; tbIdx++)
         {
            tbCb = &(dlHq->tbInfo[tbIdx]);
            if (tbCb->state == HQ_TB_WAITING)
            {
               /* atleast one is TB's feedback is coming. */
               tbCount++;
               hqPres = TRUE;
            }
         }/*for(tbIdx...*/
         if ( (hqPres == TRUE) && tbCount)
         {
           // dlHq->tbCnt = tbCount; Need to remove tbCnt based logic
            /*ccpu00130166 - ADD - changes to handle both DATA 
              and HqFeedback in single UL subframe.*/
//#ifdef LTE_TDD
            if(2==tbCount)
               hqSz = tbCount;
//#endif /* end of ifdef LTE_TDD*/
            tbCount=0;
         }
         node = node->next;

      }/*for(itr=0...*/

      if (hqPres)
      {
         /* Setting flag for skipping while pucch harq recp req processing */
         alloc->ue->dl.dlSfHqInfo[sf->dlIdx].isPuschHarqRecpPres = TRUE;
      }
   }
   if (hqPres)
   {
      /* Fill the harq related information */
      hqRecpReqInfo = &datRecpInfo->t.puschRecpReq.hqInfo;
      hqRecpReqInfo->hqBetaOff = alloc->ue->ul.betaHqOffst;
#ifdef LTE_TDD
      RgSchTddANInfo *anInfo;
#ifdef LTE_ADV
      U8 numOfCells;
      U8 maxTbCount = 1;
      RgrTxMode txMode;
      U8 idx;
      //U8 maxHqSz = 0;

      numOfCells = alloc->ue->numSCells + 1;

      /* Need to revisit the below code while
       * adding support for PUCCH format 3 */
      if(2 == numOfCells)
      {
         hqRecpReqInfo->hqFdbkMode = TFU_ACK_NACK_CHANNEL_SELECTION; 
         if((NULLP != alloc->hqProc) &&
               (TRUE == alloc->hqProc->isSpsOccnHqP) &&
                  (RG_SCH_M_VAL_2 == noFdbks))
         {
            hqRecpReqInfo->hqSz = 4; 
         }
         else
         {
            for(idx = 0; idx < numOfCells; idx++)
            {
               if(alloc->ue->cellInfo[idx] != NULLP)
               {
                  anInfo = rgSCHUtlGetUeANFdbkInfo(alloc->ue, &recpReqInfo->timingInfo,idx);
                  if((NULLP != alloc->hqProc) && 
                        (TRUE == alloc->hqProc->isSpsOccnHqP) &&
                           (RG_SCH_M_VAL_1 == noFdbks)&&
                             (NULLP != anInfo))
                  {
                     anInfo->isSpsOccasion = TRUE;
                  }
                  if(idx == RGSCH_PCELL_INDEX)
                  {/* Priamry cell index */
                     txMode = alloc->ue->mimoInfo.txMode;
                  }else
                  {
                     txMode = alloc->ue->cellInfo[idx]->txMode.txModeEnum;
                  }

                  maxTbCount = rgSCHUtlGetMaxTbSupp(txMode);

                  if(anInfo)
                  {
                     /* wUlDai max UL DAI in all serving cells */
                     /* TS 36.213: 7.3.2.1 HQSZ based on wUlDai */
                     if (wUlDai < anInfo->ulDai)
                     {
                        wUlDai = anInfo->ulDai;
                     }

                     /*Fill UlDai in Reception Request, which will be used 
                       for HARQ on PUSCH feedback processing*/
                     hqRecpReqInfo->ulDai = wUlDai;
                     anInfo->wUlDai = wUlDai;
                     if (wUlDai == 1)
                     {
                        hqRecpReqInfo->hqSz += maxTbCount;
                     }
                     else if ( wUlDai == 2 || wUlDai == 3 || wUlDai == 4)
                     {
                        hqRecpReqInfo->hqSz = wUlDai * 2;
                     }
                  }/*anInfo*/
               }
            }/*for*/
         }/*SPS and M=2*/
      }/*numOfCells*/
      else
#endif
      {
         anInfo = rgSCHUtlGetUeANFdbkInfo(alloc->ue, &recpReqInfo->timingInfo,RGSCH_PCELL_INDEX); /* This needs to be changed */
         if(anInfo)
         {
            hqRecpReqInfo->nBundled = anInfo->ulDai;
         }

         /* Though different enums however values are same i.e.
          * BUNDLING = 0 
          * MULTIPLEXING = 1
          */
         hqRecpReqInfo->hqFdbkMode = (TfuAckNackMode)alloc->ue->dl.ackNackMode;
         if (alloc->ue->dl.ackNackMode == RGR_TDD_ACKNACK_MODE_BUNDL)
         {
            /* for TX mode 3 and 4 UE shall generate 1 bit per CW */
            /* ACC-TDD */
            /*ccpu00130166 - MOD - chganges to handle both DATA 
              and HqFeedback in single UL subframe.*/
            if(( alloc->ue->mimoInfo.txMode == RGR_UE_TM_3)||
                  ( alloc->ue->mimoInfo.txMode == RGR_UE_TM_4))
            {
               hqRecpReqInfo->hqSz = 2;
            }
            else
            {
               hqRecpReqInfo->hqSz = hqSz;
            }
         }
         else
         {
            /* ACK NACK multiplexing */
            if (alloc->pdcch != NULL)
               hqRecpReqInfo->hqSz = alloc->pdcch->dci.u.format0Info.dai;
         }
      }
#else /* TFU_TDD */
         /* Number of HARQ bits to be expected */
#ifdef LTE_ADV
         hqRecpReqInfo->hqSz = alloc->ue->f1bCsAVal;
#else
         hqRecpReqInfo->hqSz = hqSz;
#endif
         /* Setting the UCI format type */
#endif /* TFU_TDD */
         rgSchSetFormatType(recpReqInfo->timingInfo,alloc->ue, sf);

   }
   RETVALUE(hqPres);
}  /* rgSCHTomUtlFillDatHarqRecpReq */


/***********************************************************
 *
 *     Func : rgSCHTomPrepareAcqiRecp
 *
 *
 *     Desc : Fetch the CQI/PMI bits for a UE based on the mode and store them 
 *            for decoding. Fill RECP request and prepare the scartchpad
 *            to aid decoding of Aperiodic CQI. 
 *
 *     Ret  : Void
 *            ROK - RETVOID
 *
 *     Notes:
 *
 *     File :
 *
 **********************************************************/
#ifdef ANSI
PRIVATE Void rgSCHTomPrepareAcqiRecp
(
 RgSchUeCb			   *ueCb, 
 RgSchCellCb			*cell,
 TfuUePuschCqiRecpInfo *cqiRecpReqInfo,
 U8                    ccIdx
 )
#else
PRIVATE  Void rgSCHTomPrepareAcqiRecp(ueCb, cell, cqiRecpReqInfo, ccIdx)
 RgSchUeCb			   *ueCb;
 RgSchCellCb		   *cell;
 TfuUePuschCqiRecpInfo *cqiRecpReqInfo;
 U8                    ccIdx;
#endif
{
   U8 confRepMode;
   RgSchCqiRawPuschMode12   *mode12Info;   
   RgSchCqiRawPuschMode20   *mode20Info;    
   RgSchCqiRawPuschMode22   *mode22Info;    
   RgSchCqiRawPuschMode30   *mode30Info;   
   RgSchCqiRawPuschMode31   *mode31Info;    
   U8	         numTxAnt   = cell->numTxAntPorts;
   U8            sCellIdx   = ueCb->cellIdToCellIdxMap[RG_SCH_CELLINDEX(cell)];
   U8            numOfCells = 0;
   RgSchUeACqiCb *acqiCb  = &ueCb->cellInfo[sCellIdx]->acqiCb;

   TRC2(rgSCHTomPrepareAcqiRecp);

   /* Fill TFU Recp */
   cqiRecpReqInfo->reportType = TFU_APERIODIC_CQI_TYPE; /* Aperiodic */
   if (ueCb->mimoInfo.txMode == RGR_UE_TM_3 ||
         ueCb->mimoInfo.txMode == RGR_UE_TM_4)
   {
      cqiRecpReqInfo->riSz[ccIdx].pres = TRUE;
      cqiRecpReqInfo->riSz[ccIdx].val  = acqiCb->riNumBits; 
   }
   /* This flag will be rmeoved after making changes in BRDCM CL
    * Sachin is doing the change 
    * */
#if (defined (TENB_T2K3K_SPECIFIC_CHANGES) && defined(LTE_TDD))
   //LTE_ADV_ACQI_SUPP
   cqiRecpReqInfo->cqiPmiSzR1[ccIdx]  = acqiCb->cqiPmiSzR1;
   cqiRecpReqInfo->cqiPmiSzRn1[ccIdx] = acqiCb->cqiPmiSzRn1;
#else
   if(ueCb->nPCqiCb->perRiVal == 1)
   {
      cqiRecpReqInfo->cqiPmiSzR1[ccIdx]  = acqiCb->cqiPmiSzR1;
   }
   else
   {
      cqiRecpReqInfo->cqiPmiSzRn1[ccIdx] = acqiCb->cqiPmiSzRn1;
   }
#endif
   /* Fill scratchpad to aid decoding of aper CQI upon
    * reception */
   confRepMode = acqiCb->aCqiCfg.aprdModeEnum;
   ueCb->rawCqiBitW[ueCb->cqiRiWritIdx].type = TFU_RECP_REQ_PUSCH;

   numOfCells = ueCb->rawCqiBitW[ueCb->cqiRiWritIdx].u.pusch.numOfCells;

   ueCb->rawCqiBitW[ueCb->cqiRiWritIdx].u.pusch.cqiBitWidth[numOfCells].\
      puschRawCqiInfo.mode = (TfuDlCqiPuschMode)confRepMode;

   ueCb->rawCqiBitW[ueCb->cqiRiWritIdx].u.pusch.cqiBitWidth[numOfCells].\
      puschRawCqiInfo.ri.pres = cqiRecpReqInfo->riSz[ccIdx].pres;

   ueCb->rawCqiBitW[ueCb->cqiRiWritIdx].u.pusch.cqiBitWidth[numOfCells].\
      puschRawCqiInfo.ri.val = cqiRecpReqInfo->riSz[ccIdx].val;

   /* Setting the sCellIdx */
   ueCb->rawCqiBitW[ueCb->cqiRiWritIdx].u.pusch.cqiBitWidth[numOfCells].\
      sCellIdx = sCellIdx;

   switch(confRepMode)
   {
      case RGR_APRD_CQI_MOD12:
         {
            mode12Info = &ueCb->rawCqiBitW[ueCb->cqiRiWritIdx].u.pusch.\
                         cqiBitWidth[numOfCells].puschRawCqiInfo.u.mode12Info;
            mode12Info->wideBCqiCw0 = 4;
            mode12Info->r1WideBCqiCw1 = 0;
            mode12Info->rg1WideBCqiCw1 = 4;
            if(numTxAnt == 2)
            {
               mode12Info->r1TotalPmiBitLen = 2*acqiCb->N;
               mode12Info->rg1TotalPmiBitLen = acqiCb->N;
            }
            else if(numTxAnt == 4)
            {
               mode12Info->r1TotalPmiBitLen = 4*acqiCb->N;
               mode12Info->rg1TotalPmiBitLen = 4*acqiCb->N;
            }
         }
         break;

      case RGR_APRD_CQI_MOD20:
         {
            mode20Info = &ueCb->rawCqiBitW[ueCb->cqiRiWritIdx].u.pusch.\
                         cqiBitWidth[numOfCells].puschRawCqiInfo.u.mode20Info;
            mode20Info->wideBCqiCw = 4;
            mode20Info->subBandDiffCqi = 2;
            mode20Info->posOfM = acqiCb->L;
         }
         break;

      case RGR_APRD_CQI_MOD22:
         {
            mode22Info = &ueCb->rawCqiBitW[ueCb->cqiRiWritIdx].u.pusch.\
                         cqiBitWidth[numOfCells].puschRawCqiInfo.u.mode22Info;
            mode22Info->wideBCqiCw0 = 4;
            mode22Info->sBDiffCqiCw0 = 2;
            mode22Info->r1WideBCqiCw1 = 0;
            mode22Info->r1SbDiffCqiCw1 = 0;
            mode22Info->rg1WideBCqiCw1 = 4;
            mode22Info->rg1SbDiffCqiCw1 = 2;
            mode22Info->posOfM = acqiCb->L;
            if(numTxAnt == 2)
            {
               mode22Info->r1PmiBitLen = 4;
               mode22Info->rg1PmiBitLen = 2;
            }
            else if(numTxAnt == 4)
            {
               mode22Info->r1PmiBitLen = 8;
               mode22Info->rg1PmiBitLen = 8;
            }
         }
         break;

      case RGR_APRD_CQI_MOD30:
         {
            mode30Info = &ueCb->rawCqiBitW[ueCb->cqiRiWritIdx].u.pusch.\
                         cqiBitWidth[numOfCells].puschRawCqiInfo.u.mode30Info;
            mode30Info->wideBCqiCw = 4;
            mode30Info->totLenSbDiffCqi = 2*acqiCb->N;
         }
         break;

      case RGR_APRD_CQI_MOD31:
         {
            mode31Info = &ueCb->rawCqiBitW[ueCb->cqiRiWritIdx].u.pusch.\
                         cqiBitWidth[numOfCells].puschRawCqiInfo.u.mode31Info;
            mode31Info->wideBCqiCw0 = 4;
            mode31Info->totLenSbDiffCqiCw0 = 2*acqiCb->N;
            mode31Info->r1WideBCqiCw1 = 0;
            mode31Info->r1TotLenSbDiffCqiCw1 =0;
            mode31Info->rg1WideBCqiCw1 = 4;
            mode31Info->rg1TotLenSbDiffCqiCw1 = 2*acqiCb->N;
            if(numTxAnt == 2)
            {
               mode31Info->r1PmiBitLen = 2;
               mode31Info->rg1PmiBitLen = 1;
            }
            else if(numTxAnt == 4)
            {
               mode31Info->r1PmiBitLen = 4;
               mode31Info->rg1PmiBitLen = 4;
            }
         }
         break;
      default:
         break;
   }
   RETVOID;
}

/**
 * @brief Function which handles the filling of Aperiodic CQI/RI reception
 * request values 
 *
 * @details
 *
 *     Function: rgSCHTomUtlFillDatAperRecpReq
 *
 *    Function which handles the filling of Aperiodic CQI/RI reception
 *    request values
 *
 *     Invoked by: rgSCHTomUtlFillDatRecpReq of rg_sch_tom.c 
 *
 *     Processing Steps:
 *     - Fill the reception request for the data arriving on the ULSCH
 *     - Fill the reception request information for the Aperiodic CQI/PMI/RI
 *           
 *  @param[in]  RgSchCellCb       *cell,
 *              RgSchUlAlloc      *alloc,
 *              TfuUeRecpReqInfo  *datRecpInfo,
 *              CmLteTimingInfo   *timeInfo,
 *              Bool              hqPres
 *  @return  S16
 *      -# ROK 
 *      -# RFAILED 
 **/
#ifdef ANSI
PRIVATE S16 rgSCHTomUtlFillDatAperRecpReq
(
 RgSchCellCb       *cell,
 U8                cqiReq,
 RgSchUlAlloc      *alloc,
 TfuUeRecpReqInfo  *datRecpInfo,
 CmLteTimingInfo   *timeInfo,
 Bool              hqPres,
 U16                validIdx
 )
#else
PRIVATE S16 rgSCHTomUtlFillDatAperRecpReq(cell, cqiReq, alloc, datRecpInfo,
timeInfo, hqPres, validIdx)
   RgSchCellCb       *cell;
   U8                cqiReq;
   RgSchUlAlloc      *alloc;
   TfuUeRecpReqInfo  *datRecpInfo;
   CmLteTimingInfo   *timeInfo;
   Bool              hqPres;
   U16                validIdx; 
#endif
{
   TfuUePuschCqiRecpInfo  *cqiRecpReqInfo;
   RgSchUeCb			  *ueCb = alloc->ue;
#ifdef LTE_ADV
   U8                     triggerSet = 0;
   U8                     sIdx = 0;
#endif
   TRC2(rgSCHTomUtlFillDatAperRecpReq);

   /*Fill RI Reception Params*/
   cqiRecpReqInfo = &datRecpInfo->t.puschRecpReq.cqiRiInfo;   
   cqiRecpReqInfo->riBetaOff = alloc->ue->ul.betaRiOffst;
   cqiRecpReqInfo->cqiBetaOff = alloc->ue->ul.betaCqiOffst;

   
   cqiRecpReqInfo->cCNum = 0;
   ueCb->rawCqiBitW[ueCb->cqiRiWritIdx].u.pusch.numOfCells = 0;

#ifdef LTE_ADV
   rgSCHTomUtlGetTrigSet(cell, ueCb, cqiReq, &triggerSet);
   for (sIdx = 0; sIdx < CM_LTE_MAX_CELLS; sIdx++)
   {
      /* The Aperiodic request for SCell index sIdx */
      if ((triggerSet >> (7 - sIdx)) & 0x01)
      {
         /* The Aperiodic request for SCell index sIdx */
         rgSCHTomPrepareAcqiRecp(ueCb, ueCb->cellInfo[sIdx]->cell, cqiRecpReqInfo, cqiRecpReqInfo->cCNum);
         cqiRecpReqInfo->cCNum++;
         ueCb->rawCqiBitW[ueCb->cqiRiWritIdx].u.pusch.numOfCells++;
      }
   }
#else
   rgSCHTomPrepareAcqiRecp(ueCb, ueCb->cellInfo[0]->cell, cqiRecpReqInfo, cqiRecpReqInfo->cCNum);
   ueCb->rawCqiBitW[ueCb->cqiRiWritIdx].u.pusch.numOfCells++;
#endif

   RG_SCH_INCR_CQIRI_INDEX(ueCb->cqiRiWritIdx);

   if((alloc->ue->srsCb.nSrsTrIdx == validIdx) && (alloc->ue->srsCb.srsDist ==0))
   {
         rgSCHTomFillOnlySrsRecpReq(cell,alloc, datRecpInfo); 
         datRecpInfo->t.puschRecpReq.rcpInfo = TFU_PUSCH_DATA_CQI_SRS; 
         
   }
   if(hqPres && 
   (datRecpInfo->t.puschRecpReq.rcpInfo == TFU_PUSCH_DATA_CQI_SRS))
   {
      datRecpInfo->t.puschRecpReq.rcpInfo = TFU_PUSCH_DATA_CQI_HARQ_SRS;
   }
   else if (hqPres)
   {
      datRecpInfo->t.puschRecpReq.rcpInfo = TFU_PUSCH_DATA_CQI_HARQ;
   }
   else if(datRecpInfo->t.puschRecpReq.rcpInfo != TFU_PUSCH_DATA_CQI_SRS)
   {
      datRecpInfo->t.puschRecpReq.rcpInfo = TFU_PUSCH_DATA_CQI;
   }
   datRecpInfo->rnti = alloc->rnti;
   rgSCHUtlAllocRcptInfo (cell, alloc, timeInfo,
            &datRecpInfo->t.puschRecpReq.ulSchInfo);
   RETVALUE(ROK);
}  /* rgSCHTomUtlFillDatAperRecpReq */



/**
 * @brief Function which handles the filling of Periodic RI reception
 * request values which arrives along with UL Data on ULSCH
 *
 * @details
 *
 *     Function: rgSCHTomUtlFillDatPriRecpReq
 *
      *    Function which handles the filling of Periodic RI reception
 *    request values which arrives along with UL Data on ULSCH
 *
 *     Invoked by: rgSCHTomUtlFillDatRecpReq of rg_sch_tom.c 
 *
 *     Processing Steps:
 *     - Fill the reception request for the data arriving on the ULSCH
 *     - Fill the reception request information for the Periodic RI
 *           
 *  @param[in]  RgSchCellCb       *cell,
 *              RgSchUlAlloc      *alloc,
 *              TfuUeRecpReqInfo  *datRecpInfo,
 *              CmLteTimingInfo   *timeInfo,
 *              Bool              hqPres
 *  @return  S16
 *      -# ROK 
 *      -# RFAILED 
 **/
#ifdef ANSI
PRIVATE S16 rgSCHTomUtlFillDatPriRecpReq
(
 RgSchCellCb       *cell,
 RgSchUlAlloc      *alloc,
 TfuUeRecpReqInfo  *datRecpInfo,
 CmLteTimingInfo   *timeInfo,
 Bool              hqPres,
 U16               validIdx
 )
#else
PRIVATE S16 rgSCHTomUtlFillDatPriRecpReq(cell, alloc, datRecpInfo, timeInfo, 
hqPres, validIdx)
   RgSchCellCb       *cell;
   RgSchUlAlloc      *alloc;
   TfuUeRecpReqInfo  *datRecpInfo;
   CmLteTimingInfo   *timeInfo;
   Bool              hqPres; 
   U16                validIdx;
#endif
{
   TfuUePuschCqiRecpInfo  *cqiRecpReqInfo;
   TRC2(rgSCHTomUtlFillDatPriRecpReq);

   /*Fill RI Reception Params*/
   cqiRecpReqInfo = &datRecpInfo->t.puschRecpReq.cqiRiInfo;   
#ifdef TFU_ALLOC_EVENT_NO_INIT
   cqiRecpReqInfo->cqiBetaOff = 0;
   /* Fill only the first RI index since Periodic can come 
    * only for 1 CC */
   cqiRecpReqInfo->cqiPmiSzR1[0] = 0;
   cqiRecpReqInfo->cqiPmiSzRn1[0] = 0;
#endif
   cqiRecpReqInfo->reportType = TFU_PERIODIC_CQI_TYPE; /* periodic */
   cqiRecpReqInfo->riBetaOff = alloc->ue->ul.betaRiOffst;

   /* Fill only the first RI index since Periodic can come 
    * only for 1 CC */
   cqiRecpReqInfo->cCNum = 1;
   cqiRecpReqInfo->riSz[0].pres = TRUE;
   cqiRecpReqInfo->riSz[0].val = alloc->ue->nPRiCb->riNumBits;
    /*Other params*/
   rgSCHTomUtlFillRiBitWidthInfo(alloc->ue);
    if((alloc->ue->srsCb.nSrsTrIdx == validIdx) && (alloc->ue->srsCb.srsDist ==0))
   {
         rgSCHTomFillOnlySrsRecpReq(cell,alloc, datRecpInfo);
         datRecpInfo->t.puschRecpReq.rcpInfo = TFU_PUSCH_DATA_CQI_SRS; 

   }
   if(hqPres && 
   (datRecpInfo->t.puschRecpReq.rcpInfo == TFU_PUSCH_DATA_CQI_SRS))
   {
      datRecpInfo->t.puschRecpReq.rcpInfo = TFU_PUSCH_DATA_CQI_HARQ_SRS;
   }
   else if (hqPres)
   {
      datRecpInfo->t.puschRecpReq.rcpInfo = TFU_PUSCH_DATA_CQI_HARQ;
   }
   else if(datRecpInfo->t.puschRecpReq.rcpInfo != TFU_PUSCH_DATA_CQI_SRS)
   {
      datRecpInfo->t.puschRecpReq.rcpInfo = TFU_PUSCH_DATA_CQI;
   }
   datRecpInfo->rnti = alloc->rnti;
   rgSCHUtlAllocRcptInfo (cell, alloc, timeInfo,
         &datRecpInfo->t.puschRecpReq.ulSchInfo);
   RETVALUE(ROK);
}  /* rgSCHTomUtlFillDatPriRecpReq */


/**
 * @brief Function which handles the filling of Periodic CQI/PMI reception
 * request values which arrives along with UL Data on ULSCH
 *
 * @details
 *
 *     Function: rgSCHTomUtlFillDatPCqiRecpReq
 *
 *    Function which handles the filling of Periodic CQI/PMI reception
 *    request values which arrives along with UL Data on ULSCH
 *
 *     Invoked by: rgSCHTomUtlFillDatRecpReq of rg_sch_tom.c 
 *
 *     Processing Steps:
 *     - Fill the reception request for the data arriving on the ULSCH
 *     - Fill the reception request information for the Periodic CQI/PMI
 *           
 *  @param[in]  RgSchCellCb       *cell,
 *              RgSchUlAlloc      *alloc,
 *              TfuUeRecpReqInfo  *datRecpInfo,
 *              CmLteTimingInfo         *timeInfo,
 *              Bool hqPres
 *  @return  S16
 *      -# ROK 
 *      -# RFAILED 
 **/

#ifdef ANSI
PRIVATE S16 rgSCHTomUtlFillDatPCqiRecpReq
(
 RgSchCellCb       *cell,
 RgSchUlAlloc      *alloc,
 TfuUeRecpReqInfo  *datRecpInfo,
 CmLteTimingInfo   *timeInfo,
 Bool              hqPres, 
 U16                validIdx
 )
#else
PRIVATE S16 rgSCHTomUtlFillDatPCqiRecpReq(cell, alloc, datRecpInfo, 
      timeInfo, hqPres, validIdx)
   RgSchCellCb       *cell;
   RgSchUlAlloc      *alloc;
   TfuUeRecpReqInfo  *datRecpInfo;
   CmLteTimingInfo   *timeInfo;
   Bool              hqPres; 
   U16                validIdx;
#endif
{
   TfuUePuschCqiRecpInfo  *cqiRecpReqInfo;
   CmLteTimingInfo         recreqTimeInfo;
   U8                 cqiPmiSz; /*Raw CQI/PMI Size*/
   U8                 ri;

   TRC2(rgSCHTomUtlFillDatPCqiRecpReq);

   RG_SCH_ADD_TO_CRNT_TIME(cell->crntTime, recreqTimeInfo, 2);

   /*Fill CQI Reception Params*/
   cqiRecpReqInfo = &datRecpInfo->t.puschRecpReq.cqiRiInfo;
#ifdef TFU_ALLOC_EVENT_NO_INIT
   cqiRecpReqInfo->riBetaOff = 0;
#endif
   cqiRecpReqInfo->cqiBetaOff = alloc->ue->ul.betaCqiOffst;
   cqiPmiSz = rgSCHTomUtlFetchPcqiBitSz(alloc->ue, cell->numTxAntPorts, &ri);
#ifdef TIP_LOWER_L2
      /* If UE doesn't send CQI report for TIP_MAX_RLF_EXPIRY_TMR continuously, UE
       * would be released */
      tipTrackUeInactivity(alloc->ue);
#endif
   if(0 == cqiPmiSz)
   {
      RLOG_ARG1(L_ERROR,DBG_CELLID,cell->cellId,"Unable to Fill "
         "CqiPmi size RNTI:%d",alloc->rnti);
      RETVALUE(RFAILED);
   }

   /* Fill only the first RI index since Periodic can come 
    * only for 1 CC */
   cqiRecpReqInfo->cCNum = 1;
   cqiRecpReqInfo->reportType = TFU_PERIODIC_CQI_TYPE; /* Periodic */
   /* This flags will be removed once Sachin does changes 
    * in BRDCM CL */
#if (defined (TENB_T2K3K_SPECIFIC_CHANGES) && defined(LTE_TDD))
      cqiRecpReqInfo->cqiPmiSzR1[0] = cqiPmiSz;
      cqiRecpReqInfo->cqiPmiSzRn1[0] = cqiPmiSz;
#else
   if (ri ==1)
   {
      cqiRecpReqInfo->cqiPmiSzR1[0] = cqiPmiSz;
      cqiRecpReqInfo->cqiPmiSzRn1[0] = 0;
   }
   else
   {
      cqiRecpReqInfo->cqiPmiSzRn1[0] = cqiPmiSz;
      cqiRecpReqInfo->cqiPmiSzR1[0] = 0;
   }
#endif
   cqiRecpReqInfo->riSz[0].pres = FALSE; 

   if((alloc->ue->srsCb.nSrsTrIdx == validIdx) && (alloc->ue->srsCb.srsDist ==0))
   {
         rgSCHTomFillOnlySrsRecpReq(cell,alloc, datRecpInfo); 
         datRecpInfo->t.puschRecpReq.rcpInfo = TFU_PUSCH_DATA_CQI_SRS; 
   }
   if(hqPres && 
   (datRecpInfo->t.puschRecpReq.rcpInfo == TFU_PUSCH_DATA_CQI_SRS))
   {
      datRecpInfo->t.puschRecpReq.rcpInfo = TFU_PUSCH_DATA_CQI_HARQ_SRS;
   }
   else if (hqPres)
   {
      datRecpInfo->t.puschRecpReq.rcpInfo = TFU_PUSCH_DATA_CQI_HARQ;
   }
   else if(datRecpInfo->t.puschRecpReq.rcpInfo != TFU_PUSCH_DATA_CQI_SRS)
   {
      datRecpInfo->t.puschRecpReq.rcpInfo = TFU_PUSCH_DATA_CQI;
   }
   datRecpInfo->rnti = alloc->rnti;
   rgSCHUtlAllocRcptInfo (cell, alloc, timeInfo,
            &datRecpInfo->t.puschRecpReq.ulSchInfo);
   RETVALUE(ROK);
}  /* rgSCHTomUtlFillDatPCqiRecpReq */

/**
 * @brief Function which handles the filling of SRS reception
 * request values which arrives along with UL Data on ULSCH
 *
 * @details
 *
 *     Function: rgSCHTomUtlFillDatSrsRecpReq
 *
 *    Function which handles the filling of SRS reception
 *    request values which arrives along with UL Data on ULSCH
 *
 *     Invoked by: rgSCHTomUtlFillDatRecpReq of rg_sch_tom.c 
 *
 *     Processing Steps:
 *     - Fill the reception request for the data arriving on the ULSCH
 *     - Fill the reception request information for the SRS
 *           
 *  @param[in]  RgSchCellCb       *cell,
 *              RgSchUlAlloc      *alloc,
 *              TfuUeRecpReqInfo  *datRecpInfo,
 *              CmLteTimingInfo   *timeInfo,
 *              Bool              hqPres
 *  @return  S16
 *      -# ROK 
 *      -# RFAILED 
 **/
#ifdef ANSI
PRIVATE S16 rgSCHTomUtlFillDatSrsRecpReq
(
 RgSchCellCb       *cell,
 RgSchUlAlloc      *alloc,
 TfuUeRecpReqInfo  *datRecpInfo,
 CmLteTimingInfo   *timeInfo,
 Bool              hqPres
 )
#else
PRIVATE S16 rgSCHTomUtlFillDatSrsRecpReq(cell, alloc, datRecpInfo, timeInfo, 
      hqPres)
   RgSchCellCb       *cell;
   RgSchUlAlloc      *alloc;
   TfuUeRecpReqInfo  *datRecpInfo;
   CmLteTimingInfo   *timeInfo;
   Bool              hqPres; 
#endif
{
   TRC2(rgSCHTomUtlFillDatSrsRecpReq);
   datRecpInfo->rnti = alloc->rnti;
   rgSCHTomFillOnlySrsRecpReq(cell,alloc, datRecpInfo); 
   if(hqPres)
   {
      datRecpInfo->t.puschRecpReq.rcpInfo = TFU_PUSCH_DATA_HARQ_SRS;
   }
   else
   {
      datRecpInfo->t.puschRecpReq.rcpInfo = TFU_PUSCH_DATA_SRS;
   }
   datRecpInfo->rnti = alloc->rnti;
   rgSCHUtlAllocRcptInfo (cell, alloc, timeInfo, 
            &datRecpInfo->t.puschRecpReq.ulSchInfo);
   RETVALUE(ROK);
}  /* rgSCHTomUtlFillDatSrsRecpReq */

/**
 * @brief Function which handles the filling of only SRS reception
 * request values on ULSCH
 *
 * @details
 *
 *     Function: rgSCHTomFillOnlySrsRecpReq
 *
 *    Function which handles the filling of SRS reception
 *    request values which arrives along with UL Data on ULSCH
 *
 *     Invoked by: rgSCHTomUtlFillDatSrsRecpReq of rg_sch_tom.c 
 *
 *     Processing Steps:
 *     - Fill the reception request for the data arriving on the ULSCH
 *     - Fill the reception request information for the SRS
 *           
 *  @param[in]  RgSchCellCb       *cell,
 *              RgSchUlAlloc      *alloc,
 *              TfuUeRecpReqInfo  *datRecpInfo,
 *  @return  S16
 *      -# ROK 
 *      -# RFAILED 
 **/
#ifdef ANSI
PRIVATE S16 rgSCHTomFillOnlySrsRecpReq
(
 RgSchCellCb       *cell,
 RgSchUlAlloc      *alloc,
 TfuUeRecpReqInfo  *datRecpInfo
 )
#else
PRIVATE S16 rgSCHTomFillOnlySrsRecpReq(cell, alloc, datRecpInfo)  
   RgSchCellCb       *cell;
   RgSchUlAlloc      *alloc;
   TfuUeRecpReqInfo  *datRecpInfo;
#endif
{
   TfuUePuschSrsRecpInfo  *srsRecpReqInfo;
   TRC2(rgSCHTomFillOnlySrsRecpReq);

   srsRecpReqInfo = &datRecpInfo->t.puschRecpReq.srsInfo;
   srsRecpReqInfo->srsBw = (TfuUlSrsBwInfo)alloc->ue->srsCb.srsCfg.srsSetup.srsBw;
   srsRecpReqInfo->nRrc = alloc->ue->srsCb.srsCfg.srsSetup.fDomPosi;
   srsRecpReqInfo->srsHopBw = (TfuUlSrsHoBwInfo)alloc->ue->srsCb.srsCfg.srsSetup.srsHopBw;
   srsRecpReqInfo->transComb = alloc->ue->srsCb.srsCfg.srsSetup.txComb;
   srsRecpReqInfo->srsCfgIdx = alloc->ue->srsCb.srsCfg.srsSetup.srsCfgIdx;
   srsRecpReqInfo->srsCyclicShft = (TfuUlSrsCycShiftInfo)alloc->ue->srsCb.srsCfg.srsSetup.cycShift;

   /* ccpu00117050 - ADD - nSrs setting 
    * Refer Section 5.2.2.6 of TS 36.212 V8.5.0*/
   datRecpInfo->t.puschRecpReq.ulSchInfo.nSrs = 1;

   RETVALUE(ROK);
}  /* rgSCHTomFillOnlySrsRecpReq */

/**
 * @brief Function which handles the filling of PCQI/RI, SRS and SR
 *             Reception Request Information along
 *             with the HARQ reception Request
 *
 * @details
 *
 *     Function: rgSCHTomUtlFillCqiSrSrsWithHq
 *
 *              Function which handles the filling of PCQI/RI, SRS ans SR
 *             Reception Request Information along
 *             with the HARQ reception Request
 *
 *
 *     Invoked by: rgSCHTomUtlFillHqFdbkRecpReq & 
 *          rgSCHTomUtlFillSfHqFdbk of rg_sch_tom.c 
 *
 *     Processing Steps:
 *     - Fill the reception request for the Control Info arriving on the PUCCH
 *     - Fill the reception request information for the SR, RI, CQI, SRS
 *           
 *  @param[in]   RgSchCellCb       *cell,
 *               TfuRecpReqInfo    *recpReqInfo,
 *               RgSchDlHqProcCb   *hqCb,
 *  @param[out]  TfuUeRecpReqInfo  *pucchRecpInfo
 *  @param[in]   U16               validIdx
 *  @return  S16
 *      -# ROK 
 *      -# RFAILED 
 **/
#ifdef ANSI
PRIVATE S16 rgSCHTomUtlFillCqiSrSrsWithHq
(
 RgSchCellCb       *cell,
 TfuRecpReqInfo    *recpReqInfo,
 RgSchUeCb         *ue,
 TfuUeRecpReqInfo  *pucchRecpInfo,
 U16                validIdx,
 Bool               isDatPresOnSecCell
 )
#else
PRIVATE S16 rgSCHTomUtlFillCqiSrSrsWithHq(cell, recpReqInfo, ue, 
      pucchRecpInfo, validIdx,isDatPresOnSecCell)
RgSchCellCb       *cell;
TfuRecpReqInfo    *recpReqInfo;
RgSchUeCb         *ue;
TfuUeRecpReqInfo  *pucchRecpInfo;
U16               validIdx;
Bool              isDatPresOnSecCell;
#endif
{
   RgSchUePCqiCb   *cqiCb;
   RgSchUePCqiCb   *riCb;
   U8                 ri; /*To fetch RI value*/
   Bool               willUeRprtCqi;   /* Flag set due to CQI Mask and 
                                      UE Inactive state (DRX)*/

#ifdef LTEMAC_SPS
   RgSchCmnUlUeSpsInfo   *ulSpsUe = NULL;
#endif



   TRC2(rgSCHTomUtlFillCqiSrSrsWithHq);
    
   if(ue)
   {
      rgSCHTomUtlWillUeRprtCqiRi(ue, &willUeRprtCqi);
      if(ue->srCb.nSrTrIdx == validIdx)
      {

#ifdef LTEMAC_SPS
        /* Should we check for Rel8 and above???
         * Dont send SR recp req if logicalChannelSR-Mask enabled and UL SPS is
         * active*/
        ulSpsUe =  RG_SCH_CMN_GET_UL_SPS_UE(ue, cell);
        /* Avoiding check for ulSpsEnabled as isUlSpsActv FALSE if sps is not enabled*/
        if(!((ue->ul.ulSpsCfg.isLcSRMaskEnab) &&
           (ulSpsUe->isUlSpsActv)))
        {
#endif


         /*Fill SR params*/
         pucchRecpInfo->t.pucchRecpReq.srInfo.n1PucchIdx = 
         ue->srCb.srCfg.srSetup.srResIdx; 
         pucchRecpInfo->t.pucchRecpReq.uciInfo = TFU_PUCCH_HARQ_SR;

#ifdef LTEMAC_SPS
        }
#endif

         rgSCHTomUtlMoveSrNxtOccasion(cell, ue);
      }
      /* LTE_ADV:: UE will drop CSI during CSI+1BCS if data is present
       * on sec cell(isDatPresOnSecCell)*/
      riCb = ue->nPRiCb;
      cqiCb = ue->nPCqiCb;
      if(riCb->nRiTrIdx == validIdx)
      {
         /*ccpu00140578:: Skip the UE if the RI is already processed
          * for PUSCH */
         if(riCb->riRecpPrcsd == FALSE)
         {
            if(riCb->riDist == 0)
            {
               if((riCb->cqiCfg.cqiSetup.sANCQI == TRUE) && (willUeRprtCqi == TRUE)&&
                     (isDatPresOnSecCell == FALSE))
               {
                  /*Fill RI params*/
                  pucchRecpInfo->t.pucchRecpReq.cqiInfo.n2PucchIdx =
                     riCb->cqiCfg.cqiSetup.cqiPResIdx; 
                  pucchRecpInfo->t.pucchRecpReq.cqiInfo.cqiPmiSz = 
                     riCb->riNumBits; 
                  if(pucchRecpInfo->t.pucchRecpReq.uciInfo == TFU_PUCCH_HARQ_SR)
                  {
                     pucchRecpInfo->t.pucchRecpReq.uciInfo = TFU_PUCCH_HARQ_SR_CQI;
                  }
                  else
                  {
                     pucchRecpInfo->t.pucchRecpReq.uciInfo = TFU_PUCCH_HARQ_CQI;
                  }
                  ue->rawCqiBitW[ue->cqiRiWritIdx].recvTime = recpReqInfo->timingInfo;
#ifdef LTE_ADV
                  ue->rawCqiBitW[ue->cqiRiWritIdx].u.pucch.sCellIdx =
                     ue->nPRiCb->servCellInfo->sCellIdx;
#endif
                  rgSCHTomUtlFillRiBitWidthInfo(ue);
                  if (ue->nPCqiCb->nCqiTrIdx == validIdx)
                  {
                     rgSCHTomUtlMovePcqiNxtOccasion(cell, ue, ue->nPCqiCb); 
                  } 
#ifdef CA_DBG
                  {
                     if(gF1bCsPres)
                     {
                        gRiReqCount++;
                     } 
                  }

#endif



               }
               rgSCHTomUtlMovePriNxtOccasion(cell, ue, riCb);
            }
            else
            {
               riCb->riDist--;
            }
            /* Skip the UE for RI processing on PUCCH
             * in the same subframe as it already processed */
            if(riCb->nRiTrIdx == validIdx)
            {
               /* As the new idx is same is current idx
                * then PUCCH reception processing will consider
                * RI also in the same subframe. To block this
                * below flag is used*/
               riCb->riRecpPrcsd = TRUE;
            }
         }
      }
      else if(cqiCb->nCqiTrIdx == validIdx)
      {
         if((cqiCb->cqiCfg.cqiSetup.sANCQI == TRUE) && (willUeRprtCqi == TRUE)&&
            (isDatPresOnSecCell == FALSE))
         {
            /*Fill CQI Params*/
            pucchRecpInfo->t.pucchRecpReq.cqiInfo.n2PucchIdx =
               cqiCb->cqiCfg.cqiSetup.cqiPResIdx; 

            ue->rawCqiBitW[ue->cqiRiWritIdx].recvTime = recpReqInfo->timingInfo;
#ifdef LTE_ADV
            ue->rawCqiBitW[ue->cqiRiWritIdx].u.pucch.sCellIdx =
               cqiCb->servCellInfo->sCellIdx;
#endif
            pucchRecpInfo->t.pucchRecpReq.cqiInfo.cqiPmiSz =
               rgSCHTomUtlFetchPcqiBitSz(ue, cell->numTxAntPorts, &ri); 
            if(0 == pucchRecpInfo->t.pucchRecpReq.cqiInfo.cqiPmiSz)
            {
               RLOG_ARG1(L_ERROR,DBG_CELLID,cell->cellId,"RNTI:%d "
                  "Unable to Fill CqiPmi size", ue->ueId);
               RETVALUE(RFAILED);
            }
            if(pucchRecpInfo->t.pucchRecpReq.uciInfo == TFU_PUCCH_HARQ_SR)
            {
               pucchRecpInfo->t.pucchRecpReq.uciInfo = TFU_PUCCH_HARQ_SR_CQI;
            }
            else
            {
               pucchRecpInfo->t.pucchRecpReq.uciInfo = TFU_PUCCH_HARQ_CQI;
            }
         }
#ifdef CA_DBG
               {
                  if(gF1bCsPres)
                  {
                     gCqiReqCount++;
                  } 
               }

#endif

         rgSCHTomUtlMovePcqiNxtOccasion(cell, ue, cqiCb);           
      }
      if(ue->srsCb.nSrsTrIdx == validIdx)
      {
         /* ccpu00140578::Skip the UE for SRS reception processing
          * if already done as part of PUSCH recpetion 
          * process*/
         if(ue->srsCb.srsRecpPrcsd == FALSE)
         {
            if(ue->srsCb.srsDist ==0 )
            {
               if((pucchRecpInfo->t.pucchRecpReq.uciInfo != TFU_PUCCH_HARQ_CQI) 
                     && (ue->srsCb.srsCfg.srsSetup.sANSrs)
                     && (isDatPresOnSecCell == FALSE))
               {
                  /*Fill SRS params*/
                  pucchRecpInfo->t.pucchRecpReq.srsInfo.srsBw = 
                     (TfuUlSrsBwInfo)ue->srsCb.srsCfg.srsSetup.srsBw;
                  pucchRecpInfo->t.pucchRecpReq.srsInfo.nRrc = 
                     ue->srsCb.srsCfg.srsSetup.fDomPosi;
                  pucchRecpInfo->t.pucchRecpReq.srsInfo.srsHopBw = 
                     (TfuUlSrsHoBwInfo)ue->srsCb.srsCfg.srsSetup.srsHopBw;
                  pucchRecpInfo->t.pucchRecpReq.srsInfo.transComb = 
                     ue->srsCb.srsCfg.srsSetup.txComb;
                  pucchRecpInfo->t.pucchRecpReq.srsInfo.srsCfgIdx = 
                     ue->srsCb.srsCfg.srsSetup.srsCfgIdx;
                  pucchRecpInfo->t.pucchRecpReq.srsInfo.srsCyclicShft = 
                     (TfuUlSrsCycShiftInfo)ue->srsCb.srsCfg.srsSetup.cycShift;
                  /* ccpu00116923 - ADD - New Reception Request types for CQI and SRS with SR */
                  switch(pucchRecpInfo->t.pucchRecpReq.uciInfo)
                  {
                     case TFU_PUCCH_HARQ_SR:
                        pucchRecpInfo->t.pucchRecpReq.uciInfo = TFU_PUCCH_HARQ_SR_SRS;
                        break;
                     case TFU_PUCCH_HARQ_SR_CQI:
                        pucchRecpInfo->t.pucchRecpReq.uciInfo = TFU_PUCCH_HARQ_SR_CQI_SRS;
                        break;
                     default:
                        pucchRecpInfo->t.pucchRecpReq.uciInfo = TFU_PUCCH_HARQ_SRS;
                        break;
                  }
               }
               rgSCHTomUtlMoveSrsNxtOccasion(cell, ue);
            }
            else
            {
               ue->srsCb.srsDist--; 
            }
            /* Skip the UE for SRS processing on PUCCH
             * in the same subframe as it already processed */
            if(ue->srsCb.nSrsTrIdx == validIdx)
            {
               /* As the new idx is same is current idx
                * then PUCCH reception processing will consider
                * SRS also in the same subframe. To block this
                * below flag is used*/
               ue->srsCb.srsRecpPrcsd = TRUE;
            }

         }
      }
   }            

   RETVALUE(ROK);
}  /* rgSCHTomUtlFillCqiSrSrsWithHq */

/**
 * @brief  Function which handles the filling of PCQI/RI, SRS 
 *             Reception Request Information along with SR reception 
 *              Request 
 *
 * @details
 *
 *     Function: rgSCHTomUtlFillCqiSrsWithSr
 *
 *              Function which handles the filling of PCQI/RI, SRS 
 *             Reception Request Information along
 *             with the SR reception Request
 *
 *
 *     Invoked by: rgSCHTomUtlFillSrRecpReq of rg_sch_tom.c 
 *
 *     Processing Steps:
 *     - Fill the reception request for CQI/RI, SRS if they occur
 *       in the same instance as of SR. 
 *           
 *  @param[in]   RgSchCellCb       *cell,
 *               RgSchUeCb         *ue
 *               TfuRecpReqInfo    *recpReqInfo,
 *  @param[out]  TfuUeRecpReqInfo  *pucchRecpInfo
 *  @param[in]   U16               validIdx
 *  @return  S16
 *      -# ROK 
 *      -# RFAILED 
 **/
#ifdef ANSI
PRIVATE S16 rgSCHTomUtlFillCqiSrsWithSr
(
 RgSchCellCb       *cell,
 RgSchUeCb         *ue, 
 TfuRecpReqInfo    *recpReqInfo,
 TfuUeRecpReqInfo  *pucchRecpInfo,
 U16               validIdx
 )
#else
PRIVATE S16 rgSCHTomUtlFillCqiSrsWithSr(cell, ue, recpReqInfo,  
      pucchRecpInfo, validIdx)
RgSchCellCb       *cell;
RgSchUeCb         *ue; 
TfuRecpReqInfo    *recpReqInfo;
TfuUeRecpReqInfo  *pucchRecpInfo;
U16               validIdx;
#endif
{
   RgSchUePCqiCb   *cqiCb;
   RgSchUePCqiCb   *riCb;
   U8                 ri; /*To fetch RI value*/
   Bool               willUeRprtCqi;   /* Flag set due to CQI Mask and 
                                      UE Inactive state (DRX)*/
   TRC2(rgSCHTomUtlFillCqiSrsWithSr);
   
   riCb = ue->nPRiCb;
   cqiCb = ue->nPCqiCb;
   rgSCHTomUtlWillUeRprtCqiRi(ue, &willUeRprtCqi);
   if(riCb->nRiTrIdx == validIdx)
   {
      /*ccpu00140578:: Skip the UE if the RI is already processed
       * for PUSCH */
      if(riCb->riRecpPrcsd == FALSE)
      {
         if(riCb->riDist == 0)
         {
            if(willUeRprtCqi == TRUE)
            {
               /*Fill RI params*/
               pucchRecpInfo->t.pucchRecpReq.cqiInfo.n2PucchIdx =
                  riCb->cqiCfg.cqiSetup.cqiPResIdx; 
               pucchRecpInfo->t.pucchRecpReq.cqiInfo.cqiPmiSz = 
                  riCb->riNumBits; 

               pucchRecpInfo->t.pucchRecpReq.uciInfo = TFU_PUCCH_SR_CQI;
               ue->rawCqiBitW[ue->cqiRiWritIdx].recvTime = recpReqInfo->timingInfo;
#ifdef LTE_ADV
               ue->rawCqiBitW[ue->cqiRiWritIdx].u.pucch.sCellIdx =
                  ue->nPRiCb->servCellInfo->sCellIdx;
#endif
               rgSCHTomUtlFillRiBitWidthInfo(ue);
               /* TODO:: syed Shouldn't this be done outside this if condition */
               if (cqiCb->nCqiTrIdx == validIdx)
               {
                  rgSCHTomUtlMovePcqiNxtOccasion(cell, ue, cqiCb); 
               }       
            }
            rgSCHTomUtlMovePriNxtOccasion(cell, ue, riCb);
         }
         else
         {
            riCb->riDist--;
         }
         if(riCb->nRiTrIdx == validIdx)
         {/* Need to skip this UE during PUCCH RI recpetion process
             in the current subframe */
            riCb->riRecpPrcsd = TRUE;
         }
      }
   }
   else if(cqiCb->nCqiTrIdx == validIdx)
   {
      if(willUeRprtCqi == TRUE)
      {
         /*Fill CQI Params*/
         pucchRecpInfo->t.pucchRecpReq.cqiInfo.n2PucchIdx =
            cqiCb->cqiCfg.cqiSetup.cqiPResIdx; 

            ue->rawCqiBitW[ue->cqiRiWritIdx].recvTime = recpReqInfo->timingInfo;

#ifdef LTE_ADV
            ue->rawCqiBitW[ue->cqiRiWritIdx].u.pucch.sCellIdx =
               cqiCb->servCellInfo->sCellIdx;
#endif
            pucchRecpInfo->t.pucchRecpReq.cqiInfo.cqiPmiSz =
               rgSCHTomUtlFetchPcqiBitSz(ue, cell->numTxAntPorts, &ri); 
            if(0 == pucchRecpInfo->t.pucchRecpReq.cqiInfo.cqiPmiSz)
            {
               RLOG_ARG1(L_ERROR,DBG_CELLID,cell->cellId,"RNTI:%d"
                  " Unable to Fill CqiPmi size", ue->ueId);
               RETVALUE(RFAILED);
            }

            pucchRecpInfo->t.pucchRecpReq.uciInfo = TFU_PUCCH_SR_CQI;
         }
         rgSCHTomUtlMovePcqiNxtOccasion(cell, ue, cqiCb);  
      }
      if(ue->srsCb.nSrsTrIdx == validIdx)
      {
         /* ccpu00140578:: Cnsider the SRS processing 
          * only if not done in the same TTI 
          * as part of PUSCH or HARQ reception process*/
         if(ue->srsCb.srsRecpPrcsd == FALSE)
         {
            if(ue->srsCb.srsDist ==0 )
            {
               if(ue->srsCb.srsCfg.srsSetup.sANSrs) 
               {
                  /*Fill SRS params*/
                  pucchRecpInfo->t.pucchRecpReq.srsInfo.srsBw = 
                     (TfuUlSrsBwInfo)ue->srsCb.srsCfg.srsSetup.srsBw;
                  pucchRecpInfo->t.pucchRecpReq.srsInfo.nRrc = 
                     ue->srsCb.srsCfg.srsSetup.fDomPosi;
                  pucchRecpInfo->t.pucchRecpReq.srsInfo.srsHopBw = 
                     (TfuUlSrsHoBwInfo)ue->srsCb.srsCfg.srsSetup.srsHopBw;
                  pucchRecpInfo->t.pucchRecpReq.srsInfo.transComb = 
                     ue->srsCb.srsCfg.srsSetup.txComb;
                  pucchRecpInfo->t.pucchRecpReq.srsInfo.srsCfgIdx = 
                     ue->srsCb.srsCfg.srsSetup.srsCfgIdx;
                  pucchRecpInfo->t.pucchRecpReq.srsInfo.srsCyclicShft = 
                     (TfuUlSrsCycShiftInfo)ue->srsCb.srsCfg.srsSetup.cycShift;
                  /* ccpu00116923 - ADD - New Reception Request types for CQI and
                   * SRS with SR */
                  if(pucchRecpInfo->t.pucchRecpReq.uciInfo == TFU_PUCCH_SR_CQI)
                  {
                     pucchRecpInfo->t.pucchRecpReq.uciInfo = TFU_PUCCH_SR_CQI_SRS;
                  }
                  else
                  {
                     pucchRecpInfo->t.pucchRecpReq.uciInfo = TFU_PUCCH_SR_SRS;
                  }

               }
               rgSCHTomUtlMoveSrsNxtOccasion(cell, ue);
            }
            else
            {
               ue->srsCb.srsDist--; 
            }
            /* Skip the UE for SRS processing on PUCCH
             * in the same subframe as it already processed */
            if(ue->srsCb.nSrsTrIdx == validIdx)
            {
               /* As the new idx is same is current idx
                * then PUCCH reception processing will consider
                * SRS also in the same subframe. To block this
                * below flag is used*/
               ue->srsCb.srsRecpPrcsd = TRUE;
            }

         }
      }
   RETVALUE(ROK);
}  /* rgSCHTomUtlFillCqiSrsWithSr */

/**
 * @brief Function which decodes Raw PCQI Info and fills the DLCqiRpt.
 *
 * @details
 *
 *     Function: rgSCHTomUtlDecodeRawPcqiPucchMode21
 *
 *     Function which decodes Raw PCQI Info and fills the DLCqiRpt structure.
 *
 *     Invoked by: rgSCHTomUtlDecodeRawPcqi 
 *
 *     Processing Steps:
 *     - Depending on the Raw PCQI Info stored during Reception Request
 *        decode the Raw PCQI Report 
 *     - Fill the DL CQI Report structure accordingly for the decoded Raw PCQI
 *           
 *  @param[in] U8*                    ri
 *  @param[in] U8*                    revArray
 *  @param[out] TfuCqiPucchMode21     *puMode21
 *  @param[out] TfuCqiPucchMode21     *mode21
 *  @return  Void
 **/
#ifdef ANSI
PRIVATE Void rgSCHTomUtlDecodeRawPcqiPucchMode21
( 
U8                 *revArray,
TfuCqiPucchMode21  *puMode21,
TfuCqiPucchMode21  *mode21,
U8                 *ri
 )
#else
PRIVATE Void rgSCHTomUtlDecodeRawPcqiPucchMode21(revArray,
               puMode21,mode21,ri)
U8                 *revArray;
TfuCqiPucchMode21  *puMode21;
TfuCqiPucchMode21  *mode21;
U8                 *ri;
#endif
{
   CONSTANT U8 leastSignBit = 0;
   TRC2(rgSCHTomUtlDecodeRawPcqiPucchMode21);

   if (mode21->type == TFU_RPT_CQI)
   {
      puMode21->type = TFU_RPT_CQI;
      if (mode21->u.cqi.isWideband)
      {
         puMode21->u.cqi.isWideband = TRUE; 
         puMode21->u.cqi.u.wideCqi.cqi = 
            (U8)rgSCHUtlParse(revArray, leastSignBit, 
            (U8)(leastSignBit+mode21->u.cqi.u.wideCqi.cqi), 
            (U8)TFU_MAX_CQI_BYTES);
         if (mode21->u.cqi.u.wideCqi.diffCqi.pres)
         {
             puMode21->u.cqi.u.wideCqi.diffCqi.pres = TRUE;
             puMode21->u.cqi.u.wideCqi.diffCqi.val = 
                rgSCHUtlParse(revArray,
                 (U8)(leastSignBit+mode21->u.cqi.u.wideCqi.cqi), 
                 (U8)(leastSignBit+(mode21->u.cqi.u.wideCqi.cqi+
                     mode21->u.cqi.u.wideCqi.diffCqi.val)),
                 (U8)TFU_MAX_CQI_BYTES);
             puMode21->u.cqi.u.wideCqi.pmi = 
             rgSCHUtlParse(revArray,
                 (U8)(leastSignBit+(mode21->u.cqi.u.wideCqi.cqi+
                         mode21->u.cqi.u.wideCqi.diffCqi.val)),
                 (U8)(leastSignBit+(mode21->u.cqi.u.wideCqi.cqi+
                    mode21->u.cqi.u.wideCqi.diffCqi.val+
                    mode21->u.cqi.u.wideCqi.pmi)), (U8)TFU_MAX_CQI_BYTES);
         }
         else
         {
             puMode21->u.cqi.u.wideCqi.diffCqi.pres = FALSE;
             puMode21->u.cqi.u.wideCqi.pmi = 
             rgSCHUtlParse(revArray,
                     (U8)(leastSignBit + mode21->u.cqi.u.wideCqi.cqi), 
                     (U8)(leastSignBit+(mode21->u.cqi.u.wideCqi.cqi+
                     mode21->u.cqi.u.wideCqi.pmi)),(U8)TFU_MAX_CQI_BYTES);
         }
      }
      else
      {
          puMode21->u.cqi.isWideband = FALSE; 
          puMode21->u.cqi.u.subCqi.cqi = 
                rgSCHUtlParse(revArray,
               leastSignBit, (U8)(leastSignBit+mode21->u.cqi.u.subCqi.cqi), 
                (U8)TFU_MAX_CQI_BYTES);
          if(mode21->u.cqi.u.subCqi.diffCqi.pres)
          {
              puMode21->u.cqi.u.subCqi.diffCqi.pres = TRUE;
              puMode21->u.cqi.u.subCqi.diffCqi.val = 
              rgSCHUtlParse(revArray,
                 (U8)(leastSignBit+mode21->u.cqi.u.subCqi.cqi), 
                 (U8)(leastSignBit+(mode21->u.cqi.u.subCqi.cqi+
                 mode21->u.cqi.u.subCqi.diffCqi.val)),(U8)TFU_MAX_CQI_BYTES);
              puMode21->u.cqi.u.subCqi.l = 
                 rgSCHUtlParse(revArray,
                 (U8)(leastSignBit+(mode21->u.cqi.u.subCqi.cqi+
                       mode21->u.cqi.u.subCqi.diffCqi.val)),
                       (U8)(leastSignBit+(mode21->u.cqi.u.subCqi.cqi+
                        mode21->u.cqi.u.subCqi.diffCqi.val+
                        mode21->u.cqi.u.subCqi.l)),(U8) TFU_MAX_CQI_BYTES);
          }
          else
          {
              puMode21->u.cqi.u.subCqi.diffCqi.pres = FALSE;
              puMode21->u.cqi.u.subCqi.l = 
                        rgSCHUtlParse(revArray,
                        (U8)(leastSignBit+(mode21->u.cqi.u.subCqi.cqi)),
                        (U8)(leastSignBit+(mode21->u.cqi.u.subCqi.cqi+
                        mode21->u.cqi.u.subCqi.l)), (U8)TFU_MAX_CQI_BYTES);
          }
      }
   }
   else if (mode21->type == TFU_RPT_RI)
   {
       puMode21->type = TFU_RPT_RI;
       puMode21->u.ri = (rgSCHUtlParse(ri, (8-mode21->u.ri), 8, 1)+1);
       if(puMode21->u.ri == 1)
       {
          ri1Cnt++;
       }   
       else if(puMode21->u.ri == 2)
       {
          ri2Cnt++;
       }   
   }
   RETVOID;
}  /* rgSCHTomUtlDecodeRawPcqiPucchMode21 */

/**
 * @brief Function which decodes Raw ACQI Info and fills the DLCqiRpt.
 *
 * @details
 *
 *     Function: rgSCHTomUtlDecodeRawAcqiPuschMode31
 *
 *     Function which decodes Raw ACQI Info and fills the DLCqiRpt structure.
 *
 *     Invoked by: rgSCHTomUtlDecodeRawACqi
 *
 *     Processing Steps:
 *     - Depending on the Raw ACQI Info stored during Reception Request
 *        decode the Raw CQI Report 
 *     - Fill the DL CQI Report structure accordingly for the decoded Raw ACQI
 *           
    @param[in] RgSchCellCb     *cellCb
 *  @param[in] RgSchUeCb       *ueCb
 *  @param[in] U8*             revArray
 *  @param[out] RgSchCqiRawPuschMode31     *mode31Info
 *  @param[in] TfuCqiPuschMode31     *psMode31
 *  @param[in] U8     ri
 *  @param[in] U32    numTxAnt
 *  @return  Void
 **/
#ifdef ANSI
PRIVATE Void rgSCHTomUtlDecodeRawAcqiPuschMode31
(
 RgSchCellCb        *cellCb,
 RgSchUeCb          *ueCb,
 U8*                  revArray,
 RgSchCqiRawPuschMode31   *mode31Info,
 TfuCqiPuschMode31   *psMode31,
 U8                  ri,
 U32                 numTxAnt,
 RgSchUeACqiCb       *acqiCb,
 U8                  *leastSignBit
)
#else
PRIVATE Void rgSCHTomUtlDecodeRawAcqiPuschMode31(cellCb,ueCb,revArray,
         mode31Info,psMode31,ri,numTxAnt,acqiCb)
RgSchCellCb        *cellCb;
RgSchUeCb          *ueCb;
U8*                  revArray;
RgSchCqiRawPuschMode31   *mode31Info;   
TfuCqiPuschMode31   *psMode31;   
U8                  ri;
U32                 numTxAnt;
RgSchUeACqiCb       *acqiCb;
U8                  *leastSignBit;
#endif
{
   U8 loop, sbOffst,diffCqiVal; /* vrr */

   TRC2(rgSCHTomUtlDecodeRawAcqiPuschMode31);
    
   psMode31->numSubband = acqiCb->N;
   psMode31->wideBandCqi[0] = rgSCHUtlParse(revArray,
        *leastSignBit, (U8)(*leastSignBit+mode31Info->wideBCqiCw0), 
              TFU_MAX_CQI_BYTES);
   sbOffst = *leastSignBit + mode31Info->wideBCqiCw0;         
   for(loop =0; loop<mode31Info->totLenSbDiffCqiCw0/2; loop++)
   {
       diffCqiVal = rgSCHUtlParse(revArray,sbOffst,
                        (U8)(sbOffst+2), (U8)TFU_MAX_CQI_BYTES);
       psMode31->subbandCqiArr[loop].cqiIdx[0] = psMode31->wideBandCqi[0] +
                                     rgSchCmnAper30n31DiffCqi[diffCqiVal]; /* vrr */
       sbOffst+=2;
       psMode31->subbandCqiArr[loop].subband.numRb = acqiCb->k;
       psMode31->subbandCqiArr[loop].subband.rbStart = 
                  acqiCb->k*loop;
   }
   /* ccpu00141110- numRb is not k for all the subbands. 
    * last deficit SB will have less than k */
   if(cellCb->bwCfg.dlTotalBw < acqiCb->k * loop)
   {
      psMode31->subbandCqiArr[loop-1].subband.numRb = 
         cellCb->bwCfg.dlTotalBw - (acqiCb->k * (loop-1));
   }
   if(ri ==1)
   {
       psMode31->wideBandCqi[1] = 0;
       for(loop =0; loop<mode31Info->totLenSbDiffCqiCw0/2; loop++)
       {
           psMode31->subbandCqiArr[loop].cqiIdx[1] = 0;
       }
       psMode31->pmi = rgSCHUtlParse(revArray,
        (U8)(*leastSignBit+(mode31Info->wideBCqiCw0+
                mode31Info->totLenSbDiffCqiCw0)),
        (U8)(*leastSignBit+(mode31Info->wideBCqiCw0+
                mode31Info->totLenSbDiffCqiCw0+
                       mode31Info->r1PmiBitLen)), TFU_MAX_CQI_BYTES);

       *leastSignBit = (U8)(*leastSignBit + (mode31Info->wideBCqiCw0 + \
                mode31Info->totLenSbDiffCqiCw0 + mode31Info->r1PmiBitLen));
   }
   else if (ri > 1)
   {
       psMode31->wideBandCqi[1] = rgSCHUtlParse(revArray,
        (U8)(*leastSignBit+(mode31Info->wideBCqiCw0+
                        mode31Info->totLenSbDiffCqiCw0)), 
        (U8)(*leastSignBit+(mode31Info->wideBCqiCw0+
                mode31Info->totLenSbDiffCqiCw0+mode31Info->rg1WideBCqiCw1)), 
                           TFU_MAX_CQI_BYTES);
      sbOffst = *leastSignBit + (mode31Info->wideBCqiCw0+
                mode31Info->totLenSbDiffCqiCw0+ mode31Info->rg1WideBCqiCw1); 
      for(loop =0; loop<mode31Info->rg1TotLenSbDiffCqiCw1/2; loop++)
      {
          diffCqiVal = rgSCHUtlParse(revArray,sbOffst,
                        (U8)(sbOffst+2), (U8)TFU_MAX_CQI_BYTES);
          psMode31->subbandCqiArr[loop].cqiIdx[1] = psMode31->wideBandCqi[1] +
                                     rgSchCmnAper30n31DiffCqi[diffCqiVal]; /* vrr */
          sbOffst+=2;
      }
      psMode31->pmi = rgSCHUtlParse(revArray,
            (U8)(*leastSignBit+(mode31Info->wideBCqiCw0+
                mode31Info->totLenSbDiffCqiCw0+mode31Info->rg1WideBCqiCw1 + 
                mode31Info->rg1TotLenSbDiffCqiCw1)),
            (U8)(*leastSignBit+(mode31Info->wideBCqiCw0+
                    mode31Info->totLenSbDiffCqiCw0+mode31Info->rg1WideBCqiCw1 + 
                    mode31Info->rg1TotLenSbDiffCqiCw1+mode31Info->rg1PmiBitLen)), 
                 TFU_MAX_CQI_BYTES);
      
      *leastSignBit = (U8)(*leastSignBit + (mode31Info->wideBCqiCw0 + mode31Info->totLenSbDiffCqiCw0 + \
               mode31Info->rg1WideBCqiCw1 + mode31Info->rg1TotLenSbDiffCqiCw1+mode31Info->rg1PmiBitLen));
   }
   else
   {
      *leastSignBit = sbOffst;
   }
   RETVOID;
}  /* rgSCHTomUtlDecodeRawAcqiPuschMode31 */

/**
 * @brief Function which decodes Raw ACQI Info and fills the DLCqiRpt.
 *
 * @details
 *
 *     Function: rgSCHTomUtlDecodeRawAcqiPuschMode22
 *
 *     Function which decodes Raw ACQI Info and fills the DLCqiRpt structure.
 *
 *     Invoked by: rgSCHTomUtlDecodeRawACqi
 *
 *     Processing Steps:
 *     - Depending on the Raw ACQI Info stored during Reception Request
 *        decode the Raw CQI Report 
 *     - Fill the DL CQI Report structure accordingly for the decoded Raw ACQI
 *           
 *  @param[in] RgSchUeCb       *ueCb
 *  @param[in] U8*             revArray
 *  @param[out] RgSchCqiRawPuschMode22     *mode22Info
 *  @param[in] TfuCqiPuschMode22     *psMode22
 *  @param[in] U8     ri
 *  @param[in] U32    numTxAnt
 *  @return  Void
 *      -# ROK 
 *      -# RFAILED 
 **/
#ifdef ANSI
PRIVATE Void rgSCHTomUtlDecodeRawAcqiPuschMode22
( 
 RgSchUeCb          *ueCb,
 U8*                  revArray,
 RgSchCqiRawPuschMode22   *mode22Info,
 TfuCqiPuschMode22   *psMode22,
 U8                  ri,
 U32                 numTxAnt,
 RgSchUeACqiCb       *acqiCb,
 U8                  *leastSignBit
)
#else
PRIVATE Void rgSCHTomUtlDecodeRawAcqiPuschMode22(ueCb,revArray,
         mode22Info,psMode22,ri,numTxAnt,acqiCb,leastSignBit)
RgSchUeCb          *ueCb;
U8*                  revArray;
RgSchCqiRawPuschMode22   *mode22Info;   
TfuCqiPuschMode22   *psMode22;   
U8                  ri;
U32                 numTxAnt;
RgSchUeACqiCb       *acqiCb;
U8                  *leastSignBit;
#endif
{
   U32 label =0;

   TRC2(rgSCHTomUtlDecodeRawAcqiPuschMode22);

   psMode22->numSubband = acqiCb->M;
   psMode22->wideBandCqi[0]=rgSCHUtlParse(revArray,
        *leastSignBit, (U8)(*leastSignBit+mode22Info->wideBCqiCw0), 
                   (U8)TFU_MAX_CQI_BYTES);
   psMode22->cqi[0]=rgSCHUtlParse(revArray,
        (U8)(*leastSignBit+mode22Info->wideBCqiCw0), 
        (U8)(*leastSignBit+(mode22Info->wideBCqiCw0 + 
            mode22Info->sBDiffCqiCw0)) , TFU_MAX_CQI_BYTES);
    psMode22->numSubband = acqiCb->N;
    if(ri ==1)
    {
        psMode22->wideBandCqi[1] = 0;
        psMode22->cqi[1] = 0;
        /* Extract and Store Position of M Selected SubBands*/
        label =   rgSCHUtlParse(revArray,\
         (U8)(*leastSignBit+(mode22Info->wideBCqiCw0 + 
                 mode22Info->sBDiffCqiCw0)),(U8)(*leastSignBit+
                 (mode22Info->wideBCqiCw0 + mode22Info->sBDiffCqiCw0 + 
                   mode22Info->posOfM)),TFU_MAX_CQI_BYTES); 
        /*Arg-5 has been not been casted to TfuSubbandInfo as this is  
                * defined only under MIMO */
/* Fix: tfu upgrade changes */
#ifndef TFU_UPGRADE
        rgSCHTomUtlGenIndices(label, acqiCb->M, 
                     acqiCb->N, acqiCb->k,psMode22->subbandArr);
#endif /* TFU_UPGRADE */
        psMode22->wideBandPmi =  rgSCHUtlParse(revArray,
                (U8)(*leastSignBit+(mode22Info->wideBCqiCw0 + 
                        mode22Info->sBDiffCqiCw0 + mode22Info->posOfM)),
                (U8)(*leastSignBit+(mode22Info->wideBCqiCw0 + 
                        mode22Info->sBDiffCqiCw0 + mode22Info->posOfM + 
                        mode22Info->r1PmiBitLen)),TFU_MAX_CQI_BYTES);
        psMode22->pmi = psMode22->wideBandPmi;

        *leastSignBit = (U8)(*leastSignBit+(mode22Info->wideBCqiCw0 + 
                        mode22Info->sBDiffCqiCw0 + mode22Info->posOfM + 
                        mode22Info->r1PmiBitLen));
    }
    else
    {
        psMode22->wideBandCqi[1] =  rgSCHUtlParse(revArray,
        (U8)(*leastSignBit+(mode22Info->wideBCqiCw0 + 
                mode22Info->sBDiffCqiCw0)),
        (U8)(*leastSignBit+(mode22Info->wideBCqiCw0 + 
                mode22Info->sBDiffCqiCw0 + mode22Info->rg1WideBCqiCw1)), 
                    TFU_MAX_CQI_BYTES);
        psMode22->cqi[1] = rgSCHUtlParse(revArray,
        (U8)(*leastSignBit+(mode22Info->wideBCqiCw0 + mode22Info->sBDiffCqiCw0 +
              mode22Info->rg1WideBCqiCw1)), (U8)(*leastSignBit+
              (mode22Info->wideBCqiCw0+mode22Info->sBDiffCqiCw0 +
               mode22Info->rg1WideBCqiCw1 + mode22Info->rg1SbDiffCqiCw1)), 
                          TFU_MAX_CQI_BYTES);
               /*Extract and Store Position of M Selected SubBands */
        label =  rgSCHUtlParse(revArray,\
                (U8)(*leastSignBit+(mode22Info->wideBCqiCw0 + 
                        mode22Info->sBDiffCqiCw0+mode22Info->rg1WideBCqiCw1 +
                                mode22Info->rg1SbDiffCqiCw1)), 
                (U8)(*leastSignBit+(mode22Info->wideBCqiCw0 + 
                        mode22Info->sBDiffCqiCw0+mode22Info->rg1WideBCqiCw1 +
                        mode22Info->rg1SbDiffCqiCw1+ mode22Info->posOfM)),
                        TFU_MAX_CQI_BYTES); 
        RGSCH_ARRAY_BOUND_CHECK(ueCb->cell->instIdx, psMode22->subbandArr, acqiCb->M);
        rgSCHTomUtlGenIndices(label, acqiCb->M, 
                     acqiCb->N, acqiCb->k,
                     (TfuSubbandInfo * )psMode22->subbandArr);
        psMode22->wideBandPmi = rgSCHUtlParse(revArray,
            (U8)(*leastSignBit+(mode22Info->wideBCqiCw0 + 
                mode22Info->sBDiffCqiCw0+mode22Info->rg1WideBCqiCw1 +
                mode22Info->rg1SbDiffCqiCw1+mode22Info->posOfM)),
            (U8)(*leastSignBit+(mode22Info->wideBCqiCw0 + 
                 mode22Info->sBDiffCqiCw0+
                 mode22Info->rg1WideBCqiCw1+mode22Info->rg1SbDiffCqiCw1 +
                 mode22Info->posOfM + mode22Info->rg1PmiBitLen)),
                 TFU_MAX_CQI_BYTES);
        psMode22->pmi = psMode22->wideBandPmi;

        *leastSignBit = (U8)(*leastSignBit+(mode22Info->wideBCqiCw0 + 
                 mode22Info->sBDiffCqiCw0+
                 mode22Info->rg1WideBCqiCw1+mode22Info->rg1SbDiffCqiCw1 +
                 mode22Info->posOfM + mode22Info->rg1PmiBitLen));
    }
    RETVOID;
}  /* rgSCHTomUtlDecodeRawAcqiPuschMode22 */

/**
 * @brief Function which decodes Raw ACQI Info and fills the DLCqiRpt.
 *
 * @details
 *
 *     Function: rgSCHTomUtlDecodeRawAcqiPuschMode12
 *
 *     Function which decodes Raw ACQI Info and fills the DLCqiRpt structure.
 *
 *     Invoked by: rgSCHTomUtlDecodeRawACqi
 *
 *     Processing Steps:
 *     - Depending on the Raw ACQI Info stored during Reception Request
 *        decode the Raw CQI Report 
 *     - Fill the DL CQI Report structure accordingly for the decoded Raw ACQI
 *           
 *  @param[in] RgSchUeCb       *ueCb
 *  @param[in] U8*             revArray
 *  @param[out] RgSchCqiRawPuschMode12     *mode12Info
 *  @param[in] TfuCqiPuschMode12     *psMode12
 *  @param[in] U8     ri
 *  @param[in] U32    numTxAnt
 *  @return  Void
 *      -# ROK 
 *      -# RFAILED 
 **/
#ifdef ANSI
PRIVATE Void rgSCHTomUtlDecodeRawAcqiPuschMode12
( 
 RgSchUeCb          *ueCb,
 U8*                  revArray,
 RgSchCqiRawPuschMode12   *mode12Info,
 TfuCqiPuschMode12   *psMode12,
 U8                  ri,
 U32                    numTxAnt,
 RgSchUeACqiCb          *acqiCb,
 U8                     *leastSignBit
)
#else
PRIVATE Void rgSCHTomUtlDecodeRawAcqiPuschMode12(ueCb,revArray,
         mode12Info,psMode12,ri,numTxAnt,acqiCb,leastSignBit)
RgSchUeCb          *ueCb;
U8*                  revArray;
RgSchCqiRawPuschMode12   *mode12Info;   
TfuCqiPuschMode12   *psMode12;   
U8                  ri;
U32                 numTxAnt;
RgSchUeACqiCb          *acqiCb;
U8                     *leastSignBit;
#endif
{
   U8 sbOffst;
   U8 bitLen = 0;

   TRC2(rgSCHTomUtlDecodeRawAcqiPuschMode12);
   
   if(ri ==1)
   {
      psMode12->cqiIdx[0] = rgSCHUtlParse(revArray,
            *leastSignBit,(U8)(*leastSignBit+mode12Info->wideBCqiCw0), 
                 TFU_MAX_CQI_BYTES);
      psMode12->cqiIdx[1] = 0;
      psMode12->numSubband = acqiCb->N;
      sbOffst = *leastSignBit+mode12Info->wideBCqiCw0;
      if(numTxAnt ==2)
      {
         bitLen = 2;
         RG_SCH_PARSE_MULTI_PMI(bitLen, mode12Info->r1TotalPmiBitLen,
                        psMode12, *acqiCb, revArray, sbOffst);
      }
      else if(numTxAnt ==4)
      {
          bitLen = 4;
          RG_SCH_PARSE_MULTI_PMI(bitLen, mode12Info->r1TotalPmiBitLen,
                        psMode12, *acqiCb, revArray, sbOffst);
      }                  
   }
   else
   {
      psMode12->cqiIdx[0] = rgSCHUtlParse(revArray,
            *leastSignBit,(U8)(*leastSignBit+mode12Info->wideBCqiCw0), 
                           TFU_MAX_CQI_BYTES);
      psMode12->cqiIdx[1] = rgSCHUtlParse(revArray,
            (U8)(*leastSignBit+mode12Info->wideBCqiCw0),(U8)(*leastSignBit+
                (mode12Info->wideBCqiCw0+mode12Info->rg1WideBCqiCw1)), 
                           TFU_MAX_CQI_BYTES);
      psMode12->numSubband = acqiCb->N;
      sbOffst = *leastSignBit+(mode12Info->wideBCqiCw0+
                     mode12Info->rg1WideBCqiCw1);
      if(numTxAnt ==2)
      {
          bitLen = 1;
          RG_SCH_PARSE_MULTI_PMI(bitLen, mode12Info->rg1TotalPmiBitLen,
                        psMode12, *acqiCb, revArray, sbOffst);
      }
      else if(numTxAnt ==4)
      {
          bitLen = 4;
          RG_SCH_PARSE_MULTI_PMI(bitLen, mode12Info->rg1TotalPmiBitLen,
                        psMode12, *acqiCb, revArray, sbOffst);
      }       
   }
   *leastSignBit = sbOffst; /* Update the least significant bit beyond
                               the bit already parsed */
   
   RETVOID;
}/*rgSCHTomUtlDecodeRawAcqiPuschMode12*/


/***********************************************************
 *
 *     Func : rgSCHTomUtlFetchPcqiBitSzPucchMode21
 *
 *
 *     Desc : Fetch the CQI/PMI bits for a UE with Mode 21 configured
 *
 *     Ret  : U8
 *            ROK - Success
 *
 *     Notes:
 *
 *     File :
 *
 **********************************************************/
#ifdef ANSI
PUBLIC U8 rgSCHTomUtlFetchPcqiBitSzPucchMode21
(
 RgSchUeCb    *ueCb,
 TfuCqiPucchMode21   *mode21Info,
 U8           numTxAnt,
 U8           *ri
)
#else
PUBLIC U8 rgSCHTomUtlFetchPcqiBitSzPucchMode21(ueCb, mode21Info, numTxAnt, ri)
   RgSchUeCb     *ueCb;
   TfuCqiPucchMode21   *mode21Info;
   U8            numTxAnt;
   U8            *ri;
#endif
{
   U8 pcqiSz;
   RgSchUePCqiCb *cqiCb = ueCb->nPCqiCb;
   TRC3(rgSCHTomUtlFetchPcqiBitSzPucchMode21);
   
   if(cqiCb->isWb)
   {
       mode21Info->u.cqi.isWideband = TRUE;
       if(numTxAnt == 2)
       {
          if (*ri ==1)
          {
              pcqiSz = 6;
              mode21Info->u.cqi.u.wideCqi.cqi = 4;
              mode21Info->u.cqi.u.wideCqi.diffCqi.pres = FALSE;
              mode21Info->u.cqi.u.wideCqi.pmi = 2;
          }
          else
          {
              pcqiSz = 8;
              mode21Info->u.cqi.u.wideCqi.cqi = 4;
              mode21Info->u.cqi.u.wideCqi.diffCqi.pres = TRUE;
              mode21Info->u.cqi.u.wideCqi.diffCqi.val  = 3;
              mode21Info->u.cqi.u.wideCqi.pmi = 1;
          }
       }
       else if(numTxAnt == 4)
       {
          if (*ri ==1)
          {
              pcqiSz = 8;
              mode21Info->u.cqi.u.wideCqi.cqi = 4;
              mode21Info->u.cqi.u.wideCqi.diffCqi.pres = FALSE;
              mode21Info->u.cqi.u.wideCqi.pmi = 4;
          }
          else
          {
              pcqiSz = 11;
              mode21Info->u.cqi.u.wideCqi.cqi = 4;
              mode21Info->u.cqi.u.wideCqi.diffCqi.pres  = TRUE;
              mode21Info->u.cqi.u.wideCqi.diffCqi.val =3;
              mode21Info->u.cqi.u.wideCqi.pmi = 4;
          }
       }
       else
       {
          /* This might be number of antenna case 1.
           * For mode 2-1 wideband case only antenna port 2 or 4 is supported.
           * So setting invalid value.*/
          pcqiSz = 0;
       }
    }
    else
    {
       mode21Info->u.cqi.isWideband = FALSE;
       if (*ri ==1)
       {
           pcqiSz = 4 + cqiCb->label;
           mode21Info->u.cqi.u.subCqi.cqi = 4;
           mode21Info->u.cqi.u.subCqi.diffCqi.pres = FALSE;
           mode21Info->u.cqi.u.subCqi.l = cqiCb->label;
       }
       else
       {
           pcqiSz = 7 + cqiCb->label;
           mode21Info->u.cqi.u.subCqi.cqi = 4;
           mode21Info->u.cqi.u.subCqi.diffCqi.pres = TRUE; 
           mode21Info->u.cqi.u.subCqi.diffCqi.val = 3;
           mode21Info->u.cqi.u.subCqi.l = cqiCb->label;
       }
    }
    
    RETVALUE(pcqiSz);
}/*rgSCHTomUtlFetchPcqiBitSzPucchMode21*/

#endif 


#ifdef LTE_TDD
/** @brief This function handles filling of HARQ feedback repetition
 * recption request for each subframe
 *
 * @details
 *
 *     Function: rgSCHTomUtlFillSfRepHqFdbk 
 *
 *         Processing steps:
 *
 * @param  [out] TfuRecpReqInfo  *recpReqInfo
 * @param  [in]  RgSchCellCb     *cell
 * @param  [out] RgSchErrInfo    *err
 * @param  [in]  RgSchDlSf       *dlSf
 * @param  [in]  U8              noFdbks
 * @param  [in]  CmMemListCp     *memCp
 * @param  [in]  U8              elemIdx
 * @param  [in]  RgSchDlSf       *nxtDlsf
 *  @return  S16
 *      -# ROK 
 *      -# RFAILED 
 */
#ifdef TFU_UPGRADE
#ifdef ANSI
PRIVATE S16 rgSCHTomUtlFillSfRepHqFdbk
(
 TfuRecpReqInfo          *recpReqInfo,
 RgSchCellCb             *cellCb,
 RgSchErrInfo            *err,
 RgSchDlSf               *dlSf,
 U8                      noFdbks,
 CmMemListCp             *memCp,
 U8                      elemIdx,
 RgSchDlSf               *nxtDlsf,
 U16                     validIdx
 )
#else
PRIVATE S16 rgSCHTomUtlFillSfRepHqFdbk (recpReqInfo, cellCb, err, dlSf, 
noFdbks, memCp, elemIdx, nxtDlsf, validIdx)
   TfuRecpReqInfo          *recpReqInfo;
   RgSchCellCb             *cellCb;
   RgSchErrInfo            *err;
   RgSchDlSf               *dlSf;
   U8                      noFdbks;
   CmMemListCp             *memCp;
   U8                      elemIdx;
   RgSchDlSf               *nxtDlsf;
   U16                     validIdx; 
#endif
#else
#ifdef ANSI
PRIVATE S16 rgSCHTomUtlFillSfRepHqFdbk
(
TfuRecpReqInfo          *recpReqInfo,
RgSchCellCb             *cellCb,
RgSchErrInfo            *err,
RgSchDlSf               *dlSf,
U8                      noFdbks,
CmMemListCp             *memCp,
U8                      elemIdx,
RgSchDlSf               *nxtDlsf
)
#else
PRIVATE S16 rgSCHTomUtlFillSfRepHqFdbk (recpReqInfo, cellCb, err, dlSf, 
noFdbks, memCp, elemIdx, nxtDlsf)
   TfuRecpReqInfo          *recpReqInfo;
   RgSchCellCb             *cellCb;
   RgSchErrInfo            *err;
   RgSchDlSf               *dlSf;
   U8                      noFdbks;
   CmMemListCp             *memCp;
   U8                      elemIdx;
   RgSchDlSf               *nxtDlsf;
#endif
#endif 
{
   RgSchDlHqProcCb         *hqCb;
   CmLList                 *node;
   S16                     ret;
   RgSchUeCb               *ueCb;
   TfuUeRecpReqInfo        *pucchRecpInfo;
#ifdef TFU_UPGRADE
   TfuUePucchHqRecpInfo    *hqRecpReq;  
#endif
   RgSchDlHqTbCb           *tbCb;
   RgSchDlHqProcCb         *prvHqCb = NULLP;

   TRC2(rgSCHTomUtlFillSfRepHqFdbk)

   node =  dlSf->ackNakRepQ.first;
   while (node)
   {
      tbCb = (RgSchDlHqTbCb *)(node->node);
      hqCb = tbCb->hqP;
      ueCb = hqCb->hqE->ue;

      if (--tbCb->fbkRecpRepCntr)
      {            
         /* Add to next subfarme */
         /* Add this hqCb to the next dlSf's ackNakRepQ */
         cmLListAdd2Tail (&(nxtDlsf->ackNakRepQ), 
               &(tbCb->anRepLnk[tbCb->fbkRecpRepCntr]));
         tbCb->anRepLnk[tbCb->fbkRecpRepCntr].node = (PTR)tbCb;
         tbCb->crntSubfrm[tbCb->fbkRecpRepCntr] = nxtDlsf;
      }

#ifdef TFU_UPGRADE
      if (hqCb->tbCnt) 
      {
         hqCb->tbCnt--;
         /* Go to the next node */
         node = node->next;
         continue;
      }
#endif
      if ((hqCb->hqE->ue != NULLP) &&
            (hqCb->hqE->ue->measGapCb.isMeasuring != TRUE)
            && (hqCb != prvHqCb)
         )
      {
         /* We need to add the recp request to be sent on the pucchANRep
          * value.
          */
         ret = rgSCHUtlGetEventMem((Ptr *)&pucchRecpInfo,
                     sizeof(TfuUeRecpReqInfo), &(recpReqInfo->memCp));
         if (ret != ROK)            
         {
            RLOG_ARG1(L_ERROR,DBG_CELLID,cellCb->cellId,"Unable to"
               "Allocate TfuUeRecpReqInfo for RNTI:%d ", ueCb->ueId);
            err->errCause = RGSCHERR_TOM_MEM_EXHAUST;
            RETVALUE(ret);
         }
         pucchRecpInfo->rnti    =  ueCb->ueId;
#ifndef TFU_UPGRADE
         pucchRecpInfo->t.pucchRecpReq.type = TFU_UCI_HARQ;
#else
         pucchRecpInfo->type = TFU_RECP_REQ_PUCCH;
#endif

         /* FOR repetition Feedback shall come on n1PucchAnRep Configured per
          * UE.
          */
#ifndef TFU_UPGRADE
         pucchRecpInfo->t.pucchRecpReq.hqType = TFU_HQ_RECP_REQ_N1PUCCH;
         pucchRecpInfo->t.pucchRecpReq.t.n1Pucch = ueCb->ackNakRepCb.pucchRes;
#else
         pucchRecpInfo->t.pucchRecpReq.uciInfo = TFU_PUCCH_HARQ;
         hqRecpReq = &(pucchRecpInfo->t.pucchRecpReq.hqInfo);
         /* ACK NACK rep works only in bundling mode . */
         hqRecpReq->hqFdbkMode = (TfuAckNackMode)RGR_TDD_ACKNACK_MODE_BUNDL;
         if ((hqCb->hqPSfLnk.node != NULLP) && 
               (hqCb->hqPSfLnk.node != NULLP))
         {

            hqRecpReq->hqSz = 2;
         }
         else
         {
            hqRecpReq->hqSz = 1;
         }
         hqRecpReq->pucchResCnt = 1; 
         hqRecpReq->hqRes[0] = ueCb->ackNakRepCb.pucchRes; 
#endif
         cmLListAdd2Tail(&recpReqInfo->ueRecpReqLst, &(pucchRecpInfo->lnk));
         pucchRecpInfo->lnk.node = (PTR)pucchRecpInfo;
      }
      /* In a given dlSf, if there is 2 TBs context 
       * stored for a given harq, then they are added
       * adjacent to each other in the subframe. To avoid
       * adding duplicate recpnInfo for each TB, store this
       * hqCb in prvHqCb. If nextHqCb is same as prvHqCb then
       * do not add reception req info.*/
      prvHqCb = hqCb;
#ifdef TFU_UPGRADE
      RGSCH_NULL_CHECK(cellCb->instIdx, hqCb->hqE->ue);
      rgSCHTomUtlMoveNxtOccasion(cellCb, hqCb->hqE->ue, validIdx);
#endif 
      /* Go to the next node */
      node = node->next;
   }

   RETVALUE(ROK);
}

/** @brief This function handles filling of HARQ feedback recption request
 * for each subframe 
 *
 * @details 
 *
 *     Function: rgSCHTomUtlFillSfHqFdbkInfo
 *
 *         Processing steps:
 *
 * @param  [out] TfuRecpReqInfo  *recpReqInfo
 * @param  [in]  RgSchCellCb     *cell
 * @param  [out] RgSchErrInfo    *err
 * @param  [in]  RgSchDlSf       *dlSf
 * @param  [in]  U8              noFdbks
 * @param  [in]  CmMemListCp     *memCp
 * @param  [in]  U8              elemIdx
 * @param  [in]  RgSchDlSf       *nxtDlsf
*  @param  [in]  U16             validIdx; 
 *  @return  S16
 *      -# ROK 
 *      -# RFAILED 
 */
#ifdef TFU_UPGRADE
#ifdef ANSI
PRIVATE S16 rgSCHTomUtlFillSfHqFdbkInfo
(
 TfuRecpReqInfo          *recpReqInfo,
 RgSchCellCb             *cellCb,
 RgSchErrInfo            *err,
 RgSchDlSf               *dlSf,
 U8                      noFdbks,
 CmMemListCp             *memCp,
 U8                      elemIdx,
 RgSchDlSf               *nxtDlsf,
 U16                     validIdx,
 RgSchDlHqProcCb         *hqCb,
 RgSchUePucchRecpInfo    *pucchInfo,
 Bool                    alloc,
 RgSchDlHqProcCb         *prvHqCb
 )
#else
PRIVATE S16 rgSCHTomUtlFillSfHqFdbkInfo (recpReqInfo, cellCb, err, dlSf, 
      noFdbks, memCp, elemIdx, nxtDlsf, validIdx, hqCb, pucchInfo, alloc, prvHqCb)
TfuRecpReqInfo          *recpReqInfo;
RgSchCellCb             *cellCb;
RgSchErrInfo            *err;
RgSchDlSf               *dlSf;
U8                      noFdbks;
CmMemListCp             *memCp;
U8                      elemIdx;
RgSchDlSf               *nxtDlsf;
U16                     validIdx; 
RgSchDlHqProcCb         *hqCb;
RgSchUePucchRecpInfo    *pucchInfo;
Bool                    alloc;
RgSchDlHqProcCb         *prvHqCb;
#endif
#else
#ifdef ANSI
PRIVATE S16 rgSCHTomUtlFillSfHqFdbkInfo
(
 TfuRecpReqInfo          *recpReqInfo,
 RgSchCellCb             *cellCb,
 RgSchErrInfo            *err,
 RgSchDlSf               *dlSf,
 U8                      noFdbks,
 CmMemListCp             *memCp,
 U8                      elemIdx,
 RgSchDlSf               *nxtDlsf,
 RgSchDlHqProcCb         *hqCb,
 RgSchUePucchRecpInfo    *pucchInfo,
 Bool                    alloc,
 RgSchDlHqProcCb         *prvHqCb
 )
#else
PRIVATE S16 rgSCHTomUtlFillSfHqFdbkInfo (recpReqInfo, cellCb, err, dlSf, 
      noFdbks, memCp, elemIdx, nxtDlsf, hqCb, pucchInfo, alloc, prvHqCb)
TfuRecpReqInfo          *recpReqInfo;
RgSchCellCb             *cellCb;
RgSchErrInfo            *err;
RgSchDlSf               *dlSf;
U8                      noFdbks;
CmMemListCp             *memCp;
U8                      elemIdx;
RgSchDlSf               *nxtDlsf;
RgSchDlHqProcCb         *hqCb;
RgSchUePucchRecpInfo    *pucchInfo;
Bool                    alloc;
RgSchDlHqProcCb         *prvHqCb;
#endif
#endif
{
   CmLteTimingInfo         futTime;
   S16                     ret;
   RgSchUeCb               *ueCb = hqCb->hqE->ue;
#ifndef TFU_UPGRADE
   RgSchTddANInfo          *anInfo;
#else
#endif
   RgrTddAckNackMode       ackNackMode;
   RgSchDlHqTbCb           *tbCb;
   CmLteRnti               rnti;
   U8                      hqSz = 0;
   U32                     idx = 0;

   TRC2(rgSCHTomUtlFillSfHqFdbkInfo)

   RG_SCH_ADD_TO_CRNT_TIME(cellCb->crntTime, futTime, TFU_RECPREQ_DLDELTA);


   for (idx = 0 ;idx < 2; idx++)
   {
      if (HQ_TB_WAITING == hqCb->tbInfo[idx].state)
      {

         tbCb = &hqCb->tbInfo[idx];
         if (ueCb)
         {
            rnti = ueCb->ueId;
            ackNackMode = ueCb->dl.ackNackMode;
#ifndef TFU_UPGRADE
            if(ackNackMode == RGR_TDD_ACKNACK_MODE_BUNDL)
            {
               anInfo = rgSCHUtlGetUeANFdbkInfo(ueCb, &futTime);
               /* Only the last scheduled TB for the UE is for HARQ
                * ACK/NACK reception in Bundling case */
               if((anInfo == NULLP) || 
                     (anInfo->latestMIdx != dlSf->dlFdbkInfo.m))
               {
                  RETVALUE(ROK);
               }
            }
            else
            {
               /* Get the TFU reception request pointer, if present */
               cmHashListFind(&cellCb->ueTfuPendLst, (U8*) &ueCb->ueId,
                     sizeof(ueCb->ueId), 0, (PTR *) &pucchInfo);
            }
#else
            /* For upgrade we shall use the existing logic of pending list. */
            cmHashListFind(&cellCb->ueTfuPendLst, (U8*) &ueCb->ueId,
                  sizeof(ueCb->ueId), 0, (PTR *) &pucchInfo);
#endif
         }
         else if(hqCb->hqE->raCb != NULLP)
         {
            /* For RACH it is set to Bundling */
            ackNackMode = RGR_TDD_ACKNACK_MODE_BUNDL;
            rnti = hqCb->hqE->raCb->tmpCrnti;
         }
         else
         {
            RETVALUE(ROK);
         }

         /* Do not proceed if PUSCH
            reception req is already filled*/
#ifdef TFU_UPGRADE
         if (hqCb->tbCnt) 
         {
            hqCb->tbCnt--;
            /* Go to the next node */
            continue;
         }
#endif
         if(((ueCb == NULLP) || (ueCb->measGapCb.isMeasuring != TRUE))
               &&(hqCb != prvHqCb)
           )
         {
            TknU16       n1PucchTkn = {FALSE, 0};
            RgSchPdcch   *pdcch;
            U8            tbIndx;
            pdcch = tbCb->hqP->pdcch;
#ifdef LTEMAC_SPS
            n1PucchTkn = hqCb->spsN1PucchRes;
#endif
            for (tbIndx = 0; tbIndx < TFU_MAX_TB; tbIndx++)
            {
               if (hqCb->tbInfo[tbIndx].state == HQ_TB_WAITING && 
                     (RGSCH_TIMEINFO_SAME(hqCb->tbInfo[tbIndx].fdbkTime,
                                          recpReqInfo->timingInfo)))
               {
                  hqSz++;
                  hqCb->tbInfo[tbIndx].pucchFdbkIdx = hqCb->ulDai;
               }
            }
            ret = rgSCHTomUtlFillSfHqFdbkForOneUe(hqCb,recpReqInfo, cellCb, err, dlSf, noFdbks,
                  memCp, elemIdx, nxtDlsf, rnti, ackNackMode, &pucchInfo, pdcch,
                  n1PucchTkn, &alloc, hqSz);
            if (ret != ROK)
            {
               RETVALUE(ret);
            }
            /* TODO:: In case of F1BCS and CSI in same subframe
             * UE shall drop the CSI if there was at least one 
             * PDSCH transmission in any of the DL subframe
             * mapping to this UL subframe
             * */
#ifdef TFU_UPGRADE
            rgSCHTomUtlFillCqiSrSrsWithHq(cellCb,recpReqInfo, hqCb->hqE->ue, 
                  pucchInfo->pucchRecpInfo, validIdx,FALSE);  
#ifdef LTE_ADV
            if((hqCb->hqE->ue) &&
               (hqCb->hqE->ue->uciFrmtTyp == RG_SCH_UCI_FORMAT1B_CS))
            {

               if(RG_SCH_IS_CELL_SEC(hqCb->hqE->ue,hqCb->hqE->cell))
               {
                  switch(pucchInfo->pucchRecpInfo->t.pucchRecpReq.uciInfo)
                  {
                     case TFU_PUCCH_HARQ_SR_CQI:
                        pucchInfo->pucchRecpInfo->t.pucchRecpReq.uciInfo = TFU_PUCCH_HARQ_SR;
                        RG_SCH_DECR_CQIRI_INDEX(ueCb->cqiRiWritIdx);
                        break;
                     case TFU_PUCCH_HARQ_CQI:
                        pucchInfo->pucchRecpInfo->t.pucchRecpReq.uciInfo = TFU_PUCCH_HARQ;
                        RG_SCH_DECR_CQIRI_INDEX(ueCb->cqiRiWritIdx);
                        break;
                     case TFU_PUCCH_HARQ_SR_CQI_SRS:
                        pucchInfo->pucchRecpInfo->t.pucchRecpReq.uciInfo = TFU_PUCCH_HARQ_SR_SRS;
                        RG_SCH_DECR_CQIRI_INDEX(ueCb->cqiRiWritIdx);
                        break;
                     case TFU_PUCCH_HARQ_SR_SRS:
                        pucchInfo->pucchRecpInfo->t.pucchRecpReq.uciInfo = TFU_PUCCH_HARQ_SR;
                        break;
                     case TFU_PUCCH_HARQ_SRS:
                        pucchInfo->pucchRecpInfo->t.pucchRecpReq.uciInfo = TFU_PUCCH_HARQ;
                        break;
                     default:
                        break;
                  }
               }
            }
#endif

#endif 

            /* TODO antz - pushing the following code (under TFU_UPGRADE)
             * into the above function (...ForOneUe) did not work (caused
             * two additional TCs to fail). Don't know why. If this
             * is done later, make sure that the code branch
             * for relPdcch (later in this func) is also modified appropriately.
             */
            /* Now add to the recp request or pending list */
            //if((elemIdx != (noFdbks - 1)))
            {
               cmHashListInsert(&cellCb->ueTfuPendLst, (PTR) pucchInfo,
                     (U8 *)&rnti ,(U16) sizeof(CmLteRnti));
               alloc = FALSE;
            }

         } /* If measuring */
         /* Go to the next node */
         if ((tbCb->fbkRecpRepCntr) && (--tbCb->fbkRecpRepCntr))
         {
            /* Add to next subfarme */
            /* Add this hqCb to the next dlSf's ackNakRepQ */
            cmLListAdd2Tail (&(nxtDlsf->ackNakRepQ), 
                  &(tbCb->anRepLnk[tbCb->fbkRecpRepCntr]));
            tbCb->anRepLnk[tbCb->fbkRecpRepCntr].node = (PTR)tbCb;
            tbCb->crntSubfrm[tbCb->fbkRecpRepCntr] = nxtDlsf;
         }
         /* In a given dlSf, if there is 2 TBs context 
          * stored for a given harq, then they are added
          * adjacent to each other in the subframe. To avoid
          * adding duplicate recpnInfo for each TB, store this
          * hqCb in prvHqCb. If nextHqCb is same as prvHqCb then
          * do not add reception req info.*/
         prvHqCb = hqCb;
      }
   }
   RETVALUE(ROK);
}

/** @brief This function handles filling of HARQ feedback recption request
 * for each subframe 
 *
 * @details
 *
 *     Function: rgSCHTomUtlFillSfHqFdbk 
 *
 *         Processing steps:
 *
 * @param  [out] TfuRecpReqInfo  *recpReqInfo
 * @param  [in]  RgSchCellCb     *cell
 * @param  [out] RgSchErrInfo    *err
 * @param  [in]  RgSchDlSf       *dlSf
 * @param  [in]  U8              noFdbks
 * @param  [in]  CmMemListCp     *memCp
 * @param  [in]  U8              elemIdx
 * @param  [in]  RgSchDlSf       *nxtDlsf
*  @param  [in]  U16             validIdx; 
 *  @return  S16
 *      -# ROK 
 *      -# RFAILED 
 */
#ifdef TFU_UPGRADE
#ifdef ANSI
PRIVATE S16 rgSCHTomUtlFillSfHqFdbk
(
 TfuRecpReqInfo          *recpReqInfo,
 RgSchCellCb             *cellCb,
 RgSchErrInfo            *err,
 RgSchDlSf               *dlSf,
 U8                      noFdbks,
 CmMemListCp             *memCp,
 U8                      elemIdx,
 RgSchDlSf               *nxtDlsf,
 U16                     validIdx
 )
#else
PRIVATE S16 rgSCHTomUtlFillSfHqFdbk (recpReqInfo, cellCb, err, dlSf, 
      noFdbks, memCp, elemIdx, nxtDlsf, validIdx)
TfuRecpReqInfo          *recpReqInfo;
RgSchCellCb             *cellCb;
RgSchErrInfo            *err;
RgSchDlSf               *dlSf;
U8                      noFdbks;
CmMemListCp             *memCp;
U8                      elemIdx;
RgSchDlSf               *nxtDlsf;
U16                     validIdx; 
#endif
#else
#ifdef ANSI
PRIVATE S16 rgSCHTomUtlFillSfHqFdbk
(
 TfuRecpReqInfo          *recpReqInfo,
 RgSchCellCb             *cellCb,
 RgSchErrInfo            *err,
 RgSchDlSf               *dlSf,
 U8                      noFdbks,
 CmMemListCp             *memCp,
 U8                      elemIdx,
 RgSchDlSf               *nxtDlsf
 )
#else
PRIVATE S16 rgSCHTomUtlFillSfHqFdbk (recpReqInfo, cellCb, err, dlSf, 
      noFdbks, memCp, elemIdx, nxtDlsf)
TfuRecpReqInfo          *recpReqInfo;
RgSchCellCb             *cellCb;
RgSchErrInfo            *err;
RgSchDlSf               *dlSf;
U8                      noFdbks;
CmMemListCp             *memCp;
U8                      elemIdx;
RgSchDlSf               *nxtDlsf;
#endif
#endif
{
   CmLList                 *node;
   CmLList                 *hqPNode;
   RgSchDlHqProcCb         *hqCb;
   CmLteTimingInfo         futTime;
   S16                     ret;
   RgSchUeCb               *ueCb;
#ifndef TFU_UPGRADE
   RgSchTddANInfo          *anInfo;
#else
   RgSchUeCb               *ue;
#endif
   RgSchUePucchRecpInfo    *pucchInfo;
   Bool                    alloc = FALSE;
   RgSchDlHqProcCb         *prvHqCb = NULLP;
   U8                      hqSz = 0;

   TRC2(rgSCHTomUtlFillSfHqFdbk)
/* ACC-TDD vrr*/
   RG_SCH_ADD_TO_CRNT_TIME(cellCb->crntTime, futTime, TFU_RECPREQ_DLDELTA)
   /* Init with NULL for the case of zero TBs for this DLSF*/
   pucchInfo = NULLP;  


   node =  dlSf->ueLst.first;
   while (node)
   {
      ueCb = (RgSchUeCb *)(node->node);
      node = node->next;

      if(ueCb->dl.dlSfHqInfo[dlSf->dlIdx].isPuschHarqRecpPres == TRUE)
      {/* This UE is already considered for PUSCH
          Ignore for PUCCH */
         continue;
      }

      /* ccpu00132345*/
      pucchInfo = NULLP;
      hqPNode = ueCb->dl.dlSfHqInfo[dlSf->dlIdx].hqPLst.first;
      rgSchSetFormatType(recpReqInfo->timingInfo,ueCb, dlSf);
      while (hqPNode)
      {
         hqCb = (RgSchDlHqProcCb *)hqPNode->node;
         hqPNode = hqPNode->next;
         hqSz = 0;      

#ifdef TFU_UPGRADE
         rgSCHTomUtlFillSfHqFdbkInfo (recpReqInfo, cellCb, err, dlSf, 
               noFdbks, memCp, elemIdx, nxtDlsf, validIdx, hqCb, pucchInfo, alloc, prvHqCb);
#else
         rgSCHTomUtlFillSfHqFdbkInfo (recpReqInfo, cellCb, err, dlSf, 
               noFdbks, memCp, elemIdx, nxtDlsf, hqCb, pucchInfo, alloc, prvHqCb);
#endif
      }
   } /* end of while */

   if (dlSf->msg4HqPLst.count != 0)
   {
      prvHqCb = NULLP;
      node =  dlSf->msg4HqPLst.first;
      while (node)
      {
         hqCb = (RgSchDlHqProcCb*)(node->node);
         node = node->next;

         pucchInfo = NULLP;

#ifdef TFU_UPGRADE
         rgSCHTomUtlFillSfHqFdbkInfo (recpReqInfo, cellCb, err, dlSf, 
               noFdbks, memCp, elemIdx, nxtDlsf, validIdx, hqCb, pucchInfo, alloc, prvHqCb);
#else
         rgSCHTomUtlFillSfHqFdbkInfo (recpReqInfo, cellCb, err, dlSf, 
               noFdbks, memCp, elemIdx, nxtDlsf, hqCb, pucchInfo, alloc, prvHqCb);
#endif
      }
   }

#ifdef LTEMAC_SPS
   if (dlSf->relPdcch)
   {
      TknU16       n1PucchTkn = {FALSE, 0};
      pucchInfo = NULLP;
#ifdef TFU_UPGRADE
      ue = rgSCHDbmGetUeCb (cellCb, dlSf->relPdcchInfo.crnti);
      if(ue->dl.dlSfHqInfo[dlSf->dlIdx].isPuschHarqRecpPres == TRUE)
      {/* This UE is already considered for PUSCH
          Ignore for PUCCH */
         RETVALUE(ROK);
      }
#endif
      cmHashListFind(&cellCb->ueTfuPendLst, (U8*) &dlSf->relPdcchInfo.crnti,
            sizeof(dlSf->relPdcchInfo.crnti), 0, (PTR *) &pucchInfo);
      
      ret = rgSCHTomUtlFillSfHqFdbkForOneUe(NULLP,recpReqInfo, cellCb, err, dlSf, noFdbks,
            memCp, elemIdx, nxtDlsf, dlSf->relPdcchInfo.crnti,
            dlSf->relPdcchInfo.ackNackMode, &pucchInfo, dlSf->relPdcch,
            n1PucchTkn, &alloc, hqSz);
      if (ret != ROK)
      {
         RETVALUE(ret);
      }
#ifdef TFU_UPGRADE
      rgSCHTomUtlFillCqiSrSrsWithHq(cellCb,recpReqInfo, ue, 
            pucchInfo->pucchRecpInfo, validIdx,FALSE); 
#endif 
      /* Now add to the recp request or pending list */
#ifdef TFU_UPGRADE
      if((elemIdx != (noFdbks - 1)))
      {
         cmHashListInsert(&cellCb->ueTfuPendLst, (PTR) pucchInfo,
               (U8 *)&dlSf->relPdcchInfo.crnti ,(U16) sizeof(CmLteRnti));
         alloc = FALSE;
      }
      else
      {
         pucchInfo->pucchRecpInfo->t.pucchRecpReq.uciInfo = TFU_PUCCH_HARQ;
         cmLListAdd2Tail(&recpReqInfo->ueRecpReqLst, 
               &(pucchInfo->pucchRecpInfo->lnk));
         pucchInfo->pucchRecpInfo->lnk.node = 
            (PTR)pucchInfo->pucchRecpInfo;
         /* Delete the entry after addition to the list */
         cmHashListDelete(&cellCb->ueTfuPendLst, (PTR) pucchInfo);
      }
#endif
   }
#endif /* LTEMAC_SPS */
   RETVALUE(ROK);
}

#ifdef LTE_ADV
/** @brief This function calculates the pucch resource idx 
 *         that is to be filled in harq reception request
 *
 * @details 
 *
 *     Function: rgSCHTomUtlGethqRes
 *
 *         Processing steps:
 *          -Calculate the pucch resource idx 
 *           Harq Reception Request for Format 1B with
 *           Channel Selection
 *
 * @param  [in] U8                      noFdbks
 * @param  [in] RgSchDlSf               *dlSf
 * @param  [in] RgSchPdcch              *pdcch
 * @param  [in] RgSchCellCb             *cellCb
 * @param  [out]U16                     *hqRes
 * @return void
 */
#ifdef ANSI
PRIVATE Void rgSCHTomUtlGethqRes
(
U8                      noFdbks,
RgSchDlSf               *dlSf,
RgSchPdcch              *pdcch,
RgSchCellCb             *cellCb,
U16                     *hqRes
)
#else
PRIVATE Void rgSCHTomUtlGethqRes(noFdbks,dlSf,pdcch,cellCb,hqRes)
U8                      noFdbks;
RgSchDlSf               *dlSf;
RgSchPdcch              *pdcch;
RgSchCellCb             *cellCb;
U16                     *hqRes;
#endif
{
   U8                      M;
   U8                      P;
   U8                      m;
   U8                      nP;
   U8                      nPlusOne;
   U8                      nCce;
   
   M = noFdbks;
   m = dlSf->dlFdbkInfo.m;
   nCce = pdcch->nCce;
   P = rgSCHCmnGetPValFrmCCE(cellCb, nCce);
   nP = cellCb->rgSchTddNpValTbl[P];
   nPlusOne = cellCb->rgSchTddNpValTbl[P + 1];
   *hqRes = (M - m - 1)* nP + (m * nPlusOne) + pdcch->nCce + 
      cellCb->pucchCfg.n1PucchAn;

   RETVOID;
}

/** @brief This function fills the harq reception request for
 *         TDD in case of Fomat 1B with CS for M=1
 *
 * @details 
 *
 *     Function: rgSCHTomUtlFillSfHqFdbkForFrmt1BCSForM1
 *
 *         Processing steps:
 *          -Fill Harq Reception Request for Format 1B with
 *           Channel Selection
 *
 * @param  [in] RgSchDlHqProcCb         *hqCb
 * @param  [in] TfuUePucchRecpReq       *hqRecpReq
 * @param  [in] U8                      noFdbks
 * @param  [in] RgSchDlSf               *dlSf
 * @param  [in] RgSchPdcch              *pdcch
 * @param  [in] RgSchCellCb             *cellCb
 * @return void
 */
#ifdef ANSI
PRIVATE Void rgSCHTomUtlFillSfHqFdbkForFrmt1BCSForM1
(
 RgSchDlHqProcCb     *hqCb,
 TfuUePucchRecpReq   *hqRecpReq,
 U8                  noFdbks,
 RgSchDlSf           *dlSf,
 RgSchPdcch          *pdcch,
 RgSchCellCb         *cellCb
)
#else
PRIVATE Void rgSCHTomUtlFillSfHqFdbkForFrmt1BCSForM1(hqCb, hqRecpReq, 
      noFdbks,dlSf,pdcch,cellCb)
 RgSchDlHqProcCb     *hqCb;
 TfuUePucchRecpReq   *hqRecpReq;
 U8                  noFdbks;
 RgSchDlSf           *dlSf;
 RgSchPdcch          *pdcch;
 RgSchCellCb         *cellCb;
#endif
{
   RgSchUeCb           *ue = NULLP;
   Bool                 isCellSec = FALSE;
   U16                  hqRes;

   /*ccpu00147920: UeCb is NULL for SPS activation*/
   if(pdcch && pdcch->ue)
   {/* SPS Release pdcch or dynamic data */
      ue = pdcch->ue;
   }else
   {/* SPS occasion */
#ifdef ERRCLS_KW
      if(hqCb == NULLP)
      {
         /* This is not supposed to happen
          * Error case. hqCB has to be ter
          * when pdcch is present . Adding 
          * if check bcs of kwork*/
         RETVOID;
      }
#endif
      ue = hqCb->hqE->ue;
   }

   if((hqCb != NULLP) && 
      (RG_SCH_IS_CELL_SEC(ue,hqCb->hqE->cell)))
   {
      isCellSec = TRUE;
   }

   switch(ue->f1bCsAVal)
   {
      case RG_SCH_A_VAL_2:
         /* harq(0) is primary harq(1) is secondary) */
         if(isCellSec)
         {
            hqRecpReq->hqInfo.hqRes[1] = ue->n1PucchF1bResCb.
               cw1N1Res[hqCb->tpc].n1PucchIdx;
         }
         else/* primary cell */
         {
#ifdef LTEMAC_SPS
            /* hqCb will be null in case of sps rel pdcch */
            if ((hqCb) && hqCb->spsN1PucchRes.pres)
            {/* SPS occasion or dyn sched*/
               hqRecpReq->hqInfo.hqRes[0] = hqCb->spsN1PucchRes.val;
            }
            else
#endif /* LTEMAC_SPS */
            {/* dyn data or sps release */
#ifdef ERRCLS_KW
               if(pdcch == NULLP)
               {
                  /* This is not supposed to happen
                   * Error case. hqCB has to be ter
                   * when pdcch is present . Adding 
                   * if check bcs of kwork*/
                  RETVOID;
               }
#endif
 
               rgSCHTomUtlGethqRes(noFdbks,dlSf,pdcch,cellCb,&hqRes);
               hqRecpReq->hqInfo.hqRes[0] = hqRes;
            }
         }
         break;
      case RG_SCH_A_VAL_3:
         {
            /* Serving cell in mimo mode should be
             * in 0 and 1 and the serving cell in siso
             * mode should be in 2 indices */
            if(isCellSec)
            {
               U8 servCellIdx = rgSchUtlGetServCellIdx(hqCb->hqE->cell->instIdx,
                     hqCb->hqE->cell->cellId,
                     hqCb->hqE->ue);

               if(rgSCHUtlGetMaxTbSupp(ue->cellInfo[servCellIdx]->txMode.txModeEnum) > 1)
               {/* Sec cell is in mimo mode, use 0 and 1 */
                  hqRecpReq->hqInfo.hqRes[0] = 
                     ue->n1PucchF1bResCb.cw1N1Res[hqCb->tpc].n1PucchIdx;
                  hqRecpReq->hqInfo.hqRes[1] = 
                        ue->n1PucchF1bResCb.cw2N1Res[hqCb->tpc].n1PucchIdx;
               }
               else
               {/* Sec cell is in siso mode, use 2 */
                  hqRecpReq->hqInfo.hqRes[2] = 
                     ue->n1PucchF1bResCb.cw1N1Res[hqCb->tpc].n1PucchIdx;
               }   
            }
            else
            {/* primary cell hq */

               if(rgSCHUtlGetMaxTbSupp(ue->mimoInfo.txMode) > 1)
               {/* prim cell is in mimo mode, use 0 and 1 */
#ifdef LTEMAC_SPS
                  if (hqCb && hqCb->spsN1PucchRes.pres)
                  {/* Not sps release */
                     hqRecpReq->hqInfo.hqRes[0] = hqCb->spsN1PucchRes.val;
                  }
                  else
#endif /* LTEMAC_SPS */
                  {/* sps rel or dyn */
#ifdef ERRCLS_KW
                     if(pdcch == NULLP)
                     {
                        /* This is not supposed to happen
                         * Error case. hqCB has to be ter
                         * when pdcch is present . Adding 
                         * if check bcs of kwork*/
                        RETVOID;
                     }
#endif

                     rgSCHTomUtlGethqRes(noFdbks,dlSf,pdcch,cellCb,&hqRes);
                     hqRecpReq->hqInfo.hqRes[0] = hqRes;
                     hqRecpReq->hqInfo.hqRes[1] = hqRes + 1;
                  }
               }
               else
               {/* prim cell is in siso mode use 2 */
#ifdef LTEMAC_SPS
                  /* Consider sps occasions */
                  if (hqCb && hqCb->spsN1PucchRes.pres)
                  {/* Not sps release */
                     hqRecpReq->hqInfo.hqRes[2] = hqCb->spsN1PucchRes.val;
                  }
                  else
#endif /* LTEMAC_SPS */
                  {
#ifdef ERRCLS_KW
                     if(pdcch == NULLP)
                     {
                        /* This is not supposed to happen
                         * Error case. hqCB has to be ter
                         * when pdcch is present . Adding 
                         * if check bcs of kwork*/
                        RETVOID;
                     }
#endif

                     rgSCHTomUtlGethqRes(noFdbks,dlSf,pdcch,cellCb,&hqRes);
                     hqRecpReq->hqInfo.hqRes[2] = hqRes;
                  }
               }
            }
         }
         break;
      case RG_SCH_A_VAL_4:
         {/* Both the serv cells are in mimo mode */
            if(isCellSec)
            {/* 2 and 3 for sec cell */
               hqRecpReq->hqInfo.hqRes[2] = 
                  ue->n1PucchF1bResCb.cw1N1Res[hqCb->tpc].n1PucchIdx;
               hqRecpReq->hqInfo.hqRes[3] = 
                     ue->n1PucchF1bResCb.cw2N1Res[hqCb->tpc].n1PucchIdx;
            }
            else/* primary cell */
            {/* 0 and 1 are for primary cell */
#ifdef LTEMAC_SPS
               if (hqCb && hqCb->spsN1PucchRes.pres)
               {/* Not sps release */
                  hqRecpReq->hqInfo.hqRes[0] = hqCb->spsN1PucchRes.val;
               }
               else
#endif /* LTEMAC_SPS */
               {
#ifdef ERRCLS_KW
                  if(pdcch == NULLP)
                  {
                     /* This is not supposed to happen
                      * Error case. hqCB has to be ter
                      * when pdcch is present . Adding 
                      * if check bcs of kwork*/
                     RETVOID;
                  }
#endif

                  rgSCHTomUtlGethqRes(noFdbks,dlSf,pdcch,cellCb,&hqRes);
                  hqRecpReq->hqInfo.hqRes[0] = hqRes;
                  hqRecpReq->hqInfo.hqRes[1] = hqRes + 1;
               }
            }
         }
         break;
      default:
         break;
   }
   RETVOID;
}

/** @brief This function fills the harq reception request for
 *         TDD in case of Fomat 1B with CS for M>=2
 *
 * @details 
 *
 *     Function: rgSCHTomUtlFillSfHqFdbkForFrmt1BCSForM234
 *
 *         Processing steps:
 *          -Fill Harq Reception Request for Format 1B with
 *           Channel Selection
 *
 * @param  [in] RgSchDlHqProcCb         *hqCb
 * @param  [in] TfuUePucchRecpReq       *hqRecpReq
 * @param  [in] U8                      noFdbks
 * @param  [in] RgSchDlSf               *dlSf
 * @param  [in] RgSchPdcch              *pdcch
 * @param  [in] RgSchCellCb             *cellCb
 * @param  [in] U8                      elemIdx
 * @return void
 */
#ifdef ANSI
PRIVATE Void rgSCHTomUtlFillSfHqFdbkForFrmt1BCSForM234
(
 RgSchDlHqProcCb         *hqCb,
 TfuUePucchRecpReq       *hqRecpReq,
 U8                      noFdbks,
 RgSchDlSf               *dlSf,
 RgSchPdcch              *pdcch,
 RgSchCellCb             *cellCb,
 U8                      elemIdx
)
#else
PRIVATE Void rgSCHTomUtlFillSfHqFdbkForFrmt1BCSForM234(
      hqCb,hqRecpReq,noFdbks,dlSf,pdcch,cellCb,elemIdx)
 RgSchDlHqProcCb         *hqCb;
 TfuUePucchRecpReq       *hqRecpReq;
 U8                      noFdbks;
 RgSchDlSf               *dlSf;
 RgSchPdcch              *pdcch;
 RgSchCellCb             *cellCb;
 U8                      elemIdx;
#endif
{
   RgSchUeCb            *ue;
   Bool                 isCellSec = FALSE;
   U16                  hqRes = 0;
   U8                   servCellIdx;

   if(pdcch)
   {/* SPS Release pdcch or dynamic data */
      ue = pdcch->ue;
   }else
   {/* SPS occasion */
#ifdef ERRCLS_KW
      if(hqCb == NULLP)
      {
         /* This is not supposed to happen
          * Error case. hqCB has to be ter
          * when pdcch is present . Adding 
          * if check bcs of kwork*/
         RETVOID;
      }
#endif
      ue = hqCb->hqE->ue;
   }

   if((hqCb != NULLP) && (ue != NULLP) &&  
      (RG_SCH_IS_CELL_SEC(ue,hqCb->hqE->cell)))
   {
      isCellSec = TRUE;
   }   

   if(isCellSec)
   {/* Sec Cell indices are 2 and 3*/
      servCellIdx = rgSchUtlGetServCellIdx(hqCb->hqE->cell->instIdx,
                                           hqCb->hqE->cell->cellId,
                                           hqCb->hqE->ue);

      hqRecpReq->hqInfo.hqRes[2] = 
         ue->n1PucchF1bResCb.cw1N1Res[hqCb->tpc].n1PucchIdx;

      if(rgSCHUtlGetMaxTbSupp(ue->cellInfo[servCellIdx]->txMode.txModeEnum) > 1)
      {
         hqRecpReq->hqInfo.hqRes[3] = 
            ue->n1PucchF1bResCb.cw2N1Res[hqCb->tpc].n1PucchIdx;
      }
   }
   else
   {/* Primary cell indices are 0 and 1 */
      /* SPS occasions
       * M > 2 if SPS occasion is present in any of the 
       * DL subframe in the bundle, the n1Pucch(0) is
       * the SPS resource and n1Pucch(1) is the resource
       * derived from pdcch with DAI = 1
       * If No SPS Occasion
       * Then n1Pucch(0) is from pdcch with DAI =1
       * and n1Pucch(1) is from pdcch with DAI = 2
       * */

      if(hqCb != NULLP)
      {/* this is not sps release pdcch */
         if(hqCb->spsN1PucchRes.pres == TRUE)
         {/* SPS occasion*/
            hqRes = hqCb->spsN1PucchRes.val;
         }
      }

      if(pdcch)
      {/*Dynamic scheduling or SPS Release
         Derive from pdcch */
         if(pdcch->dlDai < 3)
         {/* No need to calcualte from DAI > 2 */
            rgSCHTomUtlGethqRes(noFdbks,dlSf,pdcch,cellCb,&hqRes);
         }
      }

      if(2 == noFdbks)
      {/* M == 2 case */
         hqRecpReq->hqInfo.hqRes[elemIdx] = hqRes; 
      }
      else
      {/* Pdcch with DAI = 1 and 2 needs to be used
          for resource calculation*/
         if(hqCb && hqCb->spsN1PucchRes.pres == TRUE)
         {/* dyn or sps occasion */
            /* Shift the hqRes[0] if it was filled
             * if there was a pdcch with DAI 1 before to this 
             * subframe*/
            if(hqCb->ulDai > 1)
            {/* SPS occasion happened in the middle 
                of the bundle */
               /* shifting the non SPS resource to n1Pucch(1) */
               hqRecpReq->hqInfo.hqRes[1] = hqRecpReq->hqInfo.hqRes[0]; 
            }

            hqRecpReq->hqInfo.hqRes[0] = hqRes; 
         }
#ifdef ERRCLS_KW
         else if(pdcch && pdcch->dlDai < 3)
#else
         else if(pdcch->dlDai < 3)
#endif
         {/* sps rel or dyn sched */
            /* hqCb wil not be present for sps release pdcch */
            if(hqCb && (pdcch->dlDai != hqCb->ulDai))
            {/* there was a SPS occasion before to this */
               if(pdcch->dlDai == 1)
               {
                  hqRecpReq->hqInfo.hqRes[1] = hqRes; 
               }/* ignore the DAI 2 in this case */
            }else
            {/* There was no SPS occasion before to this */
#ifdef ERRCLS_KW
               if(pdcch->dlDai)
#endif
               {/* Added check to ignore kwork warning */
                  hqRecpReq->hqInfo.hqRes[(pdcch->dlDai)-1] = hqRes; 
               }
            }
         }
      }
   }
   RETVOID;
}

/** @brief This function fills the harq reception request for
 *         TDD in case of Fomat 1B with CS
 *
 * @details 
 *
 *     Function: rgSCHTomUtlFillSfHqFdbkForFrmt1BCS
 *
 *         Processing steps:
 *          -Fill Harq Reception Request for Format 1B with
 *           Channel Selection
 *
 * @param  [in] RgSchDlSf     *ulSf
 * @param  [in] RgSchCellCb   *cell
 * @param  [out]TfuUePucchRecpReq *hqRecpReq
 * @return S16
 */
#ifdef ANSI
PRIVATE S16 rgSCHTomUtlFillSfHqFdbkForFrmt1BCS
(
 RgSchDlHqProcCb         *hqCb,
 TfuUePucchRecpReq       *hqRecpReq,
 U8                      noFdbks,
 RgSchDlSf               *dlSf,
 RgSchPdcch              *pdcch,
 U8                      elemIdx,
 RgSchCellCb             *cellCb
)
#else
PRIVATE S16 rgSCHTomUtlFillSfHqFdbkForFrmt1BCS(hqCb,hqRecpReq,noFdbks,dlSf,pdcch,
      n1PucchTkn,elemIdx,cellCb)
 RgSchDlHqProcCb         *hqCb;
 TfuUePucchRecpReq       *hqRecpReq;
 U8                      noFdbks;
 RgSchDlSf               *dlSf;
 RgSchPdcch              *pdcch;
 U8                      elemIdx;
 RgSchCellCb             *cellCb;
#endif
{
   /* Update teh fdbk mode if something different is present
    * in L1 API file for F1BS *//* 1 --> F1BCS */
   hqRecpReq->hqInfo.hqFdbkMode = TFU_ACK_NACK_CHANNEL_SELECTION;

   switch(noFdbks)
   {/* M Value */
      case RG_SCH_M_VAL_1:
         {

            rgSCHTomUtlFillSfHqFdbkForFrmt1BCSForM1(hqCb,hqRecpReq,
                  noFdbks,dlSf,pdcch,cellCb);
            break;
         }
      case RG_SCH_M_VAL_2:
      case RG_SCH_M_VAL_3:
      case RG_SCH_M_VAL_4:
         {
            /* Spatial bundling will be applied */
            rgSCHTomUtlFillSfHqFdbkForFrmt1BCSForM234(hqCb,hqRecpReq,
                  noFdbks,dlSf,pdcch,cellCb,elemIdx);
            break;
         }
      default:
         break;
   }
   RETVALUE(ROK);
}
#endif

/***********************************************************
 *
 *     Func : rgSCHTomUtlFillSfHqFdbkForOneUe
 *
 *     Desc : Fill HARQ feedback info for one UE/entry
 *
 *     Ret  : ROK/RFAILED
 *
 *     Notes:
 *
 *     File :
 *
 **********************************************************/
#ifdef ANSI
PRIVATE S16 rgSCHTomUtlFillSfHqFdbkForOneUe
( 
RgSchDlHqProcCb         *hqCb,
TfuRecpReqInfo          *recpReqInfo,
RgSchCellCb             *cellCb,
RgSchErrInfo            *err,
RgSchDlSf               *dlSf,
U8                      noFdbks,
CmMemListCp             *memCp,
U8                      elemIdx,
RgSchDlSf               *nxtDlsf,
CmLteRnti               rnti,
RgrTddAckNackMode       ackNackMode,
RgSchUePucchRecpInfo    **pucchInfoRef,
RgSchPdcch              *pdcch,
TknU16                  n1PucchTkn,
Bool                    *allocRef,
U8                      hqSz  
)
#else
PRIVATE S16 rgSCHTomUtlFillSfHqFdbkForOneUe(hqCb,recpReqInfo, cellCb, err, dlSf,
      noFdbks, memCp, elemIdx, nxtDlsf, rnti, ackNackMode, pucchInfoRef,
      pdcch, n1PucchTkn, allocRef, hqSz)
RgSchDlHqProcCb         *hqCb;
TfuRecpReqInfo          *recpReqInfo;
RgSchCellCb             *cellCb;
RgSchErrInfo            *err;
RgSchDlSf               *dlSf;
U8                      noFdbks;
CmMemListCp             *memCp;
U8                      elemIdx;
RgSchDlSf               *nxtDlsf;
CmLteRnti               rnti;
RgrTddAckNackMode       ackNackMode;
RgSchUePucchRecpInfo    **pucchInfoRef;
RgSchPdcch              *pdcch;
TknU16                  n1PucchTkn;
Bool                    *allocRef;
U8                      hqSz;
#endif
{
   RgSchUePucchRecpInfo    *pucchInfo = *pucchInfoRef;
   Bool                    alloc = FALSE;
   S16                     ret;
   TfuUePucchRecpReq       *hqRecpReq;
#ifdef TFU_UPGRADE
   U8                      M;
   U8                      P;
   U8                      m;
   U8                      nP;
   U8                      nPlusOne;
   U16                     pucchRes;
   U8                      resIdx;
   U8                     nCce;
   U8                      prevHqSize;
#else
   U8                      multCnt;
#endif
#ifdef LTEMAC_SPS
   Bool                    isFirstFdbk = FALSE;
#endif
   if(pucchInfo == NULLP)
   {
      if ((ret = rgSCHUtlGetEventMem((Ptr *)&pucchInfo,
                  sizeof(RgSchUePucchRecpInfo), memCp)) != ROK)
      {
         RLOG_ARG1(L_ERROR,DBG_CELLID,cellCb->cellId,"Unable to "
            "Allocate TfuUeRecpReqInfo for cell RNTI:%d",rnti);
         err->errCause = RGSCHERR_TOM_MEM_EXHAUST;
         RETVALUE(ret);
      }
      alloc = TRUE;
#ifdef TFU_ALLOC_EVENT_NO_INIT
      pucchInfo->hashLstEnt.hashVal = 0;
      pucchInfo->hashLstEnt.keyLen = 0;
      pucchInfo->hashLstEnt.key = 0;
      pucchInfo->hashLstEnt.list.prev = pucchInfo->hashLstEnt.list.next = 0;
#endif
      if ((ret = rgSCHUtlGetEventMem((Ptr *)&(pucchInfo->pucchRecpInfo),
                  sizeof(TfuUeRecpReqInfo), &(recpReqInfo->memCp))) != ROK)
      {
         RLOG_ARG1(L_ERROR,DBG_CELLID,cellCb->cellId,"Unable to "
            "Allocate TfuUeRecpReqInfo for cell RNTI:%d",rnti);
         err->errCause = RGSCHERR_TOM_MEM_EXHAUST;
         RETVALUE(ret);
      }
      cmMemset((U8 *)pucchInfo->pucchRecpInfo->t.pucchRecpReq.hqInfo.hqRes,0xff,sizeof(U16)*TFU_MAX_HQ_RES);
#ifdef TFU_ALLOC_EVENT_NO_INIT
      cmMemset((U8 *)&pucchInfo->pucchRecpInfo->t.pucchRecpReq, 0, sizeof(TfuUePucchRecpReq));
#endif
      pucchInfo->pucchRecpInfo->type = TFU_RECP_REQ_PUCCH;
      pucchInfo->pucchRecpInfo->rnti = rnti;
#ifdef TFU_UPGRADE
      pucchInfo->pucchRecpInfo->t.pucchRecpReq.uciInfo=TFU_PUCCH_HARQ;
#endif
#ifdef LTEMAC_SPS
      isFirstFdbk = TRUE;
#endif
   }
   /* Fill m, M, P */
   /* Calculation of resources same for both bundling and muxing for M = 1
    * */
#ifdef LTE_ADV
    RgSchUeCb     *ue = rgSCHDbmGetUeCb (cellCb, rnti);
    if((ue) && (1 == ue->numSCells))
    {
       if(ue->uciFrmtTyp == RG_SCH_UCI_FORMAT1B_CS)
       {
          hqRecpReq = &(pucchInfo->pucchRecpInfo->t.pucchRecpReq);
          rgSCHTomUtlFillSfHqFdbkForFrmt1BCS(hqCb,hqRecpReq,
                noFdbks,dlSf,pdcch,elemIdx,cellCb);

          if(noFdbks == 1)
          {/* M = 1 case . size is same as A Value*/
               hqRecpReq->hqInfo.hqSz = ue->f1bCsAVal;
               hqRecpReq->hqInfo.pucchResCnt = hqRecpReq->hqInfo.hqSz;
          }else
          {/* M > 1 case */
            hqRecpReq->hqInfo.hqSz = (noFdbks * 2); /* M for 2 cells */
            hqRecpReq->hqInfo.pucchResCnt = 4;
          }
          hqRecpReq->hqInfo.a = ue->f1bCsAVal;
          /* handling for SPS occasions*/
          if(elemIdx == 0)
          {
             /* set the datPresinFirstSUbframe to TRUE if this 
              * is for pcell txion*/
             RgSchTddANInfo      *anInfo = NULLP;
             /* if this txion is on pcell
              * sps occaion, dyn sched or sps release pdcch
              * set the sched present in first 
              * dl subframe of the bundle to TRUE. This 
              * is required for mapping the feedbak when SPS occasion
              * is present in any of the DL subframe in the bundle in 
              * case of M > 2*/

              /* SPS will happen only on pcell */
             if((hqCb == NULLP) || (!RG_SCH_IS_CELL_SEC(ue,hqCb->hqE->cell)))
             {
                 anInfo = rgSCHUtlGetUeANFdbkInfo(ue,
                      &recpReqInfo->timingInfo,RGSCH_PCELL_INDEX);
#ifdef ERRCLS_KW
                if(anInfo == NULL)
                {/* ANInfo must be there. adding block
                    because of kworks*/
                   RGSCHDBGERRNEW(cellCb->instIdx,(rgSchPBuf(cellCb->instIdx),
                            "ANInfo should not be NULL for cellId=%d \n", cellCb->cellId));
                   RETVALUE(RFAILED);

                }
#endif
             }
         }
       }else
       {/* This needs to be revisited while
           adding support for PUCCH format 3 */
          RGSCHDBGERRNEW(cellCb->instIdx,(rgSchPBuf(cellCb->instIdx),"Invalid Pucch format configured.."));
          RETVALUE(RFAILED);
       }
    }
    else
#endif
    {
       if((ackNackMode == RGR_TDD_ACKNACK_MODE_BUNDL) || 
             ((noFdbks == 1) && (ackNackMode == RGR_TDD_ACKNACK_MODE_MULT)))
       {
          hqRecpReq = &(pucchInfo->pucchRecpInfo->t.pucchRecpReq);
#ifdef TFU_UPGRADE
          prevHqSize =  hqRecpReq->hqInfo.hqSz;
#endif
#ifndef TFU_UPGRADE
          /* Only one index for bundling case */
          hqRecpReq->M = noFdbks;
          hqRecpReq->hqType =
             TFU_HQ_RECP_REQ_NORMAL;
          hqRecpReq->multCnt = 1;
          hqRecpReq->t.nCce[0] = 
             pdcch->nCce;
          hqRecpReq->m[0] = 
             dlSf->dlFdbkInfo.m;
          hqRecpReq->p[0] =
             rgSCHCmnGetPValFrmCCE(cellCb, pdcch->nCce);

          hqRecpReq->type = TFU_UCI_HARQ;

#else /* TFU_UPGRADE */

#ifdef LTEMAC_SPS
          if ((TRUE == isFirstFdbk) && (TRUE == n1PucchTkn.pres))
          {
             hqRecpReq->hqInfo.hqFdbkMode = (TfuAckNackMode)ackNackMode;
             hqRecpReq->hqInfo.pucchResCnt=1;
             hqRecpReq->hqInfo.hqRes[0] = n1PucchTkn.val;
             hqRecpReq->hqInfo.hqSz = hqSz;
          }
          /* ccpu00139413 */
          else if (FALSE == n1PucchTkn.pres)
#endif
          {
             hqRecpReq->hqInfo.hqFdbkMode = (TfuAckNackMode)ackNackMode;
             M = noFdbks;
             P = rgSCHCmnGetPValFrmCCE(cellCb, pdcch->nCce);
             nP = cellCb->rgSchTddNpValTbl[P];
             nPlusOne = cellCb->rgSchTddNpValTbl[P + 1];
             m = dlSf->dlFdbkInfo.m;
             /* In case of no UE */
             pucchRes = (M - m - 1)* nP + (m * nPlusOne) + pdcch->nCce + 
                cellCb->pucchCfg.n1PucchAn;
             /*ccpu00130164:MOD-Changed to maitain value of
               hqRecpReq->hqInfo.pucchResCnt=1 in case of bundling*/
             /*ccpu00132284 -MOD- hqRes need to be updated after pucchReCnt set to 1
              * and resource should be update at index-0*/
             hqRecpReq->hqInfo.pucchResCnt=1;
             hqRecpReq->hqInfo.hqRes[hqRecpReq->hqInfo.pucchResCnt-1] = pucchRes;

             if((ackNackMode == RGR_TDD_ACKNACK_MODE_BUNDL) && (hqSz > prevHqSize))
                hqRecpReq->hqInfo.hqSz = hqSz;
             else if (ackNackMode == RGR_TDD_ACKNACK_MODE_MULT)
                hqRecpReq->hqInfo.hqSz = hqSz;
             else
                hqRecpReq->hqInfo.hqSz = prevHqSize;
          }
#endif /* TFU_UPGRADE */
#ifndef TFU_UPGRADE
          cmLListAdd2Tail(&recpReqInfo->ueRecpReqLst, 
                &(pucchInfo->pucchRecpInfo->lnk));
          pucchInfo->pucchRecpInfo->lnk.node = 
             (PTR)pucchInfo->pucchRecpInfo;
#endif
       }
       else /* Multiplexing */
       {
#ifndef TFU_UPGRADE
          pucchInfo->pucchRecpInfo->t.pucchRecpReq.M = noFdbks;
#ifdef LTEMAC_SPS
          if (n1PucchTkn.pres == TRUE)
          {
             pucchInfo->pucchRecpInfo->t.pucchRecpReq.hqType =
                TFU_HQ_RECP_REQ_N1PUCCH;
             pucchInfo->pucchRecpInfo->t.pucchRecpReq.t.n1Pucch = n1PucchTkn.val;
          }
          else
#endif
          {
             pucchInfo->pucchRecpInfo->t.pucchRecpReq.hqType =
                TFU_HQ_RECP_REQ_NORMAL;
             multCnt = pucchInfo->pucchRecpInfo->t.pucchRecpReq.multCnt;
             pucchInfo->pucchRecpInfo->t.pucchRecpReq.t.nCce[multCnt] = 
                pdcch->nCce;
             pucchInfo->pucchRecpInfo->t.pucchRecpReq.m[multCnt] =
                dlSf->dlFdbkInfo.m;
             pucchInfo->pucchRecpInfo->t.pucchRecpReq.p[multCnt] =
                rgSCHCmnGetPValFrmCCE(cellCb, pdcch->nCce);

             pucchInfo->pucchRecpInfo->t.pucchRecpReq.multCnt++;
          }
#else /* TFU_UPGRADE */

          hqRecpReq = &(pucchInfo->pucchRecpInfo->t.pucchRecpReq);
          hqRecpReq->hqInfo.hqFdbkMode = (TfuAckNackMode)RGR_TDD_ACKNACK_MODE_MULT;
          hqRecpReq->hqInfo.hqSz = noFdbks;

          resIdx = hqRecpReq->hqInfo.pucchResCnt;
          hqRecpReq->hqInfo.pucchResCnt++;

#ifdef LTEMAC_SPS
          if (n1PucchTkn.pres == TRUE)
          {
             hqRecpReq->hqInfo.hqRes[resIdx] = n1PucchTkn.val;
          }
          else
#endif
          {
             M = noFdbks;
             m = dlSf->dlFdbkInfo.m;
             nCce = pdcch->nCce;
             P = rgSCHCmnGetPValFrmCCE(cellCb, nCce);
             nP = cellCb->rgSchTddNpValTbl[P];
             nPlusOne = cellCb->rgSchTddNpValTbl[P + 1];
             hqRecpReq->hqInfo.hqRes[resIdx] = (M - m - 1)* nP + 
                (m * nPlusOne) + pdcch->nCce + 
                cellCb->pucchCfg.n1PucchAn;
          }
#endif /* TFU_UPGRADE */
          /* If all the DL subframes are scanned, then
           * send TFU request*/
#ifndef TFU_UPGRADE
          if((elemIdx != noFdbks) && alloc)
          {
             cmHashListInsert(&cellCb->ueTfuPendLst, (PTR) pucchInfo,
                   (U8 *)&rnti, (U16) sizeof(rnti));
             alloc = FALSE;
          }
          else
          {
             pucchInfo->pucchRecpInfo->t.pucchRecpReq.type = TFU_UCI_HARQ;
             cmLListAdd2Tail(&recpReqInfo->ueRecpReqLst, 
                   &(pucchInfo->pucchRecpInfo->lnk));
             pucchInfo->pucchRecpInfo->lnk.node = 
                (PTR)pucchInfo->pucchRecpInfo;
             /* Delete the entry after addition to the list */
             cmHashListDelete(&cellCb->ueTfuPendLst, (PTR) pucchInfo);
          }
#endif
       }
    }

   *pucchInfoRef = pucchInfo;
   *allocRef     = alloc;
   RETVALUE(ROK);
}
#endif

#ifdef RG_ULSCHED_AT_CRC
/** @brief This function does all the processing related to a single downlink
 * subframe.
 *
 * @details 
 *
 *     Function: rgSCHTomUtlProcDlSfAtCrc
 *
 *         Processing steps:
 *         - collate control data for all UEs and send to PHY 
 *         - collate data buffers for all UEs and send to PHY 
 *
 * @param  [in] RgSchDlSf     *ulSf
 * @param  [in] RgSchCellCb   *cell
 * @param  [out] RgSchErrInfo *err
 * @return S16
 */
#ifdef ANSI
PRIVATE S16 rgSCHTomUtlProcDlSfAtCrc
(
RgSchDlSf            *ulSf,
CmLteTimingInfo      crntUlFrm,
RgSchCellCb          *cell,
RgSchErrInfo         *err
)
#else
PRIVATE S16 rgSCHTomUtlProcDlSfAtCrc (ulSf, crntUlFrm, cell, err)
RgSchDlSf            *ulSf;
CmLteTimingInfo      crntUlFrm;
RgSchCellCb          *cell;
RgSchErrInfo         *err;
#endif
{
   TfuCntrlReqInfo   *cntrlInfo;
   Inst              inst = cell->instIdx;
   S16               ret;

   TRC2(rgSCHTomUtlProcDlSfAtCrc);
  
   /* Fill control data from scheduler to PHY */   
   if ((ret = rgSCHUtlAllocEventMem(inst, (Ptr *)&cntrlInfo, 
                            sizeof(TfuCntrlReqInfo))) != ROK)
   {
      RLOG_ARG0(L_ERROR,DBG_CELLID,cell->cellId,"Unable to Allocate TfuCntrlReqInfo "
         "for cell");
      RETVALUE(ret);
   }
   else
   {
      cntrlInfo->numDlActvUes = 0;
      cmLListInit(&cntrlInfo->phichLst);
      cmLListInit(&cntrlInfo->dlPdcchLst);
      cmLListInit(&cntrlInfo->ulPdcchLst);
#ifdef TFU_ALLOC_EVENT_NO_INIT
      cntrlInfo->dlTiming.sfn = cntrlInfo->dlTiming.subframe = 0;
      cntrlInfo->cfi = 0;
#endif

      cntrlInfo->ulTiming = crntUlFrm;
      RG_SCH_ADD_TO_CRNT_TIME(cell->crntTime, cntrlInfo->ulTiming, TFU_ULCNTRL_DLDELTA);
           
      cntrlInfo->cellId = cell->cellId;
      /* Fill PHICH info */
      if ((ret = rgSCHTomUtlFillPhich (cell, cntrlInfo, ulSf, err)) != ROK)
      {
         RLOG_ARG0(L_ERROR,DBG_CELLID,cell->cellId,"Unable to send PHICH info for "
            "cell");
         RGSCH_FREE_MEM(cntrlInfo);
         RETVALUE(ret);
      }

      /* Fill UL Pdcch */
      if ((ret = rgSCHTomUtlFillUlPdcch (cell, cntrlInfo, ulSf, err)) != ROK)
      {
         RLOG_ARG0(L_ERROR,DBG_CELLID,cell->cellId,"Unable to send PDCCH info for "
            "cell");
         RGSCH_FREE_MEM(cntrlInfo);
         RETVALUE(ret);
      }

      if (cntrlInfo->ulPdcchLst.count || cntrlInfo->phichLst.count)
      {
         if (rgSCHUtlTfuCntrlReq(inst, cell->tfuSap->sapCfg.suId, cntrlInfo) 
               != ROK)
         {
            RLOG_ARG0(L_ERROR,DBG_CELLID,cell->cellId,"Unable to send Cntrl info for"
               " cell");
         }
      }
      else
      {
         RGSCH_FREE_MEM(cntrlInfo);
      }
   }

   RETVALUE(ROK);
} /* end of */ 
#endif /* #ifdef RG_ULSCHED_AT_CRC*/

#ifdef RGR_RRM_TICK
/** @brief This function sends the SFN Tick to L3  
 * subframe.
 *
 * @details 
 *
 *     Function: rgSCHTomUtlSendSfnTick
 *
 * @param  [in] RgSchCellCb   *cell
 */
#ifdef ANSI
PRIVATE Void rgSCHTomUtlSendSfnTick
(
RgSchCellCb          *cell
)
#else
PRIVATE Void rgSCHTomUtlSendSfnTick (cell)
RgSchCellCb          *cell;
#endif
{
   RgrTtiIndInfo     *rgrTtiInd;
   
   TRC2(rgSCHTomUtlSendSfnTick);

   /* TTI to be sent to RRM only once per system frame */
   /* Added support for period = 0 to disable tick to RRM */
   if ((cell->rrmTtiIndPrd != 0) && 
         ((cell->crntTime.sfn % cell->rrmTtiIndPrd) == 0) && 
         (cell->crntTime.subframe == 0))
   {
      /* Allocate a TTI indication structure and send to RRM over RGR interface */
      if (rgSCHUtlAllocSBuf (cell->instIdx,
               (Data**)&rgrTtiInd, sizeof(RgrTtiIndInfo)) != ROK)
      {
         RGSCHDBGERRNEW(cell->instIdx,(rgSchPBuf(cell->instIdx),
                  "Mem alloc failed for RGR TTI ind, cellId (%d))\n", 
                  cell->cellId));
         RETVOID;
      }
      rgrTtiInd->cellId = cell->cellId;
      rgrTtiInd->sfn    = cell->crntTime.sfn;

      if (rgSCHUtlRgrTtiInd (cell, rgrTtiInd) != ROK)
      {
         RGSCHDBGERRNEW(cell->instIdx,(rgSchPBuf(cell->instIdx),
                  "Failed to send RGR TTI ind, cellId (%d))\n", 
                  cell->cellId));
         rgSCHUtlFreeSBuf(cell->instIdx, (Data**)&rgrTtiInd,
               sizeof(RgrTtiIndInfo));
         RETVOID;
      }
   }
   RETVOID;
}
#endif
/** @brief This function fills the TTI timinig info for each cell  
 *
 * @details 
 *
 *     Function: rgSchTomFillCellTtiInfo
 *
 * @param  [in]  TfuTtiIndInfo  *ttiInd
 * @param  [in]  Inst           schInst
 * @param  [out] U8             *nCell
 * @param  [out] RgSchCellCb    *cell[]
 *
 * Returns: Void  
 *  
 */
#ifdef ANSI
PRIVATE Void rgSchTomFillCellTtiInfo
(
TfuTtiIndInfo      *ttiInd,
Inst               schInst,
U8                 *nCell,
RgSchCellCb        *cells[]
)
#else
PRIVATE Void rgSchTomFillCellTtiInfo (ttiInd, schInst, nCell, cells)
TfuTtiIndInfo      *ttiInd;
Inst               schInst;
U8                 *nCell;
RgSchCellCb        *cells[];
#endif
{
   U8             i = 0;
   U8             strtCellId;
   TfuTtiCellInfo *cellInfo;
   RgSchCellCb    *cell; 
   U32            Idx1; 
   TRC2 (rgSchTomFillCellTtiInfo);

   if (CM_LTE_MAX_CELLS < ttiInd->numCells)
   {
      RETVOID;
   }

   for (i = 0; i < ttiInd->numCells; i++)
   {
      cellInfo   = &ttiInd->cells[i];
      strtCellId = rgSchCb[schInst].genCfg.startCellId;
      Idx1 = (U8)((cellInfo->cellId - strtCellId)&(CM_LTE_MAX_CELLS-1));
      cell = rgSchCb[schInst].cells[Idx1];
      /* Validate the cell */
      if (cell == NULLP) 
      {
         /* Use SCH inst 0 print buff */
         RGSCHDBGERRNEW(schInst,(rgSchPBuf(schInst),
                  "RgLiTfuTtiInd()No cell exists for cellId %d\n", 
                  cellInfo->cellId));
         continue;
      }
      *nCell = *nCell + 1;
      cells[i] = (RgSchCellCb *)cell;

      /* 4UE_TTI_DELTA */
      if(cell->schTickDelta != cellInfo->schTickDelta)
      {
         printf("\nMukesh: Delta changed for cellId=%d: curr delta=%d new delta=%d\n"
         "dlblankSf=%d ulblankSf=%d dummyTti=%d \n",
         cell->cellId, cell->schTickDelta, cellInfo->schTickDelta, cellInfo->dlBlankSf,cellInfo->ulBlankSf,
         cellInfo->isDummyTti);
      }
      RGSCH_UPDATE_DELTA(schInst, cellInfo->schTickDelta);
      cell->schTickDelta = cellInfo->schTickDelta;
      /* 4UE_TTI_DELTA */

      cell->stopSiSch    = cellInfo->dlBlankSf;
      cell->stopDlSch    = cellInfo->dlBlankSf;
      cell->stopUlSch    = cellInfo->ulBlankSf;
      if (cellInfo->isDummyTti)
      {
         cell->stopDlSch = TRUE;
      }


      RGSCHCPYTIMEINFO(cellInfo->timingInfo, cell->crntTime);
      RG_SCH_ADD_TO_CRNT_TIME(cell->crntTime, cell->hiDci0Time, 
                              TFU_ULCNTRL_DLDELTA);
      RG_SCH_ADD_TO_CRNT_TIME(cell->crntTime, cell->dlDciTime, 
                              TFU_DLCNTRL_DLDELTA);
      RG_SCH_ADD_TO_CRNT_TIME(cell->crntTime, cell->rcpReqTime, 
                              TFU_RECPREQ_DLDELTA);
      RGSCHDECRFRMCRNTTIME(cell->crntTime, cell->hqRlsTime, 
                              TFU_HQFBKIND_ULDELTA); 
      RGSCHDECRFRMCRNTTIME(cell->crntTime, cell->dlSfRlsTime, 
                              RGSCH_RLS_SF_IDX);
      rgSCHCmnUpdVars(cell);
      cell->isDlDataAllwd = TRUE; 

#ifdef RG_PFS_STATS
      cell->totalTime++;
#endif
#ifdef LTE_TDD
      U8 idx = (cell->crntTime.subframe + RG_SCH_CMN_DL_DELTA) %
         RGSCH_NUM_SUB_FRAMES;       
      
      cell->isDlDataAllwd = RG_SCH_CMN_CHK_DL_DATA_ALLOWED(cell, idx);
      
      /*ccpu00130639 -ADD - used in UL HARQ proc id calculation*/
      if((cell->crntTime.sfn == 0) && (cell->crntTime.subframe == 0))
      {
         /* sfn Cycle used for Tdd UL Harq Proc Determination. 
            This sfn Cycle will have values from 0 to numUl Harq-1. */
         cell->tddHqSfnCycle = (cell->tddHqSfnCycle + 1 ) %
            (rgSchTddUlNumHarqProcTbl[cell->ulDlCfgIdx]);
      }
#endif      
   } 
}

/** @brief This function prepares the TTI for scheduling and 
 *         invokes the Common channel scheduler. Uplink scheduler
 *         is invoked first if UL Scheduling at CRC is not enabled   
 *
 * @details 
 *
 *     Function: rgSchTomTtiUlAndDlCmnChSch
 *
 * @param  [out] RgSchCellCb    *cell
 *
 * Returns: Void  
 *  
 */
#ifdef ANSI
PRIVATE Void rgSchTomTtiUlAndDlCmnChSch
(
RgSchCellCb        *cell
)
#else
PRIVATE Void rgSchTomTtiUlAndDlCmnChSch (cell)
RgSchCellCb        *cell;
#endif
{

   TRC2(rgSchTomTtiUlAndDlCmnChSch);

   cell->rlsHqArr[cell->crntHqIdx].numUes = 0;
   cell->crntHqIdx++;
   cell->crntHqIdx  = cell->crntHqIdx % RGSCH_NUM_SUB_FRAMES;

   cmPrcTmr(&cell->tqCp, cell->tq, (PFV)rgSCHTmrProcTmr);
   rgSCHMeasGapANRepTtiHndl (cell);
   /* We need to fill the PHICH for the UL Data, first we need to get the UL
    * SF from Scheduler, next we fill the dlSf that goes out this TTI. 
    * This must be performed prior to any other processing of the TTI
    * so that we do not wrap around and generate feedback prior to 
    * reception of UL data.
    */
#ifndef RG_ULSCHED_AT_CRC
   {
      U8   Mval = 1;
      U8   idx; /* Index into Uplink Sf array */ 
#ifdef LTE_TDD      
      Mval = rgSchTddPhichMValTbl[cell->ulDlCfgIdx]
                                 [cell->hiDci0Time.subframe];
#endif      
      if(Mval)
      {
         for(idx=0; idx < Mval; idx++)
         {
            rgSCHUhmAppendPhich(cell, cell->hiDci0Time, idx);
            rgSCHCmnRlsUlSf(cell, idx);
         }
      }           
   }
#endif

#ifdef LTE_TDD
   rgSchTomUtlTddRlsSfAndHarq(cell);
#else
   /* DTX processing for those Harq's which did not get feedback from L1 */
   rgSCHDhmRlsDlsfHqProc (cell, cell->hqRlsTime);
   /* Re-Init the Downlink subframe */
   rgSCHUtlDlRlsSubFrm(cell, cell->dlSfRlsTime);
#endif   
   /* Added handling to retransmit
    * release PDCCH in case of DTX
    */
#ifdef LTEMAC_SPS
   rgSCHCmnSpsDlReTxRelPdcch(cell);
#endif

#ifndef LTE_TDD
#ifdef LTEMAC_HDFDD
#ifdef TFU_UPGRADE
   /* Mark HD-FDD UEs sf(n+10) as UPLINK if CQI/RI or SRS or RI expecting */
   rgSCHCmnHdFddPtUlMrk(cell);
#endif
#endif
#endif
   /*Check for DRX every TTI*/
   rgSCHDrxTtiInd(cell);

   /* For TDD, UL scheduling should happen after DL scheduling */
#ifndef LTE_TDD   
#ifndef RG_ULSCHED_AT_CRC
   /* Perform UL scheduling */ 
   rgSCHCmnUlSch(cell);
#endif
#endif   
   /* Perform DL scheduling  for Common channels */
   rgSCHCmnDlCommonChSch(cell);
      
   RETVOID;
}

/** @brief This function invokes the Non critical procedures like measurements,
 *         and RGR configurations.    
 *
 * @details 
 *
 *     Function: rgSchTomTtiMiscFunctions
 *
 * @param  [in] RgSchCellCb    *cell
 *
 * Returns: Void  
 *  
 */
#ifdef ANSI
PRIVATE Void rgSchTomTtiMiscFunctions
(
RgSchCellCb        *cell
)
#else
PRIVATE Void rgSchTomTtiMiscFunctions (cell)
RgSchCellCb        *cell;
#endif
{
   U8   suId = cell->tfuSap->sapCfg.suId;
    
   TRC2(rgSchTomTtiMiscFunctions);

   /* Invoke RAM Tti Handler  */
   /*TODO:REEMA:REmove for LAA SCELL*/
   rgSCHRamTtiHndlr(cell);

   /* Handle RGR configurations */
   rgSCHGomTtiHndlr(cell, suId);
#ifdef LTE_L2_MEAS
   if((RGM_PRB_REPORT_START == cell->prbUsage.prbRprtEnabld) 
      && (!(cell->prbUsage.rprtPeriod) || ((glblTtiCnt % cell->prbUsage.rprtPeriod) == 0)))
   {
      rgSCHUtlUpdAvgPrbUsage(cell);
   }
   rgSCHL2Meas(cell,FALSE);
#endif 
   
   /* LTE_ADV_FLAG_REMOVED_START */
   /* Report ABS Load information to application periodically */
   if((RGR_ENABLE == cell->lteAdvCb.absCfg.status) &&
                    (cell->lteAdvCb.absCfg.absLoadPeriodicity))
   {
      RgrLoadInfIndInfo *rgrLoadInf;
      U8                 idx;

      cell->lteAdvCb.absLoadTtiCnt++;
      if(cell->lteAdvCb.absLoadTtiCnt >= cell->lteAdvCb.absCfg.absLoadPeriodicity)
      {
         /* ccpu00134492 */
         if(rgSCHUtlAllocSBuf (cell->instIdx,(Data**)&rgrLoadInf,
               sizeof(RgrLoadInfIndInfo)) != ROK)
         {
            RGSCHDBGERRNEW(cell->instIdx,(rgSchPBuf(cell->instIdx),"Could not "
                     "allocate memory for sending LoadInfo\n"));
            RETVOID;
         }
         cell->lteAdvCb.absLoadTtiCnt = 0;
         rgrLoadInf->cellId = cell->cellId;
         rgrLoadInf->bw     = cell->bwCfg.dlTotalBw;
         rgrLoadInf->type   = RGR_ABS;
         for(idx= 0; idx<RGR_ABS_PATTERN_LEN; idx++)
         {
            rgrLoadInf->u.absLoadInfo[idx] = cell->lteAdvCb.absLoadInfo[idx];
            cell->lteAdvCb.absLoadInfo[idx] = 0;
         }
         rgSCHUtlRgrLoadInfInd(cell, rgrLoadInf);
      }
   }

#ifdef LTE_TDD   
   if(cell->isDlDataAllwd)
   {   
      /* Calling function to update CFI parameters*/
      rgSchCmnUpdCfiDb(cell, RG_SCH_CMN_DL_DELTA);   
   }
   else
   {
      /* Incrementing the ttiCnt in case of UL subframe */
      if(!cell->dynCfiCb.switchOvrInProgress)
      {   
         cell->dynCfiCb.ttiCnt++;
      }
   }   
#else
   rgSchCmnUpdCfiDb(cell, RG_SCH_CMN_DL_DELTA);   
#endif   

   /* LTE_ADV_FLAG_REMOVED_END */
   RETVOID;
}


/** @brief This function invokes the Downlink scheduler
 *
 * @details
 *
 *     Function: rgSchTomTtiDlSch
 *
 * @param  [in] RgSchCellCb    *cell
 *
 * Returns: Void
 *
 */
#ifdef ANSI
PRIVATE Void rgSchTomTtiDlSch
(
RgSchCellCb        *cell
)
#else
PRIVATE Void rgSchTomTtiDlSch (cell)
RgSchCellCb        *cell;
#endif
{
   TRC2(rgSchTomTtiDlSch);

   if (cell->isDlDataAllwd && (cell->stopDlSch == FALSE))
   {
      rgSCHCmnDlSch(cell);
   }

   RETVOID;
}

/** @brief This function invokes Consolidates the allocations
 *         send the Subframe allocation info to MAC
 *
 * @details
 *
 *     Function: rgSchTomTtiCnsldtSfAlloc
 *
 * @param  [in] RgSchCellCb    *cell
 *
 * Returns: Void
 *
 */
#ifdef ANSI
PRIVATE Void rgSchTomTtiCnsldtSfAlloc
(
RgSchCellCb        *cell
)
#else
PRIVATE Void rgSchTomTtiCnsldtSfAlloc (cell)
RgSchCellCb        *cell;
#endif
{
   RgSchDlSf *dlSf;
   RgSchCmnCell *cellSch = RG_SCH_CMN_GET_CELL(cell);
   
   dlSf = rgSCHUtlSubFrmGet(cell, cellSch->dl.time);
   
   TRC2(rgSchTomTtiCnsldtSfAlloc);

   /* Prepare Subframe allocation info and send to MAC */
   rgSCHCmnCnsldtSfAlloc(cell); 
   
   /* Call ACK NACK module to add to dlsf Queue */
   rgSCHAckNakRepAddToQ(cell, dlSf);
      
   rgSCHTomUtlProcTA(cell);
  
   RETVOID;
}

/** @brief This function prepares the DL and UL Config requests
 *         and sends to CL 
 *
 * @details
 *
 *     Function: rgSchTomTtiL1DlAndUlCfg
 *
 * @param  [in] RgSchCellCb    *cell
 *
 * Returns: Void
 *
 */
#ifdef ANSI
PRIVATE Void rgSchTomTtiL1DlAndUlCfg
(
RgSchCellCb        *cell
)
#else
PRIVATE Void rgSchTomTtiL1DlAndUlCfg (cell)
RgSchCellCb        *cell;
#endif
{
   RgSchDlSf *dlSf = rgSCHUtlSubFrmGet (cell, cell->dlDciTime);
   RgSchDlSf *ulSf = rgSCHUtlSubFrmGet (cell, cell->hiDci0Time);
   RgSchErrInfo    err;

   TRC2(rgSchTomTtiL1DlAndUlCfg);

   rgSCHTomUtlProcDlSf (dlSf, ulSf, cell, &err);
   /* Mark this frame as sent */
   dlSf->txDone = TRUE;

   rgBwAlloInfo[dlSf->sfNum] += dlSf->bwAssigned;
   rgBwAlcnt[dlSf->sfNum] ++;


#ifdef LTE_TDD 
   rgSCHTomUtlProcTddUlSf(cell);
#else
   rgSCHTomUtlProcUlSf (cell, &err);
#endif   
   
   RETVOID;
}
#ifdef LTE_TDD
/** @brief This function prepares does the Downlink subframe re-init and 
 *         Harq DTX processing 
 *
 * @details
 *
 *     Function: rgSchTomUtlTddRlsSfAndHarq
 *
 * @param  [in] RgSchCellCb    *cell
 *
 * Returns: Void
 *
 */
#ifdef ANSI
PRIVATE Void rgSchTomUtlTddRlsSfAndHarq
(
RgSchCellCb        *cell
)
#else
PRIVATE Void rgSchTomUtlTddRlsSfAndHarq (cell)
RgSchCellCb        *cell;
#endif
{
   TRC2(rgSchTomUtlTddRlsSfAndHarq); 

   /* ccpu00132341-MOD- rgSchTddRlsDlSubfrmTbl is dependent on DELTA(=2).
    * Instead rgSchTddDlAscSetIdxKTbl can be used as the K set gives proper
    * UL subframes*/
   /* ccpu00133109: Removed RGSCHSUBFRMCRNTTIME as it is not giving proper 
    * output if diff is more than 10. Instead using RGSCHDECRFRMCRNTTIME() 
    * as it is serving the purpose */
   if(rgSchTddDlAscSetIdxKTbl[cell->ulDlCfgIdx][cell->hqRlsTime.subframe].
      numFdbkSubfrms)   
   {
      /* ccpu00132341-MOD- Providing the UL SF timing for avoiding 
       * calculation inside the function */
      rgSCHDhmTddRlsSubFrm(cell, cell->hqRlsTime);
      rgSCHDhmRlsDlsfHqProc(cell, cell->hqRlsTime);
   }
   RETVOID;
}

/** @brief This function processes the UL subframe and fills TFU reception
 *         request
 *
 * @details
 *
 *     Function: rgSCHTomUtlProcTddUlSf
 *
 * @param  [in] RgSchCellCb    *cell
 *
 * Returns: Void
 *
 */
#ifdef ANSI
PRIVATE Void rgSCHTomUtlProcTddUlSf
(
RgSchCellCb        *cell
)
#else
PRIVATE Void rgSCHTomUtlProcTddUlSf (cell)
RgSchCellCb        *cell;
#endif
{
   RgSchErrInfo    err;
   
   TRC2(rgSCHTomUtlProcTddUlSf); 

   if(rgSchTddUlDlSubfrmTbl[cell->ulDlCfgIdx]
         [cell->rcpReqTime.subframe] == RG_SCH_TDD_UL_SUBFRAME)
   {
      if (rgSCHTomUtlProcUlSf (cell, &err) != ROK)
      {
         /* fill in err type and call sta ind */
         RGSCHDBGERRNEW(cell->instIdx, (rgSchPBuf(cell->instIdx),
                  "Unable to process Uplink subframe for cellId (%d))\n", 
                  cell->cellId));
      }
   }
   /* TDD Fix , to allow Special SF  SRS CFg  */
   else if(rgSchTddUlDlSubfrmTbl[cell->ulDlCfgIdx]
         [cell->rcpReqTime.subframe] == RG_SCH_TDD_SPL_SUBFRAME)
   {
      if (rgSCHTomUtlPrcUlTddSpclSf(cell, &err) != ROK)
      {
         /* fill in err type and call sta ind */
         RGSCHDBGERRNEW(cell->instIdx, (rgSchPBuf(cell->instIdx),
                  "Unable to process Sipceial subframe for cellId (%d))\n", 
                  cell->cellId));
      }
   }

   RETVOID;
}
#endif

   
   /**********************************************************************

     End of file:     gk_sch_tom.c@@/main/2 - Sat Jul 30 02:21:51 2011

    **********************************************************************/

   /**********************************************************************

     Notes:

    **********************************************************************/

   /**********************************************************************

     Revision history:

    **********************************************************************/
   /********************************************************************90**

     ver       pat    init                  description
------------ -------- ---- ----------------------------------------------
/main/1      ---       sd   1. LTE MAC 2.1 release
             rg001.201 apany 1. Always sending down TfuCntrlReq in DL TTIs
                            2. Always sending down TfuRecpReq in UL TTIs
                            3. Removed extra comments.
/main/1+     rg002.201 sd   1. Setting multCnt = 1 for ack-nack bundling.
                            2. Added support for period 0 to disable tick to RRM.
             rg003.201 sm   1. corrected the statement in the line 2032.
             rg004.201 ns   1. ccpu00105882: Made changes in handling ACK for
                               msg4.
                            2. ccpu00109165:Filling isRtx in puschRecpReq
             rg005.201 sm   1. Changes for optimization
             rg006.201 sd   1. ccpu00111718: Updating NDI and HARQ proc Id
                            2. Changed prototype for function 
                               'rgSCHUtlAllocRcptInfo'. 
                            3. ccpu000111706, ccpu00112394: 
                               TFU_DELTA dependency removed and added 
                               dependency on RG_UL_DELTA dependency
                            4. [ccpu000111706, ccpu00112394]: Separated TTI
                            5. [ccpu00113186]: Corrected TA handling
           rg007.201   ap  1. Added support for MIMO
           rg008.201   sd  1. Removed dependency on MIMO compile-time flag
               rsharon 2.Added support for SPS.
           rg009.201 rsharon 1.[ccpu00112372]:Changes for CR timer.
           rg009.201 dv  1. Added changes of TFU_UPGRADE.
                         2.Changes for passing iPhich at TFU interface.
/main/2      ---        gvj  1. Updated for LTE MAC Rel 3.1           
           rg001.301 asehgal 1.Added the changes corresponding to the 
                               CR ccpu00118844 to Change the revHqCb 
                             2. Changes for the CR ccpu00118643.
           rg002.301 asehgal 1.Added the changes corresponding to the 
                               CR ccpu00118844 to Change the revHqCb.
                             2. Changes for the CR ccpu00118643.
                             3. [ccpu00119223]Added the changes for the rnti 
                               assignment with UeId instead of rntiLnk->rnti
                             4. Added changes for ccpu00118352- ULSCH at CRC
                             5. ccpu00119456 and ccpu00119458 - Correcting HqSz 
                             6. ccpu00120233/332 - Handling for PUSCH and PUCCH 
                                RR for same UE issue.
                             7. ccpu00118351:seperate UL & DL deltas.
                             8. ccpu001120284:setting taLnk->node to NULL
$SID$        ---     rt      1. LTE MAC 4.1 release
*********************************************************************91*/
