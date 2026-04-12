#pragma once

extern "C"

type SDL_Gamepad as _SDL_Gamepad

type SDL_GamepadType as long
enum
	SDL_GAMEPAD_TYPE_UNKNOWN = 0
	SDL_GAMEPAD_TYPE_STANDARD
	SDL_GAMEPAD_TYPE_XBOX360
	SDL_GAMEPAD_TYPE_XBOXONE
	SDL_GAMEPAD_TYPE_PS3
	SDL_GAMEPAD_TYPE_PS4
	SDL_GAMEPAD_TYPE_PS5
	SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_PRO
	SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_LEFT
	SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_RIGHT
	SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_PAIR
    SDL_GAMEPAD_TYPE_GAMECUBE
	SDL_GAMEPAD_TYPE_COUNT
end enum

type SDL_GamepadButton as long
enum
	SDL_GAMEPAD_BUTTON_INVALID = -1
	SDL_GAMEPAD_BUTTON_SOUTH
	SDL_GAMEPAD_BUTTON_EAST
	SDL_GAMEPAD_BUTTON_WEST
	SDL_GAMEPAD_BUTTON_NORTH
	SDL_GAMEPAD_BUTTON_BACK
	SDL_GAMEPAD_BUTTON_GUIDE
	SDL_GAMEPAD_BUTTON_START
	SDL_GAMEPAD_BUTTON_LEFT_STICK
	SDL_GAMEPAD_BUTTON_RIGHT_STICK
	SDL_GAMEPAD_BUTTON_LEFT_SHOULDER
	SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER
	SDL_GAMEPAD_BUTTON_DPAD_UP
	SDL_GAMEPAD_BUTTON_DPAD_DOWN
	SDL_GAMEPAD_BUTTON_DPAD_LEFT
	SDL_GAMEPAD_BUTTON_DPAD_RIGHT
	SDL_GAMEPAD_BUTTON_MISC1
	SDL_GAMEPAD_BUTTON_RIGHT_PADDLE1
	SDL_GAMEPAD_BUTTON_LEFT_PADDLE1
	SDL_GAMEPAD_BUTTON_RIGHT_PADDLE2
	SDL_GAMEPAD_BUTTON_LEFT_PADDLE2
	SDL_GAMEPAD_BUTTON_TOUCHPAD
	SDL_GAMEPAD_BUTTON_MISC2
	SDL_GAMEPAD_BUTTON_MISC3
	SDL_GAMEPAD_BUTTON_MISC4
	SDL_GAMEPAD_BUTTON_MISC5
	SDL_GAMEPAD_BUTTON_MISC6
	SDL_GAMEPAD_BUTTON_COUNT
end enum

type SDL_GamepadButtonLabel as long
enum
	SDL_GAMEPAD_BUTTON_LABEL_UNKNOWN
	SDL_GAMEPAD_BUTTON_LABEL_A
	SDL_GAMEPAD_BUTTON_LABEL_B
	SDL_GAMEPAD_BUTTON_LABEL_X
	SDL_GAMEPAD_BUTTON_LABEL_Y
	SDL_GAMEPAD_BUTTON_LABEL_CROSS
	SDL_GAMEPAD_BUTTON_LABEL_CIRCLE
	SDL_GAMEPAD_BUTTON_LABEL_SQUARE
	SDL_GAMEPAD_BUTTON_LABEL_TRIANGLE
end enum

type SDL_GamepadAxis as long
enum
	SDL_GAMEPAD_AXIS_INVALID = -1
	SDL_GAMEPAD_AXIS_LEFTX
	SDL_GAMEPAD_AXIS_LEFTY
	SDL_GAMEPAD_AXIS_RIGHTX
	SDL_GAMEPAD_AXIS_RIGHTY
	SDL_GAMEPAD_AXIS_LEFT_TRIGGER
	SDL_GAMEPAD_AXIS_RIGHT_TRIGGER
	SDL_GAMEPAD_AXIS_COUNT
end enum

type SDL_GamepadBindingType as long
enum
	SDL_GAMEPAD_BINDTYPE_NONE = 0
	SDL_GAMEPAD_BINDTYPE_BUTTON
	SDL_GAMEPAD_BINDTYPE_AXIS
	SDL_GAMEPAD_BINDTYPE_HAT
end enum

type SDL_GamepadBinding_input_axis
	axis as long
	axis_min as long
	axis_max as long
end type

type SDL_GamepadBinding_input_hat
	hat as long
	hat_mask as long
end type

union SDL_GamepadBinding_input
	button as long
	axis as SDL_GamepadBinding_input_axis
	hat as SDL_GamepadBinding_input_hat
end union

type SDL_GamepadBinding_output_axis
	axis as SDL_GamepadAxis
	axis_min as long
	axis_max as long
end type

union SDL_GamepadBinding_output
	button as SDL_GamepadButton
	axis as SDL_GamepadBinding_output_axis
end union

type SDL_GamepadBinding
	input_type as SDL_GamepadBindingType
	input as SDL_GamepadBinding_input
	output_type as SDL_GamepadBindingType
	output as SDL_GamepadBinding_output
