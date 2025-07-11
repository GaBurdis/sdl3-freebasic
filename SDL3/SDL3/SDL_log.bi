#pragma once

extern "C"

type SDL_LogCategory as long
enum
	SDL_LOG_CATEGORY_APPLICATION
	SDL_LOG_CATEGORY_ERROR
	SDL_LOG_CATEGORY_ASSERT
	SDL_LOG_CATEGORY_SYSTEM
	SDL_LOG_CATEGORY_AUDIO
	SDL_LOG_CATEGORY_VIDEO
	SDL_LOG_CATEGORY_RENDER
	SDL_LOG_CATEGORY_INPUT
	SDL_LOG_CATEGORY_TEST
	SDL_LOG_CATEGORY_GPU
	SDL_LOG_CATEGORY_RESERVED2
	SDL_LOG_CATEGORY_RESERVED3
	SDL_LOG_CATEGORY_RESERVED4
	SDL_LOG_CATEGORY_RESERVED5
	SDL_LOG_CATEGORY_RESERVED6
	SDL_LOG_CATEGORY_RESERVED7
	SDL_LOG_CATEGORY_RESERVED8
	SDL_LOG_CATEGORY_RESERVED9
	SDL_LOG_CATEGORY_RESERVED10
	SDL_LOG_CATEGORY_CUSTOM
end enum

type SDL_LogPriority as long
enum
	SDL_LOG_PRIORITY_INVALID
	SDL_LOG_PRIORITY_TRACE
	SDL_LOG_PRIORITY_VERBOSE
	SDL_LOG_PRIORITY_DEBUG
	SDL_LOG_PRIORITY_INFO
	SDL_LOG_PRIORITY_WARN
	SDL_LOG_PRIORITY_ERROR
	SDL_LOG_PRIORITY_CRITICAL
	SDL_LOG_PRIORITY_COUNT
end enum

declare sub SDL_SetLogPriorities(byval priority as SDL_LogPriority)
declare sub SDL_SetLogPriority(byval category as long, byval priority as SDL_LogPriority)
declare function SDL_GetLogPriority(byval category as long) as SDL_LogPriority
declare sub SDL_ResetLogPriorities()
declare function SDL_SetLogPriorityPrefix(byval priority as SDL_LogPriority, byval prefix as const zstring ptr) as boolean
declare sub SDL_Log(byval fmt as const zstring ptr, ...)
declare sub SDL_LogTrace(byval category as long, byval fmt as const zstring ptr, ...)
declare sub SDL_LogVerbose(byval category as long, byval fmt as const zstring ptr, ...)
declare sub SDL_LogDebug(byval category as long, byval fmt as const zstring ptr, ...)
declare sub SDL_LogInfo(byval category as long, byval fmt as const zstring ptr, ...)
declare sub SDL_LogWarn(byval category as long, byval fmt as const zstring ptr, ...)
declare sub SDL_LogError(byval category as long, byval fmt as const zstring ptr, ...)
declare sub SDL_LogCritical(byval category as long, byval fmt as const zstring ptr, ...)
declare sub SDL_LogMessage(byval category as long, byval priority as SDL_LogPriority, byval fmt as const zstring ptr, ...)
declare sub SDL_LogMessageV(byval category as long, byval priority as SDL_LogPriority, byval fmt as const zstring ptr, byval ap as va_list)

type SDL_LogOutputFunction as sub(byval userdata as any ptr, byval category as long, byval priority as SDL_LogPriority, byval message as const zstring ptr)

declare function SDL_GetDefaultLogOutputFunction() as SDL_LogOutputFunction
declare sub SDL_GetLogOutputFunction(byval callback as SDL_LogOutputFunction ptr, byval userdata as any ptr ptr)
declare sub SDL_SetLogOutputFunction(byval callback as SDL_LogOutputFunction, byval userdata as any ptr)

end extern
