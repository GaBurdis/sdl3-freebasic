#pragma once

extern "C"

type SDL_CameraID as Uint32

type SDL_Camera as _SDL_Camera

type SDL_CameraSpec
	format as SDL_PixelFormat
	colorspace as SDL_Colorspace
	width as long
	height as long
	framerate_numerator as long
	framerate_denominator as long
end type

type SDL_CameraPosition as long
enum
	SDL_CAMERA_POSITION_UNKNOWN
	SDL_CAMERA_POSITION_FRONT_FACING
	SDL_CAMERA_POSITION_BACK_FACING
end enum

type SDL_CameraPermissionState as long
enum
    SDL_CAMERA_PERMISSION_STATE_DENIED = -1
    SDL_CAMERA_PERMISSION_STATE_PENDING
    SDL_CAMERA_PERMISSION_STATE_APPROVED
end enum

declare function SDL_GetNumCameraDrivers() as long
declare function SDL_GetCameraDriver(byval index as long) as const zstring ptr
declare function SDL_GetCurrentCameraDriver() as const zstring ptr
declare function SDL_GetCameras(byval count as long ptr) as SDL_CameraID ptr
declare function SDL_GetCameraSupportedFormats(byval instance_id as SDL_CameraID, byval count as long ptr) as SDL_CameraSpec ptr ptr
declare function SDL_GetCameraName(byval instance_id as SDL_CameraID) as const zstring ptr
declare function SDL_GetCameraPosition(byval instance_id as SDL_CameraID) as SDL_CameraPosition
declare function SDL_OpenCamera(byval instance_id as SDL_CameraID, byval spec as const SDL_CameraSpec ptr) as SDL_Camera ptr
declare function SDL_GetCameraPermissionState(byval camera as SDL_Camera ptr) as SDL_CameraPermissionState
declare function SDL_GetCameraID(byval camera as SDL_Camera ptr) as SDL_CameraID
declare function SDL_GetCameraProperties(byval camera as SDL_Camera ptr) as SDL_PropertiesID
declare function SDL_GetCameraFormat(byval camera as SDL_Camera ptr, byval spec as SDL_CameraSpec ptr) as boolean
declare function SDL_AcquireCameraFrame(byval camera as SDL_Camera ptr, byval timestampNS as Uint64 ptr) as SDL_Surface ptr
declare sub SDL_ReleaseCameraFrame(byval camera as SDL_Camera ptr, byval frame as SDL_Surface ptr)
declare sub SDL_CloseCamera(byval camera as SDL_Camera ptr)

end extern
