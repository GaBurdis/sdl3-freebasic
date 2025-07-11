#pragma once

extern "C"

type SDL_DialogFileFilter
	name as const zstring ptr
	pattern as const zstring ptr
end type

type SDL_DialogFileCallback as sub(byval userdata as any ptr, byval filelist as const zstring const ptr ptr, byval filter as long)

declare sub SDL_ShowOpenFileDialog(byval callback as SDL_DialogFileCallback, byval userdata as any ptr, byval window as SDL_Window ptr, byval filters as const SDL_DialogFileFilter ptr, byval nfilters as long, byval default_location as const zstring ptr, byval allow_many as boolean)
declare sub SDL_ShowSaveFileDialog(byval callback as SDL_DialogFileCallback, byval userdata as any ptr, byval window as SDL_Window ptr, byval filters as const SDL_DialogFileFilter ptr, byval nfilters as long, byval default_location as const zstring ptr)
declare sub SDL_ShowOpenFolderDialog(byval callback as SDL_DialogFileCallback, byval userdata as any ptr, byval window as SDL_Window ptr, byval default_location as const zstring ptr, byval allow_many as boolean)

type SDL_FileDialogType as long
enum
    SDL_FILEDIALOG_OPENFILE
    SDL_FILEDIALOG_SAVEFILE
    SDL_FILEDIALOG_OPENFOLDER
end enum

declare sub SDL_ShowFileDialogWithProperties(byval type as SDL_FileDialogType, byval callback as SDL_DialogFileCallback, byval userdata as any ptr, byval props as SDL_PropertiesID)

#define SDL_PROP_FILE_DIALOG_FILTERS_POINTER     "SDL.filedialog.filters"
#define SDL_PROP_FILE_DIALOG_NFILTERS_NUMBER     "SDL.filedialog.nfilters"
#define SDL_PROP_FILE_DIALOG_WINDOW_POINTER      "SDL.filedialog.window"
#define SDL_PROP_FILE_DIALOG_LOCATION_STRING     "SDL.filedialog.location"
#define SDL_PROP_FILE_DIALOG_MANY_BOOLEAN        "SDL.filedialog.many"
#define SDL_PROP_FILE_DIALOG_TITLE_STRING        "SDL.filedialog.title"
#define SDL_PROP_FILE_DIALOG_ACCEPT_STRING       "SDL.filedialog.accept"
#define SDL_PROP_FILE_DIALOG_CANCEL_STRING       "SDL.filedialog.cancel"

end extern
