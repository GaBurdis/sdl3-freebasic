#pragma once

extern "C"

type SDL_DisplayID as Uint32
type SDL_WindowID as Uint32

#define SDL_PROP_GLOBAL_VIDEO_WAYLAND_WL_DISPLAY_POINTER "SDL.video.wayland.wl_display"

type SDL_SystemTheme as long
enum
	SDL_SYSTEM_THEME_UNKNOWN
	SDL_SYSTEM_THEME_LIGHT
	SDL_SYSTEM_THEME_DARK
end enum

type SDL_DisplayModeData as _SDL_DisplayModeData

type SDL_DisplayMode
	displayID as SDL_DisplayID
	format as SDL_PixelFormat
	w as long
	h as long
	pixel_density as single
	refresh_rate as single
	refresh_rate_numerator as long
	refresh_rate_denominator as long
	internal as SDL_DisplayModeData ptr
end type

type SDL_DisplayOrientation as long
enum
	SDL_ORIENTATION_UNKNOWN
	SDL_ORIENTATION_LANDSCAPE
	SDL_ORIENTATION_LANDSCAPE_FLIPPED
	SDL_ORIENTATION_PORTRAIT
	SDL_ORIENTATION_PORTRAIT_FLIPPED
end enum

type SDL_Window as _SDL_Window
type SDL_WindowFlags as Uint64

#define SDL_WINDOW_FULLSCREEN           SDL_UINT64_C(&h0000000000000001)
#define SDL_WINDOW_OPENGL               SDL_UINT64_C(&h0000000000000002)
#define SDL_WINDOW_OCCLUDED             SDL_UINT64_C(&h0000000000000004)
#define SDL_WINDOW_HIDDEN               SDL_UINT64_C(&h0000000000000008)
#define SDL_WINDOW_BORDERLESS           SDL_UINT64_C(&h0000000000000010)
#define SDL_WINDOW_RESIZABLE            SDL_UINT64_C(&h0000000000000020)
#define SDL_WINDOW_MINIMIZED            SDL_UINT64_C(&h0000000000000040)
#define SDL_WINDOW_MAXIMIZED            SDL_UINT64_C(&h0000000000000080)
#define SDL_WINDOW_MOUSE_GRABBED        SDL_UINT64_C(&h0000000000000100)
#define SDL_WINDOW_INPUT_FOCUS          SDL_UINT64_C(&h0000000000000200)
#define SDL_WINDOW_MOUSE_FOCUS          SDL_UINT64_C(&h0000000000000400)
#define SDL_WINDOW_EXTERNAL             SDL_UINT64_C(&h0000000000000800)
#define SDL_WINDOW_MODAL                SDL_UINT64_C(&h0000000000001000)
#define SDL_WINDOW_HIGH_PIXEL_DENSITY   SDL_UINT64_C(&h0000000000002000)
#define SDL_WINDOW_MOUSE_CAPTURE        SDL_UINT64_C(&h0000000000004000)
#define SDL_WINDOW_MOUSE_RELATIVE_MODE  SDL_UINT64_C(&h0000000000008000)
#define SDL_WINDOW_ALWAYS_ON_TOP        SDL_UINT64_C(&h0000000000010000)
#define SDL_WINDOW_UTILITY              SDL_UINT64_C(&h0000000000020000)
#define SDL_WINDOW_TOOLTIP              SDL_UINT64_C(&h0000000000040000)
#define SDL_WINDOW_POPUP_MENU           SDL_UINT64_C(&h0000000000080000)
#define SDL_WINDOW_KEYBOARD_GRABBED     SDL_UINT64_C(&h0000000000100000)
#define SDL_WINDOW_FILL_DOCUMENT        SDL_UINT64_C(&h0000000000200000)
#define SDL_WINDOW_VULKAN               SDL_UINT64_C(&h0000000010000000)
#define SDL_WINDOW_METAL                SDL_UINT64_C(&h0000000020000000)
#define SDL_WINDOW_TRANSPARENT          SDL_UINT64_C(&h0000000040000000)
#define SDL_WINDOW_NOT_FOCUSABLE        SDL_UINT64_C(&h0000000080000000)

