#pragma once

extern "C"

type SDL_DateTime
	year as long
	month as long
	day as long
	hour as long
	minute as long
	second as long
	nanosecond as long
	day_of_week as long
	utc_offset as long
end type

type SDL_DateFormat as long
enum
	SDL_DATE_FORMAT_YYYYMMDD = 0
	SDL_DATE_FORMAT_DDMMYYYY = 1
	SDL_DATE_FORMAT_MMDDYYYY = 2
end enum

type SDL_TimeFormat as long
enum
	SDL_TIME_FORMAT_24HR = 0
	SDL_TIME_FORMAT_12HR = 1
end enum

declare function SDL_GetDateTimeLocalePreferences(byval dateFormat as SDL_DateFormat ptr, byval timeFormat as SDL_TimeFormat ptr) as boolean
declare function SDL_GetCurrentTime(byval ticks as SDL_Time ptr) as boolean
declare function SDL_TimeToDateTime(byval ticks as SDL_Time, byval dt as SDL_DateTime ptr, byval localTime as boolean) as boolean
declare function SDL_DateTimeToTime(byval dt as const SDL_DateTime ptr, byval ticks as SDL_Time ptr) as boolean
declare sub SDL_TimeToWindows(byval ticks as SDL_Time, byval dwLowDateTime as Uint32 ptr, byval dwHighDateTime as Uint32 ptr)
declare function SDL_TimeFromWindows(byval dwLowDateTime as Uint32, byval dwHighDateTime as Uint32) as SDL_Time
declare function SDL_GetDaysInMonth(byval year as long, byval month as long) as long
declare function SDL_GetDayOfYear(byval year as long, byval month as long, byval day as long) as long
declare function SDL_GetDayOfWeek(byval year as long, byval month as long, byval day as long) as long

end extern
