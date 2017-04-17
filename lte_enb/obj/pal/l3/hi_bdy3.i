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






typedef struct hiHdrInfo
{
   U32 hdrLen;
   U32 offLen;
   U32 lenLen;
   U32 flag;

} HiHdrInfo;
typedef struct hiGenCfg
{
   U16 numSaps;
   U32 numCons;
   U16 numFdsPerSet;
   U16 numFdBins;
   U8 numClToAccept;
   Bool permTsk;
   U16 schdTmrVal;
   U32 selTimeout;
   U8 numRawMsgsToRead;
   U8 numUdpMsgsToRead;


   Status poolStrtThr;
   Status poolDropThr;
   Status poolStopThr;

   Ticks timeRes;
   Pst lmPst;
   Region initRegion;
   Pool initPool;
} HiGenCfg;



typedef struct hiSapCfg
{
   SpId spId;
   Bool flcEnb;
   U32 txqCongStrtLim;
   U32 txqCongDropLim;
   U32 txqCongStopLim;
   U16 numBins;
   Priority uiPrior;
   Route uiRoute;
   Selector uiSel;
   MemoryId uiMemId;


   HiHdrInfo hdrInf[5];






} HiSapCfg;
typedef struct hiGenSts
{
   StsCntr numCons;
   StsCntr sockTxErr;
   StsCntr sockRxErr;
   StsCntr sockOpenErr;
   StsCntr sockBindErr;
   StsCntr sockCnctErr;
   StsCntr sockLstnErr;
   StsCntr sockSOptErr;
   StsCntr sockClosErr;
   StsCntr sockShutErr;
   StsCntr rxMsgVerErr;
   StsCntr numFlcInd;
   StsCntr numTxbytes;
   StsCntr numRxbytes;
   StsCntr numTxTcpMsg;
   StsCntr numRxTcpMsg;
   StsCntr numTxUdpMsg;
   StsCntr numRxUdpMsg;
   StsCntr numTxRawMsg;
   StsCntr numRxRawMsg;
} HiGenSts;




typedef struct hiSapSts
{
   SpId sapId;
   StsCntr numCons;
   StsCntr numTxbytes;
   StsCntr numRxbytes;
   StsCntr numTxTcpMsg;
   StsCntr numRxTcpMsg;
   StsCntr numTxUdpMsg;
   StsCntr numRxUdpMsg;
   StsCntr numTxRawMsg;
   StsCntr numRxRawMsg;
} HiSapSts;




typedef struct hiSapSta
{
   SpId spId;
   State state;







} HiSapSta;



typedef struct hiAlarmInfo
{
   SpId spId;
   U8 type;





   union
   {
      State state;
      State conState;
      Mem mem;
      U8 parType;




   } inf;

} HiAlarmInfo;





typedef struct hiDbgCntrl
{
   U32 dbgMask;

} HiDbgCntrl;





typedef struct hiTrcCntrl
{
   SpId sapId;
   S16 trcLen;

} HiTrcCntrl;





typedef struct hiCfg
{
   union
   {
      HiGenCfg hiGen;
      HiSapCfg hiSap;





   } s;

} HiCfg;
typedef struct hiSts
{
   DateTime dt;
   Duration dura;

   union
   {
      HiGenSts genSts;
      HiSapSts sapSts;







   } s;

} HiSts;


typedef struct hiSsta
{
   DateTime dt;

   union
   {
      SystemId sysId;
      HiSapSta sapSta;

   } s;

} HiSsta;




typedef struct hiUsta
{
   CmAlarm alarm;
   HiAlarmInfo info;

} HiUsta;




typedef struct hiTrc
{
   DateTime dt;
   U16 evnt;




} HiTrc;




typedef struct hiCntrl
{
   DateTime dt;
   U8 action;
   U8 subAction;

   union
   {
      HiTrcCntrl trcDat;
      ProcId dstProcId;
      Route route;
      Priority priority;
      SpId sapId;


      HiDbgCntrl hiDbg;

      U32 logMask;

   } ctlType;

} HiCntrl;




typedef struct hiMngmt
{
   Header hdr;
   CmStatus cfm;

   union
   {
      HiCfg cfg;
      HiSts sts;
      HiSsta ssta;
      HiUsta usta;
      HiTrc trc;
      HiCntrl cntrl;

   } t;

} HiMngmt;





typedef S16 (*LhiCfgReq) (Pst *pst, HiMngmt *cfg);
typedef S16 (*LhiCfgCfm) (Pst *pst, HiMngmt *cfg);
typedef S16 (*LhiCntrlReq) (Pst *pst, HiMngmt *cntrl);
typedef S16 (*LhiCntrlCfm) (Pst *pst, HiMngmt *cntrl);
typedef S16 (*LhiStsReq) (Pst *pst, Action action, HiMngmt *sts)
                                                    ;
typedef S16 (*LhiStsCfm) (Pst *pst, HiMngmt *sts);
typedef S16 (*LhiStaReq) (Pst *pst, HiMngmt *sta);
typedef S16 (*LhiStaInd) (Pst *pst, HiMngmt *sta);
typedef S16 (*LhiStaCfm) (Pst *pst, HiMngmt *sta);
typedef S16 (*LhiTrcInd) (Pst *pst, HiMngmt *trc, Buffer *mBuf)
                                                    ;





extern S16 HiMiLhiCfgReq (Pst *pst, HiMngmt *cfg);
extern S16 HiMiLhiCfgCfm (Pst *pst, HiMngmt *cfg);
extern S16 HiMiLhiCntrlReq (Pst *pst, HiMngmt *cntrl);
extern S16 HiMiLhiCntrlCfm (Pst *pst, HiMngmt *cntrl);
extern S16 HiMiLhiStsReq (Pst *pst, Action action, HiMngmt *sts)
                                                    ;
extern S16 HiMiLhiStsCfm (Pst *pst, HiMngmt *sts);
extern S16 HiMiLhiStaReq (Pst *pst, HiMngmt *sta);
extern S16 HiMiLhiStaCfm (Pst *pst, HiMngmt *sta);
extern S16 HiMiLhiStaInd (Pst *pst, HiMngmt *sta);
extern S16 HiMiLhiTrcInd (Pst *pst, HiMngmt *trc, Buffer *mBuf)
                                                    ;



extern S16 SmMiLhiCfgReq (Pst *pst, HiMngmt *cfg);
extern S16 SmMiLhiCfgCfm (Pst *pst, HiMngmt *cfg);
extern S16 SmMiLhiCntrlReq (Pst *pst, HiMngmt *cntrl);
extern S16 SmMiLhiCntrlCfm (Pst *pst, HiMngmt *cntrl);
extern S16 SmMiLhiStsReq (Pst *pst, Action action, HiMngmt *sts)
                                                    ;
extern S16 SmMiLhiStsCfm (Pst *pst, HiMngmt *sts);
extern S16 SmMiLhiStaReq (Pst *pst, HiMngmt *sta);
extern S16 SmMiLhiStaInd (Pst *pst, HiMngmt *sta);
extern S16 SmMiLhiStaCfm (Pst *pst, HiMngmt *sta);
extern S16 SmMiLhiTrcInd (Pst *pst, HiMngmt *trc, Buffer *mBuf)
                                                    ;






extern S16 cmPkLhiCfgReq (Pst *pst, HiMngmt *cfg);
extern S16 cmPkLhiCfgCfm (Pst *pst, HiMngmt *cfg);
extern S16 cmPkLhiCntrlReq (Pst *pst, HiMngmt *cntrl);
extern S16 cmPkLhiCntrlCfm (Pst *pst, HiMngmt *cntrl);
extern S16 cmPkLhiStsReq (Pst *pst, Action action, HiMngmt *sts);
extern S16 cmPkLhiStsCfm (Pst *pst, HiMngmt *sts);
extern S16 cmPkLhiStaReq (Pst *pst, HiMngmt *sta);
extern S16 cmPkLhiStaInd (Pst *pst, HiMngmt *sta);
extern S16 cmPkLhiTrcInd (Pst *pst, HiMngmt *trc, Buffer *mBuf);
extern S16 cmPkLhiStaCfm (Pst *pst, HiMngmt *sta);
extern S16 cmUnpkLhiCfgReq (LhiCfgReq func, Pst *pst, Buffer *mBuf)
                                                    ;
extern S16 cmUnpkLhiCfgCfm (LhiCfgCfm func, Pst *pst, Buffer *mBuf)
                                                  ;
extern S16 cmUnpkLhiCntrlReq (LhiCntrlReq func, Pst *pst, Buffer *mBuf)
                                                    ;
extern S16 cmUnpkLhiCntrlCfm (LhiCntrlCfm func, Pst *pst, Buffer *mBuf)
                                                    ;
extern S16 cmUnpkLhiStsReq (LhiStsReq func, Pst *pst, Buffer *mBuf)
                                                    ;
extern S16 cmUnpkLhiStsCfm (LhiStsCfm func, Pst *pst, Buffer *mBuf)
                                                    ;
extern S16 cmUnpkLhiStaReq (LhiStaReq func, Pst *pst, Buffer *mBuf)
                                                    ;
extern S16 cmUnpkLhiStaInd (LhiStaInd func, Pst *pst, Buffer *mBuf)
                                                    ;
extern S16 cmUnpkLhiStaCfm (LhiStaCfm func, Pst *pst, Buffer *mBuf)
                                                    ;
extern S16 cmUnpkLhiTrcInd (LhiTrcInd func, Pst *pst, Buffer *mBuf)
                                                    ;





extern S16 smHiActvTsk (Pst *pst, Buffer *mBuf);
extern S16 smHiActvInit (Ent ent, Inst inst, Region region, Reason reason)
                                                                    ;
extern S16 hiActvInit (Ent ent, Inst inst, Region region, Reason reason)
                                                                    ;

extern S16 hiActvTsk (Pst *pst, Buffer *mBuf);
typedef S16 (*HitBndReq) (Pst *pst, SuId suId, SpId spId);
typedef S16 (*HitUbndReq) (Pst *pst, SpId spId, Reason reason);
typedef S16 (*HitServOpenReq) (Pst *pst, SpId spId, UConnId servConId, CmTptAddr *servTAddr, CmTptParam *tPar, CmIcmpFilter *icmpFilter, U8 srvcType)

                                                                            ;
typedef S16 (*HitConReq) (Pst *pst, SpId spId, UConnId suConId, CmTptAddr *remAddr, CmTptAddr *localAddr, CmTptParam *tPar, U8 srvcType)

                                                               ;
typedef S16 (*HitConRsp) (Pst *pst, SpId spId, UConnId suConId, UConnId spConId)
                                                 ;
typedef S16 (*HitDatReq) (Pst *pst, SpId spId, UConnId spConId, Buffer *mBuf)
                                              ;
typedef S16 (*HitUDatReq) (Pst *pst, SpId spId, UConnId spConId, CmTptAddr *remAddr, CmTptAddr *srcAddr, CmIpHdrParm *hdrParm, CmTptParam *tPar, Buffer *mBuf)


                                              ;
typedef S16 (*HitDiscReq) (Pst *pst, SpId spId, U8 choice, UConnId conId, Action action, CmTptParam *tPar)
                                                                 ;
typedef S16 (*HitConInd) (Pst *pst, SuId suId, UConnId servConId, UConnId spconId, CmTptAddr *peerAddr)
                                                                      ;
typedef S16 (*HitConCfm) (Pst *pst, SuId suId, UConnId suConId, UConnId spconId, CmTptAddr *localAddr)
                                                                       ;
typedef S16 (*HitBndCfm) (Pst *pst, SuId suId, U8 status);
typedef S16 (*HitDatInd) (Pst *pst, SuId suId, UConnId suconId, Buffer *mBuf)
                                              ;






typedef S16 (*HitUDatInd) (Pst *pst, SuId suId, UConnId suconId, CmTptAddr *srcAddr, CmTptAddr *destAddr, CmIpHdrParm *hdrParm, Buffer *mBuf)


                                              ;

typedef S16 (*HitDiscInd) (Pst *pst, SuId suId, U8 choice, UConnId conId, Reason reason)
                                               ;
