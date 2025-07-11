#pragma once

extern "C"

type SDL_PowerState as long
enum
	SDL_POWERSTATE_ERROR = -1
	SDL_POWERSTATE_UNKNOWN
	SDL_POWERSTATE_ON_BATTERY
	SDL_POWERSTATE_NO_BATTERY
	SDL_POWERSTATE_CHARGING
	SDL_POWERSTATE_CHARGED
end enum

declare function SDL_GetPowerInfo(byval seconds as long ptr, byval percent as long ptr) as SDL_PowerState

end extern
