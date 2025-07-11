#pragma once


'#include once "crt/long.bi"
'#include once "crt/stdarg.bi"
'#include once "crt/stdint.bi"
'#include once "crt/string.bi"
#include once "crt/wchar.bi"

'#if (defined(__STDC_VERSION__) and __STDC_VERSION__ >= 199901L) or defined(SDL_INCLUDE_INTTYPES_H)
' #include "inttypes.bi"
'#endif

'#include once "crt/sys/types.bi"

'#ifndef SDL_DISABLE_ALLOCA
'  #ifndef alloca
'    #ifdef HAVE_ALLOCA_H
      '#include <alloca.h>
'    #elseif defined(SDL_PLATFORM_NETBSD)
'      #if defined(__STRICT_ANSI__)
'        #define SDL_DISABLE_ALLOCA
      '#else
        '#include once "crt/stdlib.bi"
'      #endif
'    #elseif defined(__GNUC__)
'      #define alloca __builtin_alloca
    '#else
      'void *alloca(size_t);
'    #endif
'  #endif
'#endif

#ifdef SDL_WIKI_DOCUMENTATION_SECTION
  #define SDL_NOLONGLONG 1
#endif

#ifdef SDL_WIKI_DOCUMENTATION_SECTION
  #define SDL_SIZE_MAX SIZE_MAX
#elseif defined(SIZE_MAX)
  #define SDL_SIZE_MAX SIZE_MAX
#else
  #define SDL_SIZE_MAX ((size_t) -1)
#endif

#ifndef SDL_COMPILE_TIME_ASSERT
  #ifdef SDL_WIKI_DOCUMENTATION_SECTION
    #define SDL_COMPILE_TIME_ASSERT(name, x) FailToCompileIf_x_IsFalse(x)
  #endif
#endif

'#ifndef SDL_COMPILE_TIME_ASSERT
'' TODO: #define SDL_COMPILE_TIME_ASSERT(name, x) typedef int SDL_compile_time_assert_ ## name[(x) * 2 - 1]
'#endif

#define SDL_arraysize(array) (sizeof(array)/sizeof(@array(0)))

#define SDL_STRINGIFY_ARG(arg) #arg

#define SDL_reinterpret_cast(type, expression) type(expression)
#define SDL_static_cast(type, expression) type(expression)
#define SDL_const_cast(type, expression) type(expression)

#define SDL_FOURCC(A, B, C, D) _
      ((((SDL_static_cast(Uint32, SDL_static_cast(Uint8, (A))) shl 0) or _
         (SDL_static_cast(Uint32, SDL_static_cast(Uint8, (B))) shl 8)) or _
         (SDL_static_cast(Uint32, SDL_static_cast(Uint8, (C))) shl 16)) or _
         (SDL_static_cast(Uint32, SDL_static_cast(Uint8, (D))) shl 24))

#ifndef SDL_SINT64_C
  #if defined(INT64_C)
    #define SDL_SINT64_C(c)  INT64_C(c)
  #elseif defined(_MSC_VER)
    #define SDL_SINT64_C(c)  c##i64
  #elseif defined(__FB_64BIT__)
    #define SDL_SINT64_C(c)  c##L
  #else
    #define SDL_SINT64_C(c)  c##LL
  #endif
#endif

#ifndef SDL_UINT64_C
  #if defined(UINT64_C)
    #define SDL_UINT64_C(c)  UINT64_C(c)
  #elseif defined(_MSC_VER)
    #define SDL_UINT64_C(c)  c##ui64
  #elseif defined(__FB_64BIT__)
    #define SDL_UINT64_C(c)  c##UL
  #else
    #define SDL_UINT64_C(c)  c##ULL
  #endif
#endif

type Sint8 as byte
const SDL_MAX_SINT8 = cast(Sint8, &h7F)
const SDL_MIN_SINT8 = cast(Sint8, not &h7F)

type Uint8 as ubyte
const SDL_MAX_UINT8 = cast(Uint8, &hFF)
const SDL_MIN_UINT8 = cast(Uint8, &h00)

type Sint16 as short
const SDL_MAX_SINT16 = cast(Sint16, &h7FFF)
const SDL_MIN_SINT16 = cast(Sint16, not &h7FFF)

type Uint16 as ushort
const SDL_MAX_UINT16 = cast(Uint16, &hFFFF)
const SDL_MIN_UINT16 = cast(Uint16, &h0000)

