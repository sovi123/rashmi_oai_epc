static const char* RLOG_MODULE_NAME="SON";
static int RLOG_FILE_ID=255;
static int RLOG_MODULE_ID=256;



typedef void *Ptr;
typedef unsigned char Bool;


typedef char S8;




typedef unsigned char U8;

typedef short S16;
typedef unsigned short U16;


typedef long S32;
typedef unsigned long U32;





__extension__ typedef long long S64;
__extension__ typedef unsigned long long U64;
typedef float F32;
typedef double F64;
typedef void Void;



typedef S8 (*PFS8) (void );
typedef S16 (*PFS16) (void );
typedef S32 (*PFS32) (void );
typedef Void (*PFVOID) (void );
typedef Void ( *PIF) (void );
typedef U32 MFTYPE;




typedef S8 *ARGTYPE;









typedef unsigned char __u_char;
typedef unsigned short int __u_short;
typedef unsigned int __u_int;
typedef unsigned long int __u_long;


typedef signed char __int8_t;
typedef unsigned char __uint8_t;
typedef signed short int __int16_t;
typedef unsigned short int __uint16_t;
typedef signed int __int32_t;
typedef unsigned int __uint32_t;




__extension__ typedef signed long long int __int64_t;
__extension__ typedef unsigned long long int __uint64_t;







__extension__ typedef long long int __quad_t;
__extension__ typedef unsigned long long int __u_quad_t;


__extension__ typedef __u_quad_t __dev_t;
__extension__ typedef unsigned int __uid_t;
__extension__ typedef unsigned int __gid_t;
__extension__ typedef unsigned long int __ino_t;
__extension__ typedef __u_quad_t __ino64_t;
__extension__ typedef unsigned int __mode_t;
__extension__ typedef unsigned int __nlink_t;
__extension__ typedef long int __off_t;
__extension__ typedef __quad_t __off64_t;
__extension__ typedef int __pid_t;
__extension__ typedef struct { int __val[2]; } __fsid_t;
__extension__ typedef long int __clock_t;
__extension__ typedef unsigned long int __rlim_t;
__extension__ typedef __u_quad_t __rlim64_t;
__extension__ typedef unsigned int __id_t;
__extension__ typedef long int __time_t;
__extension__ typedef unsigned int __useconds_t;
__extension__ typedef long int __suseconds_t;

__extension__ typedef int __daddr_t;
__extension__ typedef int __key_t;


__extension__ typedef int __clockid_t;


__extension__ typedef void * __timer_t;


__extension__ typedef long int __blksize_t;




__extension__ typedef long int __blkcnt_t;
__extension__ typedef __quad_t __blkcnt64_t;


__extension__ typedef unsigned long int __fsblkcnt_t;
__extension__ typedef __u_quad_t __fsblkcnt64_t;


__extension__ typedef unsigned long int __fsfilcnt_t;
__extension__ typedef __u_quad_t __fsfilcnt64_t;


__extension__ typedef int __fsword_t;

__extension__ typedef int __ssize_t;


__extension__ typedef long int __syscall_slong_t;

__extension__ typedef unsigned long int __syscall_ulong_t;



typedef __off64_t __loff_t;
typedef __quad_t *__qaddr_t;
typedef char *__caddr_t;


__extension__ typedef int __intptr_t;


__extension__ typedef unsigned int __socklen_t;






static __inline unsigned int
__bswap_32 (unsigned int __bsx)
{
  return __builtin_bswap32 (__bsx);
}
static __inline __uint64_t
__bswap_64 (__uint64_t __bsx)
{
  return __builtin_bswap64 (__bsx);
}
typedef unsigned int size_t;







typedef __time_t time_t;



struct timespec
  {
    __time_t tv_sec;
    __syscall_slong_t tv_nsec;
  };


typedef __pid_t pid_t;





struct sched_param
  {
    int __sched_priority;
  };





extern int clone (int (*__fn) (void *__arg), void *__child_stack,
    int __flags, void *__arg, ...) __attribute__ ((__nothrow__ , __leaf__));


extern int unshare (int __flags) __attribute__ ((__nothrow__ , __leaf__));


extern int sched_getcpu (void) __attribute__ ((__nothrow__ , __leaf__));


extern int setns (int __fd, int __nstype) __attribute__ ((__nothrow__ , __leaf__));











struct __sched_param
  {
    int __sched_priority;
  };
typedef unsigned long int __cpu_mask;






typedef struct
{
  __cpu_mask __bits[1024 / (8 * sizeof (__cpu_mask))];
} cpu_set_t;


extern int __sched_cpucount (size_t __setsize, const cpu_set_t *__setp)
  __attribute__ ((__nothrow__ , __leaf__));
extern cpu_set_t *__sched_cpualloc (size_t __count) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));
extern void __sched_cpufree (cpu_set_t *__set) __attribute__ ((__nothrow__ , __leaf__));









extern int sched_setparam (__pid_t __pid, const struct sched_param *__param)
     __attribute__ ((__nothrow__ , __leaf__));


extern int sched_getparam (__pid_t __pid, struct sched_param *__param) __attribute__ ((__nothrow__ , __leaf__));


extern int sched_setscheduler (__pid_t __pid, int __policy,
          const struct sched_param *__param) __attribute__ ((__nothrow__ , __leaf__));


extern int sched_getscheduler (__pid_t __pid) __attribute__ ((__nothrow__ , __leaf__));


extern int sched_yield (void) __attribute__ ((__nothrow__ , __leaf__));


extern int sched_get_priority_max (int __algorithm) __attribute__ ((__nothrow__ , __leaf__));


extern int sched_get_priority_min (int __algorithm) __attribute__ ((__nothrow__ , __leaf__));


extern int sched_rr_get_interval (__pid_t __pid, struct timespec *__t) __attribute__ ((__nothrow__ , __leaf__));
extern int sched_setaffinity (__pid_t __pid, size_t __cpusetsize,
         const cpu_set_t *__cpuset) __attribute__ ((__nothrow__ , __leaf__));


extern int sched_getaffinity (__pid_t __pid, size_t __cpusetsize,
         cpu_set_t *__cpuset) __attribute__ ((__nothrow__ , __leaf__));














struct timeval
  {
    __time_t tv_sec;
    __suseconds_t tv_usec;
  };
struct timex
{
  unsigned int modes;
  __syscall_slong_t offset;
  __syscall_slong_t freq;
  __syscall_slong_t maxerror;
  __syscall_slong_t esterror;
  int status;
  __syscall_slong_t constant;
  __syscall_slong_t precision;
  __syscall_slong_t tolerance;
  struct timeval time;
  __syscall_slong_t tick;
  __syscall_slong_t ppsfreq;
  __syscall_slong_t jitter;
  int shift;
  __syscall_slong_t stabil;
  __syscall_slong_t jitcnt;
  __syscall_slong_t calcnt;
  __syscall_slong_t errcnt;
  __syscall_slong_t stbcnt;

  int tai;


  int :32; int :32; int :32; int :32;
  int :32; int :32; int :32; int :32;
  int :32; int :32; int :32;
};




extern int clock_adjtime (__clockid_t __clock_id, struct timex *__utx) __attribute__ ((__nothrow__ , __leaf__));




typedef __clock_t clock_t;



typedef __clockid_t clockid_t;
typedef __timer_t timer_t;


struct tm
{
  int tm_sec;
  int tm_min;
  int tm_hour;
  int tm_mday;
  int tm_mon;
  int tm_year;
  int tm_wday;
  int tm_yday;
  int tm_isdst;


  long int tm_gmtoff;
  const char *tm_zone;




};








struct itimerspec
  {
    struct timespec it_interval;
    struct timespec it_value;
  };


struct sigevent;



extern clock_t clock (void) __attribute__ ((__nothrow__ , __leaf__));


extern time_t time (time_t *__timer) __attribute__ ((__nothrow__ , __leaf__));


extern double difftime (time_t __time1, time_t __time0)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern time_t mktime (struct tm *__tp) __attribute__ ((__nothrow__ , __leaf__));





extern size_t strftime (char *__restrict __s, size_t __maxsize,
   const char *__restrict __format,
   const struct tm *__restrict __tp) __attribute__ ((__nothrow__ , __leaf__));





extern char *strptime (const char *__restrict __s,
         const char *__restrict __fmt, struct tm *__tp)
     __attribute__ ((__nothrow__ , __leaf__));





typedef struct __locale_struct
{

  struct __locale_data *__locales[13];


  const unsigned short int *__ctype_b;
  const int *__ctype_tolower;
  const int *__ctype_toupper;


  const char *__names[13];
} *__locale_t;


typedef __locale_t locale_t;

extern size_t strftime_l (char *__restrict __s, size_t __maxsize,
     const char *__restrict __format,
     const struct tm *__restrict __tp,
     __locale_t __loc) __attribute__ ((__nothrow__ , __leaf__));



extern char *strptime_l (const char *__restrict __s,
    const char *__restrict __fmt, struct tm *__tp,
    __locale_t __loc) __attribute__ ((__nothrow__ , __leaf__));






extern struct tm *gmtime (const time_t *__timer) __attribute__ ((__nothrow__ , __leaf__));



extern struct tm *localtime (const time_t *__timer) __attribute__ ((__nothrow__ , __leaf__));





extern struct tm *gmtime_r (const time_t *__restrict __timer,
       struct tm *__restrict __tp) __attribute__ ((__nothrow__ , __leaf__));



extern struct tm *localtime_r (const time_t *__restrict __timer,
          struct tm *__restrict __tp) __attribute__ ((__nothrow__ , __leaf__));





extern char *asctime (const struct tm *__tp) __attribute__ ((__nothrow__ , __leaf__));


extern char *ctime (const time_t *__timer) __attribute__ ((__nothrow__ , __leaf__));







extern char *asctime_r (const struct tm *__restrict __tp,
   char *__restrict __buf) __attribute__ ((__nothrow__ , __leaf__));


extern char *ctime_r (const time_t *__restrict __timer,
        char *__restrict __buf) __attribute__ ((__nothrow__ , __leaf__));




extern char *__tzname[2];
extern int __daylight;
extern long int __timezone;




extern char *tzname[2];



extern void tzset (void) __attribute__ ((__nothrow__ , __leaf__));



extern int daylight;
extern long int timezone;





extern int stime (const time_t *__when) __attribute__ ((__nothrow__ , __leaf__));
extern time_t timegm (struct tm *__tp) __attribute__ ((__nothrow__ , __leaf__));


extern time_t timelocal (struct tm *__tp) __attribute__ ((__nothrow__ , __leaf__));


extern int dysize (int __year) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern int nanosleep (const struct timespec *__requested_time,
        struct timespec *__remaining);



extern int clock_getres (clockid_t __clock_id, struct timespec *__res) __attribute__ ((__nothrow__ , __leaf__));


extern int clock_gettime (clockid_t __clock_id, struct timespec *__tp) __attribute__ ((__nothrow__ , __leaf__));


extern int clock_settime (clockid_t __clock_id, const struct timespec *__tp)
     __attribute__ ((__nothrow__ , __leaf__));






extern int clock_nanosleep (clockid_t __clock_id, int __flags,
       const struct timespec *__req,
       struct timespec *__rem);


extern int clock_getcpuclockid (pid_t __pid, clockid_t *__clock_id) __attribute__ ((__nothrow__ , __leaf__));




extern int timer_create (clockid_t __clock_id,
    struct sigevent *__restrict __evp,
    timer_t *__restrict __timerid) __attribute__ ((__nothrow__ , __leaf__));


extern int timer_delete (timer_t __timerid) __attribute__ ((__nothrow__ , __leaf__));


extern int timer_settime (timer_t __timerid, int __flags,
     const struct itimerspec *__restrict __value,
     struct itimerspec *__restrict __ovalue) __attribute__ ((__nothrow__ , __leaf__));


extern int timer_gettime (timer_t __timerid, struct itimerspec *__value)
     __attribute__ ((__nothrow__ , __leaf__));


extern int timer_getoverrun (timer_t __timerid) __attribute__ ((__nothrow__ , __leaf__));





extern int timespec_get (struct timespec *__ts, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern int getdate_err;
extern struct tm *getdate (const char *__string);
extern int getdate_r (const char *__restrict __string,
        struct tm *__restrict __resbufp);




typedef unsigned long int pthread_t;


union pthread_attr_t
{
  char __size[36];
  long int __align;
};

typedef union pthread_attr_t pthread_attr_t;
typedef struct __pthread_internal_slist
{
  struct __pthread_internal_slist *__next;
} __pthread_slist_t;





typedef union
{
  struct __pthread_mutex_s
  {
    int __lock;
    unsigned int __count;
    int __owner;





    int __kind;
    unsigned int __nusers;
    __extension__ union
    {
      struct
      {
 short __espins;
 short __elision;



      } __elision_data;
      __pthread_slist_t __list;
    };

  } __data;
  char __size[24];
  long int __align;
} pthread_mutex_t;

typedef union
{
  char __size[4];
  int __align;
} pthread_mutexattr_t;




typedef union
{
  struct
  {
    int __lock;
    unsigned int __futex;
    __extension__ unsigned long long int __total_seq;
    __extension__ unsigned long long int __wakeup_seq;
    __extension__ unsigned long long int __woken_seq;
    void *__mutex;
    unsigned int __nwaiters;
    unsigned int __broadcast_seq;
  } __data;
  char __size[48];
  __extension__ long long int __align;
} pthread_cond_t;

typedef union
{
  char __size[4];
  int __align;
} pthread_condattr_t;



typedef unsigned int pthread_key_t;



typedef int pthread_once_t;





typedef union
{
  struct
  {
    int __lock;
    unsigned int __nr_readers;
    unsigned int __readers_wakeup;
    unsigned int __writer_wakeup;
    unsigned int __nr_readers_queued;
    unsigned int __nr_writers_queued;


    unsigned char __flags;
    unsigned char __shared;
    signed char __rwelision;

    unsigned char __pad2;
    int __writer;
  } __data;

  char __size[32];
  long int __align;
} pthread_rwlock_t;

typedef union
{
  char __size[8];
  long int __align;
} pthread_rwlockattr_t;





typedef volatile int pthread_spinlock_t;




typedef union
{
  char __size[20];
  long int __align;
} pthread_barrier_t;

typedef union
{
  char __size[4];
  int __align;
} pthread_barrierattr_t;
typedef int __jmp_buf[6];



enum
{
  PTHREAD_CREATE_JOINABLE,

  PTHREAD_CREATE_DETACHED

};



enum
{
  PTHREAD_MUTEX_TIMED_NP,
  PTHREAD_MUTEX_RECURSIVE_NP,
  PTHREAD_MUTEX_ERRORCHECK_NP,
  PTHREAD_MUTEX_ADAPTIVE_NP

  ,
  PTHREAD_MUTEX_NORMAL = PTHREAD_MUTEX_TIMED_NP,
  PTHREAD_MUTEX_RECURSIVE = PTHREAD_MUTEX_RECURSIVE_NP,
  PTHREAD_MUTEX_ERRORCHECK = PTHREAD_MUTEX_ERRORCHECK_NP,
  PTHREAD_MUTEX_DEFAULT = PTHREAD_MUTEX_NORMAL



  , PTHREAD_MUTEX_FAST_NP = PTHREAD_MUTEX_TIMED_NP

};




enum
{
  PTHREAD_MUTEX_STALLED,
  PTHREAD_MUTEX_STALLED_NP = PTHREAD_MUTEX_STALLED,
  PTHREAD_MUTEX_ROBUST,
  PTHREAD_MUTEX_ROBUST_NP = PTHREAD_MUTEX_ROBUST
};





enum
{
  PTHREAD_PRIO_NONE,
  PTHREAD_PRIO_INHERIT,
  PTHREAD_PRIO_PROTECT
};
enum
{
  PTHREAD_RWLOCK_PREFER_READER_NP,
  PTHREAD_RWLOCK_PREFER_WRITER_NP,
  PTHREAD_RWLOCK_PREFER_WRITER_NONRECURSIVE_NP,
  PTHREAD_RWLOCK_DEFAULT_NP = PTHREAD_RWLOCK_PREFER_READER_NP
};
enum
{
  PTHREAD_INHERIT_SCHED,

  PTHREAD_EXPLICIT_SCHED

};



enum
{
  PTHREAD_SCOPE_SYSTEM,

  PTHREAD_SCOPE_PROCESS

};



enum
{
  PTHREAD_PROCESS_PRIVATE,

  PTHREAD_PROCESS_SHARED

};
struct _pthread_cleanup_buffer
{
  void (*__routine) (void *);
  void *__arg;
  int __canceltype;
  struct _pthread_cleanup_buffer *__prev;
};


enum
{
  PTHREAD_CANCEL_ENABLE,

  PTHREAD_CANCEL_DISABLE

};
enum
{
  PTHREAD_CANCEL_DEFERRED,

  PTHREAD_CANCEL_ASYNCHRONOUS

};





extern int pthread_create (pthread_t *__restrict __newthread,
      const pthread_attr_t *__restrict __attr,
      void *(*__start_routine) (void *),
      void *__restrict __arg) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 3)));





extern void pthread_exit (void *__retval) __attribute__ ((__noreturn__));







extern int pthread_join (pthread_t __th, void **__thread_return);




extern int pthread_tryjoin_np (pthread_t __th, void **__thread_return) __attribute__ ((__nothrow__ , __leaf__));







extern int pthread_timedjoin_np (pthread_t __th, void **__thread_return,
     const struct timespec *__abstime);






extern int pthread_detach (pthread_t __th) __attribute__ ((__nothrow__ , __leaf__));



extern pthread_t pthread_self (void) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern int pthread_equal (pthread_t __thread1, pthread_t __thread2)
  __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));







extern int pthread_attr_init (pthread_attr_t *__attr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_attr_destroy (pthread_attr_t *__attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_attr_getdetachstate (const pthread_attr_t *__attr,
     int *__detachstate)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_setdetachstate (pthread_attr_t *__attr,
     int __detachstate)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



extern int pthread_attr_getguardsize (const pthread_attr_t *__attr,
          size_t *__guardsize)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_setguardsize (pthread_attr_t *__attr,
          size_t __guardsize)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



extern int pthread_attr_getschedparam (const pthread_attr_t *__restrict __attr,
           struct sched_param *__restrict __param)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_setschedparam (pthread_attr_t *__restrict __attr,
           const struct sched_param *__restrict
           __param) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_getschedpolicy (const pthread_attr_t *__restrict
     __attr, int *__restrict __policy)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_setschedpolicy (pthread_attr_t *__attr, int __policy)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_attr_getinheritsched (const pthread_attr_t *__restrict
      __attr, int *__restrict __inherit)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_setinheritsched (pthread_attr_t *__attr,
      int __inherit)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



extern int pthread_attr_getscope (const pthread_attr_t *__restrict __attr,
      int *__restrict __scope)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_setscope (pthread_attr_t *__attr, int __scope)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_attr_getstackaddr (const pthread_attr_t *__restrict
          __attr, void **__restrict __stackaddr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2))) __attribute__ ((__deprecated__));





extern int pthread_attr_setstackaddr (pthread_attr_t *__attr,
          void *__stackaddr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__deprecated__));


extern int pthread_attr_getstacksize (const pthread_attr_t *__restrict
          __attr, size_t *__restrict __stacksize)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));




extern int pthread_attr_setstacksize (pthread_attr_t *__attr,
          size_t __stacksize)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



extern int pthread_attr_getstack (const pthread_attr_t *__restrict __attr,
      void **__restrict __stackaddr,
      size_t *__restrict __stacksize)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2, 3)));




extern int pthread_attr_setstack (pthread_attr_t *__attr, void *__stackaddr,
      size_t __stacksize) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





extern int pthread_attr_setaffinity_np (pthread_attr_t *__attr,
     size_t __cpusetsize,
     const cpu_set_t *__cpuset)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 3)));



extern int pthread_attr_getaffinity_np (const pthread_attr_t *__attr,
     size_t __cpusetsize,
     cpu_set_t *__cpuset)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 3)));


extern int pthread_getattr_default_np (pthread_attr_t *__attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



extern int pthread_setattr_default_np (const pthread_attr_t *__attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));




extern int pthread_getattr_np (pthread_t __th, pthread_attr_t *__attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));







extern int pthread_setschedparam (pthread_t __target_thread, int __policy,
      const struct sched_param *__param)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3)));


extern int pthread_getschedparam (pthread_t __target_thread,
      int *__restrict __policy,
      struct sched_param *__restrict __param)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));


extern int pthread_setschedprio (pthread_t __target_thread, int __prio)
     __attribute__ ((__nothrow__ , __leaf__));




extern int pthread_getname_np (pthread_t __target_thread, char *__buf,
          size_t __buflen)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));


extern int pthread_setname_np (pthread_t __target_thread, const char *__name)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));





extern int pthread_getconcurrency (void) __attribute__ ((__nothrow__ , __leaf__));


extern int pthread_setconcurrency (int __level) __attribute__ ((__nothrow__ , __leaf__));







extern int pthread_yield (void) __attribute__ ((__nothrow__ , __leaf__));




extern int pthread_setaffinity_np (pthread_t __th, size_t __cpusetsize,
       const cpu_set_t *__cpuset)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3)));


extern int pthread_getaffinity_np (pthread_t __th, size_t __cpusetsize,
       cpu_set_t *__cpuset)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3)));
extern int pthread_once (pthread_once_t *__once_control,
    void (*__init_routine) (void)) __attribute__ ((__nonnull__ (1, 2)));
extern int pthread_setcancelstate (int __state, int *__oldstate);



extern int pthread_setcanceltype (int __type, int *__oldtype);


extern int pthread_cancel (pthread_t __th);




extern void pthread_testcancel (void);




typedef struct
{
  struct
  {
    __jmp_buf __cancel_jmp_buf;
    int __mask_was_saved;
  } __cancel_jmp_buf[1];
  void *__pad[4];
} __pthread_unwind_buf_t __attribute__ ((__aligned__));
struct __pthread_cleanup_frame
{
  void (*__cancel_routine) (void *);
  void *__cancel_arg;
  int __do_it;
  int __cancel_type;
};
extern void __pthread_register_cancel (__pthread_unwind_buf_t *__buf)
     __attribute__ ((__regparm__ (1)));
extern void __pthread_unregister_cancel (__pthread_unwind_buf_t *__buf)
  __attribute__ ((__regparm__ (1)));
extern void __pthread_register_cancel_defer (__pthread_unwind_buf_t *__buf)
     __attribute__ ((__regparm__ (1)));
extern void __pthread_unregister_cancel_restore (__pthread_unwind_buf_t *__buf)
  __attribute__ ((__regparm__ (1)));



extern void __pthread_unwind_next (__pthread_unwind_buf_t *__buf)
     __attribute__ ((__regparm__ (1))) __attribute__ ((__noreturn__))

     __attribute__ ((__weak__))

     ;



struct __jmp_buf_tag;
extern int __sigsetjmp (struct __jmp_buf_tag *__env, int __savemask) __attribute__ ((__nothrow__));





extern int pthread_mutex_init (pthread_mutex_t *__mutex,
          const pthread_mutexattr_t *__mutexattr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_mutex_destroy (pthread_mutex_t *__mutex)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_mutex_trylock (pthread_mutex_t *__mutex)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_mutex_lock (pthread_mutex_t *__mutex)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));



extern int pthread_mutex_timedlock (pthread_mutex_t *__restrict __mutex,
        const struct timespec *__restrict
        __abstime) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));



extern int pthread_mutex_unlock (pthread_mutex_t *__mutex)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));



extern int pthread_mutex_getprioceiling (const pthread_mutex_t *
      __restrict __mutex,
      int *__restrict __prioceiling)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));



extern int pthread_mutex_setprioceiling (pthread_mutex_t *__restrict __mutex,
      int __prioceiling,
      int *__restrict __old_ceiling)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 3)));




extern int pthread_mutex_consistent (pthread_mutex_t *__mutex)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

extern int pthread_mutex_consistent_np (pthread_mutex_t *__mutex)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern int pthread_mutexattr_init (pthread_mutexattr_t *__attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_mutexattr_destroy (pthread_mutexattr_t *__attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_mutexattr_getpshared (const pthread_mutexattr_t *
      __restrict __attr,
      int *__restrict __pshared)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_mutexattr_setpshared (pthread_mutexattr_t *__attr,
      int __pshared)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



extern int pthread_mutexattr_gettype (const pthread_mutexattr_t *__restrict
          __attr, int *__restrict __kind)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));




extern int pthread_mutexattr_settype (pthread_mutexattr_t *__attr, int __kind)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



extern int pthread_mutexattr_getprotocol (const pthread_mutexattr_t *
       __restrict __attr,
       int *__restrict __protocol)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));



extern int pthread_mutexattr_setprotocol (pthread_mutexattr_t *__attr,
       int __protocol)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_mutexattr_getprioceiling (const pthread_mutexattr_t *
          __restrict __attr,
          int *__restrict __prioceiling)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_mutexattr_setprioceiling (pthread_mutexattr_t *__attr,
          int __prioceiling)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



extern int pthread_mutexattr_getrobust (const pthread_mutexattr_t *__attr,
     int *__robustness)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

extern int pthread_mutexattr_getrobust_np (const pthread_mutexattr_t *__attr,
        int *__robustness)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));



extern int pthread_mutexattr_setrobust (pthread_mutexattr_t *__attr,
     int __robustness)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

extern int pthread_mutexattr_setrobust_np (pthread_mutexattr_t *__attr,
        int __robustness)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern int pthread_rwlock_init (pthread_rwlock_t *__restrict __rwlock,
    const pthread_rwlockattr_t *__restrict
    __attr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_rwlock_destroy (pthread_rwlock_t *__rwlock)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_rwlock_rdlock (pthread_rwlock_t *__rwlock)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_rwlock_tryrdlock (pthread_rwlock_t *__rwlock)
  __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));



extern int pthread_rwlock_timedrdlock (pthread_rwlock_t *__restrict __rwlock,
           const struct timespec *__restrict
           __abstime) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));



extern int pthread_rwlock_wrlock (pthread_rwlock_t *__rwlock)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_rwlock_trywrlock (pthread_rwlock_t *__rwlock)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));



extern int pthread_rwlock_timedwrlock (pthread_rwlock_t *__restrict __rwlock,
           const struct timespec *__restrict
           __abstime) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));



extern int pthread_rwlock_unlock (pthread_rwlock_t *__rwlock)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));





extern int pthread_rwlockattr_init (pthread_rwlockattr_t *__attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_rwlockattr_destroy (pthread_rwlockattr_t *__attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_rwlockattr_getpshared (const pthread_rwlockattr_t *
       __restrict __attr,
       int *__restrict __pshared)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_rwlockattr_setpshared (pthread_rwlockattr_t *__attr,
       int __pshared)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_rwlockattr_getkind_np (const pthread_rwlockattr_t *
       __restrict __attr,
       int *__restrict __pref)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_rwlockattr_setkind_np (pthread_rwlockattr_t *__attr,
       int __pref) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));







extern int pthread_cond_init (pthread_cond_t *__restrict __cond,
         const pthread_condattr_t *__restrict __cond_attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_cond_destroy (pthread_cond_t *__cond)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_cond_signal (pthread_cond_t *__cond)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_cond_broadcast (pthread_cond_t *__cond)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));






extern int pthread_cond_wait (pthread_cond_t *__restrict __cond,
         pthread_mutex_t *__restrict __mutex)
     __attribute__ ((__nonnull__ (1, 2)));
extern int pthread_cond_timedwait (pthread_cond_t *__restrict __cond,
       pthread_mutex_t *__restrict __mutex,
       const struct timespec *__restrict __abstime)
     __attribute__ ((__nonnull__ (1, 2, 3)));




extern int pthread_condattr_init (pthread_condattr_t *__attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_condattr_destroy (pthread_condattr_t *__attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_condattr_getpshared (const pthread_condattr_t *
     __restrict __attr,
     int *__restrict __pshared)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_condattr_setpshared (pthread_condattr_t *__attr,
     int __pshared) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



extern int pthread_condattr_getclock (const pthread_condattr_t *
          __restrict __attr,
          __clockid_t *__restrict __clock_id)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_condattr_setclock (pthread_condattr_t *__attr,
          __clockid_t __clock_id)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern int pthread_spin_init (pthread_spinlock_t *__lock, int __pshared)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_spin_destroy (pthread_spinlock_t *__lock)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_spin_lock (pthread_spinlock_t *__lock)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_spin_trylock (pthread_spinlock_t *__lock)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_spin_unlock (pthread_spinlock_t *__lock)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));






extern int pthread_barrier_init (pthread_barrier_t *__restrict __barrier,
     const pthread_barrierattr_t *__restrict
     __attr, unsigned int __count)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_barrier_destroy (pthread_barrier_t *__barrier)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_barrier_wait (pthread_barrier_t *__barrier)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));



