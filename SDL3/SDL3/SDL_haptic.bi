#pragma once

extern "C"

type SDL_Haptic as _SDL_Haptic

const SDL_HAPTIC_CONSTANT = culng(1u shl 0)
const SDL_HAPTIC_SINE = culng(1u shl 1)
const SDL_HAPTIC_SQUARE = culng(1u shl 2)
const SDL_HAPTIC_TRIANGLE = culng(1u shl 3)
const SDL_HAPTIC_SAWTOOTHUP = culng(1u shl 4)
const SDL_HAPTIC_SAWTOOTHDOWN = culng(1u shl 5)
const SDL_HAPTIC_RAMP = culng(1u shl 6)
const SDL_HAPTIC_SPRING = culng(1u shl 7)
const SDL_HAPTIC_DAMPER = culng(1u shl 8)
const SDL_HAPTIC_INERTIA = culng(1u shl 9)
const SDL_HAPTIC_FRICTION = culng(1u shl 10)
const SDL_HAPTIC_LEFTRIGHT = culng(1u shl 11)
const SDL_HAPTIC_RESERVED1 = culng(1u shl 12)
const SDL_HAPTIC_RESERVED2 = culng(1u shl 13)
const SDL_HAPTIC_RESERVED3 = culng(1u shl 14)
const SDL_HAPTIC_CUSTOM = culng(1u shl 15)
const SDL_HAPTIC_GAIN = culng(1u shl 16)
const SDL_HAPTIC_AUTOCENTER = culng(1u shl 17)
const SDL_HAPTIC_STATUS = culng(1u shl 18)
const SDL_HAPTIC_PAUSE = culng(1u shl 19)

const SDL_HAPTIC_POLAR = 0
const SDL_HAPTIC_CARTESIAN = 1
const SDL_HAPTIC_SPHERICAL = 2
const SDL_HAPTIC_STEERING_AXIS = 3

const SDL_HAPTIC_INFINITY = 4294967295u

type SDL_HapticDirection
	as Uint8 type
	dir(0 to 2) as Sint32
end type

type SDL_HapticConstant
	as Uint16 type
	direction as SDL_HapticDirection
	length as Uint32
	delay as Uint16
	button as Uint16
	interval as Uint16
	level as Sint16
	attack_length as Uint16
	attack_level as Uint16
	fade_length as Uint16
	fade_level as Uint16
end type

type SDL_HapticPeriodic
	as Uint16 type
	direction as SDL_HapticDirection
	length as Uint32
	delay as Uint16
	button as Uint16
	interval as Uint16
	period as Uint16
	magnitude as Sint16
	offset as Sint16
	phase as Uint16
	attack_length as Uint16
	attack_level as Uint16
	fade_length as Uint16
	fade_level as Uint16
end type

type SDL_HapticCondition
	as Uint16 type
	direction as SDL_HapticDirection
	length as Uint32
	delay as Uint16
	button as Uint16
	interval as Uint16
	right_sat(0 to 2) as Uint16
	left_sat(0 to 2) as Uint16
	right_coeff(0 to 2) as Sint16
	left_coeff(0 to 2) as Sint16
	deadband(0 to 2) as Uint16
	center(0 to 2) as Sint16
end type

type SDL_HapticRamp
	as Uint16 type
	direction as SDL_HapticDirection
	length as Uint32
	delay as Uint16
	button as Uint16
	interval as Uint16
	start as Sint16
	as Sint16 end
	attack_length as Uint16
	attack_level as Uint16
	fade_length as Uint16
	fade_level as Uint16
end type

type SDL_HapticLeftRight
	as Uint16 type
	length as Uint32
	large_magnitude as Uint16
	small_magnitude as Uint16
end type

type SDL_HapticCustom
	as Uint16 type
	direction as SDL_HapticDirection
	length as Uint32
	delay as Uint16
	button as Uint16
	interval as Uint16
	channels as Uint8
	period as Uint16
	samples as Uint16
	data as Uint16 ptr
	attack_length as Uint16
	attack_level as Uint16
	fade_length as Uint16
	fade_level as Uint16
