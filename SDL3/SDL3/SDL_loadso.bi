#pragma once

extern "C"

type SDL_SharedObject as SDL_SharedObject_

declare function SDL_LoadObject(byval sofile as const zstring ptr) as SDL_SharedObject ptr
declare function SDL_LoadFunction(byval handle as SDL_SharedObject ptr, byval name as const zstring ptr) as SDL_FunctionPointer
declare sub SDL_UnloadObject(byval handle as SDL_SharedObject ptr)

end extern
