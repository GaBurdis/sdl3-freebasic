''  FreeBASIC binding for SDL3_image-3.4.2
''
''  SDL_image:  An example image loading library for use with SDL
''  Copyright (C) 1997-2026 Sam Lantinga <slouken@libsdl.org>
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

#inclib "SDL3_image"

#include once "SDL.bi"

extern "C"

const SDL_IMAGE_MAJOR_VERSION = 3
const SDL_IMAGE_MINOR_VERSION = 4
const SDL_IMAGE_MICRO_VERSION = 2

#define SDL_IMAGE_VERSION SDL_VERSIONNUM(SDL_IMAGE_MAJOR_VERSION, SDL_IMAGE_MINOR_VERSION, SDL_IMAGE_MICRO_VERSION)
#define SDL_IMAGE_VERSION_ATLEAST(X, Y, Z) (((SDL_IMAGE_MAJOR_VERSION >= X) andalso ((SDL_IMAGE_MAJOR_VERSION > X) orelse (SDL_IMAGE_MINOR_VERSION >= Y))) andalso (((SDL_IMAGE_MAJOR_VERSION > X) orelse (SDL_IMAGE_MINOR_VERSION > Y)) orelse (SDL_IMAGE_MICRO_VERSION >= Z)))

declare function IMG_Version() as long

declare function IMG_Load(byval file as const zstring ptr) as SDL_Surface ptr
declare function IMG_Load_IO(byval src as SDL_IOStream ptr, byval closeio as boolean) as SDL_Surface ptr
declare function IMG_LoadTyped_IO(byval src as SDL_IOStream ptr, byval closeio as boolean, byval type as const zstring ptr) as SDL_Surface ptr

declare function IMG_LoadTexture(byval renderer as SDL_Renderer ptr, byval file as const zstring ptr) as SDL_Texture ptr
declare function IMG_LoadTexture_IO(byval renderer as SDL_Renderer ptr, byval src as SDL_IOStream ptr, byval closeio as boolean) as SDL_Texture ptr
declare function IMG_LoadTextureTyped_IO(byval renderer as SDL_Renderer ptr, byval src as SDL_IOStream ptr, byval closeio as boolean, byval type as const zstring ptr) as SDL_Texture ptr
declare function IMG_LoadGPUTexture(byval device as SDL_GPUDevice ptr, byval copy_pass as SDL_GPUCopyPass ptr, byval file as const zstring ptr, byval width as long ptr, byval height as long ptr) as SDL_GPUTexture ptr
declare function IMG_LoadGPUTexture_IO(byval device as SDL_GPUDevice ptr, byval copy_pass as SDL_GPUCopyPass ptr, byval src as SDL_IOStream ptr, byval closeio as boolean, byval width as long ptr, byval height as long ptr) as SDL_GPUTexture ptr
declare function IMG_LoadGPUTextureTyped_IO(byval device as SDL_GPUDevice ptr, byval copy_pass as SDL_GPUCopyPass ptr, byval src as SDL_IOStream ptr, byval closeio as boolean, byval type as const zstring ptr, byval width as long ptr, byval height as long ptr) as SDL_GPUTexture ptr

declare function IMG_GetClipboardImage() as SDL_Surface ptr

