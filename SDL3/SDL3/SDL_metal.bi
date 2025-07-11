#pragma once

extern "C"

type SDL_MetalView as any ptr

declare function SDL_Metal_CreateView(byval window as SDL_Window ptr) as SDL_MetalView
declare sub SDL_Metal_DestroyView(byval view as SDL_MetalView)
declare function SDL_Metal_GetLayer(byval view as SDL_MetalView) as any ptr

end extern