const SDL_WINDOWPOS_UNDEFINED_MASK = &h1FFF0000u
#define SDL_WINDOWPOS_UNDEFINED_DISPLAY(X) (SDL_WINDOWPOS_UNDEFINED_MASK or (X))
#define SDL_WINDOWPOS_UNDEFINED SDL_WINDOWPOS_UNDEFINED_DISPLAY(0)
#define SDL_WINDOWPOS_ISUNDEFINED(X) (((X) and &hFFFF0000) = SDL_WINDOWPOS_UNDEFINED_MASK)

const SDL_WINDOWPOS_CENTERED_MASK = &h2FFF0000u
#define SDL_WINDOWPOS_CENTERED_DISPLAY(X) (SDL_WINDOWPOS_CENTERED_MASK or (X))
#define SDL_WINDOWPOS_CENTERED SDL_WINDOWPOS_CENTERED_DISPLAY(0)
#define SDL_WINDOWPOS_ISCENTERED(X) (((X) and &hFFFF0000) = SDL_WINDOWPOS_CENTERED_MASK)

type SDL_FlashOperation as long
enum
	SDL_FLASH_CANCEL
	SDL_FLASH_BRIEFLY
	SDL_FLASH_UNTIL_FOCUSED
end enum

type SDL_ProgressState as long
enum
    SDL_PROGRESS_STATE_INVALID = -1
    SDL_PROGRESS_STATE_NONE
    SDL_PROGRESS_STATE_INDETERMINATE
    SDL_PROGRESS_STATE_NORMAL
    SDL_PROGRESS_STATE_PAUSED
    SDL_PROGRESS_STATE_ERROR 
end enum

type SDL_GLContext as SDL_GLContextState ptr

type SDL_EGLDisplay as any ptr
type SDL_EGLConfig as any ptr
type SDL_EGLSurface as any ptr
type SDL_EGLAttrib as integer
type SDL_EGLint as long

type SDL_EGLAttribArrayCallback as function(byval userdata as any ptr) as SDL_EGLAttrib ptr
type SDL_EGLIntArrayCallback as function(byval userdata as any ptr, byval display as SDL_EGLDisplay, byval config as SDL_EGLConfig) as SDL_EGLint ptr

type SDL_GLAttr as long
enum
	SDL_GL_RED_SIZE
	SDL_GL_GREEN_SIZE
	SDL_GL_BLUE_SIZE
	SDL_GL_ALPHA_SIZE
	SDL_GL_BUFFER_SIZE
	SDL_GL_DOUBLEBUFFER
	SDL_GL_DEPTH_SIZE
	SDL_GL_STENCIL_SIZE
	SDL_GL_ACCUM_RED_SIZE
	SDL_GL_ACCUM_GREEN_SIZE
	SDL_GL_ACCUM_BLUE_SIZE
	SDL_GL_ACCUM_ALPHA_SIZE
	SDL_GL_STEREO
	SDL_GL_MULTISAMPLEBUFFERS
	SDL_GL_MULTISAMPLESAMPLES
	SDL_GL_ACCELERATED_VISUAL
	SDL_GL_RETAINED_BACKING
	SDL_GL_CONTEXT_MAJOR_VERSION
	SDL_GL_CONTEXT_MINOR_VERSION
	SDL_GL_CONTEXT_FLAGS
	SDL_GL_CONTEXT_PROFILE_MASK
	SDL_GL_SHARE_WITH_CURRENT_CONTEXT
	SDL_GL_FRAMEBUFFER_SRGB_CAPABLE
	SDL_GL_CONTEXT_RELEASE_BEHAVIOR
	SDL_GL_CONTEXT_RESET_NOTIFICATION
	SDL_GL_CONTEXT_NO_ERROR
	SDL_GL_FLOATBUFFERS
	SDL_GL_EGL_PLATFORM
end enum

type SDL_GLProfile as Uint32

const SDL_GL_CONTEXT_PROFILE_CORE          = &h0001
const SDL_GL_CONTEXT_PROFILE_COMPATIBILITY = &h0002
const SDL_GL_CONTEXT_PROFILE_ES            = &h0004

type SDL_GLContextFlag as Uint32

