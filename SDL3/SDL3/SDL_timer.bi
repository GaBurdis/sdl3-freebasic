#pragma once

extern "C"

const SDL_MS_PER_SECOND = 1000
const SDL_US_PER_SECOND = 1000000
const SDL_NS_PER_SECOND = 1000000000ll
const SDL_NS_PER_MS     = 1000000
const SDL_NS_PER_US     = 1000

#define SDL_SECONDS_TO_NS(S) (cast(Uint64, (S)) * SDL_NS_PER_SECOND)
#define SDL_NS_TO_SECONDS(NS) ((NS) / SDL_NS_PER_SECOND)
#define SDL_MS_TO_NS(MS) (cast(Uint64, (MS)) * SDL_NS_PER_MS)
#define SDL_NS_TO_MS(NS) ((NS) / SDL_NS_PER_MS)
#define SDL_US_TO_NS(US) (cast(Uint64, (US)) * SDL_NS_PER_US)
#define SDL_NS_TO_US(NS) ((NS) / SDL_NS_PER_US)

declare function SDL_GetTicks() as Uint64
declare function SDL_GetTicksNS() as Uint64
declare function SDL_GetPerformanceCounter() as Uint64
declare function SDL_GetPerformanceFrequency() as Uint64
declare sub SDL_Delay(byval ms as Uint32)
declare sub SDL_DelayNS(byval ns as Uint64)
declare sub SDL_DelayPrecise(byval ns as Uint64)

type SDL_TimerID as Uint32

type SDL_TimerCallback as function(byval userdata as any ptr, byval timerID as SDL_TimerID, byval interval as Uint32) as Uint32

declare function SDL_AddTimer(byval interval as Uint32, byval callback as SDL_TimerCallback, byval userdata as any ptr) as SDL_TimerID

type SDL_NSTimerCallback as function(byval userdata as any ptr, byval timerID as SDL_TimerID, byval interval as Uint64) as Uint64

declare function SDL_AddTimerNS(byval interval as Uint64, byval callback as SDL_NSTimerCallback, byval userdata as any ptr) as SDL_TimerID
declare function SDL_RemoveTimer(byval id as SDL_TimerID) as boolean

end extern
