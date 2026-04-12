'' FreeBASIC binding for SDL3_ttf-3.2.2
''
'' based on the C header files:
''  SDL_ttf:  A companion library to SDL for working with TrueType (tm) fonts
''  Copyright (C) 2001-2025 Sam Lantinga <slouken@libsdl.org>
''
''  This software is provided 'as-is', without any express or implied
''  warranty.  In no event will the authors be held liable for any damages
''  arising from the use of this software.
''
''  Permission is granted to anyone to use this software for any purpose,
''  including commercial applications, and to alter it and redistribute it
''  freely, subject to the following restrictions:
''
''  1. The origin of this software must not be misrepresented; you must not
''     claim that you wrote the original software. If you use this software
''     in a product, an acknowledgment in the product documentation would be
''     appreciated but is not required.
''  2. Altered source versions must be plainly marked as such, and must not be
''     misrepresented as being the original software.
''  3. This notice may not be removed or altered from any source distribution.

#pragma once

#inclib "SDL3_ttf"

#include once "SDL3/SDL.bi"

extern "C"

const SDL_TTF_MAJOR_VERSION = 3
const SDL_TTF_MINOR_VERSION = 2
const SDL_TTF_MICRO_VERSION = 2

#define SDL_TTF_VERSION SDL_VERSIONNUM(SDL_TTF_MAJOR_VERSION, SDL_TTF_MINOR_VERSION, SDL_TTF_MICRO_VERSION)
#define SDL_TTF_VERSION_ATLEAST(X, Y, Z) (((SDL_TTF_MAJOR_VERSION >= X) andalso ((SDL_TTF_MAJOR_VERSION > X) orelse (SDL_TTF_MINOR_VERSION >= Y))) andalso (((SDL_TTF_MAJOR_VERSION > X) orelse (SDL_TTF_MINOR_VERSION > Y)) orelse (SDL_TTF_MICRO_VERSION >= Z)))

declare function TTF_Version() as long
declare sub TTF_GetFreeTypeVersion(byval major as long ptr, byval minor as long ptr, byval patch as long ptr)
declare sub TTF_GetHarfBuzzVersion(byval major as long ptr, byval minor as long ptr, byval patch as long ptr)

type TTF_Font as TTF_Font_

declare function TTF_Init() as boolean
declare function TTF_OpenFont(byval file as const zstring ptr, byval ptsize as single) as TTF_Font ptr
declare function TTF_OpenFontIO(byval src as SDL_IOStream ptr, byval closeio as boolean, byval ptsize as single) as TTF_Font ptr
declare function TTF_OpenFontWithProperties(byval props as SDL_PropertiesID) as TTF_Font ptr

#define TTF_PROP_FONT_CREATE_FILENAME_STRING "SDL_ttf.font.create.filename"
#define TTF_PROP_FONT_CREATE_IOSTREAM_POINTER "SDL_ttf.font.create.iostream"
#define TTF_PROP_FONT_CREATE_IOSTREAM_OFFSET_NUMBER "SDL_ttf.font.create.iostream.offset"
#define TTF_PROP_FONT_CREATE_IOSTREAM_AUTOCLOSE_BOOLEAN "SDL_ttf.font.create.iostream.autoclose"
#define TTF_PROP_FONT_CREATE_SIZE_FLOAT "SDL_ttf.font.create.size"
#define TTF_PROP_FONT_CREATE_FACE_NUMBER "SDL_ttf.font.create.face"
#define TTF_PROP_FONT_CREATE_HORIZONTAL_DPI_NUMBER "SDL_ttf.font.create.hdpi"
#define TTF_PROP_FONT_CREATE_VERTICAL_DPI_NUMBER "SDL_ttf.font.create.vdpi"
#define TTF_PROP_FONT_CREATE_EXISTING_FONT "SDL_ttf.font.create.existing_font"

declare function TTF_CopyFont(byval existing_font as TTF_Font ptr) as TTF_Font ptr
declare function TTF_GetFontProperties(byval font as TTF_Font ptr) as SDL_PropertiesID

#define TTF_PROP_FONT_OUTLINE_LINE_CAP_NUMBER "SDL_ttf.font.outline.line_cap"
#define TTF_PROP_FONT_OUTLINE_LINE_JOIN_NUMBER "SDL_ttf.font.outline.line_join"
#define TTF_PROP_FONT_OUTLINE_MITER_LIMIT_NUMBER "SDL_ttf.font.outline.miter_limit"