const SDL_GL_CONTEXT_DEBUG_FLAG              = &h0001
const SDL_GL_CONTEXT_FORWARD_COMPATIBLE_FLAG = &h0002
const SDL_GL_CONTEXT_ROBUST_ACCESS_FLAG      = &h0004
const SDL_GL_CONTEXT_RESET_ISOLATION_FLAG    = &h0008

type SDL_GLContextReleaseFlag as Uint32

const SDL_GL_CONTEXT_RELEASE_BEHAVIOR_NONE  = &h0000
const SDL_GL_CONTEXT_RELEASE_BEHAVIOR_FLUSH = &h0001

type SDL_GLContextResetNotification as Uint32

const SDL_GL_CONTEXT_RESET_NO_NOTIFICATION = &h0000
const SDL_GL_CONTEXT_RESET_LOSE_CONTEXT    = &h0001

declare function SDL_GetNumVideoDrivers() as long
declare function SDL_GetVideoDriver(byval index as long) as const zstring ptr
declare function SDL_GetCurrentVideoDriver() as const zstring ptr
declare function SDL_GetSystemTheme() as SDL_SystemTheme
declare function SDL_GetDisplays(byval count as long ptr) as SDL_DisplayID ptr
declare function SDL_GetPrimaryDisplay() as SDL_DisplayID
declare function SDL_GetDisplayProperties(byval displayID as SDL_DisplayID) as SDL_PropertiesID

#define SDL_PROP_DISPLAY_HDR_ENABLED_BOOLEAN             "SDL.display.HDR_enabled"
#define SDL_PROP_DISPLAY_KMSDRM_PANEL_ORIENTATION_NUMBER "SDL.display.KMSDRM.panel_orientation"
#define SDL_PROP_DISPLAY_WAYLAND_WL_OUTPUT_POINTER       "SDL.display.wayland.wl_output"
#define SDL_PROP_DISPLAY_WINDOWS_HMONITOR_POINTER        "SDL.display.windows.hmonitor"

declare function SDL_GetDisplayName(byval displayID as SDL_DisplayID) as const zstring ptr
declare function SDL_GetDisplayBounds(byval displayID as SDL_DisplayID, byval rect as SDL_Rect ptr) as boolean
declare function SDL_GetDisplayUsableBounds(byval displayID as SDL_DisplayID, byval rect as SDL_Rect ptr) as boolean
declare function SDL_GetNaturalDisplayOrientation(byval displayID as SDL_DisplayID) as SDL_DisplayOrientation
declare function SDL_GetCurrentDisplayOrientation(byval displayID as SDL_DisplayID) as SDL_DisplayOrientation
declare function SDL_GetDisplayContentScale(byval displayID as SDL_DisplayID) as single
declare function SDL_GetFullscreenDisplayModes(byval displayID as SDL_DisplayID, byval count as long ptr) as SDL_DisplayMode ptr ptr
declare function SDL_GetClosestFullscreenDisplayMode(byval displayID as SDL_DisplayID, byval w as long, byval h as long, byval refresh_rate as single, byval include_high_density_modes as boolean, byval closest as SDL_DisplayMode ptr) as boolean
declare function SDL_GetDesktopDisplayMode(byval displayID as SDL_DisplayID) as const SDL_DisplayMode ptr
declare function SDL_GetCurrentDisplayMode(byval displayID as SDL_DisplayID) as const SDL_DisplayMode ptr
declare function SDL_GetDisplayForPoint(byval point as const SDL_Point ptr) as SDL_DisplayID
declare function SDL_GetDisplayForRect(byval rect as const SDL_Rect ptr) as SDL_DisplayID
declare function SDL_GetDisplayForWindow(byval window as SDL_Window ptr) as SDL_DisplayID
declare function SDL_GetWindowPixelDensity(byval window as SDL_Window ptr) as single
declare function SDL_GetWindowDisplayScale(byval window as SDL_Window ptr) as single
declare function SDL_SetWindowFullscreenMode(byval window as SDL_Window ptr, byval mode as const SDL_DisplayMode ptr) as boolean
declare function SDL_GetWindowFullscreenMode(byval window as SDL_Window ptr) as const SDL_DisplayMode ptr
declare function SDL_GetWindowICCProfile(byval window as SDL_Window ptr, byval size as uinteger ptr) as any ptr
declare function SDL_GetWindowPixelFormat(byval window as SDL_Window ptr) as SDL_PixelFormat
declare function SDL_GetWindows(byval count as long ptr) as SDL_Window ptr ptr
declare function SDL_CreateWindow(byval title as const zstring ptr, byval w as long, byval h as long, byval flags as SDL_WindowFlags) as SDL_Window ptr
declare function SDL_CreatePopupWindow(byval parent as SDL_Window ptr, byval offset_x as long, byval offset_y as long, byval w as long, byval h as long, byval flags as SDL_WindowFlags) as SDL_Window ptr
declare function SDL_CreateWindowWithProperties(byval props as SDL_PropertiesID) as SDL_Window ptr

