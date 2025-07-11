#pragma once

extern "C"

type SDL_SurfaceFlags as Uint32

const SDL_SURFACE_PREALLOCATED = &h00000001u
const SDL_SURFACE_LOCK_NEEDED  = &h00000002u
const SDL_SURFACE_LOCKED       = &h00000004u
const SDL_SURFACE_SIMD_ALIGNED = &h00000008u

#define SDL_MUSTLOCK(S) (((S)->flags and SDL_SURFACE_LOCK_NEEDED) = SDL_SURFACE_LOCK_NEEDED)

type SDL_ScaleMode as long
enum
	SDL_SCALEMODE_INVALID = -1
    SDL_SCALEMODE_NEAREST
	SDL_SCALEMODE_LINEAR
end enum

type SDL_FlipMode as long
enum
	SDL_FLIP_NONE
	SDL_FLIP_HORIZONTAL
	SDL_FLIP_VERTICAL
end enum

#ifndef SDL_INTERNAL
type SDL_Surface
	flags as SDL_SurfaceFlags
	format as SDL_PixelFormat
	w as long
	h as long
	pitch as long
	pixels as any ptr
	refcount as long
	reserved as any ptr
end type
#else
    type SDL_Surface as _SDL_Surface
#endif

declare function SDL_CreateSurface(byval width as long, byval height as long, byval format as SDL_PixelFormat) as SDL_Surface ptr
declare function SDL_CreateSurfaceFrom(byval width as long, byval height as long, byval format as SDL_PixelFormat, byval pixels as any ptr, byval pitch as long) as SDL_Surface ptr
declare sub SDL_DestroySurface(byval surface as SDL_Surface ptr)
declare function SDL_GetSurfaceProperties(byval surface as SDL_Surface ptr) as SDL_PropertiesID

#define SDL_PROP_SURFACE_SDR_WHITE_POINT_FLOAT   "SDL.surface.SDR_white_point"
#define SDL_PROP_SURFACE_HDR_HEADROOM_FLOAT      "SDL.surface.HDR_headroom"
#define SDL_PROP_SURFACE_TONEMAP_OPERATOR_STRING "SDL.surface.tonemap"
#define SDL_PROP_SURFACE_HOTSPOT_X_NUMBER        "SDL.surface.hotspot.x"
#define SDL_PROP_SURFACE_HOTSPOT_Y_NUMBER        "SDL.surface.hotspot.y"