type Sint32 as long
const SDL_MAX_SINT32 = cast(Sint32, &h7FFFFFFF)
const SDL_MIN_SINT32 = cast(Sint32, not &h7FFFFFFF)

type Uint32 as ulong
const SDL_MAX_UINT32 = cast(Uint32, &hFFFFFFFFu)
const SDL_MIN_UINT32 = cast(Uint32, &h00000000)

type Sint64 as longint
#define SDL_MAX_SINT64 SDL_SINT64_C(&h7FFFFFFFFFFFFFFF)
#define SDL_MIN_SINT64 (not SDL_SINT64_C(&h7FFFFFFFFFFFFFFF))

type Uint64 as ulongint
#define SDL_MAX_UINT64 SDL_UINT64_C(&hFFFFFFFFFFFFFFFF)
#define SDL_MIN_UINT64 SDL_UINT64_C(&h0000000000000000)

type SDL_Time as Sint64
#define SDL_MAX_TIME SDL_MAX_SINT64
#define SDL_MIN_TIME SDL_MIN_SINT64

#ifdef FLT_EPSILON
  #define SDL_FLT_EPSILON FLT_EPSILON
#else
  const SDL_FLT_EPSILON = 1.1920928955078125e-07f
#endif

#ifndef SDL_PRIs64
  #if defined(SDL_PLATFORM_WINDOWS)
    #define SDL_PRIs64 "I64d"
  #elseif defined(PRIs64)
    #define SDL_PRIs64 PRIs64
  #elseif defined(__FB_64BIT__) and (not defined(SDL_PLATFORM_APPLE)) and (not defined(__EMSCRIPTEN__))
    #define SDL_PRIs64 "ld"
  #else
    #define SDL_PRIs64 "lld"
  #endif
#endif
#ifndef SDL_PRIu64
  #if defined(SDL_PLATFORM_WINDOWS)
    #define SDL_PRIu64 "I64u"
  #elseif defined(PRIu64)
    #define SDL_PRIu64 PRIu64
  #elseif defined(__FB_64BIT__) and (not defined(SDL_PLATFORM_APPLE)) and (not defined(__EMSCRIPTEN__))
    #define SDL_PRIu64 "lu"
  #else
    #define SDL_PRIu64 "llu"
  #endif
#endif
#ifndef SDL_PRIx64
  #if defined(SDL_PLATFORM_WINDOWS)
    #define SDL_PRIx64 "I64x"
  #elseif defined(PRIx64)
    #define SDL_PRIx64 PRIx64
  #elseif defined(__FB_64BIT__) and (not defined(SDL_PLATFORM_APPLE))
    #define SDL_PRIx64 "lx"
  #else
    #define SDL_PRIx64 "llx"
  #endif
#endif
#ifndef SDL_PRIX64
  #if defined(SDL_PLATFORM_WINDOWS)
    #define SDL_PRIX64 "I64X"
  #elseif defined(PRIX64)
    #define SDL_PRIX64 PRIX64
  #elseif defined(__FB_64BIT__) and (not defined(SDL_PLATFORM_APPLE))
    #define SDL_PRIX64 "lX"
  #else
    #define SDL_PRIX64 "llX"
  #endif
#endif
#ifndef SDL_PRIs32
  #ifdef PRId32
    #define SDL_PRIs32 PRId32
  #else
    #define SDL_PRIs32 "d"
  #endif
#endif
#ifndef SDL_PRIu32
  #ifdef PRIu32
    #define SDL_PRIu32 PRIu32
  #else
    #define SDL_PRIu32 "u"
  #endif
#endif
#ifndef SDL_PRIx32
  #ifdef PRIx32
    #define SDL_PRIx32 PRIx32
  #else
    #define SDL_PRIx32 "x"
  #endif
#endif
#ifndef SDL_PRIX32
  #ifdef PRIX32
    #define SDL_PRIX32 PRIX32
  #else
    #define SDL_PRIX32 "X"
  #endif
#endif

#ifdef SDL_PLATFORM_WINDOWS
'' TODO: SDL_COMPILE_TIME_ASSERT(longlong_size64, sizeof(long long) == 8)
  #define SDL_PRILL_PREFIX "I64"
#else
  #define SDL_PRILL_PREFIX "ll"
#endif
#ifndef SDL_PRILLd
  #define SDL_PRILLd SDL_PRILL_PREFIX "d"
#endif
#ifndef SDL_PRILLu
  #define SDL_PRILLu SDL_PRILL_PREFIX "u"