#define SDL_PROP_WINDOW_CREATE_ALWAYS_ON_TOP_BOOLEAN "SDL.window.create.always_on_top"
#define SDL_PROP_WINDOW_CREATE_BORDERLESS_BOOLEAN "SDL.window.create.borderless"
#define SDL_PROP_WINDOW_CREATE_CONSTRAIN_POPUP_BOOLEAN "SDL.window.create.constrain_popup"
#define SDL_PROP_WINDOW_CREATE_FOCUSABLE_BOOLEAN "SDL.window.create.focusable"
#define SDL_PROP_WINDOW_CREATE_EXTERNAL_GRAPHICS_CONTEXT_BOOLEAN "SDL.window.create.external_graphics_context"
#define SDL_PROP_WINDOW_CREATE_FLAGS_NUMBER "SDL.window.create.flags"
#define SDL_PROP_WINDOW_CREATE_FULLSCREEN_BOOLEAN "SDL.window.create.fullscreen"
#define SDL_PROP_WINDOW_CREATE_HEIGHT_NUMBER "SDL.window.create.height"
#define SDL_PROP_WINDOW_CREATE_HIDDEN_BOOLEAN "SDL.window.create.hidden"
#define SDL_PROP_WINDOW_CREATE_HIGH_PIXEL_DENSITY_BOOLEAN "SDL.window.create.high_pixel_density"
#define SDL_PROP_WINDOW_CREATE_MAXIMIZED_BOOLEAN "SDL.window.create.maximized"
#define SDL_PROP_WINDOW_CREATE_MENU_BOOLEAN "SDL.window.create.menu"
#define SDL_PROP_WINDOW_CREATE_METAL_BOOLEAN "SDL.window.create.metal"
#define SDL_PROP_WINDOW_CREATE_MINIMIZED_BOOLEAN "SDL.window.create.minimized"
#define SDL_PROP_WINDOW_CREATE_MODAL_BOOLEAN "SDL.window.create.modal"
#define SDL_PROP_WINDOW_CREATE_MOUSE_GRABBED_BOOLEAN "SDL.window.create.mouse_grabbed"
#define SDL_PROP_WINDOW_CREATE_OPENGL_BOOLEAN "SDL.window.create.opengl"
#define SDL_PROP_WINDOW_CREATE_PARENT_POINTER "SDL.window.create.parent"
#define SDL_PROP_WINDOW_CREATE_RESIZABLE_BOOLEAN "SDL.window.create.resizable"
#define SDL_PROP_WINDOW_CREATE_TITLE_STRING "SDL.window.create.title"
#define SDL_PROP_WINDOW_CREATE_TRANSPARENT_BOOLEAN "SDL.window.create.transparent"
#define SDL_PROP_WINDOW_CREATE_TOOLTIP_BOOLEAN "SDL.window.create.tooltip"
#define SDL_PROP_WINDOW_CREATE_UTILITY_BOOLEAN "SDL.window.create.utility"
#define SDL_PROP_WINDOW_CREATE_VULKAN_BOOLEAN "SDL.window.create.vulkan"
#define SDL_PROP_WINDOW_CREATE_WIDTH_NUMBER "SDL.window.create.width"
#define SDL_PROP_WINDOW_CREATE_X_NUMBER "SDL.window.create.x"
#define SDL_PROP_WINDOW_CREATE_Y_NUMBER "SDL.window.create.y"
#define SDL_PROP_WINDOW_CREATE_COCOA_WINDOW_POINTER "SDL.window.create.cocoa.window"
#define SDL_PROP_WINDOW_CREATE_COCOA_VIEW_POINTER "SDL.window.create.cocoa.view"
#define SDL_PROP_WINDOW_CREATE_WINDOWSCENE_POINTER "SDL.window.create.uikit.windowscene"
#define SDL_PROP_WINDOW_CREATE_WAYLAND_SURFACE_ROLE_CUSTOM_BOOLEAN "SDL.window.create.wayland.surface_role_custom"
#define SDL_PROP_WINDOW_CREATE_WAYLAND_CREATE_EGL_WINDOW_BOOLEAN "SDL.window.create.wayland.create_egl_window"
#define SDL_PROP_WINDOW_CREATE_WAYLAND_WL_SURFACE_POINTER "SDL.window.create.wayland.wl_surface"
#define SDL_PROP_WINDOW_CREATE_WIN32_HWND_POINTER "SDL.window.create.win32.hwnd"
#define SDL_PROP_WINDOW_CREATE_WIN32_PIXEL_FORMAT_HWND_POINTER "SDL.window.create.win32.pixel_format_hwnd"
#define SDL_PROP_WINDOW_CREATE_X11_WINDOW_NUMBER "SDL.window.create.x11.window"
#define SDL_PROP_WINDOW_CREATE_EMSCRIPTEN_CANVAS_ID_STRING "SDL.window.create.emscripten.canvas_id"
#define SDL_PROP_WINDOW_CREATE_EMSCRIPTEN_KEYBOARD_ELEMENT_STRING  "SDL.window.create.emscripten.keyboard_element"