declare function TTF_GetFontGeneration(byval font as TTF_Font ptr) as Uint32
declare function TTF_AddFallbackFont(byval font as TTF_Font ptr, byval fallback as TTF_Font ptr) as boolean
declare sub TTF_RemoveFallbackFont(byval font as TTF_Font ptr, byval fallback as TTF_Font ptr)
declare sub TTF_ClearFallbackFonts(byval font as TTF_Font ptr)
declare function TTF_SetFontSize(byval font as TTF_Font ptr, byval ptsize as single) as boolean
declare function TTF_SetFontSizeDPI(byval font as TTF_Font ptr, byval ptsize as single, byval hdpi as long, byval vdpi as long) as boolean
declare function TTF_GetFontSize(byval font as TTF_Font ptr) as single
declare function TTF_GetFontDPI(byval font as TTF_Font ptr, byval hdpi as long ptr, byval vdpi as long ptr) as boolean

type TTF_FontStyleFlags as Uint32

const TTF_STYLE_NORMAL = &h00
const TTF_STYLE_BOLD = &h01
const TTF_STYLE_ITALIC = &h02
const TTF_STYLE_UNDERLINE = &h04
const TTF_STYLE_STRIKETHROUGH = &h08

declare sub TTF_SetFontStyle(byval font as TTF_Font ptr, byval style as TTF_FontStyleFlags)
declare function TTF_GetFontStyle(byval font as const TTF_Font ptr) as TTF_FontStyleFlags
declare function TTF_SetFontOutline(byval font as TTF_Font ptr, byval outline as long) as boolean
declare function TTF_GetFontOutline(byval font as const TTF_Font ptr) as long

enum TTF_HintingFlags
	TTF_HINTING_INVALID = -1
	TTF_HINTING_NORMAL
	TTF_HINTING_LIGHT
	TTF_HINTING_MONO
	TTF_HINTING_NONE
	TTF_HINTING_LIGHT_SUBPIXEL
end enum

declare sub TTF_SetFontHinting(byval font as TTF_Font ptr, byval hinting as TTF_HintingFlags)
declare function TTF_GetNumFontFaces(byval font as const TTF_Font ptr) as long

declare function TTF_GetFontHinting(byval font as const TTF_Font ptr) as TTF_HintingFlags
declare function TTF_SetFontSDF(byval font as TTF_Font ptr, byval enabled as boolean) as boolean
declare function TTF_GetFontSDF(byval font as const TTF_Font ptr) as boolean
declare function TTF_GetFontWeight(byval font as const TTF_Font ptr) as long

const TTF_FONT_WEIGHT_THIN = 100
const TTF_FONT_WEIGHT_EXTRA_LIGHT = 200
const TTF_FONT_WEIGHT_LIGHT = 300
const TTF_FONT_WEIGHT_NORMAL = 400
const TTF_FONT_WEIGHT_MEDIUM = 500
const TTF_FONT_WEIGHT_SEMI_BOLD = 600
const TTF_FONT_WEIGHT_BOLD = 700
const TTF_FONT_WEIGHT_EXTRA_BOLD = 800
const TTF_FONT_WEIGHT_BLACK = 900
const TTF_FONT_WEIGHT_EXTRA_BLACK = 950

enum TTF_HorizontalAlignment
	TTF_HORIZONTAL_ALIGN_INVALID = -1
	TTF_HORIZONTAL_ALIGN_LEFT
	TTF_HORIZONTAL_ALIGN_CENTER
	TTF_HORIZONTAL_ALIGN_RIGHT
end enum

declare sub TTF_SetFontWrapAlignment(byval font as TTF_Font ptr, byval align as TTF_HorizontalAlignment)
declare function TTF_GetFontWrapAlignment(byval font as const TTF_Font ptr) as TTF_HorizontalAlignment
declare function TTF_GetFontHeight(byval font as const TTF_Font ptr) as long
declare function TTF_GetFontAscent(byval font as const TTF_Font ptr) as long
declare function TTF_GetFontDescent(byval font as const TTF_Font ptr) as long
declare sub TTF_SetFontLineSkip(byval font as TTF_Font ptr, byval lineskip as long)
declare function TTF_GetFontLineSkip(byval font as const TTF_Font ptr) as long
declare sub TTF_SetFontKerning(byval font as TTF_Font ptr, byval enabled as boolean)
declare function TTF_GetFontKerning(byval font as const TTF_Font ptr) as boolean
declare function TTF_FontIsFixedWidth(byval font as const TTF_Font ptr) as boolean
declare function TTF_FontIsScalable(byval font as const TTF_Font ptr) as boolean
declare function TTF_GetFontFamilyName(byval font as const TTF_Font ptr) as const zstring ptr
declare function TTF_GetFontStyleName(byval font as const TTF_Font ptr) as const zstring ptr

