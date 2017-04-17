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

 U8 *cmMemcpy (U8 *tgt, const U8 *src, U32 len);
 S16 cmMemcmp (const U8 *s1, const U8 *s2, U32 len);
 U8 *cmMemset (U8 *src, U8 val, U32 len);

 S16 cmStrcmp (const U8 *s1, const U8 *s2);

 S16 cmStrncmp (const U8 *s1, const U8 *s2, MsgLen len);
 MsgLen cmStrlen (const U8 *s);
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
typedef U16 SctStrmId;
typedef U16 SctPort;
typedef U32 SctTSN;
typedef U16 SctRTT;
typedef U16 SctStatus;
typedef U16 SctResult;
typedef U16 SctCause;
typedef S32 SctWinSize;
typedef TknStr64 SctVSInfo;





typedef struct _sctNetAddrLst
{
   U8 nmb;
   CmNetAddr nAddr[5];
} SctNetAddrLst;


typedef struct _sctRtrvInfo
{
   U32 nmbUnsentDgms;
   U32 nmbUnackDgms;
   U32 nmbUndelDgms;
   SctTSN lastAckTsn;
   SctTSN lastSentTsn;
} SctRtrvInfo;


typedef struct _sctDatIndType
{
   U8 type;
   SctTSN tsn;
   U16 seqNum;
   Bool last;
} SctDatIndType;


typedef struct _SctInitParams
{
   U32 iTag;
   U32 a_rwnd;
   SctStrmId outStrms;
   SctStrmId inStrms;
   SctTSN iTsn;
   U32 cookieLife;
   SctPort peerPort;
   SctPort localPort;
   SctNetAddrLst peerAddrLst;
   SctNetAddrLst localAddrLst;
   U16 supAddress;
   U8 hstNameLen;
   U8 hstName[255];
} SctInitParams;


typedef struct _SctCookieParams
{
   UConnId spAssocId;
   UConnId suAssocId;
   SctPort peerPort;
   SctNetAddrLst peerAddrLst;





} SctCookieParams;


typedef struct _SctAssocIndParams
{
   U8 type;
   union
   {
      SctInitParams initParams;
      SctCookieParams cookieParams;
   } t;




} SctAssocIndParams;


typedef struct _sctAssocInfo
{
   SctWinSize rwnd;
   U8 connSta;
   CmNetAddr priDstAddr;
   SctPort dstPort;
   SctNetAddrLst dstAddrLst;
} SctAssocInfo;


typedef struct _sctAddrInfo
{
   U16 rtt;
   U32 cwnd;
   U32 rto;
   Bool active;
} SctAddrInfo;


typedef struct _sctStaInfo
{
   U8 staType;
   union
   {
      SctAssocInfo assocInfo;
      SctAddrInfo addrInfo;
      SctRtrvInfo rtrvInfo;
   } u;
} SctStaInfo;
typedef S16 (*SctBndReq) (Pst *pst, SuId suId, SpId spId)

                                                         ;

typedef S16 (*SctBndCfm) (Pst *pst, SuId suId, SctResult result)

                                                           ;
typedef S16 (*SctEndpOpenReq) (Pst *pst, SpId spId, UConnId suEndpId, SctPort port, CmNetAddr *intfNAddr)



                                                               ;


typedef S16 (*SctEndpOpenCfm) (Pst *pst, SuId suId, UConnId suEndpId, UConnId spEndpId, SctResult result, SctCause cause)




                                                           ;

typedef S16 (*SctEndpCloseReq) (Pst *pst, SpId spId, UConnId endpId, U8 endpIdType)


                                                                ;

typedef S16 (*SctEndpCloseCfm) (Pst *pst, SuId suId, UConnId suEndpId, SctResult result, SctCause cause)



                                                           ;
typedef S16 (*SctAssocReq) (Pst *pst, SpId spId, UConnId spEndpId, UConnId suAssocId, CmNetAddr *priDstNAddr, SctPort dstPort, SctStrmId outStrms, SctNetAddrLst *dstNAddrLst, SctNetAddrLst *srcNAddrLst, Buffer *vsInfo)
                                                           ;


typedef S16 (*SctAssocInd) (Pst *pst, SuId suId, UConnId suEndpId, SctAssocIndParams *assocParams, Buffer *vsInfo)



                                                              ;
typedef S16 (*SctAssocRsp) (Pst *pst, SpId spId, UConnId spEndpId, SctAssocIndParams *assocParams, SctResult result, Buffer *vsInfo)




                                                              ;
typedef S16 (*SctAssocCfm) (Pst *pst, SuId suId, UConnId suAssocId, UConnId spAssocId, SctNetAddrLst *dstNAddrLst, SctPort dstPort, SctStrmId outStrms, Buffer *vsInfo)






                                                           ;


typedef S16 (*SctTermReq) (Pst *pst, SpId spId, UConnId assocId, U8 assocIdType, Bool abrtFlg)



                                                            ;

typedef S16 (*SctTermInd) (Pst *pst, SuId suId, UConnId assocId, U8 assocIdType, SctStatus status, SctCause cause, SctRtrvInfo *rtrvInfo)





                                                             ;

typedef S16 (*SctTermCfm) (Pst *pst, SuId suId, UConnId suAssocId, SctResult result, SctCause cause)



                                                          ;

typedef S16 (*SctSetPriReq) (Pst *pst, SpId spId, UConnId spAssocId, CmNetAddr *dstNAddr)


                                                             ;

typedef S16 (*SctSetPriCfm) (Pst *pst, SuId suId, UConnId suAssocId, SctResult result, SctCause cause)



                                                          ;

typedef S16 (*SctHBeatReq) (Pst *pst, SpId spId, UConnId spAssocId, CmNetAddr *dstNAddr, U16 intervalTime, SctStatus status)




                                                           ;

typedef S16 (*SctHBeatCfm) (Pst *pst, SuId suId, UConnId suAssocId, CmNetAddr *dstNAddr, SctStatus status, SctResult result, SctCause cause)





                                                          ;

typedef S16 (*SctDatReq) (Pst *pst, SpId spId, UConnId spAssocId, CmNetAddr *dstNAddr, SctStrmId strmId, Bool unorderFlg, Bool nobundleFlg, U16 lifeTime, U32 protId, Buffer *mBuf)
                                                         ;

typedef S16 (*SctDatInd) (Pst *pst, SuId suId, UConnId suAssocId, SctStrmId strmId, SctDatIndType *indType, U32 protId, Buffer *mBuf)





                                                         ;

typedef S16 (*SctStaReq) (Pst *pst, SpId spId, UConnId spAssocId, CmNetAddr *dstNAddr, U8 staType)



                                                            ;

typedef S16 (*SctStaCfm) (Pst *pst, SuId suId, UConnId suAssocId, CmNetAddr *dstNAddr, SctResult result, SctCause cause, SctStaInfo *staInfo)





                                                            ;
typedef S16 (*SctStaInd) (Pst *pst, SuId suId, UConnId suAssocId, UConnId spAssocId, CmNetAddr *dstNAddr, SctStatus status, SctCause cause, Buffer *mBuf)






                                                         ;


typedef S16 (*SctFlcInd) (Pst *pst, SuId suId, UConnId suAssocId, Reason reason)


                                                           ;







extern S16 SbUiSctBndReq (Pst *pst, SuId suId, SpId spId)

                                                               ;

extern S16 SbUiSctBndCfm (Pst *pst, SuId suId, SctResult result)

                                                                 ;
extern S16 SbUiSctEndpOpenReq (Pst *pst, SpId spId, UConnId suEndpId, SctPort port, CmNetAddr *intfNAddr)



                                                                    ;

extern S16 SbUiSctEndpOpenCfm (Pst *pst, SuId suId, UConnId suEndpId, UConnId spEndpId, SctResult result, SctCause cause)




                                                                ;

extern S16 SbUiSctEndpCloseReq (Pst *pst, SpId spId, UConnId endpId, U8 endpIdType)


                                                                     ;

extern S16 SbUiSctEndpCloseCfm (Pst *pst, SuId suId, UConnId suEndpId, SctResult result, SctCause cause)



                                                                ;
extern S16 SbUiSctAssocReq (Pst *pst, SpId spId, UConnId spEndpId, UConnId suAssocId, CmNetAddr *priDstNAddr, SctPort dstPort, SctStrmId outStrms, SctNetAddrLst *dstNAddrLst, SctNetAddrLst *srcNAddrLst, Buffer *vsInfo)
                                                                 ;


extern S16 SbUiSctAssocInd (Pst *pst, SuId suId, UConnId suEndpId, SctAssocIndParams *assocParams, Buffer *vsInfo)



                                                                     ;
extern S16 SbUiSctAssocRsp (Pst *pst, SpId spId, UConnId spEndpId, SctAssocIndParams *assocIndParams, SctResult result, Buffer *vsInfo)




                                                                     ;
extern S16 SbUiSctAssocCfm (Pst *pst, SuId suId, UConnId suAssocId, UConnId spAssocId, SctNetAddrLst *dstNAddrLst, SctPort dstPort, SctStrmId outStrms, Buffer *vsInfo)






                                                                 ;



extern S16 SbUiSctTermReq (Pst *pst, SpId spId, UConnId assocId, U8 assocIdType, Bool abrtFlg)



                                                                  ;

extern S16 SbUiSctTermInd (Pst *pst, SuId suId, UConnId assocId, U8 assocIdType, SctStatus status, SctCause cause, SctRtrvInfo *rtrvInfo)





                                                                   ;

extern S16 SbUiSctTermCfm (Pst *pst, SuId suId, UConnId suAssocId, SctResult result, SctCause cause)



                                                                ;

extern S16 SbUiSctSetPriReq (Pst *pst, SpId spId, UConnId spAssocId, CmNetAddr *dstNAddr)


                                                                   ;

extern S16 SbUiSctSetPriCfm (Pst *pst, SuId suId, UConnId suAssocId, SctResult result, SctCause cause)



                                                                ;

extern S16 SbUiSctHBeatReq (Pst *pst, SpId spId, UConnId spAssocId, CmNetAddr *dstNAddr, U16 intervalTime, SctStatus status)




                                                                 ;

extern S16 SbUiSctHBeatCfm (Pst *pst, SuId suId, UConnId suAssocId, CmNetAddr *dstNAddr, SctStatus status, SctResult result, SctCause cause)





                                                                ;

extern S16 SbUiSctDatReq (Pst *pst, SpId spId, UConnId spAssocId, CmNetAddr *dstNAddr, SctStrmId strmId, Bool unorderFlg, Bool nobundleFlg, U16 lifeTime, U32 protId, Buffer *mBuf)
                                                               ;

extern S16 SbUiSctDatInd (Pst *pst, SuId suId, UConnId suAssocId, SctStrmId strmId, SctDatIndType *indType, U32 protId, Buffer *mBuf)





                                                               ;

extern S16 SbUiSctStaReq (Pst *pst, SpId spId, UConnId spAssocId, CmNetAddr *dstNAddr, U8 staType)



                                                                  ;

extern S16 SbUiSctStaCfm (Pst *pst, SuId suId, UConnId suAssocId, CmNetAddr *dstNAddr, SctResult result, SctCause cause, SctStaInfo *staInfo)





                                                                  ;
extern S16 SbUiSctStaInd (Pst *pst, SuId suId, UConnId suAssocId, UConnId spAssocId, CmNetAddr *dstNAddr, SctStatus status, SctCause cause, Buffer *mBuf)






                                                      ;

extern S16 SbUiSctFlcInd (Pst *pst, SuId suId, UConnId suAssocId, Reason reason)


                                                                 ;
extern S16 cmPkSctBndReq (Pst *pst, SuId suId, SpId spId)

                                                               ;

extern S16 cmPkSctBndCfm (Pst *pst, SuId suId, SctResult result)

                                                                 ;
extern S16 cmPkSctEndpOpenReq (Pst *pst, SpId spId, UConnId suEndpId, SctPort port, CmNetAddr *intfNAddr)



                                                                    ;


extern S16 cmPkSctEndpOpenCfm (Pst *pst, SuId suId, UConnId suEndpId, UConnId spEndpId, SctResult result, SctCause cause)




                                                                ;

extern S16 cmPkSctEndpCloseReq (Pst *pst, SpId spId, UConnId endpId, U8 endpIdType)


                                                                     ;

extern S16 cmPkSctEndpCloseCfm (Pst *pst, SuId suId, UConnId suEndpId, SctResult result, SctCause cause)



                                                                ;
extern S16 cmPkSctAssocReq (Pst *pst, SpId spId, UConnId spEndpId, UConnId suAssocId, CmNetAddr *priDstNAddr, SctPort dstPort, SctStrmId outStrms, SctNetAddrLst *dstNAddrLst, SctNetAddrLst *srcNAddrLst, Buffer *vsInfo)
                                                                 ;


extern S16 cmPkSctAssocInd (Pst *pst, SuId suId, UConnId suEndpId, SctAssocIndParams *assocParams, Buffer *vsInfo)



                                                                     ;
extern S16 cmPkSctAssocRsp (Pst *pst, SpId spId, UConnId spEndpId, SctAssocIndParams *assocParams, SctResult result, Buffer *vsInfo)




                                                                     ;
extern S16 cmPkSctAssocCfm (Pst *pst, SuId suId, UConnId suAssocId, UConnId spAssocId, SctNetAddrLst *dstNAddrLst, SctPort dstPort, SctStrmId outStrms, Buffer *vsInfo)






                                                                 ;


extern S16 cmPkSctTermReq (Pst *pst, SpId spId, UConnId assocId, U8 assocIdType, Bool abrtFlg)



                                                                  ;

extern S16 cmPkSctTermInd (Pst *pst, SuId suId, UConnId assocId, U8 assocIdType, SctStatus status, SctCause cause, SctRtrvInfo *rtrvInfo)





                                                                   ;

extern S16 cmPkSctTermCfm (Pst *pst, SuId suId, UConnId suAssocId, SctResult result, SctCause cause)



                                                                ;

extern S16 cmPkSctSetPriReq (Pst *pst, SpId spId, UConnId spAssocId, CmNetAddr *dstNAddr)


                                                                   ;

extern S16 cmPkSctSetPriCfm (Pst *pst, SuId suId, UConnId suAssocId, SctResult result, SctCause cause)



                                                                ;

extern S16 cmPkSctHBeatReq (Pst *pst, SpId spId, UConnId spAssocId, CmNetAddr *dstNAddr, U16 intervalTime, SctStatus status)




                                                                 ;

extern S16 cmPkSctHBeatCfm (Pst *pst, SuId suId, UConnId suAssocId, CmNetAddr *dstNAddr, SctStatus status, SctResult result, SctCause cause)





                                                                ;

extern S16 cmPkSctDatReq (Pst *pst, SpId spId, UConnId spAssocId, CmNetAddr *dstNAddr, SctStrmId strmId, Bool unorderFlg, Bool nobundleFlg, U16 lifeTime, U32 protId, Buffer *mBuf)
                                                               ;

extern S16 cmPkSctDatInd (Pst *pst, SuId suId, UConnId suAssocId, SctStrmId strmId, SctDatIndType *indType, U32 protId, Buffer *mBuf)





                                                               ;

extern S16 cmPkSctStaReq (Pst *pst, SpId spId, UConnId spAssocId, CmNetAddr *dstNAddr, U8 staType)



                                                                  ;

extern S16 cmPkSctStaCfm (Pst *pst, SuId suId, UConnId suAssocId, CmNetAddr *dstNAddr, SctResult result, SctCause cause, SctStaInfo *staInfo)





                                                                  ;
extern S16 cmPkSctStaInd (Pst *pst, SuId suId, UConnId suAssocId, UConnId spAssocId, CmNetAddr *dstNAddr, SctStatus status, SctCause cause, Buffer *mBuf)






                                                      ;


extern S16 cmPkSctFlcInd (Pst *pst, SuId suId, UConnId suAssocId, Reason reason)


                                                                 ;


extern S16 cmUnpkSctBndReq (SctBndReq func, Pst *pst, Buffer *mBuf);

extern S16 cmUnpkSctBndCfm (SctBndCfm func, Pst *pst, Buffer *mBuf);

extern S16 cmUnpkSctEndpOpenReq (SctEndpOpenReq func, Pst *pst, Buffer *mBuf);

extern S16 cmUnpkSctEndpOpenCfm (SctEndpOpenCfm func, Pst *pst, Buffer *mBuf);

extern S16 cmUnpkSctEndpCloseReq (SctEndpCloseReq func, Pst *pst, Buffer *mBuf);

extern S16 cmUnpkSctEndpCloseCfm (SctEndpCloseCfm func, Pst *pst, Buffer *mBuf);

extern S16 cmUnpkSctAssocReq (SctAssocReq func, Pst *pst, Buffer *mBuf);

extern S16 cmUnpkSctAssocInd (SctAssocInd func, Pst *pst, Buffer *mBuf);

extern S16 cmUnpkSctAssocRsp (SctAssocRsp func, Pst *pst, Buffer *mBuf);

extern S16 cmUnpkSctAssocCfm (SctAssocCfm func, Pst *pst, Buffer *mBuf);

extern S16 cmUnpkSctTermReq (SctTermReq func, Pst *pst, Buffer *mBuf);

extern S16 cmUnpkSctTermInd (SctTermInd func, Pst *pst, Buffer *mBuf);

extern S16 cmUnpkSctTermCfm (SctTermCfm func, Pst *pst, Buffer *mBuf);

extern S16 cmUnpkSctSetPriReq (SctSetPriReq func, Pst *pst, Buffer *mBuf);

extern S16 cmUnpkSctSetPriCfm (SctSetPriCfm func, Pst *pst, Buffer *mBuf);

extern S16 cmUnpkSctHBeatReq (SctHBeatReq func, Pst *pst, Buffer *mBuf);

extern S16 cmUnpkSctHBeatCfm (SctHBeatCfm func, Pst *pst, Buffer *mBuf);

extern S16 cmUnpkSctDatReq (SctDatReq func, Pst *pst, Buffer *mBuf);

extern S16 cmUnpkSctDatInd (SctDatInd func, Pst *pst, Buffer *mBuf);

extern S16 cmUnpkSctStaReq (SctStaReq func, Pst *pst, Buffer *mBuf);

extern S16 cmUnpkSctStaCfm (SctStaCfm func, Pst *pst, Buffer *mBuf);

extern S16 cmUnpkSctStaInd (SctStaInd func, Pst *pst, Buffer *mBuf);

extern S16 cmUnpkSctFlcInd (SctFlcInd func, Pst *pst, Buffer *mBuf);


extern S16 cmPkSctNetAddrLst (SctNetAddrLst *pkParam, Buffer *mBuf);
extern S16 cmUnpkSctNetAddrLst (SctNetAddrLst *pkParam, Buffer *mBuf);
extern S16 CzLiSctBndReq (Pst *pst, SuId suId, SpId spId)

                                                               ;

extern S16 CzLiSctBndCfm (Pst *pst, SuId suId, SctResult result)

                                                                 ;
extern S16 CzLiSctEndpOpenReq (Pst *pst, SpId spId, UConnId suEndpId, SctPort port, CmNetAddr *intfNAddr)



                                                                    ;


extern S16 CzLiSctEndpOpenCfm (Pst *pst, SuId suId, UConnId suEndpId, UConnId spEndpId, SctResult result, SctCause cause)




                                                                ;

extern S16 CzLiSctEndpCloseReq (Pst *pst, SpId spId, UConnId endpId, U8 endpIdType)


                                                                     ;

extern S16 CzLiSctEndpCloseCfm (Pst *pst, SuId suId, UConnId suEndpId, SctResult result, SctCause cause)



                                                                ;
extern S16 CzLiSctAssocReq (Pst *pst, SpId spId, UConnId spEndpId, UConnId suAssocId, CmNetAddr *priDstNAddr, SctPort dstPort, SctStrmId outStrms, SctNetAddrLst *dstNAddrLst, SctNetAddrLst *srcNAddrLst, Buffer *vsInfo)
                                                                 ;




extern S16 CzLiSctAssocInd (Pst *pst, SuId suId, UConnId suEndpId, SctAssocIndParams *assocParams, Buffer *vsInfo)



                                                                     ;
extern S16 CzLiSctAssocRsp (Pst *pst, SpId spId, UConnId spEndpId, SctAssocIndParams *assocIndParams, SctResult result, Buffer *vsInfo)




                                                                     ;
extern S16 CzLiSctAssocCfm (Pst *pst, SuId suId, UConnId suAssocId, UConnId spAssocId, SctNetAddrLst *dstNAddrLst, SctPort dstPort, SctStrmId outStrms, Buffer *vsInfo)






                                                                 ;


extern S16 CzLiSctTermReq (Pst *pst, SpId spId, UConnId assocId, U8 assocIdType, Bool abrtFlg)



                                                                  ;

extern S16 CzLiSctTermInd (Pst *pst, SuId suId, UConnId assocId, U8 assocIdType, SctStatus status, SctCause cause, SctRtrvInfo *rtrvInfo)





                                                                   ;

extern S16 CzLiSctTermCfm (Pst *pst, SuId suId, UConnId suAssocId, SctResult result, SctCause cause)



                                                                ;
extern S16 CzLiSctSetPriReq (Pst *pst, SpId spId, UConnId spAssocId, CmNetAddr *dstNAddr)


                                                                   ;

extern S16 CzLiSctSetPriCfm (Pst *pst, SuId suId, UConnId suAssocId, SctResult result, SctCause cause)



                                                                ;

extern S16 CzLiSctHBeatReq (Pst *pst, SpId spId, UConnId spAssocId, CmNetAddr *dstNAddr, U16 intervalTime, SctStatus status)




                                                                 ;

extern S16 CzLiSctHBeatCfm (Pst *pst, SuId suId, UConnId suAssocId, CmNetAddr *dstNAddr, SctStatus status, SctResult result, SctCause cause)





                                                                ;
extern S16 CzLiSctStaCfm (Pst *pst, SuId suId, UConnId suAssocId, CmNetAddr *dstNAddr, SctResult result, SctCause cause, SctStaInfo *staInfo)





                                                                  ;
extern S16 CzLiSctStaReq (Pst *pst, SpId spId, UConnId spAssocId, CmNetAddr *dstNAddr, U8 staType )



                                                                   ;

extern S16 CzLiSctDatReq (Pst *pst, SpId spId, UConnId spAssocId, CmNetAddr *dstNAddr, SctStrmId strmId, Bool unorderFlg, Bool nobundleFlg, U16 lifeTime, U32 protId, Buffer *mBuf)
                                                               ;

extern S16 CzLiSctDatInd (Pst *pst, SuId suId, UConnId suAssocId, SctStrmId strmId, SctDatIndType *indType, U32 protId, Buffer *mBuf)





                                                               ;
extern S16 CzLiSctStaInd (Pst *pst, SuId suId, UConnId suAssocId, UConnId spAssocId, CmNetAddr *dstNAddr, SctStatus status, SctCause cause, Buffer *mBuf)






                                                               ;

extern S16 CzLiSctFlcInd (Pst *pst, SuId suId, UConnId suAssocId, Reason reason)


                                                                 ;


typedef enum enumCztCriticality
{
 CztCriticalityrejectEnum,
 CztCriticalityignoreEnum,
 CztCriticalitynotifyEnum
} EnumCztCriticality;
typedef TknU32 CztCriticality;


typedef enum enumCztPresence
{
 CztPresenceoptionalEnum,
 CztPresenceconditionalEnum,
 CztPresencemandatoryEnum
} EnumCztPresence;
typedef TknU32 CztPresence;


typedef TknU32 CztPrivIE_IDlocal;

typedef struct x2apPrivIE_ID
{
 TknU8 choice;
 union {
  CztPrivIE_IDlocal local;
 } val;
} CztPrivIE_ID;


typedef TknU32 CztProcedureCode;


typedef TknU32 CztProtIE_ID;


typedef enum enumCztTrgMsg
{
 CztTrgMsginitiating_messageEnum,
 CztTrgMsgsuccessful_outcomeEnum,
 CztTrgMsgunsuccessful_outcomeEnum
} EnumCztTrgMsg;
typedef TknU32 CztTrgMsg;


typedef TknStrBSXL CztABSInformFDDabs_pattern_info;

typedef enum enumCztABSInformFDDnumberOfCellSpecificAntennaPorts
{
 CztABSInformFDDnumberOfCellSpecificAntennaPortsoneEnum,
 CztABSInformFDDnumberOfCellSpecificAntennaPortstwoEnum,
 CztABSInformFDDnumberOfCellSpecificAntennaPortsfourEnum
} EnumCztABSInformFDDnumberOfCellSpecificAntennaPorts;
typedef TknU32 CztABSInformFDDnumberOfCellSpecificAntennaPorts;


typedef TknStrBSXL CztABSInformFDDmeasurement_subset;
typedef struct x2ap_ExtnABSInformFDD_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnABSInformFDD_ExtIEsCls;
typedef struct x2apProtExtnField_ABSInformFDD_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnABSInformFDD_ExtIEsCls extensionValue;
} CztProtExtnField_ABSInformFDD_ExtIEs;

typedef struct x2apProtExtnCont_ABSInformFDD_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_ABSInformFDD_ExtIEs *member;
}CztProtExtnCont_ABSInformFDD_ExtIEs;

typedef struct x2apABSInformFDD
{
 TknPres pres;
 CztABSInformFDDabs_pattern_info abs_pattern_info;
 CztABSInformFDDnumberOfCellSpecificAntennaPorts numberOfCellSpecificAntennaPorts;
 CztABSInformFDDmeasurement_subset measurement_subset;
 CztProtExtnCont_ABSInformFDD_ExtIEs iE_Extns;
} CztABSInformFDD;


typedef TknStrBSXL CztABSInformTDDabs_pattern_info;

typedef enum enumCztABSInformTDDnumberOfCellSpecificAntennaPorts
{
 CztABSInformTDDnumberOfCellSpecificAntennaPortsoneEnum,
 CztABSInformTDDnumberOfCellSpecificAntennaPortstwoEnum,
 CztABSInformTDDnumberOfCellSpecificAntennaPortsfourEnum
} EnumCztABSInformTDDnumberOfCellSpecificAntennaPorts;
typedef TknU32 CztABSInformTDDnumberOfCellSpecificAntennaPorts;


typedef TknStrBSXL CztABSInformTDDmeasurement_subset;
typedef struct x2ap_ExtnABSInformTDD_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnABSInformTDD_ExtIEsCls;
typedef struct x2apProtExtnField_ABSInformTDD_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnABSInformTDD_ExtIEsCls extensionValue;
} CztProtExtnField_ABSInformTDD_ExtIEs;

typedef struct x2apProtExtnCont_ABSInformTDD_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_ABSInformTDD_ExtIEs *member;
}CztProtExtnCont_ABSInformTDD_ExtIEs;

typedef struct x2apABSInformTDD
{
 TknPres pres;
 CztABSInformTDDabs_pattern_info abs_pattern_info;
 CztABSInformTDDnumberOfCellSpecificAntennaPorts numberOfCellSpecificAntennaPorts;
 CztABSInformTDDmeasurement_subset measurement_subset;
 CztProtExtnCont_ABSInformTDD_ExtIEs iE_Extns;
} CztABSInformTDD;

typedef struct x2apABSInform
{
 TknU8 choice;
 union {
  CztABSInformFDD fdd;
  CztABSInformTDD tdd;
 } val;
} CztABSInform;


typedef TknU32 CztDL_ABS_status;


typedef TknStrBSXL CztUsableABSInformFDDusable_abs_pattern_info;
typedef struct x2ap_ExtnUsableABSInformFDD_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnUsableABSInformFDD_ExtIEsCls;
typedef struct x2apProtExtnField_UsableABSInformFDD_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnUsableABSInformFDD_ExtIEsCls extensionValue;
} CztProtExtnField_UsableABSInformFDD_ExtIEs;

typedef struct x2apProtExtnCont_UsableABSInformFDD_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_UsableABSInformFDD_ExtIEs *member;
}CztProtExtnCont_UsableABSInformFDD_ExtIEs;

typedef struct x2apUsableABSInformFDD
{
 TknPres pres;
 CztUsableABSInformFDDusable_abs_pattern_info usable_abs_pattern_info;
 CztProtExtnCont_UsableABSInformFDD_ExtIEs iE_Extns;
} CztUsableABSInformFDD;


typedef TknStrBSXL CztUsableABSInformTDDusaable_abs_pattern_info;
typedef struct x2ap_ExtnUsableABSInformTDD_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnUsableABSInformTDD_ExtIEsCls;
typedef struct x2apProtExtnField_UsableABSInformTDD_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnUsableABSInformTDD_ExtIEsCls extensionValue;
} CztProtExtnField_UsableABSInformTDD_ExtIEs;

typedef struct x2apProtExtnCont_UsableABSInformTDD_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_UsableABSInformTDD_ExtIEs *member;
}CztProtExtnCont_UsableABSInformTDD_ExtIEs;

typedef struct x2apUsableABSInformTDD
{
 TknPres pres;
 CztUsableABSInformTDDusaable_abs_pattern_info usaable_abs_pattern_info;
 CztProtExtnCont_UsableABSInformTDD_ExtIEs iE_Extns;
} CztUsableABSInformTDD;

typedef struct x2apUsableABSInform
{
 TknU8 choice;
 union {
  CztUsableABSInformFDD fdd;
  CztUsableABSInformTDD tdd;
 } val;
} CztUsableABSInform;

typedef struct x2ap_ExtnABS_Status_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnABS_Status_ExtIEsCls;
typedef struct x2apProtExtnField_ABS_Status_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnABS_Status_ExtIEsCls extensionValue;
} CztProtExtnField_ABS_Status_ExtIEs;

typedef struct x2apProtExtnCont_ABS_Status_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_ABS_Status_ExtIEs *member;
}CztProtExtnCont_ABS_Status_ExtIEs;

typedef struct x2apABS_Status
{
 TknPres pres;
 CztDL_ABS_status dL_ABS_status;
 CztUsableABSInform usableABSInform;
 CztProtExtnCont_ABS_Status_ExtIEs iE_Extns;
} CztABS_Status;


typedef enum enumCztAdditionalSpecialSubframePatterns
{
 CztAdditionalSpecialSubframePatternsssp0Enum,
 CztAdditionalSpecialSubframePatternsssp1Enum,
 CztAdditionalSpecialSubframePatternsssp2Enum,
 CztAdditionalSpecialSubframePatternsssp3Enum,
 CztAdditionalSpecialSubframePatternsssp4Enum,
 CztAdditionalSpecialSubframePatternsssp5Enum,
 CztAdditionalSpecialSubframePatternsssp6Enum,
 CztAdditionalSpecialSubframePatternsssp7Enum,
 CztAdditionalSpecialSubframePatternsssp8Enum,
 CztAdditionalSpecialSubframePatternsssp9Enum
} EnumCztAdditionalSpecialSubframePatterns;
typedef TknU32 CztAdditionalSpecialSubframePatterns;


typedef enum enumCztCyclicPrefixDL
{
 CztCyclicPrefixDLnormalEnum,
 CztCyclicPrefixDLextendedEnum
} EnumCztCyclicPrefixDL;
typedef TknU32 CztCyclicPrefixDL;


typedef enum enumCztCyclicPrefixUL
{
 CztCyclicPrefixULnormalEnum,
 CztCyclicPrefixULextendedEnum
} EnumCztCyclicPrefixUL;
typedef TknU32 CztCyclicPrefixUL;

typedef struct x2ap_ExtnAdditionalSpecialSubframe_Info_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnAdditionalSpecialSubframe_Info_ExtIEsCls;
typedef struct x2apProtExtnField_AdditionalSpecialSubframe_Info_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnAdditionalSpecialSubframe_Info_ExtIEsCls extensionValue;
} CztProtExtnField_AdditionalSpecialSubframe_Info_ExtIEs;

typedef struct x2apProtExtnCont_AdditionalSpecialSubframe_Info_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_AdditionalSpecialSubframe_Info_ExtIEs *member;
}CztProtExtnCont_AdditionalSpecialSubframe_Info_ExtIEs;

typedef struct x2apAdditionalSpecialSubframe_Info
{
 TknPres pres;
 CztAdditionalSpecialSubframePatterns additionalspecialSubframePatterns;
 CztCyclicPrefixDL cyclicPrefixDL;
 CztCyclicPrefixUL cyclicPrefixUL;
 CztProtExtnCont_AdditionalSpecialSubframe_Info_ExtIEs iE_Extns;
} CztAdditionalSpecialSubframe_Info;


typedef TknStrBSXL CztKey_eNodeB_Star;

typedef TknU32 CztNextHopChainingCount;

typedef struct x2ap_ExtnAS_SecurInform_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnAS_SecurInform_ExtIEsCls;
typedef struct x2apProtExtnField_AS_SecurInform_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnAS_SecurInform_ExtIEsCls extensionValue;
} CztProtExtnField_AS_SecurInform_ExtIEs;

typedef struct x2apProtExtnCont_AS_SecurInform_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_AS_SecurInform_ExtIEs *member;
}CztProtExtnCont_AS_SecurInform_ExtIEs;

typedef struct x2apAS_SecurInform
{
 TknPres pres;
 CztKey_eNodeB_Star key_eNodeB_star;
 CztNextHopChainingCount nextHopChainingCount;
 CztProtExtnCont_AS_SecurInform_ExtIEs iE_Extns;
} CztAS_SecurInform;


typedef TknU32 CztPriorityLvl;


typedef enum enumCztPre_emptionCapblty
{
 CztPre_emptionCapbltyshall_not_trigger_pre_emptionEnum,
 CztPre_emptionCapbltymay_trigger_pre_emptionEnum
} EnumCztPre_emptionCapblty;
typedef TknU32 CztPre_emptionCapblty;


typedef enum enumCztPre_emptionVulnerability
{
 CztPre_emptionVulnerabilitynot_pre_emptableEnum,
 CztPre_emptionVulnerabilitypre_emptableEnum
} EnumCztPre_emptionVulnerability;
typedef TknU32 CztPre_emptionVulnerability;

typedef struct x2ap_ExtnAllocnAndRetentionPriority_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnAllocnAndRetentionPriority_ExtIEsCls;
typedef struct x2apProtExtnField_AllocnAndRetentionPriority_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnAllocnAndRetentionPriority_ExtIEsCls extensionValue;
} CztProtExtnField_AllocnAndRetentionPriority_ExtIEs;

typedef struct x2apProtExtnCont_AllocnAndRetentionPriority_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_AllocnAndRetentionPriority_ExtIEs *member;
}CztProtExtnCont_AllocnAndRetentionPriority_ExtIEs;

typedef struct x2apAllocnAndRetentionPriority
{
 TknPres pres;
 CztPriorityLvl priorityLvl;
 CztPre_emptionCapblty pre_emptionCapblty;
 CztPre_emptionVulnerability pre_emptionVulnerability;
 CztProtExtnCont_AllocnAndRetentionPriority_ExtIEs iE_Extns;
} CztAllocnAndRetentionPriority;


typedef TknStrOSXL CztPLMN_Identity;

typedef TknBStr32 CztEUTRANCellIdentifier;
typedef struct x2ap_ExtnECGI_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnECGI_ExtIEsCls;
typedef struct x2apProtExtnField_ECGI_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnECGI_ExtIEsCls extensionValue;
} CztProtExtnField_ECGI_ExtIEs;

typedef struct x2apProtExtnCont_ECGI_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_ECGI_ExtIEs *member;
}CztProtExtnCont_ECGI_ExtIEs;

typedef struct x2apECGI
{
 TknPres pres;
 CztPLMN_Identity pLMN_Identity;
 CztEUTRANCellIdentifier eUTRANcellIdentifier;
 CztProtExtnCont_ECGI_ExtIEs iE_Extns;
} CztECGI;

typedef struct x2apCellIdLstforMDT
{
 TknU16 noComp;
 CztECGI *member;
}CztCellIdLstforMDT;

typedef struct x2ap_ExtnCellBasedMDT_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnCellBasedMDT_ExtIEsCls;
typedef struct x2apProtExtnField_CellBasedMDT_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnCellBasedMDT_ExtIEsCls extensionValue;
} CztProtExtnField_CellBasedMDT_ExtIEs;

typedef struct x2apProtExtnCont_CellBasedMDT_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_CellBasedMDT_ExtIEs *member;
}CztProtExtnCont_CellBasedMDT_ExtIEs;

typedef struct x2apCellBasedMDT
{
 TknPres pres;
 CztCellIdLstforMDT cellIdLstforMDT;
 CztProtExtnCont_CellBasedMDT_ExtIEs iE_Extns;
} CztCellBasedMDT;


typedef TknStr4 CztTAC;
typedef struct x2apTALstforMDT
{
 TknU16 noComp;
 CztTAC *member;
}CztTALstforMDT;

typedef struct x2ap_ExtnTABasedMDT_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnTABasedMDT_ExtIEsCls;
typedef struct x2apProtExtnField_TABasedMDT_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnTABasedMDT_ExtIEsCls extensionValue;
} CztProtExtnField_TABasedMDT_ExtIEs;

typedef struct x2apProtExtnCont_TABasedMDT_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_TABasedMDT_ExtIEs *member;
}CztProtExtnCont_TABasedMDT_ExtIEs;

typedef struct x2apTABasedMDT
{
 TknPres pres;
 CztTALstforMDT tALstforMDT;
 CztProtExtnCont_TABasedMDT_ExtIEs iE_Extns;
} CztTABasedMDT;

typedef struct x2ap_ExtnTAI_Item_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnTAI_Item_ExtIEsCls;
typedef struct x2apProtExtnField_TAI_Item_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnTAI_Item_ExtIEsCls extensionValue;
} CztProtExtnField_TAI_Item_ExtIEs;

typedef struct x2apProtExtnCont_TAI_Item_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_TAI_Item_ExtIEs *member;
}CztProtExtnCont_TAI_Item_ExtIEs;

typedef struct x2apTAI_Item
{
 TknPres pres;
 CztTAC tAC;
 CztPLMN_Identity pLMN_Identity;
 CztProtExtnCont_TAI_Item_ExtIEs iE_Extns;
} CztTAI_Item;

typedef struct x2apTAILstforMDT
{
 TknU16 noComp;
 CztTAI_Item *member;
}CztTAILstforMDT;

typedef struct x2ap_ExtnTAIBasedMDT_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnTAIBasedMDT_ExtIEsCls;
typedef struct x2apProtExtnField_TAIBasedMDT_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnTAIBasedMDT_ExtIEsCls extensionValue;
} CztProtExtnField_TAIBasedMDT_ExtIEs;

typedef struct x2apProtExtnCont_TAIBasedMDT_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_TAIBasedMDT_ExtIEs *member;
}CztProtExtnCont_TAIBasedMDT_ExtIEs;

typedef struct x2apTAIBasedMDT
{
 TknPres pres;
 CztTAILstforMDT tAILstforMDT;
 CztProtExtnCont_TAIBasedMDT_ExtIEs iE_Extns;
} CztTAIBasedMDT;

typedef struct x2apAreaScopeOfMDT
{
 TknU8 choice;
 union {
  CztCellBasedMDT cellBased;
  CztTABasedMDT tABased;
  CztTAIBasedMDT tAIBased;
 } val;
} CztAreaScopeOfMDT;


typedef TknStrOSXL CztBitRate;

typedef struct x2apBroadcastPLMNs_Item
{
 TknU16 noComp;
 CztPLMN_Identity *member;
}CztBroadcastPLMNs_Item;


typedef TknU32 CztCapacityValue;


typedef TknU32 CztCellCapacityClassValue;


typedef enum enumCztCauseRadioNw
{
 CztCauseRadioNwhandover_desirable_for_radio_reasonsEnum,
 CztCauseRadioNwtime_critical_handoverEnum,
 CztCauseRadioNwresource_optimisation_handoverEnum,
 CztCauseRadioNwreduce_load_in_serving_cellEnum,
 CztCauseRadioNwpartial_handoverEnum,
 CztCauseRadioNwunknown_new_eNB_UE_X2AP_IDEnum,
 CztCauseRadioNwunknown_old_eNB_UE_X2AP_IDEnum,
 CztCauseRadioNwunknown_pair_of_UE_X2AP_IDEnum,
 CztCauseRadioNwho_target_not_allowedEnum,
 CztCauseRadioNwtx2relocoverall_expiryEnum,
 CztCauseRadioNwtrelocprep_expiryEnum,
 CztCauseRadioNwcell_not_availableEnum,
 CztCauseRadioNwno_radio_resources_available_in_target_cellEnum,
 CztCauseRadioNwinvalid_MME_GroupIDEnum,
 CztCauseRadioNwunknown_MME_CodeEnum,
 CztCauseRadioNwencryption_and_or_integrity_protection_algorithms_not_supportedEnum,
 CztCauseRadioNwreportCharacteristicsEmptyEnum,
 CztCauseRadioNwnoReportPeriodicityEnum,
 CztCauseRadioNwexistingMeasurementIDEnum,
 CztCauseRadioNwunknown_eNB_Measurement_IDEnum,
 CztCauseRadioNwmeasurement_temporarily_not_availableEnum,
 CztCauseRadioNwunspecifiedEnum,
 CztCauseRadioNwload_balancingEnum,
 CztCauseRadioNwhandover_optimisationEnum,
 CztCauseRadioNwvalue_out_of_allowed_rangeEnum,
 CztCauseRadioNwmultiple_E_RAB_ID_instancesEnum,
 CztCauseRadioNwswitch_off_ongoingEnum,
 CztCauseRadioNwnot_supported_QCI_valueEnum,
 CztCauseRadioNwmeasurement_not_supported_for_the_objectEnum
} EnumCztCauseRadioNw;
typedef TknU32 CztCauseRadioNw;


typedef enum enumCztCauseTport
{
 CztCauseTporttransport_resource_unavailableEnum,
 CztCauseTportunspecifiedEnum
} EnumCztCauseTport;
typedef TknU32 CztCauseTport;


typedef enum enumCztCauseProt
{
 CztCauseProttransfer_syntax_errorEnum,
 CztCauseProtabstract_syntax_error_rejectEnum,
 CztCauseProtabstract_syntax_error_ignore_and_notifyEnum,
 CztCauseProtmessage_not_compatible_with_receiver_stateEnum,
 CztCauseProtsemantic_errorEnum,
 CztCauseProtunspecifiedEnum,
 CztCauseProtabstract_syntax_error_falsely_constructed_messageEnum
} EnumCztCauseProt;
typedef TknU32 CztCauseProt;


typedef enum enumCztCauseMisc
{
 CztCauseMisccontrol_processing_overloadEnum,
 CztCauseMischardware_failureEnum,
 CztCauseMiscom_interventionEnum,
 CztCauseMiscnot_enough_user_plane_processing_resourcesEnum,
 CztCauseMiscunspecifiedEnum
} EnumCztCauseMisc;
typedef TknU32 CztCauseMisc;

typedef struct x2apCause
{
 TknU8 choice;
 union {
  CztCauseRadioNw radioNw;
  CztCauseTport transport;
  CztCauseProt protocol;
  CztCauseMisc misc;
 } val;
} CztCause;


typedef enum enumCztCell_Size
{
 CztCell_SizeverysmallEnum,
 CztCell_SizesmallEnum,
 CztCell_SizemediumEnum,
 CztCell_SizelargeEnum
} EnumCztCell_Size;
typedef TknU32 CztCell_Size;

typedef struct x2ap_ExtnCellTyp_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnCellTyp_ExtIEsCls;
typedef struct x2apProtExtnField_CellTyp_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnCellTyp_ExtIEsCls extensionValue;
} CztProtExtnField_CellTyp_ExtIEs;

typedef struct x2apProtExtnCont_CellTyp_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_CellTyp_ExtIEs *member;
}CztProtExtnCont_CellTyp_ExtIEs;

typedef struct x2apCellTyp
{
 TknPres pres;
 CztCell_Size cell_Size;
 CztProtExtnCont_CellTyp_ExtIEs iE_Extns;
} CztCellTyp;

typedef struct x2ap_ExtnCompositeAvailableCapacity_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnCompositeAvailableCapacity_ExtIEsCls;
typedef struct x2apProtExtnField_CompositeAvailableCapacity_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnCompositeAvailableCapacity_ExtIEsCls extensionValue;
} CztProtExtnField_CompositeAvailableCapacity_ExtIEs;

typedef struct x2apProtExtnCont_CompositeAvailableCapacity_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_CompositeAvailableCapacity_ExtIEs *member;
}CztProtExtnCont_CompositeAvailableCapacity_ExtIEs;

typedef struct x2apCompositeAvailableCapacity
{
 TknPres pres;
 CztCellCapacityClassValue cellCapacityClassValue;
 CztCapacityValue capacityValue;
 CztProtExtnCont_CompositeAvailableCapacity_ExtIEs iE_Extns;
} CztCompositeAvailableCapacity;

typedef struct x2ap_ExtnCompositeAvailableCapacityGroup_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnCompositeAvailableCapacityGroup_ExtIEsCls;
typedef struct x2apProtExtnField_CompositeAvailableCapacityGroup_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnCompositeAvailableCapacityGroup_ExtIEsCls extensionValue;
} CztProtExtnField_CompositeAvailableCapacityGroup_ExtIEs;

typedef struct x2apProtExtnCont_CompositeAvailableCapacityGroup_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_CompositeAvailableCapacityGroup_ExtIEs *member;
}CztProtExtnCont_CompositeAvailableCapacityGroup_ExtIEs;

typedef struct x2apCompositeAvailableCapacityGroup
{
 TknPres pres;
 CztCompositeAvailableCapacity dL_CompositeAvailableCapacity;
 CztCompositeAvailableCapacity uL_CompositeAvailableCapacity;
 CztProtExtnCont_CompositeAvailableCapacityGroup_ExtIEs iE_Extns;
} CztCompositeAvailableCapacityGroup;


typedef TknU32 CztPDCP_SN;


typedef TknU32 CztHFN;

typedef struct x2ap_ExtnCOUNTvalue_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnCOUNTvalue_ExtIEsCls;
typedef struct x2apProtExtnField_COUNTvalue_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnCOUNTvalue_ExtIEsCls extensionValue;
} CztProtExtnField_COUNTvalue_ExtIEs;

typedef struct x2apProtExtnCont_COUNTvalue_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_COUNTvalue_ExtIEs *member;
}CztProtExtnCont_COUNTvalue_ExtIEs;

typedef struct x2apCOUNTvalue
{
 TknPres pres;
 CztPDCP_SN pDCP_SN;
 CztHFN hFN;
 CztProtExtnCont_COUNTvalue_ExtIEs iE_Extns;
} CztCOUNTvalue;


typedef TknU32 CztPDCP_SNExtended;


typedef TknU32 CztHFNMdfd;

typedef struct x2ap_ExtnCOUNTValueExtended_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnCOUNTValueExtended_ExtIEsCls;
typedef struct x2apProtExtnField_COUNTValueExtended_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnCOUNTValueExtended_ExtIEsCls extensionValue;
} CztProtExtnField_COUNTValueExtended_ExtIEs;

typedef struct x2apProtExtnCont_COUNTValueExtended_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_COUNTValueExtended_ExtIEs *member;
}CztProtExtnCont_COUNTValueExtended_ExtIEs;

typedef struct x2apCOUNTValueExtended
{
 TknPres pres;
 CztPDCP_SNExtended pDCP_SNExtended;
 CztHFNMdfd hFNMdfd;
 CztProtExtnCont_COUNTValueExtended_ExtIEs iE_Extns;
} CztCOUNTValueExtended;


typedef enum enumCztTypOfErr
{
 CztTypOfErrnot_understoodEnum,
 CztTypOfErrmissingEnum
} EnumCztTypOfErr;
typedef TknU32 CztTypOfErr;

typedef struct x2ap_ExtnCriticalityDiag_IE_Lst_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnCriticalityDiag_IE_Lst_ExtIEsCls;
typedef struct x2apProtExtnField_CriticalityDiag_IE_Lst_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnCriticalityDiag_IE_Lst_ExtIEsCls extensionValue;
} CztProtExtnField_CriticalityDiag_IE_Lst_ExtIEs;

typedef struct x2apProtExtnCont_CriticalityDiag_IE_Lst_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_CriticalityDiag_IE_Lst_ExtIEs *member;
}CztProtExtnCont_CriticalityDiag_IE_Lst_ExtIEs;

typedef struct x2apCriticalityDiag_IE_LstMember
{
 TknPres pres;
 CztCriticality iECriticality;
 CztProtIE_ID iE_ID;
 CztTypOfErr typeOfErr;
 CztProtExtnCont_CriticalityDiag_IE_Lst_ExtIEs iE_Extns;
} CztCriticalityDiag_IE_LstMember;

typedef struct x2apCriticalityDiag_IE_Lst
{
 TknU16 noComp;
 CztCriticalityDiag_IE_LstMember *member;
}CztCriticalityDiag_IE_Lst;

typedef struct x2ap_ExtnCriticalityDiag_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnCriticalityDiag_ExtIEsCls;
typedef struct x2apProtExtnField_CriticalityDiag_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnCriticalityDiag_ExtIEsCls extensionValue;
} CztProtExtnField_CriticalityDiag_ExtIEs;

typedef struct x2apProtExtnCont_CriticalityDiag_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_CriticalityDiag_ExtIEs *member;
}CztProtExtnCont_CriticalityDiag_ExtIEs;

typedef struct x2apCriticalityDiag
{
 TknPres pres;
 CztProcedureCode procedureCode;
 CztTrgMsg triggeringMsg;
 CztCriticality procedureCriticality;
 CztCriticalityDiag_IE_Lst iEsCriticalityDiag;
 CztProtExtnCont_CriticalityDiag_ExtIEs iE_Extns;
} CztCriticalityDiag;


typedef TknBStr32 CztCRNTI;

typedef enum enumCztCSGMembershipStatus
{
 CztCSGMembershipStatusmemberEnum,
 CztCSGMembershipStatusnot_memberEnum
} EnumCztCSGMembershipStatus;
typedef TknU32 CztCSGMembershipStatus;


typedef TknBStr32 CztCSG_Id;

typedef enum enumCztDeactivationInd
{
 CztDeactivationInddeactivatedEnum
} EnumCztDeactivationInd;
typedef TknU32 CztDeactivationInd;


typedef enum enumCztDL_Fwding
{
 CztDL_FwdingdL_forwardingProposedEnum
} EnumCztDL_Fwding;
typedef TknU32 CztDL_Fwding;


typedef TknU32 CztDL_GBR_PRB_usage;


typedef TknU32 CztDL_non_GBR_PRB_usage;


typedef TknU32 CztDL_Total_PRB_usage;


typedef TknU32 CztEARFCN;


typedef TknU32 CztEARFCNExtn;


typedef enum enumCztTransmission_Bandwidth
{
 CztTransmission_Bandwidthbw6Enum,
 CztTransmission_Bandwidthbw15Enum,
 CztTransmission_Bandwidthbw25Enum,
 CztTransmission_Bandwidthbw50Enum,
 CztTransmission_Bandwidthbw75Enum,
 CztTransmission_Bandwidthbw100Enum
} EnumCztTransmission_Bandwidth;
typedef TknU32 CztTransmission_Bandwidth;

typedef struct x2ap_ExtnFDD_Info_ExtIEsCls{
 union {
  CztEARFCNExtn cztid_UL_EARFCNExtn;
  CztEARFCNExtn cztid_DL_EARFCNExtn;
 } u;
} Czt_ExtnFDD_Info_ExtIEsCls;
typedef struct x2apProtExtnField_FDD_Info_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnFDD_Info_ExtIEsCls extensionValue;
} CztProtExtnField_FDD_Info_ExtIEs;

typedef struct x2apProtExtnCont_FDD_Info_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_FDD_Info_ExtIEs *member;
}CztProtExtnCont_FDD_Info_ExtIEs;

typedef struct x2apFDD_Info
{
 TknPres pres;
 CztEARFCN uL_EARFCN;
 CztEARFCN dL_EARFCN;
 CztTransmission_Bandwidth uL_Transmission_Bandwidth;
 CztTransmission_Bandwidth dL_Transmission_Bandwidth;
 CztProtExtnCont_FDD_Info_ExtIEs iE_Extns;
} CztFDD_Info;


typedef enum enumCztSubframeAssignment
{
 CztSubframeAssignmentsa0Enum,
 CztSubframeAssignmentsa1Enum,
 CztSubframeAssignmentsa2Enum,
 CztSubframeAssignmentsa3Enum,
 CztSubframeAssignmentsa4Enum,
 CztSubframeAssignmentsa5Enum,
 CztSubframeAssignmentsa6Enum
} EnumCztSubframeAssignment;
typedef TknU32 CztSubframeAssignment;


typedef enum enumCztSpecialSubframePatterns
{
 CztSpecialSubframePatternsssp0Enum,
 CztSpecialSubframePatternsssp1Enum,
 CztSpecialSubframePatternsssp2Enum,
 CztSpecialSubframePatternsssp3Enum,
 CztSpecialSubframePatternsssp4Enum,
 CztSpecialSubframePatternsssp5Enum,
 CztSpecialSubframePatternsssp6Enum,
 CztSpecialSubframePatternsssp7Enum,
 CztSpecialSubframePatternsssp8Enum
} EnumCztSpecialSubframePatterns;
typedef TknU32 CztSpecialSubframePatterns;

typedef struct x2ap_ExtnSpecialSubframe_Info_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnSpecialSubframe_Info_ExtIEsCls;
typedef struct x2apProtExtnField_SpecialSubframe_Info_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnSpecialSubframe_Info_ExtIEsCls extensionValue;
} CztProtExtnField_SpecialSubframe_Info_ExtIEs;

typedef struct x2apProtExtnCont_SpecialSubframe_Info_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_SpecialSubframe_Info_ExtIEs *member;
}CztProtExtnCont_SpecialSubframe_Info_ExtIEs;

typedef struct x2apSpecialSubframe_Info
{
 TknPres pres;
 CztSpecialSubframePatterns specialSubframePatterns;
 CztCyclicPrefixDL cyclicPrefixDL;
 CztCyclicPrefixUL cyclicPrefixUL;
 CztProtExtnCont_SpecialSubframe_Info_ExtIEs iE_Extns;
} CztSpecialSubframe_Info;

typedef struct x2ap_ExtnTDD_Info_ExtIEsCls{
 union {
  CztAdditionalSpecialSubframe_Info cztAdditionalSpecialSubframe_Info;
  CztEARFCNExtn cztEARFCNExtn;
 } u;
} Czt_ExtnTDD_Info_ExtIEsCls;
typedef struct x2apProtExtnField_TDD_Info_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnTDD_Info_ExtIEsCls extensionValue;
} CztProtExtnField_TDD_Info_ExtIEs;

typedef struct x2apProtExtnCont_TDD_Info_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_TDD_Info_ExtIEs *member;
}CztProtExtnCont_TDD_Info_ExtIEs;

typedef struct x2apTDD_Info
{
 TknPres pres;
 CztEARFCN eARFCN;
 CztTransmission_Bandwidth transmission_Bandwidth;
 CztSubframeAssignment subframeAssignment;
 CztSpecialSubframe_Info specialSubframe_Info;
 CztProtExtnCont_TDD_Info_ExtIEs iE_Extns;
} CztTDD_Info;

typedef struct x2apEUTRA_Mode_Info
{
 TknU8 choice;
 union {
  CztFDD_Info fDD;
  CztTDD_Info tDD;
 } val;
} CztEUTRA_Mode_Info;


typedef TknBStr32 CztENB_IDmacro_eNB_ID;

typedef TknBStr32 CztENB_IDhome_eNB_ID;
typedef struct x2apENB_ID
{
 TknU8 choice;
 union {
  CztENB_IDmacro_eNB_ID macro_eNB_ID;
  CztENB_IDhome_eNB_ID home_eNB_ID;
 } val;
} CztENB_ID;


typedef TknBStr32 CztEncryptionAlgorithms;
typedef struct x2apEPLMNs
{
 TknU16 noComp;
 CztPLMN_Identity *member;
}CztEPLMNs;


typedef TknU32 CztE_RAB_ID;


typedef TknU32 CztQCI;

typedef struct x2ap_ExtnGBR_QosInform_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnGBR_QosInform_ExtIEsCls;
typedef struct x2apProtExtnField_GBR_QosInform_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnGBR_QosInform_ExtIEsCls extensionValue;
} CztProtExtnField_GBR_QosInform_ExtIEs;

typedef struct x2apProtExtnCont_GBR_QosInform_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_GBR_QosInform_ExtIEs *member;
}CztProtExtnCont_GBR_QosInform_ExtIEs;

typedef struct x2apGBR_QosInform
{
 TknPres pres;
 CztBitRate e_RAB_MaxBitrateDL;
 CztBitRate e_RAB_MaxBitrateUL;
 CztBitRate e_RAB_GuaranteedBitrateDL;
 CztBitRate e_RAB_GuaranteedBitrateUL;
 CztProtExtnCont_GBR_QosInform_ExtIEs iE_Extns;
} CztGBR_QosInform;

typedef struct x2ap_ExtnE_RAB_Lvl_QoS_Params_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnE_RAB_Lvl_QoS_Params_ExtIEsCls;
typedef struct x2apProtExtnField_E_RAB_Lvl_QoS_Params_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnE_RAB_Lvl_QoS_Params_ExtIEsCls extensionValue;
} CztProtExtnField_E_RAB_Lvl_QoS_Params_ExtIEs;

typedef struct x2apProtExtnCont_E_RAB_Lvl_QoS_Params_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_E_RAB_Lvl_QoS_Params_ExtIEs *member;
}CztProtExtnCont_E_RAB_Lvl_QoS_Params_ExtIEs;

typedef struct x2apE_RAB_Lvl_QoS_Params
{
 TknPres pres;
 CztQCI qCI;
 CztAllocnAndRetentionPriority allocationAndRetentionPriority;
 CztGBR_QosInform gbrQosInform;
 CztProtExtnCont_E_RAB_Lvl_QoS_Params_ExtIEs iE_Extns;
} CztE_RAB_Lvl_QoS_Params;

typedef struct x2ap_ExtnE_RAB_Item_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnE_RAB_Item_ExtIEsCls;
typedef struct x2apProtExtnField_E_RAB_Item_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnE_RAB_Item_ExtIEsCls extensionValue;
} CztProtExtnField_E_RAB_Item_ExtIEs;

typedef struct x2apProtExtnCont_E_RAB_Item_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_E_RAB_Item_ExtIEs *member;
}CztProtExtnCont_E_RAB_Item_ExtIEs;

typedef struct x2apE_RAB_Item
{
 TknPres pres;
 CztE_RAB_ID e_RAB_ID;
 CztCause cause;
 CztProtExtnCont_E_RAB_Item_ExtIEs iE_Extns;
} CztE_RAB_Item;

typedef struct x2ap_ValueE_RAB_ItemIEsCls{
 union {
  CztE_RAB_Item cztE_RAB_Item;
 } u;
} Czt_ValueE_RAB_ItemIEsCls;
typedef struct x2apProtIE_Field_E_RAB_ItemIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ValueE_RAB_ItemIEsCls value;
} CztProtIE_Field_E_RAB_ItemIEs;


typedef CztProtIE_Field_E_RAB_ItemIEs CztProtIE_Single_Cont_E_RAB_ItemIEs;
typedef struct x2apE_RAB_Lst
{
 TknU16 noComp;
 CztProtIE_Single_Cont_E_RAB_ItemIEs *member;
}CztE_RAB_Lst;


typedef TknStrOSXL CztEUTRANTraceID;

typedef enum enumCztEventTyp
{
 CztEventTypchange_of_serving_cellEnum
} EnumCztEventTyp;
typedef TknU32 CztEventTyp;


typedef enum enumCztForbiddenInterRATs
{
 CztForbiddenInterRATsallEnum,
 CztForbiddenInterRATsgeranEnum,
 CztForbiddenInterRATsutranEnum,
 CztForbiddenInterRATscdma2000Enum,
 CztForbiddenInterRATsgeranandutranEnum,
 CztForbiddenInterRATscdma2000andutranEnum
} EnumCztForbiddenInterRATs;
typedef TknU32 CztForbiddenInterRATs;

typedef struct x2apForbiddenTACs
{
 TknU16 noComp;
 CztTAC *member;
}CztForbiddenTACs;

typedef struct x2ap_ExtnForbiddenTAs_Item_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnForbiddenTAs_Item_ExtIEsCls;
typedef struct x2apProtExtnField_ForbiddenTAs_Item_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnForbiddenTAs_Item_ExtIEsCls extensionValue;
} CztProtExtnField_ForbiddenTAs_Item_ExtIEs;

typedef struct x2apProtExtnCont_ForbiddenTAs_Item_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_ForbiddenTAs_Item_ExtIEs *member;
}CztProtExtnCont_ForbiddenTAs_Item_ExtIEs;

typedef struct x2apForbiddenTAs_Item
{
 TknPres pres;
 CztPLMN_Identity pLMN_Identity;
 CztForbiddenTACs forbiddenTACs;
 CztProtExtnCont_ForbiddenTAs_Item_ExtIEs iE_Extns;
} CztForbiddenTAs_Item;

typedef struct x2apForbiddenTAs
{
 TknU16 noComp;
 CztForbiddenTAs_Item *member;
}CztForbiddenTAs;


typedef TknStr4 CztLAC;
typedef struct x2apForbiddenLACs
{
 TknU16 noComp;
 CztLAC *member;
}CztForbiddenLACs;

typedef struct x2ap_ExtnForbiddenLAs_Item_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnForbiddenLAs_Item_ExtIEsCls;
typedef struct x2apProtExtnField_ForbiddenLAs_Item_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnForbiddenLAs_Item_ExtIEsCls extensionValue;
} CztProtExtnField_ForbiddenLAs_Item_ExtIEs;

typedef struct x2apProtExtnCont_ForbiddenLAs_Item_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_ForbiddenLAs_Item_ExtIEs *member;
}CztProtExtnCont_ForbiddenLAs_Item_ExtIEs;

typedef struct x2apForbiddenLAs_Item
{
 TknPres pres;
 CztPLMN_Identity pLMN_Identity;
 CztForbiddenLACs forbiddenLACs;
 CztProtExtnCont_ForbiddenLAs_Item_ExtIEs iE_Extns;
} CztForbiddenLAs_Item;

typedef struct x2apForbiddenLAs
{
 TknU16 noComp;
 CztForbiddenLAs_Item *member;
}CztForbiddenLAs;


typedef TknBStr32 CztFourframes;

typedef TknU32 CztFreqBandIndicator;

typedef struct x2ap_ExtnGlobalENB_ID_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnGlobalENB_ID_ExtIEsCls;
typedef struct x2apProtExtnField_GlobalENB_ID_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnGlobalENB_ID_ExtIEsCls extensionValue;
} CztProtExtnField_GlobalENB_ID_ExtIEs;

typedef struct x2apProtExtnCont_GlobalENB_ID_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_GlobalENB_ID_ExtIEs *member;
}CztProtExtnCont_GlobalENB_ID_ExtIEs;

typedef struct x2apGlobalENB_ID
{
 TknPres pres;
 CztPLMN_Identity pLMN_Identity;
 CztENB_ID eNB_ID;
 CztProtExtnCont_GlobalENB_ID_ExtIEs iE_Extns;
} CztGlobalENB_ID;


typedef TknStrBSXL CztTportLyrAddr;

typedef TknStrOSXL CztGTP_TEI;
typedef struct x2ap_ExtnGTPtunnelEndpoint_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnGTPtunnelEndpoint_ExtIEsCls;
typedef struct x2apProtExtnField_GTPtunnelEndpoint_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnGTPtunnelEndpoint_ExtIEsCls extensionValue;
} CztProtExtnField_GTPtunnelEndpoint_ExtIEs;

typedef struct x2apProtExtnCont_GTPtunnelEndpoint_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_GTPtunnelEndpoint_ExtIEs *member;
}CztProtExtnCont_GTPtunnelEndpoint_ExtIEs;

typedef struct x2apGTPtunnelEndpoint
{
 TknPres pres;
 CztTportLyrAddr transportLyrAddr;
 CztGTP_TEI gTP_TEID;
 CztProtExtnCont_GTPtunnelEndpoint_ExtIEs iE_Extns;
} CztGTPtunnelEndpoint;


typedef TknStr4 CztMME_Group_ID;
typedef struct x2ap_ExtnGU_Group_ID_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnGU_Group_ID_ExtIEsCls;
typedef struct x2apProtExtnField_GU_Group_ID_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnGU_Group_ID_ExtIEsCls extensionValue;
} CztProtExtnField_GU_Group_ID_ExtIEs;

typedef struct x2apProtExtnCont_GU_Group_ID_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_GU_Group_ID_ExtIEs *member;
}CztProtExtnCont_GU_Group_ID_ExtIEs;

typedef struct x2apGU_Group_ID
{
 TknPres pres;
 CztPLMN_Identity pLMN_Identity;
 CztMME_Group_ID mME_Group_ID;
 CztProtExtnCont_GU_Group_ID_ExtIEs iE_Extns;
} CztGU_Group_ID;

typedef struct x2apGUGroupIDLst
{
 TknU16 noComp;
 CztGU_Group_ID *member;
}CztGUGroupIDLst;


typedef TknStr4 CztMME_Code;
typedef struct x2ap_ExtnGUMMEI_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnGUMMEI_ExtIEsCls;
typedef struct x2apProtExtnField_GUMMEI_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnGUMMEI_ExtIEsCls extensionValue;
} CztProtExtnField_GUMMEI_ExtIEs;

typedef struct x2apProtExtnCont_GUMMEI_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_GUMMEI_ExtIEs *member;
}CztProtExtnCont_GUMMEI_ExtIEs;

typedef struct x2apGUMMEI
{
 TknPres pres;
 CztGU_Group_ID gU_Group_ID;
 CztMME_Code mME_Code;
 CztProtExtnCont_GUMMEI_ExtIEs iE_Extns;
} CztGUMMEI;


typedef enum enumCztHovrReportTyp
{
 CztHovrReportTyphoTooEarlyEnum,
 CztHovrReportTyphoToWrongCellEnum,
 CztHovrReportTypinterRATpingpongEnum
} EnumCztHovrReportTyp;
typedef TknU32 CztHovrReportTyp;

typedef struct x2ap_ExtnHovrRestrnLst_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnHovrRestrnLst_ExtIEsCls;
typedef struct x2apProtExtnField_HovrRestrnLst_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnHovrRestrnLst_ExtIEsCls extensionValue;
} CztProtExtnField_HovrRestrnLst_ExtIEs;

typedef struct x2apProtExtnCont_HovrRestrnLst_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_HovrRestrnLst_ExtIEs *member;
}CztProtExtnCont_HovrRestrnLst_ExtIEs;

typedef struct x2apHovrRestrnLst
{
 TknPres pres;
 CztPLMN_Identity servingPLMN;
 CztEPLMNs equivalentPLMNs;
 CztForbiddenTAs forbiddenTAs;
 CztForbiddenLAs forbiddenLAs;
 CztForbiddenInterRATs forbiddenInterRATs;
 CztProtExtnCont_HovrRestrnLst_ExtIEs iE_Extns;
} CztHovrRestrnLst;


typedef enum enumCztLoadIndicator
{
 CztLoadIndicatorlowLoadEnum,
 CztLoadIndicatormediumLoadEnum,
 CztLoadIndicatorhighLoadEnum,
 CztLoadIndicatoroverLoadEnum
} EnumCztLoadIndicator;
typedef TknU32 CztLoadIndicator;

typedef struct x2ap_ExtnHWLoadIndicator_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnHWLoadIndicator_ExtIEsCls;
typedef struct x2apProtExtnField_HWLoadIndicator_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnHWLoadIndicator_ExtIEsCls extensionValue;
} CztProtExtnField_HWLoadIndicator_ExtIEs;

typedef struct x2apProtExtnCont_HWLoadIndicator_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_HWLoadIndicator_ExtIEs *member;
}CztProtExtnCont_HWLoadIndicator_ExtIEs;

typedef struct x2apHWLoadIndicator
{
 TknPres pres;
 CztLoadIndicator dLHWLoadIndicator;
 CztLoadIndicator uLHWLoadIndicator;
 CztProtExtnCont_HWLoadIndicator_ExtIEs iE_Extns;
} CztHWLoadIndicator;


typedef enum enumCztInvokeInd
{
 CztInvokeIndabs_informationEnum
} EnumCztInvokeInd;
typedef TknU32 CztInvokeInd;


typedef TknBStr32 CztIntegrityProtectionAlgorithms;

typedef TknBStr32 CztIntfsToTrace;

typedef TknU32 CztTime_UE_StayedInCell;


typedef TknU32 CztTime_UE_StayedInCell_EnhancedGranularity;

typedef struct x2ap_ExtnLastVisitedEUTRANCellInform_ExtIEsCls{
 union {
  CztTime_UE_StayedInCell_EnhancedGranularity cztTime_UE_StayedInCell_EnhancedGranularity;
  CztCause cztCause;
 } u;
} Czt_ExtnLastVisitedEUTRANCellInform_ExtIEsCls;
typedef struct x2apProtExtnField_LastVisitedEUTRANCellInform_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnLastVisitedEUTRANCellInform_ExtIEsCls extensionValue;
} CztProtExtnField_LastVisitedEUTRANCellInform_ExtIEs;

typedef struct x2apProtExtnCont_LastVisitedEUTRANCellInform_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_LastVisitedEUTRANCellInform_ExtIEs *member;
}CztProtExtnCont_LastVisitedEUTRANCellInform_ExtIEs;

typedef struct x2apLastVisitedEUTRANCellInform
{
 TknPres pres;
 CztECGI global_Cell_ID;
 CztCellTyp cellTyp;
 CztTime_UE_StayedInCell time_UE_StayedInCell;
 CztProtExtnCont_LastVisitedEUTRANCellInform_ExtIEs iE_Extns;
} CztLastVisitedEUTRANCellInform;


typedef TknStrOSXL CztLastVisitedUTRANCellInform;
typedef struct x2apLastVisitedGERANCellInform
{
 TknU8 choice;
} CztLastVisitedGERANCellInform;

typedef struct x2apLastVisitedCell_Item
{
 TknU8 choice;
 union {
  CztLastVisitedEUTRANCellInform e_UTRAN_Cell;
  CztLastVisitedUTRANCellInform uTRAN_Cell;
  CztLastVisitedGERANCellInform gERAN_Cell;
 } val;
} CztLastVisitedCell_Item;


typedef enum enumCztLinks_to_log
{
 CztLinks_to_loguplinkEnum,
 CztLinks_to_logdownlinkEnum,
 CztLinks_to_logboth_uplink_and_downlinkEnum
} EnumCztLinks_to_log;
typedef TknU32 CztLinks_to_log;


typedef enum enumCztReportArea
{
 CztReportAreaecgiEnum
} EnumCztReportArea;
typedef TknU32 CztReportArea;

typedef struct x2ap_ExtnLocRprtngInform_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnLocRprtngInform_ExtIEsCls;
typedef struct x2apProtExtnField_LocRprtngInform_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnLocRprtngInform_ExtIEsCls extensionValue;
} CztProtExtnField_LocRprtngInform_ExtIEs;

typedef struct x2apProtExtnCont_LocRprtngInform_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_LocRprtngInform_ExtIEs *member;
}CztProtExtnCont_LocRprtngInform_ExtIEs;

typedef struct x2apLocRprtngInform
{
 TknPres pres;
 CztEventTyp eventTyp;
 CztReportArea reportArea;
 CztProtExtnCont_LocRprtngInform_ExtIEs iE_Extns;
} CztLocRprtngInform;


typedef enum enumCztM3period
{
 CztM3periodms100Enum,
 CztM3periodms1000Enum,
 CztM3periodms10000Enum
} EnumCztM3period;
typedef TknU32 CztM3period;

typedef struct x2ap_ExtnM3Config_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnM3Config_ExtIEsCls;
typedef struct x2apProtExtnField_M3Config_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnM3Config_ExtIEsCls extensionValue;
} CztProtExtnField_M3Config_ExtIEs;

typedef struct x2apProtExtnCont_M3Config_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_M3Config_ExtIEs *member;
}CztProtExtnCont_M3Config_ExtIEs;

typedef struct x2apM3Config
{
 TknPres pres;
 CztM3period m3period;
 CztProtExtnCont_M3Config_ExtIEs iE_Extns;
} CztM3Config;


typedef enum enumCztM4period
{
 CztM4periodms1024Enum,
 CztM4periodms2048Enum,
 CztM4periodms5120Enum,
 CztM4periodms10240Enum,
 CztM4periodmin1Enum
} EnumCztM4period;
typedef TknU32 CztM4period;

typedef struct x2ap_ExtnM4Config_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnM4Config_ExtIEsCls;
typedef struct x2apProtExtnField_M4Config_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnM4Config_ExtIEsCls extensionValue;
} CztProtExtnField_M4Config_ExtIEs;

typedef struct x2apProtExtnCont_M4Config_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_M4Config_ExtIEs *member;
}CztProtExtnCont_M4Config_ExtIEs;

typedef struct x2apM4Config
{
 TknPres pres;
 CztM4period m4period;
 CztLinks_to_log m4_links_to_log;
 CztProtExtnCont_M4Config_ExtIEs iE_Extns;
} CztM4Config;


typedef enum enumCztM5period
{
 CztM5periodms1024Enum,
 CztM5periodms2048Enum,
 CztM5periodms5120Enum,
 CztM5periodms10240Enum,
 CztM5periodmin1Enum
} EnumCztM5period;
typedef TknU32 CztM5period;

typedef struct x2ap_ExtnM5Config_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnM5Config_ExtIEsCls;
typedef struct x2apProtExtnField_M5Config_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnM5Config_ExtIEsCls extensionValue;
} CztProtExtnField_M5Config_ExtIEs;

typedef struct x2apProtExtnCont_M5Config_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_M5Config_ExtIEs *member;
}CztProtExtnCont_M5Config_ExtIEs;

typedef struct x2apM5Config
{
 TknPres pres;
 CztM5period m5period;
 CztLinks_to_log m5_links_to_log;
 CztProtExtnCont_M5Config_ExtIEs iE_Extns;
} CztM5Config;


typedef enum enumCztMDT_Actvn
{
 CztMDT_Actvnimmediate_MDT_onlyEnum,
 CztMDT_Actvnimmediate_MDT_and_TraceEnum
} EnumCztMDT_Actvn;
typedef TknU32 CztMDT_Actvn;


typedef TknBStr32 CztMeasurementsToActivate;

typedef enum enumCztM1RprtngTrigger
{
 CztM1RprtngTriggerperiodicEnum,
 CztM1RprtngTriggera2eventtriggeredEnum,
 CztM1RprtngTriggera2eventtriggered_periodicEnum
} EnumCztM1RprtngTrigger;
typedef TknU32 CztM1RprtngTrigger;


typedef TknU32 CztThreshold_RSRP;


typedef TknU32 CztThreshold_RSRQ;

typedef struct x2apMeasurementThresholdA2
{
 TknU8 choice;
 union {
  CztThreshold_RSRP threshold_RSRP;
  CztThreshold_RSRQ threshold_RSRQ;
 } val;
} CztMeasurementThresholdA2;

typedef struct x2ap_ExtnM1ThresholdEventA2_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnM1ThresholdEventA2_ExtIEsCls;
typedef struct x2apProtExtnField_M1ThresholdEventA2_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnM1ThresholdEventA2_ExtIEsCls extensionValue;
} CztProtExtnField_M1ThresholdEventA2_ExtIEs;

typedef struct x2apProtExtnCont_M1ThresholdEventA2_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_M1ThresholdEventA2_ExtIEs *member;
}CztProtExtnCont_M1ThresholdEventA2_ExtIEs;

typedef struct x2apM1ThresholdEventA2
{
 TknPres pres;
 CztMeasurementThresholdA2 measurementThreshold;
 CztProtExtnCont_M1ThresholdEventA2_ExtIEs iE_Extns;
} CztM1ThresholdEventA2;


typedef enum enumCztReportIntervalMDT
{
 CztReportIntervalMDTms120Enum,
 CztReportIntervalMDTms240Enum,
 CztReportIntervalMDTms480Enum,
 CztReportIntervalMDTms640Enum,
 CztReportIntervalMDTms1024Enum,
 CztReportIntervalMDTms2048Enum,
 CztReportIntervalMDTms5120Enum,
 CztReportIntervalMDTms10240Enum,
 CztReportIntervalMDTmin1Enum,
 CztReportIntervalMDTmin6Enum,
 CztReportIntervalMDTmin12Enum,
 CztReportIntervalMDTmin30Enum,
 CztReportIntervalMDTmin60Enum
} EnumCztReportIntervalMDT;
typedef TknU32 CztReportIntervalMDT;


typedef enum enumCztReportAmountMDT
{
 CztReportAmountMDTr1Enum,
 CztReportAmountMDTr2Enum,
 CztReportAmountMDTr4Enum,
 CztReportAmountMDTr8Enum,
 CztReportAmountMDTr16Enum,
 CztReportAmountMDTr32Enum,
 CztReportAmountMDTr64Enum,
 CztReportAmountMDTrinfinityEnum
} EnumCztReportAmountMDT;
typedef TknU32 CztReportAmountMDT;

typedef struct x2ap_ExtnM1PeriodicRprtng_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnM1PeriodicRprtng_ExtIEsCls;
typedef struct x2apProtExtnField_M1PeriodicRprtng_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnM1PeriodicRprtng_ExtIEsCls extensionValue;
} CztProtExtnField_M1PeriodicRprtng_ExtIEs;

typedef struct x2apProtExtnCont_M1PeriodicRprtng_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_M1PeriodicRprtng_ExtIEs *member;
}CztProtExtnCont_M1PeriodicRprtng_ExtIEs;

typedef struct x2apM1PeriodicRprtng
{
 TknPres pres;
 CztReportIntervalMDT reportInterval;
 CztReportAmountMDT reportAmount;
 CztProtExtnCont_M1PeriodicRprtng_ExtIEs iE_Extns;
} CztM1PeriodicRprtng;


typedef TknBStr32 CztMDT_Loc_Info;
typedef struct x2apMDTPLMNLst
{
 TknU16 noComp;
 CztPLMN_Identity *member;
}CztMDTPLMNLst;

typedef struct x2ap_ExtnMDT_Config_ExtIEsCls{
 union {
  CztM3Config cztM3Config;
  CztM4Config cztM4Config;
  CztM5Config cztM5Config;
  CztMDT_Loc_Info cztMDT_Loc_Info;
  CztMDTPLMNLst cztMDTPLMNLst;
 } u;
} Czt_ExtnMDT_Config_ExtIEsCls;
typedef struct x2apProtExtnField_MDT_Config_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnMDT_Config_ExtIEsCls extensionValue;
} CztProtExtnField_MDT_Config_ExtIEs;

typedef struct x2apProtExtnCont_MDT_Config_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_MDT_Config_ExtIEs *member;
}CztProtExtnCont_MDT_Config_ExtIEs;

typedef struct x2apMDT_Config
{
 TknPres pres;
 CztMDT_Actvn mdt_Actvn;
 CztAreaScopeOfMDT areaScopeOfMDT;
 CztMeasurementsToActivate measurementsToActivate;
 CztM1RprtngTrigger m1reportingTrigger;
 CztM1ThresholdEventA2 m1thresholdeventA2;
 CztM1PeriodicRprtng m1periodicRprtng;
 CztProtExtnCont_MDT_Config_ExtIEs iE_Extns;
} CztMDT_Config;


typedef TknU32 CztMeasurement_ID;


typedef TknStr4 CztMBMS_Service_Area_Identity;
typedef struct x2apMBMS_Service_Area_Identity_Lst
{
 TknU16 noComp;
 CztMBMS_Service_Area_Identity *member;
}CztMBMS_Service_Area_Identity_Lst;


typedef enum enumCztRadioframeAllocnPeriod
{
 CztRadioframeAllocnPeriodn1Enum,
 CztRadioframeAllocnPeriodn2Enum,
 CztRadioframeAllocnPeriodn4Enum,
 CztRadioframeAllocnPeriodn8Enum,
 CztRadioframeAllocnPeriodn16Enum,
 CztRadioframeAllocnPeriodn32Enum
} EnumCztRadioframeAllocnPeriod;
typedef TknU32 CztRadioframeAllocnPeriod;


typedef TknU32 CztRadioframeAllocnOffset;


typedef TknBStr32 CztOneframe;
typedef struct x2apSubframeAllocn
{
 TknU8 choice;
 union {
  CztOneframe oneframe;
  CztFourframes fourframes;
 } val;
} CztSubframeAllocn;

typedef struct x2ap_ExtnMBSFN_Subframe_Info_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnMBSFN_Subframe_Info_ExtIEsCls;
typedef struct x2apProtExtnField_MBSFN_Subframe_Info_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnMBSFN_Subframe_Info_ExtIEsCls extensionValue;
} CztProtExtnField_MBSFN_Subframe_Info_ExtIEs;

typedef struct x2apProtExtnCont_MBSFN_Subframe_Info_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_MBSFN_Subframe_Info_ExtIEs *member;
}CztProtExtnCont_MBSFN_Subframe_Info_ExtIEs;

typedef struct x2apMBSFN_Subframe_Info
{
 TknPres pres;
 CztRadioframeAllocnPeriod radioframeAllocnPeriod;
 CztRadioframeAllocnOffset radioframeAllocnOffset;
 CztSubframeAllocn subframeAllocn;
 CztProtExtnCont_MBSFN_Subframe_Info_ExtIEs iE_Extns;
} CztMBSFN_Subframe_Info;

typedef struct x2apMBSFN_Subframe_Infolist
{
 TknU16 noComp;
 CztMBSFN_Subframe_Info *member;
}CztMBSFN_Subframe_Infolist;


typedef enum enumCztManagementBasedMDTallowed
{
 CztManagementBasedMDTallowedallowedEnum
} EnumCztManagementBasedMDTallowed;
typedef TknU32 CztManagementBasedMDTallowed;


typedef TknS32 CztMobilityParamsModificationRangehandoverTriggerChangeLowerLimit;


typedef TknS32 CztMobilityParamsModificationRangehandoverTriggerChangeUpperLimit;

typedef struct x2apMobilityParamsModificationRange
{
 TknPres pres;
 CztMobilityParamsModificationRangehandoverTriggerChangeLowerLimit handoverTriggerChangeLowerLimit;
 CztMobilityParamsModificationRangehandoverTriggerChangeUpperLimit handoverTriggerChangeUpperLimit;
} CztMobilityParamsModificationRange;


typedef TknS32 CztMobilityParamsInformhandoverTriggerChange;

typedef struct x2apMobilityParamsInform
{
 TknPres pres;
 CztMobilityParamsInformhandoverTriggerChange handoverTriggerChange;
} CztMobilityParamsInform;

typedef struct x2ap_ExtnBandInfo_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnBandInfo_ExtIEsCls;
typedef struct x2apProtExtnField_BandInfo_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnBandInfo_ExtIEsCls extensionValue;
} CztProtExtnField_BandInfo_ExtIEs;

typedef struct x2apProtExtnCont_BandInfo_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_BandInfo_ExtIEs *member;
}CztProtExtnCont_BandInfo_ExtIEs;

typedef struct x2apBandInfo
{
 TknPres pres;
 CztFreqBandIndicator freqBandIndicator;
 CztProtExtnCont_BandInfo_ExtIEs iE_Extns;
} CztBandInfo;

typedef struct x2apMultibandInfoLst
{
 TknU16 noComp;
 CztBandInfo *member;
}CztMultibandInfoLst;


typedef TknU32 CztPCI;

typedef struct x2ap_ExtnNeighbour_Inform_ExtIEsCls{
 union {
  CztTAC cztTAC;
  CztEARFCNExtn cztEARFCNExtn;
 } u;
} Czt_ExtnNeighbour_Inform_ExtIEsCls;
typedef struct x2apProtExtnField_Neighbour_Inform_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnNeighbour_Inform_ExtIEsCls extensionValue;
} CztProtExtnField_Neighbour_Inform_ExtIEs;

typedef struct x2apProtExtnCont_Neighbour_Inform_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_Neighbour_Inform_ExtIEs *member;
}CztProtExtnCont_Neighbour_Inform_ExtIEs;

typedef struct x2apNeighbour_InformMember
{
 TknPres pres;
 CztECGI eCGI;
 CztPCI pCI;
 CztEARFCN eARFCN;
 CztProtExtnCont_Neighbour_Inform_ExtIEs iE_Extns;
} CztNeighbour_InformMember;

typedef struct x2apNeighbour_Inform
{
 TknU16 noComp;
 CztNeighbour_InformMember *member;
}CztNeighbour_Inform;


typedef enum enumCztNumber_of_Antennaports
{
 CztNumber_of_Antennaportsan1Enum,
 CztNumber_of_Antennaportsan2Enum,
 CztNumber_of_Antennaportsan4Enum
} EnumCztNumber_of_Antennaports;
typedef TknU32 CztNumber_of_Antennaports;


typedef TknU32 CztPRACH_ConfigrootSequenceIdx;


typedef TknU32 CztPRACH_ConfigzeroCorrelationIdx;


typedef TknU8 CztPRACH_ConfighighSpeedFlag;


typedef TknU32 CztPRACH_Configprach_FreqOffset;


typedef TknU32 CztPRACH_Configprach_ConfigIdx;

typedef struct x2ap_ExtnPRACH_Config_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnPRACH_Config_ExtIEsCls;
typedef struct x2apProtExtnField_PRACH_Config_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnPRACH_Config_ExtIEsCls extensionValue;
} CztProtExtnField_PRACH_Config_ExtIEs;

typedef struct x2apProtExtnCont_PRACH_Config_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_PRACH_Config_ExtIEs *member;
}CztProtExtnCont_PRACH_Config_ExtIEs;

typedef struct x2apPRACH_Config
{
 TknPres pres;
 CztPRACH_ConfigrootSequenceIdx rootSequenceIdx;
 CztPRACH_ConfigzeroCorrelationIdx zeroCorrelationIdx;
 CztPRACH_ConfighighSpeedFlag highSpeedFlag;
 CztPRACH_Configprach_FreqOffset prach_FreqOffset;
 CztPRACH_Configprach_ConfigIdx prach_ConfigIdx;
 CztProtExtnCont_PRACH_Config_ExtIEs iE_Extns;
} CztPRACH_Config;


typedef TknU32 CztUL_GBR_PRB_usage;


typedef TknU32 CztUL_non_GBR_PRB_usage;


typedef TknU32 CztUL_Total_PRB_usage;

typedef struct x2ap_ExtnRadioResStatus_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnRadioResStatus_ExtIEsCls;
typedef struct x2apProtExtnField_RadioResStatus_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnRadioResStatus_ExtIEsCls extensionValue;
} CztProtExtnField_RadioResStatus_ExtIEs;

typedef struct x2apProtExtnCont_RadioResStatus_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_RadioResStatus_ExtIEs *member;
}CztProtExtnCont_RadioResStatus_ExtIEs;

typedef struct x2apRadioResStatus
{
 TknPres pres;
 CztDL_GBR_PRB_usage dL_GBR_PRB_usage;
 CztUL_GBR_PRB_usage uL_GBR_PRB_usage;
 CztDL_non_GBR_PRB_usage dL_non_GBR_PRB_usage;
 CztUL_non_GBR_PRB_usage uL_non_GBR_PRB_usage;
 CztDL_Total_PRB_usage dL_Total_PRB_usage;
 CztUL_Total_PRB_usage uL_Total_PRB_usage;
 CztProtExtnCont_RadioResStatus_ExtIEs iE_Extns;
} CztRadioResStatus;


typedef TknStrBSXL CztReceiveStatusofULPDCPSDUs;

typedef TknStrBSXL CztReceiveStatusOfULPDCPSDUsExtended;

typedef enum enumCztRegistration_Rqst
{
 CztRegistration_RqststartEnum,
 CztRegistration_RqststopEnum
} EnumCztRegistration_Rqst;
typedef TknU32 CztRegistration_Rqst;


typedef enum enumCztRNTP_Threshold
{
 CztRNTP_ThresholdminusInfinityEnum,
 CztRNTP_ThresholdminusElevenEnum,
 CztRNTP_ThresholdminusTenEnum,
 CztRNTP_ThresholdminusNineEnum,
 CztRNTP_ThresholdminusEightEnum,
 CztRNTP_ThresholdminusSevenEnum,
 CztRNTP_ThresholdminusSixEnum,
 CztRNTP_ThresholdminusFiveEnum,
 CztRNTP_ThresholdminusFourEnum,
 CztRNTP_ThresholdminusThreeEnum,
 CztRNTP_ThresholdminusTwoEnum,
 CztRNTP_ThresholdminusOneEnum,
 CztRNTP_ThresholdzeroEnum,
 CztRNTP_ThresholdoneEnum,
 CztRNTP_ThresholdtwoEnum,
 CztRNTP_ThresholdthreeEnum
} EnumCztRNTP_Threshold;
typedef TknU32 CztRNTP_Threshold;


typedef TknStrBSXL CztRelativeNarrowbandTxPowerrNTP_PerPRB;

typedef enum enumCztRelativeNarrowbandTxPowernumberOfCellSpecificAntennaPorts
{
 CztRelativeNarrowbandTxPowernumberOfCellSpecificAntennaPortsoneEnum,
 CztRelativeNarrowbandTxPowernumberOfCellSpecificAntennaPortstwoEnum,
 CztRelativeNarrowbandTxPowernumberOfCellSpecificAntennaPortsfourEnum
} EnumCztRelativeNarrowbandTxPowernumberOfCellSpecificAntennaPorts;
typedef TknU32 CztRelativeNarrowbandTxPowernumberOfCellSpecificAntennaPorts;


typedef TknU32 CztRelativeNarrowbandTxPowerp_B;


typedef TknU32 CztRelativeNarrowbandTxPowerpDCCH_InterferenceImpact;

typedef struct x2ap_ExtnRelativeNarrowbandTxPower_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnRelativeNarrowbandTxPower_ExtIEsCls;
typedef struct x2apProtExtnField_RelativeNarrowbandTxPower_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnRelativeNarrowbandTxPower_ExtIEsCls extensionValue;
} CztProtExtnField_RelativeNarrowbandTxPower_ExtIEs;

typedef struct x2apProtExtnCont_RelativeNarrowbandTxPower_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_RelativeNarrowbandTxPower_ExtIEs *member;
}CztProtExtnCont_RelativeNarrowbandTxPower_ExtIEs;

typedef struct x2apRelativeNarrowbandTxPower
{
 TknPres pres;
 CztRelativeNarrowbandTxPowerrNTP_PerPRB rNTP_PerPRB;
 CztRNTP_Threshold rNTP_Threshold;
 CztRelativeNarrowbandTxPowernumberOfCellSpecificAntennaPorts numberOfCellSpecificAntennaPorts;
 CztRelativeNarrowbandTxPowerp_B p_B;
 CztRelativeNarrowbandTxPowerpDCCH_InterferenceImpact pDCCH_InterferenceImpact;
 CztProtExtnCont_RelativeNarrowbandTxPower_ExtIEs iE_Extns;
} CztRelativeNarrowbandTxPower;


typedef TknBStr32 CztReportCharacteristics;

typedef TknStrOSXL CztRRC_Cntxt;

typedef enum enumCztRRCConnReestabIndicator
{
 CztRRCConnReestabIndicatorreconfigurationFailEnum,
 CztRRCConnReestabIndicatorhandoverFailEnum,
 CztRRCConnReestabIndicatorotherFailEnum
} EnumCztRRCConnReestabIndicator;
typedef TknU32 CztRRCConnReestabIndicator;


typedef enum enumCztRRCConnSetupIndicator
{
 CztRRCConnSetupIndicatorrrcConnSetupEnum
} EnumCztRRCConnSetupIndicator;
typedef TknU32 CztRRCConnSetupIndicator;

typedef struct x2ap_ExtnS1TNLLoadIndicator_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnS1TNLLoadIndicator_ExtIEsCls;
typedef struct x2apProtExtnField_S1TNLLoadIndicator_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnS1TNLLoadIndicator_ExtIEsCls extensionValue;
} CztProtExtnField_S1TNLLoadIndicator_ExtIEs;

typedef struct x2apProtExtnCont_S1TNLLoadIndicator_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_S1TNLLoadIndicator_ExtIEs *member;
}CztProtExtnCont_S1TNLLoadIndicator_ExtIEs;

typedef struct x2apS1TNLLoadIndicator
{
 TknPres pres;
 CztLoadIndicator dLS1TNLLoadIndicator;
 CztLoadIndicator uLS1TNLLoadIndicator;
 CztProtExtnCont_S1TNLLoadIndicator_ExtIEs iE_Extns;
} CztS1TNLLoadIndicator;

typedef struct x2ap_ExtnSrvdCell_Inform_ExtIEsCls{
 union {
  CztNumber_of_Antennaports cztNumber_of_Antennaports;
  CztPRACH_Config cztPRACH_Config;
  CztMBSFN_Subframe_Infolist cztMBSFN_Subframe_Infolist;
  CztCSG_Id cztCSG_Id;
  CztMBMS_Service_Area_Identity_Lst cztMBMS_Service_Area_Identity_Lst;
  CztMultibandInfoLst cztMultibandInfoLst;
 } u;
} Czt_ExtnSrvdCell_Inform_ExtIEsCls;
typedef struct x2apProtExtnField_SrvdCell_Inform_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnSrvdCell_Inform_ExtIEsCls extensionValue;
} CztProtExtnField_SrvdCell_Inform_ExtIEs;

typedef struct x2apProtExtnCont_SrvdCell_Inform_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_SrvdCell_Inform_ExtIEs *member;
}CztProtExtnCont_SrvdCell_Inform_ExtIEs;

typedef struct x2apSrvdCell_Inform
{
 TknPres pres;
 CztPCI pCI;
 CztECGI cellId;
 CztTAC tAC;
 CztBroadcastPLMNs_Item broadcastPLMNs;
 CztEUTRA_Mode_Info eUTRA_Mode_Info;
 CztProtExtnCont_SrvdCell_Inform_ExtIEs iE_Extns;
} CztSrvdCell_Inform;

typedef struct x2ap_ExtnSrvdCell_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnSrvdCell_ExtIEsCls;
typedef struct x2apProtExtnField_SrvdCell_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnSrvdCell_ExtIEsCls extensionValue;
} CztProtExtnField_SrvdCell_ExtIEs;

typedef struct x2apProtExtnCont_SrvdCell_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_SrvdCell_ExtIEs *member;
}CztProtExtnCont_SrvdCell_ExtIEs;

typedef struct x2apSrvdCellsMember
{
 TknPres pres;
 CztSrvdCell_Inform servedCellInfo;
 CztNeighbour_Inform neighbour_Info;
 CztProtExtnCont_SrvdCell_ExtIEs iE_Extns;
} CztSrvdCellsMember;

typedef struct x2apSrvdCells
{
 TknU16 noComp;
 CztSrvdCellsMember *member;
}CztSrvdCells;


typedef TknBStr32 CztShortMAC_I;

typedef enum enumCztSRVCCOperationPossible
{
 CztSRVCCOperationPossiblepossibleEnum
} EnumCztSRVCCOperationPossible;
typedef TknU32 CztSRVCCOperationPossible;


typedef TknU32 CztSubscriberProfileIDforRFP;


typedef TknStrOSXL CztTgetCellInUTRAN;

typedef TknStrOSXL CztTgeteNBtoSrc_eNBTprntCont;

typedef enum enumCztTimeToWait
{
 CztTimeToWaitv1sEnum,
 CztTimeToWaitv2sEnum,
 CztTimeToWaitv5sEnum,
 CztTimeToWaitv10sEnum,
 CztTimeToWaitv20sEnum,
 CztTimeToWaitv60sEnum
} EnumCztTimeToWait;
typedef TknU32 CztTimeToWait;


typedef enum enumCztTraceDepth
{
 CztTraceDepthminimumEnum,
 CztTraceDepthmediumEnum,
 CztTraceDepthmaximumEnum,
 CztTraceDepthminimumWithoutVendorSpecificExtnEnum,
 CztTraceDepthmediumWithoutVendorSpecificExtnEnum,
 CztTraceDepthmaximumWithoutVendorSpecificExtnEnum
} EnumCztTraceDepth;
typedef TknU32 CztTraceDepth;


typedef TknStrBSXL CztTraceCollectionEntityIPAddr;
typedef struct x2ap_ExtnTraceActvn_ExtIEsCls{
 union {
  CztMDT_Config cztMDT_Config;
 } u;
} Czt_ExtnTraceActvn_ExtIEsCls;
typedef struct x2apProtExtnField_TraceActvn_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnTraceActvn_ExtIEsCls extensionValue;
} CztProtExtnField_TraceActvn_ExtIEs;

typedef struct x2apProtExtnCont_TraceActvn_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_TraceActvn_ExtIEs *member;
}CztProtExtnCont_TraceActvn_ExtIEs;

typedef struct x2apTraceActvn
{
 TknPres pres;
 CztEUTRANTraceID eUTRANTraceID;
 CztIntfsToTrace interfacesToTrace;
 CztTraceDepth traceDepth;
 CztTraceCollectionEntityIPAddr traceCollectionEntityIPAddr;
 CztProtExtnCont_TraceActvn_ExtIEs iE_Extns;
} CztTraceActvn;

typedef struct x2apUE_HistoryInform
{
 TknU16 noComp;
 CztLastVisitedCell_Item *member;
}CztUE_HistoryInform;


typedef TknU32 CztUE_S1AP_ID;


typedef TknU32 CztUE_X2AP_ID;

typedef struct x2ap_ExtnUEAgg_MaxBitrate_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnUEAgg_MaxBitrate_ExtIEsCls;
typedef struct x2apProtExtnField_UEAgg_MaxBitrate_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnUEAgg_MaxBitrate_ExtIEsCls extensionValue;
} CztProtExtnField_UEAgg_MaxBitrate_ExtIEs;

typedef struct x2apProtExtnCont_UEAgg_MaxBitrate_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_UEAgg_MaxBitrate_ExtIEs *member;
}CztProtExtnCont_UEAgg_MaxBitrate_ExtIEs;

typedef struct x2apUEAggMaxBitRate
{
 TknPres pres;
 CztBitRate uEaggregateMaxBitRateDlnk;
 CztBitRate uEaggregateMaxBitRateUlnk;
 CztProtExtnCont_UEAgg_MaxBitrate_ExtIEs iE_Extns;
} CztUEAggMaxBitRate;

typedef struct x2ap_ExtnUESecurCapabilities_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnUESecurCapabilities_ExtIEsCls;
typedef struct x2apProtExtnField_UESecurCapabilities_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnUESecurCapabilities_ExtIEsCls extensionValue;
} CztProtExtnField_UESecurCapabilities_ExtIEs;

typedef struct x2apProtExtnCont_UESecurCapabilities_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_UESecurCapabilities_ExtIEs *member;
}CztProtExtnCont_UESecurCapabilities_ExtIEs;

typedef struct x2apUESecurCapabilities
{
 TknPres pres;
 CztEncryptionAlgorithms encryptionAlgorithms;
 CztIntegrityProtectionAlgorithms integrityProtectionAlgorithms;
 CztProtExtnCont_UESecurCapabilities_ExtIEs iE_Extns;
} CztUESecurCapabilities;


typedef enum enumCztUL_InterferenceOverloadInd_Item
{
 CztUL_InterferenceOverloadInd_Itemhigh_interferenceEnum,
 CztUL_InterferenceOverloadInd_Itemmedium_interferenceEnum,
 CztUL_InterferenceOverloadInd_Itemlow_interferenceEnum
} EnumCztUL_InterferenceOverloadInd_Item;
typedef TknU32 CztUL_InterferenceOverloadInd_Item;

typedef struct x2apUL_InterferenceOverloadInd
{
 TknU16 noComp;
 CztUL_InterferenceOverloadInd_Item *member;
}CztUL_InterferenceOverloadInd;


typedef TknStrBSXL CztUL_HighInterferenceInd;
typedef struct x2ap_ExtnUL_HighInterferenceIndInfo_Item_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnUL_HighInterferenceIndInfo_Item_ExtIEsCls;
typedef struct x2apProtExtnField_UL_HighInterferenceIndInfo_Item_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnUL_HighInterferenceIndInfo_Item_ExtIEsCls extensionValue;
} CztProtExtnField_UL_HighInterferenceIndInfo_Item_ExtIEs;

typedef struct x2apProtExtnCont_UL_HighInterferenceIndInfo_Item_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_UL_HighInterferenceIndInfo_Item_ExtIEs *member;
}CztProtExtnCont_UL_HighInterferenceIndInfo_Item_ExtIEs;

typedef struct x2apUL_HighInterferenceIndInfo_Item
{
 TknPres pres;
 CztECGI target_Cell_ID;
 CztUL_HighInterferenceInd ul_interferenceindication;
 CztProtExtnCont_UL_HighInterferenceIndInfo_Item_ExtIEs iE_Extns;
} CztUL_HighInterferenceIndInfo_Item;

typedef struct x2apUL_HighInterferenceIndInfo
{
 TknU16 noComp;
 CztUL_HighInterferenceIndInfo_Item *member;
}CztUL_HighInterferenceIndInfo;


typedef TknStrOSXL CztUE_RLF_Report_Cont;
typedef struct x2ap_ExtnE_RABs_ToBeSetup_ItemExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnE_RABs_ToBeSetup_ItemExtIEsCls;
typedef struct x2apProtExtnField_E_RABs_ToBeSetup_ItemExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnE_RABs_ToBeSetup_ItemExtIEsCls extensionValue;
} CztProtExtnField_E_RABs_ToBeSetup_ItemExtIEs;

typedef struct x2apProtExtnCont_E_RABs_ToBeSetup_ItemExtIEs
{
 TknU16 noComp;
 CztProtExtnField_E_RABs_ToBeSetup_ItemExtIEs *member;
}CztProtExtnCont_E_RABs_ToBeSetup_ItemExtIEs;

typedef struct x2apE_RABs_ToBeSetup_Item
{
 TknPres pres;
 CztE_RAB_ID e_RAB_ID;
 CztE_RAB_Lvl_QoS_Params e_RAB_Lvl_QoS_Params;
 CztDL_Fwding dL_Fwding;
 CztGTPtunnelEndpoint uL_GTPtunnelEndpoint;
 CztProtExtnCont_E_RABs_ToBeSetup_ItemExtIEs iE_Extns;
} CztE_RABs_ToBeSetup_Item;

typedef struct x2ap_ValueE_RABs_ToBeSetup_ItemIEsCls{
 union {
  CztE_RABs_ToBeSetup_Item cztE_RABs_ToBeSetup_Item;
 } u;
} Czt_ValueE_RABs_ToBeSetup_ItemIEsCls;
typedef struct x2apProtIE_Field_E_RABs_ToBeSetup_ItemIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ValueE_RABs_ToBeSetup_ItemIEsCls value;
} CztProtIE_Field_E_RABs_ToBeSetup_ItemIEs;


typedef CztProtIE_Field_E_RABs_ToBeSetup_ItemIEs CztProtIE_Single_Cont_E_RABs_ToBeSetup_ItemIEs;
typedef struct x2apE_RABs_ToBeSetup_Lst
{
 TknU16 noComp;
 CztProtIE_Single_Cont_E_RABs_ToBeSetup_ItemIEs *member;
}CztE_RABs_ToBeSetup_Lst;

typedef struct x2ap_ExtnUE_CntxtInform_ExtIEsCls{
 union {
  CztManagementBasedMDTallowed cztManagementBasedMDTallowed;
  CztMDTPLMNLst cztMDTPLMNLst;
 } u;
} Czt_ExtnUE_CntxtInform_ExtIEsCls;
typedef struct x2apProtExtnField_UE_CntxtInform_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnUE_CntxtInform_ExtIEsCls extensionValue;
} CztProtExtnField_UE_CntxtInform_ExtIEs;

typedef struct x2apProtExtnCont_UE_CntxtInform_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_UE_CntxtInform_ExtIEs *member;
}CztProtExtnCont_UE_CntxtInform_ExtIEs;

typedef struct x2apUE_CntxtInform
{
 TknPres pres;
 CztUE_S1AP_ID mME_UE_S1AP_ID;
 CztUESecurCapabilities uESecurCapabilities;
 CztAS_SecurInform aS_SecurInform;
 CztUEAggMaxBitRate uEaggregateMaxBitRate;
 CztSubscriberProfileIDforRFP subscriberProfileIDforRFP;
 CztE_RABs_ToBeSetup_Lst e_RABs_ToBeSetup_Lst;
 CztRRC_Cntxt rRC_Cntxt;
 CztHovrRestrnLst handoverRestrnLst;
 CztLocRprtngInform locationRprtngInform;
 CztProtExtnCont_UE_CntxtInform_ExtIEs iE_Extns;
} CztUE_CntxtInform;


typedef TknBStr32 CztMobilityInform;
typedef struct x2ap_ValueHovrRqst_IEsCls{
 union {
  CztUE_X2AP_ID cztUE_X2AP_ID;
  CztCause cztCause;
  CztECGI cztECGI;
  CztGUMMEI cztGUMMEI;
  CztUE_CntxtInform cztUE_CntxtInform;
  CztUE_HistoryInform cztUE_HistoryInform;
  CztTraceActvn cztTraceActvn;
  CztSRVCCOperationPossible cztSRVCCOperationPossible;
  CztCSGMembershipStatus cztCSGMembershipStatus;
  CztMobilityInform cztMobilityInform;
 } u;
} Czt_ValueHovrRqst_IEsCls;
typedef struct x2apProtIE_Field_HovrRqst_IEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ValueHovrRqst_IEsCls value;
} CztProtIE_Field_HovrRqst_IEs;

typedef struct x2apProtIE_Cont_HovrRqst_IEs
{
 TknU16 noComp;
 CztProtIE_Field_HovrRqst_IEs *member;
}CztProtIE_Cont_HovrRqst_IEs;

typedef struct x2apHovrRqst
{
 TknPres pres;
 CztProtIE_Cont_HovrRqst_IEs protocolIEs;
} CztHovrRqst;

typedef struct x2ap_ExtnE_RABs_Admtd_Item_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnE_RABs_Admtd_Item_ExtIEsCls;
typedef struct x2apProtExtnField_E_RABs_Admtd_Item_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnE_RABs_Admtd_Item_ExtIEsCls extensionValue;
} CztProtExtnField_E_RABs_Admtd_Item_ExtIEs;

typedef struct x2apProtExtnCont_E_RABs_Admtd_Item_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_E_RABs_Admtd_Item_ExtIEs *member;
}CztProtExtnCont_E_RABs_Admtd_Item_ExtIEs;

typedef struct x2apE_RABs_Admtd_Item
{
 TknPres pres;
 CztE_RAB_ID e_RAB_ID;
 CztGTPtunnelEndpoint uL_GTP_TunnelEndpoint;
 CztGTPtunnelEndpoint dL_GTP_TunnelEndpoint;
 CztProtExtnCont_E_RABs_Admtd_Item_ExtIEs iE_Extns;
} CztE_RABs_Admtd_Item;

typedef struct x2ap_ValueE_RABs_Admtd_ItemIEsCls{
 union {
  CztE_RABs_Admtd_Item cztE_RABs_Admtd_Item;
 } u;
} Czt_ValueE_RABs_Admtd_ItemIEsCls;
typedef struct x2apProtIE_Field_E_RABs_Admtd_ItemIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ValueE_RABs_Admtd_ItemIEsCls value;
} CztProtIE_Field_E_RABs_Admtd_ItemIEs;


typedef CztProtIE_Field_E_RABs_Admtd_ItemIEs CztProtIE_Single_Cont_E_RABs_Admtd_ItemIEs;
typedef struct x2apE_RABs_Admtd_Lst
{
 TknU16 noComp;
 CztProtIE_Single_Cont_E_RABs_Admtd_ItemIEs *member;
}CztE_RABs_Admtd_Lst;

typedef struct x2ap_ValueHovrRqstAckg_IEsCls{
 union {
  CztUE_X2AP_ID cztid_Old_eNB_UE_X2AP_ID;
  CztUE_X2AP_ID cztid_New_eNB_UE_X2AP_ID;
  CztE_RABs_Admtd_Lst cztE_RABs_Admtd_Lst;
  CztE_RAB_Lst cztE_RAB_Lst;
  CztTgeteNBtoSrc_eNBTprntCont cztTgeteNBtoSrc_eNBTprntCont;
  CztCriticalityDiag cztCriticalityDiag;
 } u;
} Czt_ValueHovrRqstAckg_IEsCls;
typedef struct x2apProtIE_Field_HovrRqstAckg_IEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ValueHovrRqstAckg_IEsCls value;
} CztProtIE_Field_HovrRqstAckg_IEs;

typedef struct x2apProtIE_Cont_HovrRqstAckg_IEs
{
 TknU16 noComp;
 CztProtIE_Field_HovrRqstAckg_IEs *member;
}CztProtIE_Cont_HovrRqstAckg_IEs;

typedef struct x2apHovrRqstAckg
{
 TknPres pres;
 CztProtIE_Cont_HovrRqstAckg_IEs protocolIEs;
} CztHovrRqstAckg;

typedef struct x2ap_ValueHovrPrepFail_IEsCls{
 union {
  CztUE_X2AP_ID cztUE_X2AP_ID;
  CztCause cztCause;
  CztCriticalityDiag cztCriticalityDiag;
 } u;
} Czt_ValueHovrPrepFail_IEsCls;
typedef struct x2apProtIE_Field_HovrPrepFail_IEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ValueHovrPrepFail_IEsCls value;
} CztProtIE_Field_HovrPrepFail_IEs;

typedef struct x2apProtIE_Cont_HovrPrepFail_IEs
{
 TknU16 noComp;
 CztProtIE_Field_HovrPrepFail_IEs *member;
}CztProtIE_Cont_HovrPrepFail_IEs;

typedef struct x2apHovrPrepFail
{
 TknPres pres;
 CztProtIE_Cont_HovrPrepFail_IEs protocolIEs;
} CztHovrPrepFail;

typedef struct x2ap_ValueHovrReport_IEsCls{
 union {
  CztHovrReportTyp cztHovrReportTyp;
  CztCause cztCause;
  CztECGI cztid_SrcCellECGI;
  CztECGI cztid_FailCellECGI;
  CztECGI cztid_Re_establishmentCellECGI;
  CztTgetCellInUTRAN cztTgetCellInUTRAN;
  CztCRNTI cztCRNTI;
  CztMobilityInform cztMobilityInform;
  CztUE_RLF_Report_Cont cztUE_RLF_Report_Cont;
 } u;
} Czt_ValueHovrReport_IEsCls;
typedef struct x2apProtIE_Field_HovrReport_IEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ValueHovrReport_IEsCls value;
} CztProtIE_Field_HovrReport_IEs;

typedef struct x2apProtIE_Cont_HovrReport_IEs
{
 TknU16 noComp;
 CztProtIE_Field_HovrReport_IEs *member;
}CztProtIE_Cont_HovrReport_IEs;

typedef struct x2apHovrReport
{
 TknPres pres;
 CztProtIE_Cont_HovrReport_IEs protocolIEs;
} CztHovrReport;

typedef struct x2ap_ExtnE_RABs_SubjToStatusTfr_ItemExtIEsCls{
 union {
  CztReceiveStatusOfULPDCPSDUsExtended cztReceiveStatusOfULPDCPSDUsExtended;
  CztCOUNTValueExtended cztid_ULCOUNTValueExtended;
  CztCOUNTValueExtended cztid_DLCOUNTValueExtended;
 } u;
} Czt_ExtnE_RABs_SubjToStatusTfr_ItemExtIEsCls;
typedef struct x2apProtExtnField_E_RABs_SubjToStatusTfr_ItemExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnE_RABs_SubjToStatusTfr_ItemExtIEsCls extensionValue;
} CztProtExtnField_E_RABs_SubjToStatusTfr_ItemExtIEs;

typedef struct x2apProtExtnCont_E_RABs_SubjToStatusTfr_ItemExtIEs
{
 TknU16 noComp;
 CztProtExtnField_E_RABs_SubjToStatusTfr_ItemExtIEs *member;
}CztProtExtnCont_E_RABs_SubjToStatusTfr_ItemExtIEs;

typedef struct x2apE_RABs_SubjToStatusTfr_Item
{
 TknPres pres;
 CztE_RAB_ID e_RAB_ID;
 CztReceiveStatusofULPDCPSDUs receiveStatusofULPDCPSDUs;
 CztCOUNTvalue uL_COUNTvalue;
 CztCOUNTvalue dL_COUNTvalue;
 CztProtExtnCont_E_RABs_SubjToStatusTfr_ItemExtIEs iE_Extns;
} CztE_RABs_SubjToStatusTfr_Item;

typedef struct x2ap_ValueE_RABs_SubjToStatusTfr_ItemIEsCls{
 union {
  CztE_RABs_SubjToStatusTfr_Item cztE_RABs_SubjToStatusTfr_Item;
 } u;
} Czt_ValueE_RABs_SubjToStatusTfr_ItemIEsCls;
typedef struct x2apProtIE_Field_E_RABs_SubjToStatusTfr_ItemIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ValueE_RABs_SubjToStatusTfr_ItemIEsCls value;
} CztProtIE_Field_E_RABs_SubjToStatusTfr_ItemIEs;


typedef CztProtIE_Field_E_RABs_SubjToStatusTfr_ItemIEs CztProtIE_Single_Cont_E_RABs_SubjToStatusTfr_ItemIEs;
typedef struct x2apE_RABs_SubjToStatusTfr_Lst
{
 TknU16 noComp;
 CztProtIE_Single_Cont_E_RABs_SubjToStatusTfr_ItemIEs *member;
}CztE_RABs_SubjToStatusTfr_Lst;

typedef struct x2ap_ValueSNStatusTfr_IEsCls{
 union {
  CztUE_X2AP_ID cztid_Old_eNB_UE_X2AP_ID;
  CztUE_X2AP_ID cztid_New_eNB_UE_X2AP_ID;
  CztE_RABs_SubjToStatusTfr_Lst cztE_RABs_SubjToStatusTfr_Lst;
 } u;
} Czt_ValueSNStatusTfr_IEsCls;
typedef struct x2apProtIE_Field_SNStatusTfr_IEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ValueSNStatusTfr_IEsCls value;
} CztProtIE_Field_SNStatusTfr_IEs;

typedef struct x2apProtIE_Cont_SNStatusTfr_IEs
{
 TknU16 noComp;
 CztProtIE_Field_SNStatusTfr_IEs *member;
}CztProtIE_Cont_SNStatusTfr_IEs;

typedef struct x2apSNStatusTfr
{
 TknPres pres;
 CztProtIE_Cont_SNStatusTfr_IEs protocolIEs;
} CztSNStatusTfr;

typedef struct x2ap_ValueUECntxtRls_IEsCls{
 union {
  CztUE_X2AP_ID cztid_Old_eNB_UE_X2AP_ID;
  CztUE_X2AP_ID cztid_New_eNB_UE_X2AP_ID;
 } u;
} Czt_ValueUECntxtRls_IEsCls;
typedef struct x2apProtIE_Field_UECntxtRls_IEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ValueUECntxtRls_IEsCls value;
} CztProtIE_Field_UECntxtRls_IEs;

typedef struct x2apProtIE_Cont_UECntxtRls_IEs
{
 TknU16 noComp;
 CztProtIE_Field_UECntxtRls_IEs *member;
}CztProtIE_Cont_UECntxtRls_IEs;

typedef struct x2apUECntxtRls
{
 TknPres pres;
 CztProtIE_Cont_UECntxtRls_IEs protocolIEs;
} CztUECntxtRls;

typedef struct x2ap_ValueHovrCancel_IEsCls{
 union {
  CztUE_X2AP_ID cztid_Old_eNB_UE_X2AP_ID;
  CztUE_X2AP_ID cztid_New_eNB_UE_X2AP_ID;
  CztCause cztCause;
 } u;
} Czt_ValueHovrCancel_IEsCls;
typedef struct x2apProtIE_Field_HovrCancel_IEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ValueHovrCancel_IEsCls value;
} CztProtIE_Field_HovrCancel_IEs;

typedef struct x2apProtIE_Cont_HovrCancel_IEs
{
 TknU16 noComp;
 CztProtIE_Field_HovrCancel_IEs *member;
}CztProtIE_Cont_HovrCancel_IEs;

typedef struct x2apHovrCancel
{
 TknPres pres;
 CztProtIE_Cont_HovrCancel_IEs protocolIEs;
} CztHovrCancel;

typedef struct x2ap_ValueErrInd_IEsCls{
 union {
  CztUE_X2AP_ID cztid_Old_eNB_UE_X2AP_ID;
  CztUE_X2AP_ID cztid_New_eNB_UE_X2AP_ID;
  CztCause cztCause;
  CztCriticalityDiag cztCriticalityDiag;
 } u;
} Czt_ValueErrInd_IEsCls;
typedef struct x2apProtIE_Field_ErrInd_IEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ValueErrInd_IEsCls value;
} CztProtIE_Field_ErrInd_IEs;

typedef struct x2apProtIE_Cont_ErrInd_IEs
{
 TknU16 noComp;
 CztProtIE_Field_ErrInd_IEs *member;
}CztProtIE_Cont_ErrInd_IEs;

typedef struct x2apErrInd
{
 TknPres pres;
 CztProtIE_Cont_ErrInd_IEs protocolIEs;
} CztErrInd;

typedef struct x2ap_ValueResetRqst_IEsCls{
 union {
  CztCause cztCause;
 } u;
} Czt_ValueResetRqst_IEsCls;
typedef struct x2apProtIE_Field_ResetRqst_IEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ValueResetRqst_IEsCls value;
} CztProtIE_Field_ResetRqst_IEs;

typedef struct x2apProtIE_Cont_ResetRqst_IEs
{
 TknU16 noComp;
 CztProtIE_Field_ResetRqst_IEs *member;
}CztProtIE_Cont_ResetRqst_IEs;

typedef struct x2apResetRqst
{
 TknPres pres;
 CztProtIE_Cont_ResetRqst_IEs protocolIEs;
} CztResetRqst;

typedef struct x2ap_ValueResetResp_IEsCls{
 union {
  CztCriticalityDiag cztCriticalityDiag;
 } u;
} Czt_ValueResetResp_IEsCls;
typedef struct x2apProtIE_Field_ResetResp_IEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ValueResetResp_IEsCls value;
} CztProtIE_Field_ResetResp_IEs;

typedef struct x2apProtIE_Cont_ResetResp_IEs
{
 TknU16 noComp;
 CztProtIE_Field_ResetResp_IEs *member;
}CztProtIE_Cont_ResetResp_IEs;

typedef struct x2apResetResp
{
 TknPres pres;
 CztProtIE_Cont_ResetResp_IEs protocolIEs;
} CztResetResp;

typedef struct x2ap_ValueX2SetupRqst_IEsCls{
 union {
  CztGlobalENB_ID cztGlobalENB_ID;
  CztSrvdCells cztSrvdCells;
  CztGUGroupIDLst cztGUGroupIDLst;
 } u;
} Czt_ValueX2SetupRqst_IEsCls;
typedef struct x2apProtIE_Field_X2SetupRqst_IEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ValueX2SetupRqst_IEsCls value;
} CztProtIE_Field_X2SetupRqst_IEs;

typedef struct x2apProtIE_Cont_X2SetupRqst_IEs
{
 TknU16 noComp;
 CztProtIE_Field_X2SetupRqst_IEs *member;
}CztProtIE_Cont_X2SetupRqst_IEs;

typedef struct x2apX2SetupRqst
{
 TknPres pres;
 CztProtIE_Cont_X2SetupRqst_IEs protocolIEs;
} CztX2SetupRqst;

typedef struct x2ap_ValueX2SetupResp_IEsCls{
 union {
  CztGlobalENB_ID cztGlobalENB_ID;
  CztSrvdCells cztSrvdCells;
  CztGUGroupIDLst cztGUGroupIDLst;
  CztCriticalityDiag cztCriticalityDiag;
 } u;
} Czt_ValueX2SetupResp_IEsCls;
typedef struct x2apProtIE_Field_X2SetupResp_IEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ValueX2SetupResp_IEsCls value;
} CztProtIE_Field_X2SetupResp_IEs;

typedef struct x2apProtIE_Cont_X2SetupResp_IEs
{
 TknU16 noComp;
 CztProtIE_Field_X2SetupResp_IEs *member;
}CztProtIE_Cont_X2SetupResp_IEs;

typedef struct x2apX2SetupResp
{
 TknPres pres;
 CztProtIE_Cont_X2SetupResp_IEs protocolIEs;
} CztX2SetupResp;

typedef struct x2ap_ValueX2SetupFail_IEsCls{
 union {
  CztCause cztCause;
  CztTimeToWait cztTimeToWait;
  CztCriticalityDiag cztCriticalityDiag;
 } u;
} Czt_ValueX2SetupFail_IEsCls;
typedef struct x2apProtIE_Field_X2SetupFail_IEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ValueX2SetupFail_IEsCls value;
} CztProtIE_Field_X2SetupFail_IEs;

typedef struct x2apProtIE_Cont_X2SetupFail_IEs
{
 TknU16 noComp;
 CztProtIE_Field_X2SetupFail_IEs *member;
}CztProtIE_Cont_X2SetupFail_IEs;

typedef struct x2apX2SetupFail
{
 TknPres pres;
 CztProtIE_Cont_X2SetupFail_IEs protocolIEs;
} CztX2SetupFail;

typedef struct x2ap_ExtnCellInform_Item_ExtIEsCls{
 union {
  CztABSInform cztABSInform;
  CztInvokeInd cztInvokeInd;
 } u;
} Czt_ExtnCellInform_Item_ExtIEsCls;
typedef struct x2apProtExtnField_CellInform_Item_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnCellInform_Item_ExtIEsCls extensionValue;
} CztProtExtnField_CellInform_Item_ExtIEs;

typedef struct x2apProtExtnCont_CellInform_Item_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_CellInform_Item_ExtIEs *member;
}CztProtExtnCont_CellInform_Item_ExtIEs;

typedef struct x2apCellInform_Item
{
 TknPres pres;
 CztECGI cell_ID;
 CztUL_InterferenceOverloadInd ul_InterferenceOverloadInd;
 CztUL_HighInterferenceIndInfo ul_HighInterferenceIndInfo;
 CztRelativeNarrowbandTxPower relativeNarrowbandTxPower;
 CztProtExtnCont_CellInform_Item_ExtIEs iE_Extns;
} CztCellInform_Item;

typedef struct x2ap_ValueCellInform_ItemIEsCls{
 union {
  CztCellInform_Item cztCellInform_Item;
 } u;
} Czt_ValueCellInform_ItemIEsCls;
typedef struct x2apProtIE_Field_CellInform_ItemIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ValueCellInform_ItemIEsCls value;
} CztProtIE_Field_CellInform_ItemIEs;


typedef CztProtIE_Field_CellInform_ItemIEs CztProtIE_Single_Cont_CellInform_ItemIEs;
typedef struct x2apCellInform_Lst
{
 TknU16 noComp;
 CztProtIE_Single_Cont_CellInform_ItemIEs *member;
}CztCellInform_Lst;

typedef struct x2ap_ValueLoadInform_IEsCls{
 union {
  CztCellInform_Lst cztCellInform_Lst;
 } u;
} Czt_ValueLoadInform_IEsCls;
typedef struct x2apProtIE_Field_LoadInform_IEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ValueLoadInform_IEsCls value;
} CztProtIE_Field_LoadInform_IEs;

typedef struct x2apProtIE_Cont_LoadInform_IEs
{
 TknU16 noComp;
 CztProtIE_Field_LoadInform_IEs *member;
}CztProtIE_Cont_LoadInform_IEs;

typedef struct x2apLoadInform
{
 TknPres pres;
 CztProtIE_Cont_LoadInform_IEs protocolIEs;
} CztLoadInform;

typedef struct x2ap_ExtnSrvdCellsToMdfy_Item_ExtIEsCls{
 union {
  CztDeactivationInd cztDeactivationInd;
 } u;
} Czt_ExtnSrvdCellsToMdfy_Item_ExtIEsCls;
typedef struct x2apProtExtnField_SrvdCellsToMdfy_Item_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnSrvdCellsToMdfy_Item_ExtIEsCls extensionValue;
} CztProtExtnField_SrvdCellsToMdfy_Item_ExtIEs;

typedef struct x2apProtExtnCont_SrvdCellsToMdfy_Item_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_SrvdCellsToMdfy_Item_ExtIEs *member;
}CztProtExtnCont_SrvdCellsToMdfy_Item_ExtIEs;

typedef struct x2apSrvdCellsToMdfy_Item
{
 TknPres pres;
 CztECGI old_ecgi;
 CztSrvdCell_Inform servedCellInfo;
 CztNeighbour_Inform neighbour_Info;
 CztProtExtnCont_SrvdCellsToMdfy_Item_ExtIEs iE_Extns;
} CztSrvdCellsToMdfy_Item;

typedef struct x2apSrvdCellsToMdfy
{
 TknU16 noComp;
 CztSrvdCellsToMdfy_Item *member;
}CztSrvdCellsToMdfy;

typedef struct x2apOld_ECGIs
{
 TknU16 noComp;
 CztECGI *member;
}CztOld_ECGIs;

typedef struct x2ap_ValueENBConfigUpd_IEsCls{
 union {
  CztSrvdCells cztSrvdCells;
  CztSrvdCellsToMdfy cztSrvdCellsToMdfy;
  CztOld_ECGIs cztOld_ECGIs;
  CztGUGroupIDLst cztid_GUGroupIDToAddLst;
  CztGUGroupIDLst cztid_GUGroupIDToDeleteLst;
 } u;
} Czt_ValueENBConfigUpd_IEsCls;
typedef struct x2apProtIE_Field_ENBConfigUpd_IEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ValueENBConfigUpd_IEsCls value;
} CztProtIE_Field_ENBConfigUpd_IEs;

typedef struct x2apProtIE_Cont_ENBConfigUpd_IEs
{
 TknU16 noComp;
 CztProtIE_Field_ENBConfigUpd_IEs *member;
}CztProtIE_Cont_ENBConfigUpd_IEs;

typedef struct x2apENBConfigUpd
{
 TknPres pres;
 CztProtIE_Cont_ENBConfigUpd_IEs protocolIEs;
} CztENBConfigUpd;

typedef struct x2ap_ValueENBConfigUpdAckg_IEsCls{
 union {
  CztCriticalityDiag cztCriticalityDiag;
 } u;
} Czt_ValueENBConfigUpdAckg_IEsCls;
typedef struct x2apProtIE_Field_ENBConfigUpdAckg_IEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ValueENBConfigUpdAckg_IEsCls value;
} CztProtIE_Field_ENBConfigUpdAckg_IEs;

typedef struct x2apProtIE_Cont_ENBConfigUpdAckg_IEs
{
 TknU16 noComp;
 CztProtIE_Field_ENBConfigUpdAckg_IEs *member;
}CztProtIE_Cont_ENBConfigUpdAckg_IEs;

typedef struct x2apENBConfigUpdAckg
{
 TknPres pres;
 CztProtIE_Cont_ENBConfigUpdAckg_IEs protocolIEs;
} CztENBConfigUpdAckg;

typedef struct x2ap_ValueENBConfigUpdFail_IEsCls{
 union {
  CztCause cztCause;
  CztTimeToWait cztTimeToWait;
  CztCriticalityDiag cztCriticalityDiag;
 } u;
} Czt_ValueENBConfigUpdFail_IEsCls;
typedef struct x2apProtIE_Field_ENBConfigUpdFail_IEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ValueENBConfigUpdFail_IEsCls value;
} CztProtIE_Field_ENBConfigUpdFail_IEs;

typedef struct x2apProtIE_Cont_ENBConfigUpdFail_IEs
{
 TknU16 noComp;
 CztProtIE_Field_ENBConfigUpdFail_IEs *member;
}CztProtIE_Cont_ENBConfigUpdFail_IEs;

typedef struct x2apENBConfigUpdFail
{
 TknPres pres;
 CztProtIE_Cont_ENBConfigUpdFail_IEs protocolIEs;
} CztENBConfigUpdFail;

typedef struct x2ap_ExtnCellToReport_Item_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnCellToReport_Item_ExtIEsCls;
typedef struct x2apProtExtnField_CellToReport_Item_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnCellToReport_Item_ExtIEsCls extensionValue;
} CztProtExtnField_CellToReport_Item_ExtIEs;

typedef struct x2apProtExtnCont_CellToReport_Item_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_CellToReport_Item_ExtIEs *member;
}CztProtExtnCont_CellToReport_Item_ExtIEs;

typedef struct x2apCellToReport_Item
{
 TknPres pres;
 CztECGI cell_ID;
 CztProtExtnCont_CellToReport_Item_ExtIEs iE_Extns;
} CztCellToReport_Item;

typedef struct x2ap_ValueCellToReport_ItemIEsCls{
 union {
  CztCellToReport_Item cztCellToReport_Item;
 } u;
} Czt_ValueCellToReport_ItemIEsCls;
typedef struct x2apProtIE_Field_CellToReport_ItemIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ValueCellToReport_ItemIEsCls value;
} CztProtIE_Field_CellToReport_ItemIEs;


typedef CztProtIE_Field_CellToReport_ItemIEs CztProtIE_Single_Cont_CellToReport_ItemIEs;
typedef struct x2apCellToReport_Lst
{
 TknU16 noComp;
 CztProtIE_Single_Cont_CellToReport_ItemIEs *member;
}CztCellToReport_Lst;


typedef enum enumCztRprtngPeriodicity
{
 CztRprtngPeriodicityone_thousand_msEnum,
 CztRprtngPeriodicitytwo_thousand_msEnum,
 CztRprtngPeriodicityfive_thousand_msEnum,
 CztRprtngPeriodicityten_thousand_msEnum
} EnumCztRprtngPeriodicity;
typedef TknU32 CztRprtngPeriodicity;


typedef enum enumCztPartialSuccessIndicator
{
 CztPartialSuccessIndicatorpartial_success_allowedEnum
} EnumCztPartialSuccessIndicator;
typedef TknU32 CztPartialSuccessIndicator;

typedef struct x2ap_ValueResStatusRqst_IEsCls{
 union {
  CztMeasurement_ID cztid_ENB1_Measurement_ID;
  CztMeasurement_ID cztid_ENB2_Measurement_ID;
  CztRegistration_Rqst cztRegistration_Rqst;
  CztReportCharacteristics cztReportCharacteristics;
  CztCellToReport_Lst cztCellToReport_Lst;
  CztRprtngPeriodicity cztRprtngPeriodicity;
  CztPartialSuccessIndicator cztPartialSuccessIndicator;
 } u;
} Czt_ValueResStatusRqst_IEsCls;
typedef struct x2apProtIE_Field_ResStatusRqst_IEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ValueResStatusRqst_IEsCls value;
} CztProtIE_Field_ResStatusRqst_IEs;

typedef struct x2apProtIE_Cont_ResStatusRqst_IEs
{
 TknU16 noComp;
 CztProtIE_Field_ResStatusRqst_IEs *member;
}CztProtIE_Cont_ResStatusRqst_IEs;

typedef struct x2apResStatusRqst
{
 TknPres pres;
 CztProtIE_Cont_ResStatusRqst_IEs protocolIEs;
} CztResStatusRqst;

typedef struct x2ap_ExtnMeasurementFailCause_Item_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnMeasurementFailCause_Item_ExtIEsCls;
typedef struct x2apProtExtnField_MeasurementFailCause_Item_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnMeasurementFailCause_Item_ExtIEsCls extensionValue;
} CztProtExtnField_MeasurementFailCause_Item_ExtIEs;

typedef struct x2apProtExtnCont_MeasurementFailCause_Item_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_MeasurementFailCause_Item_ExtIEs *member;
}CztProtExtnCont_MeasurementFailCause_Item_ExtIEs;

typedef struct x2apMeasurementFailCause_Item
{
 TknPres pres;
 CztReportCharacteristics measurementFailedReportCharacteristics;
 CztCause cause;
 CztProtExtnCont_MeasurementFailCause_Item_ExtIEs iE_Extns;
} CztMeasurementFailCause_Item;

typedef struct x2ap_ValueMeasurementFailCause_ItemIEsCls{
 union {
  CztMeasurementFailCause_Item cztMeasurementFailCause_Item;
 } u;
} Czt_ValueMeasurementFailCause_ItemIEsCls;
typedef struct x2apProtIE_Field_MeasurementFailCause_ItemIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ValueMeasurementFailCause_ItemIEsCls value;
} CztProtIE_Field_MeasurementFailCause_ItemIEs;


typedef CztProtIE_Field_MeasurementFailCause_ItemIEs CztProtIE_Single_Cont_MeasurementFailCause_ItemIEs;
typedef struct x2apMeasurementFailCause_Lst
{
 TknU16 noComp;
 CztProtIE_Single_Cont_MeasurementFailCause_ItemIEs *member;
}CztMeasurementFailCause_Lst;

typedef struct x2ap_ExtnMeasurementInitiationResult_Item_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnMeasurementInitiationResult_Item_ExtIEsCls;
typedef struct x2apProtExtnField_MeasurementInitiationResult_Item_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnMeasurementInitiationResult_Item_ExtIEsCls extensionValue;
} CztProtExtnField_MeasurementInitiationResult_Item_ExtIEs;

typedef struct x2apProtExtnCont_MeasurementInitiationResult_Item_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_MeasurementInitiationResult_Item_ExtIEs *member;
}CztProtExtnCont_MeasurementInitiationResult_Item_ExtIEs;

typedef struct x2apMeasurementInitiationResult_Item
{
 TknPres pres;
 CztECGI cell_ID;
 CztMeasurementFailCause_Lst measurementFailCause_Lst;
 CztProtExtnCont_MeasurementInitiationResult_Item_ExtIEs iE_Extns;
} CztMeasurementInitiationResult_Item;

typedef struct x2ap_ValueMeasurementInitiationResult_ItemIEsCls{
 union {
  CztMeasurementInitiationResult_Item cztMeasurementInitiationResult_Item;
 } u;
} Czt_ValueMeasurementInitiationResult_ItemIEsCls;
typedef struct x2apProtIE_Field_MeasurementInitiationResult_ItemIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ValueMeasurementInitiationResult_ItemIEsCls value;
} CztProtIE_Field_MeasurementInitiationResult_ItemIEs;


typedef CztProtIE_Field_MeasurementInitiationResult_ItemIEs CztProtIE_Single_Cont_MeasurementInitiationResult_ItemIEs;
typedef struct x2apMeasurementInitiationResult_Lst
{
 TknU16 noComp;
 CztProtIE_Single_Cont_MeasurementInitiationResult_ItemIEs *member;
}CztMeasurementInitiationResult_Lst;

typedef struct x2ap_ValueResStatusResp_IEsCls{
 union {
  CztMeasurement_ID cztid_ENB1_Measurement_ID;
  CztMeasurement_ID cztid_ENB2_Measurement_ID;
  CztCriticalityDiag cztCriticalityDiag;
  CztMeasurementInitiationResult_Lst cztMeasurementInitiationResult_Lst;
 } u;
} Czt_ValueResStatusResp_IEsCls;
typedef struct x2apProtIE_Field_ResStatusResp_IEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ValueResStatusResp_IEsCls value;
} CztProtIE_Field_ResStatusResp_IEs;

typedef struct x2apProtIE_Cont_ResStatusResp_IEs
{
 TknU16 noComp;
 CztProtIE_Field_ResStatusResp_IEs *member;
}CztProtIE_Cont_ResStatusResp_IEs;

typedef struct x2apResStatusResp
{
 TknPres pres;
 CztProtIE_Cont_ResStatusResp_IEs protocolIEs;
} CztResStatusResp;

typedef struct x2ap_ExtnCompleteFailCauseInform_Item_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnCompleteFailCauseInform_Item_ExtIEsCls;
typedef struct x2apProtExtnField_CompleteFailCauseInform_Item_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnCompleteFailCauseInform_Item_ExtIEsCls extensionValue;
} CztProtExtnField_CompleteFailCauseInform_Item_ExtIEs;

typedef struct x2apProtExtnCont_CompleteFailCauseInform_Item_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_CompleteFailCauseInform_Item_ExtIEs *member;
}CztProtExtnCont_CompleteFailCauseInform_Item_ExtIEs;

typedef struct x2apCompleteFailCauseInform_Item
{
 TknPres pres;
 CztECGI cell_ID;
 CztMeasurementFailCause_Lst measurementFailCause_Lst;
 CztProtExtnCont_CompleteFailCauseInform_Item_ExtIEs iE_Extns;
} CztCompleteFailCauseInform_Item;

typedef struct x2ap_ValueCompleteFailCauseInform_ItemIEsCls{
 union {
  CztCompleteFailCauseInform_Item cztCompleteFailCauseInform_Item;
 } u;
} Czt_ValueCompleteFailCauseInform_ItemIEsCls;
typedef struct x2apProtIE_Field_CompleteFailCauseInform_ItemIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ValueCompleteFailCauseInform_ItemIEsCls value;
} CztProtIE_Field_CompleteFailCauseInform_ItemIEs;


typedef CztProtIE_Field_CompleteFailCauseInform_ItemIEs CztProtIE_Single_Cont_CompleteFailCauseInform_ItemIEs;
typedef struct x2apCompleteFailCauseInform_Lst
{
 TknU16 noComp;
 CztProtIE_Single_Cont_CompleteFailCauseInform_ItemIEs *member;
}CztCompleteFailCauseInform_Lst;

typedef struct x2ap_ValueResStatusFail_IEsCls{
 union {
  CztMeasurement_ID cztid_ENB1_Measurement_ID;
  CztMeasurement_ID cztid_ENB2_Measurement_ID;
  CztCause cztCause;
  CztCriticalityDiag cztCriticalityDiag;
  CztCompleteFailCauseInform_Lst cztCompleteFailCauseInform_Lst;
 } u;
} Czt_ValueResStatusFail_IEsCls;
typedef struct x2apProtIE_Field_ResStatusFail_IEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ValueResStatusFail_IEsCls value;
} CztProtIE_Field_ResStatusFail_IEs;

typedef struct x2apProtIE_Cont_ResStatusFail_IEs
{
 TknU16 noComp;
 CztProtIE_Field_ResStatusFail_IEs *member;
}CztProtIE_Cont_ResStatusFail_IEs;

typedef struct x2apResStatusFail
{
 TknPres pres;
 CztProtIE_Cont_ResStatusFail_IEs protocolIEs;
} CztResStatusFail;

typedef struct x2ap_ExtnCellMeasurementResult_Item_ExtIEsCls{
 union {
  CztCompositeAvailableCapacityGroup cztCompositeAvailableCapacityGroup;
  CztABS_Status cztABS_Status;
 } u;
} Czt_ExtnCellMeasurementResult_Item_ExtIEsCls;
typedef struct x2apProtExtnField_CellMeasurementResult_Item_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnCellMeasurementResult_Item_ExtIEsCls extensionValue;
} CztProtExtnField_CellMeasurementResult_Item_ExtIEs;

typedef struct x2apProtExtnCont_CellMeasurementResult_Item_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_CellMeasurementResult_Item_ExtIEs *member;
}CztProtExtnCont_CellMeasurementResult_Item_ExtIEs;

typedef struct x2apCellMeasurementResult_Item
{
 TknPres pres;
 CztECGI cell_ID;
 CztHWLoadIndicator hWLoadIndicator;
 CztS1TNLLoadIndicator s1TNLLoadIndicator;
 CztRadioResStatus radioResStatus;
 CztProtExtnCont_CellMeasurementResult_Item_ExtIEs iE_Extns;
} CztCellMeasurementResult_Item;

typedef struct x2ap_ValueCellMeasurementResult_ItemIEsCls{
 union {
  CztCellMeasurementResult_Item cztCellMeasurementResult_Item;
 } u;
} Czt_ValueCellMeasurementResult_ItemIEsCls;
typedef struct x2apProtIE_Field_CellMeasurementResult_ItemIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ValueCellMeasurementResult_ItemIEsCls value;
} CztProtIE_Field_CellMeasurementResult_ItemIEs;


typedef CztProtIE_Field_CellMeasurementResult_ItemIEs CztProtIE_Single_Cont_CellMeasurementResult_ItemIEs;
typedef struct x2apCellMeasurementResult_Lst
{
 TknU16 noComp;
 CztProtIE_Single_Cont_CellMeasurementResult_ItemIEs *member;
}CztCellMeasurementResult_Lst;

typedef struct x2ap_ValueResStatusUpd_IEsCls{
 union {
  CztMeasurement_ID cztid_ENB1_Measurement_ID;
  CztMeasurement_ID cztid_ENB2_Measurement_ID;
  CztCellMeasurementResult_Lst cztCellMeasurementResult_Lst;
 } u;
} Czt_ValueResStatusUpd_IEsCls;
typedef struct x2apProtIE_Field_ResStatusUpd_IEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ValueResStatusUpd_IEsCls value;
} CztProtIE_Field_ResStatusUpd_IEs;

typedef struct x2apProtIE_Cont_ResStatusUpd_IEs
{
 TknU16 noComp;
 CztProtIE_Field_ResStatusUpd_IEs *member;
}CztProtIE_Cont_ResStatusUpd_IEs;

typedef struct x2apResStatusUpd
{
 TknPres pres;
 CztProtIE_Cont_ResStatusUpd_IEs protocolIEs;
} CztResStatusUpd;

typedef struct x2ap_ValuePrivMsg_IEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ValuePrivMsg_IEsCls;
typedef struct x2apPrivIE_Field_PrivMsg_IEs
{
 TknPres pres;
 CztPrivIE_ID id;
 CztCriticality criticality;
 Czt_ValuePrivMsg_IEsCls value;
} CztPrivIE_Field_PrivMsg_IEs;

typedef struct x2apPrivIE_Cont_PrivMsg_IEs
{
 TknU16 noComp;
 CztPrivIE_Field_PrivMsg_IEs *member;
}CztPrivIE_Cont_PrivMsg_IEs;

typedef struct x2apPrivMsg
{
 TknPres pres;
 CztPrivIE_Cont_PrivMsg_IEs privateIEs;
} CztPrivMsg;

typedef struct x2ap_ValueMobilityChangeRqst_IEsCls{
 union {
  CztECGI cztid_ENB1_Cell_ID;
  CztECGI cztid_ENB2_Cell_ID;
  CztMobilityParamsInform cztid_ENB1_Mobility_Params;
  CztMobilityParamsInform cztid_ENB2_Proposed_Mobility_Params;
  CztCause cztCause;
 } u;
} Czt_ValueMobilityChangeRqst_IEsCls;
typedef struct x2apProtIE_Field_MobilityChangeRqst_IEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ValueMobilityChangeRqst_IEsCls value;
} CztProtIE_Field_MobilityChangeRqst_IEs;

typedef struct x2apProtIE_Cont_MobilityChangeRqst_IEs
{
 TknU16 noComp;
 CztProtIE_Field_MobilityChangeRqst_IEs *member;
}CztProtIE_Cont_MobilityChangeRqst_IEs;

typedef struct x2apMobilityChangeRqst
{
 TknPres pres;
 CztProtIE_Cont_MobilityChangeRqst_IEs protocolIEs;
} CztMobilityChangeRqst;

typedef struct x2ap_ValueMobilityChangeAckg_IEsCls{
 union {
  CztECGI cztid_ENB1_Cell_ID;
  CztECGI cztid_ENB2_Cell_ID;
  CztCriticalityDiag cztCriticalityDiag;
 } u;
} Czt_ValueMobilityChangeAckg_IEsCls;
typedef struct x2apProtIE_Field_MobilityChangeAckg_IEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ValueMobilityChangeAckg_IEsCls value;
} CztProtIE_Field_MobilityChangeAckg_IEs;

typedef struct x2apProtIE_Cont_MobilityChangeAckg_IEs
{
 TknU16 noComp;
 CztProtIE_Field_MobilityChangeAckg_IEs *member;
}CztProtIE_Cont_MobilityChangeAckg_IEs;

typedef struct x2apMobilityChangeAckg
{
 TknPres pres;
 CztProtIE_Cont_MobilityChangeAckg_IEs protocolIEs;
} CztMobilityChangeAckg;

typedef struct x2ap_ValueMobilityChangeFail_IEsCls{
 union {
  CztECGI cztid_ENB1_Cell_ID;
  CztECGI cztid_ENB2_Cell_ID;
  CztCause cztCause;
  CztMobilityParamsModificationRange cztMobilityParamsModificationRange;
  CztCriticalityDiag cztCriticalityDiag;
 } u;
} Czt_ValueMobilityChangeFail_IEsCls;
typedef struct x2apProtIE_Field_MobilityChangeFail_IEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ValueMobilityChangeFail_IEsCls value;
} CztProtIE_Field_MobilityChangeFail_IEs;

typedef struct x2apProtIE_Cont_MobilityChangeFail_IEs
{
 TknU16 noComp;
 CztProtIE_Field_MobilityChangeFail_IEs *member;
}CztProtIE_Cont_MobilityChangeFail_IEs;

typedef struct x2apMobilityChangeFail
{
 TknPres pres;
 CztProtIE_Cont_MobilityChangeFail_IEs protocolIEs;
} CztMobilityChangeFail;

typedef struct x2ap_ValueRLFInd_IEsCls{
 union {
  CztPCI cztPCI;
  CztECGI cztECGI;
  CztCRNTI cztCRNTI;
  CztShortMAC_I cztShortMAC_I;
  CztUE_RLF_Report_Cont cztUE_RLF_Report_Cont;
  CztRRCConnSetupIndicator cztRRCConnSetupIndicator;
  CztRRCConnReestabIndicator cztRRCConnReestabIndicator;
 } u;
} Czt_ValueRLFInd_IEsCls;
typedef struct x2apProtIE_Field_RLFInd_IEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ValueRLFInd_IEsCls value;
} CztProtIE_Field_RLFInd_IEs;

typedef struct x2apProtIE_Cont_RLFInd_IEs
{
 TknU16 noComp;
 CztProtIE_Field_RLFInd_IEs *member;
}CztProtIE_Cont_RLFInd_IEs;

typedef struct x2apRLFInd
{
 TknPres pres;
 CztProtIE_Cont_RLFInd_IEs protocolIEs;
} CztRLFInd;

typedef struct x2ap_ExtnSrvdCellsToActivate_Item_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnSrvdCellsToActivate_Item_ExtIEsCls;
typedef struct x2apProtExtnField_SrvdCellsToActivate_Item_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnSrvdCellsToActivate_Item_ExtIEsCls extensionValue;
} CztProtExtnField_SrvdCellsToActivate_Item_ExtIEs;

typedef struct x2apProtExtnCont_SrvdCellsToActivate_Item_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_SrvdCellsToActivate_Item_ExtIEs *member;
}CztProtExtnCont_SrvdCellsToActivate_Item_ExtIEs;

typedef struct x2apSrvdCellsToActivate_Item
{
 TknPres pres;
 CztECGI ecgi;
 CztProtExtnCont_SrvdCellsToActivate_Item_ExtIEs iE_Extns;
} CztSrvdCellsToActivate_Item;

typedef struct x2apSrvdCellsToActivate
{
 TknU16 noComp;
 CztSrvdCellsToActivate_Item *member;
}CztSrvdCellsToActivate;

typedef struct x2ap_ValueCellActvnRqst_IEsCls{
 union {
  CztSrvdCellsToActivate cztSrvdCellsToActivate;
 } u;
} Czt_ValueCellActvnRqst_IEsCls;
typedef struct x2apProtIE_Field_CellActvnRqst_IEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ValueCellActvnRqst_IEsCls value;
} CztProtIE_Field_CellActvnRqst_IEs;

typedef struct x2apProtIE_Cont_CellActvnRqst_IEs
{
 TknU16 noComp;
 CztProtIE_Field_CellActvnRqst_IEs *member;
}CztProtIE_Cont_CellActvnRqst_IEs;

typedef struct x2apCellActvnRqst
{
 TknPres pres;
 CztProtIE_Cont_CellActvnRqst_IEs protocolIEs;
} CztCellActvnRqst;

typedef struct x2ap_ExtnActivatedCellLst_Item_ExtIEsCls{
 union {
  TknU8 unused;
 } u;
} Czt_ExtnActivatedCellLst_Item_ExtIEsCls;
typedef struct x2apProtExtnField_ActivatedCellLst_Item_ExtIEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ExtnActivatedCellLst_Item_ExtIEsCls extensionValue;
} CztProtExtnField_ActivatedCellLst_Item_ExtIEs;

typedef struct x2apProtExtnCont_ActivatedCellLst_Item_ExtIEs
{
 TknU16 noComp;
 CztProtExtnField_ActivatedCellLst_Item_ExtIEs *member;
}CztProtExtnCont_ActivatedCellLst_Item_ExtIEs;

typedef struct x2apActivatedCellLst_Item
{
 TknPres pres;
 CztECGI ecgi;
 CztProtExtnCont_ActivatedCellLst_Item_ExtIEs iE_Extns;
} CztActivatedCellLst_Item;

typedef struct x2apActivatedCellLst
{
 TknU16 noComp;
 CztActivatedCellLst_Item *member;
}CztActivatedCellLst;

typedef struct x2ap_ValueCellActvnResp_IEsCls{
 union {
  CztActivatedCellLst cztActivatedCellLst;
  CztCriticalityDiag cztCriticalityDiag;
 } u;
} Czt_ValueCellActvnResp_IEsCls;
typedef struct x2apProtIE_Field_CellActvnResp_IEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ValueCellActvnResp_IEsCls value;
} CztProtIE_Field_CellActvnResp_IEs;

typedef struct x2apProtIE_Cont_CellActvnResp_IEs
{
 TknU16 noComp;
 CztProtIE_Field_CellActvnResp_IEs *member;
}CztProtIE_Cont_CellActvnResp_IEs;

typedef struct x2apCellActvnResp
{
 TknPres pres;
 CztProtIE_Cont_CellActvnResp_IEs protocolIEs;
} CztCellActvnResp;

typedef struct x2ap_ValueCellActvnFail_IEsCls{
 union {
  CztCause cztCause;
  CztCriticalityDiag cztCriticalityDiag;
 } u;
} Czt_ValueCellActvnFail_IEsCls;
typedef struct x2apProtIE_Field_CellActvnFail_IEs
{
 TknPres pres;
 CztProtIE_ID id;
 CztCriticality criticality;
 Czt_ValueCellActvnFail_IEsCls value;
} CztProtIE_Field_CellActvnFail_IEs;

typedef struct x2apProtIE_Cont_CellActvnFail_IEs
{
 TknU16 noComp;
 CztProtIE_Field_CellActvnFail_IEs *member;
}CztProtIE_Cont_CellActvnFail_IEs;

typedef struct x2apCellActvnFail
{
 TknPres pres;
 CztProtIE_Cont_CellActvnFail_IEs protocolIEs;
} CztCellActvnFail;

typedef struct x2ap_InitiatingMsgCls{
 union {
  CztHovrRqst cztHovrRqst;
  CztResetRqst cztResetRqst;
  CztX2SetupRqst cztX2SetupRqst;
  CztResStatusRqst cztResStatusRqst;
  CztENBConfigUpd cztENBConfigUpd;
  CztMobilityChangeRqst cztMobilityChangeRqst;
  CztCellActvnRqst cztCellActvnRqst;
  CztSNStatusTfr cztSNStatusTfr;
  CztUECntxtRls cztUECntxtRls;
  CztHovrCancel cztHovrCancel;
  CztErrInd cztErrInd;
  CztResStatusUpd cztResStatusUpd;
  CztLoadInform cztLoadInform;
  CztPrivMsg cztPrivMsg;
  CztRLFInd cztRLFInd;
  CztHovrReport cztHovrReport;
 } u;
} Czt_InitiatingMsgCls;
typedef struct x2apInitiatingMsg
{
 TknPres pres;
 CztProcedureCode procedureCode;
 CztCriticality criticality;
 Czt_InitiatingMsgCls value;
} CztInitiatingMsg;

typedef struct x2ap_SuccessfulOutcomeCls{
 union {
  CztHovrRqstAckg cztHovrRqstAckg;
  CztResetResp cztResetResp;
  CztX2SetupResp cztX2SetupResp;
  CztResStatusResp cztResStatusResp;
  CztENBConfigUpdAckg cztENBConfigUpdAckg;
  CztMobilityChangeAckg cztMobilityChangeAckg;
  CztCellActvnResp cztCellActvnResp;
 } u;
} Czt_SuccessfulOutcomeCls;
typedef struct x2apSuccessfulOutcome
{
 TknPres pres;
 CztProcedureCode procedureCode;
 CztCriticality criticality;
 Czt_SuccessfulOutcomeCls value;
} CztSuccessfulOutcome;

typedef struct x2ap_UnsuccessfulOutcomeCls{
 union {
  CztHovrPrepFail cztHovrPrepFail;
  CztX2SetupFail cztX2SetupFail;
  CztResStatusFail cztResStatusFail;
  CztENBConfigUpdFail cztENBConfigUpdFail;
  CztMobilityChangeFail cztMobilityChangeFail;
  CztCellActvnFail cztCellActvnFail;
 } u;
} Czt_UnsuccessfulOutcomeCls;
typedef struct x2apUnsuccessfulOutcome
{
 TknPres pres;
 CztProcedureCode procedureCode;
 CztCriticality criticality;
 Czt_UnsuccessfulOutcomeCls value;
} CztUnsuccessfulOutcome;

typedef struct x2apX2AP_PDU
{
 TknU8 choice;
 union {
  CztInitiatingMsg initiatingMsg;
  CztSuccessfulOutcome successfulOutcome;
  CztUnsuccessfulOutcome unsuccessfulOutcome;
 } val;
} CztX2AP_PDU;
extern S16 cmPkCztPrivIE_ID (CztPrivIE_ID *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnABSInformFDD_ExtIEsCls (Czt_ExtnABSInformFDD_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_ABSInformFDD_ExtIEs (CztProtExtnField_ABSInformFDD_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_ABSInformFDD_ExtIEs (CztProtExtnCont_ABSInformFDD_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztABSInformFDD (CztABSInformFDD *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnABSInformTDD_ExtIEsCls (Czt_ExtnABSInformTDD_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_ABSInformTDD_ExtIEs (CztProtExtnField_ABSInformTDD_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_ABSInformTDD_ExtIEs (CztProtExtnCont_ABSInformTDD_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztABSInformTDD (CztABSInformTDD *param, Buffer *mBuf);
extern S16 cmPkCztABSInform (CztABSInform *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnUsableABSInformFDD_ExtIEsCls (Czt_ExtnUsableABSInformFDD_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_UsableABSInformFDD_ExtIEs (CztProtExtnField_UsableABSInformFDD_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_UsableABSInformFDD_ExtIEs (CztProtExtnCont_UsableABSInformFDD_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztUsableABSInformFDD (CztUsableABSInformFDD *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnUsableABSInformTDD_ExtIEsCls (Czt_ExtnUsableABSInformTDD_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_UsableABSInformTDD_ExtIEs (CztProtExtnField_UsableABSInformTDD_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_UsableABSInformTDD_ExtIEs (CztProtExtnCont_UsableABSInformTDD_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztUsableABSInformTDD (CztUsableABSInformTDD *param, Buffer *mBuf);
extern S16 cmPkCztUsableABSInform (CztUsableABSInform *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnABS_Status_ExtIEsCls (Czt_ExtnABS_Status_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_ABS_Status_ExtIEs (CztProtExtnField_ABS_Status_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_ABS_Status_ExtIEs (CztProtExtnCont_ABS_Status_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztABS_Status (CztABS_Status *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnAdditionalSpecialSubframe_Info_ExtIEsCls (Czt_ExtnAdditionalSpecialSubframe_Info_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_AdditionalSpecialSubframe_Info_ExtIEs (CztProtExtnField_AdditionalSpecialSubframe_Info_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_AdditionalSpecialSubframe_Info_ExtIEs (CztProtExtnCont_AdditionalSpecialSubframe_Info_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztAdditionalSpecialSubframe_Info (CztAdditionalSpecialSubframe_Info *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnAS_SecurInform_ExtIEsCls (Czt_ExtnAS_SecurInform_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_AS_SecurInform_ExtIEs (CztProtExtnField_AS_SecurInform_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_AS_SecurInform_ExtIEs (CztProtExtnCont_AS_SecurInform_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztAS_SecurInform (CztAS_SecurInform *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnAllocnAndRetentionPriority_ExtIEsCls (Czt_ExtnAllocnAndRetentionPriority_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_AllocnAndRetentionPriority_ExtIEs (CztProtExtnField_AllocnAndRetentionPriority_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_AllocnAndRetentionPriority_ExtIEs (CztProtExtnCont_AllocnAndRetentionPriority_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztAllocnAndRetentionPriority (CztAllocnAndRetentionPriority *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnECGI_ExtIEsCls (Czt_ExtnECGI_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_ECGI_ExtIEs (CztProtExtnField_ECGI_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_ECGI_ExtIEs (CztProtExtnCont_ECGI_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztECGI (CztECGI *param, Buffer *mBuf);
extern S16 cmPkCztCellIdLstforMDT (CztCellIdLstforMDT *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnCellBasedMDT_ExtIEsCls (Czt_ExtnCellBasedMDT_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_CellBasedMDT_ExtIEs (CztProtExtnField_CellBasedMDT_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_CellBasedMDT_ExtIEs (CztProtExtnCont_CellBasedMDT_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztCellBasedMDT (CztCellBasedMDT *param, Buffer *mBuf);
extern S16 cmPkCztTALstforMDT (CztTALstforMDT *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnTABasedMDT_ExtIEsCls (Czt_ExtnTABasedMDT_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_TABasedMDT_ExtIEs (CztProtExtnField_TABasedMDT_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_TABasedMDT_ExtIEs (CztProtExtnCont_TABasedMDT_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztTABasedMDT (CztTABasedMDT *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnTAI_Item_ExtIEsCls (Czt_ExtnTAI_Item_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_TAI_Item_ExtIEs (CztProtExtnField_TAI_Item_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_TAI_Item_ExtIEs (CztProtExtnCont_TAI_Item_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztTAI_Item (CztTAI_Item *param, Buffer *mBuf);
extern S16 cmPkCztTAILstforMDT (CztTAILstforMDT *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnTAIBasedMDT_ExtIEsCls (Czt_ExtnTAIBasedMDT_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_TAIBasedMDT_ExtIEs (CztProtExtnField_TAIBasedMDT_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_TAIBasedMDT_ExtIEs (CztProtExtnCont_TAIBasedMDT_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztTAIBasedMDT (CztTAIBasedMDT *param, Buffer *mBuf);
extern S16 cmPkCztAreaScopeOfMDT (CztAreaScopeOfMDT *param, Buffer *mBuf);
extern S16 cmPkCztBroadcastPLMNs_Item (CztBroadcastPLMNs_Item *param, Buffer *mBuf);
extern S16 cmPkCztCause (CztCause *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnCellTyp_ExtIEsCls (Czt_ExtnCellTyp_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_CellTyp_ExtIEs (CztProtExtnField_CellTyp_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_CellTyp_ExtIEs (CztProtExtnCont_CellTyp_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztCellTyp (CztCellTyp *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnCompositeAvailableCapacity_ExtIEsCls (Czt_ExtnCompositeAvailableCapacity_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_CompositeAvailableCapacity_ExtIEs (CztProtExtnField_CompositeAvailableCapacity_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_CompositeAvailableCapacity_ExtIEs (CztProtExtnCont_CompositeAvailableCapacity_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztCompositeAvailableCapacity (CztCompositeAvailableCapacity *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnCompositeAvailableCapacityGroup_ExtIEsCls (Czt_ExtnCompositeAvailableCapacityGroup_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_CompositeAvailableCapacityGroup_ExtIEs (CztProtExtnField_CompositeAvailableCapacityGroup_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_CompositeAvailableCapacityGroup_ExtIEs (CztProtExtnCont_CompositeAvailableCapacityGroup_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztCompositeAvailableCapacityGroup (CztCompositeAvailableCapacityGroup *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnCOUNTvalue_ExtIEsCls (Czt_ExtnCOUNTvalue_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_COUNTvalue_ExtIEs (CztProtExtnField_COUNTvalue_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_COUNTvalue_ExtIEs (CztProtExtnCont_COUNTvalue_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztCOUNTvalue (CztCOUNTvalue *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnCOUNTValueExtended_ExtIEsCls (Czt_ExtnCOUNTValueExtended_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_COUNTValueExtended_ExtIEs (CztProtExtnField_COUNTValueExtended_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_COUNTValueExtended_ExtIEs (CztProtExtnCont_COUNTValueExtended_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztCOUNTValueExtended (CztCOUNTValueExtended *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnCriticalityDiag_IE_Lst_ExtIEsCls (Czt_ExtnCriticalityDiag_IE_Lst_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_CriticalityDiag_IE_Lst_ExtIEs (CztProtExtnField_CriticalityDiag_IE_Lst_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_CriticalityDiag_IE_Lst_ExtIEs (CztProtExtnCont_CriticalityDiag_IE_Lst_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztCriticalityDiag_IE_LstMember (CztCriticalityDiag_IE_LstMember *param, Buffer *mBuf);
extern S16 cmPkCztCriticalityDiag_IE_Lst (CztCriticalityDiag_IE_Lst *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnCriticalityDiag_ExtIEsCls (Czt_ExtnCriticalityDiag_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_CriticalityDiag_ExtIEs (CztProtExtnField_CriticalityDiag_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_CriticalityDiag_ExtIEs (CztProtExtnCont_CriticalityDiag_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztCriticalityDiag (CztCriticalityDiag *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnFDD_Info_ExtIEsCls (Czt_ExtnFDD_Info_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_FDD_Info_ExtIEs (CztProtExtnField_FDD_Info_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_FDD_Info_ExtIEs (CztProtExtnCont_FDD_Info_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztFDD_Info (CztFDD_Info *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnSpecialSubframe_Info_ExtIEsCls (Czt_ExtnSpecialSubframe_Info_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_SpecialSubframe_Info_ExtIEs (CztProtExtnField_SpecialSubframe_Info_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_SpecialSubframe_Info_ExtIEs (CztProtExtnCont_SpecialSubframe_Info_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztSpecialSubframe_Info (CztSpecialSubframe_Info *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnTDD_Info_ExtIEsCls (Czt_ExtnTDD_Info_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_TDD_Info_ExtIEs (CztProtExtnField_TDD_Info_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_TDD_Info_ExtIEs (CztProtExtnCont_TDD_Info_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztTDD_Info (CztTDD_Info *param, Buffer *mBuf);
extern S16 cmPkCztEUTRA_Mode_Info (CztEUTRA_Mode_Info *param, Buffer *mBuf);
extern S16 cmPkCztENB_ID (CztENB_ID *param, Buffer *mBuf);
extern S16 cmPkCztEPLMNs (CztEPLMNs *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnGBR_QosInform_ExtIEsCls (Czt_ExtnGBR_QosInform_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_GBR_QosInform_ExtIEs (CztProtExtnField_GBR_QosInform_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_GBR_QosInform_ExtIEs (CztProtExtnCont_GBR_QosInform_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztGBR_QosInform (CztGBR_QosInform *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnE_RAB_Lvl_QoS_Params_ExtIEsCls (Czt_ExtnE_RAB_Lvl_QoS_Params_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_E_RAB_Lvl_QoS_Params_ExtIEs (CztProtExtnField_E_RAB_Lvl_QoS_Params_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_E_RAB_Lvl_QoS_Params_ExtIEs (CztProtExtnCont_E_RAB_Lvl_QoS_Params_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztE_RAB_Lvl_QoS_Params (CztE_RAB_Lvl_QoS_Params *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnE_RAB_Item_ExtIEsCls (Czt_ExtnE_RAB_Item_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_E_RAB_Item_ExtIEs (CztProtExtnField_E_RAB_Item_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_E_RAB_Item_ExtIEs (CztProtExtnCont_E_RAB_Item_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztE_RAB_Item (CztE_RAB_Item *param, Buffer *mBuf);
extern S16 cmPkCzt_ValueE_RAB_ItemIEsCls (Czt_ValueE_RAB_ItemIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtIE_Field_E_RAB_ItemIEs (CztProtIE_Field_E_RAB_ItemIEs *param, Buffer *mBuf);
extern S16 cmPkCztE_RAB_Lst (CztE_RAB_Lst *param, Buffer *mBuf);
extern S16 cmPkCztForbiddenTACs (CztForbiddenTACs *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnForbiddenTAs_Item_ExtIEsCls (Czt_ExtnForbiddenTAs_Item_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_ForbiddenTAs_Item_ExtIEs (CztProtExtnField_ForbiddenTAs_Item_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_ForbiddenTAs_Item_ExtIEs (CztProtExtnCont_ForbiddenTAs_Item_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztForbiddenTAs_Item (CztForbiddenTAs_Item *param, Buffer *mBuf);
extern S16 cmPkCztForbiddenTAs (CztForbiddenTAs *param, Buffer *mBuf);
extern S16 cmPkCztForbiddenLACs (CztForbiddenLACs *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnForbiddenLAs_Item_ExtIEsCls (Czt_ExtnForbiddenLAs_Item_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_ForbiddenLAs_Item_ExtIEs (CztProtExtnField_ForbiddenLAs_Item_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_ForbiddenLAs_Item_ExtIEs (CztProtExtnCont_ForbiddenLAs_Item_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztForbiddenLAs_Item (CztForbiddenLAs_Item *param, Buffer *mBuf);
extern S16 cmPkCztForbiddenLAs (CztForbiddenLAs *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnGlobalENB_ID_ExtIEsCls (Czt_ExtnGlobalENB_ID_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_GlobalENB_ID_ExtIEs (CztProtExtnField_GlobalENB_ID_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_GlobalENB_ID_ExtIEs (CztProtExtnCont_GlobalENB_ID_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztGlobalENB_ID (CztGlobalENB_ID *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnGTPtunnelEndpoint_ExtIEsCls (Czt_ExtnGTPtunnelEndpoint_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_GTPtunnelEndpoint_ExtIEs (CztProtExtnField_GTPtunnelEndpoint_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_GTPtunnelEndpoint_ExtIEs (CztProtExtnCont_GTPtunnelEndpoint_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztGTPtunnelEndpoint (CztGTPtunnelEndpoint *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnGU_Group_ID_ExtIEsCls (Czt_ExtnGU_Group_ID_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_GU_Group_ID_ExtIEs (CztProtExtnField_GU_Group_ID_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_GU_Group_ID_ExtIEs (CztProtExtnCont_GU_Group_ID_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztGU_Group_ID (CztGU_Group_ID *param, Buffer *mBuf);
extern S16 cmPkCztGUGroupIDLst (CztGUGroupIDLst *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnGUMMEI_ExtIEsCls (Czt_ExtnGUMMEI_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_GUMMEI_ExtIEs (CztProtExtnField_GUMMEI_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_GUMMEI_ExtIEs (CztProtExtnCont_GUMMEI_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztGUMMEI (CztGUMMEI *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnHovrRestrnLst_ExtIEsCls (Czt_ExtnHovrRestrnLst_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_HovrRestrnLst_ExtIEs (CztProtExtnField_HovrRestrnLst_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_HovrRestrnLst_ExtIEs (CztProtExtnCont_HovrRestrnLst_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztHovrRestrnLst (CztHovrRestrnLst *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnHWLoadIndicator_ExtIEsCls (Czt_ExtnHWLoadIndicator_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_HWLoadIndicator_ExtIEs (CztProtExtnField_HWLoadIndicator_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_HWLoadIndicator_ExtIEs (CztProtExtnCont_HWLoadIndicator_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztHWLoadIndicator (CztHWLoadIndicator *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnLastVisitedEUTRANCellInform_ExtIEsCls (Czt_ExtnLastVisitedEUTRANCellInform_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_LastVisitedEUTRANCellInform_ExtIEs (CztProtExtnField_LastVisitedEUTRANCellInform_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_LastVisitedEUTRANCellInform_ExtIEs (CztProtExtnCont_LastVisitedEUTRANCellInform_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztLastVisitedEUTRANCellInform (CztLastVisitedEUTRANCellInform *param, Buffer *mBuf);
extern S16 cmPkCztLastVisitedGERANCellInform (CztLastVisitedGERANCellInform *param, Buffer *mBuf);
extern S16 cmPkCztLastVisitedCell_Item (CztLastVisitedCell_Item *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnLocRprtngInform_ExtIEsCls (Czt_ExtnLocRprtngInform_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_LocRprtngInform_ExtIEs (CztProtExtnField_LocRprtngInform_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_LocRprtngInform_ExtIEs (CztProtExtnCont_LocRprtngInform_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztLocRprtngInform (CztLocRprtngInform *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnM3Config_ExtIEsCls (Czt_ExtnM3Config_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_M3Config_ExtIEs (CztProtExtnField_M3Config_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_M3Config_ExtIEs (CztProtExtnCont_M3Config_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztM3Config (CztM3Config *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnM4Config_ExtIEsCls (Czt_ExtnM4Config_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_M4Config_ExtIEs (CztProtExtnField_M4Config_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_M4Config_ExtIEs (CztProtExtnCont_M4Config_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztM4Config (CztM4Config *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnM5Config_ExtIEsCls (Czt_ExtnM5Config_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_M5Config_ExtIEs (CztProtExtnField_M5Config_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_M5Config_ExtIEs (CztProtExtnCont_M5Config_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztM5Config (CztM5Config *param, Buffer *mBuf);
extern S16 cmPkCztMeasurementThresholdA2 (CztMeasurementThresholdA2 *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnM1ThresholdEventA2_ExtIEsCls (Czt_ExtnM1ThresholdEventA2_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_M1ThresholdEventA2_ExtIEs (CztProtExtnField_M1ThresholdEventA2_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_M1ThresholdEventA2_ExtIEs (CztProtExtnCont_M1ThresholdEventA2_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztM1ThresholdEventA2 (CztM1ThresholdEventA2 *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnM1PeriodicRprtng_ExtIEsCls (Czt_ExtnM1PeriodicRprtng_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_M1PeriodicRprtng_ExtIEs (CztProtExtnField_M1PeriodicRprtng_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_M1PeriodicRprtng_ExtIEs (CztProtExtnCont_M1PeriodicRprtng_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztM1PeriodicRprtng (CztM1PeriodicRprtng *param, Buffer *mBuf);
extern S16 cmPkCztMDTPLMNLst (CztMDTPLMNLst *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnMDT_Config_ExtIEsCls (Czt_ExtnMDT_Config_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_MDT_Config_ExtIEs (CztProtExtnField_MDT_Config_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_MDT_Config_ExtIEs (CztProtExtnCont_MDT_Config_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztMDT_Config (CztMDT_Config *param, Buffer *mBuf);
extern S16 cmPkCztMBMS_Service_Area_Identity_Lst (CztMBMS_Service_Area_Identity_Lst *param, Buffer *mBuf);
extern S16 cmPkCztSubframeAllocn (CztSubframeAllocn *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnMBSFN_Subframe_Info_ExtIEsCls (Czt_ExtnMBSFN_Subframe_Info_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_MBSFN_Subframe_Info_ExtIEs (CztProtExtnField_MBSFN_Subframe_Info_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_MBSFN_Subframe_Info_ExtIEs (CztProtExtnCont_MBSFN_Subframe_Info_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztMBSFN_Subframe_Info (CztMBSFN_Subframe_Info *param, Buffer *mBuf);
extern S16 cmPkCztMBSFN_Subframe_Infolist (CztMBSFN_Subframe_Infolist *param, Buffer *mBuf);
extern S16 cmPkCztMobilityParamsModificationRange (CztMobilityParamsModificationRange *param, Buffer *mBuf);
extern S16 cmPkCztMobilityParamsInform (CztMobilityParamsInform *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnBandInfo_ExtIEsCls (Czt_ExtnBandInfo_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_BandInfo_ExtIEs (CztProtExtnField_BandInfo_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_BandInfo_ExtIEs (CztProtExtnCont_BandInfo_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztBandInfo (CztBandInfo *param, Buffer *mBuf);
extern S16 cmPkCztMultibandInfoLst (CztMultibandInfoLst *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnNeighbour_Inform_ExtIEsCls (Czt_ExtnNeighbour_Inform_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_Neighbour_Inform_ExtIEs (CztProtExtnField_Neighbour_Inform_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_Neighbour_Inform_ExtIEs (CztProtExtnCont_Neighbour_Inform_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztNeighbour_InformMember (CztNeighbour_InformMember *param, Buffer *mBuf);
extern S16 cmPkCztNeighbour_Inform (CztNeighbour_Inform *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnPRACH_Config_ExtIEsCls (Czt_ExtnPRACH_Config_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_PRACH_Config_ExtIEs (CztProtExtnField_PRACH_Config_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_PRACH_Config_ExtIEs (CztProtExtnCont_PRACH_Config_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztPRACH_Config (CztPRACH_Config *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnRadioResStatus_ExtIEsCls (Czt_ExtnRadioResStatus_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_RadioResStatus_ExtIEs (CztProtExtnField_RadioResStatus_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_RadioResStatus_ExtIEs (CztProtExtnCont_RadioResStatus_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztRadioResStatus (CztRadioResStatus *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnRelativeNarrowbandTxPower_ExtIEsCls (Czt_ExtnRelativeNarrowbandTxPower_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_RelativeNarrowbandTxPower_ExtIEs (CztProtExtnField_RelativeNarrowbandTxPower_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_RelativeNarrowbandTxPower_ExtIEs (CztProtExtnCont_RelativeNarrowbandTxPower_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztRelativeNarrowbandTxPower (CztRelativeNarrowbandTxPower *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnS1TNLLoadIndicator_ExtIEsCls (Czt_ExtnS1TNLLoadIndicator_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_S1TNLLoadIndicator_ExtIEs (CztProtExtnField_S1TNLLoadIndicator_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_S1TNLLoadIndicator_ExtIEs (CztProtExtnCont_S1TNLLoadIndicator_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztS1TNLLoadIndicator (CztS1TNLLoadIndicator *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnSrvdCell_Inform_ExtIEsCls (Czt_ExtnSrvdCell_Inform_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_SrvdCell_Inform_ExtIEs (CztProtExtnField_SrvdCell_Inform_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_SrvdCell_Inform_ExtIEs (CztProtExtnCont_SrvdCell_Inform_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztSrvdCell_Inform (CztSrvdCell_Inform *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnSrvdCell_ExtIEsCls (Czt_ExtnSrvdCell_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_SrvdCell_ExtIEs (CztProtExtnField_SrvdCell_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_SrvdCell_ExtIEs (CztProtExtnCont_SrvdCell_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztSrvdCellsMember (CztSrvdCellsMember *param, Buffer *mBuf);
extern S16 cmPkCztSrvdCells (CztSrvdCells *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnTraceActvn_ExtIEsCls (Czt_ExtnTraceActvn_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_TraceActvn_ExtIEs (CztProtExtnField_TraceActvn_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_TraceActvn_ExtIEs (CztProtExtnCont_TraceActvn_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztTraceActvn (CztTraceActvn *param, Buffer *mBuf);
extern S16 cmPkCztUE_HistoryInform (CztUE_HistoryInform *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnUEAgg_MaxBitrate_ExtIEsCls (Czt_ExtnUEAgg_MaxBitrate_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_UEAgg_MaxBitrate_ExtIEs (CztProtExtnField_UEAgg_MaxBitrate_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_UEAgg_MaxBitrate_ExtIEs (CztProtExtnCont_UEAgg_MaxBitrate_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztUEAggMaxBitRate (CztUEAggMaxBitRate *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnUESecurCapabilities_ExtIEsCls (Czt_ExtnUESecurCapabilities_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_UESecurCapabilities_ExtIEs (CztProtExtnField_UESecurCapabilities_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_UESecurCapabilities_ExtIEs (CztProtExtnCont_UESecurCapabilities_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztUESecurCapabilities (CztUESecurCapabilities *param, Buffer *mBuf);
extern S16 cmPkCztUL_InterferenceOverloadInd (CztUL_InterferenceOverloadInd *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnUL_HighInterferenceIndInfo_Item_ExtIEsCls (Czt_ExtnUL_HighInterferenceIndInfo_Item_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_UL_HighInterferenceIndInfo_Item_ExtIEs (CztProtExtnField_UL_HighInterferenceIndInfo_Item_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_UL_HighInterferenceIndInfo_Item_ExtIEs (CztProtExtnCont_UL_HighInterferenceIndInfo_Item_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztUL_HighInterferenceIndInfo_Item (CztUL_HighInterferenceIndInfo_Item *param, Buffer *mBuf);
extern S16 cmPkCztUL_HighInterferenceIndInfo (CztUL_HighInterferenceIndInfo *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnE_RABs_ToBeSetup_ItemExtIEsCls (Czt_ExtnE_RABs_ToBeSetup_ItemExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_E_RABs_ToBeSetup_ItemExtIEs (CztProtExtnField_E_RABs_ToBeSetup_ItemExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_E_RABs_ToBeSetup_ItemExtIEs (CztProtExtnCont_E_RABs_ToBeSetup_ItemExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztE_RABs_ToBeSetup_Item (CztE_RABs_ToBeSetup_Item *param, Buffer *mBuf);
extern S16 cmPkCzt_ValueE_RABs_ToBeSetup_ItemIEsCls (Czt_ValueE_RABs_ToBeSetup_ItemIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtIE_Field_E_RABs_ToBeSetup_ItemIEs (CztProtIE_Field_E_RABs_ToBeSetup_ItemIEs *param, Buffer *mBuf);
extern S16 cmPkCztE_RABs_ToBeSetup_Lst (CztE_RABs_ToBeSetup_Lst *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnUE_CntxtInform_ExtIEsCls (Czt_ExtnUE_CntxtInform_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_UE_CntxtInform_ExtIEs (CztProtExtnField_UE_CntxtInform_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_UE_CntxtInform_ExtIEs (CztProtExtnCont_UE_CntxtInform_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztUE_CntxtInform (CztUE_CntxtInform *param, Buffer *mBuf);
extern S16 cmPkCzt_ValueHovrRqst_IEsCls (Czt_ValueHovrRqst_IEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtIE_Field_HovrRqst_IEs (CztProtIE_Field_HovrRqst_IEs *param, Buffer *mBuf);
extern S16 cmPkCztProtIE_Cont_HovrRqst_IEs (CztProtIE_Cont_HovrRqst_IEs *param, Buffer *mBuf);
extern S16 cmPkCztHovrRqst (CztHovrRqst *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnE_RABs_Admtd_Item_ExtIEsCls (Czt_ExtnE_RABs_Admtd_Item_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_E_RABs_Admtd_Item_ExtIEs (CztProtExtnField_E_RABs_Admtd_Item_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_E_RABs_Admtd_Item_ExtIEs (CztProtExtnCont_E_RABs_Admtd_Item_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztE_RABs_Admtd_Item (CztE_RABs_Admtd_Item *param, Buffer *mBuf);
extern S16 cmPkCzt_ValueE_RABs_Admtd_ItemIEsCls (Czt_ValueE_RABs_Admtd_ItemIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtIE_Field_E_RABs_Admtd_ItemIEs (CztProtIE_Field_E_RABs_Admtd_ItemIEs *param, Buffer *mBuf);
extern S16 cmPkCztE_RABs_Admtd_Lst (CztE_RABs_Admtd_Lst *param, Buffer *mBuf);
extern S16 cmPkCzt_ValueHovrRqstAckg_IEsCls (Czt_ValueHovrRqstAckg_IEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtIE_Field_HovrRqstAckg_IEs (CztProtIE_Field_HovrRqstAckg_IEs *param, Buffer *mBuf);
extern S16 cmPkCztProtIE_Cont_HovrRqstAckg_IEs (CztProtIE_Cont_HovrRqstAckg_IEs *param, Buffer *mBuf);
extern S16 cmPkCztHovrRqstAckg (CztHovrRqstAckg *param, Buffer *mBuf);
extern S16 cmPkCzt_ValueHovrPrepFail_IEsCls (Czt_ValueHovrPrepFail_IEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtIE_Field_HovrPrepFail_IEs (CztProtIE_Field_HovrPrepFail_IEs *param, Buffer *mBuf);
extern S16 cmPkCztProtIE_Cont_HovrPrepFail_IEs (CztProtIE_Cont_HovrPrepFail_IEs *param, Buffer *mBuf);
extern S16 cmPkCztHovrPrepFail (CztHovrPrepFail *param, Buffer *mBuf);
extern S16 cmPkCzt_ValueHovrReport_IEsCls (Czt_ValueHovrReport_IEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtIE_Field_HovrReport_IEs (CztProtIE_Field_HovrReport_IEs *param, Buffer *mBuf);
extern S16 cmPkCztProtIE_Cont_HovrReport_IEs (CztProtIE_Cont_HovrReport_IEs *param, Buffer *mBuf);
extern S16 cmPkCztHovrReport (CztHovrReport *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnE_RABs_SubjToStatusTfr_ItemExtIEsCls (Czt_ExtnE_RABs_SubjToStatusTfr_ItemExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_E_RABs_SubjToStatusTfr_ItemExtIEs (CztProtExtnField_E_RABs_SubjToStatusTfr_ItemExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_E_RABs_SubjToStatusTfr_ItemExtIEs (CztProtExtnCont_E_RABs_SubjToStatusTfr_ItemExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztE_RABs_SubjToStatusTfr_Item (CztE_RABs_SubjToStatusTfr_Item *param, Buffer *mBuf);
extern S16 cmPkCzt_ValueE_RABs_SubjToStatusTfr_ItemIEsCls (Czt_ValueE_RABs_SubjToStatusTfr_ItemIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtIE_Field_E_RABs_SubjToStatusTfr_ItemIEs (CztProtIE_Field_E_RABs_SubjToStatusTfr_ItemIEs *param, Buffer *mBuf);
extern S16 cmPkCztE_RABs_SubjToStatusTfr_Lst (CztE_RABs_SubjToStatusTfr_Lst *param, Buffer *mBuf);
extern S16 cmPkCzt_ValueSNStatusTfr_IEsCls (Czt_ValueSNStatusTfr_IEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtIE_Field_SNStatusTfr_IEs (CztProtIE_Field_SNStatusTfr_IEs *param, Buffer *mBuf);
extern S16 cmPkCztProtIE_Cont_SNStatusTfr_IEs (CztProtIE_Cont_SNStatusTfr_IEs *param, Buffer *mBuf);
extern S16 cmPkCztSNStatusTfr (CztSNStatusTfr *param, Buffer *mBuf);
extern S16 cmPkCzt_ValueUECntxtRls_IEsCls (Czt_ValueUECntxtRls_IEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtIE_Field_UECntxtRls_IEs (CztProtIE_Field_UECntxtRls_IEs *param, Buffer *mBuf);
extern S16 cmPkCztProtIE_Cont_UECntxtRls_IEs (CztProtIE_Cont_UECntxtRls_IEs *param, Buffer *mBuf);
extern S16 cmPkCztUECntxtRls (CztUECntxtRls *param, Buffer *mBuf);
extern S16 cmPkCzt_ValueHovrCancel_IEsCls (Czt_ValueHovrCancel_IEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtIE_Field_HovrCancel_IEs (CztProtIE_Field_HovrCancel_IEs *param, Buffer *mBuf);
extern S16 cmPkCztProtIE_Cont_HovrCancel_IEs (CztProtIE_Cont_HovrCancel_IEs *param, Buffer *mBuf);
extern S16 cmPkCztHovrCancel (CztHovrCancel *param, Buffer *mBuf);
extern S16 cmPkCzt_ValueErrInd_IEsCls (Czt_ValueErrInd_IEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtIE_Field_ErrInd_IEs (CztProtIE_Field_ErrInd_IEs *param, Buffer *mBuf);
extern S16 cmPkCztProtIE_Cont_ErrInd_IEs (CztProtIE_Cont_ErrInd_IEs *param, Buffer *mBuf);
extern S16 cmPkCztErrInd (CztErrInd *param, Buffer *mBuf);
extern S16 cmPkCzt_ValueResetRqst_IEsCls (Czt_ValueResetRqst_IEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtIE_Field_ResetRqst_IEs (CztProtIE_Field_ResetRqst_IEs *param, Buffer *mBuf);
extern S16 cmPkCztProtIE_Cont_ResetRqst_IEs (CztProtIE_Cont_ResetRqst_IEs *param, Buffer *mBuf);
extern S16 cmPkCztResetRqst (CztResetRqst *param, Buffer *mBuf);
extern S16 cmPkCzt_ValueResetResp_IEsCls (Czt_ValueResetResp_IEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtIE_Field_ResetResp_IEs (CztProtIE_Field_ResetResp_IEs *param, Buffer *mBuf);
extern S16 cmPkCztProtIE_Cont_ResetResp_IEs (CztProtIE_Cont_ResetResp_IEs *param, Buffer *mBuf);
extern S16 cmPkCztResetResp (CztResetResp *param, Buffer *mBuf);
extern S16 cmPkCzt_ValueX2SetupRqst_IEsCls (Czt_ValueX2SetupRqst_IEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtIE_Field_X2SetupRqst_IEs (CztProtIE_Field_X2SetupRqst_IEs *param, Buffer *mBuf);
extern S16 cmPkCztProtIE_Cont_X2SetupRqst_IEs (CztProtIE_Cont_X2SetupRqst_IEs *param, Buffer *mBuf);
extern S16 cmPkCztX2SetupRqst (CztX2SetupRqst *param, Buffer *mBuf);
extern S16 cmPkCzt_ValueX2SetupResp_IEsCls (Czt_ValueX2SetupResp_IEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtIE_Field_X2SetupResp_IEs (CztProtIE_Field_X2SetupResp_IEs *param, Buffer *mBuf);
extern S16 cmPkCztProtIE_Cont_X2SetupResp_IEs (CztProtIE_Cont_X2SetupResp_IEs *param, Buffer *mBuf);
extern S16 cmPkCztX2SetupResp (CztX2SetupResp *param, Buffer *mBuf);
extern S16 cmPkCzt_ValueX2SetupFail_IEsCls (Czt_ValueX2SetupFail_IEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtIE_Field_X2SetupFail_IEs (CztProtIE_Field_X2SetupFail_IEs *param, Buffer *mBuf);
extern S16 cmPkCztProtIE_Cont_X2SetupFail_IEs (CztProtIE_Cont_X2SetupFail_IEs *param, Buffer *mBuf);
extern S16 cmPkCztX2SetupFail (CztX2SetupFail *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnCellInform_Item_ExtIEsCls (Czt_ExtnCellInform_Item_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_CellInform_Item_ExtIEs (CztProtExtnField_CellInform_Item_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_CellInform_Item_ExtIEs (CztProtExtnCont_CellInform_Item_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztCellInform_Item (CztCellInform_Item *param, Buffer *mBuf);
extern S16 cmPkCzt_ValueCellInform_ItemIEsCls (Czt_ValueCellInform_ItemIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtIE_Field_CellInform_ItemIEs (CztProtIE_Field_CellInform_ItemIEs *param, Buffer *mBuf);
extern S16 cmPkCztCellInform_Lst (CztCellInform_Lst *param, Buffer *mBuf);
extern S16 cmPkCzt_ValueLoadInform_IEsCls (Czt_ValueLoadInform_IEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtIE_Field_LoadInform_IEs (CztProtIE_Field_LoadInform_IEs *param, Buffer *mBuf);
extern S16 cmPkCztProtIE_Cont_LoadInform_IEs (CztProtIE_Cont_LoadInform_IEs *param, Buffer *mBuf);
extern S16 cmPkCztLoadInform (CztLoadInform *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnSrvdCellsToMdfy_Item_ExtIEsCls (Czt_ExtnSrvdCellsToMdfy_Item_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_SrvdCellsToMdfy_Item_ExtIEs (CztProtExtnField_SrvdCellsToMdfy_Item_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_SrvdCellsToMdfy_Item_ExtIEs (CztProtExtnCont_SrvdCellsToMdfy_Item_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztSrvdCellsToMdfy_Item (CztSrvdCellsToMdfy_Item *param, Buffer *mBuf);
extern S16 cmPkCztSrvdCellsToMdfy (CztSrvdCellsToMdfy *param, Buffer *mBuf);
extern S16 cmPkCztOld_ECGIs (CztOld_ECGIs *param, Buffer *mBuf);
extern S16 cmPkCzt_ValueENBConfigUpd_IEsCls (Czt_ValueENBConfigUpd_IEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtIE_Field_ENBConfigUpd_IEs (CztProtIE_Field_ENBConfigUpd_IEs *param, Buffer *mBuf);
extern S16 cmPkCztProtIE_Cont_ENBConfigUpd_IEs (CztProtIE_Cont_ENBConfigUpd_IEs *param, Buffer *mBuf);
extern S16 cmPkCztENBConfigUpd (CztENBConfigUpd *param, Buffer *mBuf);
extern S16 cmPkCzt_ValueENBConfigUpdAckg_IEsCls (Czt_ValueENBConfigUpdAckg_IEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtIE_Field_ENBConfigUpdAckg_IEs (CztProtIE_Field_ENBConfigUpdAckg_IEs *param, Buffer *mBuf);
extern S16 cmPkCztProtIE_Cont_ENBConfigUpdAckg_IEs (CztProtIE_Cont_ENBConfigUpdAckg_IEs *param, Buffer *mBuf);
extern S16 cmPkCztENBConfigUpdAckg (CztENBConfigUpdAckg *param, Buffer *mBuf);
extern S16 cmPkCzt_ValueENBConfigUpdFail_IEsCls (Czt_ValueENBConfigUpdFail_IEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtIE_Field_ENBConfigUpdFail_IEs (CztProtIE_Field_ENBConfigUpdFail_IEs *param, Buffer *mBuf);
extern S16 cmPkCztProtIE_Cont_ENBConfigUpdFail_IEs (CztProtIE_Cont_ENBConfigUpdFail_IEs *param, Buffer *mBuf);
extern S16 cmPkCztENBConfigUpdFail (CztENBConfigUpdFail *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnCellToReport_Item_ExtIEsCls (Czt_ExtnCellToReport_Item_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_CellToReport_Item_ExtIEs (CztProtExtnField_CellToReport_Item_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_CellToReport_Item_ExtIEs (CztProtExtnCont_CellToReport_Item_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztCellToReport_Item (CztCellToReport_Item *param, Buffer *mBuf);
extern S16 cmPkCzt_ValueCellToReport_ItemIEsCls (Czt_ValueCellToReport_ItemIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtIE_Field_CellToReport_ItemIEs (CztProtIE_Field_CellToReport_ItemIEs *param, Buffer *mBuf);
extern S16 cmPkCztCellToReport_Lst (CztCellToReport_Lst *param, Buffer *mBuf);
extern S16 cmPkCzt_ValueResStatusRqst_IEsCls (Czt_ValueResStatusRqst_IEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtIE_Field_ResStatusRqst_IEs (CztProtIE_Field_ResStatusRqst_IEs *param, Buffer *mBuf);
extern S16 cmPkCztProtIE_Cont_ResStatusRqst_IEs (CztProtIE_Cont_ResStatusRqst_IEs *param, Buffer *mBuf);
extern S16 cmPkCztResStatusRqst (CztResStatusRqst *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnMeasurementFailCause_Item_ExtIEsCls (Czt_ExtnMeasurementFailCause_Item_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_MeasurementFailCause_Item_ExtIEs (CztProtExtnField_MeasurementFailCause_Item_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_MeasurementFailCause_Item_ExtIEs (CztProtExtnCont_MeasurementFailCause_Item_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztMeasurementFailCause_Item (CztMeasurementFailCause_Item *param, Buffer *mBuf);
extern S16 cmPkCzt_ValueMeasurementFailCause_ItemIEsCls (Czt_ValueMeasurementFailCause_ItemIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtIE_Field_MeasurementFailCause_ItemIEs (CztProtIE_Field_MeasurementFailCause_ItemIEs *param, Buffer *mBuf);
extern S16 cmPkCztMeasurementFailCause_Lst (CztMeasurementFailCause_Lst *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnMeasurementInitiationResult_Item_ExtIEsCls (Czt_ExtnMeasurementInitiationResult_Item_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_MeasurementInitiationResult_Item_ExtIEs (CztProtExtnField_MeasurementInitiationResult_Item_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_MeasurementInitiationResult_Item_ExtIEs (CztProtExtnCont_MeasurementInitiationResult_Item_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztMeasurementInitiationResult_Item (CztMeasurementInitiationResult_Item *param, Buffer *mBuf);
extern S16 cmPkCzt_ValueMeasurementInitiationResult_ItemIEsCls (Czt_ValueMeasurementInitiationResult_ItemIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtIE_Field_MeasurementInitiationResult_ItemIEs (CztProtIE_Field_MeasurementInitiationResult_ItemIEs *param, Buffer *mBuf);
extern S16 cmPkCztMeasurementInitiationResult_Lst (CztMeasurementInitiationResult_Lst *param, Buffer *mBuf);
extern S16 cmPkCzt_ValueResStatusResp_IEsCls (Czt_ValueResStatusResp_IEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtIE_Field_ResStatusResp_IEs (CztProtIE_Field_ResStatusResp_IEs *param, Buffer *mBuf);
extern S16 cmPkCztProtIE_Cont_ResStatusResp_IEs (CztProtIE_Cont_ResStatusResp_IEs *param, Buffer *mBuf);
extern S16 cmPkCztResStatusResp (CztResStatusResp *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnCompleteFailCauseInform_Item_ExtIEsCls (Czt_ExtnCompleteFailCauseInform_Item_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_CompleteFailCauseInform_Item_ExtIEs (CztProtExtnField_CompleteFailCauseInform_Item_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_CompleteFailCauseInform_Item_ExtIEs (CztProtExtnCont_CompleteFailCauseInform_Item_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztCompleteFailCauseInform_Item (CztCompleteFailCauseInform_Item *param, Buffer *mBuf);
extern S16 cmPkCzt_ValueCompleteFailCauseInform_ItemIEsCls (Czt_ValueCompleteFailCauseInform_ItemIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtIE_Field_CompleteFailCauseInform_ItemIEs (CztProtIE_Field_CompleteFailCauseInform_ItemIEs *param, Buffer *mBuf);
extern S16 cmPkCztCompleteFailCauseInform_Lst (CztCompleteFailCauseInform_Lst *param, Buffer *mBuf);
extern S16 cmPkCzt_ValueResStatusFail_IEsCls (Czt_ValueResStatusFail_IEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtIE_Field_ResStatusFail_IEs (CztProtIE_Field_ResStatusFail_IEs *param, Buffer *mBuf);
extern S16 cmPkCztProtIE_Cont_ResStatusFail_IEs (CztProtIE_Cont_ResStatusFail_IEs *param, Buffer *mBuf);
extern S16 cmPkCztResStatusFail (CztResStatusFail *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnCellMeasurementResult_Item_ExtIEsCls (Czt_ExtnCellMeasurementResult_Item_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_CellMeasurementResult_Item_ExtIEs (CztProtExtnField_CellMeasurementResult_Item_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_CellMeasurementResult_Item_ExtIEs (CztProtExtnCont_CellMeasurementResult_Item_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztCellMeasurementResult_Item (CztCellMeasurementResult_Item *param, Buffer *mBuf);
extern S16 cmPkCzt_ValueCellMeasurementResult_ItemIEsCls (Czt_ValueCellMeasurementResult_ItemIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtIE_Field_CellMeasurementResult_ItemIEs (CztProtIE_Field_CellMeasurementResult_ItemIEs *param, Buffer *mBuf);
extern S16 cmPkCztCellMeasurementResult_Lst (CztCellMeasurementResult_Lst *param, Buffer *mBuf);
extern S16 cmPkCzt_ValueResStatusUpd_IEsCls (Czt_ValueResStatusUpd_IEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtIE_Field_ResStatusUpd_IEs (CztProtIE_Field_ResStatusUpd_IEs *param, Buffer *mBuf);
extern S16 cmPkCztProtIE_Cont_ResStatusUpd_IEs (CztProtIE_Cont_ResStatusUpd_IEs *param, Buffer *mBuf);
extern S16 cmPkCztResStatusUpd (CztResStatusUpd *param, Buffer *mBuf);
extern S16 cmPkCzt_ValuePrivMsg_IEsCls (Czt_ValuePrivMsg_IEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztPrivIE_Field_PrivMsg_IEs (CztPrivIE_Field_PrivMsg_IEs *param, Buffer *mBuf);
extern S16 cmPkCztPrivIE_Cont_PrivMsg_IEs (CztPrivIE_Cont_PrivMsg_IEs *param, Buffer *mBuf);
extern S16 cmPkCztPrivMsg (CztPrivMsg *param, Buffer *mBuf);
extern S16 cmPkCzt_ValueMobilityChangeRqst_IEsCls (Czt_ValueMobilityChangeRqst_IEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtIE_Field_MobilityChangeRqst_IEs (CztProtIE_Field_MobilityChangeRqst_IEs *param, Buffer *mBuf);
extern S16 cmPkCztProtIE_Cont_MobilityChangeRqst_IEs (CztProtIE_Cont_MobilityChangeRqst_IEs *param, Buffer *mBuf);
extern S16 cmPkCztMobilityChangeRqst (CztMobilityChangeRqst *param, Buffer *mBuf);
extern S16 cmPkCzt_ValueMobilityChangeAckg_IEsCls (Czt_ValueMobilityChangeAckg_IEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtIE_Field_MobilityChangeAckg_IEs (CztProtIE_Field_MobilityChangeAckg_IEs *param, Buffer *mBuf);
extern S16 cmPkCztProtIE_Cont_MobilityChangeAckg_IEs (CztProtIE_Cont_MobilityChangeAckg_IEs *param, Buffer *mBuf);
extern S16 cmPkCztMobilityChangeAckg (CztMobilityChangeAckg *param, Buffer *mBuf);
extern S16 cmPkCzt_ValueMobilityChangeFail_IEsCls (Czt_ValueMobilityChangeFail_IEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtIE_Field_MobilityChangeFail_IEs (CztProtIE_Field_MobilityChangeFail_IEs *param, Buffer *mBuf);
extern S16 cmPkCztProtIE_Cont_MobilityChangeFail_IEs (CztProtIE_Cont_MobilityChangeFail_IEs *param, Buffer *mBuf);
extern S16 cmPkCztMobilityChangeFail (CztMobilityChangeFail *param, Buffer *mBuf);
extern S16 cmPkCzt_ValueRLFInd_IEsCls (Czt_ValueRLFInd_IEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtIE_Field_RLFInd_IEs (CztProtIE_Field_RLFInd_IEs *param, Buffer *mBuf);
extern S16 cmPkCztProtIE_Cont_RLFInd_IEs (CztProtIE_Cont_RLFInd_IEs *param, Buffer *mBuf);
extern S16 cmPkCztRLFInd (CztRLFInd *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnSrvdCellsToActivate_Item_ExtIEsCls (Czt_ExtnSrvdCellsToActivate_Item_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_SrvdCellsToActivate_Item_ExtIEs (CztProtExtnField_SrvdCellsToActivate_Item_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_SrvdCellsToActivate_Item_ExtIEs (CztProtExtnCont_SrvdCellsToActivate_Item_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztSrvdCellsToActivate_Item (CztSrvdCellsToActivate_Item *param, Buffer *mBuf);
extern S16 cmPkCztSrvdCellsToActivate (CztSrvdCellsToActivate *param, Buffer *mBuf);
extern S16 cmPkCzt_ValueCellActvnRqst_IEsCls (Czt_ValueCellActvnRqst_IEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtIE_Field_CellActvnRqst_IEs (CztProtIE_Field_CellActvnRqst_IEs *param, Buffer *mBuf);
extern S16 cmPkCztProtIE_Cont_CellActvnRqst_IEs (CztProtIE_Cont_CellActvnRqst_IEs *param, Buffer *mBuf);
extern S16 cmPkCztCellActvnRqst (CztCellActvnRqst *param, Buffer *mBuf);
extern S16 cmPkCzt_ExtnActivatedCellLst_Item_ExtIEsCls (Czt_ExtnActivatedCellLst_Item_ExtIEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtExtnField_ActivatedCellLst_Item_ExtIEs (CztProtExtnField_ActivatedCellLst_Item_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztProtExtnCont_ActivatedCellLst_Item_ExtIEs (CztProtExtnCont_ActivatedCellLst_Item_ExtIEs *param, Buffer *mBuf);
extern S16 cmPkCztActivatedCellLst_Item (CztActivatedCellLst_Item *param, Buffer *mBuf);
extern S16 cmPkCztActivatedCellLst (CztActivatedCellLst *param, Buffer *mBuf);
extern S16 cmPkCzt_ValueCellActvnResp_IEsCls (Czt_ValueCellActvnResp_IEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtIE_Field_CellActvnResp_IEs (CztProtIE_Field_CellActvnResp_IEs *param, Buffer *mBuf);
extern S16 cmPkCztProtIE_Cont_CellActvnResp_IEs (CztProtIE_Cont_CellActvnResp_IEs *param, Buffer *mBuf);
extern S16 cmPkCztCellActvnResp (CztCellActvnResp *param, Buffer *mBuf);
extern S16 cmPkCzt_ValueCellActvnFail_IEsCls (Czt_ValueCellActvnFail_IEsCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztProtIE_Field_CellActvnFail_IEs (CztProtIE_Field_CellActvnFail_IEs *param, Buffer *mBuf);
extern S16 cmPkCztProtIE_Cont_CellActvnFail_IEs (CztProtIE_Cont_CellActvnFail_IEs *param, Buffer *mBuf);
extern S16 cmPkCztCellActvnFail (CztCellActvnFail *param, Buffer *mBuf);
extern S16 cmPkCzt_InitiatingMsgCls (Czt_InitiatingMsgCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztInitiatingMsg (CztInitiatingMsg *param, Buffer *mBuf);
extern S16 cmPkCzt_SuccessfulOutcomeCls (Czt_SuccessfulOutcomeCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztSuccessfulOutcome (CztSuccessfulOutcome *param, Buffer *mBuf);
extern S16 cmPkCzt_UnsuccessfulOutcomeCls (Czt_UnsuccessfulOutcomeCls *param, U32 val, Buffer *mBuf);
extern S16 cmPkCztUnsuccessfulOutcome (CztUnsuccessfulOutcome *param, Buffer *mBuf);
extern S16 cmPkCztX2AP_PDU (CztX2AP_PDU *param, Buffer *mBuf);
extern S16 cmUnpkCztPrivIE_ID (CztPrivIE_ID *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnABSInformFDD_ExtIEsCls (Czt_ExtnABSInformFDD_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_ABSInformFDD_ExtIEs (CztProtExtnField_ABSInformFDD_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_ABSInformFDD_ExtIEs (CztProtExtnCont_ABSInformFDD_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztABSInformFDD (CztABSInformFDD *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnABSInformTDD_ExtIEsCls (Czt_ExtnABSInformTDD_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_ABSInformTDD_ExtIEs (CztProtExtnField_ABSInformTDD_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_ABSInformTDD_ExtIEs (CztProtExtnCont_ABSInformTDD_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztABSInformTDD (CztABSInformTDD *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztABSInform (CztABSInform *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnUsableABSInformFDD_ExtIEsCls (Czt_ExtnUsableABSInformFDD_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_UsableABSInformFDD_ExtIEs (CztProtExtnField_UsableABSInformFDD_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_UsableABSInformFDD_ExtIEs (CztProtExtnCont_UsableABSInformFDD_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztUsableABSInformFDD (CztUsableABSInformFDD *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnUsableABSInformTDD_ExtIEsCls (Czt_ExtnUsableABSInformTDD_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_UsableABSInformTDD_ExtIEs (CztProtExtnField_UsableABSInformTDD_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_UsableABSInformTDD_ExtIEs (CztProtExtnCont_UsableABSInformTDD_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztUsableABSInformTDD (CztUsableABSInformTDD *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztUsableABSInform (CztUsableABSInform *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnABS_Status_ExtIEsCls (Czt_ExtnABS_Status_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_ABS_Status_ExtIEs (CztProtExtnField_ABS_Status_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_ABS_Status_ExtIEs (CztProtExtnCont_ABS_Status_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztABS_Status (CztABS_Status *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnAdditionalSpecialSubframe_Info_ExtIEsCls (Czt_ExtnAdditionalSpecialSubframe_Info_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_AdditionalSpecialSubframe_Info_ExtIEs (CztProtExtnField_AdditionalSpecialSubframe_Info_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_AdditionalSpecialSubframe_Info_ExtIEs (CztProtExtnCont_AdditionalSpecialSubframe_Info_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztAdditionalSpecialSubframe_Info (CztAdditionalSpecialSubframe_Info *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnAS_SecurInform_ExtIEsCls (Czt_ExtnAS_SecurInform_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_AS_SecurInform_ExtIEs (CztProtExtnField_AS_SecurInform_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_AS_SecurInform_ExtIEs (CztProtExtnCont_AS_SecurInform_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztAS_SecurInform (CztAS_SecurInform *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnAllocnAndRetentionPriority_ExtIEsCls (Czt_ExtnAllocnAndRetentionPriority_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_AllocnAndRetentionPriority_ExtIEs (CztProtExtnField_AllocnAndRetentionPriority_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_AllocnAndRetentionPriority_ExtIEs (CztProtExtnCont_AllocnAndRetentionPriority_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztAllocnAndRetentionPriority (CztAllocnAndRetentionPriority *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnECGI_ExtIEsCls (Czt_ExtnECGI_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_ECGI_ExtIEs (CztProtExtnField_ECGI_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_ECGI_ExtIEs (CztProtExtnCont_ECGI_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztECGI (CztECGI *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztCellIdLstforMDT (CztCellIdLstforMDT *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnCellBasedMDT_ExtIEsCls (Czt_ExtnCellBasedMDT_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_CellBasedMDT_ExtIEs (CztProtExtnField_CellBasedMDT_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_CellBasedMDT_ExtIEs (CztProtExtnCont_CellBasedMDT_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztCellBasedMDT (CztCellBasedMDT *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztTALstforMDT (CztTALstforMDT *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnTABasedMDT_ExtIEsCls (Czt_ExtnTABasedMDT_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_TABasedMDT_ExtIEs (CztProtExtnField_TABasedMDT_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_TABasedMDT_ExtIEs (CztProtExtnCont_TABasedMDT_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztTABasedMDT (CztTABasedMDT *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnTAI_Item_ExtIEsCls (Czt_ExtnTAI_Item_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_TAI_Item_ExtIEs (CztProtExtnField_TAI_Item_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_TAI_Item_ExtIEs (CztProtExtnCont_TAI_Item_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztTAI_Item (CztTAI_Item *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztTAILstforMDT (CztTAILstforMDT *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnTAIBasedMDT_ExtIEsCls (Czt_ExtnTAIBasedMDT_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_TAIBasedMDT_ExtIEs (CztProtExtnField_TAIBasedMDT_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_TAIBasedMDT_ExtIEs (CztProtExtnCont_TAIBasedMDT_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztTAIBasedMDT (CztTAIBasedMDT *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztAreaScopeOfMDT (CztAreaScopeOfMDT *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztBroadcastPLMNs_Item (CztBroadcastPLMNs_Item *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztCause (CztCause *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnCellTyp_ExtIEsCls (Czt_ExtnCellTyp_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_CellTyp_ExtIEs (CztProtExtnField_CellTyp_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_CellTyp_ExtIEs (CztProtExtnCont_CellTyp_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztCellTyp (CztCellTyp *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnCompositeAvailableCapacity_ExtIEsCls (Czt_ExtnCompositeAvailableCapacity_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_CompositeAvailableCapacity_ExtIEs (CztProtExtnField_CompositeAvailableCapacity_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_CompositeAvailableCapacity_ExtIEs (CztProtExtnCont_CompositeAvailableCapacity_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztCompositeAvailableCapacity (CztCompositeAvailableCapacity *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnCompositeAvailableCapacityGroup_ExtIEsCls (Czt_ExtnCompositeAvailableCapacityGroup_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_CompositeAvailableCapacityGroup_ExtIEs (CztProtExtnField_CompositeAvailableCapacityGroup_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_CompositeAvailableCapacityGroup_ExtIEs (CztProtExtnCont_CompositeAvailableCapacityGroup_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztCompositeAvailableCapacityGroup (CztCompositeAvailableCapacityGroup *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnCOUNTvalue_ExtIEsCls (Czt_ExtnCOUNTvalue_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_COUNTvalue_ExtIEs (CztProtExtnField_COUNTvalue_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_COUNTvalue_ExtIEs (CztProtExtnCont_COUNTvalue_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztCOUNTvalue (CztCOUNTvalue *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnCOUNTValueExtended_ExtIEsCls (Czt_ExtnCOUNTValueExtended_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_COUNTValueExtended_ExtIEs (CztProtExtnField_COUNTValueExtended_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_COUNTValueExtended_ExtIEs (CztProtExtnCont_COUNTValueExtended_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztCOUNTValueExtended (CztCOUNTValueExtended *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnCriticalityDiag_IE_Lst_ExtIEsCls (Czt_ExtnCriticalityDiag_IE_Lst_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_CriticalityDiag_IE_Lst_ExtIEs (CztProtExtnField_CriticalityDiag_IE_Lst_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_CriticalityDiag_IE_Lst_ExtIEs (CztProtExtnCont_CriticalityDiag_IE_Lst_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztCriticalityDiag_IE_LstMember (CztCriticalityDiag_IE_LstMember *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztCriticalityDiag_IE_Lst (CztCriticalityDiag_IE_Lst *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnCriticalityDiag_ExtIEsCls (Czt_ExtnCriticalityDiag_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_CriticalityDiag_ExtIEs (CztProtExtnField_CriticalityDiag_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_CriticalityDiag_ExtIEs (CztProtExtnCont_CriticalityDiag_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztCriticalityDiag (CztCriticalityDiag *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnFDD_Info_ExtIEsCls (Czt_ExtnFDD_Info_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_FDD_Info_ExtIEs (CztProtExtnField_FDD_Info_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_FDD_Info_ExtIEs (CztProtExtnCont_FDD_Info_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztFDD_Info (CztFDD_Info *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnSpecialSubframe_Info_ExtIEsCls (Czt_ExtnSpecialSubframe_Info_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_SpecialSubframe_Info_ExtIEs (CztProtExtnField_SpecialSubframe_Info_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_SpecialSubframe_Info_ExtIEs (CztProtExtnCont_SpecialSubframe_Info_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztSpecialSubframe_Info (CztSpecialSubframe_Info *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnTDD_Info_ExtIEsCls (Czt_ExtnTDD_Info_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_TDD_Info_ExtIEs (CztProtExtnField_TDD_Info_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_TDD_Info_ExtIEs (CztProtExtnCont_TDD_Info_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztTDD_Info (CztTDD_Info *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztEUTRA_Mode_Info (CztEUTRA_Mode_Info *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztENB_ID (CztENB_ID *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztEPLMNs (CztEPLMNs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnGBR_QosInform_ExtIEsCls (Czt_ExtnGBR_QosInform_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_GBR_QosInform_ExtIEs (CztProtExtnField_GBR_QosInform_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_GBR_QosInform_ExtIEs (CztProtExtnCont_GBR_QosInform_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztGBR_QosInform (CztGBR_QosInform *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnE_RAB_Lvl_QoS_Params_ExtIEsCls (Czt_ExtnE_RAB_Lvl_QoS_Params_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_E_RAB_Lvl_QoS_Params_ExtIEs (CztProtExtnField_E_RAB_Lvl_QoS_Params_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_E_RAB_Lvl_QoS_Params_ExtIEs (CztProtExtnCont_E_RAB_Lvl_QoS_Params_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztE_RAB_Lvl_QoS_Params (CztE_RAB_Lvl_QoS_Params *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnE_RAB_Item_ExtIEsCls (Czt_ExtnE_RAB_Item_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_E_RAB_Item_ExtIEs (CztProtExtnField_E_RAB_Item_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_E_RAB_Item_ExtIEs (CztProtExtnCont_E_RAB_Item_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztE_RAB_Item (CztE_RAB_Item *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ValueE_RAB_ItemIEsCls (Czt_ValueE_RAB_ItemIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Field_E_RAB_ItemIEs (CztProtIE_Field_E_RAB_ItemIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztE_RAB_Lst (CztE_RAB_Lst *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztForbiddenTACs (CztForbiddenTACs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnForbiddenTAs_Item_ExtIEsCls (Czt_ExtnForbiddenTAs_Item_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_ForbiddenTAs_Item_ExtIEs (CztProtExtnField_ForbiddenTAs_Item_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_ForbiddenTAs_Item_ExtIEs (CztProtExtnCont_ForbiddenTAs_Item_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztForbiddenTAs_Item (CztForbiddenTAs_Item *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztForbiddenTAs (CztForbiddenTAs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztForbiddenLACs (CztForbiddenLACs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnForbiddenLAs_Item_ExtIEsCls (Czt_ExtnForbiddenLAs_Item_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_ForbiddenLAs_Item_ExtIEs (CztProtExtnField_ForbiddenLAs_Item_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_ForbiddenLAs_Item_ExtIEs (CztProtExtnCont_ForbiddenLAs_Item_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztForbiddenLAs_Item (CztForbiddenLAs_Item *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztForbiddenLAs (CztForbiddenLAs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnGlobalENB_ID_ExtIEsCls (Czt_ExtnGlobalENB_ID_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_GlobalENB_ID_ExtIEs (CztProtExtnField_GlobalENB_ID_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_GlobalENB_ID_ExtIEs (CztProtExtnCont_GlobalENB_ID_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztGlobalENB_ID (CztGlobalENB_ID *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnGTPtunnelEndpoint_ExtIEsCls (Czt_ExtnGTPtunnelEndpoint_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_GTPtunnelEndpoint_ExtIEs (CztProtExtnField_GTPtunnelEndpoint_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_GTPtunnelEndpoint_ExtIEs (CztProtExtnCont_GTPtunnelEndpoint_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztGTPtunnelEndpoint (CztGTPtunnelEndpoint *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnGU_Group_ID_ExtIEsCls (Czt_ExtnGU_Group_ID_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_GU_Group_ID_ExtIEs (CztProtExtnField_GU_Group_ID_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_GU_Group_ID_ExtIEs (CztProtExtnCont_GU_Group_ID_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztGU_Group_ID (CztGU_Group_ID *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztGUGroupIDLst (CztGUGroupIDLst *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnGUMMEI_ExtIEsCls (Czt_ExtnGUMMEI_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_GUMMEI_ExtIEs (CztProtExtnField_GUMMEI_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_GUMMEI_ExtIEs (CztProtExtnCont_GUMMEI_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztGUMMEI (CztGUMMEI *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnHovrRestrnLst_ExtIEsCls (Czt_ExtnHovrRestrnLst_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_HovrRestrnLst_ExtIEs (CztProtExtnField_HovrRestrnLst_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_HovrRestrnLst_ExtIEs (CztProtExtnCont_HovrRestrnLst_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztHovrRestrnLst (CztHovrRestrnLst *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnHWLoadIndicator_ExtIEsCls (Czt_ExtnHWLoadIndicator_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_HWLoadIndicator_ExtIEs (CztProtExtnField_HWLoadIndicator_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_HWLoadIndicator_ExtIEs (CztProtExtnCont_HWLoadIndicator_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztHWLoadIndicator (CztHWLoadIndicator *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnLastVisitedEUTRANCellInform_ExtIEsCls (Czt_ExtnLastVisitedEUTRANCellInform_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_LastVisitedEUTRANCellInform_ExtIEs (CztProtExtnField_LastVisitedEUTRANCellInform_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_LastVisitedEUTRANCellInform_ExtIEs (CztProtExtnCont_LastVisitedEUTRANCellInform_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztLastVisitedEUTRANCellInform (CztLastVisitedEUTRANCellInform *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztLastVisitedGERANCellInform (CztLastVisitedGERANCellInform *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztLastVisitedCell_Item (CztLastVisitedCell_Item *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnLocRprtngInform_ExtIEsCls (Czt_ExtnLocRprtngInform_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_LocRprtngInform_ExtIEs (CztProtExtnField_LocRprtngInform_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_LocRprtngInform_ExtIEs (CztProtExtnCont_LocRprtngInform_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztLocRprtngInform (CztLocRprtngInform *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnM3Config_ExtIEsCls (Czt_ExtnM3Config_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_M3Config_ExtIEs (CztProtExtnField_M3Config_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_M3Config_ExtIEs (CztProtExtnCont_M3Config_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztM3Config (CztM3Config *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnM4Config_ExtIEsCls (Czt_ExtnM4Config_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_M4Config_ExtIEs (CztProtExtnField_M4Config_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_M4Config_ExtIEs (CztProtExtnCont_M4Config_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztM4Config (CztM4Config *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnM5Config_ExtIEsCls (Czt_ExtnM5Config_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_M5Config_ExtIEs (CztProtExtnField_M5Config_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_M5Config_ExtIEs (CztProtExtnCont_M5Config_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztM5Config (CztM5Config *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztMeasurementThresholdA2 (CztMeasurementThresholdA2 *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnM1ThresholdEventA2_ExtIEsCls (Czt_ExtnM1ThresholdEventA2_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_M1ThresholdEventA2_ExtIEs (CztProtExtnField_M1ThresholdEventA2_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_M1ThresholdEventA2_ExtIEs (CztProtExtnCont_M1ThresholdEventA2_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztM1ThresholdEventA2 (CztM1ThresholdEventA2 *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnM1PeriodicRprtng_ExtIEsCls (Czt_ExtnM1PeriodicRprtng_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_M1PeriodicRprtng_ExtIEs (CztProtExtnField_M1PeriodicRprtng_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_M1PeriodicRprtng_ExtIEs (CztProtExtnCont_M1PeriodicRprtng_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztM1PeriodicRprtng (CztM1PeriodicRprtng *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztMDTPLMNLst (CztMDTPLMNLst *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnMDT_Config_ExtIEsCls (Czt_ExtnMDT_Config_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_MDT_Config_ExtIEs (CztProtExtnField_MDT_Config_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_MDT_Config_ExtIEs (CztProtExtnCont_MDT_Config_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztMDT_Config (CztMDT_Config *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztMBMS_Service_Area_Identity_Lst (CztMBMS_Service_Area_Identity_Lst *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztSubframeAllocn (CztSubframeAllocn *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnMBSFN_Subframe_Info_ExtIEsCls (Czt_ExtnMBSFN_Subframe_Info_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_MBSFN_Subframe_Info_ExtIEs (CztProtExtnField_MBSFN_Subframe_Info_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_MBSFN_Subframe_Info_ExtIEs (CztProtExtnCont_MBSFN_Subframe_Info_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztMBSFN_Subframe_Info (CztMBSFN_Subframe_Info *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztMBSFN_Subframe_Infolist (CztMBSFN_Subframe_Infolist *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztMobilityParamsModificationRange (CztMobilityParamsModificationRange *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztMobilityParamsInform (CztMobilityParamsInform *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnBandInfo_ExtIEsCls (Czt_ExtnBandInfo_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_BandInfo_ExtIEs (CztProtExtnField_BandInfo_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_BandInfo_ExtIEs (CztProtExtnCont_BandInfo_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztBandInfo (CztBandInfo *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztMultibandInfoLst (CztMultibandInfoLst *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnNeighbour_Inform_ExtIEsCls (Czt_ExtnNeighbour_Inform_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_Neighbour_Inform_ExtIEs (CztProtExtnField_Neighbour_Inform_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_Neighbour_Inform_ExtIEs (CztProtExtnCont_Neighbour_Inform_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztNeighbour_InformMember (CztNeighbour_InformMember *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztNeighbour_Inform (CztNeighbour_Inform *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnPRACH_Config_ExtIEsCls (Czt_ExtnPRACH_Config_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_PRACH_Config_ExtIEs (CztProtExtnField_PRACH_Config_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_PRACH_Config_ExtIEs (CztProtExtnCont_PRACH_Config_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztPRACH_Config (CztPRACH_Config *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnRadioResStatus_ExtIEsCls (Czt_ExtnRadioResStatus_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_RadioResStatus_ExtIEs (CztProtExtnField_RadioResStatus_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_RadioResStatus_ExtIEs (CztProtExtnCont_RadioResStatus_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztRadioResStatus (CztRadioResStatus *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnRelativeNarrowbandTxPower_ExtIEsCls (Czt_ExtnRelativeNarrowbandTxPower_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_RelativeNarrowbandTxPower_ExtIEs (CztProtExtnField_RelativeNarrowbandTxPower_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_RelativeNarrowbandTxPower_ExtIEs (CztProtExtnCont_RelativeNarrowbandTxPower_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztRelativeNarrowbandTxPower (CztRelativeNarrowbandTxPower *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnS1TNLLoadIndicator_ExtIEsCls (Czt_ExtnS1TNLLoadIndicator_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_S1TNLLoadIndicator_ExtIEs (CztProtExtnField_S1TNLLoadIndicator_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_S1TNLLoadIndicator_ExtIEs (CztProtExtnCont_S1TNLLoadIndicator_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztS1TNLLoadIndicator (CztS1TNLLoadIndicator *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnSrvdCell_Inform_ExtIEsCls (Czt_ExtnSrvdCell_Inform_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_SrvdCell_Inform_ExtIEs (CztProtExtnField_SrvdCell_Inform_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_SrvdCell_Inform_ExtIEs (CztProtExtnCont_SrvdCell_Inform_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztSrvdCell_Inform (CztSrvdCell_Inform *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnSrvdCell_ExtIEsCls (Czt_ExtnSrvdCell_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_SrvdCell_ExtIEs (CztProtExtnField_SrvdCell_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_SrvdCell_ExtIEs (CztProtExtnCont_SrvdCell_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztSrvdCellsMember (CztSrvdCellsMember *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztSrvdCells (CztSrvdCells *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnTraceActvn_ExtIEsCls (Czt_ExtnTraceActvn_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_TraceActvn_ExtIEs (CztProtExtnField_TraceActvn_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_TraceActvn_ExtIEs (CztProtExtnCont_TraceActvn_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztTraceActvn (CztTraceActvn *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztUE_HistoryInform (CztUE_HistoryInform *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnUEAgg_MaxBitrate_ExtIEsCls (Czt_ExtnUEAgg_MaxBitrate_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_UEAgg_MaxBitrate_ExtIEs (CztProtExtnField_UEAgg_MaxBitrate_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_UEAgg_MaxBitrate_ExtIEs (CztProtExtnCont_UEAgg_MaxBitrate_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztUEAggMaxBitRate (CztUEAggMaxBitRate *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnUESecurCapabilities_ExtIEsCls (Czt_ExtnUESecurCapabilities_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_UESecurCapabilities_ExtIEs (CztProtExtnField_UESecurCapabilities_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_UESecurCapabilities_ExtIEs (CztProtExtnCont_UESecurCapabilities_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztUESecurCapabilities (CztUESecurCapabilities *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztUL_InterferenceOverloadInd (CztUL_InterferenceOverloadInd *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnUL_HighInterferenceIndInfo_Item_ExtIEsCls (Czt_ExtnUL_HighInterferenceIndInfo_Item_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_UL_HighInterferenceIndInfo_Item_ExtIEs (CztProtExtnField_UL_HighInterferenceIndInfo_Item_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_UL_HighInterferenceIndInfo_Item_ExtIEs (CztProtExtnCont_UL_HighInterferenceIndInfo_Item_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztUL_HighInterferenceIndInfo_Item (CztUL_HighInterferenceIndInfo_Item *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztUL_HighInterferenceIndInfo (CztUL_HighInterferenceIndInfo *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnE_RABs_ToBeSetup_ItemExtIEsCls (Czt_ExtnE_RABs_ToBeSetup_ItemExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_E_RABs_ToBeSetup_ItemExtIEs (CztProtExtnField_E_RABs_ToBeSetup_ItemExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_E_RABs_ToBeSetup_ItemExtIEs (CztProtExtnCont_E_RABs_ToBeSetup_ItemExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztE_RABs_ToBeSetup_Item (CztE_RABs_ToBeSetup_Item *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ValueE_RABs_ToBeSetup_ItemIEsCls (Czt_ValueE_RABs_ToBeSetup_ItemIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Field_E_RABs_ToBeSetup_ItemIEs (CztProtIE_Field_E_RABs_ToBeSetup_ItemIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztE_RABs_ToBeSetup_Lst (CztE_RABs_ToBeSetup_Lst *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnUE_CntxtInform_ExtIEsCls (Czt_ExtnUE_CntxtInform_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_UE_CntxtInform_ExtIEs (CztProtExtnField_UE_CntxtInform_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_UE_CntxtInform_ExtIEs (CztProtExtnCont_UE_CntxtInform_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztUE_CntxtInform (CztUE_CntxtInform *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ValueHovrRqst_IEsCls (Czt_ValueHovrRqst_IEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Field_HovrRqst_IEs (CztProtIE_Field_HovrRqst_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Cont_HovrRqst_IEs (CztProtIE_Cont_HovrRqst_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztHovrRqst (CztHovrRqst *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnE_RABs_Admtd_Item_ExtIEsCls (Czt_ExtnE_RABs_Admtd_Item_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_E_RABs_Admtd_Item_ExtIEs (CztProtExtnField_E_RABs_Admtd_Item_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_E_RABs_Admtd_Item_ExtIEs (CztProtExtnCont_E_RABs_Admtd_Item_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztE_RABs_Admtd_Item (CztE_RABs_Admtd_Item *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ValueE_RABs_Admtd_ItemIEsCls (Czt_ValueE_RABs_Admtd_ItemIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Field_E_RABs_Admtd_ItemIEs (CztProtIE_Field_E_RABs_Admtd_ItemIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztE_RABs_Admtd_Lst (CztE_RABs_Admtd_Lst *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ValueHovrRqstAckg_IEsCls (Czt_ValueHovrRqstAckg_IEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Field_HovrRqstAckg_IEs (CztProtIE_Field_HovrRqstAckg_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Cont_HovrRqstAckg_IEs (CztProtIE_Cont_HovrRqstAckg_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztHovrRqstAckg (CztHovrRqstAckg *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ValueHovrPrepFail_IEsCls (Czt_ValueHovrPrepFail_IEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Field_HovrPrepFail_IEs (CztProtIE_Field_HovrPrepFail_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Cont_HovrPrepFail_IEs (CztProtIE_Cont_HovrPrepFail_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztHovrPrepFail (CztHovrPrepFail *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ValueHovrReport_IEsCls (Czt_ValueHovrReport_IEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Field_HovrReport_IEs (CztProtIE_Field_HovrReport_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Cont_HovrReport_IEs (CztProtIE_Cont_HovrReport_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztHovrReport (CztHovrReport *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnE_RABs_SubjToStatusTfr_ItemExtIEsCls (Czt_ExtnE_RABs_SubjToStatusTfr_ItemExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_E_RABs_SubjToStatusTfr_ItemExtIEs (CztProtExtnField_E_RABs_SubjToStatusTfr_ItemExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_E_RABs_SubjToStatusTfr_ItemExtIEs (CztProtExtnCont_E_RABs_SubjToStatusTfr_ItemExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztE_RABs_SubjToStatusTfr_Item (CztE_RABs_SubjToStatusTfr_Item *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ValueE_RABs_SubjToStatusTfr_ItemIEsCls (Czt_ValueE_RABs_SubjToStatusTfr_ItemIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Field_E_RABs_SubjToStatusTfr_ItemIEs (CztProtIE_Field_E_RABs_SubjToStatusTfr_ItemIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztE_RABs_SubjToStatusTfr_Lst (CztE_RABs_SubjToStatusTfr_Lst *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ValueSNStatusTfr_IEsCls (Czt_ValueSNStatusTfr_IEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Field_SNStatusTfr_IEs (CztProtIE_Field_SNStatusTfr_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Cont_SNStatusTfr_IEs (CztProtIE_Cont_SNStatusTfr_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztSNStatusTfr (CztSNStatusTfr *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ValueUECntxtRls_IEsCls (Czt_ValueUECntxtRls_IEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Field_UECntxtRls_IEs (CztProtIE_Field_UECntxtRls_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Cont_UECntxtRls_IEs (CztProtIE_Cont_UECntxtRls_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztUECntxtRls (CztUECntxtRls *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ValueHovrCancel_IEsCls (Czt_ValueHovrCancel_IEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Field_HovrCancel_IEs (CztProtIE_Field_HovrCancel_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Cont_HovrCancel_IEs (CztProtIE_Cont_HovrCancel_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztHovrCancel (CztHovrCancel *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ValueErrInd_IEsCls (Czt_ValueErrInd_IEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Field_ErrInd_IEs (CztProtIE_Field_ErrInd_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Cont_ErrInd_IEs (CztProtIE_Cont_ErrInd_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztErrInd (CztErrInd *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ValueResetRqst_IEsCls (Czt_ValueResetRqst_IEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Field_ResetRqst_IEs (CztProtIE_Field_ResetRqst_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Cont_ResetRqst_IEs (CztProtIE_Cont_ResetRqst_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztResetRqst (CztResetRqst *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ValueResetResp_IEsCls (Czt_ValueResetResp_IEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Field_ResetResp_IEs (CztProtIE_Field_ResetResp_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Cont_ResetResp_IEs (CztProtIE_Cont_ResetResp_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztResetResp (CztResetResp *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ValueX2SetupRqst_IEsCls (Czt_ValueX2SetupRqst_IEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Field_X2SetupRqst_IEs (CztProtIE_Field_X2SetupRqst_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Cont_X2SetupRqst_IEs (CztProtIE_Cont_X2SetupRqst_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztX2SetupRqst (CztX2SetupRqst *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ValueX2SetupResp_IEsCls (Czt_ValueX2SetupResp_IEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Field_X2SetupResp_IEs (CztProtIE_Field_X2SetupResp_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Cont_X2SetupResp_IEs (CztProtIE_Cont_X2SetupResp_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztX2SetupResp (CztX2SetupResp *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ValueX2SetupFail_IEsCls (Czt_ValueX2SetupFail_IEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Field_X2SetupFail_IEs (CztProtIE_Field_X2SetupFail_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Cont_X2SetupFail_IEs (CztProtIE_Cont_X2SetupFail_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztX2SetupFail (CztX2SetupFail *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnCellInform_Item_ExtIEsCls (Czt_ExtnCellInform_Item_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_CellInform_Item_ExtIEs (CztProtExtnField_CellInform_Item_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_CellInform_Item_ExtIEs (CztProtExtnCont_CellInform_Item_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztCellInform_Item (CztCellInform_Item *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ValueCellInform_ItemIEsCls (Czt_ValueCellInform_ItemIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Field_CellInform_ItemIEs (CztProtIE_Field_CellInform_ItemIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztCellInform_Lst (CztCellInform_Lst *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ValueLoadInform_IEsCls (Czt_ValueLoadInform_IEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Field_LoadInform_IEs (CztProtIE_Field_LoadInform_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Cont_LoadInform_IEs (CztProtIE_Cont_LoadInform_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztLoadInform (CztLoadInform *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnSrvdCellsToMdfy_Item_ExtIEsCls (Czt_ExtnSrvdCellsToMdfy_Item_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_SrvdCellsToMdfy_Item_ExtIEs (CztProtExtnField_SrvdCellsToMdfy_Item_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_SrvdCellsToMdfy_Item_ExtIEs (CztProtExtnCont_SrvdCellsToMdfy_Item_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztSrvdCellsToMdfy_Item (CztSrvdCellsToMdfy_Item *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztSrvdCellsToMdfy (CztSrvdCellsToMdfy *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztOld_ECGIs (CztOld_ECGIs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ValueENBConfigUpd_IEsCls (Czt_ValueENBConfigUpd_IEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Field_ENBConfigUpd_IEs (CztProtIE_Field_ENBConfigUpd_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Cont_ENBConfigUpd_IEs (CztProtIE_Cont_ENBConfigUpd_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztENBConfigUpd (CztENBConfigUpd *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ValueENBConfigUpdAckg_IEsCls (Czt_ValueENBConfigUpdAckg_IEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Field_ENBConfigUpdAckg_IEs (CztProtIE_Field_ENBConfigUpdAckg_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Cont_ENBConfigUpdAckg_IEs (CztProtIE_Cont_ENBConfigUpdAckg_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztENBConfigUpdAckg (CztENBConfigUpdAckg *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ValueENBConfigUpdFail_IEsCls (Czt_ValueENBConfigUpdFail_IEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Field_ENBConfigUpdFail_IEs (CztProtIE_Field_ENBConfigUpdFail_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Cont_ENBConfigUpdFail_IEs (CztProtIE_Cont_ENBConfigUpdFail_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztENBConfigUpdFail (CztENBConfigUpdFail *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnCellToReport_Item_ExtIEsCls (Czt_ExtnCellToReport_Item_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_CellToReport_Item_ExtIEs (CztProtExtnField_CellToReport_Item_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_CellToReport_Item_ExtIEs (CztProtExtnCont_CellToReport_Item_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztCellToReport_Item (CztCellToReport_Item *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ValueCellToReport_ItemIEsCls (Czt_ValueCellToReport_ItemIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Field_CellToReport_ItemIEs (CztProtIE_Field_CellToReport_ItemIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztCellToReport_Lst (CztCellToReport_Lst *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ValueResStatusRqst_IEsCls (Czt_ValueResStatusRqst_IEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Field_ResStatusRqst_IEs (CztProtIE_Field_ResStatusRqst_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Cont_ResStatusRqst_IEs (CztProtIE_Cont_ResStatusRqst_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztResStatusRqst (CztResStatusRqst *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnMeasurementFailCause_Item_ExtIEsCls (Czt_ExtnMeasurementFailCause_Item_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_MeasurementFailCause_Item_ExtIEs (CztProtExtnField_MeasurementFailCause_Item_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_MeasurementFailCause_Item_ExtIEs (CztProtExtnCont_MeasurementFailCause_Item_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztMeasurementFailCause_Item (CztMeasurementFailCause_Item *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ValueMeasurementFailCause_ItemIEsCls (Czt_ValueMeasurementFailCause_ItemIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Field_MeasurementFailCause_ItemIEs (CztProtIE_Field_MeasurementFailCause_ItemIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztMeasurementFailCause_Lst (CztMeasurementFailCause_Lst *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnMeasurementInitiationResult_Item_ExtIEsCls (Czt_ExtnMeasurementInitiationResult_Item_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_MeasurementInitiationResult_Item_ExtIEs (CztProtExtnField_MeasurementInitiationResult_Item_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_MeasurementInitiationResult_Item_ExtIEs (CztProtExtnCont_MeasurementInitiationResult_Item_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztMeasurementInitiationResult_Item (CztMeasurementInitiationResult_Item *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ValueMeasurementInitiationResult_ItemIEsCls (Czt_ValueMeasurementInitiationResult_ItemIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Field_MeasurementInitiationResult_ItemIEs (CztProtIE_Field_MeasurementInitiationResult_ItemIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztMeasurementInitiationResult_Lst (CztMeasurementInitiationResult_Lst *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ValueResStatusResp_IEsCls (Czt_ValueResStatusResp_IEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Field_ResStatusResp_IEs (CztProtIE_Field_ResStatusResp_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Cont_ResStatusResp_IEs (CztProtIE_Cont_ResStatusResp_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztResStatusResp (CztResStatusResp *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnCompleteFailCauseInform_Item_ExtIEsCls (Czt_ExtnCompleteFailCauseInform_Item_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_CompleteFailCauseInform_Item_ExtIEs (CztProtExtnField_CompleteFailCauseInform_Item_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_CompleteFailCauseInform_Item_ExtIEs (CztProtExtnCont_CompleteFailCauseInform_Item_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztCompleteFailCauseInform_Item (CztCompleteFailCauseInform_Item *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ValueCompleteFailCauseInform_ItemIEsCls (Czt_ValueCompleteFailCauseInform_ItemIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Field_CompleteFailCauseInform_ItemIEs (CztProtIE_Field_CompleteFailCauseInform_ItemIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztCompleteFailCauseInform_Lst (CztCompleteFailCauseInform_Lst *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ValueResStatusFail_IEsCls (Czt_ValueResStatusFail_IEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Field_ResStatusFail_IEs (CztProtIE_Field_ResStatusFail_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Cont_ResStatusFail_IEs (CztProtIE_Cont_ResStatusFail_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztResStatusFail (CztResStatusFail *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnCellMeasurementResult_Item_ExtIEsCls (Czt_ExtnCellMeasurementResult_Item_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_CellMeasurementResult_Item_ExtIEs (CztProtExtnField_CellMeasurementResult_Item_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_CellMeasurementResult_Item_ExtIEs (CztProtExtnCont_CellMeasurementResult_Item_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztCellMeasurementResult_Item (CztCellMeasurementResult_Item *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ValueCellMeasurementResult_ItemIEsCls (Czt_ValueCellMeasurementResult_ItemIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Field_CellMeasurementResult_ItemIEs (CztProtIE_Field_CellMeasurementResult_ItemIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztCellMeasurementResult_Lst (CztCellMeasurementResult_Lst *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ValueResStatusUpd_IEsCls (Czt_ValueResStatusUpd_IEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Field_ResStatusUpd_IEs (CztProtIE_Field_ResStatusUpd_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Cont_ResStatusUpd_IEs (CztProtIE_Cont_ResStatusUpd_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztResStatusUpd (CztResStatusUpd *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ValuePrivMsg_IEsCls (Czt_ValuePrivMsg_IEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztPrivIE_Field_PrivMsg_IEs (CztPrivIE_Field_PrivMsg_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztPrivIE_Cont_PrivMsg_IEs (CztPrivIE_Cont_PrivMsg_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztPrivMsg (CztPrivMsg *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ValueMobilityChangeRqst_IEsCls (Czt_ValueMobilityChangeRqst_IEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Field_MobilityChangeRqst_IEs (CztProtIE_Field_MobilityChangeRqst_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Cont_MobilityChangeRqst_IEs (CztProtIE_Cont_MobilityChangeRqst_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztMobilityChangeRqst (CztMobilityChangeRqst *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ValueMobilityChangeAckg_IEsCls (Czt_ValueMobilityChangeAckg_IEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Field_MobilityChangeAckg_IEs (CztProtIE_Field_MobilityChangeAckg_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Cont_MobilityChangeAckg_IEs (CztProtIE_Cont_MobilityChangeAckg_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztMobilityChangeAckg (CztMobilityChangeAckg *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ValueMobilityChangeFail_IEsCls (Czt_ValueMobilityChangeFail_IEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Field_MobilityChangeFail_IEs (CztProtIE_Field_MobilityChangeFail_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Cont_MobilityChangeFail_IEs (CztProtIE_Cont_MobilityChangeFail_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztMobilityChangeFail (CztMobilityChangeFail *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ValueRLFInd_IEsCls (Czt_ValueRLFInd_IEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Field_RLFInd_IEs (CztProtIE_Field_RLFInd_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Cont_RLFInd_IEs (CztProtIE_Cont_RLFInd_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztRLFInd (CztRLFInd *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnSrvdCellsToActivate_Item_ExtIEsCls (Czt_ExtnSrvdCellsToActivate_Item_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_SrvdCellsToActivate_Item_ExtIEs (CztProtExtnField_SrvdCellsToActivate_Item_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_SrvdCellsToActivate_Item_ExtIEs (CztProtExtnCont_SrvdCellsToActivate_Item_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztSrvdCellsToActivate_Item (CztSrvdCellsToActivate_Item *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztSrvdCellsToActivate (CztSrvdCellsToActivate *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ValueCellActvnRqst_IEsCls (Czt_ValueCellActvnRqst_IEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Field_CellActvnRqst_IEs (CztProtIE_Field_CellActvnRqst_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Cont_CellActvnRqst_IEs (CztProtIE_Cont_CellActvnRqst_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztCellActvnRqst (CztCellActvnRqst *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ExtnActivatedCellLst_Item_ExtIEsCls (Czt_ExtnActivatedCellLst_Item_ExtIEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnField_ActivatedCellLst_Item_ExtIEs (CztProtExtnField_ActivatedCellLst_Item_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtExtnCont_ActivatedCellLst_Item_ExtIEs (CztProtExtnCont_ActivatedCellLst_Item_ExtIEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztActivatedCellLst_Item (CztActivatedCellLst_Item *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztActivatedCellLst (CztActivatedCellLst *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ValueCellActvnResp_IEsCls (Czt_ValueCellActvnResp_IEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Field_CellActvnResp_IEs (CztProtIE_Field_CellActvnResp_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Cont_CellActvnResp_IEs (CztProtIE_Cont_CellActvnResp_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztCellActvnResp (CztCellActvnResp *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_ValueCellActvnFail_IEsCls (Czt_ValueCellActvnFail_IEsCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Field_CellActvnFail_IEs (CztProtIE_Field_CellActvnFail_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztProtIE_Cont_CellActvnFail_IEs (CztProtIE_Cont_CellActvnFail_IEs *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztCellActvnFail (CztCellActvnFail *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_InitiatingMsgCls (Czt_InitiatingMsgCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztInitiatingMsg (CztInitiatingMsg *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_SuccessfulOutcomeCls (Czt_SuccessfulOutcomeCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztSuccessfulOutcome (CztSuccessfulOutcome *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCzt_UnsuccessfulOutcomeCls (Czt_UnsuccessfulOutcomeCls *param, U32 val, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztUnsuccessfulOutcome (CztUnsuccessfulOutcome *param, Ptr ptr, Buffer *mBuf);
extern S16 cmUnpkCztX2AP_PDU (CztX2AP_PDU *param, Ptr ptr, Buffer *mBuf);




typedef U16 CztStrmId;
typedef U16 CztPort;






typedef struct cztNetAddrLst
{
   U8 nmb;
   CmNetAddr nAddr[5];
}CztNetAddrLst;





typedef struct cztReqStatus
{
   U8 status;



   U8 cause;
}CztReqStatus;





typedef struct cztEvnt
{
   CmMemListCp memCp;
   U32 peerId;
   CztX2AP_PDU pdu;
}CztEvnt;
typedef struct cztStaInd
{
   U32 peerId;
   U8 type;
   U8 status;
   U8 reason;
   U16 oldUEX2APId;
}CztStaInd;
typedef CztStaInd CztRlsCfm;




typedef struct cztUeInfo
{
   U16 oldUEX2APId;
   U16 newUEX2APId;
}CztUeInfo;





typedef struct cztRsrcProcInfo
{
   U16 eNb1MeasId;
   U16 eNb2MeasId;
}CztRsrcProcInfo;
typedef struct cztLclErrInd
{
   U32 peerId;

   U8 causeType;
   U8 causeValue;
   U8 msgType;

   union
   {
      CztUeInfo ueInfo;
      CztRsrcProcInfo rsrcInfo;

   }u;
   Bool evntPres;



   CztEvnt *event;





   Buffer *rcvBuf;



}CztLclErrInd;
typedef struct cztReTxInfo
{
   U32 peerId;

   U8 msgType;
   union
   {
      U16 eNb1MeasId;

   }u;
}CztReTxInfo;
typedef struct cztRlsReq
{
   U32 peerId;

   U8 idType;



   U8 rlsType;
   union
   {
      U16 eNb1MeasId;

      U16 oldUEX2APId;
   }u;
}CztRlsReq;
typedef struct cztPeerAssocInd
{
   CztNetAddrLst dstAddrLst;
   CztPort dstPort;
} CztPeerAssocInd;
typedef struct cztPeerAssocRsp
{
   U32 peerId;
   CztNetAddrLst dstAddrLst;
   CztPort dstPort;
   CmNetAddr priDstAddr;
   CztStrmId globalStreamId;
   CztStrmId locOutStrms;
   CztReqStatus status;



} CztPeerAssocRsp;






typedef struct cztAudPeer
{
   U32 peerId;
   State peerState;
}CztAudPeer;
typedef struct cztAudEvnt
{
   U8 type;
   union
   {
      CztAudPeer audPeer;
   }u;
   CztReqStatus status;
}CztAudEvnt;


typedef S16 (*CztBndReq) ( Pst * pst, SuId suId, SpId spId)


                              ;

typedef S16 (*CztUbndReq) ( Pst * pst, SpId spId, Reason reason)


                                ;

typedef S16 (*CztBndCfm) ( Pst * pst, SuId suId, U8 status)


                                ;

typedef S16 (*CztGpReq) ( Pst * pst, SpId spId, CztEvnt * gpReq)


                               ;

typedef S16 (*CztGpInd) ( Pst * pst, SuId suId, CztEvnt * gpInd)


                               ;

typedef S16 (*CztGpRsp) ( Pst * pst, SpId spId, CztEvnt * gpRsp)


                               ;

typedef S16 (*CztGpCfm) ( Pst * pst, SuId suId, CztEvnt * gpCfm)


                               ;

typedef S16 (*CztGpRetxReq) ( Pst * pst, SpId spId, CztReTxInfo *reTxInfo)


                                   ;

typedef S16 (*CztBmpReq) ( Pst * pst, SpId spId, CztEvnt * bmpEvnt)


                                 ;

typedef S16 (*CztBmpInd) ( Pst * pst, SuId suId, CztEvnt * bmpEvnt)


                                 ;

typedef S16 (*CztBmpRsp) ( Pst * pst, SpId spId, CztEvnt * bmpRsp)


                                ;

typedef S16 (*CztBmpCfm) ( Pst * pst, SuId suId, CztEvnt * bmpCfm)


                                ;

typedef S16 (*CztGpErrReq) ( Pst * pst, SpId spId, CztEvnt * gpErrReq)


                                  ;

typedef S16 (*CztGpErrInd) ( Pst * pst, SuId suId, CztEvnt * gpErrInd)


                                  ;

typedef S16 (*CztLclErrorInd) ( Pst * pst, SuId suId, CztLclErrInd * cztLclErrInd)


                                      ;

typedef S16 (*CztRelReq) ( Pst * pst, SpId spId, CztRlsReq *rlsReq)


                                 ;

typedef S16 (*CztRelCfm) ( Pst * pst, SuId suId, CztRlsCfm * rlsCfm)


                                 ;

typedef S16 (*CztStatusInd) ( Pst * pst, SuId suId, CztStaInd * cztSta)


                                ;

typedef S16 (*CztDynamPeerAssocInd) ( Pst * pst, SuId suId, CztPeerAssocInd * peerAssocInd)


                                      ;

typedef S16 (*CztDynamPeerAssocRsp) ( Pst * pst, SuId suId, CztPeerAssocRsp * peerAssocRsp)


                                      ;

typedef S16 (*CztAudReq) ( Pst *pst, SpId spId, CztAudEvnt *audEvnt )



          ;

typedef S16 (*CztAudCfm) ( Pst *pst, SuId suId, CztAudEvnt *audEvnt )



          ;
extern S16 CzUiCztBndReq ( Pst *pst, SuId suId, SpId spId )



  ;
extern S16 CzUiCztBndCfm ( Pst *pst, SuId suId, U8 status )



  ;
extern S16 CzUiCztUbndReq ( Pst *pst, SpId spId, Reason reason )



  ;
extern S16 CzUiCztGpReq ( Pst *pst, SpId spId, CztEvnt *gpReq )



  ;
extern S16 CzUiCztGpInd ( Pst *pst, SuId suId, CztEvnt *gpInd )



  ;
extern S16 CzUiCztGpRsp ( Pst *pst, SpId spId, CztEvnt *gpRsp )



  ;
extern S16 CzUiCztGpCfm ( Pst *pst, SuId suId, CztEvnt *gpCfm )



  ;
extern S16 CzUiCztGpRetxReq ( Pst *pst, SpId spId, CztReTxInfo *reTxInfo)


                                  ;
extern S16 CzUiCztBmpReq ( Pst *pst, SpId spId, CztEvnt *bmpEvnt )



  ;
extern S16 CzUiCztBmpInd ( Pst *pst, SuId suId, CztEvnt *bmpEvnt )



  ;
extern S16 CzUiCztBmpRsp ( Pst *pst, SpId spId, CztEvnt *bmpRsp )



  ;
extern S16 CzUiCztBmpCfm ( Pst *pst, SuId suId, CztEvnt *bmpCfm )



  ;
extern S16 CzUiCztGpErrReq ( Pst *pst, SpId spId, CztEvnt *gpErrReq )



  ;
extern S16 CzUiCztGpErrInd ( Pst *pst, SuId suId, CztEvnt *gpErrInd )



  ;
extern S16 CzUiCztLclErrorInd ( Pst *pst, SuId suId, CztLclErrInd *cztLclErrInd )



  ;
extern S16 CzUiCztRelReq ( Pst *pst, SpId spId, CztRlsReq *rlsReq )



  ;
extern S16 CzUiCztRelCfm ( Pst *pst, SuId suId, CztRlsCfm *rlsCfm )



  ;
extern S16 CzUiCztStaInd ( Pst *pst, SuId suId, CztStaInd *cztSta )



  ;
extern S16 CzUiCztDynamPeerAssocInd ( Pst *pst, SuId suId, CztPeerAssocInd *peerAssocInd )



  ;
extern S16 CzUiCztDynamPeerAssocRsp ( Pst *pst, SuId suId, CztPeerAssocRsp *peerAssocRsp )



  ;
extern S16 CzUiCztAudReq (Pst *pst, SpId spId, CztAudEvnt *audEvnt);
extern S16 CzUiCztAudCfm (Pst *pst, SuId suId, CztAudEvnt *audEvnt);
extern S16 RsLiCztBndReq ( Pst * pst, SuId suId, SpId spId )



  ;

extern S16 RsLiCztUbndReq ( Pst * pst, SpId spId, Reason reason )



  ;

extern S16 RsLiCztBndCfm ( Pst * pst, SuId suId, U8 status )



  ;

extern S16 RsLiCztGpReq ( Pst * pst, SpId spId, CztEvnt * gpReq )



  ;

extern S16 RsLiCztGpInd ( Pst * pst, SuId suId, CztEvnt * gpInd )



  ;

extern S16 RsLiCztGpRsp ( Pst * pst, SpId spId, CztEvnt * gpRsp )



  ;

extern S16 RsLiCztGpCfm ( Pst * pst, SuId suId, CztEvnt * gpCfm )



  ;

extern S16 RsLiCztGpRetxReq ( Pst * pst, SpId spId, CztReTxInfo *retxInfo )



  ;

extern S16 RsLiCztBmpReq ( Pst * pst, SpId spId, CztEvnt * bmpEvnt )



  ;

extern S16 RsLiCztBmpInd ( Pst * pst, SuId suId, CztEvnt * bmpEvnt )



  ;

extern S16 RsLiCztBmpRsp ( Pst * pst, SpId spId, CztEvnt * bmpRsp )



  ;

extern S16 RsLiCztBmpCfm ( Pst * pst, SuId suId, CztEvnt * bmpCfm )



  ;

extern S16 RsLiCztGpErrReq ( Pst * pst, SpId spId, CztEvnt * gpErrReq )



  ;

extern S16 RsLiCztGpErrInd ( Pst * pst, SuId suId, CztEvnt * gpErrInd )



  ;

extern S16 RsLiCztLclErrorInd ( Pst * pst, SuId suId, CztLclErrInd * cztLclErrInd )



  ;

extern S16 RsLiCztRelReq ( Pst * pst, SpId spId, CztRlsReq *rlsReq )



  ;

extern S16 RsLiCztRelCfm ( Pst * pst, SuId suId, CztRlsCfm * rlsCfm )



  ;

extern S16 RsLiCztStatusInd ( Pst * pst, SuId suId, CztStaInd * cztSta )



  ;


extern S16 RsLiCztDynamPeerAssocInd ( Pst * pst, SuId suId, CztPeerAssocInd * peerAssocInd )



  ;

extern S16 RsLiCztDynamPeerAssocRsp ( Pst * pst, SuId suId, CztPeerAssocRsp * peerAssocRsp )



  ;

extern S16 RsLiCztAudReq ( Pst * pst, SpId spId, CztAudEvnt *audEvnt )



  ;

extern S16 RsLiCztAudCfm ( Pst * pst, SuId suId, CztAudEvnt *audEvnt )



  ;






extern S16 cmPkCztBndReq ( Pst * pst, SuId suId, SpId spId )



  ;

extern S16 cmUnpkCztBndReq ( CztBndReq func, Pst * pst, Buffer *mBuf )



  ;

extern S16 cmPkCztUbndReq ( Pst * pst, SpId spId, Reason reason )



  ;

extern S16 cmUnpkCztUbndReq ( CztUbndReq func, Pst * pst, Buffer *mBuf )



  ;

extern S16 cmPkCztBndCfm ( Pst * pst, SuId suId, U8 status )



  ;

extern S16 cmUnpkCztBndCfm ( CztBndCfm func, Pst * pst, Buffer *mBuf )



  ;

extern S16 cmPkCztGpReq ( Pst * pst, SpId spId, CztEvnt * gpReq )



  ;

extern S16 cmUnpkCztGpReq ( CztGpReq func, Pst * pst, Buffer *mBuf )



  ;

extern S16 cmPkCztGpInd ( Pst * pst, SuId suId, CztEvnt * gpInd )



  ;

extern S16 cmUnpkCztGpInd ( CztGpInd func, Pst * pst, Buffer *mBuf )



  ;

extern S16 cmPkCztGpRsp ( Pst * pst, SpId spId, CztEvnt * gpRsp )



  ;

extern S16 cmUnpkCztGpRsp ( CztGpRsp func, Pst * pst, Buffer *mBuf )



  ;

extern S16 cmPkCztGpCfm ( Pst * pst, SuId suId, CztEvnt * gpCfm )



  ;

extern S16 cmUnpkCztGpCfm ( CztGpCfm func, Pst * pst, Buffer *mBuf )



  ;

extern S16 cmPkCztGpRetxReq ( Pst * pst, SpId spId, CztReTxInfo *retxInfo )



  ;

extern S16 cmUnpkCztGpRetxReq ( CztGpRetxReq func, Pst * pst, Buffer *mBuf )



  ;

extern S16 cmPkCztBmpReq ( Pst * pst, SpId spId, CztEvnt * bmpEvnt )



  ;

extern S16 cmUnpkCztBmpReq ( CztBmpReq func, Pst * pst, Buffer *mBuf )



  ;

extern S16 cmPkCztBmpInd ( Pst * pst, SuId suId, CztEvnt * bmpEvnt )



  ;

extern S16 cmUnpkCztBmpInd ( CztBmpInd func, Pst * pst, Buffer *mBuf )



  ;

extern S16 cmPkCztBmpRsp ( Pst * pst, SpId spId, CztEvnt * bmpRsp )



  ;

extern S16 cmUnpkCztBmpRsp ( CztBmpRsp func, Pst * pst, Buffer *mBuf )



  ;

extern S16 cmPkCztBmpCfm ( Pst * pst, SuId suId, CztEvnt * bmpCfm )



  ;

extern S16 cmUnpkCztBmpCfm ( CztBmpCfm func, Pst * pst, Buffer *mBuf )



  ;

extern S16 cmPkCztGpErrReq ( Pst * pst, SpId spId, CztEvnt * gpErrReq )



  ;

extern S16 cmUnpkCztGpErrReq ( CztGpErrReq func, Pst * pst, Buffer *mBuf )



  ;

extern S16 cmPkCztGpErrInd ( Pst * pst, SuId suId, CztEvnt * gpErrInd )



  ;

extern S16 cmUnpkCztGpErrInd ( CztGpErrInd func, Pst * pst, Buffer *mBuf )



  ;

extern S16 cmPkCztLclErrorInd ( Pst * pst, SuId suId, CztLclErrInd * cztLclErrInd )



  ;

extern S16 cmUnpkCztLclErrorInd ( CztLclErrorInd func, Pst * pst, Buffer *mBuf )



  ;

extern S16 cmPkCztRelReq ( Pst * pst, SpId spId, CztRlsReq *rlsReq )



  ;

extern S16 cmUnpkCztRelReq ( CztRelReq func, Pst * pst, Buffer *mBuf )



  ;

extern S16 cmPkCztRlsReq
( CztRlsReq *param, Buffer *mBuf )


  ;
extern S16 cmUnpkCztRlsReq
( CztRlsReq *param, Buffer *mBuf )


  ;

extern S16 cmPkCztRelCfm ( Pst * pst, SuId suId, CztRlsCfm * rlsCfm )



  ;

extern S16 cmUnpkCztRelCfm ( CztRelCfm func, Pst * pst, Buffer *mBuf )



  ;

extern S16 cmPkCztStatusInd ( Pst * pst, SuId suId, CztStaInd * cztSta )



  ;

extern S16 cmUnpkCztStatusInd ( CztStatusInd func, Pst * pst, Buffer *mBuf )



  ;

extern S16 cmPkCztDynamPeerAssocInd ( Pst * pst, SuId suId, CztPeerAssocInd * peerAssocInd )



  ;

extern S16 cmUnpkCztDynamPeerAssocInd ( CztDynamPeerAssocInd func, Pst * pst, Buffer *mBuf )



  ;

extern S16 cmPkCztDynamPeerAssocRsp ( Pst * pst, SuId suId, CztPeerAssocRsp * peerAssocRsp )



  ;

extern S16 cmUnpkCztDynamPeerAssocRsp ( CztDynamPeerAssocRsp func, Pst * pst, Buffer *mBuf )



  ;


extern S16 cmPkCztNetAddrLst ( CztNetAddrLst *param, Buffer *mBuf )


  ;
extern S16 cmUnpkCztNetAddrLst ( CztNetAddrLst *param, Buffer *mBuf )


  ;


extern S16 cmPkCztReqStatus ( CztReqStatus *param, Buffer *mBuf )


  ;
extern S16 cmUnpkCztReqStatus ( CztReqStatus *param, Buffer *mBuf )


  ;
extern S16 cmPkCztEvnt ( CztEvnt *param, Buffer *mBuf )


  ;
extern S16 cmUnpkCztEvnt ( CztEvnt *param, Buffer *mBuf )


  ;
extern S16 cmPkCztStaInd ( CztStaInd *param, Buffer *mBuf )


  ;
extern S16 cmUnpkCztStaInd ( CztStaInd *param, Buffer *mBuf )


  ;
extern S16 cmPkCztUeInfo ( CztUeInfo *param, Buffer *mBuf )


  ;
extern S16 cmUnpkCztUeInfo ( CztUeInfo *param, Buffer *mBuf )


  ;
extern S16 cmPkRsrcProcInfo ( CztRsrcProcInfo *param, Buffer *mBuf )


  ;
extern S16 cmUnpkRsrcProcInfo ( CztRsrcProcInfo *param, Buffer *mBuf )


  ;
extern S16 cmPkCztLclErrInd ( CztLclErrInd *param, Buffer *mBuf )


  ;

extern S16 cmPkCztReTxInfo
( CztReTxInfo *param, Buffer *mBuf )


  ;
extern S16 cmUnpkCztReTxInfo
( CztReTxInfo *param, Buffer *mBuf )


  ;

extern S16 cmUnpkCztLclErrInd ( CztLclErrInd *param, Buffer *mBuf )


  ;


extern S16 cmPkCztPeerAssocInd ( CztPeerAssocInd *param, Buffer *mBuf )


  ;
extern S16 cmUnpkCztPeerAssocInd ( CztPeerAssocInd *param, Buffer *mBuf )


  ;
extern S16 cmPkCztPeerAssocRsp ( CztPeerAssocRsp *param, Buffer *mBuf )


  ;
extern S16 cmUnpkCztPeerAssocRsp ( CztPeerAssocRsp *param, Buffer *mBuf )


  ;

extern S16 cmPkCztAudReq (Pst *pst, SpId spId, CztAudEvnt *audEvnt);
extern S16 cmPkCztAudCfm (Pst *pst, SuId suId, CztAudEvnt *audEvnt);
extern S16 cmPkCztAudEvnt ( CztAudEvnt *audEvnt, Buffer *mBuf);
extern S16 cmUnpkCztAudEvnt ( CztAudEvnt *audEvnt, Buffer *mBuf);
extern S16 cmUnpkCztAudReq (CztAudReq func, Pst *pst, Buffer *mBuf )


                                   ;
extern S16 cmUnpkCztAudCfm (CztAudCfm func, Pst *pst, Buffer *mBuf);
typedef struct czNetAddrLst
{
   U8 nmb;
   CmNetAddr nAddr[5];
} CzNetAddrLst;





typedef struct czSctpAddr
{
   CzNetAddrLst ipAddr;
   U16 sctPort;
} CzSctpAddr;






typedef struct czGenCfg
{
   S16 nmbCztSaps;
   S16 nmbSctSaps;
   U32 maxNmbPeer;
   Status memUpperThr;
   Status memLowerThr;







   S16 timeRes;
   U32 dbgMask;

   Pst lmPst;
} CzGenCfg;
typedef struct czGenReCfg
{
   S16 timeRes;

   U32 dbgMask;

   Status memUpperThr;
   Status memLowerThr;
} CzGenReCfg;
typedef struct czProtCfg
{
   U32 eNbId;
   U16 tRELOCprep;

   U16 tX2RELOCOverall;


   U16 timeToWait;




   Bool dynamPeerFlag;
   SpId defDPeerUSapId;
   CzSctpAddr srcAddr;

} CzProtCfg;
typedef struct czProtReCfg
{
   Bool dynamPeerFlag;

   SpId defDPeerUSapId;

   U16 tRELOCprep;

   U16 tX2RELOCOverall;


   U16 timeToWait;
} CzProtReCfg;
typedef struct czCztSapCfg
{
   SpId spId;
   Selector selector;




   MemoryId mem;


   Priority priority;



   Route route;


} CzCztSapCfg;
typedef struct czSctSapCfg
{
   SuId suId;


   SpId spId;
   Selector selector;




   MemoryId mem;
   Priority priority;
   Route route;
   ProcId dstProcId;
   Ent dstEntId;
   Inst dstInstId;
   TmrCfg tBndTmr;
   U8 maxBndRetry;
} CzSctSapCfg;





typedef struct czAssocCfg
{
   U16 locOutStrms;
   CmNetAddr priDstAddr;
   SctPort dstPort;



   SctNetAddrLst dstAddrLst;


} CzAssocCfg;
typedef struct czPeerCfg
{
   U32 peerId;
   SpId tSapId;
   SpId uSapId;
   U16 eAValue;

   U16 iPAValue;

   TknU16 globalProcStrmId;
   CzAssocCfg assocCfg;
} CzPeerCfg;







typedef struct czPeerLstCfg
{
   U32 nmbPeers;
   CzPeerCfg *peerCfg;
} CzPeerLstCfg;
typedef struct czCfg
{
   union
   {
   CzGenCfg gen;
   CzProtCfg prot;
   CzCztSapCfg cztSap;
   CzSctSapCfg sctSap;
   CzPeerLstCfg peerLst;
   }u;
   union
   {
    CzGenReCfg genReCfg;
    CzProtReCfg protReCfg;
   }r;
} CzCfg;
typedef struct czSapCntrl
{
   SpId id;
} CzSapCntrl;
typedef struct czEndPtCntrl
{
   U32 endPtId;
   SpId tsapId;
} CzEndPtCntrl;
typedef struct czPeerCntrl
{
   U32 peerId;
} CzPeerCntrl;
typedef struct czDbgCntrl
{
   U32 dbgMask;
} CzDbgCntrl;
typedef struct czLSapTrcCntrl
{
   SpId lSapId;
   U32 trcMask;
   S32 trcLen;

} CzLSapTrcCntrl;
typedef struct czPNodeTrcCntrl
{
   U32 peerId;
   U32 trcMask;
   S32 trcLen;

} CzPNodeTrcCntrl;
typedef struct czModAsPriAddrCntrl
{
     U32 peerId;
     CmNetAddr priDstAddr;
}CzModAsPriAddrCntrl;
typedef struct czCntrl
{
   Action action;

   Action subAction;


   union
   {
      CzSapCntrl sap;

      CzEndPtCntrl endPtCntrl;
      CzPeerCntrl peer;






      CzDbgCntrl dbg;



      CzLSapTrcCntrl lSapTrc;
      CzPNodeTrcCntrl pNodeTrc;
      CzModAsPriAddrCntrl modPriAddrCntrl;






   }u;
} CzCntrl;
typedef struct czGenSta
{
   U32 memSize;
   U32 memAlloc;
   Cntr nmbActvPeerConn;
   U16 tRELOCprep;

   U16 tX2RELOCOverall;


   U16 timeToWait;
} CzGenSta;







typedef struct czSSapSta
{
   SpId sSapId;
   U8 status;
} CzSSapSta;
typedef struct czTSapSta
{
   SpId tSapId;
   U8 status;
} CzTSapSta;
typedef struct czPeerStaInfo
{
   U8 peerState;
   U8 assocState;

   U8 tsapState;
   U32 peerId;
   SpId sapId;
   UConnId suAssocId;

   UConnId spAssocId;

   U32 peerENbId;
} CzPeerStaInfo;
typedef struct czPeerSta
{
   U32 nmbPeer;
   CzPeerStaInfo *peerStaInfo;
} CzPeerSta;
typedef struct czSsta
{
   union
   {
      SystemId sysId;
      CzGenSta genSta;
      CzSSapSta sSapSta;



      CzTSapSta tSapSta;



      CzPeerSta peerSta;
   }s;
} CzSsta;
typedef struct czCntr
{
   StsCntr tx;
   StsCntr rx;
   StsCntr errTx;
   StsCntr errRx;
} CzCntr;
typedef struct czPduSts
{
   CzCntr hovrRqst;
   CzCntr hovrReqAck;
   CzCntr hovrPrepFail;
   CzCntr sNStatusTfr;
   CzCntr hovrCancel;
   CzCntr ueCntxtRls;
   CzCntr loadInform;
   CzCntr errInd;
   CzCntr x2SetupRqst;
   CzCntr x2SetupResp;
   CzCntr x2SetupFail;
   CzCntr resetRqst;
   CzCntr resetResp;
   CzCntr eNBCfgUpdRqst;

   CzCntr eNBCfgUpdAck;

   CzCntr eNBCfgUpdFail;
   CzCntr resStatusRqst;
   CzCntr resStatusResp;
   CzCntr resStatusFail;
   CzCntr resStatusUpd;

   CzCntr mobChangeReq;
   CzCntr mobChangeAck;
   CzCntr mobChangeFail;
   CzCntr rlfIndication;
   CzCntr hoReport;
   CzCntr cellActvReq;
   CzCntr cellActvRes;
   CzCntr cellActvFail;
} CzPduSts;







typedef struct czPeerSts
{
   CzPduSts pdu;
   Cntr nmbDecErr;
   Cntr nmbEncErr;
   Cntr nmbUnexpEvt;
} CzPeerSts;






typedef struct czPeerNodeSts
{
   U32 peerId;
   CzPeerSts cfm;
} CzPeerNodeSts;







typedef struct czGenSts
{
   Cntr maxNumPeerConn;

   Cntr nmbPeerConnected;

   Cntr nmbPeerConnFail;

   Cntr nmbDecErr;

   Cntr nmbEncErr;
   U32 maxMemAlloc;
   CzPduSts pdu;
} CzGenSts;
typedef struct czSts
{
   union
   {
      CzPeerNodeSts nodeSts;
      CzGenSts genSts;
   }u;
} CzSts;







typedef struct czPeerInfo
{
 U32 peerId;
 CmNetAddr dstNAddr;
}CzPeerInfo;
typedef struct czUeInfo
{
 U32 peerId;
 U16 ueId;
}CzUeInfo;







typedef struct czUstaDgn
{
   U8 alarmType;
   union
   {
      MemoryId mem;
      SpId sapId;
      CzPeerInfo peerInfo;
      CzUeInfo ueInfo;
   }u;

} CzUstaDgn;
typedef struct czUsta
{
   DateTime dt;
   CmAlarm alarm;
   CzUstaDgn dgn;







} CzUsta;
typedef struct czTrc
{
   DateTime dt;



   U16 event;

   CzSctpAddr srcAddr;
   CzSctpAddr dstAddr;
   SpId sapId;
   U32 peerId;
} CzTrc;
typedef struct czMngmt
{
   Header hdr;
   CmStatus cfm;


   union
   {

      CzCfg cfg;

      CzCntrl cntrl;


      CzSsta ssta;
      CzUsta usta;

      CzSts sts;
      CzTrc trc;

   }t;
} CzMngmt;

extern S16 czActvTsk (Pst *pst, Buffer *mBuf);
extern S16 smCzActvTsk (Pst *pst, Buffer *mBuf);

typedef S16 (*LczCfgReq) ( Pst * pst, CzMngmt * cfg)

                             ;




typedef S16 (*LczCfgCfm) ( Pst * pst, CzMngmt * cfm)

                             ;




typedef S16 (*LczStsReq) ( Pst * pst, Action action, CzMngmt * sts)


                             ;





typedef S16 (*LczStsCfm) ( Pst * pst, CzMngmt * cfm)

                             ;





typedef S16 (*LczStaReq) ( Pst * pst, CzMngmt * sta)

                             ;





typedef S16 (*LczStaCfm) ( Pst * pst, CzMngmt * cfm)

                             ;





typedef S16 (*LczStaInd) ( Pst * pst, CzMngmt * usta)

                              ;





typedef S16 (*LczCntrlReq) ( Pst * pst, CzMngmt * cntrl)

                               ;





typedef S16 (*LczCntrlCfm) ( Pst * pst, CzMngmt * cfm)

                             ;





typedef S16 (*LczTrcInd) ( Pst * pst, CzMngmt * trc, Buffer * trcBuf)


                                ;
 extern S16 CzMiLczCfgReq (Pst * pst, CzMngmt * cfg)
                                               ;
extern S16 CzMiLczCfgCfm ( Pst * pst, CzMngmt * cfm )


  ;
extern S16 CzMiLczStsReq ( Pst *pst, Action action, CzMngmt *sts )



  ;
extern S16 CzMiLczStsCfm ( Pst * pst, CzMngmt * cfm )


  ;
extern S16 CzMiLczStaReq ( Pst * pst, CzMngmt * sta )


  ;
extern S16 CzMiLczStaCfm ( Pst * pst, CzMngmt * cfm )


  ;
extern S16 CzMiLczStaInd ( Pst * pst, CzMngmt * usta )


  ;
extern S16 CzMiLczCntrlReq ( Pst * pst, CzMngmt * cntrl )


  ;
extern S16 CzMiLczCntrlCfm ( Pst * pst, CzMngmt * cfm )


  ;
extern S16 CzMiLczTrcInd ( Pst * pst, CzMngmt * trc, Buffer * trcBuf )



  ;





extern S16 SmMiLczCfgReq ( Pst * pst, CzMngmt * cfg )


  ;




extern S16 SmMiLczCfgCfm ( Pst * pst, CzMngmt * cfm )


  ;




extern S16 SmMiLczStsReq ( Pst * pst, Action action, CzMngmt * sts )



  ;




extern S16 SmMiLczStsCfm ( Pst * pst, CzMngmt * cfm )


  ;




extern S16 SmMiLczStaReq ( Pst * pst, CzMngmt * sta )


  ;




extern S16 SmMiLczStaCfm ( Pst * pst, CzMngmt * cfm )


  ;




extern S16 SmMiLczStaInd ( Pst * pst, CzMngmt * usta )


  ;




extern S16 SmMiLczCntrlReq ( Pst * pst, CzMngmt * cntrl )


  ;




extern S16 SmMiLczCntrlCfm ( Pst * pst, CzMngmt * cfm )


  ;




extern S16 SmMiLczTrcInd ( Pst * pst, CzMngmt * trc, Buffer * trcBuf )



  ;





extern S16 cmPkLczCfgReq ( Pst * pst, CzMngmt * cfg )


  ;


extern S16 cmUnpkLczCfgReq ( LczCfgReq func, Pst * pst, Buffer *mBuf )



  ;


extern S16 cmPkLczCfgCfm ( Pst * pst, CzMngmt * cfm )


  ;


extern S16 cmUnpkLczCfgCfm ( LczCfgCfm func, Pst * pst, Buffer *mBuf )



  ;


extern S16 cmPkLczStsReq ( Pst * pst, Action action, CzMngmt * sts )



  ;


extern S16 cmUnpkLczStsReq ( LczStsReq func, Pst * pst, Buffer *mBuf )



  ;


extern S16 cmPkLczStsCfm ( Pst * pst, CzMngmt * cfm )


  ;


extern S16 cmUnpkLczStsCfm ( LczStsCfm func, Pst * pst, Buffer *mBuf )



  ;


extern S16 cmPkLczStaReq ( Pst * pst, CzMngmt * sta )


  ;


extern S16 cmUnpkLczStaReq ( LczStaReq func, Pst * pst, Buffer *mBuf )



  ;


extern S16 cmPkLczStaCfm ( Pst * pst, CzMngmt * cfm )


  ;


extern S16 cmUnpkLczStaCfm ( LczStaCfm func, Pst * pst, Buffer *mBuf )



  ;


extern S16 cmPkLczStaInd ( Pst * pst, CzMngmt * usta )


  ;


extern S16 cmUnpkLczStaInd ( LczStaInd func, Pst * pst, Buffer *mBuf )



  ;


extern S16 cmPkLczCntrlReq ( Pst * pst, CzMngmt * cntrl )


  ;


extern S16 cmUnpkLczCntrlReq ( LczCntrlReq func, Pst * pst, Buffer *mBuf )



  ;


extern S16 cmPkLczCntrlCfm ( Pst * pst, CzMngmt * cfm )


  ;


extern S16 cmUnpkLczCntrlCfm ( LczCntrlCfm func, Pst * pst, Buffer *mBuf )



  ;


extern S16 cmPkLczTrcInd ( Pst * pst, CzMngmt * trc, Buffer * trcBuf )



  ;


extern S16 cmUnpkLczTrcInd ( LczTrcInd func, Pst * pst, Buffer *mBuf )



  ;
extern S16 cmPkCzSctpAddr ( CzSctpAddr *param, Buffer *mBuf )


  ;
extern S16 cmUnpkCzSctpAddr ( CzSctpAddr *param, Buffer *mBuf )


  ;
extern S16 cmPkCzGenCfg ( CzGenCfg *param, Buffer *mBuf )


  ;
extern S16 cmUnpkCzGenCfg ( CzGenCfg *param, Buffer *mBuf )


  ;
extern S16 cmPkCzGenReCfg ( CzGenReCfg *param, Buffer *mBuf )


  ;
extern S16 cmUnpkCzGenReCfg ( CzGenReCfg *param, Buffer *mBuf )


  ;
extern S16 cmPkCzProtCfg ( CzProtCfg *param, Buffer *mBuf )


  ;
extern S16 cmUnpkCzProtCfg ( CzProtCfg *param, Buffer *mBuf )


  ;
extern S16 cmPkCzProtReCfg ( CzProtReCfg *param, Buffer *mBuf )


  ;
extern S16 cmUnpkCzProtReCfg ( CzProtReCfg *param, Buffer *mBuf )


  ;
extern S16 cmPkCzCztSapCfg ( CzCztSapCfg *param, Buffer *mBuf )


  ;
extern S16 cmUnpkCzCztSapCfg ( CzCztSapCfg *param, Buffer *mBuf )


  ;
extern S16 cmPkCzSctSapCfg ( CzSctSapCfg *param, Buffer *mBuf )


  ;
extern S16 cmUnpkCzSctSapCfg ( CzSctSapCfg *param, Buffer *mBuf )


  ;
extern S16 cmPkCzAssocCfg ( CzAssocCfg *param, Buffer *mBuf )


  ;
extern S16 cmUnpkCzAssocCfg ( CzAssocCfg *param, Buffer *mBuf )


  ;
extern S16 cmPkCzPeerCfg ( CzPeerCfg *param, Buffer *mBuf )


  ;
extern S16 cmUnpkCzPeerCfg ( CzPeerCfg *param, Buffer *mBuf )


  ;
extern S16 cmPkCzPeerLstCfg ( Pst *pst, CzPeerLstCfg *param, Buffer *mBuf )



  ;
extern S16 cmUnpkCzPeerLstCfg ( Pst *pst, CzPeerLstCfg *param, Buffer *mBuf )



  ;

extern S16 cmPkCzCfg ( CzCfg *param, Elmnt elmnt, Buffer *mBuf, Pst *pst )




  ;
extern S16 cmUnpkCzCfg ( CzCfg *param, Elmnt elmnt, Buffer *mBuf, Pst *pst )




  ;
extern S16 cmPkCzSapCntrl ( CzSapCntrl *param, Buffer *mBuf )


  ;

extern S16 cmPkCzModAsPriAddrCntrl ( CzModAsPriAddrCntrl *param, Buffer *mBuf )


  ;
extern S16 cmUnpkCzSapCntrl ( CzSapCntrl *param, Buffer *mBuf )


  ;
extern S16 cmPkCzEndPtCntrl ( CzEndPtCntrl *param, Buffer *mBuf )


  ;
extern S16 cmUnpkCzEndPtCntrl ( CzEndPtCntrl *param, Buffer *mBuf )


  ;

extern S16 cmUnpkCzModAsPriAddrCntrl ( CzModAsPriAddrCntrl *param, Buffer *mBuf )


  ;

extern S16 cmPkCzPeerCntrl ( CzPeerCntrl *param, Buffer *mBuf )


  ;
extern S16 cmUnpkCzPeerCntrl ( CzPeerCntrl *param, Buffer *mBuf )


  ;



extern S16 cmPkCzDbgCntrl ( CzDbgCntrl *param, Buffer *mBuf )


  ;
extern S16 cmUnpkCzDbgCntrl ( CzDbgCntrl *param, Buffer *mBuf )


  ;



extern S16 cmPkCzLSapTrcCntrl ( CzLSapTrcCntrl *param, Buffer *mBuf )


  ;
extern S16 cmUnpkCzLSapTrcCntrl ( CzLSapTrcCntrl *param, Buffer *mBuf )


  ;
extern S16 cmPkCzPNodeTrcCntrl ( CzPNodeTrcCntrl *param, Buffer *mBuf )


  ;
extern S16 cmUnpkCzPNodeTrcCntrl ( CzPNodeTrcCntrl *param, Buffer *mBuf )


  ;
extern S16 cmPkCzCntrl ( CzCntrl *param, S16 eventType, Buffer *mBuf )



  ;
extern S16 cmUnpkCzCntrl ( CzCntrl *param, Elmnt elmnt, Buffer *mBuf )






  ;
extern S16 cmPkCzGenSta ( CzGenSta *param, Buffer *mBuf )


  ;
extern S16 cmUnpkCzGenSta ( CzGenSta *param, Buffer *mBuf )


  ;
extern S16 cmPkCzSSapSta ( CzSSapSta *param, Buffer *mBuf )


  ;
extern S16 cmUnpkCzSSapSta ( CzSSapSta *param, Buffer *mBuf )


  ;
extern S16 cmPkCzTSapSta ( CzTSapSta *param, Buffer *mBuf )


  ;
extern S16 cmPkCzNetAddrLst
( CzNetAddrLst *param, Buffer *mBuf )


  ;
extern S16 cmUnpkCzNetAddrLst
( CzNetAddrLst *param, Buffer *mBuf )


  ;

extern S16 cmUnpkCzTSapSta ( CzTSapSta *param, Buffer *mBuf )


  ;
extern S16 cmPkCzPeerStaInfo ( CzPeerStaInfo *param, Buffer *mBuf )


  ;
extern S16 cmUnpkCzPeerStaInfo ( CzPeerStaInfo *param, Buffer *mBuf )


  ;
extern S16 cmPkCzPeerSta ( CzPeerSta *param, Buffer *mBuf )


  ;
extern S16 cmUnpkCzPeerSta ( Pst *pst, CzPeerSta *param, Buffer *mBuf )



  ;
extern S16 cmPkCzSsta ( CzSsta *param, Elmnt elmnt, Buffer *mBuf )



  ;
extern S16 cmUnpkCzSsta ( CzSsta *param, Elmnt elmnt, Buffer *mBuf, Pst *pst )




  ;
extern S16 cmPkCzCntr ( CzCntr *param, Buffer *mBuf )


  ;
extern S16 cmUnpkCzCntr ( CzCntr *param, Buffer *mBuf )


  ;
extern S16 cmPkCzPeerSts ( CzPeerSts *param, Buffer *mBuf )


  ;
extern S16 cmUnpkCzPeerSts ( CzPeerSts *param, Buffer *mBuf )


  ;

extern S16 cmPkCzPduSts ( CzPduSts *param, Buffer *mBuf )


  ;
extern S16 cmUnpkCzPduSts ( CzPduSts *param, Buffer *mBuf )


  ;
extern S16 cmPkCfm ( CzPeerSts *param, Buffer *mBuf )


  ;
extern S16 cmUnpkCfm ( CzPeerSts *param, Buffer *mBuf )


  ;
extern S16 cmPkCzPeerNodeSts ( CzPeerNodeSts *param, Buffer *mBuf )


  ;
extern S16 cmUnpkCzPeerNodeSts ( CzPeerNodeSts *param, Buffer *mBuf )


  ;
extern S16 cmPkCzGenSts ( CzGenSts *param, Buffer *mBuf )


  ;
extern S16 cmUnpkCzGenSts ( CzGenSts *param, Buffer *mBuf )


  ;
extern S16 cmPkCzSts ( CzSts *param, S16 eventType, Buffer *mBuf )



  ;
extern S16 cmUnpkCzSts ( CzSts *param, S16 eventType, Buffer *mBuf )



  ;
extern S16 cmPkCzUstaDgn ( CzUstaDgn *param, Buffer *mBuf )


  ;
extern S16 cmUnpkCzUstaDgn ( CzUstaDgn *param, Buffer *mBuf )


  ;
extern S16 cmPkCzUeInfo
( CzUeInfo *param, Buffer *mBuf )


  ;
extern S16 cmUnpkCzUeInfo
( CzUeInfo *param, Buffer *mBuf )


  ;

extern S16 cmPkCzPeerInfo
( CzPeerInfo *param, Buffer *mBuf )


  ;
extern S16 cmUnpkCzPeerInfo
( CzPeerInfo *param, Buffer *mBuf )


  ;


extern S16 cmPkCzUsta ( CzUsta *param, Buffer *mBuf )


  ;
extern S16 cmUnpkCzUsta ( CzUsta *param, Buffer *mBuf )


  ;
extern S16 cmPkCzTrc ( CzTrc *param, Buffer *mBuf )


  ;
extern S16 cmUnpkCzTrc ( CzTrc *param, Buffer *mBuf )


  ;
extern S16 cmPkCzMngmt ( CzMngmt *param, S16 eventType, Buffer *mBuf, Pst *pst )





  ;
extern S16 cmUnpkCzMngmt ( CzMngmt *param, S16 eventType, Buffer *mBuf, Pst *pst )




  ;
extern S16 smCzActvInit (Ent ent, Inst inst, Region region, Reason reason)
                 ;
extern S16 czActvInit (Ent ent, Inst inst, Region region, Reason reason)
                 ;
typedef enum czDir
{
   CZ_DIR_OUT = 0,
   CZ_DIR_IN,
   CZ_DIR_IN_OUT
}CzDir;





typedef enum czProcDir
{
   CZ_TGT_SETUP = 1,
   CZ_SRC_SETUP = 2,
   CZ_TGT_RESET = 4,
   CZ_SRC_RESET = 8
}CzProcDir;





typedef enum czEnbType
{
   CZ_SRC = 1,
   CZ_TGT,
   CZ_UNKNOWN_NODE
}CzEnbType;



typedef enum czProcType
{
   CZ_GP = 0,
   CZ_BMP,
   CZ_ERR,
   CZ_PRIV,
   CZ_PROC_UNKNOWN
}CzProcType;
typedef enum czBmpEvnt
{
   CZ_EVNT_HO_REQ = 0,
   CZ_EVNT_HO_REQ_ACK,
   CZ_EVNT_HO_PREP_FAIL,
   CZ_EVNT_HO_CANCEL,
   CZ_EVNT_SN_STATUS_TRFR,
   CZ_EVNT_UE_CXT_RELEASE
}CzBmpEvnt;




typedef enum czBmpState
{
   CZ_BMP_HO_IDLE = 0,
   CZ_BMP_HO_PROGRESS,
   CZ_BMP_HO_PREPARED
}CzBmpState;
typedef enum czGpmEvent
{
    CZ_EVNT_ERR_IND = 0,
    CZ_EVNT_SETUP_REQ,
    CZ_EVNT_SETUP_RSP,
    CZ_EVNT_SETUP_FAIL,
    CZ_EVNT_RESET_REQ,
    CZ_EVNT_RESET_RSP,
    CZ_EVNT_ENB_CFG_UPD_REQ,
    CZ_EVNT_ENB_CFG_UPD_ACK,
    CZ_EVNT_ENB_CFG_UPD_FAIL,
    CZ_EVNT_LOAD_IND,
    CZ_EVNT_RES_STA_REQ,
    CZ_EVNT_RES_STA_RSP,
    CZ_EVNT_RES_STA_FAIL,
    CZ_EVNT_RES_STA_UPDATE,
    CZ_EVNT_MOB_CHANGE_REQ,
    CZ_EVNT_MOB_CHANGE_ACK,
    CZ_EVNT_MOB_CHANGE_FAIL,
    CZ_EVNT_RLF_INDICATION,
    CZ_EVNT_HO_REPORT,
    CZ_EVNT_CELL_ACTIVATION_REQ,
    CZ_EVNT_CELL_ACTIVATION_RES,
    CZ_EVNT_CELL_ACTIVATION_FAIL,
    CZ_EVNT_PRIVATE,
    CZ_EVNT_MAX
}CzGpmEvent;







typedef enum czGpStates
{
   CZ_GP_IDLE,
   CZ_GP_CONNECTING,
   CZ_GP_CONNECTED,

   CZ_GP_STATE_MAX
}CzGpStates;
typedef enum czRsrcState
{
   CZ_RSRC_IDLE = 0,
   CZ_RSRC_START_PROGRESS,
   CZ_RSRC_READY,
   CZ_RSRC_STOP_PROGRESS
}CzRsrcState;






typedef enum czRsrcEnbType
{
   CZ_ENB1 = 0x10000,
   CZ_ENB2 = 0x20000
}CzRsrcEnbType;






typedef struct czRsrcInfo
{
   U16 eNb1measId;
   U16 eNb2measId;
}CzRsrcInfo;
typedef struct czGpmCb
{
   Bool procPending;

   Bool wait;



   CmTimer gpTimer;


   Buffer *retxBuf;
   U8 retxMsgType;

}CzGpmCb;
typedef struct czEndpCb
{
   CmHashListCp assocCp;
   UConnId locSpEndpId;
   UConnId locSuEndpId;
   State state;
   CztPort port;
   CzNetAddrLst srcAddrLst;
}CzEndpCb;
typedef struct czSctSapCb
{
   State state;

   SuId suId;


   SpId spId;
   Pst pst;
   Ent contEnt;
   U32 trcMask;
   S32 trcLen;

   U8 maxBndRetry;
   TmrCfg tBndTmr;
   U8 retryCnt;
   CmTimer timers[5];
   Bool cfgDone;
   CzEndpCb endpCb;
   UConnId nxtSuAssocId;

}CzSctSapCb;
typedef struct czCztSapCb
{
   SuId suId;
   SpId spId;
   Pst pst;
   State state;
   Bool resCong;
}CzCztSapCb;





typedef struct czPeerCbCfg
{
   Bool isDynamCfgd;

   U16 eAValue;

   U16 iPAValue;

   U32 trcMask;


   S32 trcLen;


   CztStrmId globalStreamId;
   CzPeerNodeSts peerSts;
   CmNetAddr priDstAddr;
}CzPeerCbCfg;

typedef struct czAssocCb CzAssocCb;






typedef struct czPeerCb
{
   CmHashListEnt hashEnt;
   U32 peerId;
   U8 state;
   CzPeerCbCfg peerCfg;
   CzCztSapCb *cztSapCb;
   CzSctSapCb *sctSapCb;
   CzAssocCb *assocCb;
   U16 nextStreamId;

   CzGpmCb gpmCb;

   CmHashListCp ueCbHlCp;

   CmHashListCp resrcCbHlCp;

   Bool delPcb;
}CzPeerCb;



struct czAssocCb
{
   UConnId spAssocId;

   UConnId suAssocId;

   State assocState;

   CzPeerCb *peer;
   CzAssocCfg *assocCfg;
};
typedef struct czRsrcCb
{
   CmHashListEnt actRsrcEnt;
   U32 rsrcCbKey;
   U16 eNb1MeasId;
   U16 eNb2MeasId;
   CzRsrcState state;
   CzPeerCb *peerCb;

   Buffer *retxBuf;




}CzRsrcCb;
typedef struct czIeInfo
{
   Bool pres;
   U8 ieId;
   U8 crit;
   U8 typOfErr;
}CzIeInfo;

typedef CztUeInfo CzMsgInfo;
typedef struct czUeCb
{
   CmHashListEnt actUeEnt;
   U32 ueCbKey;
   U8 eNbType;

   U16 oldUEX2APId;

   U16 newUEX2APId;

   U8 state;

   CzPeerCb *peerCb;

   CmTimer bmpTimers[2];




   CztStrmId streamId;

}CzUeCb;
typedef struct czDynamPeerAssocEntry
{
   CmNetAddr peerAddr;
   CztPort port;
} CzDynamPeerAssocEntry;

typedef struct czDynamPeerAssocCb
{
   CmHashListEnt hashEnt;

   CzDynamPeerAssocEntry peerAssocEntry;

   CzPeerCb *peerCbPtr;
   SctAssocIndParams assocParams;
} CzDynamPeerAssocCb;
typedef struct czEnbCb
{
   CzProtCfg protCfg;
   Bool cfgDone;

   CmHashListCp peerCbLst;

   CmHashListCp dynamPeerAssocLst;

}CzEnbCb;







typedef struct _czCb
{
   TskInit init;
   CzGenCfg genCfg;
   CzEnbCb nodeCb;
   CzCztSapCb **cztSapLst;
   CzSctSapCb **sctSapLst;
   CmTqCp czGenTqCp;
   CmTqType czGenTq[64];
   CmTqCp czLyrTqCp;
   CmTqType czLyrTq[64];
   CzGenSts genSts;
   CzGenSta genSta;
   Bool shutdown;



}CzCb;






   extern CzCb czCb;





extern Void czProcLyrTmrExpiry ( Ptr cb, S16 tmrEvnt);




   extern S16 czActvTmr (Void);


extern S16 czLmmGetSId (SystemId *s);



extern S16 czLmmSendLmTrc (S32 trcLen, CzTrc *trcParam, Buffer *mBuf);

extern S16 czRegInitTmr (Void);






extern S16 czNmmFndPeer (U32 peerId, CzPeerCb **peerCb);


extern S16 czNmmInitPeerLst (Void);


extern S16 czNmmAllocPeerCb (U32 peerId, CzPeerCb **peerCb);


extern S16 czNmmDeallocPeerCb (CzPeerCb *peer);


extern S16 czNmmDeallocAllPeerCb (SpId sapId, U8 opn);


extern S16 czNmmDisablePeer (CzPeerCb *peer, Bool assocTerm);


extern Void czNmmResetPeer (CzPeerCb *peer);



extern S16 czNmmAddRsrcCb (CzPeerCb *peerCb, U32 rsrcCbKey, CzRsrcCb **rsrcCb, U16 eNb1MeasId)


                                                      ;



extern S16 czNmmFindRsrcCb (CzPeerCb *peerCb, U32 rsrcCbKey, CzRsrcCb **rsrcCb)

                                                    ;

extern S16 czUbndCztSap (SpId sapId);



extern S16 czNmmDelRsrcCb (CzRsrcCb *rsrcCb);


extern S16 czLmmShutdown (Void);



extern S16 czNmmAddUeCb (CzPeerCb *peerCb, U32 ueCbKey, CzUeCb **ueCb, U16 oldUEX2APId)


                                                    ;



extern S16 czNmmFindUeCb (CzPeerCb *peerCb, U32 ueCbKey, CzUeCb **ueCb)
                                                ;



extern S16 czNmmDelUeCb (CzUeCb *ueCb);


extern CzPeerCb* czNmmMatchPeer (CztNetAddrLst *dstNAddrLst, SctPort port)
                                                                   ;

extern S16 czNmmHdlErrInd (CzPeerCb *peerCb, CztEvnt *evnt, U8 msgDirection)

                                                       ;





extern S16 czNmmAllocDynamPeerCb (SuId suId, CzPeerCb **peer)
                                                        ;

extern S16 czNmmDeallocDynamPeerCb (CzPeerCb *peer);

extern S16 czNmmFindDynamPeerAssocCb (CztNetAddrLst *dstAddrLst, CztPort dstPort, CzDynamPeerAssocCb **peerAssoc)

                                                                            ;


extern S16 czNmmRemDynamPeerAssoc (CzPeerCb *peer);
extern S16 czGpmFsmMsgHandler (CzPeerCb *peerCb, CztEvnt *pdu, U8 msgType, U8 dir)
                                                                              ;

extern S16 czGpmWaitTmrHdl (CzPeerCb *peerCb);

extern S16 czGpmRetransmit (CzPeerCb *peerCb, U8 msgType, U16 transId);

extern S16 czGpmHdlErrInd (CzPeerCb *peerCb, U8 msgType, CztEvnt *event, U8 eventDir)


                                                     ;

extern S16 czGpmHdlRsrcRetxReq (CzPeerCb* peerCb, U16 eNB1MeasID);

extern S16 czGpmRsrcFsmErr (CzPeerCb* peerCb, U8 msgType, CztEvnt* event,U8 dir)
                                                        ;

extern S16 czGpmHdlLdInd (CzPeerCb* peerCb, U8 msgType, CztEvnt* event,U8 dir)
                                                      ;

extern S16 czGpmHdlRsrcStsReq (CzPeerCb* peerCb, U8 msgType, CztEvnt* event,U8 dir)
                                                           ;

extern S16 czGpmHdlRsrcStsRsp (CzPeerCb* peerCb, U8 msgType, CztEvnt* event, U8 dir)
                                                            ;

extern S16 czGpmHdlRsrcStsFailr (CzPeerCb* peerCb, U8 msgType, CztEvnt* event, U8 dir)
                                                              ;

extern S16 czGpmHdlRsrcStsUpdt (CzPeerCb* peerCb, U8 msgType, CztEvnt* event, U8 dir)
                                                             ;
extern S16 czUimSndGpmInd (CzPeerCb *peerCb, CztEvnt *event);

extern S16 czUimSndGpmCfm (CzPeerCb *peerCb, CztEvnt *event);

extern S16 czUimSndBmpInd (CzPeerCb *peerCb, CztEvnt *event);

extern S16 czUimSndBmpCfm (CzPeerCb *peerCb, CztEvnt *event);

extern S16 czUimSndGpErrInd (CzPeerCb *peerCb, CztEvnt *event);

extern S16 czUimSndStaInd (CzCztSapCb *sapCb, CztStaInd *staInd);

extern S16 czUimSndPeerAssocInd (CzPeerCb *peerCb, CztPeerAssocInd *event)
                                                                       ;

extern S16 czUimSndErrInd (CzCztSapCb *sapCb, CztLclErrInd *errInd, CztEvnt *event, Buffer *mBuf)
                                                                           ;
typedef enum
{
   CZ_TMR_TIME_TO_WAIT = 1,

   CZ_TMR_TRELOCPREP,

   CZ_TMR_TX2RELOCOVERALL,

   CZ_TMR_SCT_BIND

}CzTmrType;


extern Void czGetSId (SystemId *s);


extern S16 czSchedGenTmr (S16 tmrEvent, Void *cb, U8 action);



extern Void czProcGenTmrExpiry (Ptr cb, S16 tmrEvnt);

extern S16 czStartTmr (CzTmrType tmrType, U16 delay , Void *tmrCb);


extern S16 czStopTmr (CzTmrType tmrType, Void *tmrCb);



extern S16 czProcTmrExpiry (Void *tmrCb, S16 tmrEvnt);

extern S16 czStopUeTmrs (CzUeCb *tmrCb);
extern S16 czBmpHdlHoEvnt (CzPeerCb *peerCb, CztEvnt *evnt, U8 hoMsgType, U8 msgDirectn)


                                                        ;
extern S16 czBmpHdlErrInd (CzPeerCb *peerCb, CztEvnt *evnt, U8 hoMsgType, U8 msgDirectn)


                                                       ;






extern S16 czBmpHdlTmrEvnt (CzUeCb *ueCb, S16 tmrEvnt)
                                                   ;
extern S16 czEdmEncode (Mem *mem, CztX2AP_PDU *x2apPdu, Buffer **mBuf)

                                         ;

extern S16 czEdmDecode (CztEvnt **event, Mem *sMem, Buffer *mBuf, CmPAsnErr *pasnErr)


                                               ;

extern S16 czGetIE (CztX2AP_PDU *pdu, U32 id, TknU8 **ie)

                                      ;






extern Void czLmmSendLmAlarm (U16 category, U16 event, U16 cause, CzUstaDgn *dgn)


                                                ;







extern S16 czTpmSndStoredBuf (CzPeerCb *peerCb,Buffer *mBuf);

extern S16 czTpmStoreAndSendMsg (CzPeerCb *peerCb, CztX2AP_PDU *pdu, CztStrmId streamId, Buffer **mBuf)


                                                        ;

extern S16 czTpmSndToLower (CzPeerCb *peerCb, CztX2AP_PDU *pdu, CztStrmId streamId)

                                                       ;

extern S16 czTpmRcvFromLower (Buffer *mBuf, CzPeerCb *peerCb)
                                                     ;

extern S16 czTpmSndSetUpReq (CzPeerCb *peerCb, Buffer *mBuf)
                                                 ;

extern S16 czTpmHndlTermInd (SuId suId, UConnId assocId, U8 assocIdType)

                                                    ;

extern S16 czTpmHndlStaInd (U32 peerId, SctStatus status, SctCause cause, CmNetAddr *dstNAddr, Buffer *mBuf)



                                                         ;

extern S16 czTpmTermAssoc (CzAssocCb *assocCb, Bool assocAbort)
                                                  ;

extern S16 czTpmHndlAssocInd (SuId suId, CzSctSapCb *sctSapCb, SctAssocIndParams *assocParams)

                                                                     ;


extern S16 czTpmSndAssocReq (CztX2AP_PDU *pdu, CzAssocCb *assocCb);

extern S16 czTpmDynamPeerConfig (SuId suId, SctAssocIndParams *assocParams)
                                                                          ;
extern S16 czUtlGenAlarm (CzPeerCb *peerCb, CztX2AP_PDU *pdu, U8 msgDirection)

                                                ;

extern U8 czUtlGetMsgType (CztX2AP_PDU *pdu, Bool *isResponse, S16 *procType)

                                                          ;





extern S16 czUtlGetMsgEvnt (CztX2AP_PDU *pdu);





extern S16 czUtlGetProcTypeVal (S16 procCode);





extern S16 czUtlGetIE ( CztX2AP_PDU *pdu, U32 id, TknU8 **ie);



extern CztEvnt* czUtlGenPeerErrInd (CztX2AP_PDU *pdu, U8 msgType, CzMsgInfo *msgInfo, U8 causeType, U8 causeVal)



                                                                   ;


extern CztEvnt* czUtlGenHoCancel (CztUeInfo *ueInfo, U8 causeType, U8 causeVal)

                                                               ;



extern CztEvnt* czUtlGenHoPrepFailure (CzIeInfo *idLst, CztUeInfo *ueInfo, U8 causeType, U8 causeVal)


                                                                    ;

extern S16 czUtlGetProcMsgCrit (CztX2AP_PDU *pdu, U8 *procCode, U8 *msgType, U8 *criticality, U8 *msgId)



                                                          ;

extern CztEvnt* czUtlGenX2CfgUpdFailure (CztX2AP_PDU *pdu, U8 causeType, U8 causeVal)

                                                                    ;





extern CztEvnt* czUtlGenRsrcStsFail (CzIeInfo *idLst, CzRsrcInfo *rsrcInfo, U8 causeType, U8 causeVal)

                                                                          ;

extern CztEvnt* czUtlGenX2SetupFailure (CzIeInfo *idLst, U8 causeType, U8 causeVal)

                                                                ;

extern CztEvnt* czUtlGenMobChgFailure (CzIeInfo *idLst, CztECGI *eNB1CellEcgi, CztECGI *eNB2CellEcgi, U8 causeType, U8 causeVal)



                                                                ;

extern CztEvnt* czUtlGenCellActFailure (CzIeInfo *idLst, U8 causeType, U8 causeVal)

                                                                ;

extern S16 czUtlFillTknBStr32 ( TknBStr32 *ptr, U16 len, U32 val)


                                                        ;


extern S16 czUtlGetStream (CzPeerCb *peerCb, CztStrmId *strmId);


extern U8 czUtlGetCause(CztCause *causeIE);



extern S16 czUtlUpdInErrSts (CzPeerCb *peer, U16 evntType)
                                                       ;

extern S16 czUtlUpdOutErrSts (CzPeerCb *peer, U16 evntType)
                                                       ;

extern S16 czUtlUpdInSts (CzPeerCb *peer, U16 evntType)
                                                    ;

extern S16 czUtlUpdOutSts (CzPeerCb *peer, U16 evntType)
                                                     ;

extern Void czUtlFillCauseIe (CztCause *causeIe, U8 causeType, U8 causeVal)

                                                       ;
extern S16 czUtlGetErrIdLst (CztX2AP_PDU *pdu, U8 msgId, CzIeInfo *ieId, CztUeInfo *ueInfo)


                                                             ;

extern CztEvnt* czUtlSndPeerErrInd (Void *pdu, U8 causeType, U8 causeVal)
                                                                  ;

extern CztEvnt* czUtlSndRspMsg (CztX2AP_PDU *pdu, CmPAsnErr *pasnErr);


extern U8 czEvntMap[(28 +1)];
extern U8 czX2MsgMap[16][3];
extern U8 czGetProcCrit[16];




static CztLclErrInd czBmpErrInd;
static CztUeInfo czUeInfo;
static S16 czBmpIsPeerValid (CzPeerCb *peerCb, CztEvnt *evnt, U8 hoMsgType, U8 msgDirectn)


                                                          ;

static S16 czBmpHdlOutErrInd (CzPeerCb *peerCb, CzUeCb *ueCb, CztEvnt *evnt, U8 hoMsgType, U16 oldUEX2APIdVal)



                                                             ;

static S16 czBmpHdlInErrInd (CzPeerCb *peerCb, CzUeCb *ueCb, CztEvnt *evnt, U8 hoMsgType, U16 oldUEX2APIdVal)



                                                             ;


typedef S16 (*CZPF) (CzPeerCb *peerCb, CzUeCb *ueCb, CztEvnt *evnt, U8 hoMsgType, U16 oldUEX2APIdVal)



                                                    ;


static S16 czBmpHdlOutHoReq (CzPeerCb *peerCb, CzUeCb *ueCb, CztEvnt *evnt, U8 hoMsgType, U16 oldUEX2APIdVal)



                                                              ;


static S16 czBmpHdlInHoReq (CzPeerCb *peerCb, CzUeCb *ueCb, CztEvnt *evnt, U8 hoMsgType, U16 oldUEX2APIdVal)



                                                             ;

static S16 czBmpHdlOutHoAck (CzPeerCb *peerCb, CzUeCb *ueCb, CztEvnt *evnt, U8 hoMsgType, U16 oldUEX2APIdVal)



                                                              ;

static S16 czBmpHdlInHoAck (CzPeerCb *peerCb, CzUeCb *ueCb, CztEvnt *evnt, U8 hoMsgType, U16 oldUEX2APIdVal)



                                                             ;

static S16 czBmpHdlOutHoCancel (CzPeerCb *peerCb, CzUeCb *ueCb, CztEvnt *evnt, U8 hoMsgType, U16 oldUEX2APIdVal)



                                                                 ;

static S16 czBmpHdlInHoCancel (CzPeerCb *peerCb, CzUeCb *ueCb, CztEvnt *evnt, U8 hoMsgType, U16 oldUEX2APIdVal)



                                                                ;

static S16 czBmpHdlOutHoFail (CzPeerCb *peerCb, CzUeCb *ueCb, CztEvnt *evnt, U8 hoMsgType, U16 oldUEX2APIdVal)



                                                               ;

static S16 czBmpHdlInHoFail (CzPeerCb *peerCb, CzUeCb *ueCb, CztEvnt *evnt, U8 hoMsgType, U16 oldUEX2APIdVal)



                                                              ;

static S16 czBmpHdlOutSnStTrnsfr (CzPeerCb *peerCb, CzUeCb *ueCb, CztEvnt *evnt, U8 hoMsgType, U16 oldUEX2APIdVal)



                                                                   ;

static S16 czBmpHdlInSnStTrnsfr (CzPeerCb *peerCb, CzUeCb *ueCb, CztEvnt *evnt, U8 hoMsgType, U16 oldUEX2APIdVal)



                                                                  ;

static S16 czBmpHdlOutUeCnxtRelease (CzPeerCb *peerCb, CzUeCb *ueCb, CztEvnt *evnt, U8 hoMsgType, U16 oldUEX2APIdVal)



                                                                      ;

static S16 czBmpHdlInUeCnxtRelease (CzPeerCb *peerCb, CzUeCb *ueCb, CztEvnt *evnt, U8 hoMsgType, U16 oldUEX2APIdVal)



                                                                     ;

static S16 czBmpHdlOutEvntErr (CzPeerCb *peerCb, CzUeCb *ueCb, CztEvnt *evnt, U8 hoMsgType, U16 oldUEX2APIdVal)



                                                                 ;

static S16 czBmpHdlInHoReqErr (CzPeerCb *peerCb, CzUeCb *ueCb, CztEvnt *evnt, U8 hoMsgType, U16 oldUEX2APIdVal)



                                                                ;

static S16 czBmpHdlInEvntErr (CzPeerCb *peerCb, CzUeCb *ueCb, CztEvnt *evnt, U8 hoMsgType, U16 oldUEX2APIdVal)



                                                                ;

static S16 czBmpHdlInHoRspEvntErr (CzPeerCb *peerCb, CzUeCb *ueCb, CztEvnt *evnt, U8 hoMsgType, U16 oldUEX2APIdVal)



                                                                    ;


static S16 czBmpHdlInReqErr (CzPeerCb *peerCb, CzUeCb *ueCb, CztEvnt *evnt, U8 hoMsgType, U16 oldUEX2APIdVal)



                                                                  ;


static S16 czBmpSndErrIndToPeer (CzPeerCb *peerCb, CztEvnt *evnt, CztUeInfo *bmpUeInfo, U8 hoMsgType, U8 causeType, U8 causeVal, U8 lclCauseVal)





                                                              ;

static S16 czBmpSndFailRspToPeer (CzPeerCb *peerCb, CztEvnt *evnt, CztUeInfo *bmpUeInfo, CzIeInfo *errIeInfo, U8 causeType, U8 causeVal, U8 lclCauseVal)





                                                               ;

static S16 czBmpSndFailErrToPeer (CzPeerCb *peerCb, CztEvnt *evnt, CztUeInfo *bmpUeInfo, U8 hoMsgType, CztStrmId streamId)



                                                            ;

static S16 czBmpGenLclErrInd (CzPeerCb *peerCb, CztEvnt *evnt, U8 causeType, U8 causeVal)


                                                        ;

static S16 czBmpGenErrIndEvntErr (CzPeerCb *peerCb, CztEvnt *evnt, U8 msgDirectn, U8 causeVal)


                                                            ;


static S16 czBmpIsErrIndValid (CzPeerCb *peerCb, U8 hoMsgType, U8 msgDirectn)

                                                           ;
static CZPF CzBmpOutSm[6][3] =
{
   {
   czBmpHdlOutHoReq,
   czBmpHdlOutEvntErr,
   czBmpHdlOutEvntErr
   },

   {
   czBmpHdlOutEvntErr,
   czBmpHdlOutHoAck,
   czBmpHdlOutEvntErr
   },

   {
   czBmpHdlOutEvntErr,
   czBmpHdlOutHoFail,
   czBmpHdlOutEvntErr
   },

   {
   czBmpHdlOutEvntErr,
   czBmpHdlOutHoCancel,
   czBmpHdlOutHoCancel
   },

   {
   czBmpHdlOutEvntErr,
   czBmpHdlOutEvntErr,
   czBmpHdlOutSnStTrnsfr
   },

   {
   czBmpHdlOutEvntErr,
   czBmpHdlOutEvntErr,
   czBmpHdlOutUeCnxtRelease
   }

};
static CZPF CzBmpIncSm[6][3] =
{
   {
   czBmpHdlInHoReq,
   czBmpHdlInHoReqErr,
   czBmpHdlInHoReqErr
   },

   {
   czBmpHdlInHoRspEvntErr,
   czBmpHdlInHoAck,
   czBmpHdlInEvntErr
   },

   {
   czBmpHdlInHoRspEvntErr,
   czBmpHdlInHoFail,
   czBmpHdlInEvntErr
   },

   {
   czBmpHdlInReqErr,
   czBmpHdlInHoCancel,
   czBmpHdlInHoCancel
   },

   {
   czBmpHdlInReqErr,
   czBmpHdlInEvntErr,
   czBmpHdlInSnStTrnsfr
   },

   {
   czBmpHdlInEvntErr,
   czBmpHdlInEvntErr,
   czBmpHdlInUeCnxtRelease
   }

};
static U8 czBmpEvntKeyMap[6][2] =
{






   { CZ_SRC, CZ_TGT },
   { CZ_TGT, CZ_SRC },
   { CZ_TGT, CZ_SRC },
   { CZ_SRC, CZ_TGT },
   { CZ_SRC, CZ_TGT },
   { CZ_TGT, CZ_SRC }

};



static const S8 * czBmpEvntPrintMap[] =
{

  "Handover Request",
  "Handover Request Acknowledge",
  "Handover Preparation Failure",
  "Handover Cancel",
  "SN Status Transfer",
  "UE Context Release",
  "Unknown Event"
};


static const S8 * czBmpStatePrintMap[] =
{
  "Handover Idle",
  "Handover Progress",
  "Handover Prepared",
};
 S16 czBmpHdlHoEvnt
(
CzPeerCb *peerCb,
CztEvnt *evnt,
U8 hoMsgType,
U8 msgDirectn
)







{
   U8 hoMsgEvnt;
   U16 ueCbKeyPrefx = 0;
   U32 ueCbKey = 0;
   CzUeCb *ueCb = 0L;
   CztUE_X2AP_ID *oldUEX2APId = 0L;
   U16 oldUEX2APIdVal = 0xFFFF;
   S16 ret = 0;
   U8 state;

   Txt __tapa_fun[255]; sprintf(__tapa_fun,"czBmpHdlHoEvnt"); { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",774, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf," Entering\n"); SPrint(czCb.init.prntBuf); }; ;; } }

   if(CZ_DIR_OUT == msgDirectn)
   {

      czUtlUpdOutSts(peerCb, hoMsgType);
   }
   else if(CZ_DIR_IN == msgDirectn)
   {

      czUtlUpdInSts(peerCb, hoMsgType);
   }
   ret = czBmpIsPeerValid(peerCb, evnt, hoMsgType, msgDirectn);

   if(0 != ret)
   {
      do { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",790, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " Exiting\n"); SPrint(czCb.init.prntBuf); }; } return(ret); }while(0);
   }




   hoMsgEvnt = ((hoMsgType < (28 +1)) ? (czEvntMap[hoMsgType]) : (255));;

   { do { if (czCb.init.dbgMask & ((0x00000100 << 3))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",798, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"INFO\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Handling (%s) message from (%s) through BMP for" "peer(%ld)\n", czBmpEvntPrintMap[hoMsgEvnt], ((msgDirectn == CZ_DIR_OUT) ? ("User"):("Peer")) ,(peerCb->peerId)); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0); };

   czUtlGetIE(&(evnt->pdu), 10, (TknU8 **)(&oldUEX2APId));



   if((CZ_DIR_OUT == msgDirectn) &&
      ((0L == oldUEX2APId) ||
       (oldUEX2APId->pres != 1) ||
       (!(((oldUEX2APId->val < 4096)?(1):(0))))))
   {
      if(oldUEX2APId)
      {

         oldUEX2APIdVal = (U16) oldUEX2APId->val;
      }






      do { if (czCb.init.dbgMask & ((0x00000100 << 6))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",823, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"ERROR\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Invalid old UE X2AP ID(%d)" " when sending mobility event(%s) to peer(%ld)", oldUEX2APIdVal, czBmpEvntPrintMap[hoMsgEvnt], (peerCb->peerId)); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0)


                                     ;

      czUtlUpdOutErrSts(peerCb, hoMsgType);



      { do { (Void)cmMemset((U8*)((&czBmpErrInd)), 0, (Size)sizeof(CztLclErrInd)); } while(0); czBmpErrInd.peerId = (peerCb->peerId); czBmpErrInd.msgType = hoMsgType; czBmpErrInd.u.ueInfo.oldUEX2APId = oldUEX2APIdVal; czBmpErrInd.u.ueInfo.newUEX2APId = 0xFFFF; }
                                                        ;

      czBmpGenLclErrInd(peerCb, evnt, 0x10,
                        (0x40 + 0x02));

      do { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",835, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " Exiting\n"); SPrint(czCb.init.prntBuf); }; } return(1); }while(0);
   }

   if(0L != oldUEX2APId)
   {
      oldUEX2APIdVal = (U16) oldUEX2APId->val;
   }



   ueCbKeyPrefx = ((CZ_DIR_OUT == msgDirectn) ? (czBmpEvntKeyMap[hoMsgEvnt][0]): (czBmpEvntKeyMap[hoMsgEvnt][1])); ueCbKey = (U32) (((U32)(ueCbKeyPrefx) << 16) | ((U32)(oldUEX2APIdVal) & (U32)0x0000ffff));
                                ;


   czNmmFindUeCb(peerCb, ueCbKey, &ueCb);







   if(0L != ueCb)
   {
      state = ueCb->state;
   }
   else
   {
      state = CZ_BMP_HO_IDLE;
   }


   if(CZ_DIR_OUT == msgDirectn)
   {




      do { if (czCb.init.dbgMask & ((0x00000100 << 3))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",874, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"INFO\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Outgoing event (%d), through BMP in state(%d)" "for peer(%ld)", hoMsgEvnt, state, peerCb->peerId); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0)
                                                                      ;


      ret = CzBmpOutSm[hoMsgEvnt][state](peerCb, ueCb, evnt,
                                         hoMsgType, oldUEX2APIdVal);



                if (0 != ret)
                {
                   czUtlUpdOutErrSts(peerCb, hoMsgType);
                }
   }



   else if( CZ_DIR_IN == msgDirectn)
   {




      do { if (czCb.init.dbgMask & ((0x00000100 << 3))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",897, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"INFO\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Incoming event(%d), through BMP in state(%d)" "from peer(%ld)", hoMsgEvnt, state, peerCb->peerId); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0)
                                                                       ;

      ret = CzBmpIncSm[hoMsgEvnt][state](peerCb, ueCb, evnt,
                                         hoMsgType, oldUEX2APIdVal);



                if (0 != ret)
                {
                    czUtlUpdInErrSts(peerCb, hoMsgType);
                }
   }


   do { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",911, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " Exiting\n"); SPrint(czCb.init.prntBuf); }; } return(ret); }while(0);

}
static S16 czBmpIsPeerValid
(
CzPeerCb *peerCb,
CztEvnt *evnt,
U8 hoMsgType,
U8 msgDirectn
)







{
   U8 hoMsgEvnt;
   CztUE_X2AP_ID *oldUEX2APId = 0L;
   CztUE_X2AP_ID *newUEX2APId = 0L;
   CztStrmId streamId;
   S16 ret = 0;

   Txt __tapa_fun[255]; sprintf(__tapa_fun,"czBmpIsPeerValid"); { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",970, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf," Entering\n"); SPrint(czCb.init.prntBuf); }; ;; } };
   if((CZ_GP_IDLE == peerCb->state) ||
      ((CZ_GP_CONNECTING == peerCb->state) && (CZ_DIR_OUT == msgDirectn)))
   {
      hoMsgEvnt = ((hoMsgType < (28 +1)) ? (czEvntMap[hoMsgType]) : (255));;
      if(CZ_DIR_OUT == msgDirectn)
      {






         do { if (czCb.init.dbgMask & ((0x00000100 << 6))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",995, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"ERROR\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Mobility event(%s) received from user" "when peer (%ld) not in active state(%d)\n", czBmpEvntPrintMap[hoMsgEvnt], (peerCb->peerId), (peerCb->state)); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0)


                                        ;




          czUtlUpdOutErrSts(peerCb, hoMsgType);



         { do { (Void)cmMemset((U8*)((&czBmpErrInd)), 0, (Size)sizeof(CztLclErrInd)); } while(0); czBmpErrInd.peerId = (peerCb->peerId); czBmpErrInd.msgType = hoMsgType; };

         czBmpGenLclErrInd(peerCb, evnt, 0x60,
                           (0x60 + 0x01));
      }
      else
      {






         do { if (czCb.init.dbgMask & ((0x00000100 << 6))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",1020, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"ERROR\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Mobility event(%s) received from peer" "(%ld) while not in active state(%d)\n", czBmpEvntPrintMap[hoMsgEvnt], (peerCb->peerId), (peerCb->state)); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0)


                                  ;



          czUtlUpdInErrSts(peerCb, hoMsgType);



         if(0 == hoMsgType)
         {
            czUtlGetIE(&(evnt->pdu), 10,
                        (TknU8 **)(&oldUEX2APId));

            if(oldUEX2APId != 0L)
            {
               { do { (Void)cmMemset((U8*)((&czUeInfo)), 0, (Size)sizeof(CztUeInfo)); } while(0); czUeInfo.oldUEX2APId = oldUEX2APId->val; czUeInfo.newUEX2APId = 0xFFFF; };
            }
            streamId = czUtlGetStream(peerCb, &streamId);
         }
         else
         {
            czUtlGetIE(&(evnt->pdu), 9,
                       (TknU8 **)(&newUEX2APId));
            if(newUEX2APId)
            {
               czUeInfo.newUEX2APId = (U16) newUEX2APId->val;
            }
            streamId = peerCb->peerCfg.globalStreamId;
         }
         czBmpSndFailErrToPeer(peerCb, evnt, &czUeInfo, hoMsgType, streamId);
      }
      do { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",1051, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " Exiting\n"); SPrint(czCb.init.prntBuf); }; } return(1); }while(0);
   }

   do { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",1054, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " Exiting\n"); SPrint(czCb.init.prntBuf); }; } return(ret); }while(0);
}
 S16 czBmpHdlErrInd
(
CzPeerCb *peerCb,
CztEvnt *evnt,
U8 hoMsgType,
U8 msgDirectn
)







{
   U8 hoMsgEvnt;
   U16 ueCbKeyPrefx = 0, hoEvntPrefx = 0;
   U32 ueCbKey = 0;
   CzUeCb *ueCb = 0L;
   U16 oldUEX2APIdVal = 0xFFFF;
   CztUE_X2AP_ID *oldUEX2APId = 0L;
   S16 ret;

   Txt __tapa_fun[255]; sprintf(__tapa_fun,"czBmpHdlErrInd"); { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",1128, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf," Entering\n"); SPrint(czCb.init.prntBuf); }; ;; } }

   if(CZ_DIR_OUT == msgDirectn)
   {

      czUtlUpdOutSts(peerCb, 7);
   }
   else if(CZ_DIR_IN == msgDirectn)
   {

      czUtlUpdInSts(peerCb, 7);
   }





   do { if (czCb.init.dbgMask & ((0x00000100 << 3))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",1146, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"INFO\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Sending / Receiving Error Indication for peer                              peer(%ld): ", peerCb->peerId); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0)
                                                           ;


   ret = czBmpIsErrIndValid(peerCb, hoMsgType, msgDirectn);
   if(0 != ret)
   {
      czBmpGenErrIndEvntErr(peerCb, evnt, msgDirectn, (U8)ret);
      do { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",1153, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " Exiting\n"); SPrint(czCb.init.prntBuf); }; } return(ret); }while(0);
   }




   czUtlGetIE(&(evnt->pdu), 10, (TknU8 **)&oldUEX2APId);

   if((0L != oldUEX2APId) && (oldUEX2APId->pres == 1))
   {

      oldUEX2APIdVal = (U16)oldUEX2APId->val;




      hoMsgEvnt = ((hoMsgType < (28 +1)) ? (czEvntMap[hoMsgType]) : (255));;





      hoEvntPrefx = ((CZ_DIR_OUT == msgDirectn) ? (czBmpEvntKeyMap[hoMsgEvnt][0]): (czBmpEvntKeyMap[hoMsgEvnt][1]));;
      ueCbKeyPrefx = (CZ_SRC == hoEvntPrefx) ? (CZ_TGT):(CZ_SRC);
      ueCbKey = (U32) (((U32)(ueCbKeyPrefx) << 16) | ((U32)(oldUEX2APIdVal) & (U32)0x0000ffff));


      ret = czNmmFindUeCb(peerCb, ueCbKey, &ueCb);





   }





   if(CZ_DIR_OUT == msgDirectn)
   {
      ret = czBmpHdlOutErrInd(peerCb, ueCb, evnt, hoMsgType, oldUEX2APIdVal);


      if (0 != ret)
      {
         czUtlUpdOutErrSts(peerCb, 7);
      }
   }
   else
   {
      ret = czBmpHdlInErrInd(peerCb, ueCb, evnt, hoMsgType, oldUEX2APIdVal);



      if (0 != ret)
      {
         czUtlUpdOutErrSts(peerCb, 7);
      }
   }

   do { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",1214, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " Exiting\n"); SPrint(czCb.init.prntBuf); }; } return(ret); }while(0);
}
static S16 czBmpHdlOutErrInd
(
CzPeerCb *peerCb,
CzUeCb *ueCb,
CztEvnt *evnt,
U8 hoMsgType,
U16 oldUEX2APIdVal
)
{
   CztUE_X2AP_ID *newUEX2APId = 0L;
   CztCause *causeIE = 0L;
   U16 newUEX2APIdVal = 0xFFFF;
   U8 hoMsgEvnt;
   U8 causeType, causeVal;
   S16 ret = 0;

   Txt __tapa_fun[255]; sprintf(__tapa_fun,"czBmpHdlOutErrInd"); { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",1275, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf," Entering\n"); SPrint(czCb.init.prntBuf); }; ;; } }

   hoMsgEvnt = ((hoMsgType < (28 +1)) ? (czEvntMap[hoMsgType]) : (255));;





   do { if (czCb.init.dbgMask & ((0x00000100 << 3))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",1284, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"INFO\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Outgoing Error Indication on BMP event(%s)" " to peer(%ld)\n", czBmpEvntPrintMap[hoMsgEvnt], peerCb->peerId); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0)
                                                                              ;







   if((0xFFFF != oldUEX2APIdVal) && (!ueCb))
   {


      { do { (Void)cmMemset((U8*)((&czBmpErrInd)), 0, (Size)sizeof(CztLclErrInd)); } while(0); czBmpErrInd.peerId = (peerCb->peerId); czBmpErrInd.msgType = 7; czBmpErrInd.u.ueInfo.oldUEX2APId = oldUEX2APIdVal; czBmpErrInd.u.ueInfo.newUEX2APId = 0xFFFF; }
                                                                        ;

      czBmpGenLclErrInd(peerCb, evnt, 0x10,
                        (0x40 + 0x02));
      do { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",1301, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " Exiting\n"); SPrint(czCb.init.prntBuf); }; } return(1); }while(0);
   }



   else if(ueCb)
   {




      switch(ueCb->state)
      {
         case CZ_BMP_HO_PROGRESS:

         {
            czNmmDelUeCb(ueCb);
            ueCb= 0L;
            break;
         }
         default:
         {
            ret = 16;
            break;
         }
      }
   }


   if(16 == ret)
   {



      czUtlGetIE(&(evnt->pdu), 5, (TknU8 **)&causeIE);
      if((0L != causeIE) && (1 == causeIE->choice.pres))
      {
         causeType = causeIE->choice.val;
         causeVal = czUtlGetCause(causeIE);

         switch(hoMsgType)
         {
            case 1:
            {
               if(CztCauseRadioNwunknown_new_eNB_UE_X2AP_IDEnum == causeVal)
               {

                  ueCb->newUEX2APId = 0xFFFF;
                  ueCb->state = CZ_BMP_HO_PROGRESS;
               }
               break;
            }
            default:
               break;
         }
      }
   }





   czUtlGetIE(&(evnt->pdu), 9, (TknU8 **)&newUEX2APId);

   newUEX2APIdVal = ((0L != newUEX2APId) &&
                     (1 == newUEX2APId->pres))?
                   (U16)(newUEX2APId->val):(0xFFFF);






   do { if (czCb.init.dbgMask & ((0x00000100 << 3))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",1392, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"INFO\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Sending Error Indication on BMP event (%s)" "for an UE(%d:%d) to peer(%ld) on stream(%d)", czBmpEvntPrintMap[hoMsgEvnt],oldUEX2APIdVal, newUEX2APIdVal, (peerCb->peerId), (peerCb->peerCfg.globalStreamId)); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0)


                                                                   ;





   ret = czTpmSndToLower(peerCb, &(evnt->pdu),
                         (peerCb->peerCfg.globalStreamId));


   if(0 != ret)
   {

      do { if (czCb.init.dbgMask & ((0x00000100 << 7))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",1407, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"FATAL\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Transmission of the outcoming X2-Error                Indication failed towards the peer(%ld) for UE(%d:%d)\n", (peerCb->peerId), oldUEX2APIdVal, newUEX2APIdVal); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0)

                                                                 ;







      { do { (Void)cmMemset((U8*)((&czBmpErrInd)), 0, (Size)sizeof(CztLclErrInd)); } while(0); czBmpErrInd.peerId = (peerCb->peerId); czBmpErrInd.msgType = 7; czBmpErrInd.u.ueInfo.oldUEX2APId = oldUEX2APIdVal; czBmpErrInd.u.ueInfo.newUEX2APId = newUEX2APIdVal; }
                                                                 ;

      czBmpGenLclErrInd(peerCb, evnt, 0x50,
                        (U8)ret);
   }
   else
   {
      do { cmFreeMem((evnt)); (evnt) = 0L; } while(0);
   }

   do { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",1426, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " Exiting\n"); SPrint(czCb.init.prntBuf); }; } return(ret); }while(0);

}
static S16 czBmpHdlInErrInd
(
CzPeerCb *peerCb,
CzUeCb *ueCb,
CztEvnt *evnt,
U8 hoMsgType,
U16 oldUEX2APIdVal
)
{
   CztCause *causeIE = 0L;
   U8 causeType, causeVal;
   S16 ret = 0;

   Txt __tapa_fun[255]; sprintf(__tapa_fun,"czBmpHdlInErrInd"); { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",1486, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf," Entering\n"); SPrint(czCb.init.prntBuf); }; ;; } }
   do { if (czCb.init.dbgMask & ((0x00000100 << 3))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",1487, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"INFO\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "For peer with peerId (%ld)", peerCb->peerId); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0);






   if((0xFFFF != oldUEX2APIdVal) && (!ueCb))
   {





      czUtlUpdInErrSts(peerCb, 7);
   }



   else if(ueCb)
   {




      switch(ueCb->state)
      {
         case CZ_BMP_HO_PROGRESS:
         {
            czStopTmr(CZ_TMR_TRELOCPREP, (U32 *)ueCb);
            czNmmDelUeCb(ueCb);
            ueCb= 0L;
            break;
         }
         default:
         {
            ret = 16;
            break;
         }
      }
   }


   if(16 == ret)
   {




      czUtlGetIE(&(evnt->pdu), 5, (TknU8 **)&causeIE);
      if((0L != causeIE) && (1 == causeIE->choice.pres))
      {
         causeType = causeIE->choice.val;
         causeVal = czUtlGetCause(causeIE);


         switch(hoMsgType)
         {
            case 1:
            {
               if(CztCauseRadioNwunknown_new_eNB_UE_X2AP_IDEnum == causeVal)
               {


                   ueCb->newUEX2APId = 0xFFFF;
                   ueCb->state = CZ_BMP_HO_PROGRESS;
               }




               else if((causeType > 0) && (causeType <= 3))



               {


                  czNmmDelUeCb(ueCb);
                  ueCb= 0L;
               }
               break;
            }
               default:
                  break;
         }
      }
   }





   ret = czUimSndGpErrInd(peerCb, evnt);
   if(0 != ret)
   {
      do { if (czCb.init.dbgMask & ((0x00000100 << 7))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",1600, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"FATAL\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Indication of the incoming X2-Error                Indication failed for UE(%d:%d)\n", oldUEX2APIdVal, 0xFFFF); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0)

                                                      ;


      czUtlUpdInErrSts(peerCb, 7);

      do { cmFreeMem((evnt)); (evnt) = 0L; } while(0);
   }



   do { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",1610, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " Exiting\n"); SPrint(czCb.init.prntBuf); }; } return(ret); }while(0);

}
static S16 czBmpHdlOutHoReq
(
CzPeerCb *peerCb,
CzUeCb *ueCb,
CztEvnt *evnt,
U8 hoMsgType,
U16 oldUEX2APIdVal
)
{
   U32 ueCbKey = 0;
   U16 ueCbKeyPrefx = CZ_SRC;
   S16 ret = 0;

   Txt __tapa_fun[255]; sprintf(__tapa_fun,"czBmpHdlOutHoReq"); { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",1668, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf," Entering\n"); SPrint(czCb.init.prntBuf); }; ;; } }
   do { if (czCb.init.dbgMask & ((0x00000100 << 3))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",1669, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"INFO\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "For peer with peerId (%ld)", peerCb->peerId); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0);;

   { do { if (czCb.init.dbgMask & ((0x00000100 << 3))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",1672, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"INFO\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Outgoing BMP event (%s) for an UE(%d:%d) to " "peer(%ld)", czBmpEvntPrintMap[CZ_EVNT_HO_REQ], oldUEX2APIdVal, 0xFFFF, (peerCb->peerId)); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0); }
                                                 ;




   if(!ueCb)
   {



      ueCbKey = (U32) (((U32)(ueCbKeyPrefx) << 16) | ((U32)(oldUEX2APIdVal) & (U32)0x0000ffff));;




      ret = czNmmAddUeCb(peerCb, ueCbKey, &ueCb, oldUEX2APIdVal);

      if(0 != ret)
      {
         do { if (czCb.init.dbgMask & ((0x00000100 << 7))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",1692, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"FATAL\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Failed to allocate UeCb. UE(%d:%d)\n ", oldUEX2APIdVal, 0xFFFF); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0)
                                                         ;




         { do { (Void)cmMemset((U8*)((&czBmpErrInd)), 0, (Size)sizeof(CztLclErrInd)); } while(0); czBmpErrInd.peerId = (peerCb->peerId); czBmpErrInd.msgType = 0; czBmpErrInd.u.ueInfo.oldUEX2APId = oldUEX2APIdVal; czBmpErrInd.u.ueInfo.newUEX2APId = 0xFFFF; }
                                                                        ;

         czBmpGenLclErrInd(peerCb, evnt, 0x70,
                        (0x70 + 0x03));
         do { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",1702, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " Exiting\n"); SPrint(czCb.init.prntBuf); }; } return(ret); }while(0);
      }
   }



   ret = czStartTmr(CZ_TMR_TRELOCPREP, czCb.nodeCb.protCfg.tRELOCprep,
              (U32 *) ueCb);
   ueCb->state = CZ_BMP_HO_PROGRESS;

   czUtlGetStream(peerCb, &(ueCb->streamId));

   { do { if (czCb.init.dbgMask & ((0x00000100 << 3))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",1726, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"INFO\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Sending BMP event (%s) for an UE(%d:%d)" "to peer(%ld) on stream(%d)", czBmpEvntPrintMap[CZ_EVNT_HO_REQ], oldUEX2APIdVal, 0xFFFF, (peerCb->peerId), (ueCb->streamId)); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0); }
                                                             ;




   ret = czTpmSndToLower(peerCb, &(evnt->pdu), ueCb->streamId);




   if(0 != ret)
   {

      do { if (czCb.init.dbgMask & ((0x00000100 << 7))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",1741, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"FATAL\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Transmission of the outcoming X2-Handover                Request failed towards the peer(%ld) for UE(%d:%d)\n", (peerCb->peerId), oldUEX2APIdVal, 0xFFFF); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0)

                                                                        ;





      { do { if (czCb.init.dbgMask & ((0x00000100 << 6))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",1748, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"ERROR\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Sending BMP event (%s) for an UE(%d:%d)" "to peer(%ld) failed, cause(%d)", czBmpEvntPrintMap[CZ_EVNT_HO_REQ], oldUEX2APIdVal, 0xFFFF, (peerCb->peerId), ret); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0); }
                                                  ;




      czStopTmr(CZ_TMR_TRELOCPREP, (U32 *)ueCb);




      czNmmDelUeCb(ueCb);
      ueCb= 0L;


      { do { (Void)cmMemset((U8*)((&czBmpErrInd)), 0, (Size)sizeof(CztLclErrInd)); } while(0); czBmpErrInd.peerId = (peerCb->peerId); czBmpErrInd.msgType = 0; czBmpErrInd.u.ueInfo.oldUEX2APId = oldUEX2APIdVal; czBmpErrInd.u.ueInfo.newUEX2APId = 0xFFFF; }
                                                                       ;
      czBmpGenLclErrInd(peerCb, evnt, 0x50, (U8)ret);
   }
   else
   {
      { do { if (czCb.init.dbgMask & ((0x00000100 << 3))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",1770, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"INFO\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Sent BMP event (%s) for an UE(%d:%d)" "to peer(%ld) on stream(%d)", czBmpEvntPrintMap[CZ_EVNT_HO_REQ], oldUEX2APIdVal, 0xFFFF, (peerCb->peerId), ueCb->streamId); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0); }

                                                                   ;




      do { cmFreeMem((evnt)); (evnt) = 0L; } while(0);
   }

   do { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",1778, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " Exiting\n"); SPrint(czCb.init.prntBuf); }; } return(ret); }while(0);

}
static S16 czBmpHdlInHoReq
(
CzPeerCb *peerCb,
CzUeCb *ueCb,
CztEvnt *evnt,
U8 hoMsgType,
U16 oldUEX2APIdVal
)
{
   U16 ueCbKeyPrefx = CZ_TGT;
   U32 ueCbKey = 0;

   CzIeInfo errIeInfo[5];


   S16 ret = 0;

   Txt __tapa_fun[255]; sprintf(__tapa_fun,"czBmpHdlInHoReq"); { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",1835, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf," Entering\n"); SPrint(czCb.init.prntBuf); }; ;; } }

   do { (Void)cmMemset((U8*)(errIeInfo), 0, (Size)5 * sizeof(CzIeInfo)); } while(0);

   { do { if (czCb.init.dbgMask & ((0x00000100 << 3))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",1840, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"INFO\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Received BMP event (%s) for an UE(%d:%d) from " "peer(%ld)", czBmpEvntPrintMap[CZ_EVNT_HO_REQ], oldUEX2APIdVal, 0xFFFF, (peerCb->peerId)); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0); }
                                                ;

   { do { (Void)cmMemset((U8*)((&czUeInfo)), 0, (Size)sizeof(CztUeInfo)); } while(0); czUeInfo.oldUEX2APId = oldUEX2APIdVal; czUeInfo.newUEX2APId = 0xFFFF; };
   if(!ueCb)
   {



      ueCbKey = (U32) (((U32)(ueCbKeyPrefx) << 16) | ((U32)(oldUEX2APIdVal) & (U32)0x0000ffff));;




      ret = czNmmAddUeCb(peerCb, ueCbKey, &ueCb, oldUEX2APIdVal);

      if(0 != ret)
      {
         do { if (czCb.init.dbgMask & ((0x00000100 << 7))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",1874, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"FATAL\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Failed to allocate UeCb. UE(%d:%d)\n ", oldUEX2APIdVal, 0xFFFF); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0)
                                                         ;




         czBmpSndFailRspToPeer(peerCb, evnt, &czUeInfo, 0L,


                               3,



                               CztCauseMiscom_interventionEnum,
                               (0x70 + 0x03));
         do { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",1888, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " Exiting\n"); SPrint(czCb.init.prntBuf); }; } return(1); }while(0);
      }
   }





   ueCb->state = CZ_BMP_HO_PROGRESS;

   czUtlGetStream(peerCb, &(ueCb->streamId));

   { do { if (czCb.init.dbgMask & ((0x00000100 << 3))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",1901, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"INFO\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Delivering BMP event (%s) from peer(%ld) for an" "UE(%d:%d) to user", czBmpEvntPrintMap[CZ_EVNT_HO_REQ], (peerCb->peerId), oldUEX2APIdVal, 0xFFFF); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0); }
                                          ;




   ret = czUimSndBmpInd(peerCb, evnt);







   if(0 != ret)
   {

      do { if (czCb.init.dbgMask & ((0x00000100 << 7))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",1919, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"FATAL\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Indication of the incoming X2-Handover                Request failed from the peer(%ld) for UE(%d:%d)\n", (peerCb->peerId), oldUEX2APIdVal, 0xFFFF); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0)

                                                                        ;





      { do { if (czCb.init.dbgMask & ((0x00000100 << 6))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",1926, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"ERROR\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Delivering BMP event (%s) to user for an " "UE(%d:%d) received from peer(%ld) failed, cause(%d)", czBmpEvntPrintMap[CZ_EVNT_HO_REQ], oldUEX2APIdVal, 0xFFFF, (peerCb->peerId), ret); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0); }
                                                 ;




      czNmmDelUeCb(ueCb);
      ueCb= 0L;



      czBmpSndFailRspToPeer(peerCb, evnt, &czUeInfo, 0L,


                            3,



                            CztCauseMiscom_interventionEnum,
                            (0x50 + 0x05));
      do { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",1945, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " Exiting\n"); SPrint(czCb.init.prntBuf); }; } return(1); }while(0);
   }

   { do { if (czCb.init.dbgMask & ((0x00000100 << 3))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",1949, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"INFO\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Delivered BMP event (%s) from peer(%ld) for an" "UE(%d:%d) to user", czBmpEvntPrintMap[CZ_EVNT_HO_REQ], (peerCb->peerId), oldUEX2APIdVal, 0xFFFF); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0); }
                                               ;

   do { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",1951, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " Exiting\n"); SPrint(czCb.init.prntBuf); }; } return(0); }while(0);

}
static S16 czBmpHdlOutHoAck
(
CzPeerCb *peerCb,
CzUeCb *ueCb,
CztEvnt *evnt,
U8 hoMsgType,
U16 oldUEX2APIdVal
)
{
   CztUE_X2AP_ID *newUEX2APId = 0L;
   U16 newUEX2APIdVal = 0xFFFF;
   S16 ret;

   Txt __tapa_fun[255]; sprintf(__tapa_fun,"czBmpHdlOutHoAck"); { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2004, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf," Entering\n"); SPrint(czCb.init.prntBuf); }; ;; } }

   { do { if (czCb.init.dbgMask & ((0x00000100 << 3))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2007, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"INFO\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Outgoing BMP event (%s) for an UE(%d:%d) to " "peer(%ld)", czBmpEvntPrintMap[CZ_EVNT_HO_REQ_ACK], oldUEX2APIdVal, newUEX2APIdVal, (peerCb->peerId)); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0); }
                                                     ;

   czUtlGetIE(&(evnt->pdu), 9, (TknU8 **)&newUEX2APId);


   if((0L == newUEX2APId) ||
      (1 != newUEX2APId->pres))
   {
      if(newUEX2APId)
      {

         newUEX2APIdVal = (U16)newUEX2APId->val;
      }





      do { if (czCb.init.dbgMask & ((0x00000100 << 6))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2027, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"ERROR\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Invalid new UE X2APId for an UE(%d:%d) when " "sending Handover Request Acknowledge to peer(%ld)", oldUEX2APIdVal, newUEX2APIdVal, (peerCb->peerId)); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0)

                                                                       ;




      { do { (Void)cmMemset((U8*)((&czBmpErrInd)), 0, (Size)sizeof(CztLclErrInd)); } while(0); czBmpErrInd.peerId = (peerCb->peerId); czBmpErrInd.msgType = 1; czBmpErrInd.u.ueInfo.oldUEX2APId = oldUEX2APIdVal; czBmpErrInd.u.ueInfo.newUEX2APId = newUEX2APIdVal; }
                                                                 ;
      czBmpGenLclErrInd(peerCb, evnt, 0x10,
                        (0x40 + 0x03));
      do { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2036, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " Exiting\n"); SPrint(czCb.init.prntBuf); }; } return(1); }while(0);
   }



   ueCb->newUEX2APId = (U16) newUEX2APId->val;


   ueCb->state = CZ_BMP_HO_PREPARED;

   { do { if (czCb.init.dbgMask & ((0x00000100 << 3))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2047, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"INFO\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Sending BMP event (%s) for an UE(%d:%d)" "to peer(%ld) on stream(%d)", czBmpEvntPrintMap[CZ_EVNT_HO_REQ_ACK], oldUEX2APIdVal, (ueCb->newUEX2APId), (peerCb->peerId), ueCb->streamId); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0); }
                                                               ;




   ret = czTpmSndToLower(peerCb, &(evnt->pdu), ueCb->streamId);


   if(0 != ret)
   {

      do { if (czCb.init.dbgMask & ((0x00000100 << 7))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2060, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"FATAL\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Transmission of the outcoming X2-Handover Ack               failed towards the peer(%ld) for UE(%d:%d)\n", (peerCb->peerId), oldUEX2APIdVal, ueCb->newUEX2APId); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0)

                                                  ;





      ueCb->state = CZ_BMP_HO_PROGRESS;
      ueCb->newUEX2APId = 0xFFFF;

      newUEX2APIdVal = (U16) newUEX2APId->val;

      { do { if (czCb.init.dbgMask & ((0x00000100 << 6))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2072, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"ERROR\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Sending BMP event (%s) for an UE(%d:%d)" "to peer(%ld) failed, cause(%d)", czBmpEvntPrintMap[CZ_EVNT_HO_REQ_ACK], oldUEX2APIdVal, newUEX2APIdVal, (peerCb->peerId), ret); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0); }
                                                      ;







      { do { (Void)cmMemset((U8*)((&czBmpErrInd)), 0, (Size)sizeof(CztLclErrInd)); } while(0); czBmpErrInd.peerId = (peerCb->peerId); czBmpErrInd.msgType = 1; czBmpErrInd.u.ueInfo.oldUEX2APId = oldUEX2APIdVal; czBmpErrInd.u.ueInfo.newUEX2APId = (newUEX2APId->val); }
                                                                    ;
      czBmpGenLclErrInd(peerCb, evnt, 0x50, (U8)ret);
   }
   else
   {
      { do { if (czCb.init.dbgMask & ((0x00000100 << 3))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2087, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"INFO\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Sent BMP event (%s) for an UE(%d:%d)" "to peer(%ld) on stream(%d)", czBmpEvntPrintMap[CZ_EVNT_HO_REQ_ACK], oldUEX2APIdVal, (ueCb->newUEX2APId), (peerCb->peerId), ueCb->streamId); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0); }
                                                                       ;



      do { cmFreeMem((evnt)); (evnt) = 0L; } while(0);
   }

   do { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2094, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " Exiting\n"); SPrint(czCb.init.prntBuf); }; } return(ret); }while(0);

}
static S16 czBmpHdlInHoAck
(
CzPeerCb *peerCb,
CzUeCb *ueCb,
CztEvnt *evnt,
U8 hoMsgType,
U16 oldUEX2APIdVal
)
{
   CztUE_X2AP_ID *newUEX2APId = 0L;
   U16 newUEX2APIdVal = 0xFFFF;
   S16 ret;

   Txt __tapa_fun[255]; sprintf(__tapa_fun,"czBmpHdlInHoAck"); { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2147, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf," Entering\n"); SPrint(czCb.init.prntBuf); }; ;; } }


   czUtlGetIE(&(evnt->pdu), 9, (TknU8 **)&newUEX2APId);


   if(newUEX2APId != 0L)
   {
      newUEX2APIdVal = (U16) newUEX2APId->val;
   }
   { do { (Void)cmMemset((U8*)((&czUeInfo)), 0, (Size)sizeof(CztUeInfo)); } while(0); czUeInfo.oldUEX2APId = oldUEX2APIdVal; czUeInfo.newUEX2APId = newUEX2APIdVal; };



   { do { if (czCb.init.dbgMask & ((0x00000100 << 3))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2162, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"INFO\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Received BMP event (%s) for an UE(%d:%d) from " "peer(%ld)", czBmpEvntPrintMap[CZ_EVNT_HO_REQ_ACK], oldUEX2APIdVal, newUEX2APIdVal, (peerCb->peerId)); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0); }
                                                    ;




   czStopTmr(CZ_TMR_TRELOCPREP, (U32 *)ueCb);




   ret = czStartTmr(CZ_TMR_TX2RELOCOVERALL, czCb.nodeCb.protCfg.tX2RELOCOverall,
              (U32 *)ueCb);
   ueCb->state = CZ_BMP_HO_PREPARED;

   ueCb->newUEX2APId = newUEX2APIdVal;




   { do { if (czCb.init.dbgMask & ((0x00000100 << 3))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2193, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"INFO\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Delivering BMP event (%s) from peer(%ld) for an" "UE(%d:%d) to user", czBmpEvntPrintMap[CZ_EVNT_HO_REQ_ACK], (peerCb->peerId), oldUEX2APIdVal, newUEX2APIdVal); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0); }
                                              ;




   ret = czUimSndBmpCfm(peerCb, evnt);



   if(0 != ret)
   {

      do { if (czCb.init.dbgMask & ((0x00000100 << 7))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2207, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"FATAL\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Indication of the incoming X2-Handover Ack                failed from the peer(%ld) for UE(%d:%d)\n", (peerCb->peerId), oldUEX2APIdVal, newUEX2APIdVal); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0)

                                               ;






      ueCb->newUEX2APId = 0xFFFF;
      ueCb->state = CZ_BMP_HO_PROGRESS;




      czStopTmr(CZ_TMR_TX2RELOCOVERALL, (U32 *)ueCb);


      ret = czStartTmr(CZ_TMR_TRELOCPREP, czCb.nodeCb.protCfg.tRELOCprep,
            (U32 *) ueCb);
      { do { if (czCb.init.dbgMask & ((0x00000100 << 6))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2236, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"ERROR\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Delivering BMP event (%s) to user for an " "UE(%d:%d) received from peer(%ld) failed, cause(%d)", czBmpEvntPrintMap[CZ_EVNT_HO_REQ_ACK], oldUEX2APIdVal, newUEX2APIdVal, (peerCb->peerId), ret); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0); }
                                                     ;

      czBmpSndErrIndToPeer(peerCb, evnt, &czUeInfo,
                           1,


                           3,



                           CztCauseMiscom_interventionEnum,
                           (0x50 + 0x05));
      do { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2248, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " Exiting\n"); SPrint(czCb.init.prntBuf); }; } return(ret); }while(0);
   }

   { do { if (czCb.init.dbgMask & ((0x00000100 << 3))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2252, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"INFO\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Delivered BMP event (%s) from peer(%ld) for an" "UE(%d:%d) to user", czBmpEvntPrintMap[CZ_EVNT_HO_REQ_ACK], (peerCb->peerId), oldUEX2APIdVal, newUEX2APIdVal); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0); }
                                                   ;
   do { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2253, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " Exiting\n"); SPrint(czCb.init.prntBuf); }; } return(0); }while(0);

}
static S16 czBmpHdlOutHoCancel
(
CzPeerCb *peerCb,
CzUeCb *ueCb,
CztEvnt *evnt,
U8 hoMsgType,
U16 oldUEX2APIdVal
)
{
   CztUE_X2AP_ID *newUEX2APId = 0L;
   U16 newUEX2APIdVal = 0xFFFF;
   CztStrmId streamId;
   S16 ret = 0;

   Txt __tapa_fun[255]; sprintf(__tapa_fun,"czBmpHdlOutHoCancel"); { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2311, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf," Entering\n"); SPrint(czCb.init.prntBuf); }; ;; } }

   { do { if (czCb.init.dbgMask & ((0x00000100 << 3))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2314, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"INFO\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Outgoing BMP event (%s) for an UE(%d:%d) to " "peer(%ld)", czBmpEvntPrintMap[CZ_EVNT_HO_CANCEL], oldUEX2APIdVal, newUEX2APIdVal, (peerCb->peerId)); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0); }
                                                    ;


   czUtlGetIE(&(evnt->pdu), 9, (TknU8 **)&newUEX2APId);



   if((0L != newUEX2APId) && (1 == newUEX2APId->pres))
   {

      newUEX2APIdVal = (U16)newUEX2APId->val;
      if(newUEX2APIdVal != ueCb->newUEX2APId)
      {





         do { if (czCb.init.dbgMask & ((0x00000100 << 6))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2334, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"ERROR\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Invalid newUEX2APId for an UE(%d:%d)" "when sending Handover Cancel to peer(%ld)", oldUEX2APIdVal, newUEX2APIdVal, (peerCb->peerId)); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0)

                                                                         ;







         { do { (Void)cmMemset((U8*)((&czBmpErrInd)), 0, (Size)sizeof(CztLclErrInd)); } while(0); czBmpErrInd.peerId = (peerCb->peerId); czBmpErrInd.msgType = 3; czBmpErrInd.u.ueInfo.oldUEX2APId = oldUEX2APIdVal; czBmpErrInd.u.ueInfo.newUEX2APId = newUEX2APIdVal; }
                                                                ;
         czBmpGenLclErrInd(peerCb, evnt, 0x10,
                           (0x40 + 0x03));

         do { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2347, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " Exiting\n"); SPrint(czCb.init.prntBuf); }; } return(1); }while(0);
      }
   }
   czStopUeTmrs(ueCb);

   streamId = ueCb->streamId;





   czNmmDelUeCb(ueCb);
   ueCb= 0L;

   { do { if (czCb.init.dbgMask & ((0x00000100 << 3))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2372, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"INFO\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Sending BMP event (%s) for an UE(%d:%d)" "to peer(%ld) on stream(%d)", czBmpEvntPrintMap[CZ_EVNT_HO_CANCEL], oldUEX2APIdVal, newUEX2APIdVal, (peerCb->peerId), streamId); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0); }
                                                        ;




   ret = czTpmSndToLower(peerCb, &(evnt->pdu), streamId);

   if(0 != ret)
   {

      do { if (czCb.init.dbgMask & ((0x00000100 << 7))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2384, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"FATAL\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Transmission of the outcoming X2-Handover                Cancel failed towards the peer(%ld) for UE(%d:%d)\n", (peerCb->peerId), oldUEX2APIdVal, newUEX2APIdVal); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0)

                                                                 ;





      { do { if (czCb.init.dbgMask & ((0x00000100 << 6))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2391, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"ERROR\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Sending BMP event (%s) for an UE(%d:%d)" "to peer(%ld) failed, cause(%d)", czBmpEvntPrintMap[CZ_EVNT_HO_CANCEL], oldUEX2APIdVal, newUEX2APIdVal, (peerCb->peerId), ret); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0); }
                                                     ;






      { do { (Void)cmMemset((U8*)((&czBmpErrInd)), 0, (Size)sizeof(CztLclErrInd)); } while(0); czBmpErrInd.peerId = (peerCb->peerId); czBmpErrInd.msgType = 3; czBmpErrInd.u.ueInfo.oldUEX2APId = oldUEX2APIdVal; czBmpErrInd.u.ueInfo.newUEX2APId = newUEX2APIdVal; }
                                                                ;
      czBmpGenLclErrInd(peerCb, evnt, 0x50, (U8)ret);
   }
   else
   {
      { do { if (czCb.init.dbgMask & ((0x00000100 << 3))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2405, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"INFO\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Sent BMP event (%s) for an UE(%d:%d)" "to peer(%ld) on stream(%d)", czBmpEvntPrintMap[CZ_EVNT_HO_CANCEL], oldUEX2APIdVal, newUEX2APIdVal, (peerCb->peerId), streamId); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0); }
                                                  ;




      do { cmFreeMem((evnt)); (evnt) = 0L; } while(0);
   }

   do { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2413, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " Exiting\n"); SPrint(czCb.init.prntBuf); }; } return(ret); }while(0);

}
static S16 czBmpHdlInHoCancel
(
CzPeerCb *peerCb,
CzUeCb *ueCb,
CztEvnt *evnt,
U8 hoMsgType,
U16 oldUEX2APIdVal
)
{
   U16 newUEX2APIdVal = 0xFFFF;
   CztUE_X2AP_ID *newUEX2APId = 0L;
   S16 ret;

   Txt __tapa_fun[255]; sprintf(__tapa_fun,"czBmpHdlInHoCancel"); { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2469, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf," Entering\n"); SPrint(czCb.init.prntBuf); }; ;; } }

   { do { if (czCb.init.dbgMask & ((0x00000100 << 3))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2472, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"INFO\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Received BMP event (%s) for an UE(%d:%d) from " "peer(%ld)", czBmpEvntPrintMap[CZ_EVNT_HO_CANCEL], oldUEX2APIdVal, newUEX2APIdVal, (peerCb->peerId)); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0); }
                                                   ;

   { do { (Void)cmMemset((U8*)((&czUeInfo)), 0, (Size)sizeof(CztUeInfo)); } while(0); czUeInfo.oldUEX2APId = oldUEX2APIdVal; czUeInfo.newUEX2APId = newUEX2APIdVal; };


   czUtlGetIE(&(evnt->pdu), 9,
         (TknU8 **)&newUEX2APId);





   if((0L != newUEX2APId) && (newUEX2APId->val != ueCb->newUEX2APId))
   {





      do { if (czCb.init.dbgMask & ((0x00000100 << 6))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2493, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"ERROR\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Invalid newUEX2APId for an UE(%d:%d)" "when received Handover Cancel from peer(%ld)", oldUEX2APIdVal, newUEX2APIdVal, peerCb->peerId); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0)

                                                               ;


      czUeInfo.newUEX2APId = (U16) newUEX2APId->val;
      czBmpSndErrIndToPeer(peerCb, evnt, &czUeInfo,
            3,
            0,
            CztCauseRadioNwunknown_new_eNB_UE_X2AP_IDEnum,
            (0x40 + 0x03));
      do { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2502, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " Exiting\n"); SPrint(czCb.init.prntBuf); }; } return(1); }while(0);
   }
   czNmmDelUeCb(ueCb);
   ueCb= 0L;




   { do { if (czCb.init.dbgMask & ((0x00000100 << 3))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2519, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"INFO\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Delivering BMP event (%s) from peer(%ld) for an" "UE(%d:%d) to user", czBmpEvntPrintMap[CZ_EVNT_HO_CANCEL], (peerCb->peerId), oldUEX2APIdVal, (czUeInfo.newUEX2APId)); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0); }
                                             ;




   ret = czUimSndBmpInd(peerCb, evnt);



   if(0 != ret)
   {

      do { if (czCb.init.dbgMask & ((0x00000100 << 7))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2533, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"FATAL\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Indication of the incoming X2-Handover Cancel               failed from the peer(%ld) for UE(%d:%d)\n", (peerCb->peerId), oldUEX2APIdVal, czUeInfo.newUEX2APId); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0)

                                                     ;





      { do { if (czCb.init.dbgMask & ((0x00000100 << 6))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2540, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"ERROR\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Delivering BMP event (%s) to user for an " "UE(%d:%d) received from peer(%ld) failed, cause(%d)", czBmpEvntPrintMap[CZ_EVNT_HO_CANCEL], oldUEX2APIdVal, (czUeInfo.newUEX2APId), (peerCb->peerId), ret); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0); }
                                                    ;







      czBmpSndErrIndToPeer(peerCb, evnt, &czUeInfo,
                           3,


                           3,



                           CztCauseMiscom_interventionEnum,
                           (0x50 + 0x05));
      do { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2558, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " Exiting\n"); SPrint(czCb.init.prntBuf); }; } return(ret); }while(0);
   }

   { do { if (czCb.init.dbgMask & ((0x00000100 << 3))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2562, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"INFO\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Delivered BMP event (%s) from peer(%ld) for an" "UE(%d:%d) to user", czBmpEvntPrintMap[CZ_EVNT_HO_CANCEL], (peerCb->peerId), oldUEX2APIdVal, (czUeInfo.newUEX2APId)); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0); }
                                                  ;

   do { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2564, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " Exiting\n"); SPrint(czCb.init.prntBuf); }; } return(0); }while(0);

}
static S16 czBmpHdlOutHoFail
(
CzPeerCb *peerCb,
CzUeCb *ueCb,
CztEvnt *evnt,
U8 hoMsgType,
U16 oldUEX2APIdVal
)
{
   CztStrmId streamId;
   S16 ret = 0;

   Txt __tapa_fun[255]; sprintf(__tapa_fun,"czBmpHdlOutHoFail"); { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2616, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf," Entering\n"); SPrint(czCb.init.prntBuf); }; ;; } }

   { do { if (czCb.init.dbgMask & ((0x00000100 << 3))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2619, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"INFO\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Outgoing BMP event (%s) for an UE(%d:%d) to " "peer(%ld)", czBmpEvntPrintMap[CZ_EVNT_HO_PREP_FAIL], oldUEX2APIdVal, 0xFFFF, (peerCb->peerId)); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0); }
                                                       ;

   streamId = ueCb->streamId;





   czNmmDelUeCb(ueCb);
   ueCb= 0L;

   { do { if (czCb.init.dbgMask & ((0x00000100 << 3))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2631, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"INFO\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Sending BMP event (%s) for an UE(%d:%d)" "to peer(%ld) on stream(%d)", czBmpEvntPrintMap[CZ_EVNT_HO_PREP_FAIL], oldUEX2APIdVal, 0xFFFF, (peerCb->peerId), streamId); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0); }
                                                           ;




   ret = czTpmSndToLower(peerCb, &(evnt->pdu), streamId);





   if(0 != ret)
   {

      do { if (czCb.init.dbgMask & ((0x00000100 << 7))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2647, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"FATAL\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Transmission of the outcoming X2-Handover                Failure failed towards the peer(%ld) for UE(%d:%d)\n", (peerCb->peerId), oldUEX2APIdVal, 0xFFFF); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0)

                                                                        ;





      { do { if (czCb.init.dbgMask & ((0x00000100 << 6))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2654, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"ERROR\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Sending BMP event (%s) for an UE(%d:%d)" "to peer(%ld) failed, cause(%d)", czBmpEvntPrintMap[CZ_EVNT_HO_PREP_FAIL], oldUEX2APIdVal, 0xFFFF, (peerCb->peerId), ret); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0); }
                                                        ;






      { do { (Void)cmMemset((U8*)((&czBmpErrInd)), 0, (Size)sizeof(CztLclErrInd)); } while(0); czBmpErrInd.peerId = (peerCb->peerId); czBmpErrInd.msgType = 2; czBmpErrInd.u.ueInfo.oldUEX2APId = oldUEX2APIdVal; czBmpErrInd.u.ueInfo.newUEX2APId = 0xFFFF; }
                                                                       ;
      czBmpGenLclErrInd(peerCb, evnt, 0x50, (U8)ret);
   }
   else
   {
      { do { if (czCb.init.dbgMask & ((0x00000100 << 3))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2669, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"INFO\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Sent BMP event (%s) for an UE(%d:%d)" "to peer(%ld) on stream(%d)", czBmpEvntPrintMap[CZ_EVNT_HO_PREP_FAIL], oldUEX2APIdVal, 0xFFFF, (peerCb->peerId), streamId); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0); }

                                                                   ;




      do { cmFreeMem((evnt)); (evnt) = 0L; } while(0);
   }

   do { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2677, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " Exiting\n"); SPrint(czCb.init.prntBuf); }; } return(ret); }while(0);

}
static S16 czBmpHdlInHoFail
(
CzPeerCb *peerCb,
CzUeCb *ueCb,
CztEvnt *evnt,
U8 hoMsgType,
U16 oldUEX2APIdVal
)
{
   S16 ret;

   Txt __tapa_fun[255]; sprintf(__tapa_fun,"czBmpHdlInHoFail"); { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2729, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf," Entering\n"); SPrint(czCb.init.prntBuf); }; ;; } }

   { do { (Void)cmMemset((U8*)((&czUeInfo)), 0, (Size)sizeof(CztUeInfo)); } while(0); czUeInfo.oldUEX2APId = oldUEX2APIdVal; czUeInfo.newUEX2APId = 0xFFFF; };






   czStopTmr(CZ_TMR_TRELOCPREP, (U32 *)ueCb);
   czNmmDelUeCb(ueCb);
   ueCb= 0L;




   { do { if (czCb.init.dbgMask & ((0x00000100 << 3))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2754, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"INFO\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Delivering BMP event (%s) from peer(%ld) for an" "UE(%d:%d) to user", czBmpEvntPrintMap[CZ_EVNT_HO_PREP_FAIL], (peerCb->peerId), oldUEX2APIdVal, 0xFFFF); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0); }
                                                ;




   ret = czUimSndBmpCfm(peerCb, evnt);




   if(0 != ret)
   {

      do { if (czCb.init.dbgMask & ((0x00000100 << 7))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2769, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"FATAL\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf,"Indication of the incoming X2-Handover Failure               failed from the peer(%ld) for UE(%d:%d)\n", (peerCb->peerId), oldUEX2APIdVal, 0xFFFF); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0)

                                                      ;





      { do { if (czCb.init.dbgMask & ((0x00000100 << 6))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2776, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"ERROR\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Delivering BMP event (%s) to user for an " "UE(%d:%d) received from peer(%ld) failed, cause(%d)", czBmpEvntPrintMap[CZ_EVNT_HO_PREP_FAIL], oldUEX2APIdVal, 0xFFFF, (peerCb->peerId), ret); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0); }
                                                       ;






      czBmpSndErrIndToPeer(peerCb, evnt, &czUeInfo,
                           2,


                           3,



                           CztCauseMiscom_interventionEnum,
                           (0x50 + 0x05));
      do { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2793, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " Exiting\n"); SPrint(czCb.init.prntBuf); }; } return(ret); }while(0);
   }

   { do { if (czCb.init.dbgMask & ((0x00000100 << 3))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2797, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"INFO\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Delivered BMP event (%s) from peer(%ld) for an" "UE(%d:%d) to user", czBmpEvntPrintMap[CZ_EVNT_HO_PREP_FAIL], (peerCb->peerId), oldUEX2APIdVal, 0xFFFF); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0); }
                                                     ;

   do { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2799, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " Exiting\n"); SPrint(czCb.init.prntBuf); }; } return(0); }while(0);

}
static S16 czBmpHdlOutSnStTrnsfr
(
CzPeerCb *peerCb,
CzUeCb *ueCb,
CztEvnt *evnt,
U8 hoMsgType,
U16 oldUEX2APIdVal
)
{
   CztUE_X2AP_ID *newUEX2APId = 0L;
   U16 newUEX2APIdVal = 0xFFFF;
   S16 ret = 0;

   Txt __tapa_fun[255]; sprintf(__tapa_fun,"czBmpHdlOutSnStTrnsfr"); { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2855, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf," Entering\n"); SPrint(czCb.init.prntBuf); }; ;; } }

   czUtlGetIE(&(evnt->pdu), 9, (TknU8 **)&newUEX2APId);
   if((0L != newUEX2APId) && (1 == newUEX2APId->pres))
   {

      newUEX2APIdVal = (U16) newUEX2APId->val;
   }

   { do { if (czCb.init.dbgMask & ((0x00000100 << 3))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2865, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"INFO\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Outgoing BMP event (%s) for an UE(%d:%d) to " "peer(%ld)", czBmpEvntPrintMap[CZ_EVNT_SN_STATUS_TRFR], oldUEX2APIdVal, newUEX2APIdVal, (peerCb->peerId)); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0); }
                                                         ;





   if((0xFFFF == newUEX2APIdVal) ||
       (newUEX2APIdVal != ueCb->newUEX2APId))
   {





      do { if (czCb.init.dbgMask & ((0x00000100 << 6))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2881, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"ERROR\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Invalid newUEX2APId for an UE(%d:%d)" "when sending SN Status Transfer to peer(%ld)", oldUEX2APIdVal, newUEX2APIdVal, peerCb->peerId); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0)

                                                                     ;







      { do { (Void)cmMemset((U8*)((&czBmpErrInd)), 0, (Size)sizeof(CztLclErrInd)); } while(0); czBmpErrInd.peerId = (peerCb->peerId); czBmpErrInd.msgType = 4; czBmpErrInd.u.ueInfo.oldUEX2APId = oldUEX2APIdVal; czBmpErrInd.u.ueInfo.newUEX2APId = newUEX2APIdVal; }
                                                                ;
      czBmpGenLclErrInd(peerCb, evnt, 0x10,
                        (0x40 + 0x03));
      do { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2893, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " Exiting\n"); SPrint(czCb.init.prntBuf); }; } return(1); }while(0);
   }

   { do { if (czCb.init.dbgMask & ((0x00000100 << 3))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2897, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"INFO\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Sending BMP event (%s) for an UE(%d:%d)" "to peer(%ld) on stream(%d)", czBmpEvntPrintMap[CZ_EVNT_SN_STATUS_TRFR], oldUEX2APIdVal, newUEX2APIdVal, (peerCb->peerId), ueCb->streamId); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0); }
                                                                  ;




   ret = czTpmSndToLower(peerCb, &(evnt->pdu), ueCb->streamId);

   if(0 != ret)
   {

      do { if (czCb.init.dbgMask & ((0x00000100 << 7))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2909, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"FATAL\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Transmission of the outcoming X2-SN State                Transfer failed towards the peer(%ld) for UE(%d:%d)\n", (peerCb->peerId), oldUEX2APIdVal, newUEX2APIdVal); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0)

                                                                 ;
      { do { if (czCb.init.dbgMask & ((0x00000100 << 6))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2922, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"ERROR\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Sending BMP event (%s) for an UE(%d:%d)" "to peer(%ld) failed, cause(%d)", czBmpEvntPrintMap[CZ_EVNT_SN_STATUS_TRFR], oldUEX2APIdVal, newUEX2APIdVal, (peerCb->peerId), ret); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0); }
                                                          ;






      { do { (Void)cmMemset((U8*)((&czBmpErrInd)), 0, (Size)sizeof(CztLclErrInd)); } while(0); czBmpErrInd.peerId = (peerCb->peerId); czBmpErrInd.msgType = 4; czBmpErrInd.u.ueInfo.oldUEX2APId = oldUEX2APIdVal; czBmpErrInd.u.ueInfo.newUEX2APId = newUEX2APIdVal; }
                                                                ;
      czBmpGenLclErrInd(peerCb, evnt, 0x50, (U8)ret);
   }
   else
   {
      { do { if (czCb.init.dbgMask & ((0x00000100 << 3))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2936, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"INFO\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Sent BMP event (%s) for an UE(%d:%d)" "to peer(%ld) on stream(%d)", czBmpEvntPrintMap[CZ_EVNT_SN_STATUS_TRFR], oldUEX2APIdVal, newUEX2APIdVal, (peerCb->peerId), ueCb->streamId); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0); }
                                                                           ;




      do { cmFreeMem((evnt)); (evnt) = 0L; } while(0);
   }

   do { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2944, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " Exiting\n"); SPrint(czCb.init.prntBuf); }; } return(ret); }while(0);

}
static S16 czBmpHdlInSnStTrnsfr
(
CzPeerCb *peerCb,
CzUeCb *ueCb,
CztEvnt *evnt,
U8 hoMsgType,
U16 oldUEX2APIdVal
)
{
   CztUE_X2AP_ID *newUEX2APId = 0L;
   U16 newUEX2APIdVal = 0xFFFF;
   S16 ret;

   Txt __tapa_fun[255]; sprintf(__tapa_fun,"czBmpHdlInSnStTrnsfr"); { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",2999, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf," Entering\n"); SPrint(czCb.init.prntBuf); }; ;; } }

   { do { (Void)cmMemset((U8*)((&czUeInfo)), 0, (Size)sizeof(CztUeInfo)); } while(0); czUeInfo.oldUEX2APId = oldUEX2APIdVal; czUeInfo.newUEX2APId = newUEX2APIdVal; };

   czUtlGetIE(&(evnt->pdu), 9, (TknU8 **)&newUEX2APId);
   if(0L != newUEX2APId)
   {

      newUEX2APIdVal = (U16)newUEX2APId->val;
      czUeInfo.newUEX2APId = newUEX2APIdVal;
   }

   { do { if (czCb.init.dbgMask & ((0x00000100 << 3))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",3012, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"INFO\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Received BMP event (%s) for an UE(%d:%d) from " "peer(%ld)", czBmpEvntPrintMap[CZ_EVNT_SN_STATUS_TRFR], oldUEX2APIdVal, newUEX2APIdVal, (peerCb->peerId)); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0); }
                                                         ;
   if ((0xFFFF == newUEX2APIdVal) ||
            (newUEX2APIdVal != ueCb->newUEX2APId))
   {





      do { if (czCb.init.dbgMask & ((0x00000100 << 6))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",3031, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"ERROR\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Invalid newUEX2APId for an UE(%d:%d)" "when received SN Status Transfer from peer(%ld)", oldUEX2APIdVal, newUEX2APIdVal, peerCb->peerId); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0)

                                                                     ;







      czBmpSndErrIndToPeer(peerCb, evnt, &czUeInfo,
                           4,
                           0,
                           CztCauseRadioNwunknown_new_eNB_UE_X2AP_IDEnum,
                           (0x40 + 0x03));
      do { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",3044, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " Exiting\n"); SPrint(czCb.init.prntBuf); }; } return(1); }while(0);
   }
   { do { if (czCb.init.dbgMask & ((0x00000100 << 3))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",3055, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"INFO\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Delivering BMP event (%s) from peer(%ld) for an" "UE(%d:%d) to user", czBmpEvntPrintMap[CZ_EVNT_SN_STATUS_TRFR], (peerCb->peerId), oldUEX2APIdVal, newUEX2APIdVal); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0); }
                                                  ;




   ret = czUimSndBmpInd(peerCb, evnt);




   if(0 != ret)
   {

      do { if (czCb.init.dbgMask & ((0x00000100 << 7))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",3070, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"FATAL\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Indication of the incoming X2-SN Transfer                failed from the peer(%ld) for UE(%d:%d)\n", (peerCb->peerId), oldUEX2APIdVal, newUEX2APIdVal); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0)

                                               ;





      { do { if (czCb.init.dbgMask & ((0x00000100 << 6))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",3077, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"ERROR\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Delivering BMP event (%s) to user for an " "UE(%d:%d) received from peer(%ld) failed, cause(%d)", czBmpEvntPrintMap[CZ_EVNT_SN_STATUS_TRFR], oldUEX2APIdVal, newUEX2APIdVal, (peerCb->peerId), ret); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0); }
                                                         ;







      czBmpSndErrIndToPeer(peerCb, evnt, &czUeInfo,
                           4,


                           3,



                           CztCauseMiscom_interventionEnum,
                           (0x50 + 0x05));
      do { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",3095, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " Exiting\n"); SPrint(czCb.init.prntBuf); }; } return(ret); }while(0);
   }

   { do { if (czCb.init.dbgMask & ((0x00000100 << 3))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",3099, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"INFO\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Delivered BMP event (%s) from peer(%ld) for an" "UE(%d:%d) to user", czBmpEvntPrintMap[CZ_EVNT_SN_STATUS_TRFR], (peerCb->peerId), oldUEX2APIdVal, newUEX2APIdVal); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0); }
                                                       ;

   do { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",3101, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " Exiting\n"); SPrint(czCb.init.prntBuf); }; } return(0); }while(0);

}
static S16 czBmpHdlOutUeCnxtRelease
(
CzPeerCb *peerCb,
CzUeCb *ueCb,
CztEvnt *evnt,
U8 hoMsgType,
U16 oldUEX2APIdVal
)
{
   CztUE_X2AP_ID *newUEX2APId = 0L;
   U16 newUEX2APIdVal = 0xFFFF;
   CztStrmId streamId;
   S16 ret = 0;

   Txt __tapa_fun[255]; sprintf(__tapa_fun,"czBmpHdlOutUeCnxtRelease"); { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",3158, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf," Entering\n"); SPrint(czCb.init.prntBuf); }; ;; } }

   czUtlGetIE(&(evnt->pdu), 9, (TknU8 **)&newUEX2APId);
   if((0L != newUEX2APId) && (1 == newUEX2APId->pres))
   {

      newUEX2APIdVal = (U16) newUEX2APId->val;
   }

   { do { if (czCb.init.dbgMask & ((0x00000100 << 3))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",3168, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"INFO\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Outgoing BMP event (%s) for an UE(%d:%d) to " "peer(%ld)", czBmpEvntPrintMap[CZ_EVNT_UE_CXT_RELEASE], oldUEX2APIdVal, newUEX2APIdVal, (peerCb->peerId)); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0); }
                                                         ;





   if ((0xFFFF == newUEX2APIdVal) ||
        (newUEX2APIdVal != ueCb->newUEX2APId))
   {





      do { if (czCb.init.dbgMask & ((0x00000100 << 6))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",3184, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"ERROR\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Invalid newUEX2APId for an UE(%d:%d)" "when sending UE Context Release to peer(%ld)", oldUEX2APIdVal, newUEX2APIdVal, (peerCb->peerId)); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0)

                                                                       ;







      { do { (Void)cmMemset((U8*)((&czBmpErrInd)), 0, (Size)sizeof(CztLclErrInd)); } while(0); czBmpErrInd.peerId = (peerCb->peerId); czBmpErrInd.msgType = 5; czBmpErrInd.u.ueInfo.oldUEX2APId = oldUEX2APIdVal; czBmpErrInd.u.ueInfo.newUEX2APId = newUEX2APIdVal; }
                                                                ;
      czBmpGenLclErrInd(peerCb, evnt, 0x10,
                        (0x40 + 0x03));

      do { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",3197, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " Exiting\n"); SPrint(czCb.init.prntBuf); }; } return(1); }while(0);
   }






   streamId = ueCb->streamId;
   czNmmDelUeCb(ueCb);
   ueCb= 0L;

   { do { if (czCb.init.dbgMask & ((0x00000100 << 3))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",3210, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"INFO\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Sending BMP event (%s) for an UE(%d:%d)" "to peer(%ld) on stream(%d)", czBmpEvntPrintMap[CZ_EVNT_UE_CXT_RELEASE], oldUEX2APIdVal, newUEX2APIdVal, (peerCb->peerId), streamId); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0); }
                                                             ;




   ret = czTpmSndToLower(peerCb, &(evnt->pdu), streamId);

   if(0 != ret)
   {

      do { if (czCb.init.dbgMask & ((0x00000100 << 7))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",3222, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"FATAL\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Transmission of the outcoming X2-UE Context                Release failed towards the peer(%ld) for UE(%d:%d)\n", (peerCb->peerId), oldUEX2APIdVal, newUEX2APIdVal); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0)

                                                                 ;





      { do { if (czCb.init.dbgMask & ((0x00000100 << 6))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",3229, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"ERROR\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Sending BMP event (%s) for an UE(%d:%d)" "to peer(%ld) failed, cause(%d)", czBmpEvntPrintMap[CZ_EVNT_UE_CXT_RELEASE], oldUEX2APIdVal, newUEX2APIdVal, (peerCb->peerId), ret); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0); }
                                                          ;






      { do { (Void)cmMemset((U8*)((&czBmpErrInd)), 0, (Size)sizeof(CztLclErrInd)); } while(0); czBmpErrInd.peerId = (peerCb->peerId); czBmpErrInd.msgType = 5; czBmpErrInd.u.ueInfo.oldUEX2APId = oldUEX2APIdVal; czBmpErrInd.u.ueInfo.newUEX2APId = newUEX2APIdVal; }
                                                                ;
      czBmpGenLclErrInd(peerCb, evnt, 0x50, (U8)ret);
   }
   else
   {
      { do { if (czCb.init.dbgMask & ((0x00000100 << 3))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",3243, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"INFO\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Sent BMP event (%s) for an UE(%d:%d)" "to peer(%ld) on stream(%d)", czBmpEvntPrintMap[CZ_EVNT_UE_CXT_RELEASE], oldUEX2APIdVal, newUEX2APIdVal, (peerCb->peerId), streamId); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0); }
                                                                     ;




      do { cmFreeMem((evnt)); (evnt) = 0L; } while(0);
   }

   do { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",3251, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " Exiting\n"); SPrint(czCb.init.prntBuf); }; } return(ret); }while(0);

}
static S16 czBmpHdlInUeCnxtRelease
(
CzPeerCb *peerCb,
CzUeCb *ueCb,
CztEvnt *evnt,
U8 hoMsgType,
U16 oldUEX2APIdVal
)
{
   CztUE_X2AP_ID *newUEX2APId = 0L;
   U16 newUEX2APIdVal = 0xFFFF;
   S16 ret;

   Txt __tapa_fun[255]; sprintf(__tapa_fun,"czBmpHdlInUeCnxtRelease"); { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",3308, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf," Entering\n"); SPrint(czCb.init.prntBuf); }; ;; } }

   { do { (Void)cmMemset((U8*)((&czUeInfo)), 0, (Size)sizeof(CztUeInfo)); } while(0); czUeInfo.oldUEX2APId = oldUEX2APIdVal; czUeInfo.newUEX2APId = newUEX2APIdVal; };

   czUtlGetIE(&(evnt->pdu), 9, (TknU8 **)&newUEX2APId);
   if(0L != newUEX2APId)
   {

      newUEX2APIdVal = (U16)newUEX2APId->val;
      czUeInfo.newUEX2APId = newUEX2APIdVal;
   }

   { do { if (czCb.init.dbgMask & ((0x00000100 << 3))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",3321, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"INFO\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Received BMP event (%s) for an UE(%d:%d) from " "peer(%ld)", czBmpEvntPrintMap[CZ_EVNT_UE_CXT_RELEASE], oldUEX2APIdVal, newUEX2APIdVal, (peerCb->peerId)); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0); }
                                                         ;






   if((0xFFFF == newUEX2APIdVal) ||
           (newUEX2APIdVal != ueCb->newUEX2APId))
   {





      do { if (czCb.init.dbgMask & ((0x00000100 << 6))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",3338, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"ERROR\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Invalid newUEX2APId for an UE(%d:%d)" "when received UE Context Release from peer(%ld)", oldUEX2APIdVal, newUEX2APIdVal, peerCb->peerId); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0)

                                                                       ;
      czBmpSndErrIndToPeer(peerCb, evnt, &czUeInfo,
                           5,
                           0,
                           CztCauseRadioNwunknown_new_eNB_UE_X2AP_IDEnum,
                           (0x40 + 0x03));
      do { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",3352, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " Exiting\n"); SPrint(czCb.init.prntBuf); }; } return(1); }while(0);
   }





   czStopTmr(CZ_TMR_TX2RELOCOVERALL, (U32 *)ueCb);






   czNmmDelUeCb(ueCb);
   ueCb= 0L;




   { do { if (czCb.init.dbgMask & ((0x00000100 << 3))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",3373, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"INFO\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Delivering BMP event (%s) from peer(%ld) for an" "UE(%d:%d) to user", czBmpEvntPrintMap[CZ_EVNT_UE_CXT_RELEASE], (peerCb->peerId), oldUEX2APIdVal, newUEX2APIdVal); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0); }
                                                 ;




   ret = czUimSndBmpInd(peerCb, evnt);




   if(0 != ret)
   {

      do { if (czCb.init.dbgMask & ((0x00000100 << 7))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",3388, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"FATAL\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Indication of the incoming X2-UE Context                Release failed from the peer(%ld) for UE(%d:%d)\n", (peerCb->peerId), oldUEX2APIdVal, newUEX2APIdVal); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0)

                                                                 ;





      { do { if (czCb.init.dbgMask & ((0x00000100 << 6))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",3395, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"ERROR\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Delivering BMP event (%s) to user for an " "UE(%d:%d) received from peer(%ld) failed, cause(%d)", czBmpEvntPrintMap[CZ_EVNT_UE_CXT_RELEASE], oldUEX2APIdVal, newUEX2APIdVal, (peerCb->peerId), ret); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0); }
                                                         ;







      czBmpSndErrIndToPeer(peerCb, evnt, &czUeInfo,
                           5,


                           3,



                           CztCauseMiscom_interventionEnum,
                           (0x50 + 0x05));
      do { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",3413, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " Exiting\n"); SPrint(czCb.init.prntBuf); }; } return(ret); }while(0);
   }

   { do { if (czCb.init.dbgMask & ((0x00000100 << 3))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",3417, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"INFO\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Delivered BMP event (%s) from peer(%ld) for an" "UE(%d:%d) to user", czBmpEvntPrintMap[CZ_EVNT_UE_CXT_RELEASE], (peerCb->peerId), oldUEX2APIdVal, newUEX2APIdVal); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0); }
                                         ;

   do { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",3419, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " Exiting\n"); SPrint(czCb.init.prntBuf); }; } return(0); }while(0);

}
 S16 czBmpHdlTmrEvnt
(
CzUeCb *ueCb,
S16 tmrEvnt
)





{
   CzPeerCb *peerCb;
   CztEvnt *cancelEvnt = 0L;
   CztStaInd tmrExpStaInd;
   CzCztSapCb *ueCztSapCb = 0L;
   U16 oldUEX2APIdVal, newUEX2APIdVal;
   U32 peerId;
   CztStrmId streamId;
   U8 causeVal = 0, lclStatVal;
   S16 ret = 0;

   Txt __tapa_fun[255]; sprintf(__tapa_fun,"czBmpHdlTmrEvnt"); { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",3467, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf," Entering\n"); SPrint(czCb.init.prntBuf); }; ;; } }

   switch(tmrEvnt)
   {
      case CZ_TMR_TRELOCPREP:
      {
         { do { if (czCb.init.dbgMask & ((0x00000100 << 3))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",3473, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"INFO\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Timer(%d) expired for UE(%d:%d) with peer (%ld)", tmrEvnt, (ueCb->oldUEX2APId), (ueCb->newUEX2APId), (ueCb->peerCb->peerId)); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0);};





         causeVal = CztCauseRadioNwtrelocprep_expiryEnum;
         lclStatVal = 6;
         break;
      }

      case CZ_TMR_TX2RELOCOVERALL:
      {
         { do { if (czCb.init.dbgMask & ((0x00000100 << 3))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",3486, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"INFO\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Timer(%d) expired for UE(%d:%d) with peer (%ld)", tmrEvnt, (ueCb->oldUEX2APId), (ueCb->newUEX2APId), (ueCb->peerCb->peerId)); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0);};





         causeVal = CztCauseRadioNwtx2relocoverall_expiryEnum;
         lclStatVal = 7;
         break;
      }
      default:
      {

         do { if (czCb.init.dbgMask & ((0x00000100 << 6))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",3500, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"ERROR\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Unknown timer for BMP(%d) with UE(%p)", tmrEvnt, (Void *)ueCb); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0)
                                              ;
         do { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",3501, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " Exiting\n"); SPrint(czCb.init.prntBuf); }; } return(0); }while(0);
      }
   }

   peerCb = ueCb->peerCb;
   peerId = peerCb->peerId;
   ueCztSapCb = peerCb->cztSapCb;
   oldUEX2APIdVal = ueCb->oldUEX2APId;
   newUEX2APIdVal = ueCb->newUEX2APId;
   streamId = ueCb->streamId;
   czNmmDelUeCb(ueCb);
   ueCb= 0L;


   if(CZ_GP_CONNECTING == peerCb->state)
   {





      do { if (czCb.init.dbgMask & ((0x00000100 << 6))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",3532, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"ERROR\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Peer(%ld) in Reset state with timer(%d) " "expiry on UE(%d:%d), aborting...", peerId, lclStatVal, oldUEX2APIdVal, newUEX2APIdVal); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0)

                                                                     ;

      goto staInd;
   }

   { do { (Void)cmMemset((U8*)((&czUeInfo)), 0, (Size)sizeof(CztUeInfo)); } while(0); czUeInfo.oldUEX2APId = oldUEX2APIdVal; czUeInfo.newUEX2APId = newUEX2APIdVal; };

   if(tmrEvnt == CZ_TMR_TRELOCPREP)
   {
   cancelEvnt = czUtlGenHoCancel(&czUeInfo, 0, causeVal);
   if(0L != cancelEvnt)
   {
      { do { if (czCb.init.dbgMask & ((0x00000100 << 3))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",3545, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"INFO\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Sending BMP event (%s) for an UE(%d:%d)" "to peer(%ld) on stream(%d)", czBmpEvntPrintMap[CZ_EVNT_HO_CANCEL], oldUEX2APIdVal, newUEX2APIdVal, (peerCb->peerId), streamId); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0); }
                                                           ;




      ret = czTpmSndToLower(peerCb, &(cancelEvnt->pdu), streamId);

      if(0 != ret)
      {

      do { if (czCb.init.dbgMask & ((0x00000100 << 7))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",3557, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"FATAL\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Transmission of the outcoming X2-Handover                Cancel failed towards the peer(%ld) for UE(%d:%d)\n", (peerCb->peerId), oldUEX2APIdVal, newUEX2APIdVal); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0)

                                                                 ;





         { do { if (czCb.init.dbgMask & ((0x00000100 << 6))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",3564, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"ERROR\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Sending BMP event (%s) for an UE(%d:%d)" "to peer(%ld) failed, cause(%d)", czBmpEvntPrintMap[CZ_EVNT_HO_CANCEL], oldUEX2APIdVal, newUEX2APIdVal, (peerCb->peerId), ret); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0); }
                                                        ;


         czUtlUpdOutErrSts(peerCb, 3);




         { CztLclErrInd _errInd; _errInd.peerId = peerCb->peerId; _errInd.causeType = 0x50; _errInd.causeValue = (U8)ret; _errInd.msgType = 3; czUimSndErrInd (peerCb->cztSapCb, &_errInd, 0L, 0L); }

                                               ;
      }
      else
      {
         { do { if (czCb.init.dbgMask & ((0x00000100 << 3))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",3579, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"INFO\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Sent BMP event (%s) for an UE(%d:%d)" "to peer(%ld) on stream(%d)", czBmpEvntPrintMap[CZ_EVNT_HO_CANCEL], oldUEX2APIdVal, newUEX2APIdVal, (peerCb->peerId), streamId); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0); }
                                                  ;


         czUtlUpdOutSts(peerCb, 3);
      }
      do { cmFreeMem((cancelEvnt)); (cancelEvnt) = 0L; } while(0);
   }
   else
   {





      do { if (czCb.init.dbgMask & ((0x00000100 << 6))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",3595, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"ERROR\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Building HO Cancel with timer(%d) " "expiry on UE(%d:%d) to peer(%ld) failed\n", lclStatVal, oldUEX2APIdVal,newUEX2APIdVal, (peerCb->peerId)); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0)

                                                                             ;

   }
   }

staInd:


   do { (Void)cmMemset((U8*)(&tmrExpStaInd), 0, (Size)sizeof(CztStaInd)); } while(0);
   tmrExpStaInd.peerId = peerId;
   tmrExpStaInd.type = 4;
   tmrExpStaInd.status = lclStatVal;
   tmrExpStaInd.reason = 0;
   tmrExpStaInd.oldUEX2APId = oldUEX2APIdVal;

   ret = czUimSndStaInd(ueCztSapCb, &tmrExpStaInd);
   if(0 != ret)
   {






      do { if (czCb.init.dbgMask & ((0x00000100 << 6))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",3622, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"ERROR\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Delivering Status Indication with timer(%d) " "expiry on UE(%d:%d), peer(%ld) failed", lclStatVal, oldUEX2APIdVal, newUEX2APIdVal, peerId); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0)


                         ;

   }

   do { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",3626, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " Exiting\n"); SPrint(czCb.init.prntBuf); }; } return(0); }while(0);

}
static S16 czBmpHdlOutEvntErr
(
CzPeerCb *peerCb,
CzUeCb *ueCb,
CztEvnt *evnt,
U8 hoMsgType,
U16 oldUEX2APIdVal
)
{
   CztUE_X2AP_ID *newUEX2APId = 0L;
   U16 newUEX2APIdVal = 0xFFFF;
   U8 state = 0xFF, causeVal = (0x60 + 0x02);
   S16 hoMsgEvnt;

   Txt __tapa_fun[255]; sprintf(__tapa_fun,"czBmpHdlOutEvntErr"); { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",3681, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf," Entering\n"); SPrint(czCb.init.prntBuf); }; ;; } }
   if((0 != hoMsgType) && (2 != hoMsgType))
   {
      czUtlGetIE(&(evnt->pdu), 9,
                 (TknU8 **)&newUEX2APId);
      if((0L != newUEX2APId) && (1 == newUEX2APId->pres))
      {

         newUEX2APIdVal =(U16) newUEX2APId->val;
      }
   }

   hoMsgEvnt = ((hoMsgType < (28 +1)) ? (czEvntMap[hoMsgType]) : (255));;



   if(ueCb)
   {
      state = ueCb->state;
      causeVal = (0x60 + 0x01);
   }



   if (6 < hoMsgEvnt)
   {
      hoMsgEvnt = 6;
   }







   do { if (czCb.init.dbgMask & ((0x00000100 << 6))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",3728, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"ERROR\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Mobility event(%s) received in state(%s) " "for an UE(%d:%d) from user to send to peer(%ld) \n", czBmpEvntPrintMap[hoMsgEvnt], ((state <= CZ_BMP_HO_PREPARED)? (czBmpStatePrintMap[state]):("Invalid")), oldUEX2APIdVal, newUEX2APIdVal, (peerCb->peerId)); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0)



                                                                   ;


   { do { (Void)cmMemset((U8*)((&czBmpErrInd)), 0, (Size)sizeof(CztLclErrInd)); } while(0); czBmpErrInd.peerId = (peerCb->peerId); czBmpErrInd.msgType = hoMsgType; czBmpErrInd.u.ueInfo.oldUEX2APId = oldUEX2APIdVal; czBmpErrInd.u.ueInfo.newUEX2APId = newUEX2APIdVal; }
                                                              ;

   czBmpGenLclErrInd(peerCb, evnt, 0x60,
                     causeVal);


   do { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",3738, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " Exiting\n"); SPrint(czCb.init.prntBuf); }; } return(1); }while(0);

}
static S16 czBmpHdlInHoReqErr
(
CzPeerCb *peerCb,
CzUeCb *ueCb,
CztEvnt *evnt,
U8 hoMsgType,
U16 oldUEX2APIdVal
)
{
   CztStrmId streamId;
   U8 state = 0xFF;

   Txt __tapa_fun[255]; sprintf(__tapa_fun,"czBmpHdlInHoReqErr"); { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",3795, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf," Entering\n"); SPrint(czCb.init.prntBuf); }; ;; } }




   if(ueCb)
   {
      state = ueCb->state;
      streamId = ueCb->streamId;
   }
   else
   {
      czUtlGetStream(peerCb, &streamId);
   }







   do { if (czCb.init.dbgMask & ((0x00000100 << 6))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",3819, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"ERROR\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Handover Request received in state(%s) " "for an UE(%d:%d) from peer(%ld)\n", ((state <= CZ_BMP_HO_PREPARED)? (czBmpStatePrintMap[state]):("Invalid")), oldUEX2APIdVal, 0xFFFF, peerCb->peerId); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0)


                                                                        ;


   { do { (Void)cmMemset((U8*)((&czUeInfo)), 0, (Size)sizeof(CztUeInfo)); } while(0); czUeInfo.oldUEX2APId = oldUEX2APIdVal; czUeInfo.newUEX2APId = 0xFFFF; };



   czBmpSndFailErrToPeer(peerCb, evnt, &czUeInfo, 0, streamId);

   do { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",3828, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " Exiting\n"); SPrint(czCb.init.prntBuf); }; } return(1); }while(0);
}
static S16 czBmpHdlInHoRspEvntErr
(
CzPeerCb *peerCb,
CzUeCb *ueCb,
CztEvnt *evnt,
U8 hoMsgType,
U16 oldUEX2APIdVal
)
{
   CztUE_X2AP_ID *newUEX2APId = 0L;
   U16 newUEX2APIdVal = 0xFFFF;
   U8 state = 0xFF;
   S16 hoMsgEvnt;

   Txt __tapa_fun[255]; sprintf(__tapa_fun,"czBmpHdlInHoRspEvntErr"); { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",3879, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf," Entering\n"); SPrint(czCb.init.prntBuf); }; ;; } }






   czUtlGetIE(&(evnt->pdu), 9, (TknU8 **)&newUEX2APId);
   if(0L != newUEX2APId)
   {

      newUEX2APIdVal = (U16) newUEX2APId->val;
   }

   hoMsgEvnt = ((hoMsgType < (28 +1)) ? (czEvntMap[hoMsgType]) : (255));;

   if(ueCb)
   {
      state = ueCb->state;
   }




   if (6 < hoMsgEvnt)
   {
      hoMsgEvnt = 6;
   }







   do { if (czCb.init.dbgMask & ((0x00000100 << 6))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",3918, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"ERROR\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Mobility response event(%s) received in wrong" "state (%s) for an UE(%d:%d) from peer(%ld) \n", czBmpEvntPrintMap[hoMsgEvnt], ((state <= CZ_BMP_HO_PREPARED)? (czBmpStatePrintMap[state]):("Invalid")), oldUEX2APIdVal, newUEX2APIdVal, (peerCb->peerId)); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0)



                                                                   ;
   { do { (Void)cmMemset((U8*)((&czBmpErrInd)), 0, (Size)sizeof(CztLclErrInd)); } while(0); czBmpErrInd.peerId = (peerCb->peerId); czBmpErrInd.msgType = hoMsgType; czBmpErrInd.u.ueInfo.oldUEX2APId = oldUEX2APIdVal; czBmpErrInd.u.ueInfo.newUEX2APId = newUEX2APIdVal; }
                                                              ;
   czBmpGenLclErrInd(peerCb, evnt, 0x80,
                     (0x60 + 0x01));

   do { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",3934, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " Exiting\n"); SPrint(czCb.init.prntBuf); }; } return(1); }while(0);
}
static S16 czBmpHdlInReqErr
(
CzPeerCb *peerCb,
CzUeCb *ueCb,
CztEvnt *evnt,
U8 hoMsgType,
U16 oldUEX2APIdVal
)
{
   CztUE_X2AP_ID *newUEX2APId = 0L;
   U16 newUEX2APIdVal = 0xFFFF;
   U8 state = 0xFF;
   S16 hoMsgEvnt;

   Txt __tapa_fun[255]; sprintf(__tapa_fun,"czBmpHdlInReqErr"); { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",3984, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf," Entering\n"); SPrint(czCb.init.prntBuf); }; ;; } }






   czUtlGetIE(&(evnt->pdu), 9, (TknU8 **)&newUEX2APId);
   if(0L != newUEX2APId)
   {

      newUEX2APIdVal = (U16) newUEX2APId->val;
   }

   hoMsgEvnt = ((hoMsgType < (28 +1)) ? (czEvntMap[hoMsgType]) : (255));;

   if(ueCb)
   {
      state = ueCb->state;
   }



   if (6 < hoMsgEvnt)
   {
      hoMsgEvnt = 6;
   }







   do { if (czCb.init.dbgMask & ((0x00000100 << 6))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",4022, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"ERROR\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Mobility event(%s) received in wrong state (%s)" " for an UE(%d:%d) from peer(%ld) \n", czBmpEvntPrintMap[hoMsgEvnt], ((state <= CZ_BMP_HO_PREPARED)? (czBmpStatePrintMap[state]):("Invalid")), oldUEX2APIdVal, newUEX2APIdVal, (peerCb->peerId)); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0)



                                                                   ;
   do { cmFreeMem((evnt)); (evnt) = 0L; } while(0);

   do { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",4036, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " Exiting\n"); SPrint(czCb.init.prntBuf); }; } return(1); }while(0);
}
static S16 czBmpHdlInEvntErr
(
CzPeerCb *peerCb,
CzUeCb *ueCb,
CztEvnt *evnt,
U8 hoMsgType,
U16 oldUEX2APIdVal
)
{
   CztUE_X2AP_ID *newUEX2APId = 0L;
   U8 state = 0xFF;
   S16 hoMsgEvnt;

   Txt __tapa_fun[255]; sprintf(__tapa_fun,"czBmpHdlInEvntErr"); { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",4086, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf," Entering\n"); SPrint(czCb.init.prntBuf); }; ;; } }




   { do { (Void)cmMemset((U8*)((&czUeInfo)), 0, (Size)sizeof(CztUeInfo)); } while(0); czUeInfo.oldUEX2APId = oldUEX2APIdVal; czUeInfo.newUEX2APId = 0xFFFF; };



   if(hoMsgType != 2)
   {
      czUtlGetIE(&(evnt->pdu), 9,
                  (TknU8 **)&newUEX2APId);
      if(0L != newUEX2APId)
      {

         czUeInfo.newUEX2APId = (U16) newUEX2APId->val;
      }
   }

   hoMsgEvnt = ((hoMsgType < (28 +1)) ? (czEvntMap[hoMsgType]) : (255));;

   if(ueCb)
   {
      state = ueCb->state;
   }



   if (6 < hoMsgEvnt)
   {
      hoMsgEvnt = 6;
   }







   do { if (czCb.init.dbgMask & ((0x00000100 << 6))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",4130, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"ERROR\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Mobility event(%s) received in wrong state (%s)" " for an UE(%d:%d) from peer(%ld) \n", czBmpEvntPrintMap[hoMsgEvnt], ((state <= CZ_BMP_HO_PREPARED)? (czBmpStatePrintMap[state]):("Invalid")), oldUEX2APIdVal, czUeInfo.newUEX2APId, peerCb->peerId); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0)



                                                                       ;




   czBmpSndErrIndToPeer(peerCb, evnt, &czUeInfo,
                        hoMsgType,


                        2,



                    CztCauseProtmessage_not_compatible_with_receiver_stateEnum,
                        (0x60 + 0x01));

   do { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",4146, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " Exiting\n"); SPrint(czCb.init.prntBuf); }; } return(1); }while(0);
}
static S16 czBmpIsErrIndValid
(
CzPeerCb *peerCb,
U8 hoMsgType,
U8 msgDirectn
)






{
   S16 lclCauseVal = 0;

    Txt __tapa_fun[255]; sprintf(__tapa_fun,"czBmpIsErrIndValid"); { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",4187, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf," Entering\n"); SPrint(czCb.init.prntBuf); }; ;; } };







   if((CZ_GP_IDLE == peerCb->state) ||
      ((CZ_GP_CONNECTING == peerCb->state) && (CZ_DIR_OUT == msgDirectn)))
   {






      do { if (czCb.init.dbgMask & ((0x00000100 << 6))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",4207, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"ERROR\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Error Indication from(%s) " "when peer (%ld) in not active state(%d)\n", ((msgDirectn == CZ_DIR_OUT) ? ("User"):("Peer")), (peerCb->peerId), (peerCb->state)); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0)


                                        ;


      lclCauseVal = (0x60 + 0x01);
   }



   else if(0 == hoMsgType)
   {




      do { if (czCb.init.dbgMask & ((0x00000100 << 6))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",4222, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"ERROR\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Error Indication for Handover Request" "is invalid for peer (%ld)\n", (peerCb->peerId)); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0)
                                                                       ;

      lclCauseVal = (0x60 + 0x02);
   }

   do { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",4227, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " Exiting\n"); SPrint(czCb.init.prntBuf); }; } return(lclCauseVal); }while(0);

}
static S16 czBmpGenErrIndEvntErr
(
CzPeerCb *peerCb,
CztEvnt *evnt,
U8 msgDirectn,
U8 causeVal
)







{
   S16 ret;
   Txt __tapa_fun[255]; sprintf(__tapa_fun,"czBmpGenErrIndEvntErr"); { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",4272, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf," Entering\n"); SPrint(czCb.init.prntBuf); }; ;; } };

   if(CZ_DIR_OUT == msgDirectn)
   {


      czUtlUpdOutErrSts(peerCb, 7);



      { do { (Void)cmMemset((U8*)((&czBmpErrInd)), 0, (Size)sizeof(CztLclErrInd)); } while(0); czBmpErrInd.peerId = (peerCb->peerId); czBmpErrInd.causeType = 0x60; czBmpErrInd.causeValue = causeVal; czBmpErrInd.msgType = 7; }

                                                   ;
   }
   else
   {


      czUtlUpdInErrSts(peerCb, 7);
      { do { (Void)cmMemset((U8*)((&czBmpErrInd)), 0, (Size)sizeof(CztLclErrInd)); } while(0); czBmpErrInd.peerId = (peerCb->peerId); czBmpErrInd.causeType = 0x80; czBmpErrInd.causeValue = causeVal; czBmpErrInd.msgType = 7; }

                                                   ;
   }
   ret = czUimSndErrInd (peerCb->cztSapCb, &czBmpErrInd, evnt, 0L);
   if(0 != ret)
   {
      do { cmFreeMem((evnt)); (evnt) = 0L; } while(0);
   }

   do { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",4309, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " Exiting\n"); SPrint(czCb.init.prntBuf); }; } return(0); }while(0);
}
static S16 czBmpGenLclErrInd
(
CzPeerCb *peerCb,
CztEvnt *evnt,
U8 causeType,
U8 causeVal
)







{
   S16 ret = 0;

   Txt __tapa_fun[255]; sprintf(__tapa_fun,"czBmpGenLclErrInd"); { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",4350, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf," Entering\n"); SPrint(czCb.init.prntBuf); }; ;; } }

   { czBmpErrInd.causeType = causeType; czBmpErrInd.causeValue = causeVal; };

   ret = czUimSndErrInd (peerCb->cztSapCb, &czBmpErrInd, evnt, 0L);
   if(0 != ret)
   {
      do { cmFreeMem((evnt)); (evnt) = 0L; } while(0);
   }

   do { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",4360, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " Exiting\n"); SPrint(czCb.init.prntBuf); }; } return(0); }while(0);
}
static S16 czBmpSndFailErrToPeer
(
CzPeerCb *peerCb,
CztEvnt *evnt,
CztUeInfo *bmpUeInfo,
U8 hoMsgType,
CztStrmId streamId
)
{
   CztEvnt *rspErrEvnt = 0L;
   U16 oldUEX2APIdVal = 0xFFFF;
   U16 newUEX2APIdVal = 0xFFFF;
   U8 rspMsgType;
   S16 ret = 0;

   Txt __tapa_fun[255]; sprintf(__tapa_fun,"czBmpSndFailErrToPeer"); { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",4433, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf," Entering\n"); SPrint(czCb.init.prntBuf); }; ;; } }
   do { if (czCb.init.dbgMask & ((0x00000100 << 3))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",4434, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"INFO\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "For peer with peerId (%ld)", peerCb->peerId); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0);;
   oldUEX2APIdVal = bmpUeInfo->oldUEX2APId;
   newUEX2APIdVal = bmpUeInfo->newUEX2APId;

   switch(hoMsgType)
   {
      case 0:
      {
         rspErrEvnt = czUtlGenHoPrepFailure(((CzIeInfo *)0L),
                                            (CzMsgInfo *)bmpUeInfo,


                                            2,



                    CztCauseProtmessage_not_compatible_with_receiver_stateEnum);

         rspMsgType = 2;







         do { if (czCb.init.dbgMask & ((0x00000100 << 3))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",4475, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"INFO\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Generating HO Preparation Failure" "on HO Request to peer(%ld) with UE(%d:%d)" "on stream %d\n", (peerCb->peerId), oldUEX2APIdVal, newUEX2APIdVal, streamId); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0)


                                                 ;

         break;
      }
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      {
         rspErrEvnt = czUtlGenPeerErrInd(&(evnt->pdu), hoMsgType,
                                         ((CzMsgInfo *)bmpUeInfo),


                                            2,



                    CztCauseProtmessage_not_compatible_with_receiver_stateEnum);

         rspMsgType = 7;







         do { if (czCb.init.dbgMask & ((0x00000100 << 3))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",4506, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"INFO\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Generating Error Indication " "on %d to peer(%ld) with UE(%d:%d) on stream(%d)\n", hoMsgType, (peerCb->peerId), oldUEX2APIdVal, newUEX2APIdVal, streamId); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0)


                               ;

         break;
      }
      default:
      {
         do { if (czCb.init.dbgMask & ((0x00000100 << 6))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",4512, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"ERROR\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Invalid Message Type\n"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0);
         do { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",4513, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " Exiting\n"); SPrint(czCb.init.prntBuf); }; } return(1); }while(0);
      }
   }
   if(0L != rspErrEvnt)
   {

      czUtlUpdOutSts(peerCb, rspMsgType);




      ret = czTpmSndToLower(peerCb, &(rspErrEvnt->pdu), streamId);

      if(0 != ret)
      {






         do { if (czCb.init.dbgMask & ((0x00000100 << 7))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",4537, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"FATAL\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Sending Handover Error " "Response/Indication %d to peer(%ld) failed on UE(%d:%d)\n", rspMsgType, (peerCb->peerId), oldUEX2APIdVal, newUEX2APIdVal); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0)


                                ;


         czUtlUpdOutErrSts(peerCb, rspMsgType);
      }
      do { cmFreeMem((rspErrEvnt)); (rspErrEvnt) = 0L; } while(0);
   }
   else
   {






      do { if (czCb.init.dbgMask & ((0x00000100 << 6))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",4555, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"ERROR\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Building Handover Error " "Response/Indication %d to peer(%ld) failed on UE(%d:%d)\n", rspMsgType, (peerCb->peerId), oldUEX2APIdVal, newUEX2APIdVal); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0)


                                ;


      czUtlUpdOutErrSts(peerCb, rspMsgType);
   }



   { do { (Void)cmMemset((U8*)((&czBmpErrInd)), 0, (Size)sizeof(CztLclErrInd)); } while(0); czBmpErrInd.peerId = (peerCb->peerId); czBmpErrInd.causeType = 0x80; czBmpErrInd.causeValue = (0x60 + 0x01); czBmpErrInd.msgType = hoMsgType; czBmpErrInd.u.ueInfo.oldUEX2APId = oldUEX2APIdVal; czBmpErrInd.u.ueInfo.newUEX2APId = newUEX2APIdVal; }

                                                           ;

   ret = czUimSndErrInd (peerCb->cztSapCb, &czBmpErrInd, evnt, 0L);
   if(0 != ret)
   {
      do { cmFreeMem((evnt)); (evnt) = 0L; } while(0);
   }

   do { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",4573, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " Exiting\n"); SPrint(czCb.init.prntBuf); }; } return(0); }while(0);

}
static S16 czBmpSndFailRspToPeer
(
CzPeerCb *peerCb,
CztEvnt *evnt,
CztUeInfo *bmpUeInfo,
CzIeInfo *errIeInfo,
U8 causeType,
U8 causeVal,
U8 lclCauseVal
)
{
   CztEvnt *rspErrEvnt = 0L;
   U16 oldUEX2APIdVal = 0xFFFF;
   U16 newUEX2APIdVal = 0xFFFF;
   CztStrmId streamId;
   S16 ret = 0;

   Txt __tapa_fun[255]; sprintf(__tapa_fun,"czBmpSndFailRspToPeer"); { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",4638, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf," Entering\n"); SPrint(czCb.init.prntBuf); }; ;; } }
   oldUEX2APIdVal = bmpUeInfo->oldUEX2APId;
   newUEX2APIdVal = bmpUeInfo->newUEX2APId;

   rspErrEvnt = czUtlGenHoPrepFailure(errIeInfo, ((CzMsgInfo *)bmpUeInfo),
                                      causeType, causeVal);
   if(0L != rspErrEvnt)
   {
      czUtlGetStream(peerCb, &streamId);






      do { if (czCb.init.dbgMask & ((0x00000100 << 3))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",4664, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"INFO\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Generating Handover Preparation Failure " "to peer(%ld) with UE(%d:%d) on stream(%d)\n", (peerCb->peerId), oldUEX2APIdVal, newUEX2APIdVal, streamId); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0)


                                ;




      ret = czTpmSndToLower(peerCb, &(rspErrEvnt->pdu), streamId);

      if(0 == ret)
      {

         czUtlUpdOutSts(peerCb, 2);
      }
      else
      {






         do { if (czCb.init.dbgMask & ((0x00000100 << 7))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",4687, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"FATAL\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Sending Handover Preparation Failure" "to peer(%ld) failed on UE(%d:%d)\n", (peerCb->peerId), oldUEX2APIdVal, newUEX2APIdVal); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0)


                                ;


         czUtlUpdOutErrSts(peerCb, 2);
      }
      do { cmFreeMem((rspErrEvnt)); (rspErrEvnt) = 0L; } while(0);
   }
   else
   {






      do { if (czCb.init.dbgMask & ((0x00000100 << 6))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",4705, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"ERROR\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Building Failure Response" "to peer(%ld) failed on UE(%d:%d)\n", (peerCb->peerId), oldUEX2APIdVal, newUEX2APIdVal); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0)


                                   ;



      czUtlUpdOutErrSts(peerCb, 2);
   }

   if((0x50 + 0x05) == lclCauseVal)
   {
      do { cmFreeMem((evnt)); (evnt) = 0L; } while(0);
      do { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",4715, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " Exiting\n"); SPrint(czCb.init.prntBuf); }; } return(0); }while(0);
   }



   { do { (Void)cmMemset((U8*)((&czBmpErrInd)), 0, (Size)sizeof(CztLclErrInd)); } while(0); czBmpErrInd.peerId = (peerCb->peerId); czBmpErrInd.causeType = 0x80; czBmpErrInd.causeValue = lclCauseVal; czBmpErrInd.msgType = 0; czBmpErrInd.u.ueInfo.oldUEX2APId = oldUEX2APIdVal; czBmpErrInd.u.ueInfo.newUEX2APId = newUEX2APIdVal; }

                                                           ;

   ret = czUimSndErrInd (peerCb->cztSapCb, &czBmpErrInd, evnt, 0L);
   if(0 != ret)
   {
      do { cmFreeMem((evnt)); (evnt) = 0L; } while(0);
   }

   do { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",4730, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " Exiting\n"); SPrint(czCb.init.prntBuf); }; } return(0); }while(0);

}
static S16 czBmpSndErrIndToPeer
(
CzPeerCb *peerCb,
CztEvnt *evnt,
CztUeInfo *bmpUeInfo,
U8 hoMsgType,
U8 causeType,
U8 causeVal,
U8 lclCauseVal
)
{
   CztEvnt *rspErrEvnt = 0L;
   U16 oldUEX2APIdVal = 0xFFFF;
   U16 newUEX2APIdVal = 0xFFFF;
   S16 ret = 0;

   Txt __tapa_fun[255]; sprintf(__tapa_fun,"czBmpSndErrorIndToPeer"); { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",4795, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf," Entering\n"); SPrint(czCb.init.prntBuf); }; ;; } }





   if(0L != bmpUeInfo)
   {
      oldUEX2APIdVal = bmpUeInfo->oldUEX2APId;
      newUEX2APIdVal = bmpUeInfo->newUEX2APId;
   }

   rspErrEvnt = czUtlGenPeerErrInd(&(evnt->pdu), hoMsgType,
                                   ((CzMsgInfo *)bmpUeInfo),
                                   causeType, causeVal);

   if(0L != rspErrEvnt)
   {






      do { if (czCb.init.dbgMask & ((0x00000100 << 3))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",4822, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"INFO\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Generating Error Indication " "on %d to peer(%ld) with UE(%d:%d) on stream(%d)\n", hoMsgType, (peerCb->peerId), oldUEX2APIdVal, newUEX2APIdVal, (peerCb->peerCfg.globalStreamId)); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0)


                                                     ;



      czUtlUpdOutSts(peerCb, 7);




      ret = czTpmSndToLower(peerCb, &(rspErrEvnt->pdu),
                            (peerCb->peerCfg.globalStreamId));

      if(0 != ret)
      {






         do { if (czCb.init.dbgMask & ((0x00000100 << 7))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",4845, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"FATAL\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Sending Error Indication" "to peer(%ld) failed on UE(%d:%d)\n", (peerCb->peerId), oldUEX2APIdVal, newUEX2APIdVal); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0)


                                ;



         czUtlUpdOutErrSts(peerCb, 7);
      }
      do { cmFreeMem((rspErrEvnt)); (rspErrEvnt) = 0L; } while(0);
   }
   else
   {






      do { if (czCb.init.dbgMask & ((0x00000100 << 6))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",4864, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " [" "\"ERROR\"" "]" ); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, ":"); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "Building Error Indication" "to peer(%ld) failed on UE(%d:%d)\n", (peerCb->peerId), oldUEX2APIdVal, newUEX2APIdVal); SPrint(czCb.init.prntBuf); }; { sprintf (czCb.init.prntBuf, "\n"); SPrint(czCb.init.prntBuf); }; } }while(0)


                                ;


      czUtlUpdOutErrSts(peerCb, 7);
   }

   if((0x50 + 0x05) == lclCauseVal)
   {
      do { cmFreeMem((evnt)); (evnt) = 0L; } while(0);
      do { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",4873, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " Exiting\n"); SPrint(czCb.init.prntBuf); }; } return(0); }while(0);
   }



   { do { (Void)cmMemset((U8*)((&czBmpErrInd)), 0, (Size)sizeof(CztLclErrInd)); } while(0); czBmpErrInd.peerId = (peerCb->peerId); czBmpErrInd.causeType = 0x80; czBmpErrInd.causeValue = lclCauseVal; czBmpErrInd.msgType = hoMsgType; czBmpErrInd.u.ueInfo.oldUEX2APId = oldUEX2APIdVal; czBmpErrInd.u.ueInfo.newUEX2APId = newUEX2APIdVal; }

                                                           ;

   ret = czUimSndErrInd (peerCb->cztSapCb, &czBmpErrInd, evnt, 0L);
   if(0 != ret)
   {
      do { cmFreeMem((evnt)); (evnt) = 0L; } while(0);
   }

   do { if (czCb.init.dbgMask & ((0x00000100 << 4))) { { { sprintf (czCb.init.prntBuf, " [%s 0x%x:%x]", "LTE-X2AP", czCb.init.ent,czCb.init.inst); SPrint(czCb.init.prntBuf); }; } { { sprintf (czCb.init.prntBuf, " [%s:%d:%s]","/home/mrehwald/Desktop/Radisys/lte_enb/src/x2ap/cz_bmp.c",4888, __tapa_fun); SPrint(czCb.init.prntBuf); }; } { sprintf (czCb.init.prntBuf, " Exiting\n"); SPrint(czCb.init.prntBuf); }; } return(0); }while(0);

}