extern int pthread_barrierattr_init (pthread_barrierattr_t *__attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_barrierattr_destroy (pthread_barrierattr_t *__attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_barrierattr_getpshared (const pthread_barrierattr_t *
        __restrict __attr,
        int *__restrict __pshared)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_barrierattr_setpshared (pthread_barrierattr_t *__attr,
        int __pshared)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern int pthread_key_create (pthread_key_t *__key,
          void (*__destr_function) (void *))
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_key_delete (pthread_key_t __key) __attribute__ ((__nothrow__ , __leaf__));


extern void *pthread_getspecific (pthread_key_t __key) __attribute__ ((__nothrow__ , __leaf__));


extern int pthread_setspecific (pthread_key_t __key,
    const void *__pointer) __attribute__ ((__nothrow__ , __leaf__)) ;




extern int pthread_getcpuclockid (pthread_t __thread_id,
      __clockid_t *__clock_id)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
extern int pthread_atfork (void (*__prepare) (void),
      void (*__parent) (void),
      void (*__child) (void)) __attribute__ ((__nothrow__ , __leaf__));




extern __inline __attribute__ ((__gnu_inline__)) int
__attribute__ ((__nothrow__ , __leaf__)) pthread_equal (pthread_t __thread1, pthread_t __thread2)
{
  return __thread1 == __thread2;
}









typedef __u_char u_char;
typedef __u_short u_short;
typedef __u_int u_int;
typedef __u_long u_long;
typedef __quad_t quad_t;
typedef __u_quad_t u_quad_t;
typedef __fsid_t fsid_t;




typedef __loff_t loff_t;



typedef __ino_t ino_t;






typedef __ino64_t ino64_t;




typedef __dev_t dev_t;




typedef __gid_t gid_t;




typedef __mode_t mode_t;




typedef __nlink_t nlink_t;




typedef __uid_t uid_t;





typedef __off_t off_t;






typedef __off64_t off64_t;
typedef __id_t id_t;




typedef __ssize_t ssize_t;





typedef __daddr_t daddr_t;
typedef __caddr_t caddr_t;





typedef __key_t key_t;
typedef __useconds_t useconds_t;



typedef __suseconds_t suseconds_t;








typedef unsigned long int ulong;
typedef unsigned short int ushort;
typedef unsigned int uint;
typedef int int8_t __attribute__ ((__mode__ (__QI__)));
typedef int int16_t __attribute__ ((__mode__ (__HI__)));
typedef int int32_t __attribute__ ((__mode__ (__SI__)));
typedef int int64_t __attribute__ ((__mode__ (__DI__)));


typedef unsigned int u_int8_t __attribute__ ((__mode__ (__QI__)));
typedef unsigned int u_int16_t __attribute__ ((__mode__ (__HI__)));
typedef unsigned int u_int32_t __attribute__ ((__mode__ (__SI__)));
typedef unsigned int u_int64_t __attribute__ ((__mode__ (__DI__)));

typedef int register_t __attribute__ ((__mode__ (__word__)));


typedef int __sig_atomic_t;




typedef struct
  {
    unsigned long int __val[(1024 / (8 * sizeof (unsigned long int)))];
  } __sigset_t;



typedef __sigset_t sigset_t;
typedef long int __fd_mask;
typedef struct
  {



    __fd_mask fds_bits[1024 / (8 * (int) sizeof (__fd_mask))];





  } fd_set;






typedef __fd_mask fd_mask;

extern int select (int __nfds, fd_set *__restrict __readfds,
     fd_set *__restrict __writefds,
     fd_set *__restrict __exceptfds,
     struct timeval *__restrict __timeout);
extern int pselect (int __nfds, fd_set *__restrict __readfds,
      fd_set *__restrict __writefds,
      fd_set *__restrict __exceptfds,
      const struct timespec *__restrict __timeout,
      const __sigset_t *__restrict __sigmask);





extern long int __fdelt_chk (long int __d);
extern long int __fdelt_warn (long int __d)
  __attribute__((__warning__ ("bit outside of fd_set selected")));







__extension__
extern unsigned int gnu_dev_major (unsigned long long int __dev)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
__extension__
extern unsigned int gnu_dev_minor (unsigned long long int __dev)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
__extension__
extern unsigned long long int gnu_dev_makedev (unsigned int __major,
            unsigned int __minor)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


__extension__ extern __inline __attribute__ ((__gnu_inline__)) __attribute__ ((__const__)) unsigned int
__attribute__ ((__nothrow__ , __leaf__)) gnu_dev_major (unsigned long long int __dev)
{
  return ((__dev >> 8) & 0xfff) | ((unsigned int) (__dev >> 32) & ~0xfff);
}

__extension__ extern __inline __attribute__ ((__gnu_inline__)) __attribute__ ((__const__)) unsigned int
__attribute__ ((__nothrow__ , __leaf__)) gnu_dev_minor (unsigned long long int __dev)
{
  return (__dev & 0xff) | ((unsigned int) (__dev >> 12) & ~0xff);
}

__extension__ extern __inline __attribute__ ((__gnu_inline__)) __attribute__ ((__const__)) unsigned long long int
__attribute__ ((__nothrow__ , __leaf__)) gnu_dev_makedev (unsigned int __major, unsigned int __minor)
{
  return ((__minor & 0xff) | ((__major & 0xfff) << 8)
   | (((unsigned long long int) (__minor & ~0xff)) << 12)
   | (((unsigned long long int) (__major & ~0xfff)) << 32));
}







typedef __blksize_t blksize_t;






typedef __blkcnt_t blkcnt_t;



typedef __fsblkcnt_t fsblkcnt_t;



typedef __fsfilcnt_t fsfilcnt_t;
typedef __blkcnt64_t blkcnt64_t;
typedef __fsblkcnt64_t fsblkcnt64_t;
typedef __fsfilcnt64_t fsfilcnt64_t;







typedef union
{
  char __size[16];
  long int __align;
} sem_t;






extern int sem_init (sem_t *__sem, int __pshared, unsigned int __value)
     __attribute__ ((__nothrow__ , __leaf__));

extern int sem_destroy (sem_t *__sem) __attribute__ ((__nothrow__ , __leaf__));


extern sem_t *sem_open (const char *__name, int __oflag, ...) __attribute__ ((__nothrow__ , __leaf__));


extern int sem_close (sem_t *__sem) __attribute__ ((__nothrow__ , __leaf__));


extern int sem_unlink (const char *__name) __attribute__ ((__nothrow__ , __leaf__));





extern int sem_wait (sem_t *__sem);






extern int sem_timedwait (sem_t *__restrict __sem,
     const struct timespec *__restrict __abstime);



extern int sem_trywait (sem_t *__sem) __attribute__ ((__nothrow__));


extern int sem_post (sem_t *__sem) __attribute__ ((__nothrow__));


extern int sem_getvalue (sem_t *__restrict __sem, int *__restrict __sval)
     __attribute__ ((__nothrow__ , __leaf__));







struct _IO_FILE;



typedef struct _IO_FILE FILE;





typedef struct _IO_FILE __FILE;




typedef struct
{
  int __count;
  union
  {

    unsigned int __wch;



    char __wchb[4];
  } __value;
} __mbstate_t;
typedef struct
{
  __off_t __pos;
  __mbstate_t __state;
} _G_fpos_t;
typedef struct
{
  __off64_t __pos;
  __mbstate_t __state;
} _G_fpos64_t;
typedef __builtin_va_list __gnuc_va_list;
struct _IO_jump_t; struct _IO_FILE;





typedef void _IO_lock_t;





struct _IO_marker {
  struct _IO_marker *_next;
  struct _IO_FILE *_sbuf;



  int _pos;
};


enum __codecvt_result
{
  __codecvt_ok,
  __codecvt_partial,
  __codecvt_error,
  __codecvt_noconv
};
struct _IO_FILE {
  int _flags;




  char* _IO_read_ptr;
  char* _IO_read_end;
  char* _IO_read_base;
  char* _IO_write_base;
  char* _IO_write_ptr;
  char* _IO_write_end;
  char* _IO_buf_base;
  char* _IO_buf_end;

  char *_IO_save_base;
  char *_IO_backup_base;
  char *_IO_save_end;

  struct _IO_marker *_markers;

  struct _IO_FILE *_chain;

  int _fileno;



  int _flags2;

  __off_t _old_offset;



  unsigned short _cur_column;
  signed char _vtable_offset;
  char _shortbuf[1];



  _IO_lock_t *_lock;
  __off64_t _offset;







  void *__pad1;
  void *__pad2;
  void *__pad3;
  void *__pad4;

  size_t __pad5;
  int _mode;

  char _unused2[15 * sizeof (int) - 4 * sizeof (void *) - sizeof (size_t)];

};


typedef struct _IO_FILE _IO_FILE;


struct _IO_FILE_plus;

extern struct _IO_FILE_plus _IO_2_1_stdin_;
extern struct _IO_FILE_plus _IO_2_1_stdout_;
extern struct _IO_FILE_plus _IO_2_1_stderr_;
typedef __ssize_t __io_read_fn (void *__cookie, char *__buf, size_t __nbytes);







typedef __ssize_t __io_write_fn (void *__cookie, const char *__buf,
     size_t __n);







typedef int __io_seek_fn (void *__cookie, __off64_t *__pos, int __w);


typedef int __io_close_fn (void *__cookie);




typedef __io_read_fn cookie_read_function_t;
typedef __io_write_fn cookie_write_function_t;
typedef __io_seek_fn cookie_seek_function_t;
typedef __io_close_fn cookie_close_function_t;


typedef struct
{
  __io_read_fn *read;
  __io_write_fn *write;
  __io_seek_fn *seek;
  __io_close_fn *close;
} _IO_cookie_io_functions_t;
typedef _IO_cookie_io_functions_t cookie_io_functions_t;

struct _IO_cookie_file;


extern void _IO_cookie_init (struct _IO_cookie_file *__cfile, int __read_write,
        void *__cookie, _IO_cookie_io_functions_t __fns);







extern int __underflow (_IO_FILE *);
extern int __uflow (_IO_FILE *);
extern int __overflow (_IO_FILE *, int);
extern int _IO_getc (_IO_FILE *__fp);
extern int _IO_putc (int __c, _IO_FILE *__fp);
extern int _IO_feof (_IO_FILE *__fp) __attribute__ ((__nothrow__ , __leaf__));
extern int _IO_ferror (_IO_FILE *__fp) __attribute__ ((__nothrow__ , __leaf__));

extern int _IO_peekc_locked (_IO_FILE *__fp);





extern void _IO_flockfile (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
extern void _IO_funlockfile (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
extern int _IO_ftrylockfile (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
extern int _IO_vfscanf (_IO_FILE * __restrict, const char * __restrict,
   __gnuc_va_list, int *__restrict);
extern int _IO_vfprintf (_IO_FILE *__restrict, const char *__restrict,
    __gnuc_va_list);
extern __ssize_t _IO_padn (_IO_FILE *, int, __ssize_t);
extern size_t _IO_sgetn (_IO_FILE *, void *, size_t);

extern __off64_t _IO_seekoff (_IO_FILE *, __off64_t, int, int);
extern __off64_t _IO_seekpos (_IO_FILE *, __off64_t, int);

extern void _IO_free_backup_area (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));




typedef __gnuc_va_list va_list;


typedef _G_fpos_t fpos_t;





typedef _G_fpos64_t fpos64_t;



extern struct _IO_FILE *stdin;
extern struct _IO_FILE *stdout;
extern struct _IO_FILE *stderr;







extern int remove (const char *__filename) __attribute__ ((__nothrow__ , __leaf__));

extern int rename (const char *__old, const char *__new) __attribute__ ((__nothrow__ , __leaf__));




extern int renameat (int __oldfd, const char *__old, int __newfd,
       const char *__new) __attribute__ ((__nothrow__ , __leaf__));








extern FILE *tmpfile (void) __attribute__ ((__warn_unused_result__));
extern FILE *tmpfile64 (void) __attribute__ ((__warn_unused_result__));



extern char *tmpnam (char *__s) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));





extern char *tmpnam_r (char *__s) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));
extern char *tempnam (const char *__dir, const char *__pfx)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__warn_unused_result__));








extern int fclose (FILE *__stream);




extern int fflush (FILE *__stream);

extern int fflush_unlocked (FILE *__stream);
extern int fcloseall (void);









extern FILE *fopen (const char *__restrict __filename,
      const char *__restrict __modes) __attribute__ ((__warn_unused_result__));




extern FILE *freopen (const char *__restrict __filename,
        const char *__restrict __modes,
        FILE *__restrict __stream) __attribute__ ((__warn_unused_result__));


extern FILE *fopen64 (const char *__restrict __filename,
        const char *__restrict __modes) __attribute__ ((__warn_unused_result__));
extern FILE *freopen64 (const char *__restrict __filename,
   const char *__restrict __modes,
   FILE *__restrict __stream) __attribute__ ((__warn_unused_result__));




extern FILE *fdopen (int __fd, const char *__modes) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));





extern FILE *fopencookie (void *__restrict __magic_cookie,
     const char *__restrict __modes,
     _IO_cookie_io_functions_t __io_funcs) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));




extern FILE *fmemopen (void *__s, size_t __len, const char *__modes)
  __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));




extern FILE *open_memstream (char **__bufloc, size_t *__sizeloc) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));






extern void setbuf (FILE *__restrict __stream, char *__restrict __buf) __attribute__ ((__nothrow__ , __leaf__));



extern int setvbuf (FILE *__restrict __stream, char *__restrict __buf,
      int __modes, size_t __n) __attribute__ ((__nothrow__ , __leaf__));





extern void setbuffer (FILE *__restrict __stream, char *__restrict __buf,
         size_t __size) __attribute__ ((__nothrow__ , __leaf__));


extern void setlinebuf (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));








extern int fprintf (FILE *__restrict __stream,
      const char *__restrict __format, ...);




extern int printf (const char *__restrict __format, ...);

extern int sprintf (char *__restrict __s,
      const char *__restrict __format, ...) __attribute__ ((__nothrow__));





extern int vfprintf (FILE *__restrict __s, const char *__restrict __format,
       __gnuc_va_list __arg);




extern int vprintf (const char *__restrict __format, __gnuc_va_list __arg);

extern int vsprintf (char *__restrict __s, const char *__restrict __format,
       __gnuc_va_list __arg) __attribute__ ((__nothrow__));





extern int snprintf (char *__restrict __s, size_t __maxlen,
       const char *__restrict __format, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 3, 4)));

extern int vsnprintf (char *__restrict __s, size_t __maxlen,
        const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 3, 0)));






extern int vasprintf (char **__restrict __ptr, const char *__restrict __f,
        __gnuc_va_list __arg)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 2, 0))) __attribute__ ((__warn_unused_result__));
extern int __asprintf (char **__restrict __ptr,
         const char *__restrict __fmt, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 2, 3))) __attribute__ ((__warn_unused_result__));
extern int asprintf (char **__restrict __ptr,
       const char *__restrict __fmt, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 2, 3))) __attribute__ ((__warn_unused_result__));




extern int vdprintf (int __fd, const char *__restrict __fmt,
       __gnuc_va_list __arg)
     __attribute__ ((__format__ (__printf__, 2, 0)));
extern int dprintf (int __fd, const char *__restrict __fmt, ...)
     __attribute__ ((__format__ (__printf__, 2, 3)));








extern int fscanf (FILE *__restrict __stream,
     const char *__restrict __format, ...) __attribute__ ((__warn_unused_result__));




extern int scanf (const char *__restrict __format, ...) __attribute__ ((__warn_unused_result__));

extern int sscanf (const char *__restrict __s,
     const char *__restrict __format, ...) __attribute__ ((__nothrow__ , __leaf__));








extern int vfscanf (FILE *__restrict __s, const char *__restrict __format,
      __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 2, 0))) __attribute__ ((__warn_unused_result__));





extern int vscanf (const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 1, 0))) __attribute__ ((__warn_unused_result__));


extern int vsscanf (const char *__restrict __s,
      const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__format__ (__scanf__, 2, 0)));









extern int fgetc (FILE *__stream);
extern int getc (FILE *__stream);





extern int getchar (void);

extern int getc_unlocked (FILE *__stream);
extern int getchar_unlocked (void);
extern int fgetc_unlocked (FILE *__stream);











extern int fputc (int __c, FILE *__stream);
extern int putc (int __c, FILE *__stream);





extern int putchar (int __c);

extern int fputc_unlocked (int __c, FILE *__stream);







extern int putc_unlocked (int __c, FILE *__stream);
extern int putchar_unlocked (int __c);






extern int getw (FILE *__stream);


extern int putw (int __w, FILE *__stream);








extern char *fgets (char *__restrict __s, int __n, FILE *__restrict __stream)
     __attribute__ ((__warn_unused_result__));

extern char *fgets_unlocked (char *__restrict __s, int __n,
        FILE *__restrict __stream) __attribute__ ((__warn_unused_result__));
extern __ssize_t __getdelim (char **__restrict __lineptr,
          size_t *__restrict __n, int __delimiter,
          FILE *__restrict __stream) __attribute__ ((__warn_unused_result__));
extern __ssize_t getdelim (char **__restrict __lineptr,
        size_t *__restrict __n, int __delimiter,
        FILE *__restrict __stream) __attribute__ ((__warn_unused_result__));







extern __ssize_t getline (char **__restrict __lineptr,
       size_t *__restrict __n,
       FILE *__restrict __stream) __attribute__ ((__warn_unused_result__));








extern int fputs (const char *__restrict __s, FILE *__restrict __stream);





extern int puts (const char *__s);






extern int ungetc (int __c, FILE *__stream);






extern size_t fread (void *__restrict __ptr, size_t __size,
       size_t __n, FILE *__restrict __stream) __attribute__ ((__warn_unused_result__));




extern size_t fwrite (const void *__restrict __ptr, size_t __size,
        size_t __n, FILE *__restrict __s);

extern int fputs_unlocked (const char *__restrict __s,
      FILE *__restrict __stream);
extern size_t fread_unlocked (void *__restrict __ptr, size_t __size,
         size_t __n, FILE *__restrict __stream) __attribute__ ((__warn_unused_result__));
extern size_t fwrite_unlocked (const void *__restrict __ptr, size_t __size,
          size_t __n, FILE *__restrict __stream);








extern int fseek (FILE *__stream, long int __off, int __whence);




extern long int ftell (FILE *__stream) __attribute__ ((__warn_unused_result__));




extern void rewind (FILE *__stream);

extern int fseeko (FILE *__stream, __off_t __off, int __whence);




extern __off_t ftello (FILE *__stream) __attribute__ ((__warn_unused_result__));






extern int fgetpos (FILE *__restrict __stream, fpos_t *__restrict __pos);




extern int fsetpos (FILE *__stream, const fpos_t *__pos);



extern int fseeko64 (FILE *__stream, __off64_t __off, int __whence);
extern __off64_t ftello64 (FILE *__stream) __attribute__ ((__warn_unused_result__));
extern int fgetpos64 (FILE *__restrict __stream, fpos64_t *__restrict __pos);
extern int fsetpos64 (FILE *__stream, const fpos64_t *__pos);




extern void clearerr (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));

extern int feof (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));

extern int ferror (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));




extern void clearerr_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));
extern int feof_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));
extern int ferror_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));








extern void perror (const char *__s);






extern int sys_nerr;
extern const char *const sys_errlist[];


extern int _sys_nerr;
extern const char *const _sys_errlist[];




extern int fileno (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));




extern int fileno_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));
extern FILE *popen (const char *__command, const char *__modes) __attribute__ ((__warn_unused_result__));





extern int pclose (FILE *__stream);





extern char *ctermid (char *__s) __attribute__ ((__nothrow__ , __leaf__));





extern char *cuserid (char *__s);




struct obstack;


extern int obstack_printf (struct obstack *__restrict __obstack,
      const char *__restrict __format, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 2, 3)));
extern int obstack_vprintf (struct obstack *__restrict __obstack,
       const char *__restrict __format,
       __gnuc_va_list __args)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 2, 0)));







extern void flockfile (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));



extern int ftrylockfile (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));


extern void funlockfile (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));
extern __inline __attribute__ ((__gnu_inline__)) int
getchar (void)
{
  return _IO_getc (stdin);
}




extern __inline __attribute__ ((__gnu_inline__)) int
fgetc_unlocked (FILE *__fp)
{
  return (__builtin_expect (((__fp)->_IO_read_ptr >= (__fp)->_IO_read_end), 0) ? __uflow (__fp) : *(unsigned char *) (__fp)->_IO_read_ptr++);
}





extern __inline __attribute__ ((__gnu_inline__)) int
getc_unlocked (FILE *__fp)
{
  return (__builtin_expect (((__fp)->_IO_read_ptr >= (__fp)->_IO_read_end), 0) ? __uflow (__fp) : *(unsigned char *) (__fp)->_IO_read_ptr++);
}


extern __inline __attribute__ ((__gnu_inline__)) int
getchar_unlocked (void)
{
  return (__builtin_expect (((stdin)->_IO_read_ptr >= (stdin)->_IO_read_end), 0) ? __uflow (stdin) : *(unsigned char *) (stdin)->_IO_read_ptr++);
}




extern __inline __attribute__ ((__gnu_inline__)) int
putchar (int __c)
{
  return _IO_putc (__c, stdout);
}




extern __inline __attribute__ ((__gnu_inline__)) int
fputc_unlocked (int __c, FILE *__stream)
{
  return (__builtin_expect (((__stream)->_IO_write_ptr >= (__stream)->_IO_write_end), 0) ? __overflow (__stream, (unsigned char) (__c)) : (unsigned char) (*(__stream)->_IO_write_ptr++ = (__c)));
}





extern __inline __attribute__ ((__gnu_inline__)) int
putc_unlocked (int __c, FILE *__stream)
{
  return (__builtin_expect (((__stream)->_IO_write_ptr >= (__stream)->_IO_write_end), 0) ? __overflow (__stream, (unsigned char) (__c)) : (unsigned char) (*(__stream)->_IO_write_ptr++ = (__c)));
}


extern __inline __attribute__ ((__gnu_inline__)) int
putchar_unlocked (int __c)
{
  return (__builtin_expect (((stdout)->_IO_write_ptr >= (stdout)->_IO_write_end), 0) ? __overflow (stdout, (unsigned char) (__c)) : (unsigned char) (*(stdout)->_IO_write_ptr++ = (__c)));
}





extern __inline __attribute__ ((__gnu_inline__)) __ssize_t
getline (char **__lineptr, size_t *__n, FILE *__stream)
{
  return __getdelim (__lineptr, __n, '\n', __stream);
}





extern __inline __attribute__ ((__gnu_inline__)) int
__attribute__ ((__nothrow__ , __leaf__)) feof_unlocked (FILE *__stream)
{
  return (((__stream)->_flags & 0x10) != 0);
}


extern __inline __attribute__ ((__gnu_inline__)) int
__attribute__ ((__nothrow__ , __leaf__)) ferror_unlocked (FILE *__stream)
{
  return (((__stream)->_flags & 0x20) != 0);
}


extern int __sprintf_chk (char *__restrict __s, int __flag, size_t __slen,
     const char *__restrict __format, ...) __attribute__ ((__nothrow__ , __leaf__));
extern int __vsprintf_chk (char *__restrict __s, int __flag, size_t __slen,
      const char *__restrict __format,
      __gnuc_va_list __ap) __attribute__ ((__nothrow__ , __leaf__));


extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
__attribute__ ((__nothrow__ , __leaf__)) sprintf (char *__restrict __s, const char *__restrict __fmt, ...)
{
  return __builtin___sprintf_chk (__s, 2 - 1,
      __builtin_object_size (__s, 2 > 1), __fmt, __builtin_va_arg_pack ());
}






extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
__attribute__ ((__nothrow__ , __leaf__)) vsprintf (char *__restrict __s, const char *__restrict __fmt, __gnuc_va_list __ap)

{
  return __builtin___vsprintf_chk (__s, 2 - 1,
       __builtin_object_size (__s, 2 > 1), __fmt, __ap);
}



extern int __snprintf_chk (char *__restrict __s, size_t __n, int __flag,
      size_t __slen, const char *__restrict __format,
      ...) __attribute__ ((__nothrow__ , __leaf__));
extern int __vsnprintf_chk (char *__restrict __s, size_t __n, int __flag,
       size_t __slen, const char *__restrict __format,
       __gnuc_va_list __ap) __attribute__ ((__nothrow__ , __leaf__));


extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
__attribute__ ((__nothrow__ , __leaf__)) snprintf (char *__restrict __s, size_t __n, const char *__restrict __fmt, ...)

{
  return __builtin___snprintf_chk (__s, __n, 2 - 1,
       __builtin_object_size (__s, 2 > 1), __fmt, __builtin_va_arg_pack ());
}






extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
__attribute__ ((__nothrow__ , __leaf__)) vsnprintf (char *__restrict __s, size_t __n, const char *__restrict __fmt, __gnuc_va_list __ap)

{
  return __builtin___vsnprintf_chk (__s, __n, 2 - 1,
        __builtin_object_size (__s, 2 > 1), __fmt, __ap);
}





extern int __fprintf_chk (FILE *__restrict __stream, int __flag,
     const char *__restrict __format, ...);
extern int __printf_chk (int __flag, const char *__restrict __format, ...);
extern int __vfprintf_chk (FILE *__restrict __stream, int __flag,
      const char *__restrict __format, __gnuc_va_list __ap);
extern int __vprintf_chk (int __flag, const char *__restrict __format,
     __gnuc_va_list __ap);


extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
fprintf (FILE *__restrict __stream, const char *__restrict __fmt, ...)
{
  return __fprintf_chk (__stream, 2 - 1, __fmt,
   __builtin_va_arg_pack ());
}

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
printf (const char *__restrict __fmt, ...)
{
  return __printf_chk (2 - 1, __fmt, __builtin_va_arg_pack ());
}







extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
vprintf (const char *__restrict __fmt, __gnuc_va_list __ap)
{

  return __vfprintf_chk (stdout, 2 - 1, __fmt, __ap);



}

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
vfprintf (FILE *__restrict __stream,
   const char *__restrict __fmt, __gnuc_va_list __ap)
{
  return __vfprintf_chk (__stream, 2 - 1, __fmt, __ap);
}


extern int __dprintf_chk (int __fd, int __flag, const char *__restrict __fmt,
     ...) __attribute__ ((__format__ (__printf__, 3, 4)));
extern int __vdprintf_chk (int __fd, int __flag,
      const char *__restrict __fmt, __gnuc_va_list __arg)
     __attribute__ ((__format__ (__printf__, 3, 0)));


extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
dprintf (int __fd, const char *__restrict __fmt, ...)
{
  return __dprintf_chk (__fd, 2 - 1, __fmt,
   __builtin_va_arg_pack ());
}





extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
vdprintf (int __fd, const char *__restrict __fmt, __gnuc_va_list __ap)
{
  return __vdprintf_chk (__fd, 2 - 1, __fmt, __ap);
}




extern int __asprintf_chk (char **__restrict __ptr, int __flag,
      const char *__restrict __fmt, ...)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__format__ (__printf__, 3, 4))) __attribute__ ((__warn_unused_result__));
extern int __vasprintf_chk (char **__restrict __ptr, int __flag,
       const char *__restrict __fmt, __gnuc_va_list __arg)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__format__ (__printf__, 3, 0))) __attribute__ ((__warn_unused_result__));
extern int __obstack_printf_chk (struct obstack *__restrict __obstack,
     int __flag, const char *__restrict __format,
     ...)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__format__ (__printf__, 3, 4)));
extern int __obstack_vprintf_chk (struct obstack *__restrict __obstack,
      int __flag,
      const char *__restrict __format,
      __gnuc_va_list __args)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__format__ (__printf__, 3, 0)));


extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
__attribute__ ((__nothrow__ , __leaf__)) asprintf (char **__restrict __ptr, const char *__restrict __fmt, ...)
{
  return __asprintf_chk (__ptr, 2 - 1, __fmt,
    __builtin_va_arg_pack ());
}

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
__attribute__ ((__nothrow__ , __leaf__)) __asprintf (char **__restrict __ptr, const char *__restrict __fmt, ...)

{
  return __asprintf_chk (__ptr, 2 - 1, __fmt,
    __builtin_va_arg_pack ());
}

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
__attribute__ ((__nothrow__ , __leaf__)) obstack_printf (struct obstack *__restrict __obstack, const char *__restrict __fmt, ...)

{
  return __obstack_printf_chk (__obstack, 2 - 1, __fmt,
          __builtin_va_arg_pack ());
}
extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
__attribute__ ((__nothrow__ , __leaf__)) vasprintf (char **__restrict __ptr, const char *__restrict __fmt, __gnuc_va_list __ap)

{
  return __vasprintf_chk (__ptr, 2 - 1, __fmt, __ap);
}

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
__attribute__ ((__nothrow__ , __leaf__)) obstack_vprintf (struct obstack *__restrict __obstack, const char *__restrict __fmt, __gnuc_va_list __ap)

{
  return __obstack_vprintf_chk (__obstack, 2 - 1, __fmt,
    __ap);
}
extern char *__fgets_chk (char *__restrict __s, size_t __size, int __n,
     FILE *__restrict __stream) __attribute__ ((__warn_unused_result__));
extern char *__fgets_alias (char *__restrict __s, int __n, FILE *__restrict __stream) __asm__ ("" "fgets")

                                        __attribute__ ((__warn_unused_result__));
extern char *__fgets_chk_warn (char *__restrict __s, size_t __size, int __n, FILE *__restrict __stream) __asm__ ("" "__fgets_chk")


     __attribute__ ((__warn_unused_result__)) __attribute__((__warning__ ("fgets called with bigger size than length " "of destination buffer")))
                                 ;

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) __attribute__ ((__warn_unused_result__)) char *
fgets (char *__restrict __s, int __n, FILE *__restrict __stream)
{
  if (__builtin_object_size (__s, 2 > 1) != (size_t) -1)
    {
      if (!__builtin_constant_p (__n) || __n <= 0)
 return __fgets_chk (__s, __builtin_object_size (__s, 2 > 1), __n, __stream);

      if ((size_t) __n > __builtin_object_size (__s, 2 > 1))
 return __fgets_chk_warn (__s, __builtin_object_size (__s, 2 > 1), __n, __stream);
    }
  return __fgets_alias (__s, __n, __stream);
}

extern size_t __fread_chk (void *__restrict __ptr, size_t __ptrlen,
      size_t __size, size_t __n,
      FILE *__restrict __stream) __attribute__ ((__warn_unused_result__));
extern size_t __fread_alias (void *__restrict __ptr, size_t __size, size_t __n, FILE *__restrict __stream) __asm__ ("" "fread")


            __attribute__ ((__warn_unused_result__));