declare function IMG_isANI(byval src as SDL_IOStream ptr) as boolean
declare function IMG_isAVIF(byval src as SDL_IOStream ptr) as boolean
declare function IMG_isCUR(byval src as SDL_IOStream ptr) as boolean
declare function IMG_isBMP(byval src as SDL_IOStream ptr) as boolean
declare function IMG_isGIF(byval src as SDL_IOStream ptr) as boolean
declare function IMG_isICO(byval src as SDL_IOStream ptr) as boolean
declare function IMG_isJPG(byval src as SDL_IOStream ptr) as boolean
declare function IMG_isJXL(byval src as SDL_IOStream ptr) as boolean
declare function IMG_isLBM(byval src as SDL_IOStream ptr) as boolean
declare function IMG_isPCX(byval src as SDL_IOStream ptr) as boolean
declare function IMG_isPNG(byval src as SDL_IOStream ptr) as boolean
declare function IMG_isPNM(byval src as SDL_IOStream ptr) as boolean
declare function IMG_isQOI(byval src as SDL_IOStream ptr) as boolean
declare function IMG_isSVG(byval src as SDL_IOStream ptr) as boolean
declare function IMG_isTIF(byval src as SDL_IOStream ptr) as boolean
declare function IMG_isWEBP(byval src as SDL_IOStream ptr) as boolean
declare function IMG_isXCF(byval src as SDL_IOStream ptr) as boolean
declare function IMG_isXPM(byval src as SDL_IOStream ptr) as boolean
declare function IMG_isXV(byval src as SDL_IOStream ptr) as boolean

declare function IMG_LoadAVIF_IO(byval src as SDL_IOStream ptr) as SDL_Surface ptr
declare function IMG_LoadBMP_IO(byval src as SDL_IOStream ptr) as SDL_Surface ptr
declare function IMG_LoadCUR_IO(byval src as SDL_IOStream ptr) as SDL_Surface ptr
declare function IMG_LoadGIF_IO(byval src as SDL_IOStream ptr) as SDL_Surface ptr
declare function IMG_LoadICO_IO(byval src as SDL_IOStream ptr) as SDL_Surface ptr
declare function IMG_LoadJPG_IO(byval src as SDL_IOStream ptr) as SDL_Surface ptr
declare function IMG_LoadJXL_IO(byval src as SDL_IOStream ptr) as SDL_Surface ptr
declare function IMG_LoadLBM_IO(byval src as SDL_IOStream ptr) as SDL_Surface ptr
declare function IMG_LoadPCX_IO(byval src as SDL_IOStream ptr) as SDL_Surface ptr
declare function IMG_LoadPNG_IO(byval src as SDL_IOStream ptr) as SDL_Surface ptr
declare function IMG_LoadPNM_IO(byval src as SDL_IOStream ptr) as SDL_Surface ptr
declare function IMG_LoadSVG_IO(byval src as SDL_IOStream ptr) as SDL_Surface ptr
declare function IMG_LoadSizedSVG_IO(byval src as SDL_IOStream ptr, byval width as long, byval height as long) as SDL_Surface ptr
declare function IMG_LoadQOI_IO(byval src as SDL_IOStream ptr) as SDL_Surface ptr
declare function IMG_LoadTGA_IO(byval src as SDL_IOStream ptr) as SDL_Surface ptr
declare function IMG_LoadTIF_IO(byval src as SDL_IOStream ptr) as SDL_Surface ptr
declare function IMG_LoadWEBP_IO(byval src as SDL_IOStream ptr) as SDL_Surface ptr
declare function IMG_LoadXCF_IO(byval src as SDL_IOStream ptr) as SDL_Surface ptr
declare function IMG_LoadXPM_IO(byval src as SDL_IOStream ptr) as SDL_Surface ptr
declare function IMG_LoadXV_IO(byval src as SDL_IOStream ptr) as SDL_Surface ptr

declare function IMG_ReadXPMFromArray(byval *xpm as zstring ptr) as SDL_Surface ptr
declare function IMG_ReadXPMFromArrayToRGB888(byval *xpm as zstring ptr) as SDL_Surface ptr

