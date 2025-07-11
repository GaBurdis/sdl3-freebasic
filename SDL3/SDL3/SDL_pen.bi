#pragma once

extern "C"

type SDL_PenID as Uint32

#define SDL_PEN_MOUSEID ((SDL_MouseID)-2)
#define SDL_PEN_TOUCHID ((SDL_TouchID)-2)

type SDL_PenInputFlags as Uint32

const SDL_PEN_INPUT_DOWN = culng(1u shl 0)
const SDL_PEN_INPUT_BUTTON_1 = culng(1u shl 1)
const SDL_PEN_INPUT_BUTTON_2 = culng(1u shl 2)
const SDL_PEN_INPUT_BUTTON_3 = culng(1u shl 3)
const SDL_PEN_INPUT_BUTTON_4 = culng(1u shl 4)
const SDL_PEN_INPUT_BUTTON_5 = culng(1u shl 5)
const SDL_PEN_INPUT_ERASER_TIP = culng(1u shl 30)

type SDL_PenAxis as long
enum
	SDL_PEN_AXIS_PRESSURE
	SDL_PEN_AXIS_XTILT
	SDL_PEN_AXIS_YTILT
	SDL_PEN_AXIS_DISTANCE
	SDL_PEN_AXIS_ROTATION
	SDL_PEN_AXIS_SLIDER
	SDL_PEN_AXIS_TANGENTIAL_PRESSURE
	SDL_PEN_AXIS_COUNT
end enum

end extern
