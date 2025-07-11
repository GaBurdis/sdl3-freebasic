#pragma once

extern "C"

#ifdef SDL_THREAD_SAFETY_ANALYSIS
 extern SDL_joystick_lock as SDL_Mutex ptr
#endif

type SDL_Joystick as _SDL_Joystick

type SDL_JoystickID as Uint32

type SDL_JoystickType as long
enum
	SDL_JOYSTICK_TYPE_UNKNOWN
	SDL_JOYSTICK_TYPE_GAMEPAD
	SDL_JOYSTICK_TYPE_WHEEL
	SDL_JOYSTICK_TYPE_ARCADE_STICK
	SDL_JOYSTICK_TYPE_FLIGHT_STICK
	SDL_JOYSTICK_TYPE_DANCE_PAD
	SDL_JOYSTICK_TYPE_GUITAR
	SDL_JOYSTICK_TYPE_DRUM_KIT
	SDL_JOYSTICK_TYPE_ARCADE_PAD
	SDL_JOYSTICK_TYPE_THROTTLE
	SDL_JOYSTICK_TYPE_COUNT
end enum

type SDL_JoystickConnectionState as long
enum
	SDL_JOYSTICK_CONNECTION_INVALID = -1
	SDL_JOYSTICK_CONNECTION_UNKNOWN
	SDL_JOYSTICK_CONNECTION_WIRED
	SDL_JOYSTICK_CONNECTION_WIRELESS
end enum

const SDL_JOYSTICK_AXIS_MAX = 32767
const SDL_JOYSTICK_AXIS_MIN = -32768

declare sub SDL_LockJoysticks()
declare sub SDL_UnlockJoysticks()

declare function SDL_HasJoystick() as boolean
declare function SDL_GetJoysticks(byval count as long ptr) as SDL_JoystickID ptr
declare function SDL_GetJoystickNameForID(byval instance_id as SDL_JoystickID) as const zstring ptr
declare function SDL_GetJoystickPathForID(byval instance_id as SDL_JoystickID) as const zstring ptr
declare function SDL_GetJoystickPlayerIndexForID(byval instance_id as SDL_JoystickID) as long
declare function SDL_GetJoystickGUIDForID(byval instance_id as SDL_JoystickID) as SDL_GUID
declare function SDL_GetJoystickVendorForID(byval instance_id as SDL_JoystickID) as Uint16
declare function SDL_GetJoystickProductForID(byval instance_id as SDL_JoystickID) as Uint16
declare function SDL_GetJoystickProductVersionForID(byval instance_id as SDL_JoystickID) as Uint16
declare function SDL_GetJoystickTypeForID(byval instance_id as SDL_JoystickID) as SDL_JoystickType
declare function SDL_OpenJoystick(byval instance_id as SDL_JoystickID) as SDL_Joystick ptr
declare function SDL_GetJoystickFromID(byval instance_id as SDL_JoystickID) as SDL_Joystick ptr
declare function SDL_GetJoystickFromPlayerIndex(byval player_index as long) as SDL_Joystick ptr

type SDL_VirtualJoystickTouchpadDesc
	nfingers as Uint16
	padding(0 to 2) as Uint16
end type

type SDL_VirtualJoystickSensorDesc
	as SDL_SensorType type
	rate as single
end type

type SDL_VirtualJoystickDesc
	version as Uint32
	as Uint16 type
	padding as Uint16
	vendor_id as Uint16
	product_id as Uint16
	naxes as Uint16
	nbuttons as Uint16
	nballs as Uint16
	nhats as Uint16
	ntouchpads as Uint16
	nsensors as Uint16
	padding2(0 to 1) as Uint16
	button_mask as Uint32
	axis_mask as Uint32
  
	name as const zstring ptr
	touchpads as const SDL_VirtualJoystickTouchpadDesc ptr
	sensors as const SDL_VirtualJoystickSensorDesc ptr
  
	userdata as any ptr
	Update as sub(byval userdata as any ptr)
	SetPlayerIndex as sub(byval userdata as any ptr, byval player_index as long)
	Rumble as function(byval userdata as any ptr, byval low_frequency_rumble as Uint16, byval high_frequency_rumble as Uint16) as boolean
	RumbleTriggers as function(byval userdata as any ptr, byval left_rumble as Uint16, byval right_rumble as Uint16) as boolean
	SetLED as function(byval userdata as any ptr, byval red as Uint8, byval green as Uint8, byval blue as Uint8) as boolean
	SendEffect as function(byval userdata as any ptr, byval data as const any ptr, byval size as long) as boolean
	SetSensorsEnabled as function(byval userdata as any ptr, byval enabled as boolean) as boolean
	Cleanup as sub(byval userdata as any ptr)
