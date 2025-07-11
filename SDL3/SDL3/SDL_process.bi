#pragma once

extern "C"

type SDL_Process as _SDL_Process

declare function SDL_CreateProcess(byval args as const zstring const ptr ptr, byval pipe_stdio as boolean) as SDL_Process ptr

type SDL_ProcessIO as long
enum
	SDL_PROCESS_STDIO_INHERITED
	SDL_PROCESS_STDIO_NULL
	SDL_PROCESS_STDIO_APP
	SDL_PROCESS_STDIO_REDIRECT
end enum

declare function SDL_CreateProcessWithProperties(byval props as SDL_PropertiesID) as SDL_Process ptr

#define SDL_PROP_PROCESS_CREATE_ARGS_POINTER "SDL.process.create.args"
#define SDL_PROP_PROCESS_CREATE_ENVIRONMENT_POINTER "SDL.process.create.environment"
#define SDL_PROP_PROCESS_CREATE_STDIN_NUMBER "SDL.process.create.stdin_option"
#define SDL_PROP_PROCESS_CREATE_STDIN_POINTER "SDL.process.create.stdin_source"
#define SDL_PROP_PROCESS_CREATE_STDOUT_NUMBER "SDL.process.create.stdout_option"
#define SDL_PROP_PROCESS_CREATE_STDOUT_POINTER "SDL.process.create.stdout_source"
#define SDL_PROP_PROCESS_CREATE_STDERR_NUMBER "SDL.process.create.stderr_option"
#define SDL_PROP_PROCESS_CREATE_STDERR_POINTER "SDL.process.create.stderr_source"
#define SDL_PROP_PROCESS_CREATE_STDERR_TO_STDOUT_BOOLEAN "SDL.process.create.stderr_to_stdout"
#define SDL_PROP_PROCESS_CREATE_BACKGROUND_BOOLEAN "SDL.process.create.background"

declare function SDL_GetProcessProperties(byval process as SDL_Process ptr) as SDL_PropertiesID

#define SDL_PROP_PROCESS_PID_NUMBER "SDL.process.pid"
#define SDL_PROP_PROCESS_STDIN_POINTER "SDL.process.stdin"
#define SDL_PROP_PROCESS_STDOUT_POINTER "SDL.process.stdout"
#define SDL_PROP_PROCESS_STDERR_POINTER "SDL.process.stderr"
#define SDL_PROP_PROCESS_BACKGROUND_BOOLEAN "SDL.process.background"

declare function SDL_ReadProcess(byval process as SDL_Process ptr, byval datasize as uinteger ptr, byval exitcode as long ptr) as any ptr
declare function SDL_GetProcessInput(byval process as SDL_Process ptr) as SDL_IOStream ptr
declare function SDL_GetProcessOutput(byval process as SDL_Process ptr) as SDL_IOStream ptr
declare function SDL_KillProcess(byval process as SDL_Process ptr, byval force as boolean) as boolean
declare function SDL_WaitProcess(byval process as SDL_Process ptr, byval block as boolean, byval exitcode as long ptr) as boolean
declare sub SDL_DestroyProcess(byval process as SDL_Process ptr)

end extern