#endif
#ifndef SDL_PRILLx
  #define SDL_PRILLx SDL_PRILL_PREFIX "x"
#endif
#ifndef SDL_PRILLX
  #define SDL_PRILLX SDL_PRILL_PREFIX "X"
#endif

#ifdef SDL_DISABLE_ANALYZE_MACROS
  #define SDL_IN_BYTECAP(x)
  #define SDL_INOUT_Z_CAP(x)
  #define SDL_OUT_Z_CAP(x)
  #define SDL_OUT_CAP(x)
  #define SDL_OUT_BYTECAP(x)
  #define SDL_OUT_Z_BYTECAP(x)
  #define SDL_PRINTF_FORMAT_STRING
  #define SDL_SCANF_FORMAT_STRING
  #define SDL_PRINTF_VARARG_FUNC( fmtargnumber )
  #define SDL_PRINTF_VARARG_FUNCV( fmtargnumber )
  #define SDL_SCANF_VARARG_FUNC( fmtargnumber )
  #define SDL_SCANF_VARARG_FUNCV( fmtargnumber )
  #define SDL_WPRINTF_VARARG_FUNC( fmtargnumber )
  #define SDL_WPRINTF_VARARG_FUNCV( fmtargnumber )
#else
  #define SDL_IN_BYTECAP(x)
  #define SDL_INOUT_Z_CAP(x)
  #define SDL_OUT_Z_CAP(x)
  #define SDL_OUT_CAP(x)
  #define SDL_OUT_BYTECAP(x)
  #define SDL_OUT_Z_BYTECAP(x)
  #define SDL_PRINTF_FORMAT_STRING
  #define SDL_SCANF_FORMAT_STRING
  #if defined(__GNUC__) or defined(__clang__)
    #define SDL_PRINTF_VARARG_FUNC( fmtargnumber ) __attribute__ (( format( __printf__, fmtargnumber, fmtargnumber+1 )))
    #define SDL_PRINTF_VARARG_FUNCV( fmtargnumber ) __attribute__(( format( __printf__, fmtargnumber, 0 )))
    #define SDL_SCANF_VARARG_FUNC( fmtargnumber ) __attribute__ (( format( __scanf__, fmtargnumber, fmtargnumber+1 )))
    #define SDL_SCANF_VARARG_FUNCV( fmtargnumber ) __attribute__(( format( __scanf__, fmtargnumber, 0 )))
    #define SDL_WPRINTF_VARARG_FUNC( fmtargnumber )
    #define SDL_WPRINTF_VARARG_FUNCV( fmtargnumber ) 
  #else
    #define SDL_PRINTF_VARARG_FUNC( fmtargnumber )
    #define SDL_PRINTF_VARARG_FUNCV( fmtargnumber )
    #define SDL_SCANF_VARARG_FUNC( fmtargnumber )
    #define SDL_SCANF_VARARG_FUNCV( fmtargnumber )
    #define SDL_WPRINTF_VARARG_FUNC( fmtargnumber )
    #define SDL_WPRINTF_VARARG_FUNCV( fmtargnumber )
   #endif
#endif

#ifndef DOXYGEN_SHOULD_IGNORE_THIS
'' TODO: SDL_COMPILE_TIME_ASSERT(bool_size, sizeof(boolean) == 1);
'' TODO: SDL_COMPILE_TIME_ASSERT(uint8_size, sizeof(Uint8) == 1);
'' TODO: SDL_COMPILE_TIME_ASSERT(sint8_size, sizeof(Sint8) == 1);
'' TODO: SDL_COMPILE_TIME_ASSERT(uint16_size, sizeof(Uint16) == 2);
'' TODO: SDL_COMPILE_TIME_ASSERT(sint16_size, sizeof(Sint16) == 2);
'' TODO: SDL_COMPILE_TIME_ASSERT(uint32_size, sizeof(Uint32) == 4);
'' TODO: SDL_COMPILE_TIME_ASSERT(sint32_size, sizeof(Sint32) == 4);
'' TODO: SDL_COMPILE_TIME_ASSERT(uint64_size, sizeof(Uint64) == 8);
'' TODO: SDL_COMPILE_TIME_ASSERT(sint64_size, sizeof(Sint64) == 8);
'' TODO: SDL_COMPILE_TIME_ASSERT(uint64_longlong, sizeof(Uint64) <= sizeof(unsigned long long));
'' TODO: SDL_COMPILE_TIME_ASSERT(size_t_longlong, sizeof(size_t) <= sizeof(unsigned long long));
type SDL_alignment_test
	a as Uint8
	b as any ptr
