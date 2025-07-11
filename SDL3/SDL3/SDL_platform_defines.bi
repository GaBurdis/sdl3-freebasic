#pragma once

#ifdef __FB_FREEBSD__
	const SDL_PLATFORM_FREEBSD = 1
#endif

#ifdef __FB_LINUX__
	const SDL_PLATFORM_LINUX = 1
#endif

#ifdef __FB_ANDROID__
  const SDL_PLATFORM_ANDROID = 1
  #undef SDL_PLATFORM_LINUX
#endif

#ifdef __FB_UNIX__
	const SDL_PLATFORM_UNIX = 1
#endif

#ifdef __FB_DARWIN__
  const SDL_PLATFORM_APPLE = 1
#endif

#ifdef __EMSCRIPTEN__
  const SDL_PLATFORM_EMSCRIPTEN = 1
#endif

#ifdef __FB_NETBSD__
	const SDL_PLATFORM_NETBSD = 1
#endif

#ifdef __FB_OPENBSD__
	const SDL_PLATFORM_OPENBSD = 1
#endif

#ifdef __FB_CYGWIN__
	const SDL_PLATFORM_CYGWIN = 1
#endif

#if defined(__FB_WIN32__) orelse defined(SDL_PLATFORM_CYGWIN)
	const SDL_PLATFORM_WINDOWS = 1
	const SDL_PLATFORM_WIN32 = 1
#endif
