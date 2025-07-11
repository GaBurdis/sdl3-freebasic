#pragma once

#if defined(SDL_PLATFORM_WINDOWS)
 #include once "crt/win32/process.bi"
#endif

extern "C"

type SDL_Thread as _SDL_Thread

type SDL_ThreadID as Uint64
type SDL_TLSID as SDL_AtomicInt

type SDL_ThreadPriority as long
enum
	SDL_THREAD_PRIORITY_LOW
	SDL_THREAD_PRIORITY_NORMAL
	SDL_THREAD_PRIORITY_HIGH
	SDL_THREAD_PRIORITY_TIME_CRITICAL
end enum

type SDL_ThreadState as long
enum
    SDL_THREAD_UNKNOWN
    SDL_THREAD_ALIVE
    SDL_THREAD_DETACHED
    SDL_THREAD_COMPLETE
end enum

type SDL_ThreadFunction as function(byval data as any ptr) as long

#ifdef SDL_WIKI_DOCUMENTATION_SECTION
  declare function SDL_CreateThread(byval fn as SDL_ThreadFunction, byval name as const zstring ptr, byval data as any ptr) as SDL_Thread ptr
  declare function SDL_CreateThreadWithProperties(byval props as SDL_PropertiesID) as SDL_Thread ptr

 #define SDL_PROP_THREAD_CREATE_ENTRY_FUNCTION_POINTER "SDL.thread.create.entry_function"
 #define SDL_PROP_THREAD_CREATE_NAME_STRING            "SDL.thread.create.name"
 #define SDL_PROP_THREAD_CREATE_USERDATA_POINTER       "SDL.thread.create.userdata"
 #define SDL_PROP_THREAD_CREATE_STACKSIZE_NUMBER       "SDL.thread.create.stacksize"
#endif

#ifndef SDL_WIKI_DOCUMENTATION_SECTION
 #if defined(SDL_PLATFORM_WINDOWS)
  #ifndef SDL_BeginThreadFunction
   #define SDL_BeginThreadFunction _beginthreadex
  #endif
  #ifndef SDL_EndThreadFunction
   #define SDL_EndThreadFunction _endthreadex
  #endif
 #endif
#endif

#ifndef SDL_WIKI_DOCUMENTATION_SECTION
 #ifndef SDL_BeginThreadFunction
  #define SDL_BeginThreadFunction NULL
 #endif
#endif

#ifndef SDL_WIKI_DOCUMENTATION_SECTION
 #ifndef SDL_EndThreadFunction
  #define SDL_EndThreadFunction NULL
 #endif
#endif

#ifndef SDL_WIKI_DOCUMENTATION_SECTION
 declare function SDL_CreateThreadRuntime(byval fn as SDL_ThreadFunction, byval name as const zstring ptr, byval data as any ptr, byval pfnBeginThread as SDL_FunctionPointer, byval pfnEndThread as SDL_FunctionPointer) as SDL_Thread ptr
 declare function SDL_CreateThreadWithPropertiesRuntime(byval props as SDL_PropertiesID, byval pfnBeginThread as SDL_FunctionPointer, byval pfnEndThread as SDL_FunctionPointer) as SDL_Thread ptr
 #define SDL_CreateThread(fn, name, data) SDL_CreateThreadRuntime((fn), (name), (data), cast(SDL_FunctionPointer, SDL_BeginThreadFunction), cast(SDL_FunctionPointer, SDL_EndThreadFunction))
 #define SDL_CreateThreadWithProperties(props) SDL_CreateThreadWithPropertiesRuntime((props), cast(SDL_FunctionPointer, SDL_BeginThreadFunction), cast(SDL_FunctionPointer, SDL_EndThreadFunction))
 #define SDL_PROP_THREAD_CREATE_ENTRY_FUNCTION_POINTER "SDL.thread.create.entry_function"
 #define SDL_PROP_THREAD_CREATE_NAME_STRING "SDL.thread.create.name"
 #define SDL_PROP_THREAD_CREATE_USERDATA_POINTER "SDL.thread.create.userdata"
 #define SDL_PROP_THREAD_CREATE_STACKSIZE_NUMBER "SDL.thread.create.stacksize"
#endif

declare function SDL_GetThreadName(byval thread as SDL_Thread ptr) as const zstring ptr
declare function SDL_GetCurrentThreadID() as SDL_ThreadID
declare function SDL_GetThreadID(byval thread as SDL_Thread ptr) as SDL_ThreadID
declare function SDL_SetCurrentThreadPriority(byval priority as SDL_ThreadPriority) as boolean
declare sub SDL_WaitThread(byval thread as SDL_Thread ptr, byval status as long ptr)
declare function SDL_GetThreadState(byval thread as SDL_Thread ptr) as SDL_ThreadState
declare sub SDL_DetachThread(byval thread as SDL_Thread ptr)
declare function SDL_GetTLS(byval id as SDL_TLSID ptr) as any ptr
type SDL_TLSDestructorCallback as sub(byval value as any ptr)
declare function SDL_SetTLS(byval id as SDL_TLSID ptr, byval value as const any ptr, byval destructor as SDL_TLSDestructorCallback) as boolean
declare sub SDL_CleanupTLS()

end extern