end type
'' TODO: SDL_COMPILE_TIME_ASSERT(struct_alignment, sizeof(SDL_alignment_test) == (2 * sizeof(void *)));
'' TODO: SDL_COMPILE_TIME_ASSERT(two_s_complement, (int)~(int)0 == (int)(-1));
#endif

#ifndef DOXYGEN_SHOULD_IGNORE_THIS
  #if (not defined(SDL_PLATFORM_VITA)) and (not defined(SDL_PLATFORM_3DS))
  type SDL_DUMMY_ENUM as long
  enum
  	DUMMY_ENUM_VALUE
  end enum
  '' TODO: SDL_COMPILE_TIME_ASSERT(enum, sizeof(SDL_DUMMY_ENUM) == sizeof(int));
  #endif
#endif

extern "C"

#macro SDL_INIT_INTERFACE(iface)
	scope
		SDL_zerop(iface)
		(iface)->version = sizeof(*(iface))
	end scope
#endmacro

#ifndef SDL_DISABLE_ALLOCA
  #define SDL_stack_alloc(type, count)    cptr(type ptr, alloca(sizeof(type) * (count)))
  #define SDL_stack_free(data)
#else
  #define SDL_stack_alloc(type, count)    cptr(type ptr, SDL_malloc(sizeof(type) * (count)))
  #define SDL_stack_free(data)            SDL_free(data)
#endif

declare function SDL_malloc(byval size as uinteger) as any ptr
declare function SDL_calloc(byval nmemb as uinteger, byval size as uinteger) as any ptr
declare function SDL_realloc(byval mem as any ptr, byval size as uinteger) as any ptr
declare sub SDL_free(byval mem as any ptr)

type SDL_malloc_func as function(byval size as uinteger) as any ptr
type SDL_calloc_func as function(byval nmemb as uinteger, byval size as uinteger) as any ptr
type SDL_realloc_func as function(byval mem as any ptr, byval size as uinteger) as any ptr
type SDL_free_func as sub(byval mem as any ptr)

declare sub SDL_GetOriginalMemoryFunctions(byval malloc_func as SDL_malloc_func ptr, byval calloc_func as SDL_calloc_func ptr, byval realloc_func as SDL_realloc_func ptr, byval free_func as SDL_free_func ptr)
declare sub SDL_GetMemoryFunctions(byval malloc_func as SDL_malloc_func ptr, byval calloc_func as SDL_calloc_func ptr, byval realloc_func as SDL_realloc_func ptr, byval free_func as SDL_free_func ptr)
declare function SDL_SetMemoryFunctions(byval malloc_func as SDL_malloc_func, byval calloc_func as SDL_calloc_func, byval realloc_func as SDL_realloc_func, byval free_func as SDL_free_func) as boolean
declare function SDL_aligned_alloc(byval alignment as uinteger, byval size as uinteger) as any ptr
declare sub SDL_aligned_free(byval mem as any ptr)
declare function SDL_GetNumAllocations() as long

type SDL_Environment as _SDL_Environment

declare function SDL_GetEnvironment() as SDL_Environment ptr
declare function SDL_CreateEnvironment(byval populated as boolean) as SDL_Environment ptr
declare function SDL_GetEnvironmentVariable(byval env as SDL_Environment ptr, byval name as const zstring ptr) as const zstring ptr
declare function SDL_GetEnvironmentVariables(byval env as SDL_Environment ptr) as zstring ptr ptr
declare function SDL_SetEnvironmentVariable(byval env as SDL_Environment ptr, byval name as const zstring ptr, byval value as const zstring ptr, byval overwrite as boolean) as boolean
declare function SDL_UnsetEnvironmentVariable(byval env as SDL_Environment ptr, byval name as const zstring ptr) as boolean
declare sub SDL_DestroyEnvironment(byval env as SDL_Environment ptr)
declare function SDL_getenv(byval name as const zstring ptr) as const zstring ptr
declare function SDL_getenv_unsafe(byval name as const zstring ptr) as const zstring ptr
declare function SDL_setenv_unsafe(byval name as const zstring ptr, byval value as const zstring ptr, byval overwrite as long) as long
declare function SDL_unsetenv_unsafe(byval name as const zstring ptr) as long

type SDL_CompareCallback as function(byval a as const any ptr, byval b as const any ptr) as long