end type

union SDL_HapticEffect
	as Uint16 type
	constant as SDL_HapticConstant
	periodic as SDL_HapticPeriodic
	condition as SDL_HapticCondition
	ramp as SDL_HapticRamp
	leftright as SDL_HapticLeftRight
	custom as SDL_HapticCustom
end union

type SDL_HapticID as Uint32

declare function SDL_GetHaptics(byval count as long ptr) as SDL_HapticID ptr
declare function SDL_GetHapticNameForID(byval instance_id as SDL_HapticID) as const zstring ptr
declare function SDL_OpenHaptic(byval instance_id as SDL_HapticID) as SDL_Haptic ptr
declare function SDL_GetHapticFromID(byval instance_id as SDL_HapticID) as SDL_Haptic ptr
declare function SDL_GetHapticID(byval haptic as SDL_Haptic ptr) as SDL_HapticID
declare function SDL_GetHapticName(byval haptic as SDL_Haptic ptr) as const zstring ptr
declare function SDL_IsMouseHaptic() as boolean
declare function SDL_OpenHapticFromMouse() as SDL_Haptic ptr
declare function SDL_IsJoystickHaptic(byval joystick as SDL_Joystick ptr) as boolean
declare function SDL_OpenHapticFromJoystick(byval joystick as SDL_Joystick ptr) as SDL_Haptic ptr
declare sub SDL_CloseHaptic(byval haptic as SDL_Haptic ptr)
declare function SDL_GetMaxHapticEffects(byval haptic as SDL_Haptic ptr) as long
declare function SDL_GetMaxHapticEffectsPlaying(byval haptic as SDL_Haptic ptr) as long
declare function SDL_GetHapticFeatures(byval haptic as SDL_Haptic ptr) as Uint32
declare function SDL_GetNumHapticAxes(byval haptic as SDL_Haptic ptr) as long
declare function SDL_HapticEffectSupported(byval haptic as SDL_Haptic ptr, byval effect as const SDL_HapticEffect ptr) as boolean
declare function SDL_CreateHapticEffect(byval haptic as SDL_Haptic ptr, byval effect as const SDL_HapticEffect ptr) as long
declare function SDL_UpdateHapticEffect(byval haptic as SDL_Haptic ptr, byval effect as long, byval data as const SDL_HapticEffect ptr) as boolean
declare function SDL_RunHapticEffect(byval haptic as SDL_Haptic ptr, byval effect as long, byval iterations as Uint32) as boolean
declare function SDL_StopHapticEffect(byval haptic as SDL_Haptic ptr, byval effect as long) as boolean
declare sub SDL_DestroyHapticEffect(byval haptic as SDL_Haptic ptr, byval effect as long)
declare function SDL_GetHapticEffectStatus(byval haptic as SDL_Haptic ptr, byval effect as long) as boolean
declare function SDL_SetHapticGain(byval haptic as SDL_Haptic ptr, byval gain as long) as boolean
declare function SDL_SetHapticAutocenter(byval haptic as SDL_Haptic ptr, byval autocenter as long) as boolean
declare function SDL_PauseHaptic(byval haptic as SDL_Haptic ptr) as boolean
declare function SDL_ResumeHaptic(byval haptic as SDL_Haptic ptr) as boolean
declare function SDL_StopHapticEffects(byval haptic as SDL_Haptic ptr) as boolean
declare function SDL_HapticRumbleSupported(byval haptic as SDL_Haptic ptr) as boolean
declare function SDL_InitHapticRumble(byval haptic as SDL_Haptic ptr) as boolean
declare function SDL_PlayHapticRumble(byval haptic as SDL_Haptic ptr, byval strength as single, byval length as Uint32) as boolean
declare function SDL_StopHapticRumble(byval haptic as SDL_Haptic ptr) as boolean

end extern