declare function SDL_GetWindowID(byval window as SDL_Window ptr) as SDL_WindowID
declare function SDL_GetWindowFromID(byval id as SDL_WindowID) as SDL_Window ptr
declare function SDL_GetWindowParent(byval window as SDL_Window ptr) as SDL_Window ptr
declare function SDL_GetWindowProperties(byval window as SDL_Window ptr) as SDL_PropertiesID

#define SDL_PROP_WINDOW_SHAPE_POINTER "SDL.window.shape"
#define SDL_PROP_WINDOW_HDR_ENABLED_BOOLEAN "SDL.window.HDR_enabled"
#define SDL_PROP_WINDOW_SDR_WHITE_LEVEL_FLOAT "SDL.window.SDR_white_level"
#define SDL_PROP_WINDOW_HDR_HEADROOM_FLOAT "SDL.window.HDR_headroom"
#define SDL_PROP_WINDOW_ANDROID_WINDOW_POINTER "SDL.window.android.window"
#define SDL_PROP_WINDOW_ANDROID_SURFACE_POINTER "SDL.window.android.surface"
#define SDL_PROP_WINDOW_UIKIT_WINDOW_POINTER "SDL.window.uikit.window"
#define SDL_PROP_WINDOW_UIKIT_METAL_VIEW_TAG_NUMBER "SDL.window.uikit.metal_view_tag"
#define SDL_PROP_WINDOW_UIKIT_OPENGL_FRAMEBUFFER_NUMBER "SDL.window.uikit.opengl.framebuffer"
#define SDL_PROP_WINDOW_UIKIT_OPENGL_RENDERBUFFER_NUMBER "SDL.window.uikit.opengl.renderbuffer"
#define SDL_PROP_WINDOW_UIKIT_OPENGL_RESOLVE_FRAMEBUFFER_NUMBER "SDL.window.uikit.opengl.resolve_framebuffer"
#define SDL_PROP_WINDOW_KMSDRM_DEVICE_INDEX_NUMBER "SDL.window.kmsdrm.dev_index"
#define SDL_PROP_WINDOW_KMSDRM_DRM_FD_NUMBER "SDL.window.kmsdrm.drm_fd"
#define SDL_PROP_WINDOW_KMSDRM_GBM_DEVICE_POINTER "SDL.window.kmsdrm.gbm_dev"
#define SDL_PROP_WINDOW_COCOA_WINDOW_POINTER "SDL.window.cocoa.window"
#define SDL_PROP_WINDOW_COCOA_METAL_VIEW_TAG_NUMBER "SDL.window.cocoa.metal_view_tag"
#define SDL_PROP_WINDOW_OPENVR_OVERLAY_ID_NUMBER "SDL.window.openvr.overlay_id"
#define SDL_PROP_WINDOW_VIVANTE_DISPLAY_POINTER "SDL.window.vivante.display"
#define SDL_PROP_WINDOW_VIVANTE_WINDOW_POINTER "SDL.window.vivante.window"
#define SDL_PROP_WINDOW_VIVANTE_SURFACE_POINTER "SDL.window.vivante.surface"
#define SDL_PROP_WINDOW_WIN32_HWND_POINTER "SDL.window.win32.hwnd"
#define SDL_PROP_WINDOW_WIN32_HDC_POINTER "SDL.window.win32.hdc"
#define SDL_PROP_WINDOW_WIN32_INSTANCE_POINTER "SDL.window.win32.instance"
#define SDL_PROP_WINDOW_WAYLAND_DISPLAY_POINTER "SDL.window.wayland.display"
#define SDL_PROP_WINDOW_WAYLAND_SURFACE_POINTER "SDL.window.wayland.surface"
#define SDL_PROP_WINDOW_WAYLAND_VIEWPORT_POINTER "SDL.window.wayland.viewport"
#define SDL_PROP_WINDOW_WAYLAND_EGL_WINDOW_POINTER "SDL.window.wayland.egl_window"
#define SDL_PROP_WINDOW_WAYLAND_XDG_SURFACE_POINTER "SDL.window.wayland.xdg_surface"
#define SDL_PROP_WINDOW_WAYLAND_XDG_TOPLEVEL_POINTER "SDL.window.wayland.xdg_toplevel"
#define SDL_PROP_WINDOW_WAYLAND_XDG_TOPLEVEL_EXPORT_HANDLE_STRING "SDL.window.wayland.xdg_toplevel_export_handle"
#define SDL_PROP_WINDOW_WAYLAND_XDG_POPUP_POINTER "SDL.window.wayland.xdg_popup"
#define SDL_PROP_WINDOW_WAYLAND_XDG_POSITIONER_POINTER "SDL.window.wayland.xdg_positioner"
#define SDL_PROP_WINDOW_X11_DISPLAY_POINTER "SDL.window.x11.display"
#define SDL_PROP_WINDOW_X11_SCREEN_NUMBER "SDL.window.x11.screen"
#define SDL_PROP_WINDOW_X11_WINDOW_NUMBER "SDL.window.x11.window"
#define SDL_PROP_WINDOW_EMSCRIPTEN_CANVAS_ID_STRING "SDL.window.emscripten.canvas_id"
#define SDL_PROP_WINDOW_EMSCRIPTEN_KEYBOARD_ELEMENT_STRING "SDL.window.emscripten.keyboard_element"

