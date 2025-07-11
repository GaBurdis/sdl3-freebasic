#pragma once

extern "C"

declare function SDL_SetClipboardText(byval text as const zstring ptr) as boolean
declare function SDL_GetClipboardText() as zstring ptr
declare function SDL_HasClipboardText() as boolean
declare function SDL_SetPrimarySelectionText(byval text as const zstring ptr) as boolean
declare function SDL_GetPrimarySelectionText() as zstring ptr
declare function SDL_HasPrimarySelectionText() as boolean

type SDL_ClipboardDataCallback as function(byval userdata as any ptr, byval mime_type as const zstring ptr, byval size as uinteger ptr) as const any ptr
type SDL_ClipboardCleanupCallback as sub(byval userdata as any ptr)

declare function SDL_SetClipboardData(byval callback as SDL_ClipboardDataCallback, byval cleanup as SDL_ClipboardCleanupCallback, byval userdata as any ptr, byval mime_types as const zstring ptr ptr, byval num_mime_types as uinteger) as boolean
declare function SDL_ClearClipboardData() as boolean
declare function SDL_GetClipboardData(byval mime_type as const zstring ptr, byval size as uinteger ptr) as any ptr
declare function SDL_HasClipboardData(byval mime_type as const zstring ptr) as boolean
declare function SDL_GetClipboardMimeTypes(byval num_mime_types as uinteger ptr) as zstring ptr ptr

end extern