declare sub SDL_qsort(byval base as any ptr, byval nmemb as uinteger, byval size as uinteger, byval compare as SDL_CompareCallback)
declare function SDL_bsearch(byval key as const any ptr, byval base as const any ptr, byval nmemb as uinteger, byval size as uinteger, byval compare as SDL_CompareCallback) as any ptr

type SDL_CompareCallback_r as function(byval userdata as any ptr, byval a as const any ptr, byval b as const any ptr) as long

declare sub SDL_qsort_r(byval base as any ptr, byval nmemb as uinteger, byval size as uinteger, byval compare as SDL_CompareCallback_r, byval userdata as any ptr)
declare function SDL_bsearch_r(byval key as const any ptr, byval base as const any ptr, byval nmemb as uinteger, byval size as uinteger, byval compare as SDL_CompareCallback_r, byval userdata as any ptr) as any ptr
declare function SDL_abs(byval x as long) as long

#define SDL_min(x, y) iif((x) < (y), (x), (y))
#define SDL_max(x, y) iif((x) > (y), (x), (y))
#define SDL_clamp(x, a, b) iif((x) < (a), (a), iif((x) > (b), (b), (x)))

declare function SDL_isalpha(byval x as long) as long
declare function SDL_isalnum(byval x as long) as long
declare function SDL_isblank(byval x as long) as long
declare function SDL_iscntrl(byval x as long) as long
declare function SDL_isdigit(byval x as long) as long
declare function SDL_isxdigit(byval x as long) as long
declare function SDL_ispunct(byval x as long) as long
declare function SDL_isspace(byval x as long) as long
declare function SDL_isupper(byval x as long) as long
declare function SDL_islower(byval x as long) as long
declare function SDL_isprint(byval x as long) as long
declare function SDL_isgraph(byval x as long) as long
declare function SDL_toupper(byval x as long) as long
declare function SDL_tolower(byval x as long) as long

declare function SDL_crc16(byval crc as Uint16, byval data as const any ptr, byval len as uinteger) as Uint16
declare function SDL_crc32(byval crc as Uint32, byval data as const any ptr, byval len as uinteger) as Uint32
declare function SDL_murmur3_32(byval data as const any ptr, byval len as uinteger, byval seed as Uint32) as Uint32

declare function SDL_memcpy(byval dst as any ptr, byval src as const any ptr, byval len as uinteger) as any ptr

#ifndef SDL_SLOW_MEMCPY
  #ifdef SDL_memcpy
    #undef SDL_memcpy
  #endif
  #define SDL_memcpy  memcpy
#endif

'' TODO: #define SDL_copyp(dst, src) { SDL_COMPILE_TIME_ASSERT(SDL_copyp, sizeof (*(dst)) == sizeof (*(src))); } SDL_memcpy((dst), (src), sizeof(*(src)))

declare function SDL_memmove(byval dst as any ptr, byval src as const any ptr, byval len as uinteger) as any ptr
#ifndef SDL_SLOW_MEMMOVE
  #ifdef SDL_memmove
    #undef SDL_memmove
  #endif
  #define SDL_memmove memmove
#endif

declare function SDL_memset(byval dst as any ptr, byval c as long, byval len as uinteger) as any ptr
declare function SDL_memset4(byval dst as any ptr, byval val as Uint32, byval dwords as uinteger) as any ptr

#ifndef SDL_SLOW_MEMSET
  #ifdef SDL_memset
    #undef SDL_memset
  #endif
  #define SDL_memset  memset
#endif

#define SDL_zero(x) SDL_memset(@(x), 0, sizeof(x))
#define SDL_zerop(x) SDL_memset((x), 0, sizeof(*(x)))
#define SDL_zeroa(x) SDL_memset((x), 0, sizeof(x))

declare function SDL_memcmp(byval s1 as const any ptr, byval s2 as const any ptr, byval len as uinteger) as long
declare function SDL_wcslen(byval wstr as const wstring ptr) as uinteger
declare function SDL_wcsnlen(byval wstr as const wstring ptr, byval maxlen as uinteger) as uinteger