enum TTF_Direction
	TTF_DIRECTION_INVALID = 0
	TTF_DIRECTION_LTR = 4
	TTF_DIRECTION_RTL
	TTF_DIRECTION_TTB
	TTF_DIRECTION_BTT
end enum

declare function TTF_SetFontDirection(byval font as TTF_Font ptr, byval direction as TTF_Direction) as boolean
declare function TTF_GetFontDirection(byval font as TTF_Font ptr) as TTF_Direction
declare function TTF_StringToTag(byval string_ as const zstring ptr) as Uint32
declare sub TTF_TagToString(byval tag as Uint32, byval string_ as zstring ptr, byval size as uinteger)
declare function TTF_SetFontScript(byval font as TTF_Font ptr, byval script as Uint32) as boolean
declare function TTF_GetFontScript(byval font as TTF_Font ptr) as Uint32
declare function TTF_GetGlyphScript(byval ch as Uint32) as Uint32
declare function TTF_SetFontLanguage(byval font as TTF_Font ptr, byval language_bcp47 as const zstring ptr) as boolean
declare function TTF_FontHasGlyph(byval font as TTF_Font ptr, byval ch as Uint32) as boolean

enum TTF_ImageType
	TTF_IMAGE_INVALID
	TTF_IMAGE_ALPHA
	TTF_IMAGE_COLOR
	TTF_IMAGE_SDF
end enum

declare function TTF_GetGlyphImage(byval font as TTF_Font ptr, byval ch as Uint32, byval image_type as TTF_ImageType ptr) as SDL_Surface ptr
declare function TTF_GetGlyphImageForIndex(byval font as TTF_Font ptr, byval glyph_index as Uint32, byval image_type as TTF_ImageType ptr) as SDL_Surface ptr
declare function TTF_GetGlyphMetrics(byval font as TTF_Font ptr, byval ch as Uint32, byval minx as long ptr, byval maxx as long ptr, byval miny as long ptr, byval maxy as long ptr, byval advance as long ptr) as boolean
declare function TTF_GetGlyphKerning(byval font as TTF_Font ptr, byval previous_ch as Uint32, byval ch as Uint32, byval kerning as long ptr) as boolean
declare function TTF_GetStringSize(byval font as TTF_Font ptr, byval text as const zstring ptr, byval length as uinteger, byval w as long ptr, byval h as long ptr) as boolean
declare function TTF_GetStringSizeWrapped(byval font as TTF_Font ptr, byval text as const zstring ptr, byval length as uinteger, byval wrap_width as long, byval w as long ptr, byval h as long ptr) as boolean
declare function TTF_MeasureString(byval font as TTF_Font ptr, byval text as const zstring ptr, byval length as uinteger, byval max_width as long, byval measured_width as long ptr, byval measured_length as uinteger ptr) as boolean

declare function TTF_RenderText_Solid(byval font as TTF_Font ptr, byval text as const zstring ptr, byval length as uinteger, byval fg as SDL_Color) as SDL_Surface ptr
declare function TTF_RenderText_Solid_Wrapped(byval font as TTF_Font ptr, byval text as const zstring ptr, byval length as uinteger, byval fg as SDL_Color, byval wrapLength as long) as SDL_Surface ptr
declare function TTF_RenderGlyph_Solid(byval font as TTF_Font ptr, byval ch as Uint32, byval fg as SDL_Color) as SDL_Surface ptr
declare function TTF_RenderText_Shaded(byval font as TTF_Font ptr, byval text as const zstring ptr, byval length as uinteger, byval fg as SDL_Color, byval bg as SDL_Color) as SDL_Surface ptr
declare function TTF_RenderText_Shaded_Wrapped(byval font as TTF_Font ptr, byval text as const zstring ptr, byval length as uinteger, byval fg as SDL_Color, byval bg as SDL_Color, byval wrap_width as long) as SDL_Surface ptr
declare function TTF_RenderGlyph_Shaded(byval font as TTF_Font ptr, byval ch as Uint32, byval fg as SDL_Color, byval bg as SDL_Color) as SDL_Surface ptr
declare function TTF_RenderText_Blended(byval font as TTF_Font ptr, byval text as const zstring ptr, byval length as uinteger, byval fg as SDL_Color) as SDL_Surface ptr
declare function TTF_RenderText_Blended_Wrapped(byval font as TTF_Font ptr, byval text as const zstring ptr, byval length as uinteger, byval fg as SDL_Color, byval wrap_width as long) as SDL_Surface ptr
declare function TTF_RenderGlyph_Blended(byval font as TTF_Font ptr, byval ch as Uint32, byval fg as SDL_Color) as SDL_Surface ptr
declare function TTF_RenderText_LCD(byval font as TTF_Font ptr, byval text as const zstring ptr, byval length as uinteger, byval fg as SDL_Color, byval bg as SDL_Color) as SDL_Surface ptr
declare function TTF_RenderText_LCD_Wrapped(byval font as TTF_Font ptr, byval text as const zstring ptr, byval length as uinteger, byval fg as SDL_Color, byval bg as SDL_Color, byval wrap_width as long) as SDL_Surface ptr
declare function TTF_RenderGlyph_LCD(byval font as TTF_Font ptr, byval ch as Uint32, byval fg as SDL_Color, byval bg as SDL_Color) as SDL_Surface ptr

