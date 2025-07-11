#pragma once

extern "C"

const SDL_MAJOR_VERSION = 3
const SDL_MINOR_VERSION = 2
const SDL_MICRO_VERSION = 16

#define SDL_VERSIONNUM(major, minor, patch) ((major) * 1000000 + (minor) * 1000 + (patch))
#define SDL_VERSIONNUM_MAJOR(version) ((version) / 1000000)
#define SDL_VERSIONNUM_MINOR(version) (((version) / 1000) mod 1000)
#define SDL_VERSIONNUM_MICRO(version) ((version) mod 1000)
#define SDL_VERSION SDL_VERSIONNUM(SDL_MAJOR_VERSION, SDL_MINOR_VERSION, SDL_MICRO_VERSION)
#define SDL_VERSION_ATLEAST(X, Y, Z) (SDL_VERSION >= SDL_VERSIONNUM(X, Y, Z))

declare function SDL_GetVersion() as long
declare function SDL_GetRevision() as const zstring ptr

end extern
