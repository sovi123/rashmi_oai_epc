

/********************************************************************20**
  
        Name:    PDCP service user (RLC) - System Services Interface Function.
    
        Type:    C file
  
        Desc:    This file Contains the PDCP service user System Services
                  Interface Function
 
        File:    pjac_ex_ms.c

        Sid:      pjac_ex_ms.c@@/main/TeNB_Main_BR/tenb_main_ccb/1 - Wed Jul 22 18:20:46 2015
  
        Prg:     Adarsh
  
*********************************************************************21*/

/* header (.h) include files */
#include "envopt.h"        /* environment options */
#include "envdep.h"        /* environment dependent */
#include "envind.h"        /* environment independent */

#include "gen.h"           /* general */
#include "ssi.h"           /* system services */
#include "cm5.h"           /* common timer defines */
#include "cm_tkns.h"       /* common tokens defines */
#include "cm_mblk.h"       /* common memory allocation library defines */
#include "cm_llist.h"      /* common link list  defines  */
#include "cm_hash.h"       /* common hash list  defines */
#include "cm_lte.h"        /* common LTE defines */
#include "kwu.h"           /* KWU defines */
#include "cpj.h"           /* CPJ defines */
#include "lpj.h"           /* LPJ defines */
#include "pju.h"           /* PJU defines */
#include "pj_env.h"        /* RLC environment options */
#include "pj.h"            /* RLC defines */
#include "pj_err.h"        /* Error defines */

#include "cm_xta.h"
#include "pjac_acc.h"      /* Acceptance defines */
#include "pjac_kwu.h"      /* CKW Acceptance defines */

/* extern (.x) include files */
#include "gen.x"           /* general */
#include "ssi.x"           /* system services */

#include "cm5.x"           /* common timer library */
#include "cm_tkns.x"       /* common tokens */
#include "cm_mblk.x"       /* common memory allocation */
#include "cm_llist.x"      /* common link list */
#include "cm_hash.x"       /* common hash list */
#include "cm_lte.x"        /* common LTE includes */
#include "cm_lib.x"        /* common memory allocation library */
#include "kwu.x"           /* KWU */
#include "cpj.x"           /* CPJ */
#include "lpj.x"           /* LPJ */
#include "pju.x"           /* PJU */
#include "pj.x"

#include "cm_xta.x"
#include "pjac_acc.x"      /* Acceptance defines */
#include "pjac_kwu.x"      /* CKW Acceptance defines */

/*
 *
 *     Fun:   pjActvInit
 *
 *     Desc:  This function is invoked by system services to initialize 
 *            the PDCP layer. This is an entry point used by PDCP layer to 
 *            initialize its global variables, before becoming operational.
 *
 *            The first and second parameters (entity, instance)
 *            specify the entity and instance id of the PDCP task.
 *
 *            The third parameter (region) specifies the memory region
 *            from which PDCP should allocate structures and buffers.
 *
 *            The fourth parameter (reason) specifies the reason for
 *            calling this initialization function.
 *
 *            Allowable values for parameters are specified in ssi.h.
 *
 *     Ret:   ROK   - ok
 *
 *     Notes: None
 *
       File:  kwac_pj_ex_ms.c
 *
 */

#ifdef ANSI
PUBLIC S16 pjActvInit
(
Ent    ent,                 /* entity */
Inst   inst,                /* instance */
Region region,              /* region */
Reason reason               /* reason */
)
#else
PUBLIC S16 pjActvInit(ent, inst, region, reason)
Ent    ent;                 /* entity */
Inst   inst;                /* instance */
Region region;              /* region */
Reason reason;              /* reason */
#endif
{
   TRC3(pjActvInit)
   
   /* kw005.201 removed warning */
   UNUSED(ent);
   UNUSED(inst);
   UNUSED(region);
   UNUSED(reason);
   RETVALUE(ROK);
} /* end of pjActvInit */


/*
 *
 *       Fun:    pjInitExt initialize external
 *
 *       Desc:   Initializes variables used to interface with Upper/Lower
 *               Layer  
 *
 *       Ret:    RETVOID
 *
 *       Notes:  None
 *
         File:   kwac_pj_ex_ms.c
 *
*/
  
#ifdef ANSI
PUBLIC S16 pjInitExt
(
void
)
#else
PUBLIC S16 pjInitExt()
#endif
{
   TRC2(pjInitExt);
   RETVALUE(ROK);

} /* end of pjInitExt */


/*
*
*       Fun:    pjActvTsk Activation task
*
*       Desc:   Processes events received for PDCP layer via System
*               Services from other layers.
*
*       Ret:    ROK
*
*       Notes:  None
*
*       File:   kwac_pj_ex_ms.c
*
*/
#ifdef ANSI
PUBLIC S16 pjActvTsk
(
Pst *post,              /* post structure */
Buffer *mBuf            /* message buffer */
)
#else
PUBLIC S16 pjActvTsk(post, mBuf)
Pst *post;              /* post structure */
Buffer *mBuf;           /* message buffer */
#endif
{
   S16 ret = ROK;

   TRC3(pjActvTsk);

   switch(post->srcEnt)
   {
#ifdef LCKWU
      case ENTKW:
      {
         switch(post->event)
         {
            case KWU_EVT_BND_CFM:             /* KWU Bind confirm */
               /*
                * Unpack the bind confirm primitive. */
               ret = cmUnpkKwuBndCfm(PjLiKwuBndCfm, post, mBuf);
               break;

            case KWU_EVT_DAT_IND:             /* Data indication */
               /*
                * Unpack the Data Indication primitive. */
               ret = cmUnpkKwuDatInd(PjLiKwuDatInd, post, mBuf);
               break;

            case KWU_EVT_DAT_CFM:            /* Data confirm */
               /*
                * Unpack the data confirm primitive. */
               ret = cmUnpkKwuDatCfm(PjLiKwuDatCfm, post, mBuf);
               break;

            case KWU_EVT_STA_IND:            /* Disconnect indication */
               /*
                * Unpack the status indication primitive. */
               ret = cmUnpkKwuStaInd(PjLiKwuStaInd, post, mBuf);
               break;

            case KWU_EVT_REEST_CMP_IND:      /* Disconnect indication */
               /*
                * Unpack the Re-est complete indication primitive. */
               ret = cmUnpkKwuReEstCmpInd(PjLiKwuReEstCmpInd, post, mBuf);
               break;
               /* kw005.201 added support for L2 Measurement */
#ifdef LTE_L2_MEAS
            case KWU_EVT_DISC_SDU_CFM:      /* SDU Discard confirm  */
               /*
                * Unpack the Sdu discard confirm  */
               ret = cmUnpkKwuDiscSduCfm(PjLiKwuDiscSduCfm, post, mBuf);
               break;
            case KWU_EVT_DAT_ACK_IND: /* DATA Ack Idication */
               /*
                * Unpack the  Data Ack indication */
               ret = cmUnpkKwuDatAckInd(PjLiKwuDatAckInd, post, mBuf);
               break;
#endif
            default:
               ret = RFAILED;
               break;
         }
         break;
      }
#endif  /* LCKWU */

      default:
         break;
   }

   SExitTsk();

   RETVALUE(ret);
}


/********************************************************************30**
         End of file:     pjac_ex_ms.c@@/main/TeNB_Main_BR/tenb_main_ccb/1 - Wed Jul 22 18:20:46 2015
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
/main/1      ---       vb         1. LTE PDCP Initial release 2.1
*********************************************************************91*/