typedef S16 (*HitDiscCfm) (Pst *pst, SuId suId, U8 choice, UConnId conId, Action action)
                                                              ;
typedef S16 (*HitFlcInd) (Pst *pst, SuId suId, UConnId suConId, Reason reason)
                                               ;
extern S16 HiUiHitBndReq (Pst *pst, SuId suId, SpId spId);
extern S16 HiUiHitUbndReq (Pst *pst, SpId spId, Reason reason);

extern S16 HiUiHitServOpenReq (Pst *pst, SpId spId, UConnId servConId, CmTptAddr *servTAddr, CmTptParam *tPar, CmIcmpFilter *icmpFilter, U8 srvcType)

                                                                            ;
extern S16 HiUiHitConReq (Pst *pst, SpId spId, UConnId suConId, CmTptAddr *remAddr, CmTptAddr *localAddr, CmTptParam *tPar, U8 srvcType)

                                                                    ;
extern S16 HiUiHitConRsp (Pst *pst, SpId spId, UConnId suConId, UConnId spConId)
                                                      ;
extern S16 HiUiHitDatReq (Pst *pst, SpId spId, UConnId spConId, Buffer *mBuf)
                                                   ;
extern S16 HiUiHitUDatReq (Pst *pst, SpId spId, UConnId spConId, CmTptAddr *remAddr, CmTptAddr *srcAddr, CmIpHdrParm *hdrParm, CmTptParam *tPar, Buffer *mBuf)


                                                   ;
extern S16 HiUiHitDiscReq (Pst *pst, SpId spId, U8 choice, UConnId conId, Action action, CmTptParam *tPar)

                                                       ;
extern S16 HiUiHitConInd (Pst *pst, SuId suId, UConnId servConId, UConnId spConId, CmTptAddr *peerAddr)
                                                                           ;
extern S16 HiUiHitConCfm (Pst *pst, SuId suId, UConnId suConId, UConnId spConId, CmTptAddr *localAddr)
                                                                            ;
extern S16 HiUiHitBndCfm (Pst *pst, SuId suId, U8 status);
extern S16 HiUiHitDatInd (Pst *pst, SuId suId, UConnId suConId, Buffer *mBuf)
                                                   ;






extern S16 HiUiHitUDatInd (Pst *pst, SuId suId, UConnId suConId, CmTptAddr *srcAddr, CmTptAddr *destAddr, CmIpHdrParm *hdrParm, Buffer *mBuf)


                                                   ;

extern S16 HiUiHitDiscInd (Pst *pst, SuId suId, U8 choice, UConnId conId, Reason reason)
                                                                   ;
extern S16 HiUiHitDiscCfm (Pst *pst, SuId suId, U8 choice, UConnId conId, Action action)
                                                                   ;
extern S16 HiUiHitFlcInd (Pst *pst, SuId suId, UConnId suConId, Reason reason)
                                                                     ;
extern S16 SbLiHitBndReq (Pst *pst, SuId suId, SpId spId);
extern S16 SbLiHitUbndReq (Pst *pst, SpId spId, Reason reason);


extern S16 SbLiHitServOpenReq (Pst *pst, SpId spId,UConnId servConId, CmTptAddr *servTAddr, CmTptParam *tPar, CmIcmpFilter *icmpFilter, U8 srvcType)

                                                                            ;
extern S16 SbLiHitUDatReq (Pst *pst, SpId spId, UConnId spConId, CmTptAddr *remAddr, CmTptAddr *srcAddr, CmIpHdrParm *hdrParm, CmTptParam *tPar, Buffer *mBuf)


                                                   ;
extern S16 SbLiHitDiscReq (Pst *pst, SpId spId, U8 choice, UConnId conId, Action action, CmTptParam *tPar)

                                                       ;
extern S16 SbLiHitConCfm (Pst *pst, SuId suId, UConnId suConId, UConnId spConId, CmTptAddr *localAddr)
                                                                            ;
extern S16 SbLiHitBndCfm (Pst *pst, SuId suId, U8 status);






extern S16 SbLiHitUDatInd (Pst *pst, SuId suId, UConnId suConId, CmTptAddr *srcAddr, CmTptAddr *remAddr, CmIpHdrParm *ipHdrParm, Buffer *mBuf)


                                                   ;

extern S16 SbLiHitDiscInd (Pst *pst, SuId suId, U8 choice, UConnId conId, Reason reason)
                                                                   ;
extern S16 SbLiHitDiscCfm (Pst *pst, SuId suId, U8 choice, UConnId conId, Action action)
                                                                   ;
extern S16 EgLiHitBndReq (Pst *pst, SuId suId, SpId spId);

extern S16 EgLiHitUbndReq (Pst *pst, SpId spId, Reason reason);

extern S16 EgLiHitServOpenReq (Pst *pst, SpId spId, UConnId servConId, CmTptAddr *servTAddr, CmTptParam *tPar, CmIcmpFilter *icmpFilter, U8 srvcType)

                                                                       ;

extern S16 EgLiHitConCfm (Pst *pst, SpId spId, UConnId suConnId, UConnId spConnId, CmTptAddr *localAddr )
                                                                         ;

extern S16 EgLiHitUDatReq (Pst *pst, SpId spId, UConnId spConId, CmTptAddr *remAddr, CmTptAddr *srcAddr, CmIpHdrParm *hdrParm, CmTptParam *tPar, Buffer *mBuf)


                                                   ;
extern S16 EgLiHitDiscReq (Pst *pst, SpId spId, U8 choice, UConnId conId, Action action, CmTptParam *tPar)

                                                       ;

extern S16 EgLiHitBndCfm (Pst *pst, SuId suId, U8 status);
extern S16 EgLiHitUDatInd (Pst *pst, SuId suId, UConnId suConId, CmTptAddr *srcAddr, CmTptAddr *remAddr, CmIpHdrParm *ipHdrParm, Buffer *mBuf)


                                                   ;
extern S16 EgLiHitDiscInd (Pst *pst, SuId suId, U8 choice, UConnId conId, Reason reason)
                                                                   ;
extern S16 EgLiHitDiscCfm (Pst *pst, SuId suId, U8 choice, UConnId conId, Action action)
                                                                   ;
extern S16 cmPkHitBndReq (Pst *pst, SuId suId, SpId spId);
extern S16 cmPkHitUbndReq (Pst *pst, SpId spId, Reason reason);
extern S16 cmPkHitServOpenReq (Pst *pst, SpId spId, UConnId servConId, CmTptAddr *servTAddr, CmTptParam *tPar, CmIcmpFilter *icmpFilter, U8 srvcType)

                                                                            ;
extern S16 cmPkHitConReq (Pst *pst, SpId spId, UConnId suConId, CmTptAddr *remAddr, CmTptAddr *localAddr, CmTptParam *tPar, U8 srvcType)

                                                                    ;
extern S16 cmPkHitConRsp (Pst *pst, SpId spId, UConnId suConId, UConnId spConId)
                                                      ;
extern S16 cmPkHitDatReq (Pst *pst, SpId spId, UConnId spConId, Buffer *mBuf)
                                                   ;
extern S16 cmPkHitUDatReq (Pst *pst, SpId spId, UConnId spConId, CmTptAddr *remAddr, CmTptAddr *srcAddr, CmIpHdrParm *ipHdrParm, CmTptParam *tPar, Buffer *mBuf)


                                                   ;
extern S16 cmPkHitDiscReq (Pst *pst, SpId spId, U8 choice, UConnId conId, Action action, CmTptParam *tPar)

                                                       ;
extern S16 cmPkHitConInd (Pst *pst, SuId suId, UConnId servConId, UConnId spConId, CmTptAddr *peerAddr)
                                                                           ;
extern S16 cmPkHitConCfm (Pst *pst, SuId suId, UConnId suConId, UConnId spConId, CmTptAddr *localAddr)
                                                                            ;
extern S16 cmPkHitBndCfm (Pst *pst, SuId suId, U8 status);
extern S16 cmPkHitDatInd (Pst *pst, SuId suId, UConnId suConId, Buffer *mBuf)
                                                   ;






extern S16 cmPkHitUDatInd (Pst *pst, SuId suId, UConnId suConId, CmTptAddr *arcAddr, CmTptAddr *destAddr, CmIpHdrParm *ipHdrParm, Buffer *mBuf)


                                                   ;

extern S16 cmPkHitDiscInd (Pst *pst, SuId suId, U8 choice, UConnId conId, Reason reason)
                                                                   ;
extern S16 cmPkHitDiscCfm (Pst *pst, SuId suId, U8 choice, UConnId conId, Action action)
                                                                   ;
extern S16 cmPkHitFlcInd (Pst *pst, SuId suId, UConnId suConId, Reason reason)
                                                                     ;
extern S16 cmUnpkHitBndReq (HitBndReq func, Pst *pst, Buffer *mBuf);
extern S16 cmUnpkHitUbndReq (HitUbndReq func, Pst *pst, Buffer *mBuf);

extern S16 cmUnpkHitServOpenReq (HitServOpenReq func, Pst *pst, Buffer *mBuf)
                                                   ;
extern S16 cmUnpkHitConReq (HitConReq func, Pst *pst, Buffer *mBuf);
extern S16 cmUnpkHitConRsp (HitConRsp func, Pst *pst, Buffer *mBuf);
extern S16 cmUnpkHitDatReq (HitDatReq func, Pst *pst, Buffer *mBuf);




extern S16 cmUnpkHitUDatReq (HitUDatReq func, Pst *pst, Buffer *mBuf);

extern S16 cmUnpkHitDiscReq (HitDiscReq func, Pst *pst, Buffer *mBuf);
extern S16 cmUnpkHitConInd (HitConInd func, Pst *pst, Buffer *mBuf)
                                                   ;
extern S16 cmUnpkHitConCfm (HitConCfm func, Pst *pst, Buffer *mBuf)
                                                   ;
extern S16 cmUnpkHitBndCfm (HitBndCfm func, Pst *pst, Buffer *mBuf)
                                                   ;
extern S16 cmUnpkHitDatInd (HitDatInd func, Pst *pst, Buffer *mBuf)
                                                   ;




extern S16 cmUnpkHitUDatInd (HitUDatInd func, Pst *pst, Buffer *mBuf)
                                                   ;


extern S16 cmUnpkHitDiscInd (HitDiscInd func, Pst *pst, Buffer *mBuf)
                                                   ;
extern S16 cmUnpkHitDiscCfm (HitDiscCfm func, Pst *pst, Buffer *mBuf)
                                                   ;
extern S16 cmUnpkHitFlcInd (HitFlcInd func, Pst *pst, Buffer *mBuf)
                                                   ;

typedef struct hiRxSts
{
   StsCntr numCons;
   StsCntr numRxBytes;
   StsCntr numRxTcpMsg;
   StsCntr numRxUdpMsg;
   StsCntr numRxRawMsg;
   StsCntr numRxTlsMsg;




} HiRxSts;




typedef struct hiTxSts
{
   StsCntr numCons;
   StsCntr numTxBytes;
   StsCntr numTxTcpMsg;
   StsCntr numTxUdpMsg;
   StsCntr numTxRawMsg;
   StsCntr numTxTlsMsg;




} HiTxSts;




typedef struct hiErrSts
{
   StsCntr sockTxErr;
   StsCntr sockRxErr;
   StsCntr sockOpenErr;
   StsCntr sockBindErr;
   StsCntr sockCnctErr;
   StsCntr sockLstnErr;
   StsCntr sockSOptErr;
   StsCntr sockClosErr;
   StsCntr sockShutErr;
   StsCntr rxMsgVerErr;
   StsCntr numFlcInd;

} HiErrSts;
typedef struct hiPendOp
{
   Bool flag;
   Header hdr;
   U8 action;
   Elmnt elmnt;
   U16 numRem;
   Pst lmPst;

} HiPendOp;
typedef struct hiSap
{
   SpId spId;
   SuId suId;
   State state;




   Bool resCongStrt;
   Bool resCongDrop;

   UConnId lstSpConId;

   HiSapCfg cfg;
   HiTxSts txSts;
   Bool trc;
   S16 trcLen;

   Pst uiPst;
   CmHashListCp conCbHlCp;

   HiPendOp pendOp;
   Ent contEnt;






   CmTimer congTimers[1];
} HiSap;