extern size_t __fread_chk_warn (void *__restrict __ptr, size_t __ptrlen, size_t __size, size_t __n, FILE *__restrict __stream) __asm__ ("" "__fread_chk")




     __attribute__ ((__warn_unused_result__)) __attribute__((__warning__ ("fread called with bigger size * nmemb than length " "of destination buffer")))
                                 ;

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) __attribute__ ((__warn_unused_result__)) size_t
fread (void *__restrict __ptr, size_t __size, size_t __n,
       FILE *__restrict __stream)
{
  if (__builtin_object_size (__ptr, 0) != (size_t) -1)
    {
      if (!__builtin_constant_p (__size)
   || !__builtin_constant_p (__n)
   || (__size | __n) >= (((size_t) 1) << (8 * sizeof (size_t) / 2)))
 return __fread_chk (__ptr, __builtin_object_size (__ptr, 0), __size, __n, __stream);

      if (__size * __n > __builtin_object_size (__ptr, 0))
 return __fread_chk_warn (__ptr, __builtin_object_size (__ptr, 0), __size, __n, __stream);
    }
  return __fread_alias (__ptr, __size, __n, __stream);
}


extern char *__fgets_unlocked_chk (char *__restrict __s, size_t __size,
       int __n, FILE *__restrict __stream) __attribute__ ((__warn_unused_result__));
extern char *__fgets_unlocked_alias (char *__restrict __s, int __n, FILE *__restrict __stream) __asm__ ("" "fgets_unlocked")

                                                 __attribute__ ((__warn_unused_result__));
extern char *__fgets_unlocked_chk_warn (char *__restrict __s, size_t __size, int __n, FILE *__restrict __stream) __asm__ ("" "__fgets_unlocked_chk")


     __attribute__ ((__warn_unused_result__)) __attribute__((__warning__ ("fgets_unlocked called with bigger size than length " "of destination buffer")))
                                 ;

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) __attribute__ ((__warn_unused_result__)) char *
fgets_unlocked (char *__restrict __s, int __n, FILE *__restrict __stream)
{
  if (__builtin_object_size (__s, 2 > 1) != (size_t) -1)
    {
      if (!__builtin_constant_p (__n) || __n <= 0)
 return __fgets_unlocked_chk (__s, __builtin_object_size (__s, 2 > 1), __n, __stream);

      if ((size_t) __n > __builtin_object_size (__s, 2 > 1))
 return __fgets_unlocked_chk_warn (__s, __builtin_object_size (__s, 2 > 1), __n, __stream);
    }
  return __fgets_unlocked_alias (__s, __n, __stream);
}




extern size_t __fread_unlocked_chk (void *__restrict __ptr, size_t __ptrlen,
        size_t __size, size_t __n,
        FILE *__restrict __stream) __attribute__ ((__warn_unused_result__));
extern size_t __fread_unlocked_alias (void *__restrict __ptr, size_t __size, size_t __n, FILE *__restrict __stream) __asm__ ("" "fread_unlocked")


                     __attribute__ ((__warn_unused_result__));
extern size_t __fread_unlocked_chk_warn (void *__restrict __ptr, size_t __ptrlen, size_t __size, size_t __n, FILE *__restrict __stream) __asm__ ("" "__fread_unlocked_chk")




     __attribute__ ((__warn_unused_result__)) __attribute__((__warning__ ("fread_unlocked called with bigger size * nmemb than " "length of destination buffer")))
                                        ;

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) __attribute__ ((__warn_unused_result__)) size_t
fread_unlocked (void *__restrict __ptr, size_t __size, size_t __n,
  FILE *__restrict __stream)
{
  if (__builtin_object_size (__ptr, 0) != (size_t) -1)
    {
      if (!__builtin_constant_p (__size)
   || !__builtin_constant_p (__n)
   || (__size | __n) >= (((size_t) 1) << (8 * sizeof (size_t) / 2)))
 return __fread_unlocked_chk (__ptr, __builtin_object_size (__ptr, 0), __size, __n,
         __stream);

      if (__size * __n > __builtin_object_size (__ptr, 0))
 return __fread_unlocked_chk_warn (__ptr, __builtin_object_size (__ptr, 0), __size, __n,
       __stream);
    }


  if (__builtin_constant_p (__size)
      && __builtin_constant_p (__n)
      && (__size | __n) < (((size_t) 1) << (8 * sizeof (size_t) / 2))
      && __size * __n <= 8)
    {
      size_t __cnt = __size * __n;
      char *__cptr = (char *) __ptr;
      if (__cnt == 0)
 return 0;

      for (; __cnt > 0; --__cnt)
 {
   int __c = (__builtin_expect (((__stream)->_IO_read_ptr >= (__stream)->_IO_read_end), 0) ? __uflow (__stream) : *(unsigned char *) (__stream)->_IO_read_ptr++);
   if (__c == 
             (-1)
                )
     break;
   *__cptr++ = __c;
 }
      return (__cptr - (char *) __ptr) / __size;
    }

  return __fread_unlocked_alias (__ptr, __size, __n, __stream);
}





















extern void *memcpy (void *__restrict __dest, const void *__restrict __src,
       size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern void *memmove (void *__dest, const void *__src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));






extern void *memccpy (void *__restrict __dest, const void *__restrict __src,
        int __c, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));





extern void *memset (void *__s, int __c, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int memcmp (const void *__s1, const void *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern void *memchr (const void *__s, int __c, size_t __n)
      __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));


extern void *rawmemchr (const void *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern void *memrchr (const void *__s, int __c, size_t __n)
      __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));






extern char *strcpy (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

extern char *strncpy (char *__restrict __dest,
        const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern char *strcat (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

extern char *strncat (char *__restrict __dest, const char *__restrict __src,
        size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strcmp (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

extern int strncmp (const char *__s1, const char *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strcoll (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

extern size_t strxfrm (char *__restrict __dest,
         const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));

extern int strcoll_l (const char *__s1, const char *__s2, __locale_t __l)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 3)));

extern size_t strxfrm_l (char *__dest, const char *__src, size_t __n,
    __locale_t __l) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 4)));




extern char *strdup (const char *__s)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));






extern char *strndup (const char *__string, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));

extern char *strchr (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern char *strrchr (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));


extern char *strchrnul (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));






extern size_t strcspn (const char *__s, const char *__reject)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern size_t strspn (const char *__s, const char *__accept)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *strpbrk (const char *__s, const char *__accept)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *strstr (const char *__haystack, const char *__needle)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));




extern char *strtok (char *__restrict __s, const char *__restrict __delim)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));




extern char *__strtok_r (char *__restrict __s,
    const char *__restrict __delim,
    char **__restrict __save_ptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));

extern char *strtok_r (char *__restrict __s, const char *__restrict __delim,
         char **__restrict __save_ptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));
extern char *strcasestr (const char *__haystack, const char *__needle)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));







extern void *memmem (const void *__haystack, size_t __haystacklen,
       const void *__needle, size_t __needlelen)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 3)));



extern void *__mempcpy (void *__restrict __dest,
   const void *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern void *mempcpy (void *__restrict __dest,
        const void *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));





extern size_t strlen (const char *__s)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));





extern size_t strnlen (const char *__string, size_t __maxlen)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));





extern char *strerror (int __errnum) __attribute__ ((__nothrow__ , __leaf__));

extern char *strerror_r (int __errnum, char *__buf, size_t __buflen)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2))) __attribute__ ((__warn_unused_result__));





extern char *strerror_l (int __errnum, __locale_t __l) __attribute__ ((__nothrow__ , __leaf__));





extern void __bzero (void *__s, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



extern void bcopy (const void *__src, void *__dest, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern void bzero (void *__s, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int bcmp (const void *__s1, const void *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *index (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern char *rindex (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));




extern int ffs (int __i) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));




extern int ffsl (long int __l) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
__extension__ extern int ffsll (long long int __ll)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



extern int strcasecmp (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strncasecmp (const char *__s1, const char *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));





extern int strcasecmp_l (const char *__s1, const char *__s2,
    __locale_t __loc)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 3)));

extern int strncasecmp_l (const char *__s1, const char *__s2,
     size_t __n, __locale_t __loc)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 4)));





extern char *strsep (char **__restrict __stringp,
       const char *__restrict __delim)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));




extern char *strsignal (int __sig) __attribute__ ((__nothrow__ , __leaf__));


extern char *__stpcpy (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *stpcpy (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));



extern char *__stpncpy (char *__restrict __dest,
   const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *stpncpy (char *__restrict __dest,
        const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));




extern int strverscmp (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern char *strfry (char *__string) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern void *memfrob (void *__s, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern char *basename (const char *__filename) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern void *__rawmemchr (const void *__s, int __c);
extern __inline __attribute__ ((__gnu_inline__)) char *__strtok_r_1c (char *__s, char __sep, char **__nextp);
extern __inline __attribute__ ((__gnu_inline__)) char *
__strtok_r_1c (char *__s, char __sep, char **__nextp)
{
  char *__result;
  if (__s == ((void *)0))
    __s = *__nextp;
  while (*__s == __sep)
    ++__s;
  __result = ((void *)0);
  if (*__s != '\0')
    {
      __result = __s++;
      while (*__s != '\0')
 if (*__s++ == __sep)
   {
     __s[-1] = '\0';
     break;
   }
    }
  *__nextp = __s;
  return __result;
}
extern char *__strsep_g (char **__stringp, const char *__delim);
extern __inline __attribute__ ((__gnu_inline__)) char *__strsep_1c (char **__s, char __reject);
extern __inline __attribute__ ((__gnu_inline__)) char *
__strsep_1c (char **__s, char __reject)
{
  char *__retval = *__s;
  if (__retval != ((void *)0) && (*__s = (__extension__ (__builtin_constant_p (__reject) && !__builtin_constant_p (__retval) && (__reject) == '\0' ? (char *) __rawmemchr (__retval, __reject) : __builtin_strchr (__retval, __reject)))) != ((void *)0))
    *(*__s)++ = '\0';
  return __retval;
}

extern __inline __attribute__ ((__gnu_inline__)) char *__strsep_2c (char **__s, char __reject1, char __reject2);
extern __inline __attribute__ ((__gnu_inline__)) char *
__strsep_2c (char **__s, char __reject1, char __reject2)
{
  char *__retval = *__s;
  if (__retval != ((void *)0))
    {
      char *__cp = __retval;
      while (1)
 {
   if (*__cp == '\0')
     {
       __cp = ((void *)0);
   break;
     }
   if (*__cp == __reject1 || *__cp == __reject2)
     {
       *__cp++ = '\0';
       break;
     }
   ++__cp;
 }
      *__s = __cp;
    }
  return __retval;
}

extern __inline __attribute__ ((__gnu_inline__)) char *__strsep_3c (char **__s, char __reject1, char __reject2,
       char __reject3);
extern __inline __attribute__ ((__gnu_inline__)) char *
__strsep_3c (char **__s, char __reject1, char __reject2, char __reject3)
{
  char *__retval = *__s;
  if (__retval != ((void *)0))
    {
      char *__cp = __retval;
      while (1)
 {
   if (*__cp == '\0')
     {
       __cp = ((void *)0);
   break;
     }
   if (*__cp == __reject1 || *__cp == __reject2 || *__cp == __reject3)
     {
       *__cp++ = '\0';
       break;
     }
   ++__cp;
 }
      *__s = __cp;
    }
  return __retval;
}




extern void *malloc (size_t __size) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__warn_unused_result__));

extern void *calloc (size_t __nmemb, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__warn_unused_result__));






extern char *__strdup (const char *__string) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__));
extern char *__strndup (const char *__string, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__));




extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) void *
__attribute__ ((__nothrow__ , __leaf__)) memcpy (void *__restrict __dest, const void *__restrict __src, size_t __len)

{
  return __builtin___memcpy_chk (__dest, __src, __len, __builtin_object_size (__dest, 0));
}

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) void *
__attribute__ ((__nothrow__ , __leaf__)) memmove (void *__dest, const void *__src, size_t __len)
{
  return __builtin___memmove_chk (__dest, __src, __len, __builtin_object_size (__dest, 0));
}


extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) void *
__attribute__ ((__nothrow__ , __leaf__)) mempcpy (void *__restrict __dest, const void *__restrict __src, size_t __len)

{
  return __builtin___mempcpy_chk (__dest, __src, __len, __builtin_object_size (__dest, 0));
}
extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) void *
__attribute__ ((__nothrow__ , __leaf__)) memset (void *__dest, int __ch, size_t __len)
{
  return __builtin___memset_chk (__dest, __ch, __len, __builtin_object_size (__dest, 0));
}


extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) void
__attribute__ ((__nothrow__ , __leaf__)) bcopy (const void *__src, void *__dest, size_t __len)
{
  (void) __builtin___memmove_chk (__dest, __src, __len, __builtin_object_size (__dest, 0));
}

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) void
__attribute__ ((__nothrow__ , __leaf__)) bzero (void *__dest, size_t __len)
{
  (void) __builtin___memset_chk (__dest, '\0', __len, __builtin_object_size (__dest, 0));
}


extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) char *
__attribute__ ((__nothrow__ , __leaf__)) strcpy (char *__restrict __dest, const char *__restrict __src)
{
  return __builtin___strcpy_chk (__dest, __src, __builtin_object_size (__dest, 2 > 1));
}


extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) char *
__attribute__ ((__nothrow__ , __leaf__)) stpcpy (char *__restrict __dest, const char *__restrict __src)
{
  return __builtin___stpcpy_chk (__dest, __src, __builtin_object_size (__dest, 2 > 1));
}



extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) char *
__attribute__ ((__nothrow__ , __leaf__)) strncpy (char *__restrict __dest, const char *__restrict __src, size_t __len)

{
  return __builtin___strncpy_chk (__dest, __src, __len, __builtin_object_size (__dest, 2 > 1));
}


extern char *__stpncpy_chk (char *__dest, const char *__src, size_t __n,
       size_t __destlen) __attribute__ ((__nothrow__ , __leaf__));
extern char *__stpncpy_alias (char *__dest, const char *__src, size_t __n) __asm__ ("" "stpncpy") __attribute__ ((__nothrow__ , __leaf__))
                                 ;

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) char *
__attribute__ ((__nothrow__ , __leaf__)) stpncpy (char *__dest, const char *__src, size_t __n)
{
  if (__builtin_object_size (__dest, 2 > 1) != (size_t) -1
      && (!__builtin_constant_p (__n) || __n > __builtin_object_size (__dest, 2 > 1)))
    return __stpncpy_chk (__dest, __src, __n, __builtin_object_size (__dest, 2 > 1));
  return __stpncpy_alias (__dest, __src, __n);
}


extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) char *
__attribute__ ((__nothrow__ , __leaf__)) strcat (char *__restrict __dest, const char *__restrict __src)
{
  return __builtin___strcat_chk (__dest, __src, __builtin_object_size (__dest, 2 > 1));
}


extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) char *
__attribute__ ((__nothrow__ , __leaf__)) strncat (char *__restrict __dest, const char *__restrict __src, size_t __len)

{
  return __builtin___strncat_chk (__dest, __src, __len, __builtin_object_size (__dest, 2 > 1));
}







struct iovec
  {
    void *iov_base;
    size_t iov_len;
  };



extern ssize_t process_vm_readv (pid_t __pid, const struct iovec *__lvec,
     unsigned long int __liovcnt,
     const struct iovec *__rvec,
     unsigned long int __riovcnt,
     unsigned long int __flags)
  __attribute__ ((__nothrow__ , __leaf__));


extern ssize_t process_vm_writev (pid_t __pid, const struct iovec *__lvec,
      unsigned long int __liovcnt,
      const struct iovec *__rvec,
      unsigned long int __riovcnt,
      unsigned long int __flags)
  __attribute__ ((__nothrow__ , __leaf__));


extern ssize_t readv (int __fd, const struct iovec *__iovec, int __count)
  __attribute__ ((__warn_unused_result__));
extern ssize_t writev (int __fd, const struct iovec *__iovec, int __count)
  __attribute__ ((__warn_unused_result__));
extern ssize_t preadv (int __fd, const struct iovec *__iovec, int __count,
         __off_t __offset) __attribute__ ((__warn_unused_result__));
extern ssize_t pwritev (int __fd, const struct iovec *__iovec, int __count,
   __off_t __offset) __attribute__ ((__warn_unused_result__));
extern ssize_t preadv64 (int __fd, const struct iovec *__iovec, int __count,
    __off64_t __offset) __attribute__ ((__warn_unused_result__));
extern ssize_t pwritev64 (int __fd, const struct iovec *__iovec, int __count,
     __off64_t __offset) __attribute__ ((__warn_unused_result__));


















typedef __socklen_t socklen_t;




enum __socket_type
{
  SOCK_STREAM = 1,


  SOCK_DGRAM = 2,


  SOCK_RAW = 3,

  SOCK_RDM = 4,

  SOCK_SEQPACKET = 5,


  SOCK_DCCP = 6,

  SOCK_PACKET = 10,







  SOCK_CLOEXEC = 02000000,


  SOCK_NONBLOCK = 00004000


};
typedef unsigned short int sa_family_t;


struct sockaddr
  {
    sa_family_t sa_family;
    char sa_data[14];
  };
struct sockaddr_storage
  {
    sa_family_t ss_family;
    char __ss_padding[(128 - (sizeof (unsigned short int)) - sizeof (unsigned long int))];
    unsigned long int __ss_align;
  };



enum
  {
    MSG_OOB = 0x01,

    MSG_PEEK = 0x02,

    MSG_DONTROUTE = 0x04,



    MSG_TRYHARD = MSG_DONTROUTE,


    MSG_CTRUNC = 0x08,

    MSG_PROXY = 0x10,

    MSG_TRUNC = 0x20,

    MSG_DONTWAIT = 0x40,

    MSG_EOR = 0x80,

    MSG_WAITALL = 0x100,

    MSG_FIN = 0x200,

    MSG_SYN = 0x400,

    MSG_CONFIRM = 0x800,

    MSG_RST = 0x1000,

    MSG_ERRQUEUE = 0x2000,

    MSG_NOSIGNAL = 0x4000,

    MSG_MORE = 0x8000,

    MSG_WAITFORONE = 0x10000,

    MSG_BATCH = 0x40000,

    MSG_FASTOPEN = 0x20000000,


    MSG_CMSG_CLOEXEC = 0x40000000



  };




struct msghdr
  {
    void *msg_name;
    socklen_t msg_namelen;

    struct iovec *msg_iov;
    size_t msg_iovlen;

    void *msg_control;
    size_t msg_controllen;




    int msg_flags;
  };


struct cmsghdr
  {
    size_t cmsg_len;




    int cmsg_level;
    int cmsg_type;

    __extension__ unsigned char __cmsg_data [];

  };
extern struct cmsghdr *__cmsg_nxthdr (struct msghdr *__mhdr,
          struct cmsghdr *__cmsg) __attribute__ ((__nothrow__ , __leaf__));




extern __inline __attribute__ ((__gnu_inline__)) struct cmsghdr *
__attribute__ ((__nothrow__ , __leaf__)) __cmsg_nxthdr (struct msghdr *__mhdr, struct cmsghdr *__cmsg)
{
  if ((size_t) __cmsg->cmsg_len < sizeof (struct cmsghdr))

    return (struct cmsghdr *) 0;

  __cmsg = (struct cmsghdr *) ((unsigned char *) __cmsg
          + (((__cmsg->cmsg_len) + sizeof (size_t) - 1) & (size_t) ~(sizeof (size_t) - 1)));
  if ((unsigned char *) (__cmsg + 1) > ((unsigned char *) __mhdr->msg_control
     + __mhdr->msg_controllen)
      || ((unsigned char *) __cmsg + (((__cmsg->cmsg_len) + sizeof (size_t) - 1) & (size_t) ~(sizeof (size_t) - 1))
   > ((unsigned char *) __mhdr->msg_control + __mhdr->msg_controllen)))

    return (struct cmsghdr *) 0;
  return __cmsg;
}




enum
  {
    SCM_RIGHTS = 0x01


    , SCM_CREDENTIALS = 0x02


  };



struct ucred
{
  pid_t pid;
  uid_t uid;
  gid_t gid;
};



struct linger
  {
    int l_onoff;
    int l_linger;
  };




struct osockaddr
  {
    unsigned short int sa_family;
    unsigned char sa_data[14];
  };




enum
{
  SHUT_RD = 0,

  SHUT_WR,

  SHUT_RDWR

};
typedef union { struct sockaddr *__restrict __sockaddr__; struct sockaddr_at *__restrict __sockaddr_at__; struct sockaddr_ax25 *__restrict __sockaddr_ax25__; struct sockaddr_dl *__restrict __sockaddr_dl__; struct sockaddr_eon *__restrict __sockaddr_eon__; struct sockaddr_in *__restrict __sockaddr_in__; struct sockaddr_in6 *__restrict __sockaddr_in6__; struct sockaddr_inarp *__restrict __sockaddr_inarp__; struct sockaddr_ipx *__restrict __sockaddr_ipx__; struct sockaddr_iso *__restrict __sockaddr_iso__; struct sockaddr_ns *__restrict __sockaddr_ns__; struct sockaddr_un *__restrict __sockaddr_un__; struct sockaddr_x25 *__restrict __sockaddr_x25__;
       } __SOCKADDR_ARG __attribute__ ((__transparent_union__));


typedef union { const struct sockaddr *__restrict __sockaddr__; const struct sockaddr_at *__restrict __sockaddr_at__; const struct sockaddr_ax25 *__restrict __sockaddr_ax25__; const struct sockaddr_dl *__restrict __sockaddr_dl__; const struct sockaddr_eon *__restrict __sockaddr_eon__; const struct sockaddr_in *__restrict __sockaddr_in__; const struct sockaddr_in6 *__restrict __sockaddr_in6__; const struct sockaddr_inarp *__restrict __sockaddr_inarp__; const struct sockaddr_ipx *__restrict __sockaddr_ipx__; const struct sockaddr_iso *__restrict __sockaddr_iso__; const struct sockaddr_ns *__restrict __sockaddr_ns__; const struct sockaddr_un *__restrict __sockaddr_un__; const struct sockaddr_x25 *__restrict __sockaddr_x25__;
       } __CONST_SOCKADDR_ARG __attribute__ ((__transparent_union__));





struct mmsghdr
  {
    struct msghdr msg_hdr;
    unsigned int msg_len;

  };






extern int socket (int __domain, int __type, int __protocol) __attribute__ ((__nothrow__ , __leaf__));





extern int socketpair (int __domain, int __type, int __protocol,
         int __fds[2]) __attribute__ ((__nothrow__ , __leaf__));


extern int bind (int __fd, __CONST_SOCKADDR_ARG __addr, socklen_t __len)
     __attribute__ ((__nothrow__ , __leaf__));


extern int getsockname (int __fd, __SOCKADDR_ARG __addr,
   socklen_t *__restrict __len) __attribute__ ((__nothrow__ , __leaf__));
extern int connect (int __fd, __CONST_SOCKADDR_ARG __addr, socklen_t __len);



extern int getpeername (int __fd, __SOCKADDR_ARG __addr,
   socklen_t *__restrict __len) __attribute__ ((__nothrow__ , __leaf__));






extern ssize_t send (int __fd, const void *__buf, size_t __n, int __flags);






extern ssize_t recv (int __fd, void *__buf, size_t __n, int __flags);






extern ssize_t sendto (int __fd, const void *__buf, size_t __n,
         int __flags, __CONST_SOCKADDR_ARG __addr,
         socklen_t __addr_len);
extern ssize_t recvfrom (int __fd, void *__restrict __buf, size_t __n,
    int __flags, __SOCKADDR_ARG __addr,
    socklen_t *__restrict __addr_len);







extern ssize_t sendmsg (int __fd, const struct msghdr *__message,
   int __flags);







extern int sendmmsg (int __fd, struct mmsghdr *__vmessages,
       unsigned int __vlen, int __flags);







extern ssize_t recvmsg (int __fd, struct msghdr *__message, int __flags);







extern int recvmmsg (int __fd, struct mmsghdr *__vmessages,
       unsigned int __vlen, int __flags,
       struct timespec *__tmo);






extern int getsockopt (int __fd, int __level, int __optname,
         void *__restrict __optval,
         socklen_t *__restrict __optlen) __attribute__ ((__nothrow__ , __leaf__));




extern int setsockopt (int __fd, int __level, int __optname,
         const void *__optval, socklen_t __optlen) __attribute__ ((__nothrow__ , __leaf__));





extern int listen (int __fd, int __n) __attribute__ ((__nothrow__ , __leaf__));
extern int accept (int __fd, __SOCKADDR_ARG __addr,
     socklen_t *__restrict __addr_len);






extern int accept4 (int __fd, __SOCKADDR_ARG __addr,
      socklen_t *__restrict __addr_len, int __flags);
extern int shutdown (int __fd, int __how) __attribute__ ((__nothrow__ , __leaf__));




extern int sockatmark (int __fd) __attribute__ ((__nothrow__ , __leaf__));







extern int isfdtype (int __fd, int __fdtype) __attribute__ ((__nothrow__ , __leaf__));





extern ssize_t __recv_chk (int __fd, void *__buf, size_t __n, size_t __buflen,
      int __flags);
extern ssize_t __recv_alias (int __fd, void *__buf, size_t __n, int __flags) __asm__ ("" "recv")
                          ;
extern ssize_t __recv_chk_warn (int __fd, void *__buf, size_t __n, size_t __buflen, int __flags) __asm__ ("" "__recv_chk")


     __attribute__((__warning__ ("recv called with bigger length than size of destination " "buffer")))
            ;

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) ssize_t
recv (int __fd, void *__buf, size_t __n, int __flags)
{
  if (__builtin_object_size (__buf, 0) != (size_t) -1)
    {
      if (!__builtin_constant_p (__n))
 return __recv_chk (__fd, __buf, __n, __builtin_object_size (__buf, 0), __flags);

      if (__n > __builtin_object_size (__buf, 0))
 return __recv_chk_warn (__fd, __buf, __n, __builtin_object_size (__buf, 0), __flags);
    }
  return __recv_alias (__fd, __buf, __n, __flags);
}

extern ssize_t __recvfrom_chk (int __fd, void *__restrict __buf, size_t __n,
          size_t __buflen, int __flags,
          __SOCKADDR_ARG __addr,
          socklen_t *__restrict __addr_len);
extern ssize_t __recvfrom_alias (int __fd, void *__restrict __buf, size_t __n, int __flags, __SOCKADDR_ARG __addr, socklen_t *__restrict __addr_len) __asm__ ("" "recvfrom")


                                                   ;
extern ssize_t __recvfrom_chk_warn (int __fd, void *__restrict __buf, size_t __n, size_t __buflen, int __flags, __SOCKADDR_ARG __addr, socklen_t *__restrict __addr_len) __asm__ ("" "__recvfrom_chk")




     __attribute__((__warning__ ("recvfrom called with bigger length than size of " "destination buffer")))
                        ;

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) ssize_t
recvfrom (int __fd, void *__restrict __buf, size_t __n, int __flags,
   __SOCKADDR_ARG __addr, socklen_t *__restrict __addr_len)
{
  if (__builtin_object_size (__buf, 0) != (size_t) -1)
    {
      if (!__builtin_constant_p (__n))
 return __recvfrom_chk (__fd, __buf, __n, __builtin_object_size (__buf, 0), __flags,
          __addr, __addr_len);
      if (__n > __builtin_object_size (__buf, 0))
 return __recvfrom_chk_warn (__fd, __buf, __n, __builtin_object_size (__buf, 0), __flags,
        __addr, __addr_len);
    }
  return __recvfrom_alias (__fd, __buf, __n, __flags, __addr, __addr_len);
}



typedef unsigned char uint8_t;
typedef unsigned short int uint16_t;

typedef unsigned int uint32_t;





__extension__
typedef unsigned long long int uint64_t;






typedef signed char int_least8_t;
typedef short int int_least16_t;
typedef int int_least32_t;



__extension__
typedef long long int int_least64_t;



typedef unsigned char uint_least8_t;
typedef unsigned short int uint_least16_t;
typedef unsigned int uint_least32_t;



__extension__
typedef unsigned long long int uint_least64_t;






typedef signed char int_fast8_t;





typedef int int_fast16_t;
typedef int int_fast32_t;
__extension__
typedef long long int int_fast64_t;



typedef unsigned char uint_fast8_t;





typedef unsigned int uint_fast16_t;
typedef unsigned int uint_fast32_t;
__extension__
typedef unsigned long long int uint_fast64_t;
typedef int intptr_t;


typedef unsigned int uintptr_t;
__extension__
typedef long long int intmax_t;
__extension__
typedef unsigned long long int uintmax_t;







typedef uint32_t in_addr_t;
struct in_addr
  {
    in_addr_t s_addr;
  };


struct ip_opts
  {
    struct in_addr ip_dst;
    char ip_opts[40];
  };


struct ip_mreqn
  {
    struct in_addr imr_multiaddr;
    struct in_addr imr_address;
    int imr_ifindex;
  };


struct in_pktinfo
  {
    int ipi_ifindex;
    struct in_addr ipi_spec_dst;
    struct in_addr ipi_addr;
  };


enum
  {
    IPPROTO_IP = 0,

    IPPROTO_ICMP = 1,

    IPPROTO_IGMP = 2,

    IPPROTO_IPIP = 4,

    IPPROTO_TCP = 6,

    IPPROTO_EGP = 8,

    IPPROTO_PUP = 12,

    IPPROTO_UDP = 17,

    IPPROTO_IDP = 22,

    IPPROTO_TP = 29,

    IPPROTO_DCCP = 33,

    IPPROTO_IPV6 = 41,

    IPPROTO_RSVP = 46,

    IPPROTO_GRE = 47,

    IPPROTO_ESP = 50,

    IPPROTO_AH = 51,

    IPPROTO_MTP = 92,

    IPPROTO_BEETPH = 94,

    IPPROTO_ENCAP = 98,

    IPPROTO_PIM = 103,

    IPPROTO_COMP = 108,

    IPPROTO_SCTP = 132,

    IPPROTO_UDPLITE = 136,

    IPPROTO_MPLS = 137,

    IPPROTO_RAW = 255,

    IPPROTO_MAX
  };





