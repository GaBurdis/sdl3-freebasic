#pragma once

extern "C"

#if defined(SDL_PLATFORM_WINDOWS)
  type MSG as tagMSG

  type SDL_WindowsMessageHook as function(byval userdata as any ptr, byval msg as MSG ptr) as boolean

  declare sub SDL_SetWindowsMessageHook(byval callback as SDL_WindowsMessageHook, byval userdata as any ptr)
#endif

#if defined(SDL_PLATFORM_WIN32) or defined(SDL_PLATFORM_WINGDK)
  declare function SDL_GetDirect3D9AdapterIndex(byval displayID as SDL_DisplayID) as long
  declare function SDL_GetDXGIOutputInfo(byval displayID as SDL_DisplayID, byval adapterIndex as long ptr, byval outputIndex as long ptr) as boolean
#endif

type XEvent as _XEvent
type SDL_X11EventHook as function(byval userdata as any ptr, byval xevent as XEvent ptr) as boolean
declare sub SDL_SetX11EventHook(byval callback as SDL_X11EventHook, byval userdata as any ptr)

#ifdef SDL_PLATFORM_LINUX
  declare function SDL_SetLinuxThreadPriority(byval threadID as Sint64, byval priority as long) as boolean
  declare function SDL_SetLinuxThreadPriorityAndPolicy(byval threadID as Sint64, byval sdlPriority as long, byval schedPolicy as long) as boolean
#endif

#ifdef SDL_PLATFORM_IOS
  type SDL_iOSAnimationCallback as sub(byval userdata as any ptr)
  declare function SDL_SetiOSAnimationCallback(byval window as SDL_Window ptr, byval interval as long, byval callback as SDL_iOSAnimationCallback, byval callbackParam as any ptr) as boolean
  declare sub SDL_SetiOSEventPump(byval enabled as boolean)
#endif

#ifdef SDL_PLATFORM_ANDROID
  declare function SDL_GetAndroidJNIEnv() as any ptr
  declare function SDL_GetAndroidActivity() as any ptr
  declare function SDL_GetAndroidSDKVersion() as long
  declare function SDL_IsChromebook() as boolean
  declare function SDL_IsDeXMode() as boolean
  declare sub SDL_SendAndroidBackButton()

  #define SDL_ANDROID_EXTERNAL_STORAGE_READ   &h01
  #define SDL_ANDROID_EXTERNAL_STORAGE_WRITE  &h02
 
  declare function SDL_GetAndroidInternalStoragePath() as const zstring ptr
  declare function SDL_GetAndroidExternalStorageState() as Uint32
  declare function SDL_GetAndroidExternalStoragePath() as const zstring ptr
  declare function SDL_GetAndroidCachePath() as const zstring ptr

  type SDL_RequestAndroidPermissionCallback as sub(byval userdata as any ptr, byval permission as const zstring ptr, byval granted as boolean)
 
  declare function SDL_RequestAndroidPermission(byval permission as const zstring ptr, byval cb as SDL_RequestAndroidPermissionCallback, byval userdata as any ptr) as boolean
  declare function SDL_ShowAndroidToast(byval message as const zstring ptr, byval duration as long, byval gravity as long, byval xoffset as long, byval yoffset as long) as boolean
  declare function SDL_SendAndroidMessage(byval command as Uint32, byval param as long) as boolean
#endif

declare function SDL_IsTablet() as boolean
declare function SDL_IsTV() as boolean

type SDL_Sandbox as long
enum
	SDL_SANDBOX_NONE = 0
	SDL_SANDBOX_UNKNOWN_CONTAINER
	SDL_SANDBOX_FLATPAK
	SDL_SANDBOX_SNAP
	SDL_SANDBOX_MACOS
end enum

declare function SDL_GetSandbox() as SDL_Sandbox
declare sub SDL_OnApplicationWillTerminate()
declare sub SDL_OnApplicationDidReceiveMemoryWarning()
declare sub SDL_OnApplicationWillEnterBackground()
declare sub SDL_OnApplicationDidEnterBackground()
declare sub SDL_OnApplicationWillEnterForeground()
declare sub SDL_OnApplicationDidEnterForeground()

#ifdef SDL_PLATFORM_IOS
  declare sub SDL_OnApplicationDidChangeStatusBarOrientation()
#endif

#ifdef SDL_PLATFORM_GDK
  type XTaskQueueHandle as XTaskQueueObject ptr
  type XUserHandle as XUser ptr

  declare function SDL_GetGDKTaskQueue(byval outTaskQueue as XTaskQueueHandle ptr) as boolean
  declare function SDL_GetGDKDefaultUser(byval outUserHandle as XUserHandle ptr) as boolean
#endif

end extern
