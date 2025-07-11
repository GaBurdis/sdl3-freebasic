#pragma once

extern "C"

type SDL_IOStatus as long
enum
	SDL_IO_STATUS_READY
	SDL_IO_STATUS_ERROR
	SDL_IO_STATUS_EOF
	SDL_IO_STATUS_NOT_READY
	SDL_IO_STATUS_READONLY
	SDL_IO_STATUS_WRITEONLY
end enum

type SDL_IOWhence as long
enum
	SDL_IO_SEEK_SET
	SDL_IO_SEEK_CUR
	SDL_IO_SEEK_END
end enum

type SDL_IOStreamInterface
	version as Uint32
	size as function(byval userdata as any ptr) as Sint64
	seek as function(byval userdata as any ptr, byval offset as Sint64, byval whence as SDL_IOWhence) as Sint64
	read as function(byval userdata as any ptr, byval ptr as any ptr, byval size as uinteger, byval status as SDL_IOStatus ptr) as uinteger
	write as function(byval userdata as any ptr, byval ptr as const any ptr, byval size as uinteger, byval status as SDL_IOStatus ptr) as uinteger
	flush as function(byval userdata as any ptr, byval status as SDL_IOStatus ptr) as boolean
	close as function(byval userdata as any ptr) as boolean
end type

type SDL_IOStream as _SDL_IOStream

declare function SDL_IOFromFile(byval file as const zstring ptr, byval mode as const zstring ptr) as SDL_IOStream ptr

#define SDL_PROP_IOSTREAM_WINDOWS_HANDLE_POINTER "SDL.iostream.windows.handle"
#define SDL_PROP_IOSTREAM_STDIO_FILE_POINTER "SDL.iostream.stdio.file"
#define SDL_PROP_IOSTREAM_FILE_DESCRIPTOR_NUMBER "SDL.iostream.file_descriptor"
#define SDL_PROP_IOSTREAM_ANDROID_AASSET_POINTER "SDL.iostream.android.aasset"

declare function SDL_IOFromMem(byval mem as any ptr, byval size as uinteger) as SDL_IOStream ptr

#define SDL_PROP_IOSTREAM_MEMORY_POINTER "SDL.iostream.memory.base"
#define SDL_PROP_IOSTREAM_MEMORY_SIZE_NUMBER "SDL.iostream.memory.size"

declare function SDL_IOFromConstMem(byval mem as const any ptr, byval size as uinteger) as SDL_IOStream ptr
declare function SDL_IOFromDynamicMem() as SDL_IOStream ptr

#define SDL_PROP_IOSTREAM_DYNAMIC_MEMORY_POINTER "SDL.iostream.dynamic.memory"
#define SDL_PROP_IOSTREAM_DYNAMIC_CHUNKSIZE_NUMBER "SDL.iostream.dynamic.chunksize"

