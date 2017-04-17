

/********************************************************************20**
 
     Name:     System Services -- implementation specific definitions
 
     Type:     C include file
 
     Desc:     This file conditionally includes various implementation
               specific files.
 
     File:     ss_dep.h
 
     Sid:      ss_dep.h@@/main/2 - Mon Apr  5 18:01:14 2010
 
     Prg:      kp
 
*********************************************************************21*/


#ifndef __SSDEPH__
#define __SSDEPH__

#ifdef __cplusplus
extern "C" {
#endif


#ifdef SS_MT
#ifndef _POSIX_C_SOURCE
#define _POSIX_C_SOURCE 199309L
#endif
#include <pthread.h>
#include <semaphore.h>
#include <stdio.h>
#include "cm5.h"
#include "mt_ss.h"
  /* ss003.13: addition */
#include <string.h>
#else /* not SS_MT */

#ifdef SS_PS
#include <psos.h>
#include "cm5.h"
#include "ps.h"
#include "ps_ss.h"
  /* ss009.13: addition */
#include <string.h>
#else /* not SS_PS */

#ifdef SS_VW
  /* ss002.13: addition */
#include <string.h>
#include "vw_ss.h"
#else /* not SS_VW */

#ifdef NS
#ifdef FAR
#undef FAR
#endif
#ifdef NEAR
#undef NEAR
#endif
#ifdef NU 
#include <stdio.h>
#include "windows.h"
#include "winbase.h"
#endif /* NU */

#ifdef NK
#include "ntddk.h"
#endif /* NK */
#include "ns_err.h"
#include "ns_task.h"
#include "ns_timer.h"
#include "ns_gen.h"
#else /* not NS */

#ifdef SS_SK
#include "sk_ss.h"
#else /* not SS_SK */

#error "Specify an implementation"

#endif /* SS_SK */
#endif /* NS */
#endif /* SS_VW */
#endif /* SS_PS */
#endif /* SS_MT */


#ifdef __cplusplus
}
#endif

#endif  /*  __SSDEPH__  */


  
/********************************************************************30**

         End of file:     ss_dep.h@@/main/2 - Mon Apr  5 18:01:14 2010

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
1.1          ---      kp   1. initial release
  
1.2          ---      kp   1. Added SS_SK includes

1.3          ---      kp   1. Added SS_MT and SS_PS includes
             ---      jn   2. String.h included
             ---      jn   3. String.h included for MT_SS
             ---      jn   3. String.h included for SS_PS 
/main/4      ---      rp   1. SSI enhancements for Multi-core architecture
                              support
*********************************************************************91*/