type TTF_Text
	text as zstring ptr
	num_lines as long
	refcount as long
	internal as TTF_TextData ptr
end type

declare function TTF_CreateSurfaceTextEngine() as TTF_TextEngine ptr
declare function TTF_DrawSurfaceText(byval text as TTF_Text ptr, byval x as long, byval y as long, byval surface as SDL_Surface ptr) as boolean
declare sub TTF_DestroySurfaceTextEngine(byval engine as TTF_TextEngine ptr)
declare function TTF_CreateRendererTextEngine(byval renderer as SDL_Renderer ptr) as TTF_TextEngine ptr
declare function TTF_CreateRendererTextEngineWithProperties(byval props as SDL_PropertiesID) as TTF_TextEngine ptr

#define TTF_PROP_RENDERER_TEXT_ENGINE_RENDERER "SDL_ttf.renderer_text_engine.create.renderer"
#define TTF_PROP_RENDERER_TEXT_ENGINE_ATLAS_TEXTURE_SIZE "SDL_ttf.renderer_text_engine.create.atlas_texture_size"

declare function TTF_DrawRendererText(byval text as TTF_Text ptr, byval x as single, byval y as single) as boolean
declare sub TTF_DestroyRendererTextEngine(byval engine as TTF_TextEngine ptr)
declare function TTF_CreateGPUTextEngine(byval device as SDL_GPUDevice ptr) as TTF_TextEngine ptr
declare function TTF_CreateGPUTextEngineWithProperties(byval props as SDL_PropertiesID) as TTF_TextEngine ptr

#define TTF_PROP_GPU_TEXT_ENGINE_DEVICE "SDL_ttf.gpu_text_engine.create.device"
#define TTF_PROP_GPU_TEXT_ENGINE_ATLAS_TEXTURE_SIZE "SDL_ttf.gpu_text_engine.create.atlas_texture_size"

type TTF_GPUAtlasDrawSequence
	atlas_texture as SDL_GPUTexture ptr
	xy as SDL_FPoint ptr
	uv as SDL_FPoint ptr
	num_vertices as long
	indices as long ptr
	num_indices as long
	image_type as TTF_ImageType
	next as TTF_GPUAtlasDrawSequence ptr
end type

declare function TTF_GetGPUTextDrawData(byval text as TTF_Text ptr) as TTF_GPUAtlasDrawSequence ptr
declare sub TTF_DestroyGPUTextEngine(byval engine as TTF_TextEngine ptr)

enum TTF_GPUTextEngineWinding
	TTF_GPU_TEXTENGINE_WINDING_INVALID = -1
	TTF_GPU_TEXTENGINE_WINDING_CLOCKWISE
	TTF_GPU_TEXTENGINE_WINDING_COUNTER_CLOCKWISE
end enum