declare function SDL_SetSurfaceColorspace(byval surface as SDL_Surface ptr, byval colorspace as SDL_Colorspace) as boolean
declare function SDL_GetSurfaceColorspace(byval surface as SDL_Surface ptr) as SDL_Colorspace
declare function SDL_CreateSurfacePalette(byval surface as SDL_Surface ptr) as SDL_Palette ptr
declare function SDL_SetSurfacePalette(byval surface as SDL_Surface ptr, byval palette as SDL_Palette ptr) as boolean
declare function SDL_GetSurfacePalette(byval surface as SDL_Surface ptr) as SDL_Palette ptr
declare function SDL_AddSurfaceAlternateImage(byval surface as SDL_Surface ptr, byval image as SDL_Surface ptr) as boolean
declare function SDL_SurfaceHasAlternateImages(byval surface as SDL_Surface ptr) as boolean
declare function SDL_GetSurfaceImages(byval surface as SDL_Surface ptr, byval count as long ptr) as SDL_Surface ptr ptr
declare sub SDL_RemoveSurfaceAlternateImages(byval surface as SDL_Surface ptr)
declare function SDL_LockSurface(byval surface as SDL_Surface ptr) as boolean
declare sub SDL_UnlockSurface(byval surface as SDL_Surface ptr)
declare function SDL_LoadBMP_IO(byval src as SDL_IOStream ptr, byval closeio as boolean) as SDL_Surface ptr
declare function SDL_LoadBMP(byval file as const zstring ptr) as SDL_Surface ptr
declare function SDL_SaveBMP_IO(byval surface as SDL_Surface ptr, byval dst as SDL_IOStream ptr, byval closeio as boolean) as boolean
declare function SDL_SaveBMP(byval surface as SDL_Surface ptr, byval file as const zstring ptr) as boolean
declare function SDL_SetSurfaceRLE(byval surface as SDL_Surface ptr, byval enabled as boolean) as boolean
declare function SDL_SurfaceHasRLE(byval surface as SDL_Surface ptr) as boolean
declare function SDL_SetSurfaceColorKey(byval surface as SDL_Surface ptr, byval enabled as boolean, byval key as Uint32) as boolean
declare function SDL_SurfaceHasColorKey(byval surface as SDL_Surface ptr) as boolean
declare function SDL_GetSurfaceColorKey(byval surface as SDL_Surface ptr, byval key as Uint32 ptr) as boolean
declare function SDL_SetSurfaceColorMod(byval surface as SDL_Surface ptr, byval r as Uint8, byval g as Uint8, byval b as Uint8) as boolean
declare function SDL_GetSurfaceColorMod(byval surface as SDL_Surface ptr, byval r as Uint8 ptr, byval g as Uint8 ptr, byval b as Uint8 ptr) as boolean
declare function SDL_SetSurfaceAlphaMod(byval surface as SDL_Surface ptr, byval alpha as Uint8) as boolean
declare function SDL_GetSurfaceAlphaMod(byval surface as SDL_Surface ptr, byval alpha as Uint8 ptr) as boolean
declare function SDL_SetSurfaceBlendMode(byval surface as SDL_Surface ptr, byval blendMode as SDL_BlendMode) as boolean
declare function SDL_GetSurfaceBlendMode(byval surface as SDL_Surface ptr, byval blendMode as SDL_BlendMode ptr) as boolean
declare function SDL_SetSurfaceClipRect(byval surface as SDL_Surface ptr, byval rect as const SDL_Rect ptr) as boolean
declare function SDL_GetSurfaceClipRect(byval surface as SDL_Surface ptr, byval rect as SDL_Rect ptr) as boolean
declare function SDL_FlipSurface(byval surface as SDL_Surface ptr, byval flip as SDL_FlipMode) as boolean
declare function SDL_DuplicateSurface(byval surface as SDL_Surface ptr) as SDL_Surface ptr
declare function SDL_ScaleSurface(byval surface as SDL_Surface ptr, byval width as long, byval height as long, byval scaleMode as SDL_ScaleMode) as SDL_Surface ptr
declare function SDL_ConvertSurface(byval surface as SDL_Surface ptr, byval format as SDL_PixelFormat) as SDL_Surface ptr
declare function SDL_ConvertSurfaceAndColorspace(byval surface as SDL_Surface ptr, byval format as SDL_PixelFormat, byval palette as SDL_Palette ptr, byval colorspace as SDL_Colorspace, byval props as SDL_PropertiesID) as SDL_Surface ptr
declare function SDL_ConvertPixels(byval width as long, byval height as long, byval src_format as SDL_PixelFormat, byval src as const any ptr, byval src_pitch as long, byval dst_format as SDL_PixelFormat, byval dst as any ptr, byval dst_pitch as long) as boolean
declare function SDL_ConvertPixelsAndColorspace(byval width as long, byval height as long, byval src_format as SDL_PixelFormat, byval src_colorspace as SDL_Colorspace, byval src_properties as SDL_PropertiesID, byval src as const any ptr, byval src_pitch as long, byval dst_format as SDL_PixelFormat, byval dst_colorspace as SDL_Colorspace, byval dst_properties as SDL_PropertiesID, byval dst as any ptr, byval dst_pitch as long) as boolean
declare function SDL_PremultiplyAlpha(byval width as long, byval height as long, byval src_format as SDL_PixelFormat, byval src as const any ptr, byval src_pitch as long, byval dst_format as SDL_PixelFormat, byval dst as any ptr, byval dst_pitch as long, byval linear as boolean) as boolean
declare function SDL_PremultiplySurfaceAlpha(byval surface as SDL_Surface ptr, byval linear as boolean) as boolean
declare function SDL_ClearSurface(byval surface as SDL_Surface ptr, byval r as single, byval g as single, byval b as single, byval a as single) as boolean
declare function SDL_FillSurfaceRect(byval dst as SDL_Surface ptr, byval rect as const SDL_Rect ptr, byval color as Uint32) as boolean
declare function SDL_FillSurfaceRects(byval dst as SDL_Surface ptr, byval rects as const SDL_Rect ptr, byval count as long, byval color as Uint32) as boolean
declare function SDL_BlitSurface(byval src as SDL_Surface ptr, byval srcrect as const SDL_Rect ptr, byval dst as SDL_Surface ptr, byval dstrect as const SDL_Rect ptr) as boolean
declare function SDL_BlitSurfaceUnchecked(byval src as SDL_Surface ptr, byval srcrect as const SDL_Rect ptr, byval dst as SDL_Surface ptr, byval dstrect as const SDL_Rect ptr) as boolean
declare function SDL_BlitSurfaceScaled(byval src as SDL_Surface ptr, byval srcrect as const SDL_Rect ptr, byval dst as SDL_Surface ptr, byval dstrect as const SDL_Rect ptr, byval scaleMode as SDL_ScaleMode) as boolean
declare function SDL_BlitSurfaceUncheckedScaled(byval src as SDL_Surface ptr, byval srcrect as const SDL_Rect ptr, byval dst as SDL_Surface ptr, byval dstrect as const SDL_Rect ptr, byval scaleMode as SDL_ScaleMode) as boolean
declare function SDL_StretchSurface(byval src as SDL_Surface ptr, byval srcrect as const SDL_Rect ptr, byval dst as SDL_Surface ptr, byval dstrect as const SDL_Rect ptr, byval scaleMode as SDL_ScaleMode) as boolean
declare function SDL_BlitSurfaceTiled(byval src as SDL_Surface ptr, byval srcrect as const SDL_Rect ptr, byval dst as SDL_Surface ptr, byval dstrect as const SDL_Rect ptr) as boolean
declare function SDL_BlitSurfaceTiledWithScale(byval src as SDL_Surface ptr, byval srcrect as const SDL_Rect ptr, byval scale as single, byval scaleMode as SDL_ScaleMode, byval dst as SDL_Surface ptr, byval dstrect as const SDL_Rect ptr) as boolean
declare function SDL_BlitSurface9Grid(byval src as SDL_Surface ptr, byval srcrect as const SDL_Rect ptr, byval left_width as long, byval right_width as long, byval top_height as long, byval bottom_height as long, byval scale as single, byval scaleMode as SDL_ScaleMode, byval dst as SDL_Surface ptr, byval dstrect as const SDL_Rect ptr) as boolean
declare function SDL_MapSurfaceRGB(byval surface as SDL_Surface ptr, byval r as Uint8, byval g as Uint8, byval b as Uint8) as Uint32
declare function SDL_MapSurfaceRGBA(byval surface as SDL_Surface ptr, byval r as Uint8, byval g as Uint8, byval b as Uint8, byval a as Uint8) as Uint32
declare function SDL_ReadSurfacePixel(byval surface as SDL_Surface ptr, byval x as long, byval y as long, byval r as Uint8 ptr, byval g as Uint8 ptr, byval b as Uint8 ptr, byval a as Uint8 ptr) as boolean
declare function SDL_ReadSurfacePixelFloat(byval surface as SDL_Surface ptr, byval x as long, byval y as long, byval r as single ptr, byval g as single ptr, byval b as single ptr, byval a as single ptr) as boolean
declare function SDL_WriteSurfacePixel(byval surface as SDL_Surface ptr, byval x as long, byval y as long, byval r as Uint8, byval g as Uint8, byval b as Uint8, byval a as Uint8) as boolean
declare function SDL_WriteSurfacePixelFloat(byval surface as SDL_Surface ptr, byval x as long, byval y as long, byval r as single, byval g as single, byval b as single, byval a as single) as boolean

end extern
