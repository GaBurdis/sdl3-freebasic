#pragma once

extern "C"

#ifdef SDL_WIKI_DOCUMENTATION_SECTION
  #define SDL_ASSERT_LEVEL SomeNumberBasedOnVariousFactors
#elseif not defined(SDL_ASSERT_LEVEL)
  #ifdef SDL_DEFAULT_ASSERT_LEVEL
    #define SDL_ASSERT_LEVEL SDL_DEFAULT_ASSERT_LEVEL
  #elseif defined(_DEBUG) or defined(DEBUG) or (defined(__GNUC__) and (not defined(__OPTIMIZE__)))
    #define SDL_ASSERT_LEVEL 2
  #else
    #define SDL_ASSERT_LEVEL 1
  #endif
#endif

#ifdef SDL_WIKI_DOCUMENTATION_SECTION
  #define SDL_TriggerBreakpoint() TriggerABreakpointInAPlatformSpecificManner
#elseif defined(ANDROID)
  #include once "assert.bi"
  #define SDL_TriggerBreakpoint() assert(0)
#elseif SDL_HAS_BUILTIN(__builtin_debugtrap)
  #define SDL_TriggerBreakpoint() __builtin_debugtrap()
#elseif SDL_HAS_BUILTIN(__builtin_trap)
  #define SDL_TriggerBreakpoint() __builtin_trap()
#elseif (defined(__GNUC__) or defined(__clang__)) and (defined(__i386__) or defined(__x86_64__))
  '#define SDL_TriggerBreakpoint() __asm__ __volatile__ ( "int $3\n\t" )
#elseif (defined(__GNUC__) or defined(__clang__)) and defined(__riscv)
  '#define SDL_TriggerBreakpoint() __asm__ __volatile__ ( "ebreak\n\t" )
#elseif ( defined(SDL_PLATFORM_APPLE) and (defined(__arm64__) or defined(__aarch64__)) )
  '#define SDL_TriggerBreakpoint() __asm__ __volatile__ ( "brk #22\n\t" )
#elseif defined(SDL_PLATFORM_APPLE) and defined(__arm__)
  '#define SDL_TriggerBreakpoint() __asm__ __volatile__ ( "bkpt #22\n\t" )
#elseif defined(_WIN32) and ((defined(__GNUC__) or defined(__clang__)) and (defined(__arm64__) or defined(__aarch64__)) )
  '#define SDL_TriggerBreakpoint() __asm__ __volatile__ ( "brk #0xF000\n\t" )
#elseif defined(__GNUC__) or defined(__clang__)
  #define SDL_TriggerBreakpoint() __builtin_trap()
#elseif defined(__386__) and defined(__WATCOMC__)
  #define SDL_TriggerBreakpoint() ( _asm ( long 0x03 ) )
#elseif defined(HAVE_SIGNAL_H) and (not defined(__WATCOMC__))
  #include once "signal.bi"
  #define SDL_TriggerBreakpoint() raise(SIGTRAP)
#endif

#ifdef SDL_WIKI_DOCUMENTATION_SECTION
  #define SDL_FUNCTION __FUNCTION__
'#elseif ((defined(__GNUC__) and (__GNUC__ >= 2)) or defined(_MSC_VER) or defined (__WATCOMC__))
'  #define SDL_FUNCTION __FUNCTION__
#else
  #define SDL_FUNCTION "???"
#endif

#define SDL_FILE  __FILE__
#define SDL_LINE  __LINE__

#ifdef SDL_WIKI_DOCUMENTATION_SECTION
  #define SDL_NULL_WHILE_LOOP_CONDITION (0)
#elseif _MSC_VER
  #define SDL_NULL_WHILE_LOOP_CONDITION (0,0)
#else
  #define SDL_NULL_WHILE_LOOP_CONDITION (0)
#endif

#macro SDL_disabled_assert(condition)
	do
		cast(any, sizeof(condition))
	loop while SDL_NULL_WHILE_LOOP_CONDITION
#endmacro