typedef struct hiConCb
{
   CmHashListEnt conCbHlEnt;





   CmHashListEnt rdFdHlEnt;
   CmHashListEnt wrFdHlEnt;
   CmLList icmpLstEnt;

   HiSap *sap;
   UConnId suConId;
   UConnId spConId;

   State state;
   U8 srvcType;
   U32 flag;
   U8 protocol;
   Bool priority;
   U8 flc;
   U16 fdGrpNum;

   CmInetFd conFd;
   CmTptAddr peerAddr;
   CmTptAddr locTptAddr;

   Queue txQ;
   U32 txQSize;

   Bool awaitHdr;
   U32 rxLen;
   U32 pendLen;
   Buffer *rxBuf;
   Bool hdrIncldFlag;

   U8 ipParamMask;
   U8 ipTos;
   U8 ipTtl;
   U8 mCastTtl;

   U8 icmpType;
   U16 icmpMask;
   U8 filterProtocol;
   U8 numFilters;
   CmIcmpError *icmpError;
} HiConCb;
typedef struct hiThrMsg
{





   S16 type;
   SpId spId;
   UConnId spConId;
   union
   {
      Reason reason;
      Action action;

   } disc;
} HiThrMsg;




typedef struct hiFdGrp
{
   U16 fdGrpNum;
   Bool procIcmp;




   U32 numFds;
   U16 numWrFds;
   CmHashListCp rdFdHlCp;
   CmHashListCp wrFdHlCp;
   CmInetFdSet readFdSet;
   CmInetFdSet writeFdSet;
   CmInetFdSetInfo fdSetInfo;

   HiRxSts genRxSts;
   HiRxSts *rxSts;

   CmInetFd servFd;
   CmInetAddr servAddr;
} HiFdGrp;
typedef struct _hiCb
{





   TskInit init;
   HiSap **saps;

   HiGenCfg cfg;
   HiErrSts errSts;

   U16 numFdGrps;
   HiFdGrp **fdGrps;

   CmInetFd resvConFd;





   CmInetFd icmpConFd;
   U8 icmpUsers;
   CmLListCp icmpLstCp;
   HiPendOp pendOp;
   U16 lastGrp;
   CmTimer timers[1];






   CmTqCp tqCp;
   CmTqType tq[12];







} HiCb;
extern HiCb hiCb;







typedef S8 HiLocalInf;
extern S16 hiRecvTsk (Pst *pst, Buffer *mBuf);
extern S16 hiGetSid (SystemId *sid);







extern S16 hiActvTmr (Void);


extern S16 hiTmrEvnt (U32 cb, S16 evnt);
extern S16 hiScanPermTsk (Pst *tPst, Buffer *mBuf);



extern Void hiSendLmCfm (Pst *pst, U8 cfmType, Header *hdr, U16 status, U16 reason, HiMngmt *cfm)

                                                                ;
extern Void hiSendAlarm (U16 cgy, U16 evnt, U16 cause, HiAlarmInfo *info)
                                                         ;
extern S16 hiCfgGen (HiGenCfg *hiGen);
extern S16 hiCfgSap (HiSapCfg *cfg);



extern S16 hiShutdown (Void);
extern S16 hiCntrlGen (Pst *pst, HiMngmt *cntrl, Header *hdr);
extern S16 hiCntrlSap (Pst *pst, HiMngmt *cntrl, Header *hdr);
extern S16 hiCntrlSapGrp (Pst *pst, HiMngmt *cntrl, Header *hdr);
extern S16 hiGetGenSts (HiGenSts *genSts);
extern S16 hiZeroGenSts (Void);
extern S16 hiGetSapSts (HiSapSts *sapSts, HiSap *sap);
extern S16 hiZeroSapSts (HiSap *sap);
extern Void hiTrcBuf (HiSap *sap, U16 evnt, Buffer *mBuf);
extern S16 hiAllocConCb (HiSap *sap, UConnId suConId, U8 srvcType, U8 *type, HiConCb **conCb)

                                                       ;
extern S16 hiCompleteConCb (HiConCb *conCb);
extern S16 hiAssignConCb (HiConCb *conCb, U8 type);
extern S16 hiFindConCb (HiSap *sap, UConnId spConId, HiConCb **conCb)
                                                       ;
extern S16 hiFindConCbSuConId (HiSap *sap, UConnId suConId, HiConCb **conCb)
                                                       ;
extern Void hiDoneWithConCb (HiConCb *conCb);
extern S16 hiEnqueueForTx (HiConCb *conCb, Buffer *mBuf);



extern Void hiProcThrDelCon (HiFdGrp *fdGrp, HiThrMsg *tMsg, CmInetFdSet *selRdFdSet, CmInetFdSet *selWrFdSet, S16 *setFds)

                                                                            ;
extern S16 hiSendThrMsg (U16 fdGrpNum, HiThrMsg *tMsg);
extern S16 hiProcThrMsg (HiFdGrp *fdGrp, CmInetFdSet *selRdFdSet, CmInetFdSet *selWrFdSet, S16 *setFds)
                                                                            ;



extern S16 hiChkRes (HiSap *sap);
extern Void hiChkFlc (HiConCb *conCb, U32 posLen, U32 negLen);



extern S16 hiCreateSock (Bool server, U8 type, CmTptAddr *tptAddr, CmTptParam *tPar, HiConCb *conCb)

                                                      ;
extern S16 hiSetSockOpt (HiConCb *conCb, CmTptParam *tPar);
extern S16 hiTxMsg (HiConCb *conCb, Buffer *mBuf, MsgLen *txLen, Buffer **qBuf, HiThrMsg *tMsg)

                                                      ;



extern S16 hiProcessIcmpReq (HiConCb *conCb, CmIcmpFilter *icmpFilter)
                                                                ;
extern S16 hiAddTPKTHdr (Buffer *mBuf, MsgLen *newLen);
extern S16 hiProcHdrParm (HiConCb *conCb, CmTptAddr *srcAddr, CmTptAddr *remAddr, CmIpHdrParm *hdrParm, Buffer *mBuf, MsgLen mLen)


                                                                 ;











typedef pthread_mutex_t MUTEX_TYPE;

struct CRYPTO_dynlock_value
{
   MUTEX_TYPE mutex;
};
 S16 hiCreateSock
(
Bool server,
U8 type,
CmTptAddr *tptAddr,
CmTptParam *tPar,
HiConCb *conCb
)
{
   S16 ret;
   HiSap *sap;
   CmInetFd fd;


   ;;


   sap = conCb->sap;


   ret = cmInetSocket(type, &fd, conCb->protocol);
                                                                   ;
   if (ret != 0)
   {
      ;
      hiCb.errSts.sockOpenErr++;;
      return(1);
   }


   { U32 _optVal = 1; if (cmInetSetOpt(&fd, 
  1
  , 1, (Ptr)&_optVal) != 0) hiCb.errSts.sockSOptErr++;; };


   if ((tptAddr && tptAddr->type == 4))
   {
      ret = cmInetBind(&fd, &(tptAddr)->u.ipv4TptAddr);;
      if (ret != 0)
      {
         cmInetClose(&fd);;
         ;
         hiCb.errSts.sockBindErr++;;
         return(3);
      }
   }


   if (type == 
              SOCK_STREAM
                            )
      { U32 _optVal = 1; if(cmInetSetOpt(&fd, 
     IPPROTO_TCP
     , 6, (Ptr)&_optVal) != 0) hiCb.errSts.sockSOptErr++;; };


   cmMemcpy((U8 *)&conCb->conFd, (U8 *)&fd, sizeof (CmInetFd));



   if (tPar && (tPar->type != 0 ))
   {
      ret = hiSetSockOpt(conCb, tPar);
      if (ret != 0)
      {
         cmInetClose(&conCb->conFd);;
         { if ((&(hiCb.init))->dbgMask & (0x00000100)) { snprintf((&(hiCb.init))->prntBuf, 255, "[%s %d:0x%x:%x] %s:%d ", "TCP_UDP_CONVERGENCE_LAYER", (&(hiCb.init))->procId, (&(hiCb.init))->ent, (&(hiCb.init))->inst,
                                                 "/home/mrehwald/Desktop/Radisys/lte_enb/src/tucl/hi_bdy3.c"
         ,
                                                 194
         ); SPrint((&(hiCb.init))->prntBuf); sprintf (hiCb.init.prntBuf, "Could not set socket options\n"); SPrint((&(hiCb.init))->prntBuf); } }
                                                  ;
         return(2);
      }
   }


   conCb->locTptAddr.type = 4;







   ret = cmInetGetSockName(&conCb->conFd, &(&conCb->locTptAddr)->u.ipv4TptAddr);;
   if (ret != 0)
   {
      cmInetClose(&conCb->conFd);;
      ;
      return(8);
   }


   return(0);
}
 S16 hiSetSockOpt
(
HiConCb *conCb,
CmTptParam *tPar
)





{
   S16 i, ret;
   U8 numOpts;
   CmSockOpts *sockOpts, *opt;
   Ptr value;
   CmInetMCastInf mCastInf;
   CmInetIpAddr lclAddr;


   ;;


   sockOpts = 0L;


   numOpts = 0;
   if (tPar->type == 1)
   {
      numOpts = tPar->u.sockParam.numOpts;
      sockOpts = tPar->u.sockParam.sockOpts;
   }


   for (i = 0; i < (S16)numOpts; i++)
   {
      opt = &sockOpts[i];


      if (opt->option == 4
            || opt->option == 5)
      {
         mCastInf.mCastAddr = opt->optVal.mCastInfo.mCastAddr.u.ipv4NetAddr;
         mCastInf.localAddr = opt->optVal.mCastInfo.localAddr.u.ipv4NetAddr;
         value = (Ptr)&mCastInf;
      }


      else if (opt->option == 9)
      {
         lclAddr = opt->optVal.lclAddr.u.ipv4NetAddr;
         value = (Ptr)&lclAddr;
      }
      else
         value = (Ptr)&opt->optVal.value;


      ret = cmInetSetOpt(&conCb->conFd, opt->level, opt->option, value);
      if (ret == 3)
         conCb->hdrIncldFlag |= 0x0002;
      else if (ret != 0)
      {
         hiCb.errSts.sockSOptErr++;;
         return(1);
      }
   }




   if (!(conCb->hdrIncldFlag & 0x0002))
   {
      for (i = 0; i < (S16)numOpts; i++)
      {
         if (sockOpts[i].option == 10)
         {
            conCb->hdrIncldFlag |= 0x0001;
            break;
         }
      }
   }

   return(0);
}
 S16 hiProcessIcmpReq
(
HiConCb *conCb,
CmIcmpFilter *icmpFilter
)





{
   U16 num;
   CmIcmpv4Filter *icmpv4Filter;





   ;;


   conCb->numFilters = 0;
   conCb->icmpError = 0L;



   if (icmpFilter->type == 4)
   {
      conCb->icmpType = 4;
      icmpv4Filter = (CmIcmpv4Filter *)&icmpFilter->u.icmpv4Filter;
      if (icmpv4Filter->allMsg)
      {
         if (icmpv4Filter->protocol == 
                                      IPPROTO_RAW
                                                     )
            conCb->icmpMask |= 0x1;
         else
         {
            conCb->filterProtocol = icmpv4Filter->protocol;
            conCb->icmpMask |= 0x2;
         }
      }
      else
      {
         if (icmpv4Filter->protocol == 
                                      IPPROTO_RAW
                                                     )
            conCb->icmpMask |= 0x4;
         else
         {
            conCb->filterProtocol = icmpv4Filter->protocol;
            conCb->icmpMask |= 0x8;
         }

         num = conCb->numFilters = icmpv4Filter->num;
         { S16 _ret; _ret = SGetSBuf(hiCb.init.region, hiCb.init.pool, (Data **)&conCb->icmpError, num * sizeof (CmIcmpError)); if (_ret == 0) cmMemset((U8*)conCb->icmpError, 0, num * sizeof (CmIcmpError)); else conCb->icmpError = 0L; };
         if (!conCb->icmpError)
            return(1);
         cmMemcpy((U8 *)conCb->icmpError, (U8 *)icmpv4Filter->icmpError,
                  num * sizeof (CmIcmpError));
      }
   }
   return(0);
}
 S16 hiAddTPKTHdr
