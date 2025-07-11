#pragma once

extern "C"

type SDL_MessageBoxFlags as Uint32

const SDL_MESSAGEBOX_ERROR                 = &h00000010u
const SDL_MESSAGEBOX_WARNING               = &h00000020u
const SDL_MESSAGEBOX_INFORMATION           = &h00000040u
const SDL_MESSAGEBOX_BUTTONS_LEFT_TO_RIGHT = &h00000080u
const SDL_MESSAGEBOX_BUTTONS_RIGHT_TO_LEFT = &h00000100u

type SDL_MessageBoxButtonFlags as Uint32

const SDL_MESSAGEBOX_BUTTON_RETURNKEY_DEFAULT = &h00000001u
const SDL_MESSAGEBOX_BUTTON_ESCAPEKEY_DEFAULT = &h00000002u

type SDL_MessageBoxButtonData
	flags as SDL_MessageBoxButtonFlags
	buttonID as long
	text as const zstring ptr
end type

type SDL_MessageBoxColor
	r as Uint8
	g as Uint8
	b as Uint8
end type

type SDL_MessageBoxColorType as long
enum
	SDL_MESSAGEBOX_COLOR_BACKGROUND
	SDL_MESSAGEBOX_COLOR_TEXT
	SDL_MESSAGEBOX_COLOR_BUTTON_BORDER
	SDL_MESSAGEBOX_COLOR_BUTTON_BACKGROUND
	SDL_MESSAGEBOX_COLOR_BUTTON_SELECTED
	SDL_MESSAGEBOX_COLOR_COUNT
end enum

type SDL_MessageBoxColorScheme
	colors(0 to SDL_MESSAGEBOX_COLOR_COUNT - 1) as SDL_MessageBoxColor
end type

type SDL_MessageBoxData
	flags as SDL_MessageBoxFlags
	window as SDL_Window ptr
	title as const zstring ptr
	message as const zstring ptr
	numbuttons as long
	buttons as const SDL_MessageBoxButtonData ptr
	colorScheme as const SDL_MessageBoxColorScheme ptr
end type

declare function SDL_ShowMessageBox(byval messageboxdata as const SDL_MessageBoxData ptr, byval buttonid as long ptr) as boolean
declare function SDL_ShowSimpleMessageBox(byval flags as SDL_MessageBoxFlags, byval title as const zstring ptr, byval message as const zstring ptr, byval window as SDL_Window ptr) as boolean

end extern