enum
  {
    IPPROTO_HOPOPTS = 0,

    IPPROTO_ROUTING = 43,

    IPPROTO_FRAGMENT = 44,

    IPPROTO_ICMPV6 = 58,

    IPPROTO_NONE = 59,

    IPPROTO_DSTOPTS = 60,

    IPPROTO_MH = 135

  };



typedef uint16_t in_port_t;


enum
  {
    IPPORT_ECHO = 7,
    IPPORT_DISCARD = 9,
    IPPORT_SYSTAT = 11,
    IPPORT_DAYTIME = 13,
    IPPORT_NETSTAT = 15,
    IPPORT_FTP = 21,
    IPPORT_TELNET = 23,
    IPPORT_SMTP = 25,
    IPPORT_TIMESERVER = 37,
    IPPORT_NAMESERVER = 42,
    IPPORT_WHOIS = 43,
    IPPORT_MTP = 57,

    IPPORT_TFTP = 69,
    IPPORT_RJE = 77,
    IPPORT_FINGER = 79,
    IPPORT_TTYLINK = 87,
    IPPORT_SUPDUP = 95,


    IPPORT_EXECSERVER = 512,
    IPPORT_LOGINSERVER = 513,
    IPPORT_CMDSERVER = 514,
    IPPORT_EFSSERVER = 520,


    IPPORT_BIFFUDP = 512,
    IPPORT_WHOSERVER = 513,
    IPPORT_ROUTESERVER = 520,


    IPPORT_RESERVED = 1024,


    IPPORT_USERRESERVED = 5000
  };
struct in6_addr
  {
    union
      {
 uint8_t __u6_addr8[16];

 uint16_t __u6_addr16[8];
 uint32_t __u6_addr32[4];

      } __in6_u;





  };


extern const struct in6_addr in6addr_any;
extern const struct in6_addr in6addr_loopback;
struct sockaddr_in
  {
    sa_family_t sin_family;
    in_port_t sin_port;
    struct in_addr sin_addr;


    unsigned char sin_zero[sizeof (struct sockaddr) -
      (sizeof (unsigned short int)) -
      sizeof (in_port_t) -
      sizeof (struct in_addr)];
  };



struct sockaddr_in6
  {
    sa_family_t sin6_family;
    in_port_t sin6_port;
    uint32_t sin6_flowinfo;
    struct in6_addr sin6_addr;
    uint32_t sin6_scope_id;
  };




struct ip_mreq
  {

    struct in_addr imr_multiaddr;


    struct in_addr imr_interface;
  };

struct ip_mreq_source
  {

    struct in_addr imr_multiaddr;


    struct in_addr imr_interface;


    struct in_addr imr_sourceaddr;
  };




struct ipv6_mreq
  {

    struct in6_addr ipv6mr_multiaddr;


    unsigned int ipv6mr_interface;
  };




struct group_req
  {

    uint32_t gr_interface;


    struct sockaddr_storage gr_group;
  };

struct group_source_req
  {

    uint32_t gsr_interface;


    struct sockaddr_storage gsr_group;


    struct sockaddr_storage gsr_source;
  };



struct ip_msfilter
  {

    struct in_addr imsf_multiaddr;


    struct in_addr imsf_interface;


    uint32_t imsf_fmode;


    uint32_t imsf_numsrc;

    struct in_addr imsf_slist[1];
  };





struct group_filter
  {

    uint32_t gf_interface;


    struct sockaddr_storage gf_group;


    uint32_t gf_fmode;


    uint32_t gf_numsrc;

    struct sockaddr_storage gf_slist[1];
};
extern uint32_t ntohl (uint32_t __netlong) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern uint16_t ntohs (uint16_t __netshort)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern uint32_t htonl (uint32_t __hostlong)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern uint16_t htons (uint16_t __hostshort)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));




extern int bindresvport (int __sockfd, struct sockaddr_in *__sock_in) __attribute__ ((__nothrow__ , __leaf__));


extern int bindresvport6 (int __sockfd, struct sockaddr_in6 *__sock_in)
     __attribute__ ((__nothrow__ , __leaf__));
struct cmsghdr;



struct in6_pktinfo
  {
    struct in6_addr ipi6_addr;
    unsigned int ipi6_ifindex;
  };


struct ip6_mtuinfo
  {
    struct sockaddr_in6 ip6m_addr;
    uint32_t ip6m_mtu;
  };



extern int inet6_option_space (int __nbytes)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__deprecated__));
extern int inet6_option_init (void *__bp, struct cmsghdr **__cmsgp,
         int __type) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__deprecated__));
extern int inet6_option_append (struct cmsghdr *__cmsg,
    const uint8_t *__typep, int __multx,
    int __plusy) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__deprecated__));
extern uint8_t *inet6_option_alloc (struct cmsghdr *__cmsg, int __datalen,
        int __multx, int __plusy)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__deprecated__));
extern int inet6_option_next (const struct cmsghdr *__cmsg,
         uint8_t **__tptrp)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__deprecated__));
extern int inet6_option_find (const struct cmsghdr *__cmsg,
         uint8_t **__tptrp, int __type)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__deprecated__));



extern int inet6_opt_init (void *__extbuf, socklen_t __extlen) __attribute__ ((__nothrow__ , __leaf__));
extern int inet6_opt_append (void *__extbuf, socklen_t __extlen, int __offset,
        uint8_t __type, socklen_t __len, uint8_t __align,
        void **__databufp) __attribute__ ((__nothrow__ , __leaf__));
extern int inet6_opt_finish (void *__extbuf, socklen_t __extlen, int __offset)
     __attribute__ ((__nothrow__ , __leaf__));
extern int inet6_opt_set_val (void *__databuf, int __offset, void *__val,
         socklen_t __vallen) __attribute__ ((__nothrow__ , __leaf__));
extern int inet6_opt_next (void *__extbuf, socklen_t __extlen, int __offset,
      uint8_t *__typep, socklen_t *__lenp,
      void **__databufp) __attribute__ ((__nothrow__ , __leaf__));
extern int inet6_opt_find (void *__extbuf, socklen_t __extlen, int __offset,
      uint8_t __type, socklen_t *__lenp,
      void **__databufp) __attribute__ ((__nothrow__ , __leaf__));
extern int inet6_opt_get_val (void *__databuf, int __offset, void *__val,
         socklen_t __vallen) __attribute__ ((__nothrow__ , __leaf__));



extern socklen_t inet6_rth_space (int __type, int __segments) __attribute__ ((__nothrow__ , __leaf__));
extern void *inet6_rth_init (void *__bp, socklen_t __bp_len, int __type,
        int __segments) __attribute__ ((__nothrow__ , __leaf__));
extern int inet6_rth_add (void *__bp, const struct in6_addr *__addr) __attribute__ ((__nothrow__ , __leaf__));
extern int inet6_rth_reverse (const void *__in, void *__out) __attribute__ ((__nothrow__ , __leaf__));
extern int inet6_rth_segments (const void *__bp) __attribute__ ((__nothrow__ , __leaf__));
extern struct in6_addr *inet6_rth_getaddr (const void *__bp, int __index)
     __attribute__ ((__nothrow__ , __leaf__));





extern int getipv4sourcefilter (int __s, struct in_addr __interface_addr,
    struct in_addr __group, uint32_t *__fmode,
    uint32_t *__numsrc, struct in_addr *__slist)
     __attribute__ ((__nothrow__ , __leaf__));


extern int setipv4sourcefilter (int __s, struct in_addr __interface_addr,
    struct in_addr __group, uint32_t __fmode,
    uint32_t __numsrc,
    const struct in_addr *__slist)
     __attribute__ ((__nothrow__ , __leaf__));



extern int getsourcefilter (int __s, uint32_t __interface_addr,
       const struct sockaddr *__group,
       socklen_t __grouplen, uint32_t *__fmode,
       uint32_t *__numsrc,
       struct sockaddr_storage *__slist) __attribute__ ((__nothrow__ , __leaf__));


extern int setsourcefilter (int __s, uint32_t __interface_addr,
       const struct sockaddr *__group,
       socklen_t __grouplen, uint32_t __fmode,
       uint32_t __numsrc,
       const struct sockaddr_storage *__slist) __attribute__ ((__nothrow__ , __leaf__));






enum CmPAsnTknTypes
{
   CM_PASN_TET_BOOL,
   CM_PASN_TET_SINT8,
   CM_PASN_TET_SINT16,
   CM_PASN_TET_SINT32,
   CM_PASN_TET_UINT8,
   CM_PASN_TET_UINT16,
   CM_PASN_TET_UINT32,
   CM_PASN_TET_ENUM,
   CM_PASN_TET_BITSTR,
   CM_PASN_TET_BITSTRXL,
   CM_PASN_TET_OCTSTR,
   CM_PASN_TET_OCTSTRXL,
   CM_PASN_TET_NULL,
   CM_PASN_TET_SEQ,
   CM_PASN_TET_SET,
   CM_PASN_TET_SEQOF,
   CM_PASN_TET_SETOF,
   CM_PASN_TET_CHOICE,
   CM_PASN_TET_OID,
   CM_PASN_TET_IA5STR,
   CM_PASN_TET_IA5STRXL,
   CM_PASN_TET_PRNSTR,
   CM_PASN_TET_PRNSTRXL,
   CM_PASN_TET_NUMSTR,
   CM_PASN_TET_NUMSTRXL,
   CM_PASN_TET_VISSTR,
   CM_PASN_TET_VISSTRXL,
   CM_PASN_TET_GENSTR,
   CM_PASN_TET_GENSTRXL,
   CM_PASN_TET_BMPSTR,
   CM_PASN_TET_BMPSTRXL,
   CM_PASN_TET_UNISTR,
   CM_PASN_TET_UNISTRXL,
   CM_PASN_TET_OCTSTRBUF,
   CM_PASN_TET_SETSEQ_TERM,
   CM_PASN_TET_EXT_MKR,
   CM_PASN_TET_TKNBUF,
   CM_PASN_TET_CLASSIE,
   CM_PASN_TET_SEQNULL,
   CM_PASN_TET_UINTXL
};
typedef enum {
 L_ALWAYS=0,
 L_FATAL,
 L_ERROR,
 L_WARNING,
 L_EVENT,
 L_INFO,
 L_DEBUG,
 L_UNUSED,
 L_MAX_LOG_LEVEL
} R_LOG_LEVEL;

typedef enum {
 DBG_CELLID,
   DBG_PEERID,
   DBG_ENBID,
  DBG_MMEID,
  DBG_CRNTI,
   DBG_UEIDX,
  DBG_UEID,
  DBG_RBID,
  DBG_LCID,
  DBG_LCGID,
 DBG_TRNSID,
   DBG_INSTID,
 DBG_MAX_IDs
} R_SPL_ARG;
typedef const char* PSTR;


typedef U32 LOGID;
void logLevH( LOGID logId, R_LOG_LEVEL logLevel, PSTR hex, int hexlen, ...);
void logLev0( LOGID logId, R_LOG_LEVEL logLevel, ...);
void logLev1( LOGID logId, R_LOG_LEVEL logLevel, U32 arg1, ...);
void logLev2( LOGID logId, R_LOG_LEVEL logLevel, U32 arg1, U32 arg2, ...);
void logLev3( LOGID logId, R_LOG_LEVEL logLevel, U32 arg1, U32 arg2, U32 arg3, ...);
void logLev4( LOGID logId, R_LOG_LEVEL logLevel, U32 arg1, U32 arg2, U32 arg3, U32 arg4, ...);
void logLevE(LOGID logId, R_LOG_LEVEL logLevel, R_SPL_ARG splType, U32 splVal,
U32 arg1, U32 arg2, U32 arg3, U32 arg4, ...);
void logLevS( LOGID logId, R_LOG_LEVEL logLevel, const char* str, ...);


void hextostr(char* p, PSTR h, int hexlen);

extern int g_logLevel;
extern U32 g_modMask;
extern const char* g_logStr[L_MAX_LOG_LEVEL];
extern const char* g_splStr[DBG_MAX_IDs];




void rlSetLogPath(const char* logDir);





void rlInitLog(U8 type);







void rlSetLogFile(const char* fileName);





void rlSetLogPort(U32 port);




void rlSetLogLevel(R_LOG_LEVEL logLevel);





void rlSetModuleMask(U32 modMask);



void rlSetLogFileSizeLimit(U32 maxFileSize);




void rlSetNumOfLogFiles(U8 nMaxFiles);





void rlSetCircularBufferSize(U32 bufSize);




void rlSetRemoteLoggingFlag(S32 flag);




int rlHandleConInput(char ch);




void rlEnableDisableCore(S32 enable_core);



void rlEnaBleBufferedIO(void);



extern void rlUpdateRlogTti(void);



extern void rlResetLogRateLmt(void);



extern void rlResetLogRateLmt(void);




extern void rlStartLogCountLimit(void);



extern void rlStopLogCountLimit(void);

typedef int ptrdiff_t;
typedef long int wchar_t;



extern void *malloc (size_t __size) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__warn_unused_result__));


extern void *calloc (size_t __nmemb, size_t __size)
__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__warn_unused_result__));






extern void *realloc (void *__ptr, size_t __size)
__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));


extern void free (void *__ptr) __attribute__ ((__nothrow__ , __leaf__));


extern void cfree (void *__ptr) __attribute__ ((__nothrow__ , __leaf__));


extern void *memalign (size_t __alignment, size_t __size)
__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__warn_unused_result__));


extern void *valloc (size_t __size) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__warn_unused_result__));



extern void *pvalloc (size_t __size) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__warn_unused_result__));



extern void *(*__morecore) (ptrdiff_t __size);


extern void *__default_morecore (ptrdiff_t __size)
__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__));



struct mallinfo
{
  int arena;
  int ordblks;
  int smblks;
  int hblks;
  int hblkhd;
  int usmblks;
  int fsmblks;
  int uordblks;
  int fordblks;
  int keepcost;
};


extern struct mallinfo mallinfo (void) __attribute__ ((__nothrow__ , __leaf__));
extern int mallopt (int __param, int __val) __attribute__ ((__nothrow__ , __leaf__));



extern int malloc_trim (size_t __pad) __attribute__ ((__nothrow__ , __leaf__));



extern size_t malloc_usable_size (void *__ptr) __attribute__ ((__nothrow__ , __leaf__));


extern void malloc_stats (void) __attribute__ ((__nothrow__ , __leaf__));


extern int malloc_info (int __options, FILE *__fp) __attribute__ ((__nothrow__ , __leaf__));


extern void *malloc_get_state (void) __attribute__ ((__nothrow__ , __leaf__));



extern int malloc_set_state (void *__ptr) __attribute__ ((__nothrow__ , __leaf__));


extern void (*volatile __free_hook) (void *__ptr,
                                                   const void *)
__attribute__ ((__deprecated__));
extern void *(*volatile __malloc_hook)(size_t __size,
                                                     const void *)
__attribute__ ((__deprecated__));
extern void *(*volatile __realloc_hook)(void *__ptr,
                                                      size_t __size,
                                                      const void *)
__attribute__ ((__deprecated__));
extern void *(*volatile __memalign_hook)(size_t __alignment,
                                                       size_t __size,
                                                       const void *)
__attribute__ ((__deprecated__));
extern void (*volatile __after_morecore_hook) (void);


extern void __malloc_check_init (void) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__deprecated__));






typedef S8 Txt;

typedef U8 Ent;

typedef U8 Inst;

typedef struct entityId
{
   Ent ent;
   Inst inst;
} EntityId;



typedef S16 Elmnt;

typedef S16 ElmntInst1;

typedef S16 ElmntInst2;

typedef S16 ElmntInst3;

typedef struct elmntId
{
   Elmnt elmnt;
   ElmntInst1 elmntInst1;
   ElmntInst2 elmntInst2;
   ElmntInst3 elmntInst3;
} ElmntId;

typedef U8 Region;

typedef U8 Pool;

typedef U8 Prior;

typedef Prior Priority;

typedef U8 Route;

typedef U8 Data;

typedef U8 Selector;

typedef S16 Reason;

typedef U16 ProcId;

typedef U8 Event;

typedef U32 TranId;

typedef S16 IntNum;

typedef U16 TranNum;

typedef U16 CmIntfId;
typedef U16 CmIntfVer;
typedef struct pst
{
   ProcId dstProcId;
   ProcId srcProcId;

   Ent dstEnt;
   Inst dstInst;
   Ent srcEnt;
   Inst srcInst;

   Prior prior;
   Route route;
   Event event;
   Region region;

   Pool pool;
   Selector selector;
   CmIntfVer intfVer;
} Pst;



typedef struct systemId
{
   S16 mVer;
   S16 mRev;
   S16 bVer;
   S16 bRev;
   Txt *ptNmb;
} SystemId;





typedef struct protAddr
{
   U16 protType;
   U8 len;
   U8 preLen;
   U8 address[16];





}ProtAddr;

typedef struct protAddrTbl
{
   U8 count;
   ProtAddr addr[4];
}ProtAddrTbl;



typedef struct addrs
{
   U8 length;
   U8 strg[20];
} Addrs;

typedef struct shrtAddr
{
   U8 length;
   U8 strg[32];
} ShrtAddrs;

typedef struct lngAddr
{
   U8 length;
   U8 strg[64];
} LngAddrs;



typedef struct bndCfg
{
   Txt *usrId;
   U8 bufOwnshp;
   U8 flcTyp;
   U8 wdw;
   Ent ent;
   Inst inst;
   Region region;
   Pool pool;
   Prior prior;
   Route route;
   Addrs sapAdr;
   Selector selector;
} BndCfg;
typedef struct tskInit
{



   Ent ent;
   Inst inst;
   Region region;
   Pool pool;
   Reason reason;
   Bool cfgDone;
   Bool acnt;
   Bool usta;
   Bool trc;

   U32 dbgMask;
   Txt prntBuf[255];

   Txt *prntCirBuf;




   BndCfg lmBnd;
   ProcId procId;
   Pst lmPst;
} TskInit;


typedef S32 Cntr;

typedef U32 StsCntr;

typedef S16 LnkNmb;

typedef S8 VBit;

typedef S16 SuId;

typedef S16 SpId;

typedef S16 SuInstId;

typedef S16 SpInstId;

typedef U16 PortId;

typedef U8 Sapi;

typedef U8 Tei;

typedef U8 Ces;

typedef U32 Dlci;

typedef U16 CalRef;

typedef S16 Origin;

typedef U16 NwId;

typedef S16 Swtch;

typedef U8 Cause;

typedef U8 Dgn;

typedef S16 Action;

typedef S16 SeqS16;

typedef U16 SeqU16;

typedef S32 SeqS24;

typedef U32 SeqU24;

typedef U8 SetUpArb;

typedef U8 EvntType;

typedef U8 State;

typedef U8 Mode;

typedef S32 ConnId;

typedef U32 UConnId;

typedef U16 ProtId;

typedef U16 ChannelId;

typedef U8 Arr64U8[64];

typedef U16 Efa;

typedef U32 BitState;

typedef U8 CChanId;

typedef U16 MibOpCode;


typedef U16 MibStatus;

typedef U16 MibTblType;

typedef S32 MibReqId;

typedef U8 UstaType;
typedef S8 ChannelNo;
typedef S16 Baud;

typedef S16 PhysIntType;

typedef S16 PathConnType;

typedef S16 Parity;

typedef S16 CharLength;

typedef S16 StopBits;



typedef U32 IpAddr;

typedef U16 Port;

typedef U8 Cmd;

typedef U8 Flags;

typedef U8 Ttl;

typedef U8 Prec;

typedef U32 Window;

typedef U8 MtpStatus;

typedef U8 Credit;



typedef U32 CirId;

typedef U16 Cic;

typedef U32 SiInstId;



typedef U32 BiInstId;



typedef U32 TpInstId;



typedef U32 Oui;
typedef U16 Pid;
typedef U32 LlcId;
typedef struct octStrg
{
   S32 length;
   U8 val[132];
} OctStrg;

typedef struct tknHdr
{
   U8 pres;
   U8 spare1;
   U16 spare2;



} TknHdr;

typedef struct elmtHdr
{
   U8 pres;
   U8 actnInd;
   U16 compInd;



} ElmtHdr;



typedef struct tknU8
{
   U8 pres;
   U8 val;
   U16 spare1;



} TknU8;

typedef struct tknS8
{
   U8 pres;
   S8 val;
   U16 spare1;



} TknS8;

typedef struct tknU16
{
   U8 pres;
   U8 spare1;
   U16 val;



} TknU16;

typedef struct tknU32
{
   U8 pres;
   U8 spare1;
   U16 spare2;
   U32 val;
} TknU32;

typedef struct tknS32
{
   U8 pres;
   U8 spare1;
   U16 spare2;
   S32 val;
} TknS32;

typedef struct tknStrS
{
   U8 pres;
   U8 len;
   U16 spare1;




   U8 val[(22 + 3) & 0xffc];

} TknStrS;

typedef struct tknStrM
{
   U8 pres;
   U8 len;
   U16 spare1;




   U8 val[(32 + 3) & 0xffc];

} TknStrM;

typedef struct tknStr
{
   U8 pres;
   U8 len;
   U16 spare1;




   U8 val[(132 + 3) & 0xffc];

} TknStr;

typedef struct tknStrE
{
   U8 pres;
   U8 len;
   U16 spare1;




   U8 val[(255 + 3) & 0xffc];

} TknStrE;

typedef struct tknStrXL
{
   U16 len;
   U8 pres;
   U8 spare1;



   U8 *val;
} TknStrXL;

typedef struct tknStr4
{
   U8 pres;
   U8 len;
   U16 spare1;




   U8 val[4];

} TknStr4;

typedef struct tknStr12
{
   U8 pres;
   U8 len;
   U16 spare1;




   U8 val[12];

} TknStr12;

typedef struct tknStr32
{
   U8 pres;
   U8 len;
   U16 spare1;



   U8 val[32];
} TknStr32;

typedef struct tknStr64
{
   U8 pres;
   U8 len;
   U16 spare1;



   U8 val[64];
} TknStr64;

typedef struct tknStr132
{
   U8 pres;
   U8 len;
   U16 spare1;




   U8 val[132];

} TknStr132;

typedef struct tknStr256
{
   U8 pres;
   U8 len;
   U16 spare1;



   U8 val[256];
} TknStr256;

typedef struct tknOid
{
   U8 pres;
   U8 len;
   U16 spare1;






   U32 val[32];



} TknOid;

typedef struct tknBits
{
   U8 pres;
   U8 len;
   U16 spare1;




   U8 val[(7 + 3) & 0xffc];

} TknBits;

typedef struct elmtStr
{
   ElmtHdr eh;
   TknStr str;
} ElmtStr;

typedef struct cdPtyNmb
{
   ElmtHdr eh;
   TknU8 nmbPlanId;
   TknU8 typeNmb0;



   TknStrS nmbDigits;

} CdPtyNmb;

typedef struct redirNmb
{
   ElmtHdr eh;
   TknU8 nmbPlanId;
   TknU8 typeNmb;
   TknU8 screenInd;
   TknU8 presInd;
   TknU8 rsnRedirect;
   TknStrS nmbDigits;
} RedirNmb;

typedef struct srvClass
{
   U8 type;
   union
   {
      struct
      {
         Bool cr;
         Bool de;
      } fr;
      struct
      {
         Prior prior;
      } ma;
   } s;
} SrvClass;



typedef struct _ip
{
   U8 ip_hl;
   Prec ip_tos;
   U16 ip_len;
   U16 ip_id;
   U16 ip_off;
   Ttl ip_ttl;
   U8 ip_p;
   U16 ip_sum;
   IpAddr ip_src;
   IpAddr ip_dst;
} Ip;
typedef struct smCfg
{
   Ent ent;
   Inst inst;
   Region region;
   Pool pool;
   Priority prior;
   Route route;
   Selector selector;
} SmCfg;

typedef struct mem
{
   Region region;
   Pool pool;
   U16 spare;
} Mem;

typedef Mem MemoryId;


typedef struct resp
{
   Selector selector;
   Priority prior;
   Route route;
   MemoryId mem;
}Resp;

typedef struct tds_header
{
   U16 msgLen;
   U8 msgType;
   U8 version;
   U16 seqNmb;
   EntityId entId;
   ElmntId elmId;

   TranId transId;
   Resp response;

} Header;

typedef struct tmrCfg
{
   Bool enb;
   U16 val;
} TmrCfg;

typedef struct asyncCfg
{
   StopBits stopBits;
   CharLength charLength;
   Parity rxParity;
   Parity txParity;
} AsyncCfg;




typedef struct dateTime
{
   U8 month;
   U8 day;
   U8 year;
   U8 hour;
   U8 min;
   U8 sec;
   U8 tenths;




} DateTime;


typedef U64 EpcTime;


typedef struct cmStatus
{
   U16 status;
   U16 reason;
}CmStatus;


typedef struct cmAlarm
{
   DateTime dt;
   U16 category;
   U16 event;
   U16 cause;
}CmAlarm;



typedef struct duration
{
   U8 days;
   U8 hours;
   U8 mins;
   U8 secs;
   U8 tenths;
} Duration;
typedef struct ssmsgb Buffer;
typedef struct tknBuf
{
   U8 pres;
   U8 spare1;
   U16 spare2;



   Buffer *val;
} TknBuf;



typedef U32 CmIpAddr;







extern S16 cmPkDateTime (DateTime *dateTime, Buffer *mBuf);
extern S16 cmPkDuration (Duration *duration, Buffer *mBuf);
extern S16 cmPkPtr (U32 ptr, Buffer *mBuf);
extern S16 cmPkEntityId (EntityId *entityId, Buffer *mBuf);
extern S16 cmPkElmntId (ElmntId *elmntId, Buffer *mBuf);
extern S16 cmPkMemoryId (MemoryId *memoryId, Buffer *mBuf);


extern S16 cmPkSystemId (SystemId *systemId, Buffer *mBuf);
extern S16 cmPkAddrs (Addrs *addrs, Buffer *mBuf);
extern S16 cmPkProtAddr (ProtAddr *protAddr, Buffer *mBuf);
extern S16 cmPkProtAddrTbl (ProtAddrTbl *protAddr, Buffer *mBuf);
extern S16 cmPkShrtAddrs (ShrtAddrs *addrs, Buffer *mBuf);
extern S16 cmPkAddrMask (U8 *mask, Buffer *mBuf);
extern S16 cmPkBndCfg (BndCfg *bndCfg, Buffer *mBuf);
extern S16 cmPkPst (Pst *pst, Buffer *mBuf);
extern S16 cmPkElmtHdr (ElmtHdr *m, Buffer *mBuf);
extern S16 cmPkTknU8 (TknU8 *tknU8, Buffer *mBuf);
extern S16 cmPkTknS8 (TknS8 *tknS8, Buffer *mBuf);
extern S16 cmPkTknU16 (TknU16 *tknU16, Buffer *mBuf);
extern S16 cmPkTknU32 (TknU32 *tknU32, Buffer *mBuf);
extern S16 cmPkTknStr (TknStr *tknStr, Buffer *mBuf);
extern S16 cmPkTknStrM (TknStrM *tknStr, Buffer *mBuf);
extern S16 cmPkTknStrS (TknStrS *tknStr, Buffer *mBuf);
extern S16 cmPkTknStrE (TknStrE *tknStr, Buffer *mBuf);

extern S16 cmPkTknStr4 (TknStr4 *tknStr, Buffer *mBuf);
extern S16 cmPkTknStr12 (TknStr12 *tknStr, Buffer *mBuf);
extern S16 cmPkTknStr32 (TknStr32 *tknStr, Buffer *mBuf);
extern S16 cmPkTknStr64 (TknStr64 *tknStr, Buffer *mBuf);
extern S16 cmPkTknStr132 (TknStr132 *tknStr, Buffer *mBuf);
extern S16 cmPkTknStr256 (TknStr256 *tknStr, Buffer *mBuf);

 S16 cmPkTknS32 (TknS32 *tknS32, Buffer *mBuf);
 S16 cmPkTknOid (TknOid *tknOid, Buffer *mBuf);
 S16 cmPkTknBuf (TknBuf *tknBuf, Buffer *mBuf);






extern S16 cmPkHeader (Header *header, Buffer *mBuf);
extern S16 cmPkSmCfg (SmCfg *smCfg, Buffer *mBuf);
extern S16 cmPkTmrCfg (TmrCfg *tmrCfg, Buffer *mBuf);
extern S16 cmPkCmStatus (CmStatus *status, Buffer *mBuf);
extern S16 cmPkCmAlarm (CmAlarm *alrm, Buffer *mBuf);





extern S16 cmUnpkDateTime (DateTime *dateTime, Buffer *mBuf);
extern S16 cmUnpkDuration (Duration *duration, Buffer *mBuf);
extern S16 cmUnpkPtr (U32 *ptr, Buffer *mBuf);
extern S16 cmUnpkEntityId (EntityId *entityId, Buffer *mBuf);
extern S16 cmUnpkElmntId (ElmntId *elmntId, Buffer *mBuf);
extern S16 cmUnpkMemoryId (MemoryId *memoryId, Buffer *mBuf);


extern S16 cmUnpkSystemId (SystemId *systemId, Buffer *mBuf);
extern S16 cmUnpkAddrs (Addrs *addrs, Buffer *mBuf);
extern S16 cmUnpkProtAddr (ProtAddr *protAddr, Buffer *mBuf);
extern S16 cmUnpkProtAddrTbl (ProtAddrTbl *protAddr, Buffer *mBuf);
extern S16 cmUnpkShrtAddrs (ShrtAddrs *addrs, Buffer *mBuf);
extern S16 cmUnpkAddrMask (U8 *mask, Buffer *mBuf);
extern S16 cmUnpkBndCfg (BndCfg *bndCfg, Buffer *mBuf);
extern S16 cmUnpkPst (Pst *pst, Buffer *mBuf);
extern S16 cmUnpkElmtHdr (ElmtHdr *m, Buffer *mBuf);
extern S16 cmUnpkTknU8 (TknU8 *tknU8, Buffer *mBuf);
extern S16 cmUnpkTknS8 (TknS8 *tknS8, Buffer *mBuf);
extern S16 cmUnpkTknU16 (TknU16 *tknU16, Buffer *mBuf);
extern S16 cmUnpkTknU32 (TknU32 *tknU32, Buffer *mBuf);
extern S16 cmUnpkTknStr (TknStr *tknStr, Buffer *mBuf);
extern S16 cmUnpkTknStrM (TknStrM *tknStr, Buffer *mBuf);
extern S16 cmUnpkTknStrS (TknStrS *tknStr, Buffer *mBuf);
extern S16 cmUnpkTknStrE (TknStrE *tknStr, Buffer *mBuf);