(
Buffer *mBuf,
MsgLen *newLen
)





{
   S16 ret;
   U16 nLen;
   U8 hdr[4];


   ;;



   nLen = (U16)(*newLen) + 4;
   hdr[0] = ((U16)(nLen) & 0xff);
   hdr[1] = (((U16)(nLen) >> 8) & 0xff);
   hdr[2] = 0x00;
   hdr[3] = 0x03;



   ret = SAddPreMsgMult(hdr, 4, mBuf);


   return(ret);
}
static S16 hiPkIpv4Hdr
(
CmIpv4Hdr *ipv4Hdr,
Buffer *mBuf
)





{
   S16 ret, cnt, idx;
   Data revPkArray[20];
   Data pkArray[20];



   cnt = 0;
   cmMemset(revPkArray, 0, 20);
   cmMemset(pkArray, 0, 20);



   pkArray[cnt++] = ipv4Hdr->hdrVer;


   pkArray[cnt++] = ipv4Hdr->tos;







   pkArray[cnt++] = (Data)(((U16)(ipv4Hdr->length) >> 8) & 0xff);
   pkArray[cnt++] = (Data)((U16)(ipv4Hdr->length) & 0xff);






   pkArray[cnt++] = (Data) (((U16)(ipv4Hdr->id) >> 8) & 0xff);
   pkArray[cnt++] = (Data) ((U16)(ipv4Hdr->id) & 0xff);



   pkArray[cnt++] = (Data)(((U16)(ipv4Hdr->off) >> 8) & 0xff);
   pkArray[cnt++] = (Data)((U16)(ipv4Hdr->off) & 0xff);






   pkArray[cnt++] = ipv4Hdr->ttl;


   pkArray[cnt++] = ipv4Hdr->proto;


   pkArray[cnt++] = (Data)(((U16)(ipv4Hdr->chkSum) >> 8) & 0xff);
   pkArray[cnt++] = (Data)((U16)(ipv4Hdr->chkSum) & 0xff);


   pkArray[cnt++] = (Data)(((U16)((((U32)(ipv4Hdr->srcAddr) >> 16) & 0xffffL)) >> 8) & 0xff);
   pkArray[cnt++] = (Data)((U16)((((U32)(ipv4Hdr->srcAddr) >> 16) & 0xffffL)) & 0xff);
   pkArray[cnt++] = (Data)(((U16)(((U32)(ipv4Hdr->srcAddr) & 0xffffL)) >> 8) & 0xff);
   pkArray[cnt++] = (Data)((U16)(((U32)(ipv4Hdr->srcAddr) & 0xffffL)) & 0xff);


   pkArray[cnt++] = (Data)(((U16)((((U32)(ipv4Hdr->destAddr) >> 16) & 0xffffL)) >> 8) & 0xff);
   pkArray[cnt++] = (Data)((U16)((((U32)(ipv4Hdr->destAddr) >> 16) & 0xffffL)) & 0xff);
   pkArray[cnt++] = (Data)(((U16)(((U32)(ipv4Hdr->destAddr) & 0xffffL)) >> 8) & 0xff);
   pkArray[cnt++] = (Data)((U16)(((U32)(ipv4Hdr->destAddr) & 0xffffL)) & 0xff);

   for (idx = 0; idx < 20; idx++)
      revPkArray[idx] = pkArray[20 - idx -1];


   ret = SAddPreMsgMult(revPkArray, (MsgLen)cnt, mBuf);


   return(ret);
}
static S16 hiUnpkIpv4Hdr
(
Buffer *mBuf,
CmIpv4Hdr *ipv4Hdr,
CmIpHdrParm *hdrParm
)






{
   S16 ret, temp;
   U8 cnt;




   Data unPkArray[20];




   cnt = 0;
   temp = 0;





   cmMemset(unPkArray, 0, 20);




   ret = SRemPreMsgMult((Data *)unPkArray, 20, mBuf);
   ipv4Hdr->hdrVer = unPkArray[cnt++];


   ipv4Hdr->tos = unPkArray[cnt++];


   ipv4Hdr->length = (U16) (((U16)(unPkArray[cnt++]) << 8) | ((U16)(ipv4Hdr->length) & 0x00ff));
   ipv4Hdr->length = (U16) (((U16)(unPkArray[cnt++]) & 0xff) | ((U16)(ipv4Hdr->length) & 0xff00));


   ipv4Hdr->id = (U16) (((U16)(unPkArray[cnt++]) << 8) | ((U16)(ipv4Hdr->id) & 0x00ff));
   ipv4Hdr->id = (U16) (((U16)(unPkArray[cnt++]) & 0xff) | ((U16)(ipv4Hdr->id) & 0xff00));


   ipv4Hdr->off = (U16) (((U16)(unPkArray[cnt++]) << 8) | ((U16)(ipv4Hdr->off) & 0x00ff));
   ipv4Hdr->off = (U16) (((U16)(unPkArray[cnt++]) & 0xff) | ((U16)(ipv4Hdr->off) & 0xff00));


   ipv4Hdr->ttl = unPkArray[cnt++];


   ipv4Hdr->proto= unPkArray[cnt++];


   ipv4Hdr->chkSum = (U16) (((U16)(unPkArray[cnt++]) << 8) | ((U16)(ipv4Hdr->chkSum) & 0x00ff));
   ipv4Hdr->chkSum = (U16) (((U16)(unPkArray[cnt++]) & 0xff) | ((U16)(ipv4Hdr->chkSum) & 0xff00));


   temp = (U16) (((U16)(unPkArray[cnt++]) << 8) | ((U16)(temp) & 0x00ff));
   temp = (U16) (((U16)(unPkArray[cnt++]) & 0xff) | ((U16)(temp) & 0xff00));
   ipv4Hdr->srcAddr = (U32) (((U32)(temp) << 16) | ((U32)(ipv4Hdr->srcAddr) & (U32)0x0000ffff));

   temp = (U16) (((U16)(unPkArray[cnt++]) << 8) | ((U16)(temp) & 0x00ff));
   temp = (U16) (((U16)(unPkArray[cnt++]) & 0xff) | ((U16)(temp) & 0xff00));
   ipv4Hdr->srcAddr = (U32) (((U32)(temp) & 0xffff) | ((U32)(ipv4Hdr->srcAddr) & (U32)0xffff0000));


   temp = (U16) (((U16)(unPkArray[cnt++]) << 8) | ((U16)(temp) & 0x00ff));
   temp = (U16) (((U16)(unPkArray[cnt++]) & 0xff) | ((U16)(temp) & 0xff00));
   ipv4Hdr->destAddr = (U32) (((U32)(temp) << 16) | ((U32)(ipv4Hdr->destAddr) & (U32)0x0000ffff));

   temp = (U16) (((U16)(unPkArray[cnt++]) << 8) | ((U16)(temp) & 0x00ff));
   temp = (U16) (((U16)(unPkArray[cnt++]) & 0xff) | ((U16)(temp) & 0xff00));
   ipv4Hdr->destAddr = (U32) (((U32)(temp) & 0xffff) | ((U32)(ipv4Hdr->destAddr) & (U32)0xffff0000));
   return(ret);
}
 S16 hiProcHdrParm
(
HiConCb *conCb,
CmTptAddr *srcAddr,
CmTptAddr *remAddr,
CmIpHdrParm *hdrParm,
Buffer *mBuf,
MsgLen mLen
)
{
   S16 ret;
   U8 c;
   CmIpv4Hdr ipv4Hdr;
   CmTptParam lclTPar;






   ;;



   if (hdrParm->type == 4)
   {

      if (conCb->hdrIncldFlag & 0x0001)
      {
         cmMemset((U8 *)&ipv4Hdr, 0, sizeof (CmIpv4Hdr));;
         ipv4Hdr.length = 20 + mLen;
         ipv4Hdr.hdrVer = 0x45;
         if (hdrParm->u.hdrParmIpv4.proto.pres)
            ipv4Hdr.proto = hdrParm->u.hdrParmIpv4.proto.val;
         else
            ipv4Hdr.proto = conCb->protocol;

         if (hdrParm->u.hdrParmIpv4.dfBit.pres)
            ipv4Hdr.off |= 0x4000;

         if (hdrParm->u.hdrParmIpv4.tos.pres)
            ipv4Hdr.tos = hdrParm->u.hdrParmIpv4.tos.val;

         if (hdrParm->u.hdrParmIpv4.ttl.pres)
            ipv4Hdr.ttl = hdrParm->u.hdrParmIpv4.ttl.val;

         if (srcAddr->type == 4)
            ipv4Hdr.srcAddr = srcAddr->u.ipv4TptAddr.address;

         ipv4Hdr.destAddr = remAddr->u.ipv4TptAddr.address;



         ret = hiPkIpv4Hdr(&ipv4Hdr, mBuf);
         if (ret != 0)
         {
           
                                            ;
            return(ret);
         }
      }



      else
      {

         if (conCb->hdrIncldFlag & 0x0002)
         {
            lclTPar.type = 1;
            lclTPar.u.sockParam.numOpts = c = 0;

            if (hdrParm->u.hdrParmIpv4.dfBit.pres)
            {
               if (!(conCb->ipParamMask & 0x0001))
               {
                  lclTPar.u.sockParam.sockOpts[c].option
                     = 11;
                  lclTPar.u.sockParam.sockOpts[c].level
                     = 
                      IPPROTO_IP
                                         ;
                  lclTPar.u.sockParam.sockOpts[c].optVal.value
                     = 1;
                  c++;
                  conCb->ipParamMask |= 0x0001;
               }
            }
            else
            {
               if (conCb->ipParamMask & 0x0001)
               {
                  lclTPar.u.sockParam.sockOpts[c].option
                     = 11;
                  lclTPar.u.sockParam.sockOpts[c].level
                     = 
                      IPPROTO_IP
                                         ;
                  lclTPar.u.sockParam.sockOpts[c].optVal.value
                     = 0;
                  c++;
                  conCb->ipParamMask &= ~0x0001;
               }
            }

            if (hdrParm->u.hdrParmIpv4.tos.pres)
            {
               if (conCb->ipTos != hdrParm->u.hdrParmIpv4.tos.val)
               {
                  lclTPar.u.sockParam.sockOpts[c].option
                     = 12;
                  lclTPar.u.sockParam.sockOpts[c].level
                     = 
                      IPPROTO_IP
                                         ;
                  lclTPar.u.sockParam.sockOpts[c].optVal.value
                     = hdrParm->u.hdrParmIpv4.tos.val;
                  c++;
                  conCb->ipTos = hdrParm->u.hdrParmIpv4.tos.val;
               }
            }

            if (hdrParm->u.hdrParmIpv4.ttl.pres)
            {
               if (conCb->ipTtl != hdrParm->u.hdrParmIpv4.ttl.val)
               {
                  lclTPar.u.sockParam.sockOpts[c].option
                     = 13;
                  lclTPar.u.sockParam.sockOpts[c].level
                     = 
                      IPPROTO_IP
                                         ;
                  lclTPar.u.sockParam.sockOpts[c].optVal.value
                     = hdrParm->u.hdrParmIpv4.ttl.val;
                  c++;
                  conCb->ipTtl=hdrParm->u.hdrParmIpv4.ttl.val;
               }
            }

            if ((lclTPar.u.sockParam.numOpts = c) > 0)
            {
               ret = hiSetSockOpt(conCb, &lclTPar);
               if (ret != 0)
                  return(ret);
            }
         }
      }
   }
   return(0);
}
static S16 hiProcRxHdr
(
HiConCb *conCb,
Buffer *mBuf
)