declare function IMG_Save(byval surface as SDL_Surface ptr, byval file as const zstring ptr) as boolean
declare function IMG_SaveTyped_IO(byval surface as SDL_Surface ptr, byval dst as SDL_IOStream ptr, byval closeio as boolean, byval type as const zstring ptr) as boolean
declare function IMG_SaveAVIF(byval surface as SDL_Surface ptr, byval file as const zstring ptr, byval quality as long) as boolean
declare function IMG_SaveAVIF_IO(byval surface as SDL_Surface ptr, byval dst as SDL_IOStream ptr, byval closeio as boolean, byval quality as long) as boolean
declare function IMG_SaveBMP(byval surface as SDL_Surface ptr, byval file as const zstring ptr) as boolean
declare function IMG_SaveBMP_IO(byval surface as SDL_Surface ptr, byval dst as SDL_IOStream ptr, byval closeio as boolean) as boolean
declare function IMG_SaveCUR(byval surface as SDL_Surface ptr, byval file as const zstring ptr) as boolean
declare function IMG_SaveCUR_IO(byval surface as SDL_Surface ptr, byval dst as SDL_IOStream ptr, byval closeio as boolean) as boolean
declare function IMG_SaveGIF(byval surface as SDL_Surface ptr, byval file as const zstring ptr) as boolean
declare function IMG_SaveGIF_IO(byval surface as SDL_Surface ptr, byval dst as SDL_IOStream ptr, byval closeio as boolean) as boolean
declare function IMG_SaveICO(byval surface as SDL_Surface ptr, byval file as const zstring ptr) as boolean
declare function IMG_SaveICO_IO(byval surface as SDL_Surface ptr, byval dst as SDL_IOStream ptr, byval closeio as boolean) as boolean
declare function IMG_SaveJPG(byval surface as SDL_Surface ptr, byval file as const zstring ptr, byval quality as long) as boolean
declare function IMG_SaveJPG_IO(byval surface as SDL_Surface ptr, byval dst as SDL_IOStream ptr, byval closeio as boolean, byval quality as long) as boolean
declare function IMG_SavePNG(byval surface as SDL_Surface ptr, byval file as const zstring ptr) as boolean
declare function IMG_SavePNG_IO(byval surface as SDL_Surface ptr, byval dst as SDL_IOStream ptr, byval closeio as boolean) as boolean
declare function IMG_SaveTGA(byval surface as SDL_Surface ptr, byval file as const zstring ptr) as boolean
declare function IMG_SaveTGA_IO(byval surface as SDL_Surface ptr, byval dst as SDL_IOStream ptr, byval closeio as boolean) as boolean
declare function IMG_SaveWEBP(byval surface as SDL_Surface ptr, byval file as const zstring ptr, byval quality as single) as boolean
declare function IMG_SaveWEBP_IO(byval surface as SDL_Surface ptr, byval dst as SDL_IOStream ptr, byval closeio as boolean, byval quality as single) as boolean

type IMG_Animation
	w as long
	h as long
	count as long
	frames as SDL_Surface ptr ptr
	delays as long ptr
end type

declare function IMG_LoadAnimation(byval file as const zstring ptr) as IMG_Animation ptr
declare function IMG_LoadAnimation_IO(byval src as SDL_IOStream ptr, byval closeio as boolean) as IMG_Animation ptr
declare function IMG_LoadAnimationTyped_IO(byval src as SDL_IOStream ptr, byval closeio as boolean, byval type as const zstring ptr) as IMG_Animation ptr
declare function IMG_LoadANIAnimation_IO(byval src as SDL_IOStream ptr) as IMG_Animation
declare function IMG_LoadAPNGAnimation_IO(byval src as SDL_IOStream ptr) as IMG_Animation
declare function IMG_LoadAVIFAnimation_IO(byval src as SDL_IOStream ptr) as IMG_Animation
declare function IMG_LoadGIFAnimation_IO(byval src as SDL_IOStream ptr) as IMG_Animation ptr
declare function IMG_LoadWEBPAnimation_IO(byval src as SDL_IOStream ptr) as IMG_Animation ptr

