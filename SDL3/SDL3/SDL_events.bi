#pragma once

extern "C"

type SDL_EventType as long
enum
	SDL_EVENT_FIRST = 0
    
	SDL_EVENT_QUIT = &h100
    
	SDL_EVENT_TERMINATING
    
	SDL_EVENT_LOW_MEMORY
    
	SDL_EVENT_WILL_ENTER_BACKGROUND
    
	SDL_EVENT_DID_ENTER_BACKGROUND
    
	SDL_EVENT_WILL_ENTER_FOREGROUND
    
	SDL_EVENT_DID_ENTER_FOREGROUND
    
	SDL_EVENT_LOCALE_CHANGED
    
	SDL_EVENT_SYSTEM_THEME_CHANGED
    
	SDL_EVENT_DISPLAY_ORIENTATION = &h151
	SDL_EVENT_DISPLAY_ADDED
	SDL_EVENT_DISPLAY_REMOVED
	SDL_EVENT_DISPLAY_MOVED
	SDL_EVENT_DISPLAY_DESKTOP_MODE_CHANGED
	SDL_EVENT_DISPLAY_CURRENT_MODE_CHANGED
	SDL_EVENT_DISPLAY_CONTENT_SCALE_CHANGED
    SDL_EVENT_DISPLAY_USABLE_BOUNDS_CHANGED
	SDL_EVENT_DISPLAY_FIRST = SDL_EVENT_DISPLAY_ORIENTATION
	SDL_EVENT_DISPLAY_LAST = SDL_EVENT_DISPLAY_USABLE_BOUNDS_CHANGED
    
	SDL_EVENT_WINDOW_SHOWN = &h202
	SDL_EVENT_WINDOW_HIDDEN
	SDL_EVENT_WINDOW_EXPOSED
	SDL_EVENT_WINDOW_MOVED
	SDL_EVENT_WINDOW_RESIZED
	SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED
	SDL_EVENT_WINDOW_METAL_VIEW_RESIZED
	SDL_EVENT_WINDOW_MINIMIZED
	SDL_EVENT_WINDOW_MAXIMIZED
	SDL_EVENT_WINDOW_RESTORED
	SDL_EVENT_WINDOW_MOUSE_ENTER
	SDL_EVENT_WINDOW_MOUSE_LEAVE
	SDL_EVENT_WINDOW_FOCUS_GAINED
	SDL_EVENT_WINDOW_FOCUS_LOST
	SDL_EVENT_WINDOW_CLOSE_REQUESTED
	SDL_EVENT_WINDOW_HIT_TEST
	SDL_EVENT_WINDOW_ICCPROF_CHANGED
	SDL_EVENT_WINDOW_DISPLAY_CHANGED
	SDL_EVENT_WINDOW_DISPLAY_SCALE_CHANGED
	SDL_EVENT_WINDOW_SAFE_AREA_CHANGED
	SDL_EVENT_WINDOW_OCCLUDED
	SDL_EVENT_WINDOW_ENTER_FULLSCREEN
	SDL_EVENT_WINDOW_LEAVE_FULLSCREEN
	SDL_EVENT_WINDOW_DESTROYED
	SDL_EVENT_WINDOW_HDR_STATE_CHANGED
	SDL_EVENT_WINDOW_FIRST = SDL_EVENT_WINDOW_SHOWN
	SDL_EVENT_WINDOW_LAST = SDL_EVENT_WINDOW_HDR_STATE_CHANGED
    
	SDL_EVENT_KEY_DOWN = &h300
	SDL_EVENT_KEY_UP
	SDL_EVENT_TEXT_EDITING
	SDL_EVENT_TEXT_INPUT
	SDL_EVENT_KEYMAP_CHANGED
	SDL_EVENT_KEYBOARD_ADDED
	SDL_EVENT_KEYBOARD_REMOVED
	SDL_EVENT_TEXT_EDITING_CANDIDATES
    SDL_EVENT_SCREEN_KEYBOARD_SHOWN
    SDL_EVENT_SCREEN_KEYBOARD_HIDDEN
    
	SDL_EVENT_MOUSE_MOTION = &h400
	SDL_EVENT_MOUSE_BUTTON_DOWN
	SDL_EVENT_MOUSE_BUTTON_UP
	SDL_EVENT_MOUSE_WHEEL
	SDL_EVENT_MOUSE_ADDED
	SDL_EVENT_MOUSE_REMOVED
    
	SDL_EVENT_JOYSTICK_AXIS_MOTION = &h600
	SDL_EVENT_JOYSTICK_BALL_MOTION
	SDL_EVENT_JOYSTICK_HAT_MOTION
	SDL_EVENT_JOYSTICK_BUTTON_DOWN
	SDL_EVENT_JOYSTICK_BUTTON_UP
	SDL_EVENT_JOYSTICK_ADDED
	SDL_EVENT_JOYSTICK_REMOVED
	SDL_EVENT_JOYSTICK_BATTERY_UPDATED
	SDL_EVENT_JOYSTICK_UPDATE_COMPLETE
    
	SDL_EVENT_GAMEPAD_AXIS_MOTION = &h650
	SDL_EVENT_GAMEPAD_BUTTON_DOWN
	SDL_EVENT_GAMEPAD_BUTTON_UP
	SDL_EVENT_GAMEPAD_ADDED
	SDL_EVENT_GAMEPAD_REMOVED
	SDL_EVENT_GAMEPAD_REMAPPED
	SDL_EVENT_GAMEPAD_TOUCHPAD_DOWN
	SDL_EVENT_GAMEPAD_TOUCHPAD_MOTION
	SDL_EVENT_GAMEPAD_TOUCHPAD_UP
	SDL_EVENT_GAMEPAD_SENSOR_UPDATE
	SDL_EVENT_GAMEPAD_UPDATE_COMPLETE
	SDL_EVENT_GAMEPAD_STEAM_HANDLE_UPDATED
    
	SDL_EVENT_FINGER_DOWN = &h700
	SDL_EVENT_FINGER_UP
	SDL_EVENT_FINGER_MOTION
    SDL_EVENT_FINGER_CANCELED
    
    SDL_EVENT_PINCH_BEGIN      = &h710
    SDL_EVENT_PINCH_UPDATE
    SDL_EVENT_PINCH_END
    
	SDL_EVENT_CLIPBOARD_UPDATE = &h900
    
	SDL_EVENT_DROP_FILE = &h1000
	SDL_EVENT_DROP_TEXT
	SDL_EVENT_DROP_BEGIN
	SDL_EVENT_DROP_COMPLETE
	SDL_EVENT_DROP_POSITION
    
	SDL_EVENT_AUDIO_DEVICE_ADDED = &h1100
	SDL_EVENT_AUDIO_DEVICE_REMOVED
	SDL_EVENT_AUDIO_DEVICE_FORMAT_CHANGED
    
	SDL_EVENT_SENSOR_UPDATE = &h1200
    
	SDL_EVENT_PEN_PROXIMITY_IN = &h1300
	SDL_EVENT_PEN_PROXIMITY_OUT
	SDL_EVENT_PEN_DOWN
	SDL_EVENT_PEN_UP
	SDL_EVENT_PEN_BUTTON_DOWN
	SDL_EVENT_PEN_BUTTON_UP
	SDL_EVENT_PEN_MOTION
	SDL_EVENT_PEN_AXIS
    
	SDL_EVENT_CAMERA_DEVICE_ADDED = &h1400
	SDL_EVENT_CAMERA_DEVICE_REMOVED
	SDL_EVENT_CAMERA_DEVICE_APPROVED
	SDL_EVENT_CAMERA_DEVICE_DENIED
    
	SDL_EVENT_RENDER_TARGETS_RESET = &h2000
	SDL_EVENT_RENDER_DEVICE_RESET
	SDL_EVENT_RENDER_DEVICE_LOST
    
	SDL_EVENT_PRIVATE0 = &h4000
	SDL_EVENT_PRIVATE1
	SDL_EVENT_PRIVATE2
	SDL_EVENT_PRIVATE3
    
	SDL_EVENT_POLL_SENTINEL = &h7F00
    
	SDL_EVENT_USER = &h8000
    
	SDL_EVENT_LAST = &hFFFF
    
	SDL_EVENT_ENUM_PADDING = &h7FFFFFFF