{
   U16 i, l1, l2;
   U8 arr[100];
   HiHdrInfo *hdr;
   HiAlarmInfo alInfo;
   MsgLen mLen;
   U8 tcpHdrIdx;


   ;;


   l1 = l2 = 0;


   mLen = 0;

   if (SFndLenMsg(mBuf, &mLen) != 0)
   {
      hiCb.errSts.rxMsgVerErr++;;
      alInfo.spId = conCb->sap->spId;
      alInfo.type = 0;
      hiSendAlarm(1, 3,
                  6, &alInfo);
      { SPutMsg(mBuf); };

      return(1);
   }



   if (conCb->srvcType == 2
       || conCb->srvcType == 5)
   {

      if (mLen < 4)
      {
         conCb->awaitHdr = 1;
         conCb->pendLen = 0;

         return(0);
      }
      conCb->awaitHdr = 0;


      SRemPreMsgMult(arr, 4, mBuf);
      if (arr[0] != 0x03)
      {
         hiCb.errSts.rxMsgVerErr++;;
         { SPutMsg(mBuf); };
         alInfo.spId = conCb->sap->spId;
         alInfo.type = 0;
         hiSendAlarm(1, 3,
                     6, &alInfo);

         return(1);
      }


      l1 = (U16) (((U16)(arr[2]) << 8) | ((U16)(l1) & 0x00ff));
      l1 = (U16) (((U16)(arr[3]) & 0xff) | ((U16)(l1) & 0xff00));


      conCb->pendLen = l1 - 4;
      conCb->rxLen -= 4;
   }



   else
   {

      tcpHdrIdx = (conCb->srvcType >> 4) - 1;
      if(tcpHdrIdx >= 5)
      {
         { SPutMsg(mBuf); };
         alInfo.type = 3;
         alInfo.inf.mem.region = conCb->sap->uiPst.region;
         alInfo.inf.mem.pool = conCb->sap->uiPst.pool;
         hiSendAlarm(1, 3,
               6, &alInfo);
         return(1);
      }
      hdr = &conCb->sap->cfg.hdrInf[tcpHdrIdx];

      if ((U32)mLen < hdr->hdrLen)
      {
         conCb->awaitHdr = 1;
         conCb->pendLen = 0;

         return(0);
      }
      conCb->awaitHdr = 0;


      SRemPreMsgMult(arr, (S16)hdr->hdrLen, mBuf);


      if (hdr->lenLen == 1)
      {
         l2 = arr[hdr->offLen];
         conCb->pendLen = l2;
      }
      else if (hdr->lenLen == 2)
      {
         l1 = (U16) (((U16)(arr[hdr->offLen]) << 8) | ((U16)(l1) & 0x00ff));
         l1 = (U16) (((U16)(arr[hdr->offLen+1]) & 0xff) | ((U16)(l1) & 0xff00));
         conCb->pendLen = l1;
      }
      else
      {
         l1 = (U16) (((U16)(arr[hdr->offLen]) << 8) | ((U16)(l1) & 0x00ff));
         l1 = (U16) (((U16)(arr[hdr->offLen + 1]) & 0xff) | ((U16)(l1) & 0xff00));

         l2 =(U16)(U32) (((U32)(l1) << 16) | ((U32)(l2) & (U32)0x0000ffff));
         l1 = (U16) (((U16)(arr[hdr->offLen + 2]) << 8) | ((U16)(l1) & 0x00ff));
         l1 = (U16) (((U16)(arr[hdr->offLen + 3]) & 0xff) | ((U16)(l1) & 0xff00));
         l2 = (U16)(U32) (((U32)(l1) & 0xffff) | ((U32)(l2) & (U32)0xffff0000));

         if (hdr->lenLen == 3)
            l2 >>= 8;

         conCb->pendLen = l2;
      }

      if (!(hdr->flag & 0x1))
         conCb->pendLen += hdr->hdrLen;



      for (i = (U16)hdr->hdrLen; i > 0; i--)
      {
         if (SAddPreMsg(arr[i-1], mBuf) != 0)
         {
            { SPutMsg(mBuf); };
            alInfo.type = 3;
            alInfo.inf.mem.region = conCb->sap->uiPst.region;
            alInfo.inf.mem.pool = conCb->sap->uiPst.pool;
            hiSendAlarm(1, 3,
                        6, &alInfo);
            return(1);
         }
      }
   }


   return(0);
}
static S16 hiHndlTcpData
(
HiConCb *conCb,
Buffer *mBuf,
U32 mLen
)






{
   S16 ret;

   Buffer *tBuf = 0L;
   MsgLen tLen;
   Queue rxQ;
   QLen qLen;
   HiAlarmInfo alInfo;


   ;;



   ret = SInitQueue(&rxQ);
   if (ret != 0)
   {
      { SPutMsg(mBuf); };
      return(1);
   }


   if (conCb->rxBuf != 0L)
   {
      ret = SCatMsg(mBuf, conCb->rxBuf, 1);
      if (ret != 0)
      {
         { SPutMsg(mBuf); };
         alInfo.type = 3;
         alInfo.inf.mem.region = conCb->sap->uiPst.region;
         alInfo.inf.mem.pool = conCb->sap->uiPst.pool;
         hiSendAlarm(4, 13,
                     0, &alInfo);
         return(1);
      }

      { SPutMsg(conCb->rxBuf); };
      conCb->rxBuf = 0L;
   }


   else
      conCb->awaitHdr = 1;



   tLen = mLen;
   for (; ;)
   {

      conCb->rxLen += tLen;


      if (conCb->awaitHdr)
      {
         if (hiProcRxHdr(conCb, mBuf) != 0)
         {
            ret = 1;
            break;
         }
      }




      if (conCb->awaitHdr || conCb->pendLen > conCb->rxLen)
      {
         conCb->rxBuf = mBuf;
         break;
      }


      if (conCb->pendLen == conCb->rxLen)
      {
         conCb->rxLen = conCb->pendLen = 0;


         SQueueLast(mBuf, &rxQ);
         break;
      }


      else if (conCb->rxLen > conCb->pendLen)
      {


         { if ((&(hiCb.init))->dbgMask & (0x00000001)) { snprintf((&(hiCb.init))->prntBuf, 255, "[%s %d:0x%x:%x] %s:%d ", "TCP_UDP_CONVERGENCE_LAYER", (&(hiCb.init))->procId, (&(hiCb.init))->ent, (&(hiCb.init))->inst,

                                                     "/home/mrehwald/Desktop/Radisys/lte_enb/src/tucl/hi_bdy3.c"
         ,

                                                     1679
         ); SPrint((&(hiCb.init))->prntBuf); sprintf (hiCb.init.prntBuf, "SSegMsg(mBuf1(%p), idx(%ld), mBuf2(%p))\n", (Ptr)mBuf, conCb->pendLen, (Ptr)tBuf); SPrint((&(hiCb.init))->prntBuf); } }

                                                      ;







         ret = SSegMsg(mBuf, (U16)conCb->pendLen, &tBuf);
         if (ret != 0)
         {
            { SPutMsg(mBuf); };
            alInfo.inf.mem.region = conCb->sap->uiPst.region;
            alInfo.inf.mem.pool = conCb->sap->uiPst.pool;
            hiSendAlarm(4, 13,
                        0, &alInfo);
            ret = 4;
            break;
         }


         SQueueLast(mBuf, &rxQ);



         tLen = (S16)(conCb->rxLen - conCb->pendLen);


         conCb->rxLen = conCb->pendLen = 0;
         conCb->awaitHdr = 1;
         mBuf = tBuf;


         if (!tLen)
            break;
      }
   }


   qLen = 0;

   SFndLenQueue(&rxQ, &qLen);
   while (qLen)
   {
      qLen--;
      SDequeueFirst(&tBuf, &rxQ);
      { HiUiHitDatInd(&conCb->sap->uiPst, conCb->sap->suId, conCb->suConId, tBuf); };
   }


   return(0);
}
static Void hiHndlUdpData
(
HiConCb *conCb,
Buffer *mBuf,
MsgLen mLen,
CmTptAddr *srcAddr,
CmTptAddr *destAddr,
CmIpHdrParm *hdrParm,
HiLocalInf *lif
)
{
   S16 ret;
   Queue rxQ;
   QLen qLen;

   Buffer *tBuf = 0L;
   HiAlarmInfo alInfo;


   ;;



   ret = SInitQueue(&rxQ);
   if (ret != 0)
   {
      { SPutMsg(mBuf); };
      return;
   }



   for (; ;)
   {
      conCb->rxLen = mLen;


      if (hiProcRxHdr(conCb, mBuf) != 0)
         break;


      if (conCb->pendLen == conCb->rxLen)
      {
         conCb->pendLen = conCb->rxLen = 0;
         SQueueLast(mBuf, &rxQ);
         break;
      }




      else if (conCb->awaitHdr || conCb->pendLen > conCb->rxLen)
      {
         { SPutMsg(mBuf); };
         alInfo.spId = conCb->sap->spId;
         alInfo.type = 0;
         hiSendAlarm(1, 3,
                     6, &alInfo);
         break;
      }


      else
      {


         { if ((&(hiCb.init))->dbgMask & (0x00000001)) { snprintf((&(hiCb.init))->prntBuf, 255, "[%s %d:0x%x:%x] %s:%d ", "TCP_UDP_CONVERGENCE_LAYER", (&(hiCb.init))->procId, (&(hiCb.init))->ent, (&(hiCb.init))->inst,

                                                      "/home/mrehwald/Desktop/Radisys/lte_enb/src/tucl/hi_bdy3.c"
         ,

                                                      1830
         ); SPrint((&(hiCb.init))->prntBuf); sprintf (hiCb.init.prntBuf, "SSegMsg(mBuf1(%p), idx(%ld), mBuf2(%p))\n", (Ptr)mBuf, conCb->pendLen, (Ptr)tBuf); SPrint((&(hiCb.init))->prntBuf); } }

                                                       ;







         ret = SSegMsg(mBuf, (U16)conCb->pendLen, &tBuf);
         if(ret !=0)
         {
            { SPutMsg(mBuf); };
            alInfo.spId = conCb->sap->spId;
            alInfo.type = 3;
            alInfo.inf.mem.region = conCb->sap->uiPst.region;
            alInfo.inf.mem.pool = conCb->sap->uiPst.pool;
            hiSendAlarm(4, 13,
                        0, &alInfo);
            break;
         }


         SQueueLast(mBuf, &rxQ);


         mLen -= conCb->pendLen;


         conCb->pendLen = 0;
         mBuf = tBuf;


         if (!mLen)
            break;
      }
   }


   qLen = 0;


   SFndLenQueue(&rxQ, &qLen);
   while (qLen)
   {
      qLen--;
      SDequeueFirst(&tBuf, &rxQ);





      { HiUiHitUDatInd(&conCb->sap->uiPst, conCb->sap->suId, conCb->suConId, srcAddr, destAddr, hdrParm, tBuf); };
   }


   return;
}
static S16 hiHndlRawMsg
(
HiConCb *conCb,
Buffer *mBuf,
U32 mLen,
HiLocalInf *lif
)