end type

declare function SDL_AddGamepadMapping(byval mapping as const zstring ptr) as long
declare function SDL_AddGamepadMappingsFromIO(byval src as SDL_IOStream ptr, byval closeio as boolean) as long
declare function SDL_AddGamepadMappingsFromFile(byval file as const zstring ptr) as long
declare function SDL_ReloadGamepadMappings() as boolean
declare function SDL_GetGamepadMappings(byval count as long ptr) as zstring ptr ptr
declare function SDL_GetGamepadMappingForGUID(byval guid as SDL_GUID) as zstring ptr
declare function SDL_GetGamepadMapping(byval gamepad as SDL_Gamepad ptr) as zstring ptr
declare function SDL_SetGamepadMapping(byval instance_id as SDL_JoystickID, byval mapping as const zstring ptr) as boolean
declare function SDL_HasGamepad() as boolean
declare function SDL_GetGamepads(byval count as long ptr) as SDL_JoystickID ptr
declare function SDL_IsGamepad(byval instance_id as SDL_JoystickID) as boolean
declare function SDL_GetGamepadNameForID(byval instance_id as SDL_JoystickID) as const zstring ptr
declare function SDL_GetGamepadPathForID(byval instance_id as SDL_JoystickID) as const zstring ptr
declare function SDL_GetGamepadPlayerIndexForID(byval instance_id as SDL_JoystickID) as long
declare function SDL_GetGamepadGUIDForID(byval instance_id as SDL_JoystickID) as SDL_GUID
declare function SDL_GetGamepadVendorForID(byval instance_id as SDL_JoystickID) as Uint16
declare function SDL_GetGamepadProductForID(byval instance_id as SDL_JoystickID) as Uint16
declare function SDL_GetGamepadProductVersionForID(byval instance_id as SDL_JoystickID) as Uint16
declare function SDL_GetGamepadTypeForID(byval instance_id as SDL_JoystickID) as SDL_GamepadType
declare function SDL_GetRealGamepadTypeForID(byval instance_id as SDL_JoystickID) as SDL_GamepadType
declare function SDL_GetGamepadMappingForID(byval instance_id as SDL_JoystickID) as zstring ptr
declare function SDL_OpenGamepad(byval instance_id as SDL_JoystickID) as SDL_Gamepad ptr
declare function SDL_GetGamepadFromID(byval instance_id as SDL_JoystickID) as SDL_Gamepad ptr
declare function SDL_GetGamepadFromPlayerIndex(byval player_index as long) as SDL_Gamepad ptr
declare function SDL_GetGamepadProperties(byval gamepad as SDL_Gamepad ptr) as SDL_PropertiesID

#define SDL_PROP_GAMEPAD_CAP_MONO_LED_BOOLEAN       SDL_PROP_JOYSTICK_CAP_MONO_LED_BOOLEAN
#define SDL_PROP_GAMEPAD_CAP_RGB_LED_BOOLEAN        SDL_PROP_JOYSTICK_CAP_RGB_LED_BOOLEAN
#define SDL_PROP_GAMEPAD_CAP_PLAYER_LED_BOOLEAN     SDL_PROP_JOYSTICK_CAP_PLAYER_LED_BOOLEAN
#define SDL_PROP_GAMEPAD_CAP_RUMBLE_BOOLEAN         SDL_PROP_JOYSTICK_CAP_RUMBLE_BOOLEAN
#define SDL_PROP_GAMEPAD_CAP_TRIGGER_RUMBLE_BOOLEAN SDL_PROP_JOYSTICK_CAP_TRIGGER_RUMBLE_BOOLEAN

