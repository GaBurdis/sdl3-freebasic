#pragma once

extern "C"

type SDL_InitFlags as Uint32

const SDL_INIT_AUDIO    = &h00000010u
const SDL_INIT_VIDEO    = &h00000020u
const SDL_INIT_JOYSTICK = &h00000200u
const SDL_INIT_HAPTIC   = &h00001000u
const SDL_INIT_GAMEPAD  = &h00002000u
const SDL_INIT_EVENTS   = &h00004000u
const SDL_INIT_SENSOR   = &h00008000u
const SDL_INIT_CAMERA   = &h00010000u

type SDL_AppResult as long
enum
	SDL_APP_CONTINUE
	SDL_APP_SUCCESS
	SDL_APP_FAILURE
end enum

type SDL_AppInit_func as function(byval appstate as any ptr ptr, byval argc as long, byval argv as zstring ptr ptr) as SDL_AppResult
type SDL_AppIterate_func as function(byval appstate as any ptr) as SDL_AppResult
type SDL_AppEvent_func as function(byval appstate as any ptr, byval event as SDL_Event ptr) as SDL_AppResult
type SDL_AppQuit_func as sub(byval appstate as any ptr, byval result as SDL_AppResult)

declare function SDL_Init(byval flags as SDL_InitFlags) as boolean
declare function SDL_InitSubSystem(byval flags as SDL_InitFlags) as boolean
declare sub SDL_QuitSubSystem(byval flags as SDL_InitFlags)
declare function SDL_WasInit(byval flags as SDL_InitFlags) as SDL_InitFlags
declare sub SDL_Quit()
declare function SDL_IsMainThread() as boolean

type SDL_MainThreadCallback as sub(byval userdata as any ptr)

declare function SDL_RunOnMainThread(byval callback as SDL_MainThreadCallback, byval userdata as any ptr, byval wait_complete as boolean) as boolean
declare function SDL_SetAppMetadata(byval appname as const zstring ptr, byval appversion as const zstring ptr, byval appidentifier as const zstring ptr) as boolean
declare function SDL_SetAppMetadataProperty(byval name as const zstring ptr, byval value as const zstring ptr) as boolean

#define SDL_PROP_APP_METADATA_NAME_STRING       "SDL.app.metadata.name"
#define SDL_PROP_APP_METADATA_VERSION_STRING    "SDL.app.metadata.version"
#define SDL_PROP_APP_METADATA_IDENTIFIER_STRING "SDL.app.metadata.identifier"
#define SDL_PROP_APP_METADATA_CREATOR_STRING    "SDL.app.metadata.creator"
#define SDL_PROP_APP_METADATA_COPYRIGHT_STRING  "SDL.app.metadata.copyright"
#define SDL_PROP_APP_METADATA_URL_STRING        "SDL.app.metadata.url"
#define SDL_PROP_APP_METADATA_TYPE_STRING       "SDL.app.metadata.type"

declare function SDL_GetAppMetadataProperty(byval name as const zstring ptr) as const zstring ptr

end extern