type SDL_AssertState as long
enum
	SDL_ASSERTION_RETRY
	SDL_ASSERTION_BREAK
	SDL_ASSERTION_ABORT
	SDL_ASSERTION_IGNORE
	SDL_ASSERTION_ALWAYS_IGNORE
end enum

type SDL_AssertData
	always_ignore as boolean
	trigger_count as ulong
	condition as const zstring ptr
	filename as const zstring ptr
	linenum as long
	function as const zstring ptr
	next as const SDL_AssertData ptr
end type

declare function SDL_ReportAssertion(byval data as SDL_AssertData ptr, byval func as const zstring ptr, byval file as const zstring ptr, byval line as long) as SDL_AssertState

#ifdef SDL_WIKI_DOCUMENTATION_SECTION
  #define SDL_AssertBreakpoint() SDL_TriggerBreakpoint()
#elseif not defined (SDL_AssertBreakpoint)
  #if defined(ANDROID) and defined(assert)
    #define SDL_AssertBreakpoint()
  #else
    #define SDL_AssertBreakpoint() SDL_TriggerBreakpoint()
  #endif
#endif

#macro SDL_enabled_assert(condition)
	do
		while (condition) = 0
			static sdl_assert_data as SDL_AssertData = (0, 0, #condition, 0, 0, 0, 0)
			dim sdl_assert_state as const SDL_AssertState = SDL_ReportAssertion(@sdl_assert_data, SDL_FUNCTION, SDL_FILE, SDL_LINE)
			if sdl_assert_state = SDL_ASSERTION_RETRY then
				continue while
			elseif sdl_assert_state = SDL_ASSERTION_BREAK then
				SDL_AssertBreakpoint()
			end if
			exit while
		wend
	loop while SDL_NULL_WHILE_LOOP_CONDITION
#endmacro

#ifdef SDL_WIKI_DOCUMENTATION_SECTION

  #macro SDL_assert(condition)
    if (assertion_enabled and (condition)) then trigger_assertion
  #endmacro

  #define SDL_assert_release(condition) SDL_disabled_assert(condition)
  #define SDL_assert_paranoid(condition) SDL_disabled_assert(condition)

#elseif SDL_ASSERT_LEVEL = 0
  #define SDL_assert(condition) SDL_disabled_assert(condition)
  #define SDL_assert_release(condition) SDL_disabled_assert(condition)
  #define SDL_assert_paranoid(condition) SDL_disabled_assert(condition)
#elseif SDL_ASSERT_LEVEL = 1
  #define SDL_assert(condition) SDL_disabled_assert(condition)
  #define SDL_assert_release(condition) SDL_enabled_assert(condition)
  #define SDL_assert_paranoid(condition) SDL_disabled_assert(condition)
#elseif SDL_ASSERT_LEVEL = 2
  #define SDL_assert(condition) SDL_enabled_assert(condition)
  #define SDL_assert_release(condition) SDL_enabled_assert(condition)
  #define SDL_assert_paranoid(condition) SDL_disabled_assert(condition)
#elseif SDL_ASSERT_LEVEL = 3
  #define SDL_assert(condition) SDL_enabled_assert(condition)
  #define SDL_assert_release(condition) SDL_enabled_assert(condition)
  #define SDL_assert_paranoid(condition) SDL_enabled_assert(condition)
#else
  #error Unknown assertion level.
#endif

#define SDL_assert_always(condition) SDL_enabled_assert(condition)

type SDL_AssertionHandler as function(byval data as const SDL_AssertData ptr, byval userdata as any ptr) as SDL_AssertState

declare sub SDL_SetAssertionHandler(byval handler as SDL_AssertionHandler, byval userdata as any ptr)
declare function SDL_GetDefaultAssertionHandler() as SDL_AssertionHandler
declare function SDL_GetAssertionHandler(byval puserdata as any ptr ptr) as SDL_AssertionHandler
declare function SDL_GetAssertionReport() as const SDL_AssertData ptr
declare sub SDL_ResetAssertionReport()

end extern
