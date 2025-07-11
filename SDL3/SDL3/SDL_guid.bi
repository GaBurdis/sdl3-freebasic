#pragma once

extern "C"

type SDL_GUID
	data(0 to 15) as Uint8
end type

declare sub SDL_GUIDToString(byval guid as SDL_GUID, byval pszGUID as zstring ptr, byval cbGUID as long)
declare function SDL_StringToGUID(byval pchGUID as const zstring ptr) as SDL_GUID

end extern