declare function SDL_GetGamepadID(byval gamepad as SDL_Gamepad ptr) as SDL_JoystickID
declare function SDL_GetGamepadName(byval gamepad as SDL_Gamepad ptr) as const zstring ptr
declare function SDL_GetGamepadPath(byval gamepad as SDL_Gamepad ptr) as const zstring ptr
declare function SDL_GetGamepadType(byval gamepad as SDL_Gamepad ptr) as SDL_GamepadType
declare function SDL_GetRealGamepadType(byval gamepad as SDL_Gamepad ptr) as SDL_GamepadType
declare function SDL_GetGamepadPlayerIndex(byval gamepad as SDL_Gamepad ptr) as long
declare function SDL_SetGamepadPlayerIndex(byval gamepad as SDL_Gamepad ptr, byval player_index as long) as boolean
declare function SDL_GetGamepadVendor(byval gamepad as SDL_Gamepad ptr) as Uint16
declare function SDL_GetGamepadProduct(byval gamepad as SDL_Gamepad ptr) as Uint16
declare function SDL_GetGamepadProductVersion(byval gamepad as SDL_Gamepad ptr) as Uint16
declare function SDL_GetGamepadFirmwareVersion(byval gamepad as SDL_Gamepad ptr) as Uint16
declare function SDL_GetGamepadSerial(byval gamepad as SDL_Gamepad ptr) as const zstring ptr
declare function SDL_GetGamepadSteamHandle(byval gamepad as SDL_Gamepad ptr) as Uint64
declare function SDL_GetGamepadConnectionState(byval gamepad as SDL_Gamepad ptr) as SDL_JoystickConnectionState
declare function SDL_GetGamepadPowerInfo(byval gamepad as SDL_Gamepad ptr, byval percent as long ptr) as SDL_PowerState
declare function SDL_GamepadConnected(byval gamepad as SDL_Gamepad ptr) as boolean
declare function SDL_GetGamepadJoystick(byval gamepad as SDL_Gamepad ptr) as SDL_Joystick ptr
declare sub SDL_SetGamepadEventsEnabled(byval enabled as boolean)
declare function SDL_GamepadEventsEnabled() as boolean
declare function SDL_GetGamepadBindings(byval gamepad as SDL_Gamepad ptr, byval count as long ptr) as SDL_GamepadBinding ptr ptr
declare sub SDL_UpdateGamepads()
declare function SDL_GetGamepadTypeFromString(byval str as const zstring ptr) as SDL_GamepadType
declare function SDL_GetGamepadStringForType(byval type as SDL_GamepadType) as const zstring ptr
declare function SDL_GetGamepadAxisFromString(byval str as const zstring ptr) as SDL_GamepadAxis
declare function SDL_GetGamepadStringForAxis(byval axis as SDL_GamepadAxis) as const zstring ptr
declare function SDL_GamepadHasAxis(byval gamepad as SDL_Gamepad ptr, byval axis as SDL_GamepadAxis) as boolean
declare function SDL_GetGamepadAxis(byval gamepad as SDL_Gamepad ptr, byval axis as SDL_GamepadAxis) as Sint16
declare function SDL_GetGamepadButtonFromString(byval str as const zstring ptr) as SDL_GamepadButton
declare function SDL_GetGamepadStringForButton(byval button as SDL_GamepadButton) as const zstring ptr
declare function SDL_GamepadHasButton(byval gamepad as SDL_Gamepad ptr, byval button as SDL_GamepadButton) as boolean
declare function SDL_GetGamepadButton(byval gamepad as SDL_Gamepad ptr, byval button as SDL_GamepadButton) as boolean
declare function SDL_GetGamepadButtonLabelForType(byval type as SDL_GamepadType, byval button as SDL_GamepadButton) as SDL_GamepadButtonLabel
declare function SDL_GetGamepadButtonLabel(byval gamepad as SDL_Gamepad ptr, byval button as SDL_GamepadButton) as SDL_GamepadButtonLabel
declare function SDL_GetNumGamepadTouchpads(byval gamepad as SDL_Gamepad ptr) as long
declare function SDL_GetNumGamepadTouchpadFingers(byval gamepad as SDL_Gamepad ptr, byval touchpad as long) as long
declare function SDL_GetGamepadTouchpadFinger(byval gamepad as SDL_Gamepad ptr, byval touchpad as long, byval finger as long, byval down as boolean ptr, byval x as single ptr, byval y as single ptr, byval pressure as single ptr) as boolean
declare function SDL_GamepadHasSensor(byval gamepad as SDL_Gamepad ptr, byval type as SDL_SensorType) as boolean
declare function SDL_SetGamepadSensorEnabled(byval gamepad as SDL_Gamepad ptr, byval type as SDL_SensorType, byval enabled as boolean) as boolean
declare function SDL_GamepadSensorEnabled(byval gamepad as SDL_Gamepad ptr, byval type as SDL_SensorType) as boolean
declare function SDL_GetGamepadSensorDataRate(byval gamepad as SDL_Gamepad ptr, byval type as SDL_SensorType) as single
declare function SDL_GetGamepadSensorData(byval gamepad as SDL_Gamepad ptr, byval type as SDL_SensorType, byval data as single ptr, byval num_values as long) as boolean
declare function SDL_RumbleGamepad(byval gamepad as SDL_Gamepad ptr, byval low_frequency_rumble as Uint16, byval high_frequency_rumble as Uint16, byval duration_ms as Uint32) as boolean
declare function SDL_RumbleGamepadTriggers(byval gamepad as SDL_Gamepad ptr, byval left_rumble as Uint16, byval right_rumble as Uint16, byval duration_ms as Uint32) as boolean
declare function SDL_SetGamepadLED(byval gamepad as SDL_Gamepad ptr, byval red as Uint8, byval green as Uint8, byval blue as Uint8) as boolean
declare function SDL_SendGamepadEffect(byval gamepad as SDL_Gamepad ptr, byval data as const any ptr, byval size as long) as boolean
declare sub SDL_CloseGamepad(byval gamepad as SDL_Gamepad ptr)
declare function SDL_GetGamepadAppleSFSymbolsNameForButton(byval gamepad as SDL_Gamepad ptr, byval button as SDL_GamepadButton) as const zstring ptr
declare function SDL_GetGamepadAppleSFSymbolsNameForAxis(byval gamepad as SDL_Gamepad ptr, byval axis as SDL_GamepadAxis) as const zstring ptr

end extern