{
   S16 ret;
   CmIpv4Hdr ipHdr;
   CmIpHdrParm hdrParm;
   CmTptAddr srcAddr, destAddr;


   ;;


   (mLen=mLen);


   cmMemset((U8 *)&ipHdr, 0, sizeof (CmIpv4Hdr));;
   cmMemset((U8 *)&hdrParm, 0, sizeof (CmIpHdrParm));;



   ret = hiUnpkIpv4Hdr(mBuf, &ipHdr, &hdrParm);
   hdrParm.type = 4;

   hdrParm.u.hdrParmIpv4.proto.pres = 1;
   hdrParm.u.hdrParmIpv4.proto.val = ipHdr.proto;

   if (ipHdr.off & 0x4000)
   {
      hdrParm.u.hdrParmIpv4.dfBit.pres = 1;
      hdrParm.u.hdrParmIpv4.dfBit.val = 1;
   }
   else
      hdrParm.u.hdrParmIpv4.dfBit.pres = 0;

   hdrParm.u.hdrParmIpv4.tos.pres = 1;
   hdrParm.u.hdrParmIpv4.tos.val = ipHdr.tos;

   hdrParm.u.hdrParmIpv4.ttl.pres = 1;
   hdrParm.u.hdrParmIpv4.ttl.val = ipHdr.ttl;

   srcAddr.type = destAddr.type = 4;


   srcAddr.u.ipv4TptAddr.port = destAddr.u.ipv4TptAddr.port = 0;

   srcAddr.u.ipv4TptAddr.address = ipHdr.srcAddr;
   destAddr.u.ipv4TptAddr.address = ipHdr.destAddr;

   { HiUiHitUDatInd(&conCb->sap->uiPst, conCb->sap->suId, conCb->suConId, &srcAddr, &destAddr, &hdrParm, mBuf); };


   return(0);
}
static Void hiRecvIcmpMsg
(
Void
)
{
   S16 ret;
   U16 idx;
   Buffer *mBuf;

   Buffer *tBuf = 0L;
   MsgLen mLen, count;
   HiConCb *conCb;
   HiAlarmInfo alInfo;
   CmLList *l;
   CmTptAddr srcAddr, destAddr;
   CmIpHdrParm hdrParm;
   CmIpv4Hdr ipv4Hdr;
   CmIcmpv4Hdr icmpHdr;
   U8 msgType, msgCode, protocol;
   Bool sendflag;
   HiThrMsg tMsg;
   HiLocalInf *lif;
   lif = 0L;




   ;;



   alInfo.spId = -1;
   alInfo.type = 0;
   cmMemset((U8 *)&hdrParm, 0, sizeof (CmIpHdrParm));;
   if (hiCb.icmpUsers == 0)



   {



      return;
   }



   mLen = -1;


   { CmInetMemInfo memInfo; memInfo.region = hiCb.init.region; memInfo.pool = hiCb.init.pool; ret = cmInetRecvMsg(&hiCb.icmpConFd, &(&srcAddr)->u.ipv4TptAddr, &memInfo, &mBuf, &mLen, 0);; };







   if (ret != 0)
   {
      hiCb.errSts.sockRxErr++;;
      tMsg.type = 0x4;
      if (ret == 4)
      {
         alInfo.type = 3;
         alInfo.inf.mem.region = hiCb.init.region;
         alInfo.inf.mem.pool = hiCb.init.pool;
         hiSendAlarm(4, 13,
                     (256 + 2), &alInfo);
         tMsg.disc.reason = 15;
      }
      else
      {
         hiSendAlarm(3, (256 + 1),
                     (256 + 2), &alInfo);
         tMsg.disc.reason = 20;
      }



      for (conCb = (HiConCb *)((((l) = ((&hiCb.icmpLstCp)->crnt = (&hiCb.icmpLstCp)->first)) != 0L) ? (l)->node : 0L);
            conCb;
            conCb = (HiConCb *)((((l) = ((&hiCb.icmpLstCp)->crnt = ((&hiCb.icmpLstCp)->crnt ? (&hiCb.icmpLstCp)->crnt->next : (&hiCb.icmpLstCp)->first)))!= 0L) ? (l)->node : 0L))






      {
         tMsg.spId = conCb->sap->spId;
         tMsg.spConId = conCb->spConId;
         hiSendThrMsg(conCb->fdGrpNum, &tMsg);
      }





      return;
   }



   hiCb.fdGrps[0]->genRxSts.numRxBytes += mLen;


   cmMemset((U8*)&ipv4Hdr, 0, sizeof(CmIpv4Hdr));

   if (0L != mBuf)
   {
      ret = hiUnpkIpv4Hdr(mBuf, &ipv4Hdr, &hdrParm);
   }
   else
   {
      { if ((&(hiCb.init))->dbgMask & (0x00000100)) { snprintf((&(hiCb.init))->prntBuf, 255, "[%s %d:0x%x:%x] %s:%d ", "TCP_UDP_CONVERGENCE_LAYER", (&(hiCb.init))->procId, (&(hiCb.init))->ent, (&(hiCb.init))->inst,
                                           "/home/mrehwald/Desktop/Radisys/lte_enb/src/tucl/hi_bdy3.c"
      ,
                                           2202
      ); SPrint((&(hiCb.init))->prntBuf); sprintf (hiCb.init.prntBuf, "hiRecvIcmpMsg(): mBuf is NULL\n"); SPrint((&(hiCb.init))->prntBuf); } }
                                            ;




      return;
   }
   hdrParm.type = 4;

   hdrParm.u.hdrParmIpv4.proto.pres = 1;
   hdrParm.u.hdrParmIpv4.proto.val = ipv4Hdr.proto;

   hdrParm.u.hdrParmIpv4.dfBit.pres
      = (ipv4Hdr.off & 0x4000 ? 1 : 0);

   hdrParm.u.hdrParmIpv4.tos.pres = 1;
   hdrParm.u.hdrParmIpv4.tos.val = ipv4Hdr.tos;
   hdrParm.u.hdrParmIpv4.ttl.pres = 1;
   hdrParm.u.hdrParmIpv4.ttl.val = ipv4Hdr.ttl;



   cmMemset((U8 *)&icmpHdr, 0, sizeof(CmIcmpv4Hdr));
   if (0L != mBuf)
   SCpyMsgFix(mBuf, 0, sizeof (CmIcmpv4Hdr), (Data *)&icmpHdr, &count);

   msgType = icmpHdr.icmpType;
   msgCode = icmpHdr.icmpCode;
   protocol = icmpHdr.u3.icmpIpHdr.proto;

   srcAddr.type = destAddr.type = 4;


   srcAddr.u.ipv4TptAddr.port = destAddr.u.ipv4TptAddr.port = 0;

   srcAddr.u.ipv4TptAddr.address = ipv4Hdr.srcAddr;
   destAddr.u.ipv4TptAddr.address = ipv4Hdr.destAddr;






   for (conCb = (HiConCb *)((((l) = ((&hiCb.icmpLstCp)->crnt = (&hiCb.icmpLstCp)->first)) != 0L) ? (l)->node : 0L);
         conCb;
         conCb = (HiConCb *)((((l) = ((&hiCb.icmpLstCp)->crnt = ((&hiCb.icmpLstCp)->crnt ? (&hiCb.icmpLstCp)->crnt->next : (&hiCb.icmpLstCp)->first)))!= 0L) ? (l)->node : 0L))






   {
      sendflag = 0;


      if (conCb->state != 0x3
          && conCb->state != 0x5)
         continue;


      if (conCb->icmpMask & 0x1)
         sendflag = 1;
      else if (conCb->icmpMask & 0x2)
      {
         if (protocol == conCb->filterProtocol)
            sendflag = 1;
      }
      else if (conCb->icmpMask & 0x4)
      {
         for (idx = 0; idx < conCb->numFilters; idx++)
         {
            if (conCb->icmpError[idx].errType != msgType)
               continue;

            if (conCb->icmpError[idx].errCodeMask & (1 << msgCode))
               sendflag = 1;

            break;
         }
      }
      else if (conCb->icmpMask & 0x8)
      {
         if (protocol == conCb->filterProtocol)
         {
            for (idx = 0; idx < conCb->numFilters; idx++)
            {
               if (conCb->icmpError[idx].errType != msgType)
                  continue;


               if (conCb->icmpError[idx].errCodeMask & (1 << msgCode))




                  {
                  sendflag = 1;
                  break;
               }
            }
         }
      }


      if (sendflag)
      {

         ret = SAddMsgRef(mBuf, conCb->sap->uiPst.region,
                          conCb->sap->uiPst.pool, &tBuf);
         if (ret != 0)
         {
            alInfo.type = 3;
            alInfo.inf.mem.region = conCb->sap->uiPst.region;
            alInfo.inf.mem.pool = conCb->sap->uiPst.pool;
            hiSendAlarm(4, 13,
                        (256 + 2), &alInfo);
            continue;
         }


         { HiUiHitUDatInd(&conCb->sap->uiPst, conCb->sap->suId, conCb->suConId, &srcAddr, &destAddr, &hdrParm, tBuf); };
      }
   }



   { SPutMsg(mBuf); };







   return;
}
 S16 hiTxMsg
(
HiConCb *conCb,
Buffer *mBuf,
MsgLen *txLen,
Buffer **qBuf,
HiThrMsg *tMsg
)
{
   S16 ret;
   HiSap *sap;
   HiAlarmInfo alInfo;


   ;;


   *qBuf = 0L;
   cmMemset((U8 *)tMsg, 0, sizeof (HiThrMsg));;

   cmMemset((U8 *)&alInfo, 0, sizeof (HiAlarmInfo));;
   sap = conCb->sap;
   { CmInetMemInfo memInfo; memInfo.region = hiCb.init.region; memInfo.pool = hiCb.init.pool; ret = cmInetSendMsg(&conCb->conFd, &conCb->peerAddr ? &(&conCb->peerAddr)->u.ipv4TptAddr : 0L, &memInfo, mBuf, txLen, 0);; };
   if (ret == 0)
   {




      sap->txSts.numTxBytes += *txLen;;
      { if ((conCb->srvcType & 0x0F) == 11) sap->txSts.numTxTlsMsg++; else if (conCb->flag & 0x1) sap->txSts.numTxTcpMsg++; else if (conCb->flag & 0x2) sap->txSts.numTxUdpMsg++; else sap->txSts.numTxRawMsg++; };
      if (sap->trc)
         hiTrcBuf(sap, 0, mBuf);
   }





   else if (ret == 19)
   {



      if (*txLen)
      {




         sap->txSts.numTxBytes += *txLen;;
         { if ((conCb->srvcType & 0x0F) == 11) sap->txSts.numTxTlsMsg++; else if (conCb->flag & 0x1) sap->txSts.numTxTcpMsg++; else if (conCb->flag & 0x2) sap->txSts.numTxUdpMsg++; else sap->txSts.numTxRawMsg++; };

         if (sap->trc)
            hiTrcBuf(sap, 0, mBuf);

         SRemPreMsgMult(0L, *txLen, mBuf);
      }


      *qBuf = mBuf;
      mBuf = 0L;
   }





   else
   {
      tMsg->type = 0x4;
      tMsg->spId = sap->spId;
      tMsg->spConId = conCb->spConId;
      switch (ret)
      {
         case 1:
            hiCb.errSts.sockTxErr++;;
            hiSendAlarm(3, (256 + 1),
                        (256 + 3), &alInfo);
            tMsg->disc.reason = 6;
            break;

         case 20:
            tMsg->disc.reason = 17;
            break;

         case 4:
            hiCb.errSts.sockTxErr++;;
            alInfo.type = 3;
            alInfo.inf.mem.region = hiCb.init.region;
            alInfo.inf.mem.pool = hiCb.init.pool;
            hiSendAlarm(4, 13,
                        (256 + 3), &alInfo);
            tMsg->disc.reason = 15;
            break;

         default:
            hiSendAlarm(3, (256 + 7),
                        0, &alInfo);
            tMsg->disc.reason = 14;
            break;
      }
   }



   if (mBuf)
      { SPutMsg(mBuf); };


   return(ret);
}
static S16 hiSendTxQ
(
HiConCb *conCb
)




{
   S16 ret;
   HiSap *sap;
   QLen qLen;
   Buffer *mBuf, *qBuf;
   MsgLen txLen;
   HiThrMsg tMsg;
   HiAlarmInfo alInfo;


   ;;



   sap = conCb->sap;
   alInfo.spId = sap->spId;
   alInfo.type = 0;
   qLen = 0;

   ret = SFndLenQueue(&conCb->txQ, &qLen);



   while (qLen)
   {

      SDequeueFirst(&mBuf, &conCb->txQ);
      qLen--;



      ret = hiTxMsg(conCb, mBuf, &txLen, &qBuf, &tMsg);



      if (txLen)
      {
         hiChkFlc(conCb, 0, txLen);
         conCb->txQSize -= txLen;
      }



      if (ret != 0)
      {

         if (ret == 19)
            SQueueFirst(qBuf, &conCb->txQ);

         break;
      }
   }







   return(ret);
}
static S16 hiAcceptTcpCon
(
HiConCb *conCb,
HiConCb **newCon
)