declare function SDL_GetWindowFlags(byval window as SDL_Window ptr) as SDL_WindowFlags
declare function SDL_SetWindowTitle(byval window as SDL_Window ptr, byval title as const zstring ptr) as boolean
declare function SDL_GetWindowTitle(byval window as SDL_Window ptr) as const zstring ptr
declare function SDL_SetWindowIcon(byval window as SDL_Window ptr, byval icon as SDL_Surface ptr) as boolean
declare function SDL_SetWindowPosition(byval window as SDL_Window ptr, byval x as long, byval y as long) as boolean
declare function SDL_GetWindowPosition(byval window as SDL_Window ptr, byval x as long ptr, byval y as long ptr) as boolean
declare function SDL_SetWindowSize(byval window as SDL_Window ptr, byval w as long, byval h as long) as boolean
declare function SDL_GetWindowSize(byval window as SDL_Window ptr, byval w as long ptr, byval h as long ptr) as boolean
declare function SDL_GetWindowSafeArea(byval window as SDL_Window ptr, byval rect as SDL_Rect ptr) as boolean
declare function SDL_SetWindowAspectRatio(byval window as SDL_Window ptr, byval min_aspect as single, byval max_aspect as single) as boolean
declare function SDL_GetWindowAspectRatio(byval window as SDL_Window ptr, byval min_aspect as single ptr, byval max_aspect as single ptr) as boolean
declare function SDL_GetWindowBordersSize(byval window as SDL_Window ptr, byval top as long ptr, byval left as long ptr, byval bottom as long ptr, byval right as long ptr) as boolean
declare function SDL_GetWindowSizeInPixels(byval window as SDL_Window ptr, byval w as long ptr, byval h as long ptr) as boolean
declare function SDL_SetWindowMinimumSize(byval window as SDL_Window ptr, byval min_w as long, byval min_h as long) as boolean
declare function SDL_GetWindowMinimumSize(byval window as SDL_Window ptr, byval w as long ptr, byval h as long ptr) as boolean
declare function SDL_SetWindowMaximumSize(byval window as SDL_Window ptr, byval max_w as long, byval max_h as long) as boolean
declare function SDL_GetWindowMaximumSize(byval window as SDL_Window ptr, byval w as long ptr, byval h as long ptr) as boolean
declare function SDL_SetWindowBordered(byval window as SDL_Window ptr, byval bordered as boolean) as boolean
declare function SDL_SetWindowResizable(byval window as SDL_Window ptr, byval resizable as boolean) as boolean
declare function SDL_SetWindowAlwaysOnTop(byval window as SDL_Window ptr, byval on_top as boolean) as boolean
declare function SDL_SetWindowFillDocument(byval window as SDL_Window ptr, byval fill as boolean) as boolean
declare function SDL_ShowWindow(byval window as SDL_Window ptr) as boolean
declare function SDL_HideWindow(byval window as SDL_Window ptr) as boolean
declare function SDL_RaiseWindow(byval window as SDL_Window ptr) as boolean
declare function SDL_MaximizeWindow(byval window as SDL_Window ptr) as boolean
declare function SDL_MinimizeWindow(byval window as SDL_Window ptr) as boolean
declare function SDL_RestoreWindow(byval window as SDL_Window ptr) as boolean
declare function SDL_SetWindowFullscreen(byval window as SDL_Window ptr, byval fullscreen as boolean) as boolean
declare function SDL_SyncWindow(byval window as SDL_Window ptr) as boolean
declare function SDL_WindowHasSurface(byval window as SDL_Window ptr) as boolean
declare function SDL_GetWindowSurface(byval window as SDL_Window ptr) as SDL_Surface ptr
declare function SDL_SetWindowSurfaceVSync(byval window as SDL_Window ptr, byval vsync as long) as boolean

