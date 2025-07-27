''  FreeBASIC binding for SDL3_image-3.2.4
''
''  SDL_image:  An example image loading library for use with SDL
''  Copyright (C) 1997-2025 Sam Lantinga <slouken@libsdl.org>
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
const SDL_IMAGE_MINOR_VERSION = 2
const SDL_IMAGE_MICRO_VERSION = 4

#define SDL_IMAGE_VERSION SDL_VERSIONNUM(SDL_IMAGE_MAJOR_VERSION, SDL_IMAGE_MINOR_VERSION, SDL_IMAGE_MICRO_VERSION)
#define SDL_IMAGE_VERSION_ATLEAST(X, Y, Z) (((SDL_IMAGE_MAJOR_VERSION >= X) andalso ((SDL_IMAGE_MAJOR_VERSION > X) orelse (SDL_IMAGE_MINOR_VERSION >= Y))) andalso (((SDL_IMAGE_MAJOR_VERSION > X) orelse (SDL_IMAGE_MINOR_VERSION > Y)) orelse (SDL_IMAGE_MICRO_VERSION >= Z)))

declare function IMG_Version() as long

declare function IMG_LoadTyped_IO(byval src as SDL_IOStream ptr, byval closeio as boolean, byval type as const zstring ptr) as SDL_Surface ptr
declare function IMG_Load(byval file as const zstring ptr) as SDL_Surface ptr
declare function IMG_Load_IO(byval src as SDL_IOStream ptr, byval closeio as boolean) as SDL_Surface ptr

declare function IMG_LoadTexture(byval renderer as SDL_Renderer ptr, byval file as const zstring ptr) as SDL_Texture ptr
declare function IMG_LoadTexture_IO(byval renderer as SDL_Renderer ptr, byval src as SDL_IOStream ptr, byval closeio as boolean) as SDL_Texture ptr
declare function IMG_LoadTextureTyped_IO(byval renderer as SDL_Renderer ptr, byval src as SDL_IOStream ptr, byval closeio as boolean, byval type as const zstring ptr) as SDL_Texture ptr

declare function IMG_isAVIF(byval src as SDL_IOStream ptr) as boolean
declare function IMG_isICO(byval src as SDL_IOStream ptr) as boolean
declare function IMG_isCUR(byval src as SDL_IOStream ptr) as boolean
declare function IMG_isBMP(byval src as SDL_IOStream ptr) as boolean
declare function IMG_isGIF(byval src as SDL_IOStream ptr) as boolean
declare function IMG_isJPG(byval src as SDL_IOStream ptr) as boolean
declare function IMG_isJXL(byval src as SDL_IOStream ptr) as boolean
declare function IMG_isLBM(byval src as SDL_IOStream ptr) as boolean
declare function IMG_isPCX(byval src as SDL_IOStream ptr) as boolean
declare function IMG_isPNG(byval src as SDL_IOStream ptr) as boolean
declare function IMG_isPNM(byval src as SDL_IOStream ptr) as boolean
declare function IMG_isSVG(byval src as SDL_IOStream ptr) as boolean
declare function IMG_isQOI(byval src as SDL_IOStream ptr) as boolean
declare function IMG_isTIF(byval src as SDL_IOStream ptr) as boolean
declare function IMG_isXCF(byval src as SDL_IOStream ptr) as boolean
declare function IMG_isXPM(byval src as SDL_IOStream ptr) as boolean
declare function IMG_isXV(byval src as SDL_IOStream ptr) as boolean
declare function IMG_isWEBP(byval src as SDL_IOStream ptr) as boolean

declare function IMG_LoadAVIF_IO(byval src as SDL_IOStream ptr) as SDL_Surface ptr
declare function IMG_LoadICO_IO(byval src as SDL_IOStream ptr) as SDL_Surface ptr
declare function IMG_LoadCUR_IO(byval src as SDL_IOStream ptr) as SDL_Surface ptr
declare function IMG_LoadBMP_IO(byval src as SDL_IOStream ptr) as SDL_Surface ptr
declare function IMG_LoadGIF_IO(byval src as SDL_IOStream ptr) as SDL_Surface ptr
declare function IMG_LoadJPG_IO(byval src as SDL_IOStream ptr) as SDL_Surface ptr
declare function IMG_LoadJXL_IO(byval src as SDL_IOStream ptr) as SDL_Surface ptr
declare function IMG_LoadLBM_IO(byval src as SDL_IOStream ptr) as SDL_Surface ptr
declare function IMG_LoadPCX_IO(byval src as SDL_IOStream ptr) as SDL_Surface ptr
declare function IMG_LoadPNG_IO(byval src as SDL_IOStream ptr) as SDL_Surface ptr
declare function IMG_LoadPNM_IO(byval src as SDL_IOStream ptr) as SDL_Surface ptr
declare function IMG_LoadSVG_IO(byval src as SDL_IOStream ptr) as SDL_Surface ptr
declare function IMG_LoadQOI_IO(byval src as SDL_IOStream ptr) as SDL_Surface ptr
declare function IMG_LoadTGA_IO(byval src as SDL_IOStream ptr) as SDL_Surface ptr
declare function IMG_LoadTIF_IO(byval src as SDL_IOStream ptr) as SDL_Surface ptr
declare function IMG_LoadXCF_IO(byval src as SDL_IOStream ptr) as SDL_Surface ptr
declare function IMG_LoadXPM_IO(byval src as SDL_IOStream ptr) as SDL_Surface ptr
declare function IMG_LoadXV_IO(byval src as SDL_IOStream ptr) as SDL_Surface ptr
declare function IMG_LoadWEBP_IO(byval src as SDL_IOStream ptr) as SDL_Surface ptr

declare function IMG_LoadSizedSVG_IO(byval src as SDL_IOStream ptr, byval width as long, byval height as long) as SDL_Surface ptr

declare function IMG_ReadXPMFromArray(byval xpm as zstring ptr ptr) as SDL_Surface ptr
declare function IMG_ReadXPMFromArrayToRGB888(byval xpm as zstring ptr ptr) as SDL_Surface ptr

declare function IMG_SaveAVIF(byval surface as SDL_Surface ptr, byval file as const zstring ptr, byval quality as long) as boolean
declare function IMG_SaveAVIF_IO(byval surface as SDL_Surface ptr, byval dst as SDL_IOStream ptr, byval closeio as boolean, byval quality as long) as boolean
declare function IMG_SavePNG(byval surface as SDL_Surface ptr, byval file as const zstring ptr) as boolean
declare function IMG_SavePNG_IO(byval surface as SDL_Surface ptr, byval dst as SDL_IOStream ptr, byval closeio as boolean) as boolean
declare function IMG_SaveJPG(byval surface as SDL_Surface ptr, byval file as const zstring ptr, byval quality as long) as boolean
declare function IMG_SaveJPG_IO(byval surface as SDL_Surface ptr, byval dst as SDL_IOStream ptr, byval closeio as boolean, byval quality as long) as boolean

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
declare sub IMG_FreeAnimation(byval anim as IMG_Animation ptr)
declare function IMG_LoadGIFAnimation_IO(byval src as SDL_IOStream ptr) as IMG_Animation
declare function IMG_LoadWEBPAnimation_IO(byval src as SDL_IOStream ptr) as IMG_Animation

end extern
