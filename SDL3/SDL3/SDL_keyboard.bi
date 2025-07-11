#pragma once

extern "C"

type SDL_KeyboardID as Uint32

declare function SDL_HasKeyboard() as boolean
declare function SDL_GetKeyboards(byval count as long ptr) as SDL_KeyboardID ptr
declare function SDL_GetKeyboardNameForID(byval instance_id as SDL_KeyboardID) as const zstring ptr
declare function SDL_GetKeyboardFocus() as SDL_Window ptr
declare function SDL_GetKeyboardState(byval numkeys as long ptr) as const boolean ptr
declare sub SDL_ResetKeyboard()
declare function SDL_GetModState() as SDL_Keymod
declare sub SDL_SetModState(byval modstate as SDL_Keymod)
declare function SDL_GetKeyFromScancode(byval scancode as SDL_Scancode, byval modstate as SDL_Keymod, byval key_event as boolean) as SDL_Keycode
declare function SDL_GetScancodeFromKey(byval key as SDL_Keycode, byval modstate as SDL_Keymod ptr) as SDL_Scancode
declare function SDL_SetScancodeName(byval scancode as SDL_Scancode, byval name as const zstring ptr) as boolean
declare function SDL_GetScancodeName(byval scancode as SDL_Scancode) as const zstring ptr
declare function SDL_GetScancodeFromName(byval name as const zstring ptr) as SDL_Scancode
declare function SDL_GetKeyName(byval key as SDL_Keycode) as const zstring ptr
declare function SDL_GetKeyFromName(byval name as const zstring ptr) as SDL_Keycode
declare function SDL_StartTextInput(byval window as SDL_Window ptr) as boolean

type SDL_TextInputType as long
enum
	SDL_TEXTINPUT_TYPE_TEXT
	SDL_TEXTINPUT_TYPE_TEXT_NAME
	SDL_TEXTINPUT_TYPE_TEXT_EMAIL
	SDL_TEXTINPUT_TYPE_TEXT_USERNAME
	SDL_TEXTINPUT_TYPE_TEXT_PASSWORD_HIDDEN
	SDL_TEXTINPUT_TYPE_TEXT_PASSWORD_VISIBLE
	SDL_TEXTINPUT_TYPE_NUMBER
	SDL_TEXTINPUT_TYPE_NUMBER_PASSWORD_HIDDEN
	SDL_TEXTINPUT_TYPE_NUMBER_PASSWORD_VISIBLE
end enum

type SDL_Capitalization as long
enum
	SDL_CAPITALIZE_NONE
	SDL_CAPITALIZE_SENTENCES
	SDL_CAPITALIZE_WORDS
	SDL_CAPITALIZE_LETTERS
end enum

declare function SDL_StartTextInputWithProperties(byval window as SDL_Window ptr, byval props as SDL_PropertiesID) as boolean

#define SDL_PROP_TEXTINPUT_TYPE_NUMBER              "SDL.textinput.type"
#define SDL_PROP_TEXTINPUT_CAPITALIZATION_NUMBER    "SDL.textinput.capitalization"
#define SDL_PROP_TEXTINPUT_AUTOCORRECT_BOOLEAN      "SDL.textinput.autocorrect"
#define SDL_PROP_TEXTINPUT_MULTILINE_BOOLEAN        "SDL.textinput.multiline"
#define SDL_PROP_TEXTINPUT_ANDROID_INPUTTYPE_NUMBER "SDL.textinput.android.inputtype"

declare function SDL_TextInputActive(byval window as SDL_Window ptr) as boolean
declare function SDL_StopTextInput(byval window as SDL_Window ptr) as boolean
declare function SDL_ClearComposition(byval window as SDL_Window ptr) as boolean
declare function SDL_SetTextInputArea(byval window as SDL_Window ptr, byval rect as const SDL_Rect ptr, byval cursor as long) as boolean
declare function SDL_GetTextInputArea(byval window as SDL_Window ptr, byval rect as SDL_Rect ptr, byval cursor as long ptr) as boolean
declare function SDL_HasScreenKeyboardSupport() as boolean
declare function SDL_ScreenKeyboardShown(byval window as SDL_Window ptr) as boolean

end extern