extern S16 cmUnpkTknStr4 (TknStr4 *tknStr, Buffer *mBuf);
extern S16 cmUnpkTknStr12 (TknStr12 *tknStr, Buffer *mBuf);
extern S16 cmUnpkTknStr32 (TknStr32 *tknStr, Buffer *mBuf);
extern S16 cmUnpkTknStr64 (TknStr64 *tknStr, Buffer *mBuf);
extern S16 cmUnpkTknStr132 (TknStr132 *tknStr, Buffer *mBuf);
extern S16 cmUnpkTknStr256 (TknStr256 *tknStr, Buffer *mBuf);

 S16 cmUnpkTknS32 (TknS32 *tknS32, Buffer *mBuf);
 S16 cmUnpkTknOid (TknOid *tknOid, Buffer *mBuf);
 S16 cmUnpkTknBuf (TknBuf *tknBuf, Buffer **mBuf);






extern S16 cmUnpkHeader (Header *header, Buffer *mBuf);
extern S16 cmUnpkSmCfg (SmCfg *smCfg, Buffer *mBuf);
extern S16 cmUnpkTmrCfg (TmrCfg *tmrCfg, Buffer *mBuf);
extern S16 cmUnpkCmStatus (CmStatus *status, Buffer *mBuf);
extern S16 cmUnpkCmAlarm (CmAlarm *alrm, Buffer *mBuf);
typedef S16 Status;

typedef U32 Ticks;




typedef S16 MsgLen;


typedef S16 Order;




typedef U32 Size;
typedef S32 PtrOff;


typedef U32 QLen;

typedef QLen BufQLen;

typedef S16 RegSize;

typedef S16 DPoolSize;

typedef U16 Random;

typedef S16 Seq;

typedef U32 CoreId;


typedef U32 ErrCls;

typedef U32 ErrCode;

typedef U32 ErrVal;

typedef S16 VectNmb;

typedef S16 Ttype;

typedef S8 Sema;
extern S16 msOptInd;
extern S8 *msOptArg;
extern Txt **msArgv;
extern S16 msArgc;




typedef U8 SSTskId;




typedef S32 SSTskPrior;
struct ssmsgb
{
   S8 refCnt;
   struct ssmsgb *b_next;
   struct ssmsgb *b_prev;
   struct ssmsgb *b_cont;
   U8 *b_rptr;
   U8 *b_wptr;
   struct ssdatab *b_datap;
};


typedef struct ssQueue
{
   Buffer *head;
   Buffer *tail;
   QLen crntSize;

} Queue;



typedef struct sMemCtl
{
   U8 op;

   union
   {
      struct
      {
         Data *vaddr;
         Data **paddr;
      } vtop;

      struct
      {
         Size size;
         Status *status;
      } chkres;
   } u;

} SMemCtl;
typedef S16 (*SsAlloc) (Void *, Size *, U32, Data **);





typedef S16 (*SsFree) (Void *, Data *, Size);

typedef S16 (*SsCtl) (Void *, Event, SMemCtl *);




typedef struct sRegInfo
{
   Void *regCb;
   U32 flags;




   Data *start;
   Size size;
   SsAlloc alloc;
   SsFree free;
   SsCtl ctl;

} SRegInfo;
typedef struct cmTimer
{
   S16 tmrEvnt;
   U32 tqExpire;
   U32 cb;
   struct cmTimer *next;
   struct cmTimer *prev;
   U8 ent2bUpd;

   U16 entIdx;
} CmTimer;

typedef struct cmTqCp
{
   U32 nxtEnt;
   U32 tmrLen;
   CmTimer *tmp;
} CmTqCp;

typedef struct cmTqType
{
   CmTimer *first;
   CmTimer *tail;
} CmTqType;

typedef struct cmTmrArg
{
   CmTqCp *tqCp;
   CmTqType *tq;
   CmTimer *timers;
   U32 cb;
   S16 evnt;
   U32 wait;
   U8 tNum;
   U8 max;
} CmTmrArg;




typedef Void (*PFV) (U32, S16);

extern Void cmInitTimers (CmTimer* timers, U8 max);
extern Void cmPlcCbTq (CmTmrArg* arg);
extern Void cmRmvCbTq (CmTmrArg* arg);
extern Void cmPrcTmr (CmTqCp* tqCp, CmTqType* tq, PFV func);
extern Void cmRstCbTq (CmTmrArg* arg);
typedef S8 SsdTTskEntry;



typedef struct ssdSTskEntry
{
   pthread_t tId;
   Ent ent;
   Inst inst;
   pthread_mutex_t lock;


   U32 lwpId;

} SsdSTskEntry;




typedef struct ssdDrvrTskEntry
{
   Bool flag;

} SsdDrvrTskEntry;




typedef struct ssdTmrEntry
{
   CmTimer timers[1];

} SsdTmrEntry;



typedef S8 SsdDPoolEntry;



typedef S8 SsdSPoolEntry;



typedef S8 SsdPoolEntry;



typedef S8 SsdRegionEntry;





typedef struct ssdOs
{
   unsigned randSeed;

   Ticks sysTicks;

   pthread_t tmrHdlrTID;
   CmTqCp tmrTqCp;
   CmTqType tmrTq[45];

   sem_t ssStarted;

   FILE *conInFp;
   FILE *conOutFp;
   pthread_t conHdlrTID;



   FILE *fileOutFp;



   pthread_t isTskHdlrTID;
   int isFildes[2];

   Bool sigEvnt;

} SsdOs;


typedef struct mtBktCfg
{
   Size blkSize;
   U32 numBlks;
} MtBktCfg;

typedef struct mtRegCfg
{
   Region regionId;
   U16 numBkts;
   Size heapsize;
   MtBktCfg bkt[5];
} MtRegCfg;

typedef struct mtMemCfg
{
   U8 numRegions;
   MtRegCfg region[8];
} MtMemCfg;
extern U32 gt[128];
typedef S16 (*PAIFS16) (Ent ent,Inst inst,Region region,Reason reason );





typedef S16 (*PAIFTMRS16) (Ent ent, Inst inst);
typedef S16 (*PATFS16) (Prior prior,Route route,Ent ent,Inst inst,Buffer *mBuf);



typedef S16 (*ActvTsk) (Pst *pst, Buffer *mBuf);

typedef struct uProc UProc;

typedef void (*ISTsk) (Inst inst);




struct uProc
{
   Inst inst;
   ProcId low;
   ProcId high;
   ActvTsk actvTsk;
   U16 isFlag;
   ISTsk isTsk;
};






extern S16 SChekMemUtilization (Region region,Bool *memAlarm);

extern Void prntMem (Data *strtAdr,S16 len);
extern Void prntMsg (Buffer *mBuf);
extern Void prntMsg1 (Buffer *mBuf,S16 src,S16 dst);
extern S16 tst (void );
extern S16 rdConQ (Data data);

extern S16 SPkS8 (S8 val,Buffer *mBuf);
extern S16 SPkU8 (U8 val,Buffer *mBuf);
extern S16 SPkS16 (S16 val,Buffer *mBuf);
extern S16 SPkU16 (U16 val,Buffer *mBuf);
extern S16 SPkS32 (S32 val,Buffer *mBuf);
extern S16 SPkU32 (U32 val,Buffer *mBuf);


extern S16 SPkF32 (F32 val,Buffer *mBuf);
extern S16 SPkF64 (F64 val,Buffer *mBuf);

extern S16 SUnpkS8 (S8 *val,Buffer *mBuf);
extern S16 SUnpkU8 (U8 *val,Buffer *mBuf);
extern S16 SUnpkS16 (S16 *val,Buffer *mBuf);
extern S16 SUnpkU16 (U16 *val,Buffer *mBuf);
extern S16 SUnpkS32 (S32 *val,Buffer *mBuf);
extern S16 SUnpkU32 (U32 *val,Buffer *mBuf);


extern S16 SUnpkF32 (F32 *val,Buffer *mBuf);
extern S16 SUnpkF64 (F64 *val,Buffer *mBuf);

extern S16 SPrint (Txt *buf);
extern S16 SDisplay (S16 chan,Txt *buf);
extern S16 SPrntMsg (Buffer *mBuf,S16 src,S16 dst);
extern S16 SInitQueue (Queue *q);

extern S16 SQueueFirst (Buffer *buf,Queue *q);
extern S16 SQueueLast (Buffer *buf,Queue *q);
extern S16 SDequeueFirst (Buffer * *bufPtr,Queue *q);
extern S16 SDequeueLast (Buffer * *bufPtr,Queue *q);

extern S16 SFlushQueue (Queue *q);
extern S16 SCatQueue (Queue *q1,Queue *q2,Order order);
extern S16 SFndLenQueue (Queue *q,QLen *lngPtr);
extern S16 SExamQueue (Buffer **bufPtr,Queue *q,QLen idx);
extern S16 SAddQueue (Buffer *buf,Queue *q,QLen idx);
extern S16 SRemQueue (Buffer **bufPtr,Queue *q,QLen idx);
extern S16 SGetDBuf (Region region,Pool pool,Buffer * *bufPtr);
extern S16 SPutDBuf (Region region,Pool pool,Buffer *buf);
extern S16 SPutMsgToRegion (Region region, Buffer *buf);
extern S16 SPutMsg (Buffer *mBuf);
extern S16 SGetMsg (Region region, Pool pool, Buffer * *mBufPtr);
extern S16 SGetSBuf (Region region,Pool pool, Data * *bufPtr, Size size);
extern S16 SPutSBuf (Region region, Pool pool, Data *buf, Size size);
extern S16 SGetStaticBuffer (Region region,Pool pool, Data * *bufPtr, Size size, U8 memType);
extern S16 SPutStaticBuffer (Region region, Pool pool, Data *buf, Size size, U8 memType);
extern S16 SGetSMem (Region region,Size size,Pool *poolPtr);
extern S16 SPutSMem (Region region,Pool pool);
extern S16 SInitMsg (Buffer *mBuf);
extern S16 SAddPreMsg (Data data,Buffer *mBuf);
extern S16 SAddPstMsg (Data data,Buffer *mBuf);

extern S16 SAddPreMsgMultInOrder (Data *src,MsgLen cnt,Buffer *mBuf);
extern S16 SRemPreMsg (Data *dataPtr,Buffer *mBuf);
extern S16 SRemPreMsgRegion (Region region, Data *dataPtr,Buffer *mBuf);
extern S16 SCatMsgRegion (Region region, Buffer *mBuf1,Buffer *mBuf2,Order order);
extern S16 SSegMsgRegion (Region region, Buffer *mBuf1,MsgLen idx,Buffer **mBuf2);
extern int SCreatePThread (pthread_t* tid, pthread_attr_t* attr, void *(*start_routine) (void *), void* arg);
extern S16 SRemPstMsg (Data *dataPtr,Buffer *mBuf);







extern S16 SAddPreMsgMult (Data *src,MsgLen cnt,Buffer *mBuf);
extern S16 SAddPstMsgMult (Data *src,MsgLen cnt,Buffer *mBuf);

extern S16 SGetPstMsgMult (MsgLen cnt,Buffer *mBuf);
extern S16 SRemPreMsgMult (Data *dst,MsgLen cnt,Buffer *mBuf);
extern S16 SRemPstMsgMult (Data *dst,MsgLen cnt,Buffer *mBuf);
extern S16 SRepMsg (Data data,Buffer *mBuf,MsgLen idx);
extern S16 SExamMsg (Data *dataPtr,Buffer *mBuf,MsgLen idx);

extern S16 SGetDataFrmMsg (Buffer *mBuf, Data *dataPtr, MsgLen idx, MsgLen dataLen);
extern S16 SFndLenMsg (Buffer *mBuf,MsgLen *lngPtr);
extern S16 SCatMsg (Buffer *mBuf1,Buffer *mBuf2,Order order);




extern S16 SSegMsg (Buffer *mBuf1,MsgLen idx,Buffer **mBuf2);

extern S16 SSwapMsg (Buffer *mBuf1, Buffer *mBuf2);
extern S16 SCpyMsgFix (Buffer *srcMbuf,MsgLen srcIdx,MsgLen cnt, Data *dstBuf,MsgLen *cCnt)
                                       ;
extern S16 SCpyFixMsg (Data *srcBuf,Buffer *dstMbuf, MsgLen dstIdx,MsgLen cnt,MsgLen *cCnt)
                                                   ;
extern S16 SCompressMsg (Buffer *mBuf);
extern S16 SCpyMsgMsg (Buffer *mBuf, Region region, Pool pool, Buffer **dstBuf)
                             ;
extern S16 SAddMsgRef (Buffer *mBuf, Region region, Pool pool, Buffer **dstBuf)
                             ;
extern S16 SIncMsgRef(Buffer *srcBuf, Region dstRegion, Pool dstPool, Buffer **dstBuf);






extern S16 SChkRes (Region region,Pool pool,Status *status);
extern S16 SChkResUtl (Region region,U8 *wSum);
extern S16 SSetDateTime (DateTime *dt);
extern S16 SGetDateTime (DateTime *dt);






extern S16 SGetEpcTime (EpcTime *et);

extern S16 SGetTimeStamp ( S8 *ts);
extern S16 SGetSysTime (Ticks *sysTime);
extern S16 SGetRefTime (U32 refTime, U32 *sec, U32 *usec);
extern S16 SRandom (Random *value);
extern S16 SError (Seq seq,Reason reason);
extern Void SLogError (Ent ent, Inst inst, ProcId procId, Txt *file, S32 line, ErrCls errCls, ErrCode errCode, ErrVal errVal, Txt *errDesc)

                                                    ;

extern U32 SGetSystemTsk (Void);




extern S16 SRegInit (Ent ent,Inst inst,PAIFS16 initFnct);
extern S16 SRegActvTsk (Ent ent,Inst inst,Ttype ttype,Prior prior, ActvTsk actvTsk)
                                               ;




extern S16 SRegCfgTmr (Ent ent, Inst inst, S16 period, S16 units, PFS16 tmrFnct)



                                            ;


extern S16 SRegCfgTmrMt (Ent ent, Inst inst, S16 period, S16 units, PAIFTMRS16 tmrFnctMt)



                                                     ;

extern S16 SDeregCfgTmr (Ent ent, Inst inst, S16 period, S16 units, PFS16 tmrFnct)



                                              ;


extern S16 SDeregCfgTmrMt (Ent ent, Inst inst, S16 period, S16 units, PAIFTMRS16 tmrFnctMt)



                                                       ;
extern S16 SPstTsk (Pst *pst, Buffer *mBuf);






extern S16 SRegDrvrTsk (Inst inst, ProcId low, ProcId high, ActvTsk actvTsk, ISTsk isTsk)
                                                            ;

extern S16 SDeregDrvrTsk (Inst channel);



extern S16 SRegRtrTsk (Route *, Cntr, ActvTsk);
extern S16 SDeregRtrTsk (Route *, Cntr);



extern S16 SAttachPtrToBuf ( Region region, Pool pool, Data *ptr, MsgLen totalLen, Buffer** mBuf )





  ;





typedef S8 SsAffinityMode;


typedef struct {
  U32 numCores;
  U32 threadsPerCore;
  U32 threadRegister[64];
} SCpuInfo;

extern S16 SRegCpuInfo (SCpuInfo *cpuInfo);
extern S16 SSetAffinity (SSTskId *tskId, SsAffinityMode mode, U32 coreId, SSTskId *tskAssociatedTskId);
extern S16 SGetAffinity (SSTskId *tskId, U32 *coreId);







extern S16 SAddDBufPst (Buffer *mBuf, Buffer *dBuf);
extern S16 SAddDBufPre (Buffer *mBuf, Buffer *dBuf);
extern S16 SRemDBufPst (Buffer *mBuf, Buffer **dBuf);
extern S16 SRemDBufPre (Buffer *mBuf, Buffer **dBuf);
extern S16 SGetDataRx (Buffer *dBuf, MsgLen pad, Data **dat, MsgLen *mLen);
extern S16 SGetDataTx (Buffer *dBuf, Data **dat, MsgLen *mLen);
extern S16 SUpdMsg (Buffer *mBuf, Buffer *dBuf, MsgLen mLen);
extern S16 SCacheFlush (U16 cache_type, Data *addr, Size size);
extern S16 SCacheInvalidate (U16 cache_type, Data *addr, Size size);
extern S16 SAlignDBufEven (Buffer *dBuf);
extern S16 SAlignDBuf (Buffer *dBuf, U32 align);
extern S16 SInitNxtDBuf (Buffer *mBuf);
extern S16 SGetNxtDBuf (Buffer *mBuf, Buffer **dBuf);
extern S16 SChkNxtDBuf (Buffer *mBuf);
extern S16 SSetIntPend (U16 id, Bool flag);
extern S16 SChkMsg (Buffer *mBuf);
extern S16 SDeregInitTskTmr (Ent ent,Inst inst);
extern S16 SExitTsk (void );
extern S16 SExitInt (void );
extern S16 SHoldInt (void );
extern S16 SRelInt (void );
extern S16 SEnbInt (void );
extern S16 SDisInt (void );
extern S16 SGetVect (VectNmb vectNmb,PIF *vectFnct);
extern S16 SPutVect (VectNmb vectNmb,PIF vectFnct);






extern S16 SInitSema (Region region, Sema *sema);
extern S16 SRelSema (Region region, Sema sema);
extern S16 SGetSema (Region region, Sema sema);
extern S16 SActvInit (Ent ent,Inst inst,Region region,Reason reason);
extern S16 SActvTsk (Prior prior,Route route,Ent srcEnt, Inst srcInst,Buffer *mBuf)
                                       ;
extern S16 SActvTmr (void );
extern S16 SGetOpt (int argc,char **argv,char *opts);



extern S16 SGetEntInst (Ent *ent, Inst *inst);
extern S16 SSetEntInst (Ent ent, Inst inst);
extern ProcId SFndProcId (void);
extern Void SSetProcId (ProcId pId);


extern S16 SGetDBufSiz (Region region, Pool pool, S16 *size);
extern S16 SGetStrtIdx (Region region, Pool pool, S16 *idx);
extern S16 SGetEndIdx (Region region, Pool pool, S16 *idx);
extern S16 SGetStrtPad (Region region, Pool pool, S16 *pad);
extern Void SExit (Void);




extern S16 SRegTTsk (Ent ent, Inst inst, Ttype type, Prior prior, PAIFS16 initTsk, ActvTsk actvTsk)




                                           ;

extern S16 SRegCbTsk (Ent ent, Inst inst, ActvTsk actvTsk)

                                           ;
extern S16 SDeregTTsk (Ent ent, Inst inst);
extern S16 SCreateSTsk (SSTskPrior tskPrior, SSTskId *tskId);
extern S16 SDestroySTsk (SSTskId tskId);



extern S16 SAttachTTsk (Ent ent, Inst inst, SSTskId tskId);
extern S16 SDetachTTsk (Ent ent, Inst inst);







extern S16 SRegRegion (Region region, SRegInfo *regInfo);
extern S16 SDeregRegion (Region region);
extern S16 SRegDynRegion (Region region, SRegInfo *regInfo);
extern S16 SAlloc (Region region, Size *size, U32 flags, Data **ptr);
extern S16 SFree (Region region, Data *ptr, Size size);


extern S16 SGetBufRegionPool (Buffer *mBuf, Region *region, Pool *pool);
extern S16 SThreadYield (void);


extern S16 SInitLock (pthread_mutex_t *lock,U8 type);
extern S16 SLock (pthread_mutex_t *lock);
extern S16 SUnlock (pthread_mutex_t *lock);
extern S16 SDestroyLock (pthread_mutex_t *lock);


extern S16 SInitSemaphore (sem_t *sem, U8 value);
extern S16 SWaitSemaphore (sem_t *sem);
extern S16 SPostSemaphore (sem_t *sem);
extern S16 SDestroySemaphore (sem_t *sem);
extern S16 smActvInit (Ent ent, Inst inst, Region region, Reason reason);
extern S16 smInitExt (void);


extern S16 smActvTsk (Pst *pst, Buffer *mBuf);
extern S8* SGetConfigPath (Void);


extern S16 SCpyPartMsg (Buffer *srcBuf, MsgLen idx, MsgLen cnt, Buffer *dstBuf);
extern S16 SRepPartMsg (Buffer *srcBuf, MsgLen idx, MsgLen cnt, Buffer *dstBuf);
extern S16 SMovPartMsg (Buffer *srcBuf, MsgLen idx, Buffer *dstBuf);
extern S16 SPkMsgMult (Data *src, MsgLen cnt, Buffer *mBuf);
extern S16 SGetReadPtr (Buffer *mBuf, U8** data, MsgLen *len);

typedef enum
{
   SS_SHARABLE_MEMORY,
   SS_NON_SHARABLE_MEMORY
}ssMemoryType;
extern S16 SStartTask (volatile U32 *startTime, U32 tarkId);
extern S16 SStopTask (volatile U32 startTime,U32 taskId);
extern Void SIncrementTtiCount(Void);
extern Ticks SGetTtiCount(Void);
extern Void ysPrntBkTrace(Void);
extern Void ssMlogInit(Void);
extern Void ssMlogIncrCounter(Void);


extern Void ssRegMainThread(Void);






extern S16 ssGetDBufOfSize(Region region,Size size,Buffer **dBuf);


typedef TknU8 TknPres;


typedef TknU8 TknBool;

typedef struct tknS16
{
   U8 pres;
   U8 spare1;
   S16 val;



} TknS16;


typedef struct tknStr8
{
   U8 pres;
   U8 len;
   U16 spare1;



   U8 val[8];
} TknStr8;


typedef struct tknStr16
{
   U8 pres;
   U8 len;
   U16 spare1;



   U8 val[16];
} TknStr16;

typedef struct tknStrOSXL
{
   U8 pres;
   U8 spare1;
   U16 len;



   U8 *val;
} TknStrOSXL;


typedef TknStr4 TknBStr32;


typedef TknStrOSXL TknStrBSXL;







typedef struct tknStrBMP4
{
   U8 pres;
   U8 len;
   U16 spare1;



   U16 val[4];
} TknStrBMP4;


typedef struct tknStrBMPXL
{
   U8 pres;
   U8 spare1;
   U16 len;



   U16 *val;
} TknStrBMPXL;







typedef struct tknStrUNI4
{
   U8 pres;
   U8 len;
   U16 spare1;



   U32 val[4];
} TknStrUNI4;

typedef struct tknStrUNIXL
{
   U8 pres;
   U8 spare1;
   U16 len;



   U32 *val;
} TknStrUNIXL;


extern S16 cmPkTknPres (TknPres *tknPres, Buffer *mBuf);
extern S16 cmPkTknS16 (TknS16 *tknS16, Buffer *mBuf);
extern S16 cmPkTknBStr32 (TknBStr32 *tknbStr32, Buffer *mBuf);
extern S16 cmPkTknStr8 (TknStr8 *tknStr8, Buffer *mBuf);
extern S16 cmPkTknStr16 (TknStr16 *tknStr16, Buffer *mBuf);
extern S16 cmPkTknStrOSXL (TknStrOSXL *tknStrOSXL, Buffer *mBuf);
extern S16 cmPkTknStrBSXL (TknStrBSXL *tknStrBSXL, Buffer *mBuf);
extern S16 cmPkTknStrBMP4 (TknStrBMP4 *tknStrBMP4, Buffer *mBuf);
extern S16 cmPkTknStrBMPXL (TknStrBMPXL *tknStrBMPXL, Buffer *mBuf);
extern S16 cmPkTknStrUNI4 (TknStrUNI4 *tknStrUNI4, Buffer *mBuf);
extern S16 cmPkTknStrUNIXL (TknStrUNIXL *tknStrUNIXL, Buffer *mBuf);




extern S16 cmUnpkTknPres (TknPres *tknPres, Buffer *mBuf);
extern S16 cmUnpkTknS16 (TknS16 *tknS16, Buffer *mBuf);
extern S16 cmUnpkTknBStr32 (TknBStr32 *tknBStr32, Buffer *mBuf);
extern S16 cmUnpkTknStr8 (TknStr8 *tknStr8, Buffer *mBuf);
extern S16 cmUnpkTknStr16 (TknStr16 *tknStr16, Buffer *mBuf);
extern S16 cmUnpkTknStrOSXL (TknStrOSXL *tknStrOSXL, Buffer *mBuf, Ptr ptr)
                                                ;
extern S16 cmUnpkTknStrBSXL (TknStrBSXL *tknStrBSXL, Ptr ptr, Buffer *mBuf)
                                                     ;
extern S16 cmUnpkTknStrBMP4 (TknStrBMP4 *tknStrBMP4, Buffer *mBuf);
extern S16 cmUnpkTknStrBMPXL (TknStrBMPXL *tknStrBMPXL, Buffer *mBuf, Ptr ptr)
                                                ;
extern S16 cmUnpkTknStrUNI4 (TknStrUNI4 *tknStrUNI4, Buffer *mBuf);
extern S16 cmUnpkTknStrUNIXL (TknStrUNIXL *tknStrUNIXL, Buffer *mBuf, Ptr ptr)
                                                ;
typedef struct cmMemCb
{
   Size maxSize;
   Mem sMem;
   U32 memAllocated;
   U32 initPtr;
   U32 runPtr;
} CmMemCb;




typedef struct cmMemList CmMemList;

struct cmMemList
{
   CmMemList *next;
   CmMemList *prev;

   Size size;
};





typedef struct cmMemListCp
{
   CmMemList *first;
   CmMemList *last;
   U32 count;
   CmMemCb memCb;
}CmMemListCp;




typedef struct cmMemStatus
{
   Mem sMem;
   U32 memBlkCnt;
   Size maxBlkSize;
   Size memAllocated;
} CmMemStatus;
extern S16 cmAllocEvnt ( Size evntSize, Size maxBlkSize, Mem *sMem, Ptr *ptr)



                                              ;

extern Void cmInitMemCp ( CmMemListCp *memCp, Size maxBlkSize, Mem *sMem )


                                                 ;







extern S16 cmGetMem ( Ptr memPtr, Size size, Ptr *allocPtr)


                                               ;

extern Void cmFreeMem ( Ptr memPtr)
                                            ;

extern Void cmGetMemStatus ( Ptr memPtr, CmMemStatus *status)

                                                       ;
typedef struct cmLList CmLList;
typedef struct cmLListCp CmLListCp;


struct cmLList
{
   CmLList *next;
   CmLList *prev;
   U32 node;
};

struct cmLListCp
{
   CmLList *first;
   CmLList *last;
   CmLList *crnt;
   U32 count;
};

extern Void cmLListInit (CmLListCp *lList);
extern Void cmLListAdd2Head (CmLListCp *lList, CmLList *node);
extern Void cmLListAdd2Tail (CmLListCp *lList, CmLList *node);
extern Void cmLListInsCrnt (CmLListCp *lList, CmLList *node);

extern Void cmLListInsAfterCrnt (CmLListCp *lList, CmLList *node);
extern CmLList *cmLListDelFrm (CmLListCp *lList, CmLList *node);
extern Void cmLListCatLList ( CmLListCp *list1, CmLListCp *list2);
typedef struct cmHashListCp CmHashListCp;




typedef S16 (* CmHashFunc) (CmHashListCp *hashListCp, U8 *key, U16 keyLen, U16 *idx)
                                                        ;


typedef struct cmListEnt CmListEnt;

struct cmListEnt
{
   CmListEnt *next;
   CmListEnt *prev;
};
typedef struct cmHashListEnt
{
   CmListEnt list;
   U8 *key;
   U16 keyLen;
   U16 hashVal;
} CmHashListEnt;



struct cmHashListCp
{

   CmListEnt *hl;



   Region region;
   Pool pool;
   U16 nmbBins;
   U16 binBitMask;
   U8 nmbBinBits;

   U16 nmbEnt;

   U16 offset;
   Bool dupFlg;
   U16 keyType;
   CmHashFunc hashFunc;
};




extern S16 cmHashListInit ( CmHashListCp *hashListCp, U16 nmbBins, U16 offset, Bool dupFlg, U16 keyType, Region region, Pool pool)






                                 ;

extern S16 cmHashListDeinit ( CmHashListCp *hashListCp)
                                        ;

extern S16 cmHashListInsert ( CmHashListCp *hashListCp, U32 entry, U8 *key, U16 keyLen)



                                   ;

extern S16 cmHashListDelete ( CmHashListCp *hashListCp, U32 entry)

                                  ;

extern S16 cmHashListFind ( CmHashListCp *hashListCp, U8 *key, U16 keyLen, U16 seqNmb, U32 *entry)




                                   ;

extern S16 cmHashListGetNext ( CmHashListCp *hashListCp, U32 prevEnt, U32 *entry)


                                   ;
extern S16 cmHashListQuery ( CmHashListCp *hashListCp, U8 queryType, U16 *result)


                                    ;



extern S16 cmHashListOAInsert ( CmHashListCp *hashListCp, U32 entry, U8 *key, U16 keyLen)



                                   ;
typedef U8 CmLteRbId;


typedef U16 CmLteCellId;


typedef U16 CmLteRnti;


typedef U8 CmLteRlcMode;


typedef U8 CmLteLcId;


typedef U8 CmLteLcType;


typedef U8 CmLteTrchType;


typedef U8 CmLteContResId[6];


typedef struct cmLteRlcId
{
  CmLteRbId rbId;
  U8 rbType;
  CmLteRnti ueId;
  CmLteCellId cellId;
}CmLteRlcId;


