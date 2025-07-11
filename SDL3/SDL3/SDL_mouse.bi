#pragma once

extern "C"

type SDL_MouseID as Uint32

type SDL_Cursor as _SDL_Cursor

type SDL_SystemCursor as long
enum
	SDL_SYSTEM_CURSOR_DEFAULT
	SDL_SYSTEM_CURSOR_TEXT
	SDL_SYSTEM_CURSOR_WAIT
	SDL_SYSTEM_CURSOR_CROSSHAIR
	SDL_SYSTEM_CURSOR_PROGRESS
	SDL_SYSTEM_CURSOR_NWSE_RESIZE
	SDL_SYSTEM_CURSOR_NESW_RESIZE
	SDL_SYSTEM_CURSOR_EW_RESIZE
	SDL_SYSTEM_CURSOR_NS_RESIZE
	SDL_SYSTEM_CURSOR_MOVE
	SDL_SYSTEM_CURSOR_NOT_ALLOWED
	SDL_SYSTEM_CURSOR_POINTER
	SDL_SYSTEM_CURSOR_NW_RESIZE
	SDL_SYSTEM_CURSOR_N_RESIZE
	SDL_SYSTEM_CURSOR_NE_RESIZE
	SDL_SYSTEM_CURSOR_E_RESIZE
	SDL_SYSTEM_CURSOR_SE_RESIZE
	SDL_SYSTEM_CURSOR_S_RESIZE
	SDL_SYSTEM_CURSOR_SW_RESIZE
	SDL_SYSTEM_CURSOR_W_RESIZE
	SDL_SYSTEM_CURSOR_COUNT
end enum

type SDL_MouseWheelDirection as long
enum
	SDL_MOUSEWHEEL_NORMAL
	SDL_MOUSEWHEEL_FLIPPED
end enum

type SDL_MouseButtonFlags as Uint32

const SDL_BUTTON_LEFT   = 1
const SDL_BUTTON_MIDDLE = 2
const SDL_BUTTON_RIGHT  = 3
const SDL_BUTTON_X1     = 4
const SDL_BUTTON_X2     = 5

#define SDL_BUTTON_MASK(X) culng(1u shl ((X) - 1))
#define SDL_BUTTON_LMASK SDL_BUTTON_MASK(SDL_BUTTON_LEFT)
#define SDL_BUTTON_MMASK SDL_BUTTON_MASK(SDL_BUTTON_MIDDLE)
#define SDL_BUTTON_RMASK SDL_BUTTON_MASK(SDL_BUTTON_RIGHT)
#define SDL_BUTTON_X1MASK SDL_BUTTON_MASK(SDL_BUTTON_X1)
#define SDL_BUTTON_X2MASK SDL_BUTTON_MASK(SDL_BUTTON_X2)

declare function SDL_HasMouse() as boolean
declare function SDL_GetMice(byval count as long ptr) as SDL_MouseID ptr
declare function SDL_GetMouseNameForID(byval instance_id as SDL_MouseID) as const zstring ptr
declare function SDL_GetMouseFocus() as SDL_Window ptr
declare function SDL_GetMouseState(byval x as single ptr, byval y as single ptr) as SDL_MouseButtonFlags
declare function SDL_GetGlobalMouseState(byval x as single ptr, byval y as single ptr) as SDL_MouseButtonFlags
declare function SDL_GetRelativeMouseState(byval x as single ptr, byval y as single ptr) as SDL_MouseButtonFlags
declare sub SDL_WarpMouseInWindow(byval window as SDL_Window ptr, byval x as single, byval y as single)
declare function SDL_WarpMouseGlobal(byval x as single, byval y as single) as boolean
declare function SDL_SetWindowRelativeMouseMode(byval window as SDL_Window ptr, byval enabled as boolean) as boolean
declare function SDL_GetWindowRelativeMouseMode(byval window as SDL_Window ptr) as boolean
declare function SDL_CaptureMouse(byval enabled as boolean) as boolean
declare function SDL_CreateCursor(byval data as const Uint8 ptr, byval mask as const Uint8 ptr, byval w as long, byval h as long, byval hot_x as long, byval hot_y as long) as SDL_Cursor ptr
declare function SDL_CreateColorCursor(byval surface as SDL_Surface ptr, byval hot_x as long, byval hot_y as long) as SDL_Cursor ptr
declare function SDL_CreateSystemCursor(byval id as SDL_SystemCursor) as SDL_Cursor ptr
declare function SDL_SetCursor(byval cursor as SDL_Cursor ptr) as boolean
declare function SDL_GetCursor() as SDL_Cursor ptr
declare function SDL_GetDefaultCursor() as SDL_Cursor ptr
declare sub SDL_DestroyCursor(byval cursor as SDL_Cursor ptr)
declare function SDL_ShowCursor() as boolean
declare function SDL_HideCursor() as boolean
declare function SDL_CursorVisible() as boolean

end extern