declare function IMG_SaveAnimation(byval anim as IMG_Animation ptr, byval file as const zstring ptr) as boolean
declare function IMG_SaveAnimationTyped_IO(byval anim as IMG_Animation ptr, byval dst as SDL_IOStream ptr, byval closeio as boolean, byval type as const zstring ptr) as boolean
declare function IMG_SaveANIAnimation_IO(byval anim as IMG_Animation ptr, byval dst as SDL_IOStream ptr, byval closeio as boolean) as boolean
declare function IMG_SaveAPNGAnimation_IO(byval anim as IMG_Animation ptr, byval dst as SDL_IOStream ptr, byval closeio as boolean) as boolean
declare function IMG_SaveAVIFAnimation_IO(byval anim as IMG_Animation ptr, byval dst as SDL_IOStream ptr, byval closeio as boolean, byval quality as long) as boolean
declare function IMG_SaveGIFAnimation_IO(byval anim as IMG_Animation ptr, byval dst as SDL_IOStream ptr, byval closeio as boolean) as boolean
declare function IMG_SaveWEBPAnimation_IO(byval anim as IMG_Animation ptr, byval dst as SDL_IOStream ptr, byval closeio as boolean, byval quality as long) as boolean

declare function IMG_CreateAnimatedCursor(byval anim as IMG_Animation ptr, byval hot_x as long, byval hot_y as long) as SDL_Cursor ptr

declare sub IMG_FreeAnimation(byval anim as IMG_Animation ptr)

type IMG_AnimationEncoder as IMG_AnimationEncoder_

declare function IMG_CreateAnimationEncoder(byval file as const zstring ptr) as IMG_AnimationEncoder ptr
declare function IMG_CreateAnimationEncoder_IO(byval dst as SDL_IOStream ptr, byval closeio as boolean, byval type as const zstring ptr) as IMG_AnimationEncoder ptr
declare function IMG_CreateAnimationEncoderWithProperties(byval props as SDL_PropertiesID) as IMG_AnimationEncoder ptr

#define IMG_PROP_ANIMATION_ENCODER_CREATE_FILENAME_STRING                "SDL_image.animation_encoder.create.filename"
#define IMG_PROP_ANIMATION_ENCODER_CREATE_IOSTREAM_POINTER               "SDL_image.animation_encoder.create.iostream"
#define IMG_PROP_ANIMATION_ENCODER_CREATE_IOSTREAM_AUTOCLOSE_BOOLEAN     "SDL_image.animation_encoder.create.iostream.autoclose"
#define IMG_PROP_ANIMATION_ENCODER_CREATE_TYPE_STRING                    "SDL_image.animation_encoder.create.type"
#define IMG_PROP_ANIMATION_ENCODER_CREATE_QUALITY_NUMBER                 "SDL_image.animation_encoder.create.quality"
#define IMG_PROP_ANIMATION_ENCODER_CREATE_TIMEBASE_NUMERATOR_NUMBER      "SDL_image.animation_encoder.create.timebase.numerator"
#define IMG_PROP_ANIMATION_ENCODER_CREATE_TIMEBASE_DENOMINATOR_NUMBER    "SDL_image.animation_encoder.create.timebase.denominator"
#define IMG_PROP_ANIMATION_ENCODER_CREATE_AVIF_MAX_THREADS_NUMBER        "SDL_image.animation_encoder.create.avif.max_threads"
#define IMG_PROP_ANIMATION_ENCODER_CREATE_AVIF_KEYFRAME_INTERVAL_NUMBER  "SDL_image.animation_encoder.create.avif.keyframe_interval"
#define IMG_PROP_ANIMATION_ENCODER_CREATE_GIF_USE_LUT_BOOLEAN            "SDL_image.animation_encoder.create.gif.use_lut"

declare function IMG_AddAnimationEncoderFrame(byval encoder as IMG_AnimationEncoder ptr, byval surface as SDL_Surface ptr, byval duration as Uint64) as boolean
declare function IMG_CloseAnimationEncoder(byval encoder as IMG_AnimationEncoder ptr) as boolean

type IMG_AnimationDecoderStatus as long
enum
    IMG_DECODER_STATUS_INVALID = -1
    IMG_DECODER_STATUS_OK
    IMG_DECODER_STATUS_FAILED
    IMG_DECODER_STATUS_FAILED
end enum

type IMG_AnimationDecoder as IMG_AnimationDecoder_

