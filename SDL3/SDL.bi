'' FreeBASIC binding for SDL3-3.2.16
''
'' based on the C header files:
''   Simple DirectMedia Layer
''   Copyright (C) 1997-2025 Sam Lantinga <slouken@libsdl.org>
''
''   This software is provided 'as-is', without any express or implied
''   warranty.  In no event will the authors be held liable for any damages
''   arising from the use of this software.
''
''   Permission is granted to anyone to use this software for any purpose,
''   including commercial applications, and to alter it and redistribute it
''   freely, subject to the following restrictions:
''
''   1. The origin of this software must not be misrepresented; you must not
''      claim that you wrote the original software. If you use this software
''      in a product, an acknowledgment in the product documentation would be
''      appreciated but is not required.
''   2. Altered source versions must be plainly marked as such, and must not be
''      misrepresented as being the original software.
''   3. This notice may not be removed or altered from any source distribution.

'' SDL_events.bi  (195) mod => mod_
'' SDL_stdinc.bi (526) SDL_log() => SDL_loga()

#pragma once

#inclib "SDL3"

#include "SDL3/SDL_platform_defines.bi"
#include "SDL3/SDL_stdinc.bi"
#include "SDL3/SDL_error.bi"
#include "SDL3/SDL_properties.bi"
#include "SDL3/SDL_iostream.bi"
#include "SDL3/SDL_audio.bi"
#include "SDL3/SDL_blendmode.bi"
#include "SDL3/SDL_pixels.bi"
#include "SDL3/SDL_rect.bi"
#include "SDL3/SDL_surface.bi"
#include "SDL3/SDL_camera.bi"
#include "SDL3/SDL_guid.bi"
#include "SDL3/SDL_power.bi"
#include "SDL3/SDL_sensor.bi"
#include "SDL3/SDL_joystick.bi"
#include "SDL3/SDL_keycode.bi"
#include "SDL3/SDL_scancode.bi"
#include "SDL3/SDL_video.bi"
#include "SDL3/SDL_keyboard.bi"
#include "SDL3/SDL_pen.bi"
#include "SDL3/SDL_mouse.bi"
#include "SDL3/SDL_touch.bi"
#include "SDL3/SDL_events.bi"
#include "SDL3/SDL_init.bi"
#include "SDL3/SDL_log.bi"
#include "SDL3/SDL_render.bi"
#include "SDL3/SDL_timer.bi"
#include "SDL3/SDL_filesystem.bi"

#include "SDL3/SDL_assert.bi"
#include "SDL3/SDL_asyncio.bi"
#include "SDL3/SDL_atomic.bi"
#include "SDL3/SDL_bits.bi"
#include "SDL3/SDL_clipboard.bi"
#include "SDL3/SDL_cpuinfo.bi"
#include "SDL3/SDL_dialog.bi"
#include "SDL3/SDL_endian.bi"
#include "SDL3/SDL_gamepad.bi"
#include "SDL3/SDL_gpu.bi"
#include "SDL3/SDL_haptic.bi"
#include "SDL3/SDL_hidapi.bi"
#include "SDL3/SDL_hints.bi"
#include "SDL3/SDL_loadso.bi"
#include "SDL3/SDL_locale.bi"
#include "SDL3/SDL_messagebox.bi"
#include "SDL3/SDL_metal.bi"
#include "SDL3/SDL_misc.bi"
#include "SDL3/SDL_thread.bi"
#include "SDL3/SDL_mutex.bi"
#include "SDL3/SDL_platform.bi"
#include "SDL3/SDL_process.bi"
#include "SDL3/SDL_storage.bi"
#include "SDL3/SDL_system.bi"
#include "SDL3/SDL_time.bi"
#include "SDL3/SDL_tray.bi"
#include "SDL3/SDL_version.bi"
