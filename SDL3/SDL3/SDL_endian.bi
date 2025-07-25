#pragma once

const SDL_LIL_ENDIAN = 1234
const SDL_BIG_ENDIAN = 4321

#ifndef SDL_BYTEORDER
  #ifdef SDL_WIKI_DOCUMENTATION_SECTION
    #define SDL_BYTEORDER   SDL_LIL_ENDIAN___or_maybe___SDL_BIG_ENDIAN
  #elseif defined (SDL_PLATFORM_LINUX)
    #include once "endian.bi"
    #define SDL_BYTEORDER  __BYTE_ORDER
  #elseif defined(SDL_PLATFORM_SOLARIS)
    #include once "sys/byteorder.bi"
    #if defined(_LITTLE_ENDIAN)
      #define SDL_BYTEORDER   SDL_LIL_ENDIAN
    #elseif defined(_BIG_ENDIAN)
      #define SDL_BYTEORDER   SDL_BIG_ENDIAN
    #else
      #error Unsupported endianness
    #endif
  #elseif defined(SDL_PLATFORM_OPENBSD) or defined(__DragonFly__)
    #include once "endian.bi"
    #define SDL_BYTEORDER  BYTE_ORDER
  #elseif defined(SDL_PLATFORM_FREEBSD) or defined(SDL_PLATFORM_NETBSD)
    #include once "sys/endian.bi"
    #define SDL_BYTEORDER  BYTE_ORDER
  #elseif defined(__ORDER_LITTLE_ENDIAN__) and defined(__ORDER_BIG_ENDIAN__) and defined(__BYTE_ORDER__)
    #if (__BYTE_ORDER__ = __ORDER_LITTLE_ENDIAN__)
      #define SDL_BYTEORDER   SDL_LIL_ENDIAN
    #elseif (__BYTE_ORDER__ = __ORDER_BIG_ENDIAN__)
      #define SDL_BYTEORDER   SDL_BIG_ENDIAN
    #else
      #error Unsupported endianness
    #endif
  #else
    #if defined(__hppa__) or _
      defined(__m68k__) or defined(mc68000) or defined(_M_M68K) or _
      (defined(__MIPS__) and defined(__MIPSEB__)) or _
      defined(__ppc__) or defined(__POWERPC__) or defined(__powerpc__) or defined(__PPC__) or _
      defined(__sparc__) or defined(__sparc)
      #define SDL_BYTEORDER   SDL_BIG_ENDIAN
    #else
      #define SDL_BYTEORDER   SDL_LIL_ENDIAN
    #endif
  #endif
#endif

#ifndef SDL_FLOATWORDORDER
  #ifdef SDL_WIKI_DOCUMENTATION_SECTION
    #define SDL_FLOATWORDORDER   SDL_LIL_ENDIAN___or_maybe___SDL_BIG_ENDIAN
  #elseif defined(__ORDER_LITTLE_ENDIAN__) and defined(__ORDER_BIG_ENDIAN__) and defined(__FLOAT_WORD_ORDER__)
    #if (__FLOAT_WORD_ORDER__ = __ORDER_LITTLE_ENDIAN__)
      #define SDL_FLOATWORDORDER   SDL_LIL_ENDIAN
    #elseif (__FLOAT_WORD_ORDER__ = __ORDER_BIG_ENDIAN__)
      #define SDL_FLOATWORDORDER   SDL_BIG_ENDIAN
    #else
      #error Unsupported endianness
    #endif
  #elseif defined(__MAVERICK__)
    #define SDL_FLOATWORDORDER   SDL_LIL_ENDIAN
  #elseif (defined(__arm__) or defined(__thumb__)) and (not defined(__VFP_FP__)) and (not defined(__ARM_EABI__))
    #define SDL_FLOATWORDORDER   SDL_BIG_ENDIAN
  #else
    #define SDL_FLOATWORDORDER   SDL_BYTEORDER
  #endif
#endif

extern "C"

