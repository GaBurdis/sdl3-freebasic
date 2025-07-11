#pragma once

extern "C"

type SDL_Locale
	language as const zstring ptr
	country as const zstring ptr
end type

declare function SDL_GetPreferredLocales(byval count as long ptr) as SDL_Locale ptr ptr

end extern
