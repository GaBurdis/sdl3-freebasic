#pragma once

extern "C"

type SDL_Tray as SDL_Tray_
type SDL_TrayMenu as SDL_TrayMenu_
type SDL_TrayEntry as SDL_TrayEntry_

type SDL_TrayEntryFlags as Uint32

const SDL_TRAYENTRY_BUTTON     = &h00000001u
const SDL_TRAYENTRY_CHECKBOX   = &h00000002u
const SDL_TRAYENTRY_SUBMENU    = &h00000004u
const SDL_TRAYENTRY_DISABLED   = &h80000000u
const SDL_TRAYENTRY_CHECKED    = &h40000000u

type SDL_TrayCallback as sub(byval userdata as any ptr, byval entry as SDL_TrayEntry ptr)

declare function SDL_CreateTray(byval icon as SDL_Surface ptr, byval tooltip as const zstring ptr) as SDL_Tray ptr
declare sub SDL_SetTrayIcon(byval tray as SDL_Tray ptr, byval icon as SDL_Surface ptr)
declare sub SDL_SetTrayTooltip(byval tray as SDL_Tray ptr, byval tooltip as const zstring ptr)
declare function SDL_CreateTrayMenu(byval tray as SDL_Tray ptr) as SDL_TrayMenu ptr
declare function SDL_CreateTraySubmenu(byval entry as SDL_TrayEntry ptr) as SDL_TrayMenu ptr
declare function SDL_GetTrayMenu(byval tray as SDL_Tray ptr) as SDL_TrayMenu ptr
declare function SDL_GetTraySubmenu(byval entry as SDL_TrayEntry ptr) as SDL_TrayMenu ptr
declare function SDL_GetTrayEntries(byval menu as SDL_TrayMenu ptr, byval count as long ptr) as const SDL_TrayEntry ptr ptr
declare sub SDL_RemoveTrayEntry(byval entry as SDL_TrayEntry ptr)
declare function SDL_InsertTrayEntryAt(byval menu as SDL_TrayMenu ptr, byval pos as long, byval label as const zstring ptr, byval flags as SDL_TrayEntryFlags) as SDL_TrayEntry ptr
declare sub SDL_SetTrayEntryLabel(byval entry as SDL_TrayEntry ptr, byval label as const zstring ptr)
declare function SDL_GetTrayEntryLabel(byval entry as SDL_TrayEntry ptr) as const zstring ptr
declare sub SDL_SetTrayEntryChecked(byval entry as SDL_TrayEntry ptr, byval checked as boolean)
declare function SDL_GetTrayEntryChecked(byval entry as SDL_TrayEntry ptr) as boolean
declare sub SDL_SetTrayEntryEnabled(byval entry as SDL_TrayEntry ptr, byval enabled as boolean)
declare function SDL_GetTrayEntryEnabled(byval entry as SDL_TrayEntry ptr) as boolean
declare sub SDL_SetTrayEntryCallback(byval entry as SDL_TrayEntry ptr, byval callback as SDL_TrayCallback, byval userdata as any ptr)
declare sub SDL_ClickTrayEntry(byval entry as SDL_TrayEntry ptr)
declare sub SDL_DestroyTray(byval tray as SDL_Tray ptr)
declare function SDL_GetTrayEntryParent(byval entry as SDL_TrayEntry ptr) as SDL_TrayMenu ptr
declare function SDL_GetTrayMenuParentEntry(byval menu as SDL_TrayMenu ptr) as SDL_TrayEntry ptr
declare function SDL_GetTrayMenuParentTray(byval menu as SDL_TrayMenu ptr) as SDL_Tray ptr
declare sub SDL_UpdateTrays()

end extern
