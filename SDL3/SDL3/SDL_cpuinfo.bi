#pragma once

extern "C"

const SDL_CACHELINE_SIZE = 128

declare function SDL_GetNumLogicalCPUCores() as long
declare function SDL_GetCPUCacheLineSize() as long
declare function SDL_HasAltiVec() as boolean
declare function SDL_HasMMX() as boolean
declare function SDL_HasSSE() as boolean
declare function SDL_HasSSE2() as boolean
declare function SDL_HasSSE3() as boolean
declare function SDL_HasSSE41() as boolean
declare function SDL_HasSSE42() as boolean
declare function SDL_HasAVX() as boolean
declare function SDL_HasAVX2() as boolean
declare function SDL_HasAVX512F() as boolean
declare function SDL_HasARMSIMD() as boolean
declare function SDL_HasNEON() as boolean
declare function SDL_HasLSX() as boolean
declare function SDL_HasLASX() as boolean
declare function SDL_GetSystemRAM() as long
declare function SDL_GetSIMDAlignment() as uinteger
declare function SDL_GetSystemPageSize() as long

end extern