end type

'SDL_COMPILE_TIME_ASSERT(SDL_VirtualJoystickDesc_SIZE, _
'    (sizeof(any ptr) = 4 and sizeof(SDL_VirtualJoystickDesc) = 84) or _
'    (sizeof(any ptr) = 8 and sizeof(SDL_VirtualJoystickDesc) = 136))

declare function SDL_AttachVirtualJoystick(byval desc as const SDL_VirtualJoystickDesc ptr) as SDL_JoystickID
declare function SDL_DetachVirtualJoystick(byval instance_id as SDL_JoystickID) as boolean
declare function SDL_IsJoystickVirtual(byval instance_id as SDL_JoystickID) as boolean
declare function SDL_SetJoystickVirtualAxis(byval joystick as SDL_Joystick ptr, byval axis as long, byval value as Sint16) as boolean
declare function SDL_SetJoystickVirtualBall(byval joystick as SDL_Joystick ptr, byval ball as long, byval xrel as Sint16, byval yrel as Sint16) as boolean
declare function SDL_SetJoystickVirtualButton(byval joystick as SDL_Joystick ptr, byval button as long, byval down as boolean) as boolean
declare function SDL_SetJoystickVirtualHat(byval joystick as SDL_Joystick ptr, byval hat as long, byval value as Uint8) as boolean
declare function SDL_SetJoystickVirtualTouchpad(byval joystick as SDL_Joystick ptr, byval touchpad as long, byval finger as long, byval down as boolean, byval x as single, byval y as single, byval pressure as single) as boolean
declare function SDL_SendJoystickVirtualSensorData(byval joystick as SDL_Joystick ptr, byval type as SDL_SensorType, byval sensor_timestamp as Uint64, byval data as const single ptr, byval num_values as long) as boolean
declare function SDL_GetJoystickProperties(byval joystick as SDL_Joystick ptr) as SDL_PropertiesID

#define SDL_PROP_JOYSTICK_CAP_MONO_LED_BOOLEAN       "SDL.joystick.cap.mono_led"
#define SDL_PROP_JOYSTICK_CAP_RGB_LED_BOOLEAN        "SDL.joystick.cap.rgb_led"
#define SDL_PROP_JOYSTICK_CAP_PLAYER_LED_BOOLEAN     "SDL.joystick.cap.player_led"
#define SDL_PROP_JOYSTICK_CAP_RUMBLE_BOOLEAN         "SDL.joystick.cap.rumble"
#define SDL_PROP_JOYSTICK_CAP_TRIGGER_RUMBLE_BOOLEAN "SDL.joystick.cap.trigger_rumble"

