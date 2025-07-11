#pragma once

extern "C"

declare function SDL_SetError(byval fmt as const zstring ptr, ...) as boolean
declare function SDL_SetErrorV(byval fmt as const zstring ptr, byval ap as va_list) as boolean
declare function SDL_OutOfMemory() as boolean
declare function SDL_GetError() as const zstring ptr
declare function SDL_ClearError() as boolean
#define SDL_Unsupported() SDL_SetError("That operation is not supported")
#define SDL_InvalidParamError(param) SDL_SetError("Parameter '%s' is invalid", (param))

end extern