declare function SDL_wcslcpy(byval dst as wstring ptr, byval src as const wstring ptr, byval maxlen as uinteger) as uinteger
declare function SDL_wcslcat(byval dst as wstring ptr, byval src as const wstring ptr, byval maxlen as uinteger) as uinteger
declare function SDL_wcsdup(byval wstr as const wstring ptr) as wstring ptr
declare function SDL_wcsstr(byval haystack as const wstring ptr, byval needle as const wstring ptr) as wstring ptr
declare function SDL_wcsnstr(byval haystack as const wstring ptr, byval needle as const wstring ptr, byval maxlen as uinteger) as wstring ptr
declare function SDL_wcscmp(byval str1 as const wstring ptr, byval str2 as const wstring ptr) as long
declare function SDL_wcsncmp(byval str1 as const wstring ptr, byval str2 as const wstring ptr, byval maxlen as uinteger) as long
declare function SDL_wcscasecmp(byval str1 as const wstring ptr, byval str2 as const wstring ptr) as long
declare function SDL_wcsncasecmp(byval str1 as const wstring ptr, byval str2 as const wstring ptr, byval maxlen as uinteger) as long
declare function SDL_wcstol(byval str as const wstring ptr, byval endp as wstring ptr ptr, byval base as long) as clong
declare function SDL_strlen(byval str as const zstring ptr) as uinteger
declare function SDL_strnlen(byval str as const zstring ptr, byval maxlen as uinteger) as uinteger
declare function SDL_strlcpy(byval dst as zstring ptr, byval src as const zstring ptr, byval maxlen as uinteger) as uinteger
declare function SDL_utf8strlcpy(byval dst as zstring ptr, byval src as const zstring ptr, byval dst_bytes as uinteger) as uinteger
declare function SDL_strlcat(byval dst as zstring ptr, byval src as const zstring ptr, byval maxlen as uinteger) as uinteger
declare function SDL_strdup(byval str as const zstring ptr) as zstring ptr
declare function SDL_strndup(byval str as const zstring ptr, byval maxlen as uinteger) as zstring ptr
declare function SDL_strrev(byval str as zstring ptr) as zstring ptr
declare function SDL_strupr(byval str as zstring ptr) as zstring ptr
declare function SDL_strlwr(byval str as zstring ptr) as zstring ptr

declare function SDL_strchr(byval str as const zstring ptr, byval c as long) as zstring ptr
declare function SDL_strrchr(byval str as const zstring ptr, byval c as long) as zstring ptr
declare function SDL_strstr(byval haystack as const zstring ptr, byval needle as const zstring ptr) as zstring ptr
declare function SDL_strnstr(byval haystack as const zstring ptr, byval needle as const zstring ptr, byval maxlen as uinteger) as zstring ptr
declare function SDL_strcasestr(byval haystack as const zstring ptr, byval needle as const zstring ptr) as zstring ptr
declare function SDL_strtok_r(byval s1 as zstring ptr, byval s2 as const zstring ptr, byval saveptr as zstring ptr ptr) as zstring ptr
declare function SDL_utf8strlen(byval str as const zstring ptr) as uinteger
declare function SDL_utf8strnlen(byval str as const zstring ptr, byval bytes as uinteger) as uinteger

declare function SDL_itoa(byval value as long, byval str as zstring ptr, byval radix as long) as zstring ptr
declare function SDL_uitoa(byval value as ulong, byval str as zstring ptr, byval radix as long) as zstring ptr
declare function SDL_ltoa(byval value as clong, byval str as zstring ptr, byval radix as long) as zstring ptr
declare function SDL_ultoa(byval value as culong, byval str as zstring ptr, byval radix as long) as zstring ptr
declare function SDL_lltoa(byval value as longint, byval str as zstring ptr, byval radix as long) as zstring ptr
declare function SDL_ulltoa(byval value as ulongint, byval str as zstring ptr, byval radix as long) as zstring ptr

declare function SDL_atoi(byval str as const zstring ptr) as long
declare function SDL_atof(byval str as const zstring ptr) as double
declare function SDL_strtol(byval str as const zstring ptr, byval endp as zstring ptr ptr, byval base as long) as clong
declare function SDL_strtoul(byval str as const zstring ptr, byval endp as zstring ptr ptr, byval base as long) as culong
declare function SDL_strtoll(byval str as const zstring ptr, byval endp as zstring ptr ptr, byval base as long) as longint
declare function SDL_strtoull(byval str as const zstring ptr, byval endp as zstring ptr ptr, byval base as long) as ulongint
declare function SDL_strtod(byval str as const zstring ptr, byval endp as zstring ptr ptr) as double
declare function SDL_strcmp(byval str1 as const zstring ptr, byval str2 as const zstring ptr) as long
declare function SDL_strncmp(byval str1 as const zstring ptr, byval str2 as const zstring ptr, byval maxlen as uinteger) as long
declare function SDL_strcasecmp(byval str1 as const zstring ptr, byval str2 as const zstring ptr) as long
declare function SDL_strncasecmp(byval str1 as const zstring ptr, byval str2 as const zstring ptr, byval maxlen as uinteger) as long
declare function SDL_strpbrk(byval str as const zstring ptr, byval breakset as const zstring ptr) as zstring ptr

