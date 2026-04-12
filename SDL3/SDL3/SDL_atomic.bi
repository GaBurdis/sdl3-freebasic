#pragma once

extern "C"

type SDL_SpinLock as long

declare function SDL_TryLockSpinlock(byval lock as SDL_SpinLock ptr) as boolean
declare sub SDL_LockSpinlock(byval lock as SDL_SpinLock ptr)
declare sub SDL_UnlockSpinlock(byval lock as SDL_SpinLock ptr)

'#ifdef SDL_WIKI_DOCUMENTATION_SECTION
'  #define SDL_CompilerBarrier() DoCompilerSpecificReadWriteBarrier()
'#elseif (defined(__GNUC__) and (not defined(SDL_PLATFORM_EMSCRIPTEN))) or (defined(__SUNPRO_C) and (__SUNPRO_C >= 0x5120))
  '' TODO: #define SDL_CompilerBarrier()   __asm__ __volatile__ ("" : : : "memory")
'#else
  '' TODO: #define SDL_CompilerBarrier() { SDL_SpinLock _tmp = 0; SDL_LockSpinlock(&_tmp); SDL_UnlockSpinlock(&_tmp); }
'#endif

declare sub SDL_MemoryBarrierReleaseFunction()
declare sub SDL_MemoryBarrierAcquireFunction()

'#ifdef SDL_WIKI_DOCUMENTATION_SECTION
'  #define SDL_MemoryBarrierRelease() SDL_MemoryBarrierReleaseFunction()
'  #define SDL_MemoryBarrierAcquire() SDL_MemoryBarrierAcquireFunction()
'#elseif defined(__FB_ARM__) and (defined(__FB_LINUX__) or defined(__FB_FREEBSD__) or defined(__FB_OPENBSD__) or defined(__FB_NETBSD__))
  '' TODO: #define SDL_MemoryBarrierRelease() __asm__ __volatile__ ("dmb ish" : : : "memory")
  '' TODO: #define SDL_MemoryBarrierAcquire() __asm__ __volatile__ ("dmb ish" : : : "memory")
  '' TODO: #define SDL_CPUPauseInstruction() __asm__ __volatile__("yield" ::: "memory")
'#else
'  #define SDL_MemoryBarrierRelease() SDL_CompilerBarrier()
'  #define SDL_MemoryBarrierAcquire() SDL_CompilerBarrier()
'#endif

type SDL_AtomicInt
	value as long
end type

declare function SDL_CompareAndSwapAtomicInt(byval a as SDL_AtomicInt ptr, byval oldval as long, byval newval as long) as boolean
declare function SDL_SetAtomicInt(byval a as SDL_AtomicInt ptr, byval v as long) as long
declare function SDL_GetAtomicInt(byval a as SDL_AtomicInt ptr) as long
declare function SDL_AddAtomicInt(byval a as SDL_AtomicInt ptr, byval v as long) as long

#ifndef SDL_AtomicIncRef
  #define SDL_AtomicIncRef(a)    SDL_AddAtomicInt(a, 1)
#endif

#ifndef SDL_AtomicDecRef
  #define SDL_AtomicDecRef(a)    (SDL_AddAtomicInt(a, -1) = 1)
#endif

type SDL_AtomicU32
	value as Uint32
end type

declare function SDL_CompareAndSwapAtomicU32(byval a as SDL_AtomicU32 ptr, byval oldval as Uint32, byval newval as Uint32) as boolean
declare function SDL_SetAtomicU32(byval a as SDL_AtomicU32 ptr, byval v as Uint32) as Uint32
declare function SDL_GetAtomicU32(byval a as SDL_AtomicU32 ptr) as Uint32
declare function SDL_AddAtomicU32(byval a as SDL_AtomicU32 ptr, byval v as long) as Uint32
declare function SDL_CompareAndSwapAtomicPointer(byval a as any ptr ptr, byval oldval as any ptr, byval newval as any ptr) as boolean
declare function SDL_SetAtomicPointer(byval a as any ptr ptr, byval v as any ptr) as any ptr
declare function SDL_GetAtomicPointer(byval a as any ptr ptr) as any ptr

end extern