declare function IMG_CreateAnimationDecoder(byval file as const zstring ptr) as IMG_AnimationDecoder ptr
declare function IMG_CreateAnimationDecoder_IO(byval src as SDL_IOStream ptr, byval closeio as boolean, byval type as const zstring ptr) as IMG_AnimationDecoder ptr
declare function IMG_CreateAnimationDecoderWithProperties(byval props as SDL_PropertiesID) as IMG_AnimationDecoder ptr

#define IMG_PROP_ANIMATION_DECODER_CREATE_FILENAME_STRING                "SDL_image.animation_decoder.create.filename"
#define IMG_PROP_ANIMATION_DECODER_CREATE_IOSTREAM_POINTER               "SDL_image.animation_decoder.create.iostream"
#define IMG_PROP_ANIMATION_DECODER_CREATE_IOSTREAM_AUTOCLOSE_BOOLEAN     "SDL_image.animation_decoder.create.iostream.autoclose"
#define IMG_PROP_ANIMATION_DECODER_CREATE_TYPE_STRING                    "SDL_image.animation_decoder.create.type"
#define IMG_PROP_ANIMATION_DECODER_CREATE_TIMEBASE_NUMERATOR_NUMBER      "SDL_image.animation_decoder.create.timebase.numerator"
#define IMG_PROP_ANIMATION_DECODER_CREATE_TIMEBASE_DENOMINATOR_NUMBER    "SDL_image.animation_decoder.create.timebase.denominator"
#define IMG_PROP_ANIMATION_DECODER_CREATE_AVIF_MAX_THREADS_NUMBER        "SDL_image.animation_decoder.create.avif.max_threads"
#define IMG_PROP_ANIMATION_DECODER_CREATE_AVIF_ALLOW_INCREMENTAL_BOOLEAN "SDL_image.animation_decoder.create.avif.allow_incremental"
#define IMG_PROP_ANIMATION_DECODER_CREATE_AVIF_ALLOW_PROGRESSIVE_BOOLEAN "SDL_image.animation_decoder.create.avif.allow_progressive"
#define IMG_PROP_ANIMATION_DECODER_CREATE_GIF_TRANSPARENT_COLOR_INDEX_NUMBER "SDL_image.animation_encoder.create.gif.transparent_color_index"
#define IMG_PROP_ANIMATION_DECODER_CREATE_GIF_NUM_COLORS_NUMBER          "SDL_image.animation_encoder.create.gif.num_colors"

declare function IMG_GetAnimationDecoderProperties(byval decoder as IMG_AnimationDecoder*) as SDL_PropertiesID

#define IMG_PROP_METADATA_IGNORE_PROPS_BOOLEAN                 "SDL_image.metadata.ignore_props"
#define IMG_PROP_METADATA_DESCRIPTION_STRING                   "SDL_image.metadata.description"
#define IMG_PROP_METADATA_COPYRIGHT_STRING                     "SDL_image.metadata.copyright"
#define IMG_PROP_METADATA_TITLE_STRING                         "SDL_image.metadata.title"
#define IMG_PROP_METADATA_AUTHOR_STRING                        "SDL_image.metadata.author"
#define IMG_PROP_METADATA_CREATION_TIME_STRING                 "SDL_image.metadata.creation_time"
#define IMG_PROP_METADATA_FRAME_COUNT_NUMBER                   "SDL_image.metadata.frame_count"
#define IMG_PROP_METADATA_LOOP_COUNT_NUMBER                    "SDL_image.metadata.loop_count"

declare function IMG_GetAnimationDecoderFrame(byval decoder as IMG_AnimationDecoder ptr, byval *frame as SDL_Surface ptr, byval duration as Uint64 ptr) as boolean
declare function IMG_GetAnimationDecoderStatus(byval decoder as IMG_AnimationDecoder ptr) as IMG_AnimationDecoderStatus
declare function IMG_ResetAnimationDecoder(byval decoder as IMG_AnimationDecoder ptr) as boolean
declare function IMG_CloseAnimationDecoder(byval decoder as IMG_AnimationDecoder ptr) as boolean

end extern