const SDL_INVALID_UNICODE_CODEPOINT = &hFFFD

declare function SDL_StepUTF8(byval pstr as const zstring ptr ptr, byval pslen as uinteger ptr) as Uint32
declare function SDL_StepBackUTF8(byval start as const zstring ptr, byval pstr as const zstring ptr ptr) as Uint32
declare function SDL_UCS4ToUTF8(byval codepoint as Uint32, byval dst as zstring ptr) as zstring ptr

declare function SDL_sscanf(byval text as const zstring ptr, byval fmt as const zstring ptr, ...) as long
declare function SDL_vsscanf(byval text as const zstring ptr, byval fmt as const zstring ptr, byval ap as va_list) as long
declare function SDL_snprintf(byval text as zstring ptr, byval maxlen as uinteger, byval fmt as const zstring ptr, ...) as long
declare function SDL_swprintf(byval text as wstring ptr, byval maxlen as uinteger, byval fmt as const wstring ptr, ...) as long
declare function SDL_vsnprintf(byval text as zstring ptr, byval maxlen as uinteger, byval fmt as const zstring ptr, byval ap as va_list) as long
declare function SDL_vswprintf(byval text as wstring ptr, byval maxlen as uinteger, byval fmt as const wstring ptr, byval ap as va_list) as long
declare function SDL_asprintf(byval strp as zstring ptr ptr, byval fmt as const zstring ptr, ...) as long
declare function SDL_vasprintf(byval strp as zstring ptr ptr, byval fmt as const zstring ptr, byval ap as va_list) as long

declare sub SDL_srand(byval seed as Uint64)
declare function SDL_rand(byval n as Sint32) as Sint32
declare function SDL_randf() as single
declare function SDL_rand_bits() as Uint32
declare function SDL_rand_r(byval state as Uint64 ptr, byval n as Sint32) as Sint32
declare function SDL_randf_r(byval state as Uint64 ptr) as single
declare function SDL_rand_bits_r(byval state as Uint64 ptr) as Uint32

#ifndef SDL_PI_D
  const SDL_PI_D = 3.141592653589793238462643383279502884
#endif
#ifndef SDL_PI_F
  const SDL_PI_F = 3.141592653589793238462643383279502884f
#endif

declare function SDL_acos(byval x as double) as double
declare function SDL_acosf(byval x as single) as single
declare function SDL_asin(byval x as double) as double
declare function SDL_asinf(byval x as single) as single
declare function SDL_atan(byval x as double) as double
declare function SDL_atanf(byval x as single) as single
declare function SDL_atan2(byval y as double, byval x as double) as double
declare function SDL_atan2f(byval y as single, byval x as single) as single
declare function SDL_ceil(byval x as double) as double
declare function SDL_ceilf(byval x as single) as single
declare function SDL_copysign(byval x as double, byval y as double) as double
declare function SDL_copysignf(byval x as single, byval y as single) as single
declare function SDL_cos(byval x as double) as double
declare function SDL_cosf(byval x as single) as single
declare function SDL_exp(byval x as double) as double
declare function SDL_expf(byval x as single) as single
declare function SDL_fabs(byval x as double) as double
declare function SDL_fabsf(byval x as single) as single
declare function SDL_floor(byval x as double) as double
declare function SDL_floorf(byval x as single) as single
declare function SDL_trunc(byval x as double) as double
declare function SDL_truncf(byval x as single) as single
declare function SDL_fmod(byval x as double, byval y as double) as double
declare function SDL_fmodf(byval x as single, byval y as single) as single
declare function SDL_isinf(byval x as double) as long
declare function SDL_isinff(byval x as single) as long
declare function SDL_isnan(byval x as double) as long
declare function SDL_isnanf(byval x as single) as long
declare function SDL_loga alias "SDL_log"(byval x as double) as double
declare function SDL_logf(byval x as single) as single
declare function SDL_log10(byval x as double) as double
declare function SDL_log10f(byval x as single) as single
declare function SDL_modf(byval x as double, byval y as double ptr) as double
declare function SDL_modff(byval x as single, byval y as single ptr) as single
declare function SDL_pow(byval x as double, byval y as double) as double
declare function SDL_powf(byval x as single, byval y as single) as single
declare function SDL_round(byval x as double) as double
declare function SDL_roundf(byval x as single) as single
declare function SDL_lround(byval x as double) as clong
declare function SDL_lroundf(byval x as single) as clong
declare function SDL_scalbn(byval x as double, byval n as long) as double
declare function SDL_scalbnf(byval x as single, byval n as long) as single
declare function SDL_sin(byval x as double) as double
declare function SDL_sinf(byval x as single) as single
declare function SDL_sqrt(byval x as double) as double
declare function SDL_sqrtf(byval x as single) as single
declare function SDL_tan(byval x as double) as double
declare function SDL_tanf(byval x as single) as single