{
   S16 ret;
   U8 type;
   HiSap *sap;
   HiConCb *newConCb;
   CmInetFd fd;
   CmTptAddr peerAddr;
   HiAlarmInfo alInfo;


   ;;



   sap = conCb->sap;
   alInfo.spId = sap->spId;
   alInfo.type = 0;



   ret = cmInetAccept(&conCb->conFd, &(&peerAddr)->u.ipv4TptAddr, &fd);;


   if (ret == 2)
      return(2);


   else if (ret != 0)
   {
      hiSendAlarm(3, (256 + 1),
                  (256 + 1), &alInfo);
      { if ((&(hiCb.init))->dbgMask & (0x00000100)) { snprintf((&(hiCb.init))->prntBuf, 255, "[%s %d:0x%x:%x] %s:%d ", "TCP_UDP_CONVERGENCE_LAYER", (&(hiCb.init))->procId, (&(hiCb.init))->ent, (&(hiCb.init))->inst,
                                                           "/home/mrehwald/Desktop/Radisys/lte_enb/src/tucl/hi_bdy3.c"
      ,
                                                           2976
      ); SPrint((&(hiCb.init))->prntBuf); sprintf (hiCb.init.prntBuf, "hiAcceptTcpCon(): failed to accept connection\n"); SPrint((&(hiCb.init))->prntBuf); } }
                                                            ;
      cmInetClose(&fd);;
      return(1);
   }



   ret = hiAllocConCb(sap, conCb->suConId, conCb->srvcType,
                      &type, &newConCb);
   if (ret != 0)
   {
      cmInetClose(&fd);;
      return(1);
   }

   newConCb->flag = conCb->flag;
   newConCb->state = 0x1;







   peerAddr.type = 4;


   cmMemcpy((U8 *)&newConCb->peerAddr, (U8 *)&peerAddr,
            sizeof (CmTptAddr));
   cmMemcpy((U8 *)&newConCb->conFd, (U8 *)&fd, sizeof (CmInetFd));





   if((conCb->flag & 0x1)&& (conCb->ipTos != 0xFF))
      {
              U32 optVal = conCb->ipTos;

              ret = cmInetSetOpt(&fd,
                                    IPPROTO_IP
                                                    , 12, (Void*)&optVal);
              if ( ret != 0 )
              {

                      cmInetClose(&fd);;


                      SPutSBuf(hiCb.init.region, hiCb.init.pool, (Data *)newConCb, sizeof(HiConCb));;


                      hiSendAlarm(3,4,
                      (256 + 1), &alInfo);
                      return(1);
              }
      }



   ret = hiCompleteConCb(newConCb);
   if (ret != 0)
   {
      cmInetClose(&fd);;
      { cmHashListDelete(&newConCb->sap->conCbHlCp, (U32)newConCb); if (newConCb->icmpError) SPutSBuf(hiCb.init.region, hiCb.init.pool, (Data *)newConCb->icmpError, newConCb->numFilters * sizeof(CmIcmpError));; SPutSBuf(hiCb.init.region, hiCb.init.pool, (Data *)newConCb, sizeof(HiConCb));; newConCb = 0L; };
      return(1);
   }



   *newCon = newConCb;


   return(0);
}
static S16 hiAcceptCon
(
HiConCb *conCb,
HiThrMsg *tMsg
)





{
   S16 ret;
   U8 maxCons;
   HiConCb *newConCb;
   HiAlarmInfo alInfo;

   ;;



   alInfo.spId = conCb->sap->spId;
   alInfo.type = 0;




   ret = 0;
   maxCons = hiCb.cfg.numClToAccept;
   while (maxCons)
   {
      maxCons--;

      ret = hiAcceptTcpCon(conCb, &newConCb);
      if (ret != 0)
         return(ret);




      ret = hiAssignConCb(newConCb, 0x1);
      if (ret != 0)
      {

         hiSendAlarm(3, 4,
                     (256 + 11), &alInfo);
         { cmHashListDelete(&newConCb->sap->conCbHlCp, (U32)newConCb); if (newConCb->icmpError) SPutSBuf(hiCb.init.region, hiCb.init.pool, (Data *)newConCb->icmpError, newConCb->numFilters * sizeof(CmIcmpError));; SPutSBuf(hiCb.init.region, hiCb.init.pool, (Data *)newConCb, sizeof(HiConCb));; newConCb = 0L; };
         break;
      }


      conCb->sap->txSts.numCons++;;


      if (newConCb->state == 0x1)
         { HiUiHitConInd(&newConCb->sap->uiPst, newConCb->sap->suId, newConCb->suConId, newConCb->spConId, &newConCb->peerAddr); };
   }


   return(ret);
}
static S16 hiRecvMsg
(
HiConCb *conCb,
HiThrMsg *tMsg
)





{
   S16 ret;
   U8 usrSrvc;
   U8 numMsg;
   HiSap *sap;
   HiFdGrp *fdGrp;
   HiAlarmInfo alInfo;
   Buffer *mBuf;
   MsgLen mLen;
   CmTptAddr srcAddr, destAddr;
   CmIpHdrParm hdrParm;
   HiLocalInf *lif;
   lif = 0L;




   ;;




   cmMemset((U8 *)&hdrParm, 0, sizeof (CmIpHdrParm));;
   sap = conCb->sap;
   fdGrp = hiCb.fdGrps[conCb->fdGrpNum];
   usrSrvc = conCb->srvcType & 0xf0;




   numMsg = 8;



   if (conCb->priority)
   {
      if (conCb->srvcType == 7)
         numMsg = hiCb.cfg.numRawMsgsToRead;
      else
         numMsg = hiCb.cfg.numUdpMsgsToRead;
   }



   ret = 0;
   while (ret != 2 && numMsg)
   {
      numMsg--;

      mLen = -1;
      { CmInetMemInfo memInfo; memInfo.region = hiCb.init.region; memInfo.pool = hiCb.init.pool; ret = cmInetRecvMsg(&conCb->conFd, &(&srcAddr)->u.ipv4TptAddr, &memInfo, &mBuf, &mLen, 0);; }



                                            ;
      if (ret != 0)
      {

         if (ret == 20)
         {
            tMsg->type = 0x4;
            tMsg->spId = sap->spId;
            tMsg->spConId = conCb->spConId;
            tMsg->disc.reason = 17;
            return(20);
         }


         else if (ret == 2)
            return(2);


         else if (ret == 4)
         {
            hiCb.errSts.sockRxErr++;;
            alInfo.spId = sap->spId;
            alInfo.type = 0;
            hiSendAlarm(4, 13,
                        (256 + 2), &alInfo);
            return(2);
         }


         else
         {
            hiCb.errSts.sockRxErr++;;
            tMsg->type = 0x4;
            tMsg->spId = sap->spId;
            tMsg->spConId = conCb->spConId;
            tMsg->disc.reason = 7;
            alInfo.spId = sap->spId;
            alInfo.type = 0;
            hiSendAlarm(3, (256 + 1),
                        (256 + 2), &alInfo);
            return(1);
         }
      }



      fdGrp->genRxSts.numRxBytes += mLen;
      fdGrp->rxSts[sap->spId].numRxBytes += mLen;
      { if ((conCb->srvcType & 0x0F) == 11) { fdGrp->genRxSts.numRxTlsMsg++; fdGrp->rxSts[conCb->sap->spId].numRxTlsMsg++; } else if (conCb->flag & 0x1) { fdGrp->genRxSts.numRxTcpMsg++; fdGrp->rxSts[conCb->sap->spId].numRxTcpMsg++; } else if (conCb->flag & 0x2) { fdGrp->genRxSts.numRxUdpMsg++; fdGrp->rxSts[conCb->sap->spId].numRxUdpMsg++; } else { fdGrp->genRxSts.numRxRawMsg++; fdGrp->rxSts[conCb->sap->spId].numRxRawMsg++; } };
      srcAddr.type = 4;





      cmMemcpy((U8 *)&conCb->peerAddr, (U8 *)&srcAddr,
               sizeof (CmTptAddr));





      if (conCb->flag & 0x20)
      {

         if (sap->trc && mBuf != 0L)
            hiTrcBuf(sap, 5, mBuf);







         if (mBuf != 0L)
         hiHndlRawMsg(conCb, mBuf, mLen, lif);
      }



      else if (conCb->flag & 0x2)
      {

         if (sap->trc && mBuf != 0L)
            hiTrcBuf(sap, 3, mBuf);
         destAddr.type = 0;
         if ((usrSrvc || conCb->srvcType == 5) && mBuf !=0L)
            hiHndlUdpData(conCb, mBuf, mLen, &srcAddr, &destAddr,
                          &hdrParm, lif);
         else
            { HiUiHitUDatInd(&conCb->sap->uiPst, conCb->sap->suId, conCb->suConId, &srcAddr, &destAddr, &hdrParm, mBuf); }
                                 ;
      }



      else
      {

         if (sap->trc && mBuf != 0L)
            hiTrcBuf(sap, 2, mBuf);


         if (conCb->state == 0x2)
         {
            conCb->state = 0x3;





               { HiUiHitConCfm(&conCb->sap->uiPst, conCb->sap->suId, conCb->suConId, conCb->spConId, &conCb->locTptAddr); };



         }




         if ((usrSrvc || conCb->srvcType == 2) && (mBuf != 0L))
         {
            ret = hiHndlTcpData(conCb, mBuf, mLen);
            if (ret != 0)
               return(ret);
         }
         else
         {
            if (mLen > 0)
            {
               { HiUiHitDatInd(&conCb->sap->uiPst, conCb->sap->suId, conCb->suConId, mBuf); };
            }
         }
      }
   }


   return(0);
}
static Void hiProcTx
(
HiFdGrp *fdGrp,
HiConCb *conCb,
CmInetFdSet *selRdFdSet,
S16 *setFds
)