const SDL_WINDOW_SURFACE_VSYNC_DISABLED = 0
const SDL_WINDOW_SURFACE_VSYNC_ADAPTIVE = -1

declare function SDL_GetWindowSurfaceVSync(byval window as SDL_Window ptr, byval vsync as long ptr) as boolean
declare function SDL_UpdateWindowSurface(byval window as SDL_Window ptr) as boolean
declare function SDL_UpdateWindowSurfaceRects(byval window as SDL_Window ptr, byval rects as const SDL_Rect ptr, byval numrects as long) as boolean
declare function SDL_DestroyWindowSurface(byval window as SDL_Window ptr) as boolean
declare function SDL_SetWindowKeyboardGrab(byval window as SDL_Window ptr, byval grabbed as boolean) as boolean
declare function SDL_SetWindowMouseGrab(byval window as SDL_Window ptr, byval grabbed as boolean) as boolean
declare function SDL_GetWindowKeyboardGrab(byval window as SDL_Window ptr) as boolean
declare function SDL_GetWindowMouseGrab(byval window as SDL_Window ptr) as boolean
declare function SDL_GetGrabbedWindow() as SDL_Window ptr
declare function SDL_SetWindowMouseRect(byval window as SDL_Window ptr, byval rect as const SDL_Rect ptr) as boolean
declare function SDL_GetWindowMouseRect(byval window as SDL_Window ptr) as const SDL_Rect ptr
declare function SDL_SetWindowOpacity(byval window as SDL_Window ptr, byval opacity as single) as boolean
declare function SDL_GetWindowOpacity(byval window as SDL_Window ptr) as single
declare function SDL_SetWindowParent(byval window as SDL_Window ptr, byval parent as SDL_Window ptr) as boolean
declare function SDL_SetWindowModal(byval window as SDL_Window ptr, byval modal as boolean) as boolean
declare function SDL_SetWindowFocusable(byval window as SDL_Window ptr, byval focusable as boolean) as boolean
declare function SDL_ShowWindowSystemMenu(byval window as SDL_Window ptr, byval x as long, byval y as long) as boolean