typedef struct cmLteTimingInfo
{
   U16 sfn;
   U8 subframe;
} CmLteTimingInfo;


typedef struct cmLtePdcpId
{
   CmLteCellId cellId;
   CmLteRnti ueId;
   CmLteRbId rbId;
   U8 rbType;
} CmLtePdcpId;


typedef struct cmLtePoolInfo
{
   U32 poolSize;
   U32 totAvailable;
   U32 crntUsed;
   U32 maxUsed;
} CmLtePoolInfo;

typedef struct cmLteRegionInfo
{
   U8 regionType;
   U8 regionId;
   U8 numPools;
   U8 isGenMemInfoUpdated;
   CmLtePoolInfo poolInfo[6];
}CmLteRegionInfo;

typedef struct cmLteMemInfo
{
   U8 numRegions;
   U8 idx;
   CmLteRegionInfo regInfo[5];
}CmLteMemInfo;


typedef struct cmLteCpuUtilInfo
{
   U32 avgCpuUtil;
   U32 maxCpuUtil;
}CmLteCpuUtilInfo;


typedef struct cmLteCpuInfo
{
   U8 numCores;
   CmLteCpuUtilInfo cpuUtil[10];
}CmLteCpuInfo;

typedef struct cmCpuUtilStatsInfo
{
   U32 numSamples;
   U32 maxCpuUtil;
   U32 totCpuUtil;
}CmCpuUtilStatsInfo;


typedef struct cmCpuStatsInfo
{
   U8 numCores;
   CmCpuUtilStatsInfo cpuUtil[10];
}CmCpuStatsInfo;





typedef U32 CntrSts;


typedef enum cmLteAggrLvl
{
   CM_LTE_AGGR_LVL1 = 1,
   CM_LTE_AGGR_LVL2 = 2,
   CM_LTE_AGGR_LVL4 = 3,
   CM_LTE_AGGR_LVL8 = 4
} CmLteAggrLvl;


typedef enum cmLteUeCategory
{
   CM_LTE_UE_CAT_1 = 1,
   CM_LTE_UE_CAT_2,
   CM_LTE_UE_CAT_3,
   CM_LTE_UE_CAT_4,
   CM_LTE_UE_CAT_5,
   CM_LTE_UE_CAT_6,
   CM_LTE_UE_CAT_7,
   CM_LTE_UE_CAT_8
} CmLteUeCategory;





extern S16 cmUpdateSsiMemInfo(CmLteMemInfo *mInfo);

extern S16 cmFillMemUtilizationMeas(CmLteMemInfo *memoryInfo,CmLteMemInfo *memInfo);

extern S16 cmClearMemUtilizationCounter(CmLteMemInfo *memInfo);
extern S16 UpdateSocMemInfo(U8 area , CmLteMemInfo *mInfo);

extern S16 cmFillCpuUtilizationMeas(CmLteCpuInfo *cpuMeasInfo,CmCpuStatsInfo *cpuInfo);

extern S16 cmClearCpuUtilizationCounter(CmCpuStatsInfo *cpuInfo);
extern Void UpdateSocCpuInfo(CmCpuStatsInfo *cpuInfo,U8 Idx);

extern S16 SGetRegPoolInfo(U8* numRegion, U8* numPool);


extern S16 cmPkLteRlcId ( CmLteRlcId *param, Buffer *mBuf )


  ;

extern S16 cmPkLteTimingInfo ( CmLteTimingInfo *param, Buffer *mBuf )


  ;

extern S16 cmPkLtePdcpId ( CmLtePdcpId *param, Buffer *mBuf )


  ;


extern S16 cmUnpkLteRlcId ( CmLteRlcId *param, Buffer *mBuf )


  ;

extern S16 cmUnpkLteTimingInfo ( CmLteTimingInfo *param, Buffer *mBuf )


  ;

extern S16 cmUnpkLtePdcpId ( CmLtePdcpId *param, Buffer *mBuf )


  ;



typedef struct cmTtiProc
{
 U32 totTtiProcessingTime;
 U32 numOfTti;
 U32 maxTtiProcessingTime;
 U32 ttiStretchCount;
 U32 ttiThresholdExceedCount;

 U32 phyReptTtiStretchCount;
}CmTtiProc;

extern CmTtiProc ttiProc;

extern Void cmUpdateTtiCounters(U32 ttiProcessingTime);
extern Void cmResetTtiCounters(Void);
 U8 *cmMemcpy (U8 *tgt, const U8 *src, U32 len);
 S16 cmMemcmp (const U8 *s1, const U8 *s2, U32 len);
 U8 *cmMemset (U8 *src, U8 val, U32 len);

 S16 cmStrcmp (const U8 *s1, const U8 *s2);

 S16 cmStrncmp (const U8 *s1, const U8 *s2, MsgLen len);
 MsgLen cmStrlen (const U8 *s);










typedef unsigned long int nfds_t;


struct pollfd
  {
    int fd;
    short int events;
    short int revents;
  };



extern int poll (struct pollfd *__fds, nfds_t __nfds, int __timeout);
extern int ppoll (struct pollfd *__fds, nfds_t __nfds,
    const struct timespec *__timeout,
    const __sigset_t *__ss);









extern int __poll_alias (struct pollfd *__fds, nfds_t __nfds, int __timeout) __asm__ ("" "poll")
                               ;
extern int __poll_chk (struct pollfd *__fds, nfds_t __nfds, int __timeout,
         unsigned int __fdslen);
extern int __poll_chk_warn (struct pollfd *__fds, nfds_t __nfds, int __timeout, unsigned int __fdslen) __asm__ ("" "__poll_chk")


  __attribute__((__warning__ ("poll called with fds buffer too small file nfds entries")));

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
poll (struct pollfd *__fds, nfds_t __nfds, int __timeout)
{
  if (__builtin_object_size (__fds, 2 > 1) != (unsigned int) -1)
    {
      if (! __builtin_constant_p (__nfds))
 return __poll_chk (__fds, __nfds, __timeout, __builtin_object_size (__fds, 2 > 1));
      else if (__builtin_object_size (__fds, 2 > 1) / sizeof (*__fds) < __nfds)
 return __poll_chk_warn (__fds, __nfds, __timeout, __builtin_object_size (__fds, 2 > 1));
    }

  return __poll_alias (__fds, __nfds, __timeout);
}



extern int __ppoll_alias (struct pollfd *__fds, nfds_t __nfds, const struct timespec *__timeout, const __sigset_t *__ss) __asm__ ("" "ppoll")

                                          ;
extern int __ppoll_chk (struct pollfd *__fds, nfds_t __nfds,
   const struct timespec *__timeout,
   const __sigset_t *__ss, unsigned int __fdslen);
extern int __ppoll_chk_warn (struct pollfd *__fds, nfds_t __nfds, const struct timespec *__timeout, const __sigset_t *__ss, unsigned int __fdslen) __asm__ ("" "__ppoll_chk")




  __attribute__((__warning__ ("ppoll called with fds buffer too small file nfds entries")));

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
ppoll (struct pollfd *__fds, nfds_t __nfds, const struct timespec *__timeout,
       const __sigset_t *__ss)
{
  if (__builtin_object_size (__fds, 2 > 1) != (unsigned int) -1)
    {
      if (! __builtin_constant_p (__nfds))
 return __ppoll_chk (__fds, __nfds, __timeout, __ss, __builtin_object_size (__fds, 2 > 1));
      else if (__builtin_object_size (__fds, 2 > 1) / sizeof (*__fds) < __nfds)
 return __ppoll_chk_warn (__fds, __nfds, __timeout, __ss,
     __builtin_object_size (__fds, 2 > 1));
    }

  return __ppoll_alias (__fds, __nfds, __timeout, __ss);
}






struct rpcent
{
  char *r_name;
  char **r_aliases;
  int r_number;
};

extern void setrpcent (int __stayopen) __attribute__ ((__nothrow__ , __leaf__));
extern void endrpcent (void) __attribute__ ((__nothrow__ , __leaf__));
extern struct rpcent *getrpcbyname (const char *__name) __attribute__ ((__nothrow__ , __leaf__));
extern struct rpcent *getrpcbynumber (int __number) __attribute__ ((__nothrow__ , __leaf__));
extern struct rpcent *getrpcent (void) __attribute__ ((__nothrow__ , __leaf__));


extern int getrpcbyname_r (const char *__name, struct rpcent *__result_buf,
      char *__buffer, size_t __buflen,
      struct rpcent **__result) __attribute__ ((__nothrow__ , __leaf__));

extern int getrpcbynumber_r (int __number, struct rpcent *__result_buf,
        char *__buffer, size_t __buflen,
        struct rpcent **__result) __attribute__ ((__nothrow__ , __leaf__));

extern int getrpcent_r (struct rpcent *__result_buf, char *__buffer,
   size_t __buflen, struct rpcent **__result) __attribute__ ((__nothrow__ , __leaf__));














typedef union sigval
  {
    int sival_int;
    void *sival_ptr;
  } sigval_t;
typedef struct sigevent
  {
    sigval_t sigev_value;
    int sigev_signo;
    int sigev_notify;

    union
      {
 int _pad[((64 / sizeof (int)) - 3)];



 __pid_t _tid;

 struct
   {
     void (*_function) (sigval_t);
     pthread_attr_t *_attribute;
   } _sigev_thread;
      } _sigev_un;
  } sigevent_t;






enum
{
  SIGEV_SIGNAL = 0,

  SIGEV_NONE,

  SIGEV_THREAD,


  SIGEV_THREAD_ID = 4

};




struct netent
{
  char *n_name;
  char **n_aliases;
  int n_addrtype;
  uint32_t n_net;
};








extern int *__h_errno_location (void) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern void herror (const char *__str) __attribute__ ((__nothrow__ , __leaf__));


extern const char *hstrerror (int __err_num) __attribute__ ((__nothrow__ , __leaf__));




struct hostent
{
  char *h_name;
  char **h_aliases;
  int h_addrtype;
  int h_length;
  char **h_addr_list;



};






extern void sethostent (int __stay_open);





extern void endhostent (void);






extern struct hostent *gethostent (void);






extern struct hostent *gethostbyaddr (const void *__addr, __socklen_t __len,
          int __type);





extern struct hostent *gethostbyname (const char *__name);
extern struct hostent *gethostbyname2 (const char *__name, int __af);
extern int gethostent_r (struct hostent *__restrict __result_buf,
    char *__restrict __buf, size_t __buflen,
    struct hostent **__restrict __result,
    int *__restrict __h_errnop);

extern int gethostbyaddr_r (const void *__restrict __addr, __socklen_t __len,
       int __type,
       struct hostent *__restrict __result_buf,
       char *__restrict __buf, size_t __buflen,
       struct hostent **__restrict __result,
       int *__restrict __h_errnop);

extern int gethostbyname_r (const char *__restrict __name,
       struct hostent *__restrict __result_buf,
       char *__restrict __buf, size_t __buflen,
       struct hostent **__restrict __result,
       int *__restrict __h_errnop);

extern int gethostbyname2_r (const char *__restrict __name, int __af,
        struct hostent *__restrict __result_buf,
        char *__restrict __buf, size_t __buflen,
        struct hostent **__restrict __result,
        int *__restrict __h_errnop);
extern void setnetent (int __stay_open);





extern void endnetent (void);






extern struct netent *getnetent (void);






extern struct netent *getnetbyaddr (uint32_t __net, int __type);





extern struct netent *getnetbyname (const char *__name);
extern int getnetent_r (struct netent *__restrict __result_buf,
   char *__restrict __buf, size_t __buflen,
   struct netent **__restrict __result,
   int *__restrict __h_errnop);

extern int getnetbyaddr_r (uint32_t __net, int __type,
      struct netent *__restrict __result_buf,
      char *__restrict __buf, size_t __buflen,
      struct netent **__restrict __result,
      int *__restrict __h_errnop);

extern int getnetbyname_r (const char *__restrict __name,
      struct netent *__restrict __result_buf,
      char *__restrict __buf, size_t __buflen,
      struct netent **__restrict __result,
      int *__restrict __h_errnop);




struct servent
{
  char *s_name;
  char **s_aliases;
  int s_port;
  char *s_proto;
};






extern void setservent (int __stay_open);





extern void endservent (void);






extern struct servent *getservent (void);






extern struct servent *getservbyname (const char *__name, const char *__proto);






extern struct servent *getservbyport (int __port, const char *__proto);
extern int getservent_r (struct servent *__restrict __result_buf,
    char *__restrict __buf, size_t __buflen,
    struct servent **__restrict __result);

extern int getservbyname_r (const char *__restrict __name,
       const char *__restrict __proto,
       struct servent *__restrict __result_buf,
       char *__restrict __buf, size_t __buflen,
       struct servent **__restrict __result);

extern int getservbyport_r (int __port, const char *__restrict __proto,
       struct servent *__restrict __result_buf,
       char *__restrict __buf, size_t __buflen,
       struct servent **__restrict __result);




struct protoent
{
  char *p_name;
  char **p_aliases;
  int p_proto;
};






extern void setprotoent (int __stay_open);





extern void endprotoent (void);






extern struct protoent *getprotoent (void);





extern struct protoent *getprotobyname (const char *__name);





extern struct protoent *getprotobynumber (int __proto);
extern int getprotoent_r (struct protoent *__restrict __result_buf,
     char *__restrict __buf, size_t __buflen,
     struct protoent **__restrict __result);

extern int getprotobyname_r (const char *__restrict __name,
        struct protoent *__restrict __result_buf,
        char *__restrict __buf, size_t __buflen,
        struct protoent **__restrict __result);

extern int getprotobynumber_r (int __proto,
          struct protoent *__restrict __result_buf,
          char *__restrict __buf, size_t __buflen,
          struct protoent **__restrict __result);
extern int setnetgrent (const char *__netgroup);







extern void endnetgrent (void);
extern int getnetgrent (char **__restrict __hostp,
   char **__restrict __userp,
   char **__restrict __domainp);
extern int innetgr (const char *__netgroup, const char *__host,
      const char *__user, const char *__domain);







extern int getnetgrent_r (char **__restrict __hostp,
     char **__restrict __userp,
     char **__restrict __domainp,
     char *__restrict __buffer, size_t __buflen);
extern int rcmd (char **__restrict __ahost, unsigned short int __rport,
   const char *__restrict __locuser,
   const char *__restrict __remuser,
   const char *__restrict __cmd, int *__restrict __fd2p);
extern int rcmd_af (char **__restrict __ahost, unsigned short int __rport,
      const char *__restrict __locuser,
      const char *__restrict __remuser,
      const char *__restrict __cmd, int *__restrict __fd2p,
      sa_family_t __af);
extern int rexec (char **__restrict __ahost, int __rport,
    const char *__restrict __name,
    const char *__restrict __pass,
    const char *__restrict __cmd, int *__restrict __fd2p);
extern int rexec_af (char **__restrict __ahost, int __rport,
       const char *__restrict __name,
       const char *__restrict __pass,
       const char *__restrict __cmd, int *__restrict __fd2p,
       sa_family_t __af);
extern int ruserok (const char *__rhost, int __suser,
      const char *__remuser, const char *__locuser);
extern int ruserok_af (const char *__rhost, int __suser,
         const char *__remuser, const char *__locuser,
         sa_family_t __af);
extern int iruserok (uint32_t __raddr, int __suser,
       const char *__remuser, const char *__locuser);
extern int iruserok_af (const void *__raddr, int __suser,
   const char *__remuser, const char *__locuser,
   sa_family_t __af);
extern int rresvport (int *__alport);
extern int rresvport_af (int *__alport, sa_family_t __af);






struct addrinfo
{
  int ai_flags;
  int ai_family;
  int ai_socktype;
  int ai_protocol;
  socklen_t ai_addrlen;
  struct sockaddr *ai_addr;
  char *ai_canonname;
  struct addrinfo *ai_next;
};



struct gaicb
{
  const char *ar_name;
  const char *ar_service;
  const struct addrinfo *ar_request;
  struct addrinfo *ar_result;

  int __return;
  int __glibc_reserved[5];
};
extern int getaddrinfo (const char *__restrict __name,
   const char *__restrict __service,
   const struct addrinfo *__restrict __req,
   struct addrinfo **__restrict __pai);


extern void freeaddrinfo (struct addrinfo *__ai) __attribute__ ((__nothrow__ , __leaf__));


extern const char *gai_strerror (int __ecode) __attribute__ ((__nothrow__ , __leaf__));





extern int getnameinfo (const struct sockaddr *__restrict __sa,
   socklen_t __salen, char *__restrict __host,
   socklen_t __hostlen, char *__restrict __serv,
   socklen_t __servlen, int __flags);
extern int getaddrinfo_a (int __mode, struct gaicb *__list[__restrict],
     int __ent, struct sigevent *__restrict __sig);
extern int gai_suspend (const struct gaicb *const __list[], int __ent,
   const struct timespec *__timeout);


extern int gai_error (struct gaicb *__req) __attribute__ ((__nothrow__ , __leaf__));


extern int gai_cancel (struct gaicb *__gaicbp) __attribute__ ((__nothrow__ , __leaf__));







typedef CmIpAddr CmInetIpAddr;




typedef struct cmInetIpAddrTbl
{
   U16 count;
   CmInetIpAddr netAddr[16];
}CmInetIpAddrTbl;

typedef CmInetIpAddrTbl CmInetIpv4AddrArr;
typedef struct cmInetIpAddrArr
{
   U8 type;
   union
   {
      CmInetIpv4AddrArr ipv4AddrArr;



   } u;

} CmInetIpAddrArr;



typedef struct cmInetCmnSockAddr
{
   U32 type;
   U32 len;
   union
   {
      struct sockaddr_in addr;



   }u;
}CmInetCmnSockAddr;
typedef S32 CmInetFdType;
typedef struct pollfd CmInetPollFd;

typedef struct cmInetFd
{
   CmInetFdType fd;
   U8 blocking;
   U8 type;




}CmInetFd;

typedef fd_set CmInetFdSet;
typedef struct cmInetAddr1
{
   U16 port;
   CmInetIpAddr address;
} CmInetAddr;
typedef CmInetAddr CmInetIpv4Addr;


typedef struct cmInetMemInfo
{
   Region region;
   Pool pool;
} CmInetMemInfo;

typedef struct cmInetMCastInf
{
   CmInetIpAddr mCastAddr;
   CmInetIpAddr localAddr;
}CmInetMCastInf;



typedef struct cmInetNetAddr
{
   U8 type;
   union
   {
      CmInetIpAddr ipv4NetAddr;



   }u;
} CmInetNetAddr;
typedef struct cmInetIpv4HdrParm
{
   TknU8 proto;
   TknU8 dfBit;
   TknU8 tos;
   TknU8 ttl;




} CmInetIpv4HdrParm;
typedef struct cmInetIpHdrParm
{
   U8 type;
   union
   {
      CmInetIpv4HdrParm hdrParmIpv4;



   } u;
} CmInetIpHdrParm;
typedef struct cmInetFdSetInfo
{
   Bool initDone;
   Bool bigEndian;
   U16 arIdx;
   U32 numArElems;
   U8 ar[256];
} CmInetFdSetInfo;
typedef struct iovec CmInetIovec;



typedef struct sockaddr CmInetSockAddr;
typedef struct sockaddr_in6 CmInet6SockAddr;
typedef struct sockaddr_in CmInet4SockAddr;




typedef struct addrinfo CmInetAddrInfo;
extern S16 cmInetSocket (U8 type, CmInetFd *sockFd, U8 protocol);
extern S16 cmInetBind (CmInetFd *sockFd, CmInetAddr *myAddr);
extern S16 cmInetConnect (CmInetFd *sockFd, CmInetAddr *servAddr);
extern S16 cmInetListen (CmInetFd *sockFd, S16 backLog);
extern S16 cmInetAccept (CmInetFd *sockFd, CmInetAddr *fromAddr, CmInetFd *newSockFd)
                                                   ;
extern S16 cmInetRecvMsg (CmInetFd *sockFd, CmInetAddr *dstAddr, CmInetMemInfo *info, Buffer **mPtr, MsgLen *len, S32 flags)

                                                       ;


extern S16 cmInetSendDscpMsg (CmInetFd *sockFd, CmInetAddr *dstAddr, CmInetMemInfo *info, Buffer *mBuf, MsgLen *len, CmInetIpHdrParm *ipHdrParams, S16 flags)

                                                                        ;






extern S16 cmInetSendMsg (CmInetFd *sockFd, CmInetAddr *dstAddr, CmInetMemInfo *info, Buffer *mBuf, MsgLen *len, S16 flags)

                                          ;

extern S16 cmInetPeek (CmInetFd *sockFd, CmInetAddr *fromAddr, CmInetMemInfo *info, MsgLen dataPos, MsgLen dataLen, U8 *data)

                                                      ;

extern S16 cmInetPeekNew (CmInetFd *sockFd, CmInetAddr *fromAddr, CmInetMemInfo *info, MsgLen dataPos, MsgLen dataLen, U8 *data)

                                                      ;
extern S16 cmInetClose (CmInetFd *sockFd);
extern S16 cmInetShutdown (CmInetFd *sockFd, S32 howTo);
extern S16 cmInetSelect (CmInetFdSet *readFdS, CmInetFdSet *writeFdS, U32 *mSecTimeout, S16 *numFdS)
                                                             ;
extern S16 cmInetSetOpt (CmInetFd *sockFd, U32 level, U32 type, Ptr value)
                                        ;
extern S16 cmInetGetNumRead (CmInetFd *sockFd, U32 *dataLen);

extern S16 cmInetGetHostByName (S8 *hostName, CmInetIpAddrTbl *addrTbl);
extern S16 cmInetGetIpNodeByName (S8 *hostName, CmInetIpAddrArr *addrArr);
extern S16 cmInetAddr (S8 *asciiAddr, CmInetIpAddr *address);
extern S16 cmInetNtoa (CmInetIpAddr address, S8 **asciiAddr);
extern S16 cmInetPton (CmInetIpAddr *address, S8 *asciiAddr);







extern S16 cmInetFdSetInfoInit (CmInetFdSetInfo *fdSetInfo);
extern S16 cmInetGetFd (CmInetFdSetInfo *fdSetInfo, CmInetFdSet *fdSet, CmInetFdType *sockFd)
                                                   ;


extern S16 cmInetGetMemSize (S32 *size);
extern S16 cmInetInit (Void);
extern S16 cmInetDeInit (Void);
extern S16 cmInetGetSockName (CmInetFd *sockFd, CmInetAddr *locAddr);

extern S16 cmInetConvertStrToIpAddr (U16 len, U8 *val, CmInetNetAddr *address)
                                                                  ;
extern S16 cmInetAsciiToIpv4 (U8 numBytes, U8 *ipv4Addr, U16 len, U8 *val)
                                                     ;



extern S16 cmInetPoll (CmInetPollFd *pollFdArr,U32 idx,S16 *numFdS,U32 timeout);
extern S16 cmInetPollSetFd (CmInetFd *sockFd,CmInetPollFd *pollFdArr,S16 idx, U16 eventMask);
extern S16 cmInetPollFdIsSet (CmInetPollFd *pollFdArr, S16 idx, U16 eventMask);
extern S16 cmInetPollClearFdREvent (CmInetPollFd *pollFdArr, S16 idx, U16 eventMask);
extern S16 cmInetPollClearFdEvent (CmInetPollFd *pollFdArr,S16 idx, U16 eventMask);
extern S16 cmInetPollDelFd (CmInetPollFd *pollFdArr, S16 delIdx, S16 crntIdx);
extern S16 cmInetPollInitFdArr (CmInetPollFd *pollFdArr);
extern S16 cmInetNtop (U8 type,Void *address,S8 *asciiAddr,U32 len);





extern S32 cmInetGetAddrInfo (const S8* node, const S8* service, const CmInetAddrInfo *hints, CmInetAddrInfo **res)
                                                                                         ;
extern Void cmInetFreeAddrInfo (CmInetAddrInfo *res);
typedef CmInetIpv4Addr CmIpv4TptAddr;
typedef CmInetIpAddr CmIpv4NetAddr;


typedef U8 CmInetIpAddr6[16];


typedef struct cmInetIpv6Addr
{
   U16 port;
   CmInetIpAddr6 ipv6NetAddr;
} CmInetIpv6Addr;



typedef CmInetIpv6Addr CmIpv6TptAddr;
typedef CmInetIpAddr6 CmIpv6NetAddr;




typedef struct cmNetAddr
{
   U8 type;
   union
   {
      CmIpv4NetAddr ipv4NetAddr;
      CmIpv6NetAddr ipv6NetAddr;
   }u;
} CmNetAddr;


typedef struct _cmNetAddrTbl
{
   U16 count;
   CmNetAddr netAddr[16];
}CmNetAddrTbl;
typedef struct cmNetMCastInf
{
   CmNetAddr mCastAddr;
   CmNetAddr localAddr;
} CmNetMCastInf;







typedef struct cmTptAddr
{
   U8 type;
   union
   {
      CmIpv4TptAddr ipv4TptAddr;
      CmIpv6TptAddr ipv6TptAddr;



   }u;
} CmTptAddr;
typedef struct cmSockOpts
{
   U32 level;
   U32 option;
   union
   {





      CmNetMCastInf mCastInfo;



      CmNetAddr lclAddr;
      U32 value;
   }optVal;
}CmSockOpts;


typedef struct cmSockParam
{
   U8 listenQSize;
   U8 numOpts;
   CmSockOpts sockOpts[8];
} CmSockParam;
typedef struct cmTptParam
{
   U8 type;

   union
   {
      CmSockParam sockParam;
   } u;

} CmTptParam;



typedef struct cmIpv4HdrParm
{
   TknU8 proto;
   TknU8 dfBit;
   TknU8 tos;
   TknU8 ttl;




} CmIpv4HdrParm;
typedef struct cmIpHdrParm
{
   U8 type;
   union
   {
      CmIpv4HdrParm hdrParmIpv4;



   }u;

} CmIpHdrParm;


typedef struct cmIpv4Hdr
{
   U8 hdrVer;
   U8 tos;
   S16 length;
   U16 id;
   S16 off;
   U8 ttl;
   U8 proto;
   U16 chkSum;
   U32 srcAddr;
   U32 destAddr;

} CmIpv4Hdr;
typedef struct cmIcmpError
{
   U8 errType;
   U32 errCodeMask;

} CmIcmpError;


typedef struct cmIcmpv4Filter
{
   U8 icmpMsgFlag;
   U8 allMsg;
   U8 protocol;
   U8 num;

   CmIcmpError icmpError[5];

}CmIcmpv4Filter;
typedef struct cmIcmpFilter
{
  U8 type;
  union
  {
    CmIcmpv4Filter icmpv4Filter;



  }u;

} CmIcmpFilter;


typedef struct cmIcmpv4Hdr
{
   U8 icmpType;
   U8 icmpCode;
   U16 chkSum;

   union
   {
      U8 ihPptr;
      U32 rdrctAddr;
      struct idSeq
      {
         S16 icdId;
         S16 icdSeq;
      } u1;
      U32 ihVoid;
   } u2;

   union
   {
      struct idTime
      {
         U32 itOtime;
         U32 itRtime;
         U32 itTtime;
      } s;
      CmIpv4Hdr icmpIpHdr;
      U32 id_mask;
   } u3;

} CmIcmpv4Hdr;
extern S16 cmPkCmIpv4TptAddr (CmIpv4TptAddr *pkParam, Buffer *mBuf);
extern S16 cmPkCmNetAddrTbl (CmNetAddrTbl *pkParam, Buffer *mBuf);
extern S16 cmPkCmNetAddr (CmNetAddr *pkParam, Buffer *mBuf);
extern S16 cmPkCmTptAddr (CmTptAddr *pkParam, Buffer *mBuf);



extern S16 cmPkCmTptParam (CmTptParam *pkParam, Buffer *mBuf);
extern S16 cmUnpkCmNetAddrTbl (CmNetAddrTbl *unpkParam, Buffer *mBuf);
extern S16 cmUnpkCmIpv4TptAddr (CmIpv4TptAddr *unpkParam, Buffer *mBuf);
extern S16 cmUnpkCmNetAddr (CmNetAddr *unpkParam, Buffer *mBuf);
extern S16 cmUnpkCmTptAddr (CmTptAddr *unpkParam, Buffer *mBuf);




extern S16 cmUnpkCmTptParam (CmTptParam *unpkParam, Buffer *mBuf);


extern S16 cmPkCmIpHdrParm (CmIpHdrParm *pkParam, Buffer *mBuf);







extern S16 cmUnpkCmIpHdrParm (CmIpHdrParm *unpkParam, Buffer *mBuf);
extern S16 cmPkCmIcmpFilter (CmIcmpFilter *pkParam, Buffer *mBuf);
extern S16 cmUnpkCmIcmpFilter (CmIcmpFilter *unpkParam, Buffer *mBuf);
typedef struct cmPAsnMsgCp CmPAsnMsgCp;


typedef U8 CmPAsnTknEnum;







typedef struct cmPAsnEnumDef
{



  CmPAsnTknEnum *enumLst;
  CmPAsnTknEnum *enumExtLst;
} CmPAsnEnumDef;



typedef struct cmPAsnBitStrDef
{



  U32 min;
  U32 max;
} CmPAsnBitStrDef;


typedef struct cmPAsnOctStrDef
{



  U32 min;
  U32 max;
} CmPAsnOctStrDef;


typedef struct cmPAsnSIntDef
{



  S32 min;
  S32 max;
} CmPAsnSIntDef;


typedef struct cmPAsnUIntXLDef
{



  struct
  {
     U32 len;
     U8 val[8];
  }min;

  struct
  {
     U32 len;
     U8 val[8];
  }max;
} CmPAsnUIntXLDef;


typedef struct cmPAsnUIntDef
{



  U32 min;
  U32 max;
} CmPAsnUIntDef;