end enum

type SDL_CommonEvent
	as Uint32 type
	reserved as Uint32
	timestamp as Uint64
end type

type SDL_DisplayEvent
	as SDL_EventType type
	reserved as Uint32
	timestamp as Uint64
	displayID as SDL_DisplayID
	data1 as Sint32
	data2 as Sint32
end type

type SDL_WindowEvent
	as SDL_EventType type
	reserved as Uint32
	timestamp as Uint64
	windowID as SDL_WindowID
	data1 as Sint32
	data2 as Sint32
end type

type SDL_KeyboardDeviceEvent
	as SDL_EventType type
	reserved as Uint32
	timestamp as Uint64
	which as SDL_KeyboardID
end type

type SDL_KeyboardEvent
	as SDL_EventType type
	reserved as Uint32
	timestamp as Uint64
	windowID as SDL_WindowID
	which as SDL_KeyboardID
	scancode as SDL_Scancode
	key as SDL_Keycode
	mod_ as SDL_Keymod
	raw as Uint16
	down as boolean
	repeat as boolean
end type

type SDL_TextEditingEvent
	as SDL_EventType type
	reserved as Uint32
	timestamp as Uint64
	windowID as SDL_WindowID
	text as const zstring ptr
	start as Sint32
	length as Sint32
end type

