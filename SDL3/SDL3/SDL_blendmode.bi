#pragma once

extern "C"

type SDL_BlendMode as Uint32

const SDL_BLENDMODE_NONE                = &h00000000u
const SDL_BLENDMODE_BLEND               = &h00000001u
const SDL_BLENDMODE_BLEND_PREMULTIPLIED = &h00000010u
const SDL_BLENDMODE_ADD                 = &h00000002u
const SDL_BLENDMODE_ADD_PREMULTIPLIED   = &h00000020u
const SDL_BLENDMODE_MOD                 = &h00000004u
const SDL_BLENDMODE_MUL                 = &h00000008u
const SDL_BLENDMODE_INVALID             = &h7FFFFFFFu

type SDL_BlendOperation as long
enum
	SDL_BLENDOPERATION_ADD          = &h1
	SDL_BLENDOPERATION_SUBTRACT     = &h2
	SDL_BLENDOPERATION_REV_SUBTRACT = &h3
	SDL_BLENDOPERATION_MINIMUM      = &h4
	SDL_BLENDOPERATION_MAXIMUM      = &h5
end enum

type SDL_BlendFactor as long
enum
	SDL_BLENDFACTOR_ZERO                = &h1
	SDL_BLENDFACTOR_ONE                 = &h2
	SDL_BLENDFACTOR_SRC_COLOR           = &h3
	SDL_BLENDFACTOR_ONE_MINUS_SRC_COLOR = &h4
	SDL_BLENDFACTOR_SRC_ALPHA           = &h5
	SDL_BLENDFACTOR_ONE_MINUS_SRC_ALPHA = &h6
	SDL_BLENDFACTOR_DST_COLOR           = &h7
	SDL_BLENDFACTOR_ONE_MINUS_DST_COLOR = &h8
	SDL_BLENDFACTOR_DST_ALPHA           = &h9
	SDL_BLENDFACTOR_ONE_MINUS_DST_ALPHA = &hA
end enum

declare function SDL_ComposeCustomBlendMode(byval srcColorFactor as SDL_BlendFactor, byval dstColorFactor as SDL_BlendFactor, byval colorOperation as SDL_BlendOperation, byval srcAlphaFactor as SDL_BlendFactor, byval dstAlphaFactor as SDL_BlendFactor, byval alphaOperation as SDL_BlendOperation) as SDL_BlendMode

end extern