#if defined(__GNUC__) or defined(__clang__)
 #define HAS_BUILTIN_BSWAP16 (SDL_HAS_BUILTIN(__builtin_bswap16) orelse ((__GNUC__ > 4) orelse ((__GNUC__ = 4) andalso (__GNUC_MINOR__ >= 8))))
 #define HAS_BUILTIN_BSWAP32 (SDL_HAS_BUILTIN(__builtin_bswap32) orelse ((__GNUC__ > 4) orelse ((__GNUC__ = 4) andalso (__GNUC_MINOR__ >= 3))))
 #define HAS_BUILTIN_BSWAP64 (SDL_HAS_BUILTIN(__builtin_bswap64) orelse ((__GNUC__ > 4) orelse ((__GNUC__ = 4) andalso (__GNUC_MINOR__ >= 3))))
 #define HAS_BROKEN_BSWAP ((__GNUC__ = 2) andalso (__GNUC_MINOR__ <= 95))
#else
 #define HAS_BUILTIN_BSWAP16 0
 #define HAS_BUILTIN_BSWAP32 0
 #define HAS_BUILTIN_BSWAP64 0
 #define HAS_BROKEN_BSWAP 0
#endif

#define SDL_Swap16(x) __builtin_bswap16(x)
#define SDL_Swap32(x) __builtin_bswap32(x)
#define SDL_Swap64(x) __builtin_bswap64(x)

private function SDL_SwapFloat(byval x as single) as single
	union swapper
		f as single
		ui32 as Uint32
	end union
	dim swapper as swapper
	swapper.f = x
'	swapper.ui32 = SDL_Swap32(swapper.ui32)
	return swapper.f
end function

#undef HAS_BROKEN_BSWAP
#undef HAS_BUILTIN_BSWAP16
#undef HAS_BUILTIN_BSWAP32
#undef HAS_BUILTIN_BSWAP64

#ifdef SDL_WIKI_DOCUMENTATION_SECTION
 'TODO: SDL_FORCE_INLINE Uint16 SDL_Swap16(Uint16 x) { return x_but_byteswapped; }
 'TODO: SDL_FORCE_INLINE Uint32 SDL_Swap32(Uint32 x) { return x_but_byteswapped; }
 'TODO: SDL_FORCE_INLINE Uint64 SDL_Swap64(Uint64 x) { return x_but_byteswapped; }
 #define SDL_Swap16LE(x) SwapOnlyIfNecessary(x)
 #define SDL_Swap32LE(x) SwapOnlyIfNecessary(x)
 #define SDL_Swap64LE(x) SwapOnlyIfNecessary(x)
 #define SDL_SwapFloatLE(x) SwapOnlyIfNecessary(x)
 #define SDL_Swap16BE(x) SwapOnlyIfNecessary(x)
 #define SDL_Swap32BE(x) SwapOnlyIfNecessary(x)
 #define SDL_Swap64BE(x) SwapOnlyIfNecessary(x)
 #define SDL_SwapFloatBE(x) SwapOnlyIfNecessary(x)
 
#elseif SDL_BYTEORDER = SDL_LIL_ENDIAN
 #define SDL_Swap16LE(x)     (x)
 #define SDL_Swap32LE(x)     (x)
 #define SDL_Swap64LE(x)     (x)
 #define SDL_SwapFloatLE(x)  (x)
 #define SDL_Swap16BE(x)     SDL_Swap16(x)
 #define SDL_Swap32BE(x)     SDL_Swap32(x)
 #define SDL_Swap64BE(x)     SDL_Swap64(x)
 #define SDL_SwapFloatBE(x)  SDL_SwapFloat(x)
#else
 #define SDL_Swap16LE(x)     SDL_Swap16(x)
 #define SDL_Swap32LE(x)     SDL_Swap32(x)
 #define SDL_Swap64LE(x)     SDL_Swap64(x)
 #define SDL_SwapFloatLE(x)  SDL_SwapFloat(x)
 #define SDL_Swap16BE(x)     (x)
 #define SDL_Swap32BE(x)     (x)
 #define SDL_Swap64BE(x)     (x)
 #define SDL_SwapFloatBE(x)  (x)
#endif

end extern
