#pragma once

extern "C"

type SDL_TouchID as Uint64
type SDL_FingerID as Uint64

type SDL_TouchDeviceType as long
enum
	SDL_TOUCH_DEVICE_INVALID = -1
	SDL_TOUCH_DEVICE_DIRECT
	SDL_TOUCH_DEVICE_INDIRECT_ABSOLUTE
	SDL_TOUCH_DEVICE_INDIRECT_RELATIVE
end enum

type SDL_Finger
	id as SDL_FingerID
	x as single
	y as single
	pressure as single
end type

const SDL_TOUCH_MOUSEID = cast(SDL_MouseID, -1)
const SDL_MOUSE_TOUCHID = cast(SDL_TouchID, -1)

declare function SDL_GetTouchDevices(byval count as long ptr) as SDL_TouchID ptr
declare function SDL_GetTouchDeviceName(byval touchID as SDL_TouchID) as const zstring ptr
declare function SDL_GetTouchDeviceType(byval touchID as SDL_TouchID) as SDL_TouchDeviceType
declare function SDL_GetTouchFingers(byval touchID as SDL_TouchID, byval count as long ptr) as SDL_Finger ptr ptr

end extern