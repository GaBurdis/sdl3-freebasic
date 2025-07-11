#pragma once

#ifdef SDL_WIKI_DOCUMENTATION_SECTION
  #define SDL_THREAD_ANNOTATION_ATTRIBUTE__(x)
#elseif defined (SDL_THREAD_SAFETY_ANALYSIS) and defined(__clang__) and (not defined(SWIG))
  #define SDL_THREAD_ANNOTATION_ATTRIBUTE__(x)   __attribute__((x))
#else
  #define SDL_THREAD_ANNOTATION_ATTRIBUTE__(x)
#endif

#define SDL_CAPABILITY(x) SDL_THREAD_ANNOTATION_ATTRIBUTE__(capability(x))
#define SDL_SCOPED_CAPABILITY SDL_THREAD_ANNOTATION_ATTRIBUTE__(scoped_lockable)
#define SDL_GUARDED_BY(x) SDL_THREAD_ANNOTATION_ATTRIBUTE__(guarded_by(x))
#define SDL_PT_GUARDED_BY(x) SDL_THREAD_ANNOTATION_ATTRIBUTE__(pt_guarded_by(x))
#define SDL_ACQUIRED_BEFORE(x) SDL_THREAD_ANNOTATION_ATTRIBUTE__(acquired_before(x))
#define SDL_ACQUIRED_AFTER(x) SDL_THREAD_ANNOTATION_ATTRIBUTE__(acquired_after(x))
#define SDL_REQUIRES(x) SDL_THREAD_ANNOTATION_ATTRIBUTE__(requires_capability(x))
#define SDL_REQUIRES_SHARED(x) SDL_THREAD_ANNOTATION_ATTRIBUTE__(requires_shared_capability(x))
#define SDL_ACQUIRE(x) SDL_THREAD_ANNOTATION_ATTRIBUTE__(acquire_capability(x))
#define SDL_ACQUIRE_SHARED(x) SDL_THREAD_ANNOTATION_ATTRIBUTE__(acquire_shared_capability(x))
#define SDL_RELEASE(x) SDL_THREAD_ANNOTATION_ATTRIBUTE__(release_capability(x))
#define SDL_RELEASE_SHARED(x) SDL_THREAD_ANNOTATION_ATTRIBUTE__(release_shared_capability(x))
#define SDL_RELEASE_GENERIC(x) SDL_THREAD_ANNOTATION_ATTRIBUTE__(release_generic_capability(x))
#define SDL_TRY_ACQUIRE(x, y) SDL_THREAD_ANNOTATION_ATTRIBUTE__(try_acquire_capability(x, y))
#define SDL_TRY_ACQUIRE_SHARED(x, y) SDL_THREAD_ANNOTATION_ATTRIBUTE__(try_acquire_shared_capability(x, y))
#define SDL_EXCLUDES(x) SDL_THREAD_ANNOTATION_ATTRIBUTE__(locks_excluded(x))
#define SDL_ASSERT_CAPABILITY(x) SDL_THREAD_ANNOTATION_ATTRIBUTE__(assert_capability(x))
#define SDL_ASSERT_SHARED_CAPABILITY(x) SDL_THREAD_ANNOTATION_ATTRIBUTE__(assert_shared_capability(x))
#define SDL_RETURN_CAPABILITY(x) SDL_THREAD_ANNOTATION_ATTRIBUTE__(lock_returned(x))
#define SDL_NO_THREAD_SAFETY_ANALYSIS SDL_THREAD_ANNOTATION_ATTRIBUTE__(no_thread_safety_analysis)

extern "C"

type SDL_Mutex as _SDL_Mutex

declare function SDL_CreateMutex() as SDL_Mutex ptr
declare sub SDL_LockMutex(byval mutex as SDL_Mutex ptr)
declare function SDL_TryLockMutex(byval mutex as SDL_Mutex ptr) as boolean
declare sub SDL_UnlockMutex(byval mutex as SDL_Mutex ptr)
declare sub SDL_DestroyMutex(byval mutex as SDL_Mutex ptr)

type SDL_RWLock as _SDL_RWLock

declare function SDL_CreateRWLock() as SDL_RWLock ptr
declare sub SDL_LockRWLockForReading(byval rwlock as SDL_RWLock ptr)
declare sub SDL_LockRWLockForWriting(byval rwlock as SDL_RWLock ptr)
declare function SDL_TryLockRWLockForReading(byval rwlock as SDL_RWLock ptr) as boolean
declare function SDL_TryLockRWLockForWriting(byval rwlock as SDL_RWLock ptr) as boolean
declare sub SDL_UnlockRWLock(byval rwlock as SDL_RWLock ptr)
declare sub SDL_DestroyRWLock(byval rwlock as SDL_RWLock ptr)

type SDL_Semaphore as _SDL_Semaphore

declare function SDL_CreateSemaphore(byval initial_value as Uint32) as SDL_Semaphore ptr
declare sub SDL_DestroySemaphore(byval sem as SDL_Semaphore ptr)
declare sub SDL_WaitSemaphore(byval sem as SDL_Semaphore ptr)
declare function SDL_TryWaitSemaphore(byval sem as SDL_Semaphore ptr) as boolean
declare function SDL_WaitSemaphoreTimeout(byval sem as SDL_Semaphore ptr, byval timeoutMS as Sint32) as boolean
declare sub SDL_SignalSemaphore(byval sem as SDL_Semaphore ptr)
declare function SDL_GetSemaphoreValue(byval sem as SDL_Semaphore ptr) as Uint32

type SDL_Condition as _SDL_Condition

declare function SDL_CreateCondition() as SDL_Condition ptr
declare sub SDL_DestroyCondition(byval cond as SDL_Condition ptr)
declare sub SDL_SignalCondition(byval cond as SDL_Condition ptr)
declare sub SDL_BroadcastCondition(byval cond as SDL_Condition ptr)
declare sub SDL_WaitCondition(byval cond as SDL_Condition ptr, byval mutex as SDL_Mutex ptr)
declare function SDL_WaitConditionTimeout(byval cond as SDL_Condition ptr, byval mutex as SDL_Mutex ptr, byval timeoutMS as Sint32) as boolean

type SDL_InitStatus as long
enum
	SDL_INIT_STATUS_UNINITIALIZED
	SDL_INIT_STATUS_INITIALIZING
	SDL_INIT_STATUS_INITIALIZED
	SDL_INIT_STATUS_UNINITIALIZING
end enum

type SDL_InitState
	status as SDL_AtomicInt
	thread as SDL_ThreadID
	reserved as any ptr
end type

declare function SDL_ShouldInit(byval state as SDL_InitState ptr) as boolean
declare function SDL_ShouldQuit(byval state as SDL_InitState ptr) as boolean
declare sub SDL_SetInitialized(byval state as SDL_InitState ptr, byval initialized as boolean)

end extern
