#pragma once

extern "C"

type SDL_StorageInterface
	version as Uint32
	close as function(byval userdata as any ptr) as boolean
	ready as function(byval userdata as any ptr) as boolean
	enumerate as function(byval userdata as any ptr, byval path as const zstring ptr, byval callback as SDL_EnumerateDirectoryCallback, byval callback_userdata as any ptr) as boolean
	info as function(byval userdata as any ptr, byval path as const zstring ptr, byval info as SDL_PathInfo ptr) as boolean
	read_file as function(byval userdata as any ptr, byval path as const zstring ptr, byval destination as any ptr, byval length as Uint64) as boolean
	write_file as function(byval userdata as any ptr, byval path as const zstring ptr, byval source as const any ptr, byval length as Uint64) as boolean
	mkdir as function(byval userdata as any ptr, byval path as const zstring ptr) as boolean
	remove as function(byval userdata as any ptr, byval path as const zstring ptr) as boolean
	rename as function(byval userdata as any ptr, byval oldpath as const zstring ptr, byval newpath as const zstring ptr) as boolean
	copy as function(byval userdata as any ptr, byval oldpath as const zstring ptr, byval newpath as const zstring ptr) as boolean
	space_remaining as function(byval userdata as any ptr) as Uint64
end type

type SDL_Storage as _SDL_Storage

declare function SDL_OpenTitleStorage(byval override as const zstring ptr, byval props as SDL_PropertiesID) as SDL_Storage ptr
declare function SDL_OpenUserStorage(byval org as const zstring ptr, byval app as const zstring ptr, byval props as SDL_PropertiesID) as SDL_Storage ptr
declare function SDL_OpenFileStorage(byval path as const zstring ptr) as SDL_Storage ptr
declare function SDL_OpenStorage(byval iface as const SDL_StorageInterface ptr, byval userdata as any ptr) as SDL_Storage ptr
declare function SDL_CloseStorage(byval storage as SDL_Storage ptr) as boolean
declare function SDL_StorageReady(byval storage as SDL_Storage ptr) as boolean
declare function SDL_GetStorageFileSize(byval storage as SDL_Storage ptr, byval path as const zstring ptr, byval length as Uint64 ptr) as boolean
declare function SDL_ReadStorageFile(byval storage as SDL_Storage ptr, byval path as const zstring ptr, byval destination as any ptr, byval length as Uint64) as boolean
declare function SDL_WriteStorageFile(byval storage as SDL_Storage ptr, byval path as const zstring ptr, byval source as const any ptr, byval length as Uint64) as boolean
declare function SDL_CreateStorageDirectory(byval storage as SDL_Storage ptr, byval path as const zstring ptr) as boolean
declare function SDL_EnumerateStorageDirectory(byval storage as SDL_Storage ptr, byval path as const zstring ptr, byval callback as SDL_EnumerateDirectoryCallback, byval userdata as any ptr) as boolean
declare function SDL_RemoveStoragePath(byval storage as SDL_Storage ptr, byval path as const zstring ptr) as boolean
declare function SDL_RenameStoragePath(byval storage as SDL_Storage ptr, byval oldpath as const zstring ptr, byval newpath as const zstring ptr) as boolean
declare function SDL_CopyStorageFile(byval storage as SDL_Storage ptr, byval oldpath as const zstring ptr, byval newpath as const zstring ptr) as boolean
declare function SDL_GetStoragePathInfo(byval storage as SDL_Storage ptr, byval path as const zstring ptr, byval info as SDL_PathInfo ptr) as boolean
declare function SDL_GetStorageSpaceRemaining(byval storage as SDL_Storage ptr) as Uint64
declare function SDL_GlobStorageDirectory(byval storage as SDL_Storage ptr, byval path as const zstring ptr, byval pattern as const zstring ptr, byval flags as SDL_GlobFlags, byval count as long ptr) as zstring ptr ptr

end extern