type SDL_TextEditingCandidatesEvent
	as SDL_EventType type
	reserved as Uint32
	timestamp as Uint64
	windowID as SDL_WindowID
	candidates as const zstring const ptr ptr
	num_candidates as Sint32
	selected_candidate as Sint32
	horizontal as boolean
	padding1 as Uint8
	padding2 as Uint8
	padding3 as Uint8
end type

type SDL_TextInputEvent
	as SDL_EventType type
	reserved as Uint32
	timestamp as Uint64
	windowID as SDL_WindowID
	text as const zstring ptr
end type

type SDL_MouseDeviceEvent
	as SDL_EventType type
	reserved as Uint32
	timestamp as Uint64
	which as SDL_MouseID
end type

type SDL_MouseMotionEvent
	as SDL_EventType type
	reserved as Uint32
	timestamp as Uint64
	windowID as SDL_WindowID
	which as SDL_MouseID
	state as SDL_MouseButtonFlags
	x as single
	y as single
	xrel as single
	yrel as single
end type

type SDL_MouseButtonEvent
	as SDL_EventType type
	reserved as Uint32
	timestamp as Uint64
	windowID as SDL_WindowID
	which as SDL_MouseID
	button as Uint8
	down as boolean
	clicks as Uint8
	padding as Uint8
	x as single
	y as single
end type

type SDL_MouseWheelEvent
	as SDL_EventType type
	reserved as Uint32
	timestamp as Uint64
	windowID as SDL_WindowID
	which as SDL_MouseID
	x as single
	y as single
	direction as SDL_MouseWheelDirection
	mouse_x as single
	mouse_y as single
    integer_x as Sint32
    ineger_y as Sint32
end type

type SDL_JoyAxisEvent
	as SDL_EventType type
	reserved as Uint32
	timestamp as Uint64
	which as SDL_JoystickID
	axis as Uint8
	padding1 as Uint8
	padding2 as Uint8
	padding3 as Uint8
	value as Sint16
	padding4 as Uint16
end type

type SDL_JoyBallEvent
	as SDL_EventType type
	reserved as Uint32
	timestamp as Uint64
	which as SDL_JoystickID
	ball as Uint8
	padding1 as Uint8
	padding2 as Uint8
	padding3 as Uint8
	xrel as Sint16
	yrel as Sint16
end type

type SDL_JoyHatEvent
	as SDL_EventType type
	reserved as Uint32
	timestamp as Uint64
	which as SDL_JoystickID
	hat as Uint8
	value as Uint8
	padding1 as Uint8
	padding2 as Uint8
end type

type SDL_JoyButtonEvent
	as SDL_EventType type
	reserved as Uint32
	timestamp as Uint64
	which as SDL_JoystickID
	button as Uint8
	down as boolean
	padding1 as Uint8
	padding2 as Uint8
end type

type SDL_JoyDeviceEvent
	as SDL_EventType type
	reserved as Uint32
	timestamp as Uint64
	which as SDL_JoystickID
end type

type SDL_JoyBatteryEvent
	as SDL_EventType type
	reserved as Uint32
	timestamp as Uint64
	which as SDL_JoystickID
	state as SDL_PowerState
	percent as long
end type