declare function SDL_GetJoystickName(byval joystick as SDL_Joystick ptr) as const zstring ptr
declare function SDL_GetJoystickPath(byval joystick as SDL_Joystick ptr) as const zstring ptr
declare function SDL_GetJoystickPlayerIndex(byval joystick as SDL_Joystick ptr) as long
declare function SDL_SetJoystickPlayerIndex(byval joystick as SDL_Joystick ptr, byval player_index as long) as boolean
declare function SDL_GetJoystickGUID(byval joystick as SDL_Joystick ptr) as SDL_GUID
declare function SDL_GetJoystickVendor(byval joystick as SDL_Joystick ptr) as Uint16
declare function SDL_GetJoystickProduct(byval joystick as SDL_Joystick ptr) as Uint16
declare function SDL_GetJoystickProductVersion(byval joystick as SDL_Joystick ptr) as Uint16
declare function SDL_GetJoystickFirmwareVersion(byval joystick as SDL_Joystick ptr) as Uint16
declare function SDL_GetJoystickSerial(byval joystick as SDL_Joystick ptr) as const zstring ptr
declare function SDL_GetJoystickType(byval joystick as SDL_Joystick ptr) as SDL_JoystickType
declare sub SDL_GetJoystickGUIDInfo(byval guid as SDL_GUID, byval vendor as Uint16 ptr, byval product as Uint16 ptr, byval version as Uint16 ptr, byval crc16 as Uint16 ptr)
declare function SDL_JoystickConnected(byval joystick as SDL_Joystick ptr) as boolean
declare function SDL_GetJoystickID(byval joystick as SDL_Joystick ptr) as SDL_JoystickID
declare function SDL_GetNumJoystickAxes(byval joystick as SDL_Joystick ptr) as long
declare function SDL_GetNumJoystickBalls(byval joystick as SDL_Joystick ptr) as long
declare function SDL_GetNumJoystickHats(byval joystick as SDL_Joystick ptr) as long
declare function SDL_GetNumJoystickButtons(byval joystick as SDL_Joystick ptr) as long
declare sub SDL_SetJoystickEventsEnabled(byval enabled as boolean)
declare function SDL_JoystickEventsEnabled() as boolean
declare sub SDL_UpdateJoysticks()
declare function SDL_GetJoystickAxis(byval joystick as SDL_Joystick ptr, byval axis as long) as Sint16
declare function SDL_GetJoystickAxisInitialState(byval joystick as SDL_Joystick ptr, byval axis as long, byval state as Sint16 ptr) as boolean
declare function SDL_GetJoystickBall(byval joystick as SDL_Joystick ptr, byval ball as long, byval dx as long ptr, byval dy as long ptr) as boolean
declare function SDL_GetJoystickHat(byval joystick as SDL_Joystick ptr, byval hat as long) as Uint8

const SDL_HAT_CENTERED  = &h00u
const SDL_HAT_UP        = &h01u
const SDL_HAT_RIGHT     = &h02u
const SDL_HAT_DOWN      = &h04u
const SDL_HAT_LEFT      = &h08u
const SDL_HAT_RIGHTUP   = culng(SDL_HAT_RIGHT or SDL_HAT_UP)
const SDL_HAT_RIGHTDOWN = culng(SDL_HAT_RIGHT or SDL_HAT_DOWN)
const SDL_HAT_LEFTUP    = culng(SDL_HAT_LEFT  or SDL_HAT_UP)
const SDL_HAT_LEFTDOWN  = culng(SDL_HAT_LEFT  or SDL_HAT_DOWN)

declare function SDL_GetJoystickButton(byval joystick as SDL_Joystick ptr, byval button as long) as boolean
declare function SDL_RumbleJoystick(byval joystick as SDL_Joystick ptr, byval low_frequency_rumble as Uint16, byval high_frequency_rumble as Uint16, byval duration_ms as Uint32) as boolean
declare function SDL_RumbleJoystickTriggers(byval joystick as SDL_Joystick ptr, byval left_rumble as Uint16, byval right_rumble as Uint16, byval duration_ms as Uint32) as boolean
declare function SDL_SetJoystickLED(byval joystick as SDL_Joystick ptr, byval red as Uint8, byval green as Uint8, byval blue as Uint8) as boolean
declare function SDL_SendJoystickEffect(byval joystick as SDL_Joystick ptr, byval data as const any ptr, byval size as long) as boolean
declare sub SDL_CloseJoystick(byval joystick as SDL_Joystick ptr)
declare function SDL_GetJoystickConnectionState(byval joystick as SDL_Joystick ptr) as SDL_JoystickConnectionState
declare function SDL_GetJoystickPowerInfo(byval joystick as SDL_Joystick ptr, byval percent as long ptr) as SDL_PowerState

end extern