type SDL_iconv_t as SDL_iconv_data_t ptr

declare function SDL_iconv_open(byval tocode as const zstring ptr, byval fromcode as const zstring ptr) as SDL_iconv_t
declare function SDL_iconv_close(byval cd as SDL_iconv_t) as long
declare function SDL_iconv(byval cd as SDL_iconv_t, byval inbuf as const zstring ptr ptr, byval inbytesleft as uinteger ptr, byval outbuf as zstring ptr ptr, byval outbytesleft as uinteger ptr) as uinteger

const SDL_ICONV_ERROR = cuint(-1)
const SDL_ICONV_E2BIG = cuint(-2)
const SDL_ICONV_EILSEQ = cuint(-3)
const SDL_ICONV_EINVAL = cuint(-4)

declare function SDL_iconv_string(byval tocode as const zstring ptr, byval fromcode as const zstring ptr, byval inbuf as const zstring ptr, byval inbytesleft as uinteger) as zstring ptr

#define SDL_iconv_utf8_locale(S) SDL_iconv_string("", "UTF-8", S, SDL_strlen(S) + 1)
#define SDL_iconv_utf8_ucs2(S) cptr(Uint16 ptr, SDL_iconv_string("UCS-2", "UTF-8", S, SDL_strlen(S) + 1))
#define SDL_iconv_utf8_ucs4(S) cptr(Uint32 ptr, SDL_iconv_string("UCS-4", "UTF-8", S, SDL_strlen(S) + 1))
#define SDL_iconv_wchar_utf8(S) SDL_iconv_string("UTF-8", "WCHAR_T", cptr(zstring ptr, S), (SDL_wcslen(S) + 1) * sizeof(wchar_t))

private function SDL_size_mul_check_overflow(byval a as uinteger, byval b as uinteger, byval ret as uinteger ptr) as boolean
	if (a <> 0) andalso (b > (cuint(-1) / a)) then
		return false
	end if
	(*ret) = a * b
	return true
end function

#ifdef __has_builtin
 #define SDL_HAS_BUILTIN(x) __has_builtin(x)
#else
 #define SDL_HAS_BUILTIN(x) 0
#endif

#ifndef SDL_WIKI_DOCUMENTATION_SECTION
  #if SDL_HAS_BUILTIN(__builtin_mul_overflow) 
    private function SDL_size_mul_check_overflow_builtin(byval a as uinteger, byval b as uinteger, byval ret as uinteger ptr) as boolean
      return __builtin_mul_overflow(a, b, ret) = 0 : 0 : -1
    end function
    #define SDL_size_mul_check_overflow(a, b, ret) (SDL_size_mul_check_overflow_builtin(a, b, ret))
  #endif
#endif

private function SDL_size_add_check_overflow(byval a as uinteger, byval b as uinteger, byval ret as uinteger ptr) as boolean
	if b > (cuint(-1) - a) then
		return false
	end if
	(*ret) = a + b
	return true
end function

#ifndef SDL_WIKI_DOCUMENTATION_SECTION
  #if SDL_HAS_BUILTIN(__builtin_add_overflow)
    private function SDL_size_add_check_overflow_builtin(byval a as uinteger, byval b as uinteger, byval ret as uinteger ptr) as boolean
      return __builtin_add_overflow(a, b, ret) = 0 : 0 : -1
    end function
    #define SDL_size_add_check_overflow(a, b, ret) (SDL_size_add_check_overflow_builtin(a, b, ret))
  #endif
#endif

type SDL_FunctionPointer as sub()

end extern