type SDL_GamepadAxisEvent
	as SDL_EventType type
	reserved as Uint32
	timestamp as Uint64
	which as SDL_JoystickID
	axis as Uint8
	padding1 as Uint8
	padding2 as Uint8
	padding3 as Uint8
	value as Sint16
	padding4 as Uint16
end type

type SDL_GamepadButtonEvent
	as SDL_EventType type
	reserved as Uint32
	timestamp as Uint64
	which as SDL_JoystickID
	button as Uint8
	down as boolean
	padding1 as Uint8
	padding2 as Uint8
end type

type SDL_GamepadDeviceEvent
	as SDL_EventType type
	reserved as Uint32
	timestamp as Uint64
	which as SDL_JoystickID
end type

type SDL_GamepadTouchpadEvent
	as SDL_EventType type
	reserved as Uint32
	timestamp as Uint64
	which as SDL_JoystickID
	touchpad as Sint32
	finger as Sint32
	x as single
	y as single
	pressure as single
end type

type SDL_GamepadSensorEvent
	as SDL_EventType type
	reserved as Uint32
	timestamp as Uint64
	which as SDL_JoystickID
	sensor as Sint32
	data(0 to 2) as single
	sensor_timestamp as Uint64
end type

type SDL_AudioDeviceEvent
	as SDL_EventType type
	reserved as Uint32
	timestamp as Uint64
	which as SDL_AudioDeviceID
	recording as boolean
	padding1 as Uint8
	padding2 as Uint8
	padding3 as Uint8
end type

type SDL_CameraDeviceEvent
	as SDL_EventType type
	reserved as Uint32
	timestamp as Uint64
	which as SDL_CameraID
end type

type SDL_RenderEvent
    as SDL_EventType type
    reserved as Uint32
    timestamp as Uint64
    windowID as SDL_WindowID
end type

type SDL_TouchFingerEvent
	as SDL_EventType type
	reserved as Uint32
	timestamp as Uint64
	touchID as SDL_TouchID
	fingerID as SDL_FingerID
	x as single
	y as single
	dx as single
	dy as single
	pressure as single
	windowID as SDL_WindowID
end type

type SDL_PinchFingerEvent
    as SDL_EventType type
    reserved as Uint32
	timestamp as Uint64
    scale as single
    windowID as SDL_WindowID
end type

type SDL_PenProximityEvent
	as SDL_EventType type
	reserved as Uint32
	timestamp as Uint64
	windowID as SDL_WindowID
	which as SDL_PenID
end type

type SDL_PenMotionEvent
	as SDL_EventType type
	reserved as Uint32
	timestamp as Uint64
	windowID as SDL_WindowID
	which as SDL_PenID
	pen_state as SDL_PenInputFlags
	x as single
	y as single
end type

type SDL_PenTouchEvent
	as SDL_EventType type
	reserved as Uint32
	timestamp as Uint64
	windowID as SDL_WindowID
	which as SDL_PenID
	pen_state as SDL_PenInputFlags
	x as single
	y as single
	eraser as boolean
	down as boolean
end type

type SDL_PenButtonEvent
	as SDL_EventType type
	reserved as Uint32
	timestamp as Uint64
	windowID as SDL_WindowID
	which as SDL_PenID
	pen_state as SDL_PenInputFlags
	x as single
	y as single
	button as Uint8
	down as boolean
end type

type SDL_PenAxisEvent
	as SDL_EventType type
	reserved as Uint32
	timestamp as Uint64
	windowID as SDL_WindowID
	which as SDL_PenID
	pen_state as SDL_PenInputFlags
	x as single
	y as single
	axis as SDL_PenAxis
	value as single
end type

type SDL_DropEvent
	as SDL_EventType type
	reserved as Uint32
	timestamp as Uint64
	windowID as SDL_WindowID
	x as single
	y as single
	source as const zstring ptr
	data as const zstring ptr
end type

type SDL_ClipboardEvent
	as SDL_EventType type
	reserved as Uint32
	timestamp as Uint64
	owner as boolean
	num_mime_types as Sint32
	mime_types as const zstring ptr ptr
end type

type SDL_SensorEvent
	as SDL_EventType type
	reserved as Uint32
	timestamp as Uint64
	which as SDL_SensorID
	data(0 to 5) as single
	sensor_timestamp as Uint64
end type

type SDL_QuitEvent
	as SDL_EventType type
	reserved as Uint32
	timestamp as Uint64
end type