typedef struct cmPAsnElmDef
{



   U8 type;
   Bool extMkr;
   U32 evSize;
   U32 *flagp;
   S16 (*func) (CmPAsnMsgCp *msgCp);

   U8 *typeSpecDef;
   void *defVal;
} CmPAsnElmDef;


typedef struct cmPAsnSetSeqOfDef
{



  U32 min;
  U32 max;
  U8 dbSize;
} CmPAsnSetSeqOfDef;


typedef struct cmPAsnSetSeqDef
{



  U32 preAmLen;
  U32 nmbExtMkrs;
  U32 extMkrEvOff;
  U16 extMkrDbOff;
  CmPAsnElmDef **ft;

  Bool allocEvnt;
} CmPAsnSetSeqDef;


typedef struct cmPAsnChoiceDef
{



 U16 nmbAltRoot;
 U16 nmbAltExt;
 CmPAsnElmDef **ft;

} CmPAsnChoiceDef;


typedef struct cmPAsnMulStrDef
{



  U32 *effAlp;
  U32 max;
  U32 min;
  U32 ub;
  U32 lb;
} CmPAsnMulStrDef;


typedef struct cmPAsnClassInfo
{

  U16 maxInstances;
  U32 *instIDs;
} CmPAsnClassInfo;


typedef struct cmPAsnClassIEDef
{



  CmPAsnClassInfo *classInf;

  U16 idEvntOffSet;
  CmPAsnElmDef **ieInst;



} CmPAsnClassIEDef;
typedef struct cmPAsnErr
{
   S16 errCode;







} CmPAsnErr;





typedef struct cmPAsnFBufInfo
{
   Data *bufP;
   U32 crntIdx;
   Size size;
} CmPAsnFBufInfo;






typedef struct cmPAsnBitHldr
{
   U8 byte;
   U8 nxtBitPos;
} CmPAsnBitHldr;





struct cmPAsnMsgCp
{
   U8 protType;
   U8 mMgmt;
   U8 perType;
   U8 cfg;
   Buffer *mBuf;
   CmPAsnFBufInfo fBuf;
   CmPAsnBitHldr bhldr;
   TknU8 *evntStr;
   CmPAsnElmDef **elmDef;
   Bool updEvnt;
   CmPAsnErr *err;
   CmMemListCp *memCp;





   Bool igExtMand;
   Buffer *unknownBuf;
};



extern S16 cmPAsnEncMsg (Void *event, U8 mMgmt, Void *outMPtr, U8 protocol, CmPAsnElmDef **msgDef, CmPAsnErr *err, U32 *fLen,Bool dbgFlag, Bool igExtMand)


                                               ;

extern S16 cmPAsnDecMsg (Void *event, U8 mMgmt, Void **inMPtr, U32 *numDecOct, U8 protocol, CmPAsnElmDef **msgDef, U8 cfg, CmPAsnErr *err, U32 fLen, CmMemListCp *lcp,Bool dbgFlag)



                                                              ;

extern S16 cmPAsnEncMsgUalign (Void *event, U8 mMgmt, Void *outMPtr, U8 protocol, CmPAsnElmDef **msgDef, CmPAsnErr *err, U32 *fLen,Bool dbgFlag, Bool igExtMand)


                                               ;

extern S16 cmPAsnDecMsgUalign (Void *event, U8 mMgmt, Void **inMPtr, U32 *numDecOct, U8 protocol, CmPAsnElmDef **msgDef, U8 cfg, CmPAsnErr *err, U32 fLen, CmMemListCp *lcp,Bool dbgFlag)



                                                              ;


extern S16 cmPAsnEncBitField (CmPAsnMsgCp *msgCp, U8 value, U8 size);

extern S16 cmPAsnRepAndEncBitField (CmPAsnMsgCp *msgCp, MsgLen lenIdx, U8 bitPos, U8 value)
                                                        ;

extern Void cmPAsnUpdDefVal ( TknU8 *evntStr, CmPAsnElmDef *temp_elm);


typedef struct nlMemMngr
{
   U32 nlPool;
   U32 nlRegion;
}NlMemMngr;

typedef enum nlPciSelType
{
   NL_PCI_SEL_DISABLE,
   NL_PCI_SEL_DSON,
   NL_PCI_SEL_CSON
}NlPciSelType;

typedef enum nlPrachSelType
{
   NL_PRACH_SEL_DISABLE,
   NL_PRACH_SEL_DSON,
   NL_PRACH_SEL_CSON
}NlPrachSelType;

typedef enum nlEarfcnSelType
{
   NL_EARFCN_SEL_DISABLE,
   NL_EARFCN_SEL_DSON,
   NL_EARFCN_SEL_CSON
}NlEarfcnSelType;

typedef enum nlTxPowerSelType
{
   NL_TXPOWER_SEL_DISABLE,
   NL_TXPOWER_SEL_DSON,
   NL_TXPOWER_SEL_CSON
}NlTxPowerSelType;




typedef struct nlGenCfg
{
   Pst lmPst;
   MemoryId mem;
   U8 tmrRes;
   U8 maxNluSaps;
   NlPciSelType pciSelType;
   NlPrachSelType prachSelType;
   NlEarfcnSelType earfcnSelType;
   NlTxPowerSelType txPowerSelType;
   U32 maxUeSupp;
   U32 maxUePerTti;
}NlGenCfg;




typedef struct nlUSapCfg
{
   Selector selector;
   MemoryId mem;
   Priority prior;
   ProcId procId;
   Ent ent;
   Inst inst;
   Route route;
   SpId spId;
   SuId suId;
}NlUSapCfg;



typedef struct lnlPlmnId
{
   U8 numMncDigits;
   U8 mcc[3];
   U8 mnc[3];
}LnlPlmnId;



typedef struct lnlEcgi
{
   LnlPlmnId plmn;
   U32 cellId;
}LnlEcgi;




typedef struct nlCfg
{
   union
   {
      NlGenCfg genCfg;

      NlUSapCfg nluSap;
   }u;
}NlCfg;




typedef struct nlCntrl
{
   U8 action;
}NlCntrl;

typedef enum lnlCfgType
{
   LNL_CELL_CFG,
   LNL_NGH_CELL_CFG,
   LNL_CELL_RECFG
}LnlCfgType;



typedef enum lnlPhichNg
{
   LNL_NG_ONESIXTH,
   LNL_NG_HALF,
   LNL_NG_ONE,
   LNL_NG_TWO
}LnlPhichNg;

typedef struct lnlNghPrachCfg
{
   U16 nghRootSeqIdx;
   U8 nghPrachCfgIdx;
   U8 nghZeroCorrelationZoneCfg;
   U8 nghPrachFreqOffset;
   Bool highSpeedFlag;
}LnlNghPrachCfg;

typedef struct lnlPrachCfg
{
   U16 servRootSeqIdx;
   U8 servPrachCfgIdx;
   U8 servZeroCorrelationZoneCfg;
   U8 servPrachFreqOffset;
   Bool highSpeedFlag;

   U8 numRootSeqIndex;
   U16 rootSeqIdx[512];
   U8 numPrachCfgIdx;
   U8 prachConfigIdx[256];
   U8 numZeroCorrCfgZone;
   U8 zeroCorrelationZoneCfg[64];
   U8 numFreqOffset;
   U8 freqOffset[256];
}LnlPrachCfg;


typedef struct lnlRemScanEarfcn
{
   U32 dlEarfcn;
   S32 rssi;
}LnlRemScanEarfcn;






typedef struct lnlPucchCfg
{
   U8 pucchCqiResIdx;
   U16 n1PucchAn;
   U8 deltaShift;

   U8 cyclicShift;

}LnlPucchCfg;






typedef struct lnlTxPwrCfg
{
   U8 refSignalPwrCnt;
   S8 referenceSignalPwr[128];
   U8 pBCnt;
   U8 pB[8];
   U8 pACnt;
   U8 pA[4];
   U8 pschPowerOffCnt;
   U8 sschPowerOffCnt;
   U8 pbchPowerOffCnt;
   S8 pschPowerOffset[512];
   S8 sschPowerOffset[512];
   S8 pbchPowerOffset[512];
}LnlTxPwrCfg;





typedef struct lnlTpmCfg
{
   S8 tgtRsrp;
   U8 attnConstIdx;
   S8 minRsrp;
   S8 maxRsrp;
}LnlTpmCfg;






typedef struct lnlPhichCfg
{
   LnlPhichNg ngEnum;
   Bool isDurExtend;

}LnlPhichCfg;

typedef enum lnlCsgAccessMode
{
   LNL_ENB_OPEN_ACCESS = 1,
   LNL_ENB_CLOSED_ACCESS,
   LNL_ENB_HYBRID_ACCESS
}LnlCsgAccessMode;

typedef struct lnlCsgPciCfg
{
   Bool isCsgPciCfg;
   U16 csgStartPci;
   U16 csgPciRange;
   LnlCsgAccessMode accessMode;
}LnlCsgPciCfg;

typedef struct lnlSmallCellPciCfg
{
   Bool isSmallCellPciCfg;
   U16 smallCellStartPci;
   U16 maxSmallCellPci;
}LnlSmallCellPciCfg;


typedef struct lnlCellCfg
{
   U32 cellId;
   U8 bandWidth;
   U8 numTxAntPorts;
   U32 txPower;
   U8 subFrameCfg;
   U8 duplexMode;
   U16 pci;
   U32 numPci;
   U16 pciList[504];
   LnlCsgPciCfg csgPciCfg;
   LnlSmallCellPciCfg smallCellPciCfg;
   LnlEcgi ecgi;
   U8 numDlEarfcn;
   U16 dlEarfcnList[64];
   U8 numUlEarfcn;
   U16 ulEarfcnList[64];
   U8 numRemScanEarfcn;
   LnlRemScanEarfcn remScanEarfcn[64];
   Bool isCpUlExtend;

   LnlPrachCfg prachCfgInfo;


   LnlPucchCfg pucchResCfg;

   LnlPhichCfg phichCfg;

   LnlTxPwrCfg txPwrCfg;
   LnlTpmCfg tpmCfg;
}LnlCellCfg;

typedef struct lnlCellReCfg
{
   U32 cellId;
   LnlEcgi ecgi;
   U32 numPci;
   U16 pciList[504];
}LnlCellReCfg;

typedef struct lnlNghCellInfo
{
   LnlEcgi ecgi;
   U16 pci;
   U16 dlEarfcn;
   U16 ulEarfcn;
   U16 lteBand;
   U16 tac;
   U8 ulBw;
   U8 dlBw;
   S8 RSTxPower;
   U8 csgAccessMode;
   U32 csgId;
   S16 rsrp;
   S16 rssi;
   Bool isCellBarred;
   Bool isNghPrachInfo;
   LnlNghPrachCfg prachCfgInfo;
}LnlNghCellInfo;

typedef struct lnlNghCellModInfo
{
   LnlEcgi oldEcgi;
   LnlNghCellInfo nghCellInfo;
   U8 numNghNgh;
   LnlNghCellInfo nghNghCellInfo[16];
}LnlNghCellModInfo;

typedef struct lnlNghCellMod
{
   U8 numNgh;
   LnlNghCellModInfo nghCellModInfo[16];

}LnlNghCellMod;

typedef struct lnlNghCellDel
{
   U8 numNgh;
   LnlEcgi ecgi[16];
}LnlNghCellDel;

typedef struct lnlNghCellAddInfo
{
   LnlNghCellInfo nghCellInfo;
   U8 numNghNgh;
   LnlNghCellInfo nghNghCellInfo[16];
}LnlNghCellAddInfo;

typedef struct lnlNghCellAdd
{
   U8 numNgh;
   LnlNghCellAddInfo nghCellAddInfo[16];
}LnlNghCellAdd;

typedef enum lnlNghCfgType
{
   LNL_NGH_ADD,
   LNL_NGH_DEL,
   LNL_NGH_MOD
}LnlNghCfgType;

typedef struct lnlNghCellCfgParam
{
   LnlNghCfgType cfgType;
   union
   {
      LnlNghCellAdd nghCellAdd;
      LnlNghCellDel nghCellDel;
      LnlNghCellMod nghCellMod;
   }u;
}LnlNghCellCfgParam;

typedef struct lnlNghEnbCellCfg
{
   U32 nghEnbId;
   LnlNghCellCfgParam nghCellParam;
}LnlNghEnbCellCfg;

typedef struct lnlNghCellCfg
{
   U32 servCellId;
   U8 numNghEnb;
   LnlNghEnbCellCfg nghEnbCellCfg[16];
}LnlNghCellCfg;

typedef struct nlProtoCfg
{
   LnlCfgType bCfgType;
   union
   {
      LnlCellCfg cellCfg;
      LnlNghCellCfg nghCellCfg;
      LnlCellReCfg cellReCfg;
   }u;
}NlProtoCfg;

typedef enum lnlDgnType
{
   LNL_PCI_CONFLICT,
   LNL_PCI_CONFUSION

}LnlDgnType;

typedef enum lnlDgnSeverity
{
   LNL_ALARM_SEVERITY_CLEARED,
   LNL_ALARM_SEVERITY_WARNING,
   LNL_ALARM_SEVERITY_MINOR,
   LNL_ALARM_SEVERITY_MAJOR,
   LNL_ALARM_SEVERITY_CRITICAL

}LnlDgnSeverity;

typedef enum lnlDgnAlarm
{
   LNL_ALARM_PCI_CONFLICT,
   LNL_ALARM_PCI_CONFUSION
}LnlDgnAlarm;

typedef enum lnlAddInfoAction
{
   LNL_ALARM_MANUAL_INTER_REQ,
   LNL_ALARM_AUTO_RESOLVE
}LnlAddInfoAction;

typedef struct lnlDgnAddInfo
{
   U16 pci;
   U32 cellId;
   LnlAddInfoAction action;
}LnlDgnAddInfo;

typedef struct lnlUstaDgn
{
   LnlDgnType type;
   LnlDgnAlarm alarmId;
   LnlDgnSeverity severity;
   U8 causeType;
   U8 causeVal;
   union
   {
      LnlDgnAddInfo addInfo;
   }u;
}LnlUstaDgn;




typedef struct lnlNlUsta
{
   CmAlarm alarm;
   LnlUstaDgn dgn;
}LnlNlUsta;







typedef enum lnlEnbStaType
{
   LNL_ENBSTATYPE_CELLUP,
   LNL_ENBSTATYPE_CPULOAD
}LnlEnbStaType;
typedef struct lnlEnbStaInd
{
   LnlEnbStaType enStaType;
   union {
      U32 cpuLoad;
      U32 cellId;
   }u;
}LnlEnbStaInd;

typedef enum lnlStaType
{
   LNL_STAT_ENB,
   LNL_STAT_ALARM
}LnlStaType;





typedef struct nlUsta
{
   LnlStaType staType;
   union {
      LnlEnbStaInd stEnbStaInfo;
      LnlNlUsta stAlarm;
   }u;
}NlUsta;






typedef struct nlMngmt
{
   Header hdr;
   CmStatus cfm;
   union
   {
      NlCfg cfg;
      NlCntrl cntrl;
      NlProtoCfg protoCfg;
      NlUsta usta;
   }u;
}NlMngmt;







typedef struct nlUpdatePciCfgInd
{
   U16 pci;
   U32 cellId;
   U32 cellCfgIdx;
}NlUpdatePciCfgInd;







typedef struct nlUpdateEarfcnCfgInd
{
   U16 dlEarfcn;
   U16 ulEarfcn;
   U32 cellCfgIdx;
}NlUpdateEarfcnCfgInd;

typedef enum lnlCfgUpdateTye
{
   LNL_CFG_UPDATE_PCI = 1,
   LNL_CFG_UPDATE_EARFCN,
   LNL_CFG_UPDATE_PRACH,
   LNL_CFG_UPDATE_TXPWR
}LnlCfgUpdateType;
typedef struct nlUpdatePrachCfgInd
{
   U16 rootSequenceIndx;
   U8 prachCfgIdx;

   Bool highSpeedFlag;
   U8 zeroCorrelationZoneCfg;
   U8 prachFreqOffset;
   U32 cellCfgIdx;
}NlUpdatePrachCfgInd;







typedef struct nlUpdateTxPwrCfgInd
{
   S8 refSignalTxPwr;
   S16 pssPowerOffset;
   S16 sssPowerOffset;
   S16 pbchPowerOffset;
   U8 pB;
   S8 pout;
   U32 cellCfgIdx;
}NlUpdateTxPwrCfgInd;


typedef struct nlCfgUpdateInd
{
   LnlEcgi ecgi;
   LnlCfgUpdateType cfgType;
   union
   {
      NlUpdatePciCfgInd pciCfgInd;
      NlUpdateEarfcnCfgInd earfcnCfgInd;
      NlUpdatePrachCfgInd prachCfgInd;
      NlUpdateTxPwrCfgInd txPwrCfgInd;
   }u;
}NlCfgUpdateInd;





typedef enum lnlSonCfgType
{
   LNL_SON_PERD_UE_MEAS_INTERVAL_CFG,
   LNL_SON_SCHD_CFG,
   LNL_SON_PERD_REM_SCAN_CFG
}LnlSonCfgType;





typedef struct lnlSonMeasRptIntervalCfg
{
   U16 periodicUeMeasInterval;

}LnlSonMeasRptIntervalCfg;





typedef struct lnlSonPerdREMScanCfg
{
   U16 perdREMScanInterval;
   U16 perdREMScanCount;
}LnlSonPerdREMScanCfg;





typedef enum lnlSonPrbPaLevel
{
   LNL_SON_CFG_PA_LEVEL_NORMAL,
   LNL_SON_CFG_PA_LEVEL_LOW,
   LNL_SON_CFG_PA_LEVEL_HIGH
}LnlSonPrbPaLevel;




typedef enum lnlSonPa
{
   LNL_SON_CFG_PA_DB_NEG_6 ,
   LNL_SON_CFG_PA_DB_NEG_4_77,
   LNL_SON_CFG_PA_DB_NEG_3 ,
   LNL_SON_CFG_PA_DB_NEG_1_77 ,
   LNL_SON_CFG_PA_DB_0 ,
   LNL_SON_CFG_PA_DB_1 ,
   LNL_SON_CFG_PA_DB_2 ,
   LNL_SON_CFG_PA_DB_3 ,
   LNL_SON_CFG_PA_NEGTIVE_INF
}LnlSonPa;







typedef struct lnlSonUeCfg
{
   U16 crnti;
   Bool isCellEdge;

}LnlSonUeCfg;







typedef struct lnlSonSchdCfg
{
   U8 numUeCfg;
   LnlSonUeCfg ueCfg[16];

   LnlSonPrbPaLevel paLevelPerPrb[110];
   LnlSonPa pa;
   LnlSonPa paLow;

   LnlSonPa paHigh;

   U8 pb;
}LnlSonSchdCfg;






typedef struct lnlSonCfg
{
   LnlEcgi ecgi;
   LnlSonCfgType cfgType;

   union
   {
      LnlSonMeasRptIntervalCfg measCfg;

      LnlSonSchdCfg schdCfg;
      LnlSonPerdREMScanCfg remScanCfg;
   }u;
}LnlSonCfg;

extern NlMemMngr nlMemMngr;





typedef S16 (*LnlCfgReq) ( Pst *pst, NlMngmt *cfg )


       ;

typedef S16 (*LnlCfgCfm) ( Pst *pst, NlMngmt *cfg )


       ;

typedef S16 (*LnlCntrlReq) ( Pst *pst, NlMngmt *cntrl )


       ;

typedef S16 (*LnlStatInd) ( Pst *pst, NlMngmt *cntrl )


       ;

typedef S16 (*LnlCntrlCfm) ( Pst *pst, NlMngmt *cntrl )


       ;

typedef S16 (*LnlCfgUpdateInd) ( Pst *pst, NlCfgUpdateInd *cfgUpdateInd )


       ;

typedef S16 (*LnlSonCfgInd) ( Pst *pst, LnlSonCfg *sonCfg )


       ;

extern S16 nlActvInit ( Ent entity, Inst inst, Region region, Reason reason )




  ;

extern S16 nlActvTsk ( Pst *pst, Buffer *mBuf )


  ;


extern S16 smNlInit ( SSTskId sysTskId )

  ;

extern S16 smNlActvTsk ( Pst *pst, Buffer *mBuf )


  ;

extern S16 smNlActvInit ( Ent entity, Inst inst, Region region, Reason reason )




  ;

extern S16 SmMiLnlCfgReq ( Pst *pst, NlMngmt *cfg )


  ;

extern S16 SmMiLnlCfgCfm ( Pst *pst, NlMngmt *cfm )


  ;

extern S16 SmMiLnlCntrlReq ( Pst *pst, NlMngmt *cntrl )


  ;

extern S16 SmMiLnlCntrlCfm ( Pst *pst, NlMngmt *cfm )


  ;

extern S16 SmMiLnlUpdateTxPwrCfgInd ( NlUpdateTxPwrCfgInd *txPwrInd )

  ;

extern S16 SmMiLnlUpdatePciCfgInd ( NlUpdatePciCfgInd *pciCfgInd )

  ;

extern S16 SmMiLnlUpdateEarfcnCfgInd ( NlUpdateEarfcnCfgInd *earfcnCfgInd )

  ;

extern S16 SmMiLnlCfgUpdateInd ( Pst *pst, NlCfgUpdateInd *cfgUpdateInd )


  ;

extern S16 SmMiLnlSonCfgInd ( Pst *pst, LnlSonCfg *sonCfg )


  ;

extern S16 SmMiLnlUpdatePrachCfgInd ( NlUpdatePrachCfgInd *prachCfgInd )

  ;

extern S16 SmMiLnlUpdateTxPwrCfgInd ( NlUpdateTxPwrCfgInd *txPwrCfgInd )

  ;


extern S16 SmMiLnlEnbStatInd ( Pst *pst, NlMngmt *cellUpInd )


  ;



extern S16 cmPkLnlCfgReq ( Pst * pst, NlMngmt * cfg )


  ;



extern S16 PtMiLnlCfgReq ( Pst * pst, NlMngmt * cfg )


  ;


extern S16 cmUnpkLnlCfgReq ( LnlCfgReq func, Pst *pst, Buffer *mBuf )



  ;


extern S16 cmPkLnlCfgCfm ( Pst * pst, NlMngmt * cfm )


  ;


extern S16 PtMiLnlCfgCfm ( Pst * pst, NlMngmt * cfm )


  ;


extern S16 cmUnpkLnlCfgCfm ( LnlCfgCfm func, Pst * pst, Buffer *mBuf )



  ;


extern S16 cmPkLnlCntrlReq ( Pst * pst, NlMngmt * cfg )


  ;



extern S16 PtMiLnlCntrlReq ( Pst * pst, NlMngmt * cfg )


  ;


extern S16 cmUnpkLnlCntrlReq ( LnlCntrlReq func, Pst *pst, Buffer *mBuf )



  ;


extern S16 cmPkLnlCntrlCfm ( Pst * pst, NlMngmt * cfm )


  ;

extern S16 cmUnpkLnlCntrlCfm ( LnlCntrlCfm func, Pst *pst, Buffer *mBuf )



  ;


extern S16 PtMiLnlCntrlCfm ( Pst * pst, NlMngmt * cfm )


  ;


extern S16 cmUnpkLnlCfgCfm ( LnlCntrlCfm func, Pst * pst, Buffer *mBuf )



  ;


extern S16 cmPkLnlCfgUpdateInd ( Pst *pst, NlCfgUpdateInd *cfgUpdateInd )


  ;


extern S16 PtMiLnlCfgUpdateInd ( Pst *pst, NlCfgUpdateInd *cfgUpdateInd )


  ;


extern S16 cmUnpkLnlCfgUpdateInd ( LnlCfgUpdateInd func, Pst * pst, Buffer *mBuf )



  ;


extern S16 cmPkLnlStatInd ( Pst * pst, NlMngmt * cfg )


  ;



extern S16 PtMiLnlStatInd ( Pst * pst, NlMngmt * cfg )


  ;


extern S16 cmUnpkLnlStatInd ( LnlStatInd func, Pst *pst, Buffer *mBuf )



  ;

extern S16 cmPkLnlSonCfgInd ( Pst *pst, LnlSonCfg *sonCfg )


  ;

extern S16 cmUnpkLnlSonCfgInd ( LnlSonCfgInd func, Pst *pst, Buffer *mBuf )



  ;

extern S16 PtMiLnlSonCfgInd ( Pst *pst, LnlSonCfg *sonCfg )


  ;
extern S16 NlMiLnlCfgReq ( Pst *pst, NlMngmt *cfg )


  ;
extern S16 NlMiLnlCfgCfm ( Pst *pst, NlMngmt *cfm )


  ;
extern S16 NlMiLnlCntrlReq ( Pst *pst, NlMngmt *cfg )


  ;
extern S16 NlMiLnlCntrlCfm ( Pst *pst, NlMngmt *cntrl )


  ;
extern S16 NlMiLnlStatInd ( Pst *pst, NlMngmt *cellUpInd )


  ;
extern S16 NlMiLnlCfgUpdateInd ( Pst *pst, NlCfgUpdateInd *cfgUpdateInd )


  ;

extern S16 NlMiLnlAlarmInd ( Pst *pst, NlMngmt *nlMngmt )


  ;

extern S16 SmMiLnlStatInd ( Pst *pst, NlMngmt *mngmt )


  ;
extern S16 NlMiLnlBrdcmSonCfgInd ( Pst *pst, LnlSonCfg *sonCfg )


        ;
typedef struct nluPlmnId
{
   U8 numMncDigits;
   U8 mcc[3];
   U8 mnc[3];
}NluPlmnId;



typedef struct nluEcgi
{
   NluPlmnId plmn;
   U32 cellId;
}NluEcgi;





typedef struct nluPciModIndCfm
{
   NluEcgi ecgi;
   U16 pci;
}NluPciModIndCfm;



typedef struct nluNghCellInfo
{
   NluEcgi ecgi;
   U16 pci;
   U16 dlEarfcn;
   U16 ulEarfcn;
}NluNghCellInfo;

typedef struct nluNghCellModInfo
{
   NluEcgi oldEcgi;
   NluNghCellInfo nghCellInfo;
   U8 numNghNgh;
   NluNghCellInfo nghNghCellInfo[16];

}NluNghCellModInfo;

typedef struct nluNghCellMod
{
   U8 numNgh;
   NluNghCellModInfo nghCellModInfo[16];

}NluNghCellMod;

typedef struct nluNghCellDel
{
   U8 numNgh;
   NluEcgi ecgi[16];
}NluNghCellDel;

typedef struct nluNghCellAddInfo
{
   NluNghCellInfo nghCellInfo;
   U8 numNghNgh;
   NluNghCellInfo nghNghCellInfo[16];
}NluNghCellAddInfo;

typedef struct nluNghCellAdd
{
   U8 numNgh;
   NluNghCellAddInfo nghCellAddInfo[16];

}NluNghCellAdd;

typedef enum nluNghCfgType
{
   NLU_NGH_ADD,
   NLU_NGH_DEL,
   NLU_NGH_MOD
}NluNghCfgType;

typedef struct nluNghCellCfgParam
{
   NluNghCfgType cfgType;
   union
   {
      NluNghCellAdd nghCellAdd;
      NluNghCellDel nghCellDel;
      NluNghCellMod nghCellMod;
   }u;

}NluNghCellCfgParam;

typedef struct nluNghEnbCellCfg
{
   U32 nghEnbId;
   NluNghCellCfgParam nghCellParam;
}NluNghEnbCellCfg;

typedef enum nluNghMsgType
{
   NLU_X2SETUP_REQ_NGH_RPT,
   NLU_X2SETUP_RSP_NGH_RPT,
   NLU_ENB_CFG_UPD_NGH_RPT,
   NLU_ENB_ANR_NGH_RPT,
   NLU_ENB_DEL_NGH_RPT
}NluNghMsgType;



typedef struct nluNeighborReport
{
   NluNghMsgType msgType;
   U32 servCellId;
   U8 numNghEnb;
   NluNghEnbCellCfg nghEnbCellCfg[16];
}NluNeighborReport;


typedef struct nluPeriodicRemCellInfo {
   U16 pci;
   U8 rsrp;
   U8 dlBw;
   U8 numTx;
}NluPeriodicRemCellInfo;

typedef struct nluPeriodicRemCellSearchRsp {
   U8 numCells;
   NluPeriodicRemCellInfo cellInfo[16];
}NluPeriodicRemCellSearchRsp;







typedef enum nluUeEvent
{
   NLU_UE_ADDED,
   NLU_UE_DELETED,
   NLU_UE_CRNTI_CHANGED

}NluUeEvent;



typedef struct nluUeInfo
{
   NluUeEvent event;

   NluEcgi ecgi;
   U16 crnti;
   U16 oldCrnti;
}NluUeInfo;

extern S16 NlUiNluUeInd ( Pst *pst, SuId suId, NluUeInfo *ueInfo )



  ;
typedef struct nluNghCellMeasRpt
{
   NluEcgi ecgi;
   S16 nghCellRsrp;
   S16 nghCellRsrq;
   U16 pci;
   U32 dlEarfcn;
}NluNghCellMeasRpt;




typedef struct nluUeMeasRpt
{
   NluEcgi ecgi;
   U16 crnti;





   U32 noNghCell;
   NluNghCellMeasRpt nghCellMeasRpt[16];
   U32 servCellRsrp;
   U32 servCellRsrq;

}NluUeMeasRpt;

extern S16 NlUiNluUeMeasReportInd ( Pst *pst, SuId suId, NluUeMeasRpt *measRpt )



  ;





typedef struct rgrStaIndInfo NluUeCqiRpt;


extern S16 NlUiNluUeCqiReportInd ( Pst *pst, SuId suId, NluUeCqiRpt *cqiRpt )



  ;




typedef S16 (*NluBndReq) ( Pst *pst, SuId suId, SpId spId )



  ;




typedef S16 (*NluBndCfm) ( Pst *pst, SuId suId, SpId spId, U8 status )




  ;




typedef S16 (*NluNeighborReq) ( Pst *pst, SuId suId, NluNeighborReport *nhbr )



  ;




