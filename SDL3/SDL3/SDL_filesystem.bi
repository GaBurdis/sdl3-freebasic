#pragma once

extern "C"

declare function SDL_GetBasePath() as const zstring ptr
declare function SDL_GetPrefPath(byval org as const zstring ptr, byval app as const zstring ptr) as zstring ptr

type SDL_Folder as long
enum
	SDL_FOLDER_HOME
	SDL_FOLDER_DESKTOP
	SDL_FOLDER_DOCUMENTS
	SDL_FOLDER_DOWNLOADS
	SDL_FOLDER_MUSIC
	SDL_FOLDER_PICTURES
	SDL_FOLDER_PUBLICSHARE
	SDL_FOLDER_SAVEDGAMES
	SDL_FOLDER_SCREENSHOTS
	SDL_FOLDER_TEMPLATES
	SDL_FOLDER_VIDEOS
	SDL_FOLDER_COUNT
end enum

declare function SDL_GetUserFolder(byval folder as SDL_Folder) as const zstring ptr

type SDL_PathType as long
enum
	SDL_PATHTYPE_NONE
	SDL_PATHTYPE_FILE
	SDL_PATHTYPE_DIRECTORY
	SDL_PATHTYPE_OTHER
end enum

type SDL_PathInfo
	as SDL_PathType type
	size as Uint64
	create_time as SDL_Time
	modify_time as SDL_Time
	access_time as SDL_Time
end type

type SDL_GlobFlags as Uint32

const SDL_GLOB_CASEINSENSITIVE = culng(1u shl 0)

declare function SDL_CreateDirectory(byval path as const zstring ptr) as boolean

type SDL_EnumerationResult as long
enum
	SDL_ENUM_CONTINUE
	SDL_ENUM_SUCCESS
	SDL_ENUM_FAILURE
end enum

type SDL_EnumerateDirectoryCallback as function(byval userdata as any ptr, byval dirname as const zstring ptr, byval fname as const zstring ptr) as SDL_EnumerationResult

declare function SDL_EnumerateDirectory(byval path as const zstring ptr, byval callback as SDL_EnumerateDirectoryCallback, byval userdata as any ptr) as boolean
declare function SDL_RemovePath(byval path as const zstring ptr) as boolean
declare function SDL_RenamePath(byval oldpath as const zstring ptr, byval newpath as const zstring ptr) as boolean
declare function SDL_CopyFile(byval oldpath as const zstring ptr, byval newpath as const zstring ptr) as boolean
declare function SDL_GetPathInfo(byval path as const zstring ptr, byval info as SDL_PathInfo ptr) as boolean
declare function SDL_GlobDirectory(byval path as const zstring ptr, byval pattern as const zstring ptr, byval flags as SDL_GlobFlags, byval count as long ptr) as zstring ptr ptr
declare function SDL_GetCurrentDirectory() as zstring ptr

end extern
