#pragma once

extern "C"

type SDL_PropertiesID as Uint32

type SDL_PropertyType as long
enum
	SDL_PROPERTY_TYPE_INVALID
	SDL_PROPERTY_TYPE_POINTER
	SDL_PROPERTY_TYPE_STRING
	SDL_PROPERTY_TYPE_NUMBER
	SDL_PROPERTY_TYPE_FLOAT
	SDL_PROPERTY_TYPE_BOOLEAN
end enum

declare function SDL_GetGlobalProperties() as SDL_PropertiesID
declare function SDL_CreateProperties() as SDL_PropertiesID
declare function SDL_CopyProperties(byval src as SDL_PropertiesID, byval dst as SDL_PropertiesID) as boolean
declare function SDL_LockProperties(byval props as SDL_PropertiesID) as boolean
declare sub SDL_UnlockProperties(byval props as SDL_PropertiesID)
type SDL_CleanupPropertyCallback as sub(byval userdata as any ptr, byval value as any ptr)
declare function SDL_SetPointerPropertyWithCleanup(byval props as SDL_PropertiesID, byval name as const zstring ptr, byval value as any ptr, byval cleanup as SDL_CleanupPropertyCallback, byval userdata as any ptr) as boolean
declare function SDL_SetPointerProperty(byval props as SDL_PropertiesID, byval name as const zstring ptr, byval value as any ptr) as boolean
declare function SDL_SetStringProperty(byval props as SDL_PropertiesID, byval name as const zstring ptr, byval value as const zstring ptr) as boolean
declare function SDL_SetNumberProperty(byval props as SDL_PropertiesID, byval name as const zstring ptr, byval value as Sint64) as boolean
declare function SDL_SetFloatProperty(byval props as SDL_PropertiesID, byval name as const zstring ptr, byval value as single) as boolean
declare function SDL_SetBooleanProperty(byval props as SDL_PropertiesID, byval name as const zstring ptr, byval value as boolean) as boolean
declare function SDL_HasProperty(byval props as SDL_PropertiesID, byval name as const zstring ptr) as boolean
declare function SDL_GetPropertyType(byval props as SDL_PropertiesID, byval name as const zstring ptr) as SDL_PropertyType
declare function SDL_GetPointerProperty(byval props as SDL_PropertiesID, byval name as const zstring ptr, byval default_value as any ptr) as any ptr
declare function SDL_GetStringProperty(byval props as SDL_PropertiesID, byval name as const zstring ptr, byval default_value as const zstring ptr) as const zstring ptr
declare function SDL_GetNumberProperty(byval props as SDL_PropertiesID, byval name as const zstring ptr, byval default_value as Sint64) as Sint64
declare function SDL_GetFloatProperty(byval props as SDL_PropertiesID, byval name as const zstring ptr, byval default_value as single) as single
declare function SDL_GetBooleanProperty(byval props as SDL_PropertiesID, byval name as const zstring ptr, byval default_value as boolean) as boolean
declare function SDL_ClearProperty(byval props as SDL_PropertiesID, byval name as const zstring ptr) as boolean
type SDL_EnumeratePropertiesCallback as sub(byval userdata as any ptr, byval props as SDL_PropertiesID, byval name as const zstring ptr)
declare function SDL_EnumerateProperties(byval props as SDL_PropertiesID, byval callback as SDL_EnumeratePropertiesCallback, byval userdata as any ptr) as boolean
declare sub SDL_DestroyProperties(byval props as SDL_PropertiesID)

end extern