declare sub TTF_SetGPUTextEngineWinding(byval engine as TTF_TextEngine ptr, byval winding as TTF_GPUTextEngineWinding)
declare function TTF_GetGPUTextEngineWinding(byval engine as const TTF_TextEngine ptr) as TTF_GPUTextEngineWinding
declare function TTF_CreateText(byval engine as TTF_TextEngine ptr, byval font as TTF_Font ptr, byval text as const zstring ptr, byval length as uinteger) as TTF_Text ptr
declare function TTF_GetTextProperties(byval text as TTF_Text ptr) as SDL_PropertiesID
declare function TTF_SetTextEngine(byval text as TTF_Text ptr, byval engine as TTF_TextEngine ptr) as boolean
declare function TTF_GetTextEngine(byval text as TTF_Text ptr) as TTF_TextEngine ptr
declare function TTF_SetTextFont(byval text as TTF_Text ptr, byval font as TTF_Font ptr) as boolean
declare function TTF_GetTextFont(byval text as TTF_Text ptr) as TTF_Font ptr
declare function TTF_SetTextDirection(byval text as TTF_Text ptr, byval direction as TTF_Direction) as boolean
declare function TTF_GetTextDirection(byval text as TTF_Text ptr) as TTF_Direction
declare function TTF_SetTextScript(byval text as TTF_Text ptr, byval script as Uint32) as boolean
declare function TTF_GetTextScript(byval text as TTF_Text ptr) as Uint32
declare function TTF_SetTextColor(byval text as TTF_Text ptr, byval r as Uint8, byval g as Uint8, byval b as Uint8, byval a as Uint8) as boolean
declare function TTF_SetTextColorFloat(byval text as TTF_Text ptr, byval r as single, byval g as single, byval b as single, byval a as single) as boolean
declare function TTF_GetTextColor(byval text as TTF_Text ptr, byval r as Uint8 ptr, byval g as Uint8 ptr, byval b as Uint8 ptr, byval a as Uint8 ptr) as boolean
declare function TTF_GetTextColorFloat(byval text as TTF_Text ptr, byval r as single ptr, byval g as single ptr, byval b as single ptr, byval a as single ptr) as boolean
declare function TTF_SetTextPosition(byval text as TTF_Text ptr, byval x as long, byval y as long) as boolean
declare function TTF_GetTextPosition(byval text as TTF_Text ptr, byval x as long ptr, byval y as long ptr) as boolean
declare function TTF_SetTextWrapWidth(byval text as TTF_Text ptr, byval wrap_width as long) as boolean
declare function TTF_GetTextWrapWidth(byval text as TTF_Text ptr, byval wrap_width as long ptr) as boolean
declare function TTF_SetTextWrapWhitespaceVisible(byval text as TTF_Text ptr, byval visible as boolean) as boolean
declare function TTF_TextWrapWhitespaceVisible(byval text as TTF_Text ptr) as boolean
declare function TTF_SetTextString(byval text as TTF_Text ptr, byval string_ as const zstring ptr, byval length as uinteger) as boolean
declare function TTF_InsertTextString(byval text as TTF_Text ptr, byval offset as long, byval string_ as const zstring ptr, byval length as uinteger) as boolean
declare function TTF_AppendTextString(byval text as TTF_Text ptr, byval string_ as const zstring ptr, byval length as uinteger) as boolean
declare function TTF_DeleteTextString(byval text as TTF_Text ptr, byval offset as long, byval length as long) as boolean
declare function TTF_GetTextSize(byval text as TTF_Text ptr, byval w as long ptr, byval h as long ptr) as boolean

type TTF_SubStringFlags as Uint32

const TTF_SUBSTRING_DIRECTION_MASK = &h000000FF
const TTF_SUBSTRING_TEXT_START = &h00000100
const TTF_SUBSTRING_LINE_START = &h00000200
const TTF_SUBSTRING_LINE_END = &h00000400
const TTF_SUBSTRING_TEXT_END = &h00000800

type TTF_SubString
	flags as TTF_SubStringFlags
	offset as long
	length as long
	line_index as long
	cluster_index as long
	rect as SDL_Rect
end type

declare function TTF_GetTextSubString(byval text as TTF_Text ptr, byval offset as long, byval substring as TTF_SubString ptr) as boolean
declare function TTF_GetTextSubStringForLine(byval text as TTF_Text ptr, byval line_ as long, byval substring as TTF_SubString ptr) as boolean
declare function TTF_GetTextSubStringsForRange(byval text as TTF_Text ptr, byval offset as long, byval length as long, byval count as long ptr) as TTF_SubString ptr ptr
declare function TTF_GetTextSubStringForPoint(byval text as TTF_Text ptr, byval x as long, byval y as long, byval substring as TTF_SubString ptr) as boolean
declare function TTF_GetPreviousTextSubString(byval text as TTF_Text ptr, byval substring as const TTF_SubString ptr, byval previous as TTF_SubString ptr) as boolean
declare function TTF_GetNextTextSubString(byval text as TTF_Text ptr, byval substring as const TTF_SubString ptr, byval next_ as TTF_SubString ptr) as boolean
declare function TTF_UpdateText(byval text as TTF_Text ptr) as boolean
declare sub TTF_DestroyText(byval text as TTF_Text ptr)
declare sub TTF_CloseFont(byval font as TTF_Font ptr)
declare sub TTF_Quit()
declare function TTF_WasInit() as long

end extern