typedef S16 (*NluPciModCfm) ( Pst *pst, SuId suId, NluPciModIndCfm *pciMod )



  ;





typedef S16 (*NluUeMeasRptInd) ( Pst *pst, SuId suId, NluUeMeasRpt *measRpt )



  ;





typedef S16 (*NluUeInd) ( Pst *pst, SuId suId, NluUeInfo *ueInfo )



  ;




typedef S16 (*NluUeCqiRptInd) ( Pst *pst, SuId suId, NluUeCqiRpt *cqiRpt )



  ;
extern S16 WrLiNluBndReq ( Pst *pst, SuId suId, SpId spId )



  ;




extern S16 WrLiNluPciModIndCfm ( Pst *pst, SuId suId, NluPciModIndCfm *pciMod )



  ;

extern S16 WrLiNluUeCqiRptInd ( Pst *pst, SuId suId, NluUeCqiRpt *cqiRpt )



  ;

extern S16 WrLiNluUeMeasRptInd ( Pst *pst, SuId suId, NluUeMeasRpt *measRpt )



  ;






extern S16 WrLiNluNeighborReq ( Pst *pst, SuId suId, NluNeighborReport *ueRep )



  ;

extern S16 WrLiNluUeInd ( Pst *pst, SuId suId, NluUeInfo *ueInfo )



  ;







extern S16 cmPkNluBndReq ( Pst *pst, SuId suId, SpId spId )



  ;






extern S16 cmUnpkNluBndReq ( NluBndReq func, Pst *pst, Buffer *mBuf )



  ;






extern S16 ptUiNluBndReq ( Pst *pst, SuId suId, SpId spId )



  ;

extern S16 cmPkNluBndCfm ( Pst *pst, SuId suId, SpId spId, U8 status )




  ;







extern S16 cmUnpkNluBndCfm ( NluBndCfm func, Pst *pst, Buffer *mBuf )



  ;





extern S16 cmPkNluNeighborReq ( Pst *pst, SuId suId, NluNeighborReport *nhbr )



  ;





extern S16 ptUiNluNeighborReq ( Pst *pst, SuId suId, NluNeighborReport *nhbr )



  ;





extern S16 cmUnpkNluNeighborReq ( NluNeighborReq func, Pst *pst, Buffer *mBuf )



  ;

extern S16 cmPkNluPciModIndCfm ( Pst *pst, SuId suId, NluPciModIndCfm *pciMod )



  ;


extern S16 ptUiNluPciModIndCfm ( Pst *pst, SuId suId, NluPciModIndCfm *pciMod )



  ;







extern S16 WrLiNluBndCfm ( Pst *pst, SuId suId, SpId spId, U8 status )




  ;






extern S16 NlUiNluBndReq ( Pst *pst, SuId suId, SpId spId )



  ;






extern S16 NlUiNluBndCfm ( Pst *pst, SuId suId, SpId spId, U8 status )




  ;






extern S16 PtLiNluBndCfm ( Pst *pst, SuId suId, SpId spId, U8 status )




  ;







extern S16 NlUiNluNeighborReq ( Pst *pst, SuId suId, NluNeighborReport *newNhbr )



  ;





extern S16 cmUnpkNluPciModIndCfm ( NluPciModCfm func, Pst *pst, Buffer *mBuf )



  ;




extern S16 NlUiNluPciModIndCfm ( Pst *pst, SuId suId, NluPciModIndCfm *pciMod )



  ;

extern S16 cmPkNluUeMeasReportInd ( Pst *pst, SuId suId, NluUeMeasRpt *measRpt )



  ;

extern S16 cmUnpkNluUeMeasReportInd ( NluUeMeasRptInd func, Pst *pst, Buffer *mBuf )



  ;


extern S16 ptUiNluUeMeasReportInd ( Pst *pst, SuId suId, NluUeMeasRpt *measRpt )



  ;

extern S16 cmPkNluUeInd ( Pst *pst, SuId suId, NluUeInfo *ueInfo )



  ;

extern S16 cmUnpkNluUeInd ( NluUeInd func, Pst *pst, Buffer *mBuf )



  ;


extern S16 ptUiNluUeInd ( Pst *pst, SuId suId, NluUeInfo *ueInfo )



  ;

extern S16 cmPkNluUeCqiReportInd ( Pst *pst, SuId suId, NluUeCqiRpt *cqiRpt )



  ;

extern S16 cmUnpkNluUeCqiReportInd ( NluUeCqiRptInd func, Pst *pst, Buffer *mBuf )



  ;


extern S16 ptUiNluUeCqiReportInd ( Pst *pst, SuId suId, NluUeCqiRpt *cqiRpt )



  ;
typedef S16 (*NluPerCellSrchRsp) ( Pst *pst, SuId suId, NluPeriodicRemCellSearchRsp *cellSrchRsp )



  ;

extern S16 cmUnpkNluPerCellSrchRsp ( NluPerCellSrchRsp func, Pst *pst, Buffer *mBuf )



  ;

extern S16 cmPkNluPerCellSrchRsp ( Pst *pst, SuId suId, NluPeriodicRemCellSearchRsp *cellInfo )



  ;

extern S16 WrLiNluPerCellSrchRsp ( Pst *pst, SuId suId, NluPeriodicRemCellSearchRsp *cellSrchRsp )



  ;

extern S16 ptUiNluPerCellSrchRsp ( Pst *pst, SuId suId, NluPeriodicRemCellSearchRsp *cellInfo )



  ;

extern S16 NlUiNluPerdCellSrchRsp ( Pst *pst, SuId suId, NluPeriodicRemCellSearchRsp *cellSrchRsp )



  ;
typedef struct nlLmResponse
{
   TranId transId;
   Resp response;
}NlLmResponse;




typedef struct nlGenCb
{
   NlLmResponse CfmResp;
   Status memUpperThr;
   Status memLowerThr;
   NlPciSelType pciSelType;
   NlPrachSelType prachSelType;
   NlEarfcnSelType earfcnSelType;
   NlTxPowerSelType txPowerSelType;
   U32 maxUeSupp;
   U32 maxUePerTti;

}NlGenCb;




typedef struct nlUiSapCb
{
   Pst pst;
   SuId suId;
   SpId spId;
   State sapState;
   Mem mem;
   CmTimer timer;
   U8 bndRetryCnt;
   U8 maxBndRetry;
   TmrCfg bndTmr;
} NlUiSapCb;

typedef enum nlAlarmId
{
   Nl_ALARM_CLEAR,
   NL_ALARM_PCI_CONFLICT,
   NL_ALARM_PCI_CONFUSION
}NlAlarmId;

typedef enum nlAlarmPeerType
{
   NL_ALARM_PEER_NONE,
   NL_ALARM_PEER_SERV_CELL,
   NL_ALARM_PEER_NGH_SERV_CELL,
   NL_ALARM_PEER_NGH_NGH_CELL
}NlAlarmPeerType;

typedef struct nlAlarmPeerInfo
{
   Bool isActive;
   NlAlarmPeerType peerType;
   NlAlarmId alarmId;
   Void *peerAddr;
}NlAlarmPeerInfo;

typedef struct nlAlarmInfo
{
   Bool isAlarmRaised;
   U8 numPeerAlarm;
   NlAlarmPeerInfo peerInfo[5];
}NlAlarmInfo;





typedef struct nlPrachCfg
{
   U16 servRootSeqIdx;
   U8 servPrachCfgIdx;
   U8 servZeroCorrelationZoneCfg;
   U8 servPrachFreqOffset;
   Bool highSpeedFlag;

   U8 numRootSeqIndex;
   U16 rootSeqIdx[512];
   U8 numPrachCfgIdx;
   U8 prachConfigIdx[256];
   U8 numZeroCorrCfgZone;
   U8 zeroCorrelationZoneCfg[64];
   U8 numFreqOffset;
   U8 freqOffset[256];
}NlPrachCfg;

typedef enum nlBandwidth
{
   NL_BANDWIDTH_6,
   NL_BANDWIDTH_15,
   NL_BANDWIDTH_25,
   NL_BANDWIDTH_50,
   NL_BANDWIDTH_75,
   NL_BANDWIDTH_100
} NlBandwidth;





typedef struct nlCellInfo
{
   NlAlarmInfo alarmInfo;
   U16 pci;
   LnlEcgi ecgi;
   U16 dlEarfcn;
   U16 ulEarfcn;
   Bool isPrachCfg;

   NlPrachCfg prachCfg;
   Bool isCsgCell;
   U8 csgAccessMode;
   U32 csgId;
   U16 lteBand;
   U16 tac;
   NlBandwidth ulBw;
   NlBandwidth dlBw;
   S8 RSTxPower;
   S16 rsrp;
   S16 rssi;
   Bool isCellBarred;
   Bool isCsgPciCfg;
   LnlCsgAccessMode accessMode;
   U16 csgStartPci;
   U16 csgPciRange;
   Bool isSmallCellPciCfg;
   U16 smallCellStartPci;
   U16 maxSmallCellPci;
}NlCellInfo;




typedef struct nlNghNghCellCb
{
   CmLList lnk;
   NlCellInfo nghNghCellInfo;
}NlNghNghCellCb;

typedef struct nlNghServCellCb
{
   CmLList lnk;
   NlCellInfo servCellInfo;
   CmLListCp nghCellLst;
}NlNghServCellCb;

typedef struct nlNeighCellCb
{
   CmHashListEnt neighEnbHashEnt;
   CmLListCp servCellLst;
   U32 enbId;
} NlNeighCellCb;

typedef struct nlNeighEnbCb
{
   CmHashListCp nghEnbListCp;
}NlNeighEnbCb;

typedef enum nlCellEvent
{
   NL_CELL_EVENT_NGH_CFG = 0,
   NL_CELL_EVENT_RECFG,

   NL_CELL_UE_ADD,
   NL_CELL_UE_DELETE,
   NL_CELL_UE_MEAS_RPT,
   NL_CELL_UE_CQI_RPT,
   NL_CELL_UE_MODIFY,
   NL_CELL_EVENT_MAX
}NlCellEvent;

typedef enum nlCellState
{
   NL_CELL_STATE_INIT,
   NL_CELL_STATE_PCI_CONFLICT,
   NL_CELL_STATE_CONFIGURED,
   NL_CELL_STATE_PCI_MODIFY,
   NL_CELL_STATE_WAIT_TXPOWER_CFG,
   NL_CELL_STATE_MAX
}NlCellState;

typedef enum nlVendorDSonEvent
{
   NL_VENDOR_DSON_EVENT_CELL_CFG,
   NL_VENDOR_DSON_EVENT_TX_POWER_CFG,
   NL_VENDOR_DSON_EVENT_REPORT_CFG,
   NL_VENDOR_DSON_EVENT_IM_CFG,
   NL_VENDOR_DSON_EVENT_SON_STOP_CFM,
   NL_VENDOR_DSON_EVENT_MAX

}NlVendorDSonEvent;

typedef enum nlVendorDSonState
{
   NL_VENDOR_DSON_STATE_INIT = 0,
   NL_VENDOR_DSON_STATE_WAIT_CELL_CFG_CFM,
   NL_VENDOR_DSON_STATE_WAIT_TX_POWER_CFG,
   NL_VENDOR_DSON_STATE_CONFIGURED,
   NL_VENDOR_DSON_STATE_WAIT_REPORT_CFG_REQ,
   NL_VENDOR_DSON_STATE_MAX
}NlVendorDSonState;



typedef enum nlPhichNg
{
   NL_NG_ONESIXTH,
   NL_NG_HALF,
   NL_NG_ONE,
   NL_NG_TWO
}NlPhichNg;






typedef struct zeroCorrerelationConfigZoneType
{
   U16 prachNcsVal;
   U16 prachNumCyclicShifts;
   U16 numRootSeqIndex;
} ZeroCorrerelationConfigZoneType;






typedef struct nlPucchCfg
{
   U8 pucchCqiResIdx;
   U16 n1PucchAn;
   U8 deltaShift;

   U8 cyclicShift;



   U8 mappingNpwithP[5];
}NlPucchCfg;






typedef struct nlPhichCfg
{
   NlPhichNg ngEnum;
   Bool isDurExtend;

}NlPhichCfg;




typedef struct nlPciModAlarmInfo
{
   U16 oldPci;
   Bool isAlarmSend;
   LnlDgnType alarmType;
   LnlDgnAlarm alarmId;
}NlPciModAlarmInfo;

typedef struct nlTmpNghCellModInfo
{
   LnlEcgi oldEcgi;
   NlCellInfo nghCellInfo;
   U8 numNghNgh;
   NlCellInfo nghNghCellInfo[16];
}NlTmpNghCellModInfo;

typedef struct nlTmpNghCellMod
{
   U8 numNgh;
   NlTmpNghCellModInfo nghCellModInfo[16];

}NlTmpNghCellMod;

typedef struct nlTmpNghCellDel
{
   U8 numNgh;
   LnlEcgi ecgi[16];
}NlTmpNghCellDel;


typedef struct NlTmpNghCellAddInfo
{
   NlCellInfo nghCellInfo;
   U8 numNghNgh;
   NlCellInfo nghNghCellInfo[16];
}NlTmpNghCellAddInfo;

typedef struct nlTmpNghCellAdd
{
   U8 numNgh;
   NlTmpNghCellAddInfo nghCellAddInfo[16];
}NlTmpNghCellAdd;

typedef enum nlTmpNghCfgType
{
   NL_NGH_ADD,
   NL_NGH_DEL,
   NL_NGH_MOD
}NlTmpNghCfgType;

typedef struct nlTmpNghCellCfgParam
{
   NlTmpNghCfgType cfgType;
   union
   {
      NlTmpNghCellAdd nghCellAdd;
      NlTmpNghCellDel nghCellDel;
      NlTmpNghCellMod nghCellMod;
   }u;
}NlTmpNghCellCfgParam;

typedef struct nlTmpNghEnbCellCfg
{
   U32 nghEnbId;
   NlTmpNghCellCfgParam nghCellParam;
}NlTmpNghEnbCellCfg;

typedef struct nlTmpNghCellCfg
{
   U32 cellId;
   U8 numNghEnb;
   NlTmpNghEnbCellCfg nghEnbCellCfg[16];
}NlTmpNghCellCfg;

typedef struct nlNghCfgPendMsg
{
   CmLList link;
   NlTmpNghCellCfg nghCellCfg;
}NlNghCfgPendMsg;

typedef struct nlCellReCfgPendMsg
{
   CmLList link;
   LnlCellReCfg cellReCfg;
}NlCellReCfgPendMsg;

typedef struct nlPciModPendMsg
{
   CmLListCp nghCfgMsgList;
   CmLListCp cellReCfgMsgList;
}NlPciModPendMsg;

typedef enum nlCellPciType
{
   NL_SELECTED_PCI_MOD3 = 3,
   NL_SELECTED_PCI_MOD6 = 6,
   NL_SELECTED_PCI_MOD30 = 30,
   NL_SELECTED_DEFAULT_PCI = 255
}NlCellPciType;

typedef struct nlTxPowerCfg
{
   U8 refSignalPwrCnt;
   S8 referenceSignalPwr[128];
   U8 pBCnt;
   U8 pB[8];
   U8 pACnt;
   U8 pA[4];
   U8 pschPowerOffCnt;
   U8 sschPowerOffCnt;
   U8 pbchPowerOffCnt;
   S8 pschPowerOffset[512];
   S8 sschPowerOffset[512];
   S8 pbchPowerOffset[512];
}NlTxPowerCfg;

typedef struct nlTxPowerSel
{
   S8 refSignalTxPwr;
   S16 pssPowerOffset;
   S16 sssPowerOffset;
   S16 pbchPowerOffset;
   U8 pB;
   S8 pout;
}NlTxPowerSel;




typedef struct nlCellCb
{
   CmHashListEnt cellCbHashEnt;
   U32 cellId;
   U8 duplexMode;
   NlCellState state;
   NlCellInfo cellInfo;
   U16 numNgh;
   U32 numPci;
   U16 pciList[504];
   U32 selPciIdx;
   U8 bandWidth;
   U32 bandWidthEnum;
   U8 numTxAntPorts;
   U8 subFrameCfg;
   NlNeighEnbCb neighEnbCb;
   NlPrachCfg prachCfg;
   NlPucchCfg pucchResCfg;

   Bool isCpUlExtend;

   NlPhichCfg phichCfg;
   NlPciModAlarmInfo pciModAlarmInfo;
   NlPciModPendMsg pciModPendMsg;

   Bool isSmSonCfgDone;

   NlTxPowerCfg txPowerCfg;
   NlTxPowerSel txPowerSel;
   NlVendorDSonState dSonState;
   S8 tgtRsrp;
   U8 attnConstIdx;

   S8 rsysTpmRsrpMin;

   S8 rsysTpmRsrpMax;

}NlCellCb;




typedef struct nlCb
{
   TskInit init;
   NlGenCb genCfg;
   Header lmHdr;
   NlUiSapCb nluSap;
   CmHashListCp cellCbList;
   CmTqCp tqCp;
   CmTqType tq[20];
   Ticks timeRes;
} NlCb;

typedef struct nlRemScanEarfcnSel
{
   S32 rssi;
   U8 dlEarfcnIdx;
}NlRemScanEarfcnSel;

typedef struct nlAlarmRaised
{
   NlAlarmPeerType peerType;
   Void *peerAddr;
   LnlUstaDgn dgn;
}NlAlarmRaised;

typedef struct nlAlarm
{

   Bool resolveDeferred;
   Bool isAlarmRaised;
   Bool isAlarmSend;
   Bool isPciUpdated;
   Bool isAlarmCleared;
   U8 numAlarmCleared;
   U8 numAlarmRaised;
   NlAlarmRaised alarmRaised[16];
   LnlUstaDgn alarmCleared[16];
}NlAlarm;

typedef enum nlEventMsgType
{
   SON_CELL_RECFG,
   SON_NGH_CFG,
   SON_X2SETUP_REQ_NGH_CFG,
   SON_X2SETUP_RSP_NGH_CFG,
   SON_ENB_CFG_UPD_NGH_CFG,
   SON_ANR_NGH_CFG,
   SON_UE_ADD,
   SON_UE_DELETE,
   SON_UE_MODIFY,
   SON_UE_MEAS_RPT,
   SON_UE_CQI_RPT
}NlEventMsgType;



typedef struct nlEventMsg
{
  NlEventMsgType msgType;
  Void *msg;
}NlEventMsg;

typedef struct nlVendorDSonEventMsg
{
   Void *msg;
   U32 msgType;
}NlVendorDSonEventMsg;

typedef S16 (*nlGlbStateMachine)(NlEventMsg * , NlCellCb *);
typedef S16 (*nlVendorDSonStateMachine)(NlVendorDSonEventMsg *, NlCellCb *);

typedef S16 (*NlVendorDSonDatIndFp) ( Pst *pst, NlVendorDSonEventMsg *msgInd )


       ;


extern NlCb nlCb;


extern nlGlbStateMachine nlGlbCellFSM[NL_CELL_STATE_MAX][NL_CELL_EVENT_MAX];
extern nlVendorDSonStateMachine nlGlbVendorDSonFSM[NL_VENDOR_DSON_STATE_MAX][NL_VENDOR_DSON_EVENT_MAX];

extern S16 nlActvTsk ( Pst *pst, Buffer *mBuf )


  ;

extern S16 nlSendPciUpdateInd ( NlCellCb *cellCb )

  ;

extern S16 nlSendEarfcnUpdateInd ( NlCellCb *cellCb )

  ;

extern S16 nlSendTxPwrUpdateInd ( NlCellCb *cellCb )

  ;

extern Bool nlNghPciCollisionDetect ( NlCellCb *cellCb, NlTmpNghCellCfg *nghCellCfg, U32 msgTye, NlAlarm *alarm )




  ;

extern Bool nlNghPciConfusionDetect ( NlCellCb *cellCb, NlTmpNghCellCfg *nghCellCfg, NlAlarm *alarm )



  ;

extern Bool nlNghAddPciConfusionDetect ( NlCellCb *cellCb, NlTmpNghCellAdd *nghCellAdd, NlAlarm *alarm )



  ;

extern Bool nlNghModPciConfusionDetect ( NlCellCb *cellCb, NlTmpNghCellMod *nghCellMod, NlAlarm *alarm )



  ;

extern S16 nlValidatePciEcgiWithNghCellInfo ( NlCellCb *cellCb, U16 pci, LnlEcgi *ecgi, U16 dlEarfcn, NlAlarm *alarm )





  ;

extern S16 nlNghPciInfoAdd ( NlCellCb *cellCb, NlTmpNghCellCfg *nghCellCfg, NlAlarm *alarm )



  ;

extern S16 nlNghPciInfoDelete ( NlCellCb *cellCb, NlTmpNghCellCfg *nghCellCfg, NlAlarm *alarm )



  ;

extern S16 nlNghPciInfoModify ( NlCellCb *cellCb, NlTmpNghCellCfg *nghCellCfg, NlAlarm *alarm )



  ;


extern S16 nlSendLnlAlarm ( LnlUstaDgn *alarm )

  ;

extern S16 nlInitNghCellCfgEvtHndlr ( NlEventMsg *msg, NlCellCb *cellCb )


  ;

extern S16 nlNghPciInfoUpdateInNghTbl ( NlCellCb *cellCb, NlTmpNghCellCfg *nghCellCfg, NlAlarm *alarm )



  ;

extern S16 nlNghPciCollisionResolve ( NlCellCb *cellCb, NlTmpNghCellCfg *nghCellCfg, NlAlarm *alarm )



  ;

extern S16 nlValidatePciWithNghCellInfo ( NlCellCb *cellCb, U16 pci, U16 dlEarfcn, NlCellPciType modType )




  ;

extern S16 nlStoreCellReCfgPciInfo ( NlCellCb *cellCb, LnlCellReCfg *cellReCfg, U32 selPciIdx )



  ;

extern S16 nlConflictNghCellCfgEvtHndlr ( NlEventMsg *msg, NlCellCb *cellCb )


  ;

extern S16 nlConfigNghCellCfgEvtHndlr ( NlEventMsg *msg, NlCellCb *cellCb )


  ;

extern S16 nlConfigCellReCfgEvtHndlr ( NlEventMsg *msg, NlCellCb *cellCb )


  ;

extern S16 nlConflictCellReCfgEvtHndlr ( NlEventMsg *msg, NlCellCb *cellCb )


  ;

extern S16 nlProcessInvalidMsg ( NlEventMsg *msg, NlCellCb *cellCb )


  ;

extern S16 nlUpdatePciListWithSelPci ( NlCellCb *cellCb )

  ;

extern S16 nlStoreNghPeerAlarmInfo ( NlAlarmInfo *alarmInfo, LnlDgnAlarm alarmId, NlAlarmPeerType peerType, Void *peerAddr )




  ;

extern S16 nlNghPeerAlarmClear ( NlNghServCellCb *nghServCell )

  ;

extern S16 nlNghNghPeerAlarmClear ( NlNghNghCellCb *nghNghCell )

  ;

extern S16 nlServCellPeerAlarmClear ( NlCellCb *servCell )

  ;

extern S16 nlCellSelectPrach ( NlCellCb *cellCb, NlEventMsg *evtMsg, NlAlarm *alarm )



  ;

extern S16 nlSelectServCellPrachConfig ( NlEventMsg *evtMsg, NlCellCb *cellCb, NlAlarm *alarm )



  ;

extern S16 nlSendPrachParamUpdateInd ( NlCellCb *cellCb )

  ;

extern S16 nlValidateCellPrachCfg ( LnlPrachCfg *prachCfg )

  ;

extern S16 nlValidateCellEarfcnCfg ( LnlCellCfg *cellCfg )

  ;

extern S16 nlValidateCellPciCfg ( LnlCellCfg *cellCfg )

  ;

extern S16 nlCellSelectEarfcn ( NlCellCb *cellCb, LnlCellCfg *cellCfg )


  ;

extern S16 nlCellStorePciCfg ( NlCellCb *cellCb, LnlCellCfg *cellCfg )


  ;

extern S16 nlCellStorePrachCfg ( NlCellCb *cellCb, LnlCellCfg *cellCfg )


  ;

extern S16 nlCellSelectPci ( NlCellCb *cellCb, NlTmpNghCellCfg *nghCellCfg, U32 msgType, NlAlarm *alarm )




  ;

extern S16 nlCellSelectTxPower ( NlCellCb *cellCb )

  ;

extern S16 nlHandleCellSelectedTxPower ( NlCellCb *cellCb )

  ;

extern S16 nlPciModifyCellReCfgEvtHndlr ( NlEventMsg *evtMsg, NlCellCb *cellCb )


  ;

extern S16 nlPciModifyNghCellCfgEvtHndlr ( NlEventMsg *evtMsg, NlCellCb *cellCb )


  ;

extern S16 nlUpdateNghNghCellAlarmInfo ( NlNghNghCellCb *nghNghCellCb, NlAlarm *alarm )


  ;

extern S16 nlUpdateNghCellAlarmInfo ( NlNghServCellCb *nghCellCb, NlAlarm *alarm )


  ;

extern S16 nlNghPciCollisionResolveWithNghDelOrMod ( NlCellCb *cellCb, NlTmpNghCellCfg *nghCellCfg, NlAlarm *alarm )



  ;

extern S16 nlCellSelectTxPowerByDSon ( NlCellCb *cellCb )

  ;

extern S16 nlCellStoreTxPowerCfg ( NlCellCb *cellCb, LnlCellCfg *cellCfg )


  ;

extern Void SendToRRM ( Void *msg )

  ;

extern Void FreeByRRM ( Void *msg )

  ;

extern S16 nlUnpkVendorDSonDatInd ( NlVendorDSonDatIndFp func, Pst *pst, Buffer *mBuf )



  ;

extern S16 nlVendorDSonConnEstReq ( Void )

  ;

extern S16 NlVendorDSonDatInd ( Pst *pst, NlVendorDSonEventMsg *evtMsg )


  ;

extern S16 nlVendorDSonCellCfgReq ( Void *cellCfgReq )

  ;

extern S16 nlVendorDSonCellTxPwrCfgCfm ( Void *txPwrCfm )

  ;

extern S16 nlVendorDSonRemResultInd ( Void *remInd )

  ;

extern S16 nlBuildRemResultInd ( NlCellCb *cellCb )

  ;

extern S16 nlRegInitTmr ( Void )

  ;

extern S16 nlActvTmr ( Ent ent, Inst inst )


  ;

extern Void nlStopTmr ( U32 cb, S16 event )


  ;

extern S16 nlHdlPeriodicRemCellSrchRsp ( NluPeriodicRemCellSearchRsp *cellSrchRsp )

  ;

extern S16 nlBuildPeriodicRemResultInd ( NluPeriodicRemCellSearchRsp *cellSrchRsp )

  ;



extern Void nlStartTmr ( U32 cb, S16 tmrEvnt, U32 delay )



  ;

extern S16 nlSendSonREMScanReq ( U16 remScanInterval, U16 remScanCount, NlCellCb *cellCb )



  ;

extern Void nlUtlFindStrongestNghCell ( NlCellCb *cellCb, NlNghServCellCb **strngstNghCell )


  ;

extern S16 nlShutDownVendorDSon ( Void )

  ;

extern Void nlStopTimers ( Void )

  ;

extern S16 nlFillBwConfig ( U8 dlbW )

  ;

extern Void nlInitSonDB ( Void )

  ;

extern S16 nlReportNumNghToSon ( U16 numNgh )

  ;

extern S16 nlConfigUeAddEvtHndlr ( NlEventMsg *evtMsg, NlCellCb *cellCb )


  ;

extern S16 nlConfigUeModEvtHndlr ( NlEventMsg *evtMsg, NlCellCb *cellCb )


  ;

extern S16 nlConfigUeDeleteEvtHndlr ( NlEventMsg *evtMsg, NlCellCb *cellCb )


  ;

extern S16 nlConfigUeMeasRptEvtHndlr ( NlEventMsg *evtMsg, NlCellCb *cellCb )


  ;

extern S16 nlConfigUeCqiRptEvtHndlr ( NlEventMsg *evtMsg, NlCellCb *cellCb )


  ;

extern Void nlProcTmr ( Ptr cb, S16 event )


  ;

extern S16 nlSendSonSchdCfgInd ( LnlSonSchdCfg *schdCfg, NlCellCb *cellCb )


  ;

extern S16 nlSendSonMeasRptIntervalInd ( U32 ueMeasInterval, NlCellCb *cellCb )


  ;
 Void nlProcTmr
(
Ptr cb,
S16 event
)







{
   return;
}
 Void nlStartTmr
(
U32 cb,
S16 tmrEvnt,
U32 delay
)
{
   delay = ((delay * 100) / nlCb.timeRes);
   return;
}
 Void nlStopTmr
(
U32 cb,
S16 event
)







{
   return;
}
 S16 nlActvTmr
(
Ent ent,
Inst inst
)







{
   if(&nlCb.tqCp && nlCb.tq)
   {
      cmPrcTmr(&nlCb.tqCp, nlCb.tq, (PFV) nlProcTmr);
   }

   return(0);
}
 S16 nlRegInitTmr
(
Void
)






{
   U16 idx;
   S16 ret;

   ret = SRegCfgTmrMt((Ent)0xea,(Inst)0,nlCb.timeRes,100,nlActvTmr);
   if (ret != 0)
   {
      if( L_ERROR < g_logLevel || g_modMask & RLOG_MODULE_ID){ logLev0(0xff0001, L_ERROR, "/home/mrehwald/Desktop/Radisys/lte_enb/src/lteson/src/nl_tmr.c",230, "SRegTmr Failed", RLOG_FILE_ID, RLOG_MODULE_NAME); };
      return(1);
   }


   nlCb.tqCp.tmrLen = 20;

   for (idx = 0; idx < 20; idx++)
   {
      nlCb.tq[idx].first = 0L;
      nlCb.tq[idx].tail = 0L;
   }

   return(0);
}
 Void nlStopTimers
(
Void
)






{
}