type SDL_UserEvent
	as Uint32 type
	reserved as Uint32
	timestamp as Uint64
	windowID as SDL_WindowID
	code as Sint32
	data1 as any ptr
	data2 as any ptr
end type

union SDL_Event
	as Uint32 type
	common as SDL_CommonEvent
	display as SDL_DisplayEvent
	window as SDL_WindowEvent
	kdevice as SDL_KeyboardDeviceEvent
	key as SDL_KeyboardEvent
	edit as SDL_TextEditingEvent
	edit_candidates as SDL_TextEditingCandidatesEvent
	text as SDL_TextInputEvent
	mdevice as SDL_MouseDeviceEvent
	motion as SDL_MouseMotionEvent
	button as SDL_MouseButtonEvent
	wheel as SDL_MouseWheelEvent
	jdevice as SDL_JoyDeviceEvent
	jaxis as SDL_JoyAxisEvent
	jball as SDL_JoyBallEvent
	jhat as SDL_JoyHatEvent
	jbutton as SDL_JoyButtonEvent
	jbattery as SDL_JoyBatteryEvent
	gdevice as SDL_GamepadDeviceEvent
	gaxis as SDL_GamepadAxisEvent
	gbutton as SDL_GamepadButtonEvent
	gtouchpad as SDL_GamepadTouchpadEvent
	gsensor as SDL_GamepadSensorEvent
	adevice as SDL_AudioDeviceEvent
	cdevice as SDL_CameraDeviceEvent
	sensor as SDL_SensorEvent
	quit as SDL_QuitEvent
	user as SDL_UserEvent
	tfinger as SDL_TouchFingerEvent
    pinch as SDL_PinchFingerEvent
	pproximity as SDL_PenProximityEvent
	ptouch as SDL_PenTouchEvent
	pmotion as SDL_PenMotionEvent
	pbutton as SDL_PenButtonEvent
	paxis as SDL_PenAxisEvent
    render as SDL_RenderEvent
	drop as SDL_DropEvent
	clipboard as SDL_ClipboardEvent
	padding(0 to 127) as Uint8
end union

declare sub SDL_PumpEvents()

type SDL_EventAction as long
enum
	SDL_ADDEVENT
	SDL_PEEKEVENT
	SDL_GETEVENT
end enum

declare function SDL_PeepEvents(byval events as SDL_Event ptr, byval numevents as long, byval action as SDL_EventAction, byval minType as Uint32, byval maxType as Uint32) as long
declare function SDL_HasEvent(byval type as Uint32) as boolean
declare function SDL_HasEvents(byval minType as Uint32, byval maxType as Uint32) as boolean
declare sub SDL_FlushEvent(byval type as Uint32)
declare sub SDL_FlushEvents(byval minType as Uint32, byval maxType as Uint32)
declare function SDL_PollEvent(byval event as SDL_Event ptr) as boolean
declare function SDL_WaitEvent(byval event as SDL_Event ptr) as boolean
declare function SDL_WaitEventTimeout(byval event as SDL_Event ptr, byval timeoutMS as Sint32) as boolean
declare function SDL_PushEvent(byval event as SDL_Event ptr) as boolean

type SDL_EventFilter as function(byval userdata as any ptr, byval event as SDL_Event ptr) as boolean

declare sub SDL_SetEventFilter(byval filter as SDL_EventFilter, byval userdata as any ptr)
declare function SDL_GetEventFilter(byval filter as SDL_EventFilter ptr, byval userdata as any ptr ptr) as boolean
declare function SDL_AddEventWatch(byval filter as SDL_EventFilter, byval userdata as any ptr) as boolean
declare sub SDL_RemoveEventWatch(byval filter as SDL_EventFilter, byval userdata as any ptr)
declare sub SDL_FilterEvents(byval filter as SDL_EventFilter, byval userdata as any ptr)
declare sub SDL_SetEventEnabled(byval type as Uint32, byval enabled as boolean)
declare function SDL_EventEnabled(byval type as Uint32) as boolean
declare function SDL_RegisterEvents(byval numevents as long) as Uint32
declare function SDL_GetWindowFromEvent(byval event as const SDL_Event ptr) as SDL_Window ptr
declare function SDL_GetEventDescription(byval event as const SDL_Event ptr, byval buf as zstring ptr, byval buflen as long) as long

end extern