{
   S16 ret;
   HiThrMsg tMsg;


   ;;
   ret = 0;
   if (conCb->state == 0x2)
   {

      cmInetGetSockName(&conCb->conFd, &(&conCb->locTptAddr)->u.ipv4TptAddr);;


      if (
         ((((
         selRdFdSet
         )->fds_bits)[__extension__ ({ long int __d = (
         (&conCb->conFd)->fd
         ); (__builtin_constant_p (__d) ? (0 <= __d && __d < 1024 ? (__d / (8 * (int) sizeof (__fd_mask))) : __fdelt_warn (__d)) : __fdelt_chk (__d)); })] & ((__fd_mask) (1UL << ((
         (&conCb->conFd)->fd
         ) % (8 * (int) sizeof (__fd_mask)))))) != 0)
                                                    )
      {
         (*setFds)--;
         
        ((void) (((
        selRdFdSet
        )->fds_bits)[__extension__ ({ long int __d = (
        (&conCb->conFd)->fd
        ); (__builtin_constant_p (__d) ? (0 <= __d && __d < 1024 ? (__d / (8 * (int) sizeof (__fd_mask))) : __fdelt_warn (__d)) : __fdelt_chk (__d)); })] &= ~((__fd_mask) (1UL << ((
        (&conCb->conFd)->fd
        ) % (8 * (int) sizeof (__fd_mask)))))))
                                                 ;
         ret = hiRecvMsg(conCb, &tMsg);
         if (ret != 0 && ret != 2)
            goto hiProcTxDone;

      }



      else
      {


         conCb->state = 0x3;






            { HiUiHitConCfm(&conCb->sap->uiPst, conCb->sap->suId, conCb->suConId, conCb->spConId, &conCb->locTptAddr); };






      }
   }



   else if (conCb->state == 0x3
            || conCb->state == 0x4)
   {
      ret = hiSendTxQ(conCb);
      if (ret != 0 && ret != 19)
      {



         if (
            ((((
            selRdFdSet
            )->fds_bits)[__extension__ ({ long int __d = (
            (&conCb->conFd)->fd
            ); (__builtin_constant_p (__d) ? (0 <= __d && __d < 1024 ? (__d / (8 * (int) sizeof (__fd_mask))) : __fdelt_warn (__d)) : __fdelt_chk (__d)); })] & ((__fd_mask) (1UL << ((
            (&conCb->conFd)->fd
            ) % (8 * (int) sizeof (__fd_mask)))))) != 0)
                                                       )
         {
            (*setFds)--;
            
           ((void) (((
           selRdFdSet
           )->fds_bits)[__extension__ ({ long int __d = (
           (&conCb->conFd)->fd
           ); (__builtin_constant_p (__d) ? (0 <= __d && __d < 1024 ? (__d / (8 * (int) sizeof (__fd_mask))) : __fdelt_warn (__d)) : __fdelt_chk (__d)); })] &= ~((__fd_mask) (1UL << ((
           (&conCb->conFd)->fd
           ) % (8 * (int) sizeof (__fd_mask)))))))
                                                    ;
         }

         tMsg.type = 0x4;
         tMsg.spId = conCb->sap->spId;
         tMsg.spConId = conCb->spConId;
         tMsg.disc.reason = 7;
      }
   }





   if (ret != 19)
   {
      cmHashListDelete(&fdGrp->wrFdHlCp, (U32)conCb);
      
     ((void) (((
     &fdGrp->writeFdSet
     )->fds_bits)[__extension__ ({ long int __d = (
     (&conCb->conFd)->fd
     ); (__builtin_constant_p (__d) ? (0 <= __d && __d < 1024 ? (__d / (8 * (int) sizeof (__fd_mask))) : __fdelt_warn (__d)) : __fdelt_chk (__d)); })] &= ~((__fd_mask) (1UL << ((
     (&conCb->conFd)->fd
     ) % (8 * (int) sizeof (__fd_mask)))))))
                                                      ;


      if (fdGrp->numWrFds)
      {
         fdGrp->numWrFds--;
      }
   }


hiProcTxDone:







   if (ret != 0 && ret != 2 && ret != 19)
      hiProcThrDelCon(fdGrp, &tMsg, 0L, 0L, 0L);


   return;
}
static Void hiProcRx
(
HiFdGrp *fdGrp,
HiConCb *conCb
)





{
   S16 ret;
   HiThrMsg tMsg;


   Bool timerRun = 0;
   U8 numTmr;
   ;;



   ret = 0;
   tMsg.type = 0;







      if (conCb->state == 0x0)
      {

         if (!conCb->sap->resCongStrt)
            ret = hiAcceptCon(conCb, &tMsg);
      }

      else if (conCb->state == 0x3
            || conCb->state == 0x5)
      {





            if (conCb->sap->resCongStrt == 1)
            {
               for(numTmr = 0; numTmr < 1 ; numTmr++)
               {
                  if(conCb->sap->congTimers[numTmr].tmrEvnt == 2)
                  {
                     timerRun = 1;
                  }
               }
               if (timerRun && (conCb->sap->resCongDrop != 1))
               {
                  ret = hiRecvMsg(conCb, &tMsg);
               }
               else
               {
               }
            }
            else if (hiChkRes(conCb->sap) == 0)
            {
               ret = hiRecvMsg(conCb, &tMsg);
            }
            else
            {
            }



      }







   if (ret != 0 && ret != 2 && tMsg.type)
      hiProcThrDelCon(fdGrp, &tMsg, 0L, 0L, 0L);


   return;
}
static S16 hiProcFds
(
HiFdGrp *fdGrp,
CmInetFdSet *selRdFdSet,
CmInetFdSet *selWrFdSet,
S16 setFds
)







{
   S16 ret;
   CmInetFdType fd;
   HiConCb *conCb;







   ;;



   if (
      ((((
      selRdFdSet
      )->fds_bits)[__extension__ ({ long int __d = (
      (&fdGrp->servFd)->fd
      ); (__builtin_constant_p (__d) ? (0 <= __d && __d < 1024 ? (__d / (8 * (int) sizeof (__fd_mask))) : __fdelt_warn (__d)) : __fdelt_chk (__d)); })] & ((__fd_mask) (1UL << ((
      (&fdGrp->servFd)->fd
      ) % (8 * (int) sizeof (__fd_mask)))))) != 0)
                                                  )
   {
      setFds--;
      
     ((void) (((
     selRdFdSet
     )->fds_bits)[__extension__ ({ long int __d = (
     (&fdGrp->servFd)->fd
     ); (__builtin_constant_p (__d) ? (0 <= __d && __d < 1024 ? (__d / (8 * (int) sizeof (__fd_mask))) : __fdelt_warn (__d)) : __fdelt_chk (__d)); })] &= ~((__fd_mask) (1UL << ((
     (&fdGrp->servFd)->fd
     ) % (8 * (int) sizeof (__fd_mask)))))))
                                               ;
      ret = hiProcThrMsg(fdGrp, selRdFdSet, selWrFdSet, &setFds);
      if (ret == 20)
         return(20);
   }




   if (fdGrp->procIcmp
       && 
          ((((
          selRdFdSet
          )->fds_bits)[__extension__ ({ long int __d = (
          (&hiCb.icmpConFd)->fd
          ); (__builtin_constant_p (__d) ? (0 <= __d && __d < 1024 ? (__d / (8 * (int) sizeof (__fd_mask))) : __fdelt_warn (__d)) : __fdelt_chk (__d)); })] & ((__fd_mask) (1UL << ((
          (&hiCb.icmpConFd)->fd
          ) % (8 * (int) sizeof (__fd_mask)))))) != 0)
                                                       )
   {
      setFds--;
      
     ((void) (((
     selRdFdSet
     )->fds_bits)[__extension__ ({ long int __d = (
     (&hiCb.icmpConFd)->fd
     ); (__builtin_constant_p (__d) ? (0 <= __d && __d < 1024 ? (__d / (8 * (int) sizeof (__fd_mask))) : __fdelt_warn (__d)) : __fdelt_chk (__d)); })] &= ~((__fd_mask) (1UL << ((
     (&hiCb.icmpConFd)->fd
     ) % (8 * (int) sizeof (__fd_mask)))))))
                                                ;
      hiRecvIcmpMsg();
   }
   if (fdGrp->numWrFds)
   {
      { (&fdGrp->fdSetInfo)->arIdx = 0; };
      while (setFds)
      {

         cmMemset((U8 *)&fd, 0, sizeof(CmInetFdType));;
         ret = cmInetGetFd(&fdGrp->fdSetInfo, selWrFdSet, &fd);
         if (ret != 0)
            break;


         ret = cmHashListFind(&fdGrp->wrFdHlCp, (U8 *)&fd,
                              sizeof (CmInetFdType), 0, (U32 *)&conCb);
         if (ret != 0)
         {
            { if ((&(hiCb.init))->dbgMask & (0x00000100)) { snprintf((&(hiCb.init))->prntBuf, 255, "[%s %d:0x%x:%x] %s:%d ", "TCP_UDP_CONVERGENCE_LAYER", (&(hiCb.init))->procId, (&(hiCb.init))->ent, (&(hiCb.init))->inst,
                                                               "/home/mrehwald/Desktop/Radisys/lte_enb/src/tucl/hi_bdy3.c"
            ,
                                                               3827
            ); SPrint((&(hiCb.init))->prntBuf); sprintf (hiCb.init.prntBuf, "hiProcFds(): could not find fd in hash list\n"); SPrint((&(hiCb.init))->prntBuf); } }
                                                                ;
            continue;
         }


         setFds--;
         hiProcTx(fdGrp, conCb, selRdFdSet, &setFds);
      }
   }



   { (&fdGrp->fdSetInfo)->arIdx = 0; };
   while (setFds)
   {

      cmMemset((U8 *)&fd, 0, sizeof(CmInetFdType));;
      ret = cmInetGetFd(&fdGrp->fdSetInfo, selRdFdSet, &fd);
      if (ret == 2)
         break;
      else if (ret != 0)
      {
         { if ((&(hiCb.init))->dbgMask & (0x00000100)) { snprintf((&(hiCb.init))->prntBuf, 255, "[%s %d:0x%x:%x] %s:%d ", "TCP_UDP_CONVERGENCE_LAYER", (&(hiCb.init))->procId, (&(hiCb.init))->ent, (&(hiCb.init))->inst,
                                                       "/home/mrehwald/Desktop/Radisys/lte_enb/src/tucl/hi_bdy3.c"
         ,
                                                       3850
         ); SPrint((&(hiCb.init))->prntBuf); sprintf (hiCb.init.prntBuf, "hiProcFds(): could not get next set fd\n"); SPrint((&(hiCb.init))->prntBuf); } }
                                                        ;
         break;
      }


      ret = cmHashListFind(&fdGrp->rdFdHlCp, (U8 *)&fd,
                           sizeof (CmInetFdType), 0, (U32 *)&conCb);
      if (ret != 0)
      {
         { if ((&(hiCb.init))->dbgMask & (0x00000100)) { snprintf((&(hiCb.init))->prntBuf, 255, "[%s %d:0x%x:%x] %s:%d ", "TCP_UDP_CONVERGENCE_LAYER", (&(hiCb.init))->procId, (&(hiCb.init))->ent, (&(hiCb.init))->inst,
                                                            "/home/mrehwald/Desktop/Radisys/lte_enb/src/tucl/hi_bdy3.c"
         ,
                                                            3860
         ); SPrint((&(hiCb.init))->prntBuf); sprintf (hiCb.init.prntBuf, "hiProcFds(): could not find fd in hash list\n"); SPrint((&(hiCb.init))->prntBuf); } }
                                                             ;
         continue;
      }

      setFds--;
      hiProcRx(fdGrp, conCb);
   }


   return(0);
}
 S16 hiRecvTsk
(
Pst *pst,
Buffer *mBuf
)





{
   S16 ret, fdGrpNum, setFds;
   Bool loop;
   HiFdGrp *fdGrp;
   CmInetFdSet selRdFdSet, selWrFdSet;
   HiAlarmInfo alInfo;

   U32 timeout;



   ;;


   if (mBuf)
      { SPutMsg(mBuf); };






   fdGrpNum = 0;


   fdGrp = hiCb.fdGrps[fdGrpNum];



   loop = 1;
   while (loop)
   {

      cmMemcpy((U8 *)&selRdFdSet, (U8 *)&fdGrp->readFdSet,
               sizeof (CmInetFdSet));
      if (fdGrp->numWrFds)
         cmMemcpy((U8 *)&selWrFdSet, (U8 *)&fdGrp->writeFdSet,
                  sizeof (CmInetFdSet));
      timeout = hiCb.cfg.selTimeout;
      ret = cmInetSelect(&selRdFdSet,
                         (fdGrp->numWrFds ? &selWrFdSet : 0L),
                         &timeout, &setFds);
      if (ret == 21)
         break;




      if (ret == 2)
      {
         continue;
      }

      if (ret != 0)
      {
         { if ((&(hiCb.init))->dbgMask & (0x00000100)) { snprintf((&(hiCb.init))->prntBuf, 255, "[%s %d:0x%x:%x] %s:%d ", "TCP_UDP_CONVERGENCE_LAYER", (&(hiCb.init))->procId, (&(hiCb.init))->ent, (&(hiCb.init))->inst,
                                            "/home/mrehwald/Desktop/Radisys/lte_enb/src/tucl/hi_bdy3.c"
         ,
                                            3967
         ); SPrint((&(hiCb.init))->prntBuf); sprintf (hiCb.init.prntBuf, "hiRecvTsk: select() failure\n"); SPrint((&(hiCb.init))->prntBuf); } }
                                             ;
         alInfo.spId = -1;
         alInfo.type = 0;
         hiSendAlarm(3, 4,
                     (256 + 5), &alInfo);
         return(1);
      }



      if (setFds)
      {
         ret = hiProcFds(fdGrp, &selRdFdSet, &selWrFdSet, setFds);
         if (ret == 20)
            break;
      }


      loop = 0;

   }


   return(0);
}