#pragma once

extern "C"

type SDL_AsyncIO as SDL_AsyncIO_

type SDL_AsyncIOTaskType as long
enum
    SDL_ASYNCIO_TASK_READ
    SDL_ASYNCIO_TASK_WRITE
    SDL_ASYNCIO_TASK_CLOSE
end enum

type SDL_AsyncIOResult as long
enum
    SDL_ASYNCIO_COMPLETE
    SDL_ASYNCIO_FAILURE
    SDL_ASYNCIO_CANCELED
end enum

type SDL_AsyncIOOutcome
    as SDL_AsyncIO ptr asyncio
    as SDL_AsyncIOTaskType type
    as SDL_AsyncIOResult result
    as any ptr buffer
    as Uint64 offset
    as Uint64 bytes_requested
    as Uint64 bytes_transferred
    as any ptr userdata
end type

type SDL_AsyncIOQueue as SDL_AsyncIOQueue_

declare function SDL_AsyncIOFromFile(byval file as const zstring ptr, byval mode as const zstring ptr) as SDL_AsyncIO ptr
declare function SDL_GetAsyncIOSize(byval asyncio as SDL_AsyncIO ptr) as Sint64
declare function SDL_ReadAsyncIO(byval asyncio as SDL_AsyncIO ptr, byval ptr_ as any ptr, byval offset as Uint64, byval size as Uint64, byval queue as SDL_AsyncIOQueue ptr, byval userdata as any ptr) as boolean
declare function SDL_WriteAsyncIO(byval asyncio as SDL_AsyncIO ptr, byval ptr_ as any ptr, byval offset as Uint64, byval size as Uint64, byval queue as SDL_AsyncIOQueue ptr, byval userdata as any ptr) as boolean
declare function SDL_CloseAsyncIO(byval asyncio as SDL_AsyncIO ptr, byval flush as boolean, byval queue as SDL_AsyncIOQueue ptr, byval userdata as any ptr) as boolean
declare function SDL_CreateAsyncIOQueue() as SDL_AsyncIOQueue ptr
declare sub SDL_DestroyAsyncIOQueue(byval queue as SDL_AsyncIOQueue ptr)
declare function SDL_GetAsyncIOResult(byval queue as SDL_AsyncIOQueue ptr, byval outcome as SDL_AsyncIOOutcome ptr) as boolean
declare function SDL_WaitAsyncIOResult(byval queue as SDL_AsyncIOQueue ptr, byval outcome as SDL_AsyncIOOutcome ptr, byval timeoutMS as Sint32) as boolean
declare sub SDL_SignalAsyncIOQueue(byval queue as SDL_AsyncIOQueue ptr)
declare function SDL_LoadFileAsync(byval file as const zstring ptr, byval queue as SDL_AsyncIOQueue ptr, byval userdata as any ptr) as boolean

end extern
