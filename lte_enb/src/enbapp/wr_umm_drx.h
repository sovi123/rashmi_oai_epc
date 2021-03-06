
/********************************************************************20**

     Name:     EnodeB Application

     Type:     C include file

     Desc:     This file contains 
               

     File:     wr_umm_drx.h

     Sid:      $SID$ 

     Prg:      Sriky 

*********************************************************************21*/

#ifndef __WR_UMM_DRX_H__
#define __WR_UMM_DRX_H__
 
#include "wr.h"
 
#ifdef __cplusplus
extern "C" {
#endif

EXTERN PUBLIC S16 wrUmmRrcFillDrxCfgIe(NhuDRX_Config *drxCfgIe, WrDrxCfg *drxCfg);
EXTERN PUBLIC S16 wrUmmSchdFillUeDrxCfgInfo(RgrUeRecfg *ueRecfg, WrDrxCfg *drxCfg);
EXTERN PUBLIC S16 wrUmmHoSchdFillUeDrxCfgInfo(RgrUeCfg *ueCfg, WrDrxCfg *drxCfg);
EXTERN PUBLIC S16 wrDrxLongCycle[];


#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif /* End of __WR_UMM_DRX_H__ */

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