type SDL_HitTestResult as long
enum
	SDL_HITTEST_NORMAL
	SDL_HITTEST_DRAGGABLE
	SDL_HITTEST_RESIZE_TOPLEFT
	SDL_HITTEST_RESIZE_TOP
	SDL_HITTEST_RESIZE_TOPRIGHT
	SDL_HITTEST_RESIZE_RIGHT
	SDL_HITTEST_RESIZE_BOTTOMRIGHT
	SDL_HITTEST_RESIZE_BOTTOM
	SDL_HITTEST_RESIZE_BOTTOMLEFT
	SDL_HITTEST_RESIZE_LEFT
end enum

type SDL_HitTest as function(byval win as SDL_Window ptr, byval area as const SDL_Point ptr, byval data as any ptr) as SDL_HitTestResult
declare function SDL_SetWindowHitTest(byval window as SDL_Window ptr, byval callback as SDL_HitTest, byval callback_data as any ptr) as boolean
declare function SDL_SetWindowShape(byval window as SDL_Window ptr, byval shape as SDL_Surface ptr) as boolean
declare function SDL_FlashWindow(byval window as SDL_Window ptr, byval operation as SDL_FlashOperation) as boolean
declare function SDL_SetWindowProgressState(byval window as SDL_Window ptr, byval state as SDL_ProgressState) as boolean
declare function SDL_GetWindowProgressState(byval window as SDL_Window ptr) as SDL_ProgressState
declare function SDL_SetWindowProgressValue(byval window as SDL_Window ptr, byval value as single) as boolean
declare function SDL_GetWindowProgressValue(byval window as SDL_Window ptr) as single
declare sub SDL_DestroyWindow(byval window as SDL_Window ptr)
declare function SDL_ScreenSaverEnabled() as boolean
declare function SDL_EnableScreenSaver() as boolean
declare function SDL_DisableScreenSaver() as boolean
declare function SDL_GL_LoadLibrary(byval path as const zstring ptr) as boolean
declare function SDL_GL_GetProcAddress(byval proc as const zstring ptr) as SDL_FunctionPointer
declare function SDL_EGL_GetProcAddress(byval proc as const zstring ptr) as SDL_FunctionPointer
declare sub SDL_GL_UnloadLibrary()
declare function SDL_GL_ExtensionSupported(byval extension as const zstring ptr) as boolean
declare sub SDL_GL_ResetAttributes()
declare function SDL_GL_SetAttribute(byval attr as SDL_GLAttr, byval value as long) as boolean
declare function SDL_GL_GetAttribute(byval attr as SDL_GLAttr, byval value as long ptr) as boolean
declare function SDL_GL_CreateContext(byval window as SDL_Window ptr) as SDL_GLContext
declare function SDL_GL_MakeCurrent(byval window as SDL_Window ptr, byval context as SDL_GLContext) as boolean
declare function SDL_GL_GetCurrentWindow() as SDL_Window ptr
declare function SDL_GL_GetCurrentContext() as SDL_GLContext
declare function SDL_EGL_GetCurrentDisplay() as SDL_EGLDisplay
declare function SDL_EGL_GetCurrentConfig() as SDL_EGLConfig
declare function SDL_EGL_GetWindowSurface(byval window as SDL_Window ptr) as SDL_EGLSurface
declare sub SDL_EGL_SetAttributeCallbacks(byval platformAttribCallback as SDL_EGLAttribArrayCallback, byval surfaceAttribCallback as SDL_EGLIntArrayCallback, byval contextAttribCallback as SDL_EGLIntArrayCallback, byval userdata as any ptr)
declare function SDL_GL_SetSwapInterval(byval interval as long) as boolean
declare function SDL_GL_GetSwapInterval(byval interval as long ptr) as boolean
declare function SDL_GL_SwapWindow(byval window as SDL_Window ptr) as boolean
declare function SDL_GL_DestroyContext(byval context as SDL_GLContext) as boolean

end extern