declare function SDL_OpenIO(byval iface as const SDL_IOStreamInterface ptr, byval userdata as any ptr) as SDL_IOStream ptr
declare function SDL_CloseIO(byval context as SDL_IOStream ptr) as boolean
declare function SDL_GetIOProperties(byval context as SDL_IOStream ptr) as SDL_PropertiesID
declare function SDL_GetIOStatus(byval context as SDL_IOStream ptr) as SDL_IOStatus
declare function SDL_GetIOSize(byval context as SDL_IOStream ptr) as Sint64
declare function SDL_SeekIO(byval context as SDL_IOStream ptr, byval offset as Sint64, byval whence as SDL_IOWhence) as Sint64
declare function SDL_TellIO(byval context as SDL_IOStream ptr) as Sint64
declare function SDL_ReadIO(byval context as SDL_IOStream ptr, byval ptr as any ptr, byval size as uinteger) as uinteger
declare function SDL_WriteIO(byval context as SDL_IOStream ptr, byval ptr as const any ptr, byval size as uinteger) as uinteger
declare function SDL_IOprintf(byval context as SDL_IOStream ptr, byval fmt as const zstring ptr, ...) as uinteger
declare function SDL_IOvprintf(byval context as SDL_IOStream ptr, byval fmt as const zstring ptr, byval ap as va_list) as uinteger
declare function SDL_FlushIO(byval context as SDL_IOStream ptr) as boolean
declare function SDL_LoadFile_IO(byval src as SDL_IOStream ptr, byval datasize as uinteger ptr, byval closeio as boolean) as any ptr
declare function SDL_LoadFile(byval file as const zstring ptr, byval datasize as uinteger ptr) as any ptr
declare function SDL_SaveFile_IO(byval src as SDL_IOStream ptr, byval data as const any ptr, byval datasize as size_t, byval closeio as boolean) as boolean
declare function SDL_SaveFile(byval file as const zstring ptr, byval data as const any ptr, byval datasize as size_t) as boolean
declare function SDL_ReadU8(byval src as SDL_IOStream ptr, byval value as Uint8 ptr) as boolean
declare function SDL_ReadS8(byval src as SDL_IOStream ptr, byval value as Sint8 ptr) as boolean
declare function SDL_ReadU16LE(byval src as SDL_IOStream ptr, byval value as Uint16 ptr) as boolean
declare function SDL_ReadS16LE(byval src as SDL_IOStream ptr, byval value as Sint16 ptr) as boolean
declare function SDL_ReadU16BE(byval src as SDL_IOStream ptr, byval value as Uint16 ptr) as boolean
declare function SDL_ReadS16BE(byval src as SDL_IOStream ptr, byval value as Sint16 ptr) as boolean
declare function SDL_ReadU32LE(byval src as SDL_IOStream ptr, byval value as Uint32 ptr) as boolean
declare function SDL_ReadS32LE(byval src as SDL_IOStream ptr, byval value as Sint32 ptr) as boolean
declare function SDL_ReadU32BE(byval src as SDL_IOStream ptr, byval value as Uint32 ptr) as boolean
declare function SDL_ReadS32BE(byval src as SDL_IOStream ptr, byval value as Sint32 ptr) as boolean
declare function SDL_ReadU64LE(byval src as SDL_IOStream ptr, byval value as Uint64 ptr) as boolean
declare function SDL_ReadS64LE(byval src as SDL_IOStream ptr, byval value as Sint64 ptr) as boolean
declare function SDL_ReadU64BE(byval src as SDL_IOStream ptr, byval value as Uint64 ptr) as boolean
declare function SDL_ReadS64BE(byval src as SDL_IOStream ptr, byval value as Sint64 ptr) as boolean
declare function SDL_WriteU8(byval dst as SDL_IOStream ptr, byval value as Uint8) as boolean
declare function SDL_WriteS8(byval dst as SDL_IOStream ptr, byval value as Sint8) as boolean
declare function SDL_WriteU16LE(byval dst as SDL_IOStream ptr, byval value as Uint16) as boolean
declare function SDL_WriteS16LE(byval dst as SDL_IOStream ptr, byval value as Sint16) as boolean
declare function SDL_WriteU16BE(byval dst as SDL_IOStream ptr, byval value as Uint16) as boolean
declare function SDL_WriteS16BE(byval dst as SDL_IOStream ptr, byval value as Sint16) as boolean
declare function SDL_WriteU32LE(byval dst as SDL_IOStream ptr, byval value as Uint32) as boolean
declare function SDL_WriteS32LE(byval dst as SDL_IOStream ptr, byval value as Sint32) as boolean
declare function SDL_WriteU32BE(byval dst as SDL_IOStream ptr, byval value as Uint32) as boolean
declare function SDL_WriteS32BE(byval dst as SDL_IOStream ptr, byval value as Sint32) as boolean
declare function SDL_WriteU64LE(byval dst as SDL_IOStream ptr, byval value as Uint64) as boolean
declare function SDL_WriteS64LE(byval dst as SDL_IOStream ptr, byval value as Sint64) as boolean
declare function SDL_WriteU64BE(byval dst as SDL_IOStream ptr, byval value as Uint64) as boolean
declare function SDL_WriteS64BE(byval dst as SDL_IOStream ptr, byval value as Sint64) as boolean

end extern
