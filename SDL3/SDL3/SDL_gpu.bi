#pragma once

extern "C"

type SDL_GPUDevice as _SDL_GPUDevice
type SDL_GPUBuffer as _SDL_GPUBuffer
type SDL_GPUTransferBuffer as _SDL_GPUTransferBuffer
type SDL_GPUTexture as _SDL_GPUTexture
type SDL_GPUSampler as _SDL_GPUSampler
type SDL_GPUShader as _SDL_GPUShader
type SDL_GPUComputePipeline as _SDL_GPUComputePipeline
type SDL_GPUGraphicsPipeline as _SDL_GPUGraphicsPipeline
type SDL_GPUCommandBuffer as _SDL_GPUCommandBuffer
type SDL_GPURenderPass as _SDL_GPURenderPass
type SDL_GPUComputePass as _SDL_GPUComputePass
type SDL_GPUCopyPass as _SDL_GPUCopyPass
type SDL_GPUFence as _SDL_GPUFence

type SDL_GPUPrimitiveType as long
enum
	SDL_GPU_PRIMITIVETYPE_TRIANGLELIST
	SDL_GPU_PRIMITIVETYPE_TRIANGLESTRIP
	SDL_GPU_PRIMITIVETYPE_LINELIST
	SDL_GPU_PRIMITIVETYPE_LINESTRIP
	SDL_GPU_PRIMITIVETYPE_POINTLIST
end enum

type SDL_GPULoadOp as long
enum
	SDL_GPU_LOADOP_LOAD
	SDL_GPU_LOADOP_CLEAR
	SDL_GPU_LOADOP_DONT_CARE
end enum

type SDL_GPUStoreOp as long
enum
	SDL_GPU_STOREOP_STORE
	SDL_GPU_STOREOP_DONT_CARE
	SDL_GPU_STOREOP_RESOLVE
	SDL_GPU_STOREOP_RESOLVE_AND_STORE
end enum

type SDL_GPUIndexElementSize as long
enum
	SDL_GPU_INDEXELEMENTSIZE_16BIT
	SDL_GPU_INDEXELEMENTSIZE_32BIT
end enum

type SDL_GPUTextureFormat as long
enum
	SDL_GPU_TEXTUREFORMAT_INVALID
	SDL_GPU_TEXTUREFORMAT_A8_UNORM
	SDL_GPU_TEXTUREFORMAT_R8_UNORM
	SDL_GPU_TEXTUREFORMAT_R8G8_UNORM
	SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM
	SDL_GPU_TEXTUREFORMAT_R16_UNORM
	SDL_GPU_TEXTUREFORMAT_R16G16_UNORM
	SDL_GPU_TEXTUREFORMAT_R16G16B16A16_UNORM
	SDL_GPU_TEXTUREFORMAT_R10G10B10A2_UNORM
	SDL_GPU_TEXTUREFORMAT_B5G6R5_UNORM
	SDL_GPU_TEXTUREFORMAT_B5G5R5A1_UNORM
	SDL_GPU_TEXTUREFORMAT_B4G4R4A4_UNORM
	SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM
	SDL_GPU_TEXTUREFORMAT_BC1_RGBA_UNORM
	SDL_GPU_TEXTUREFORMAT_BC2_RGBA_UNORM
	SDL_GPU_TEXTUREFORMAT_BC3_RGBA_UNORM
	SDL_GPU_TEXTUREFORMAT_BC4_R_UNORM
	SDL_GPU_TEXTUREFORMAT_BC5_RG_UNORM
	SDL_GPU_TEXTUREFORMAT_BC7_RGBA_UNORM
	SDL_GPU_TEXTUREFORMAT_BC6H_RGB_FLOAT
	SDL_GPU_TEXTUREFORMAT_BC6H_RGB_UFLOAT
	SDL_GPU_TEXTUREFORMAT_R8_SNORM
	SDL_GPU_TEXTUREFORMAT_R8G8_SNORM
	SDL_GPU_TEXTUREFORMAT_R8G8B8A8_SNORM
	SDL_GPU_TEXTUREFORMAT_R16_SNORM
	SDL_GPU_TEXTUREFORMAT_R16G16_SNORM
	SDL_GPU_TEXTUREFORMAT_R16G16B16A16_SNORM
	SDL_GPU_TEXTUREFORMAT_R16_FLOAT
	SDL_GPU_TEXTUREFORMAT_R16G16_FLOAT
	SDL_GPU_TEXTUREFORMAT_R16G16B16A16_FLOAT
	SDL_GPU_TEXTUREFORMAT_R32_FLOAT
	SDL_GPU_TEXTUREFORMAT_R32G32_FLOAT
	SDL_GPU_TEXTUREFORMAT_R32G32B32A32_FLOAT
	SDL_GPU_TEXTUREFORMAT_R11G11B10_UFLOAT
	SDL_GPU_TEXTUREFORMAT_R8_UINT
	SDL_GPU_TEXTUREFORMAT_R8G8_UINT
	SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UINT
	SDL_GPU_TEXTUREFORMAT_R16_UINT
	SDL_GPU_TEXTUREFORMAT_R16G16_UINT
	SDL_GPU_TEXTUREFORMAT_R16G16B16A16_UINT
	SDL_GPU_TEXTUREFORMAT_R32_UINT
	SDL_GPU_TEXTUREFORMAT_R32G32_UINT
	SDL_GPU_TEXTUREFORMAT_R32G32B32A32_UINT
	SDL_GPU_TEXTUREFORMAT_R8_INT
	SDL_GPU_TEXTUREFORMAT_R8G8_INT
	SDL_GPU_TEXTUREFORMAT_R8G8B8A8_INT
	SDL_GPU_TEXTUREFORMAT_R16_INT
	SDL_GPU_TEXTUREFORMAT_R16G16_INT
	SDL_GPU_TEXTUREFORMAT_R16G16B16A16_INT
	SDL_GPU_TEXTUREFORMAT_R32_INT
	SDL_GPU_TEXTUREFORMAT_R32G32_INT
	SDL_GPU_TEXTUREFORMAT_R32G32B32A32_INT
	SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM_SRGB
	SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM_SRGB
	SDL_GPU_TEXTUREFORMAT_BC1_RGBA_UNORM_SRGB
	SDL_GPU_TEXTUREFORMAT_BC2_RGBA_UNORM_SRGB
	SDL_GPU_TEXTUREFORMAT_BC3_RGBA_UNORM_SRGB
	SDL_GPU_TEXTUREFORMAT_BC7_RGBA_UNORM_SRGB
	SDL_GPU_TEXTUREFORMAT_D16_UNORM
	SDL_GPU_TEXTUREFORMAT_D24_UNORM
	SDL_GPU_TEXTUREFORMAT_D32_FLOAT
	SDL_GPU_TEXTUREFORMAT_D24_UNORM_S8_UINT
	SDL_GPU_TEXTUREFORMAT_D32_FLOAT_S8_UINT
	SDL_GPU_TEXTUREFORMAT_ASTC_4x4_UNORM
	SDL_GPU_TEXTUREFORMAT_ASTC_5x4_UNORM
	SDL_GPU_TEXTUREFORMAT_ASTC_5x5_UNORM
	SDL_GPU_TEXTUREFORMAT_ASTC_6x5_UNORM
	SDL_GPU_TEXTUREFORMAT_ASTC_6x6_UNORM
	SDL_GPU_TEXTUREFORMAT_ASTC_8x5_UNORM
	SDL_GPU_TEXTUREFORMAT_ASTC_8x6_UNORM
	SDL_GPU_TEXTUREFORMAT_ASTC_8x8_UNORM
	SDL_GPU_TEXTUREFORMAT_ASTC_10x5_UNORM
	SDL_GPU_TEXTUREFORMAT_ASTC_10x6_UNORM
	SDL_GPU_TEXTUREFORMAT_ASTC_10x8_UNORM
	SDL_GPU_TEXTUREFORMAT_ASTC_10x10_UNORM
	SDL_GPU_TEXTUREFORMAT_ASTC_12x10_UNORM
	SDL_GPU_TEXTUREFORMAT_ASTC_12x12_UNORM
	SDL_GPU_TEXTUREFORMAT_ASTC_4x4_UNORM_SRGB
	SDL_GPU_TEXTUREFORMAT_ASTC_5x4_UNORM_SRGB
	SDL_GPU_TEXTUREFORMAT_ASTC_5x5_UNORM_SRGB
	SDL_GPU_TEXTUREFORMAT_ASTC_6x5_UNORM_SRGB
	SDL_GPU_TEXTUREFORMAT_ASTC_6x6_UNORM_SRGB
	SDL_GPU_TEXTUREFORMAT_ASTC_8x5_UNORM_SRGB
	SDL_GPU_TEXTUREFORMAT_ASTC_8x6_UNORM_SRGB
	SDL_GPU_TEXTUREFORMAT_ASTC_8x8_UNORM_SRGB
	SDL_GPU_TEXTUREFORMAT_ASTC_10x5_UNORM_SRGB
	SDL_GPU_TEXTUREFORMAT_ASTC_10x6_UNORM_SRGB
	SDL_GPU_TEXTUREFORMAT_ASTC_10x8_UNORM_SRGB
	SDL_GPU_TEXTUREFORMAT_ASTC_10x10_UNORM_SRGB
	SDL_GPU_TEXTUREFORMAT_ASTC_12x10_UNORM_SRGB
	SDL_GPU_TEXTUREFORMAT_ASTC_12x12_UNORM_SRGB
	SDL_GPU_TEXTUREFORMAT_ASTC_4x4_FLOAT
	SDL_GPU_TEXTUREFORMAT_ASTC_5x4_FLOAT
	SDL_GPU_TEXTUREFORMAT_ASTC_5x5_FLOAT
	SDL_GPU_TEXTUREFORMAT_ASTC_6x5_FLOAT
	SDL_GPU_TEXTUREFORMAT_ASTC_6x6_FLOAT
	SDL_GPU_TEXTUREFORMAT_ASTC_8x5_FLOAT
	SDL_GPU_TEXTUREFORMAT_ASTC_8x6_FLOAT
	SDL_GPU_TEXTUREFORMAT_ASTC_8x8_FLOAT
	SDL_GPU_TEXTUREFORMAT_ASTC_10x5_FLOAT
	SDL_GPU_TEXTUREFORMAT_ASTC_10x6_FLOAT
	SDL_GPU_TEXTUREFORMAT_ASTC_10x8_FLOAT
	SDL_GPU_TEXTUREFORMAT_ASTC_10x10_FLOAT
	SDL_GPU_TEXTUREFORMAT_ASTC_12x10_FLOAT
	SDL_GPU_TEXTUREFORMAT_ASTC_12x12_FLOAT
end enum

type SDL_GPUTextureUsageFlags as Uint32

const SDL_GPU_TEXTUREUSAGE_SAMPLER                                 = culng(1u shl 0)
const SDL_GPU_TEXTUREUSAGE_COLOR_TARGET                            = culng(1u shl 1)
const SDL_GPU_TEXTUREUSAGE_DEPTH_STENCIL_TARGET                    = culng(1u shl 2)
const SDL_GPU_TEXTUREUSAGE_GRAPHICS_STORAGE_READ                   = culng(1u shl 3)
const SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_READ                    = culng(1u shl 4)
const SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_WRITE                   = culng(1u shl 5)
const SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_SIMULTANEOUS_READ_WRITE = culng(1u shl 6)

type SDL_GPUTextureType as long
enum
	SDL_GPU_TEXTURETYPE_2D
	SDL_GPU_TEXTURETYPE_2D_ARRAY
	SDL_GPU_TEXTURETYPE_3D
	SDL_GPU_TEXTURETYPE_CUBE
	SDL_GPU_TEXTURETYPE_CUBE_ARRAY
end enum

type SDL_GPUSampleCount as long
enum
	SDL_GPU_SAMPLECOUNT_1
	SDL_GPU_SAMPLECOUNT_2
	SDL_GPU_SAMPLECOUNT_4
	SDL_GPU_SAMPLECOUNT_8
end enum

type SDL_GPUCubeMapFace as long
enum
	SDL_GPU_CUBEMAPFACE_POSITIVEX
	SDL_GPU_CUBEMAPFACE_NEGATIVEX
	SDL_GPU_CUBEMAPFACE_POSITIVEY
	SDL_GPU_CUBEMAPFACE_NEGATIVEY
	SDL_GPU_CUBEMAPFACE_POSITIVEZ
	SDL_GPU_CUBEMAPFACE_NEGATIVEZ
end enum

type SDL_GPUBufferUsageFlags as Uint32

const SDL_GPU_BUFFERUSAGE_VERTEX                = culng(1u shl 0)
const SDL_GPU_BUFFERUSAGE_INDEX                 = culng(1u shl 1)
const SDL_GPU_BUFFERUSAGE_INDIRECT              = culng(1u shl 2)
const SDL_GPU_BUFFERUSAGE_GRAPHICS_STORAGE_READ = culng(1u shl 3)
const SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ  = culng(1u shl 4)
const SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_WRITE = culng(1u shl 5)

type SDL_GPUTransferBufferUsage as long
enum
	SDL_GPU_TRANSFERBUFFERUSAGE_UPLOAD
	SDL_GPU_TRANSFERBUFFERUSAGE_DOWNLOAD
end enum

type SDL_GPUShaderStage as long
enum
	SDL_GPU_SHADERSTAGE_VERTEX
	SDL_GPU_SHADERSTAGE_FRAGMENT
end enum

type SDL_GPUShaderFormat as Uint32

const SDL_GPU_SHADERFORMAT_INVALID  = 0
const SDL_GPU_SHADERFORMAT_PRIVATE  = culng(1u shl 0)
const SDL_GPU_SHADERFORMAT_SPIRV    = culng(1u shl 1)
const SDL_GPU_SHADERFORMAT_DXBC     = culng(1u shl 2)
const SDL_GPU_SHADERFORMAT_DXIL     = culng(1u shl 3)
const SDL_GPU_SHADERFORMAT_MSL      = culng(1u shl 4)
const SDL_GPU_SHADERFORMAT_METALLIB = culng(1u shl 5)

type SDL_GPUVertexElementFormat as long
enum
	SDL_GPU_VERTEXELEMENTFORMAT_INVALID
	SDL_GPU_VERTEXELEMENTFORMAT_INT
	SDL_GPU_VERTEXELEMENTFORMAT_INT2
	SDL_GPU_VERTEXELEMENTFORMAT_INT3
	SDL_GPU_VERTEXELEMENTFORMAT_INT4
	SDL_GPU_VERTEXELEMENTFORMAT_UINT
	SDL_GPU_VERTEXELEMENTFORMAT_UINT2
	SDL_GPU_VERTEXELEMENTFORMAT_UINT3
	SDL_GPU_VERTEXELEMENTFORMAT_UINT4
	SDL_GPU_VERTEXELEMENTFORMAT_FLOAT
	SDL_GPU_VERTEXELEMENTFORMAT_FLOAT2
	SDL_GPU_VERTEXELEMENTFORMAT_FLOAT3
	SDL_GPU_VERTEXELEMENTFORMAT_FLOAT4
	SDL_GPU_VERTEXELEMENTFORMAT_BYTE2
	SDL_GPU_VERTEXELEMENTFORMAT_BYTE4
	SDL_GPU_VERTEXELEMENTFORMAT_UBYTE2
	SDL_GPU_VERTEXELEMENTFORMAT_UBYTE4
	SDL_GPU_VERTEXELEMENTFORMAT_BYTE2_NORM
	SDL_GPU_VERTEXELEMENTFORMAT_BYTE4_NORM
	SDL_GPU_VERTEXELEMENTFORMAT_UBYTE2_NORM
	SDL_GPU_VERTEXELEMENTFORMAT_UBYTE4_NORM
	SDL_GPU_VERTEXELEMENTFORMAT_SHORT2
	SDL_GPU_VERTEXELEMENTFORMAT_SHORT4
	SDL_GPU_VERTEXELEMENTFORMAT_USHORT2
	SDL_GPU_VERTEXELEMENTFORMAT_USHORT4
	SDL_GPU_VERTEXELEMENTFORMAT_SHORT2_NORM
	SDL_GPU_VERTEXELEMENTFORMAT_SHORT4_NORM
	SDL_GPU_VERTEXELEMENTFORMAT_USHORT2_NORM
	SDL_GPU_VERTEXELEMENTFORMAT_USHORT4_NORM
	SDL_GPU_VERTEXELEMENTFORMAT_HALF2
	SDL_GPU_VERTEXELEMENTFORMAT_HALF4
end enum

type SDL_GPUVertexInputRate as long
enum
	SDL_GPU_VERTEXINPUTRATE_VERTEX
	SDL_GPU_VERTEXINPUTRATE_INSTANCE
end enum

type SDL_GPUFillMode as long
enum
	SDL_GPU_FILLMODE_FILL
	SDL_GPU_FILLMODE_LINE
end enum

type SDL_GPUCullMode as long
enum
	SDL_GPU_CULLMODE_NONE
	SDL_GPU_CULLMODE_FRONT
	SDL_GPU_CULLMODE_BACK
end enum

type SDL_GPUFrontFace as long
enum
	SDL_GPU_FRONTFACE_COUNTER_CLOCKWISE
	SDL_GPU_FRONTFACE_CLOCKWISE
end enum

type SDL_GPUCompareOp as long
enum
	SDL_GPU_COMPAREOP_INVALID
	SDL_GPU_COMPAREOP_NEVER
	SDL_GPU_COMPAREOP_LESS
	SDL_GPU_COMPAREOP_EQUAL
	SDL_GPU_COMPAREOP_LESS_OR_EQUAL
	SDL_GPU_COMPAREOP_GREATER
	SDL_GPU_COMPAREOP_NOT_EQUAL
	SDL_GPU_COMPAREOP_GREATER_OR_EQUAL
	SDL_GPU_COMPAREOP_ALWAYS
end enum

type SDL_GPUStencilOp as long
enum
	SDL_GPU_STENCILOP_INVALID
	SDL_GPU_STENCILOP_KEEP
	SDL_GPU_STENCILOP_ZERO
	SDL_GPU_STENCILOP_REPLACE
	SDL_GPU_STENCILOP_INCREMENT_AND_CLAMP
	SDL_GPU_STENCILOP_DECREMENT_AND_CLAMP
	SDL_GPU_STENCILOP_INVERT
	SDL_GPU_STENCILOP_INCREMENT_AND_WRAP
	SDL_GPU_STENCILOP_DECREMENT_AND_WRAP
end enum

type SDL_GPUBlendOp as long
enum
	SDL_GPU_BLENDOP_INVALID
	SDL_GPU_BLENDOP_ADD
	SDL_GPU_BLENDOP_SUBTRACT
	SDL_GPU_BLENDOP_REVERSE_SUBTRACT
	SDL_GPU_BLENDOP_MIN
	SDL_GPU_BLENDOP_MAX
end enum

type SDL_GPUBlendFactor as long
enum
	SDL_GPU_BLENDFACTOR_INVALID
	SDL_GPU_BLENDFACTOR_ZERO
	SDL_GPU_BLENDFACTOR_ONE
	SDL_GPU_BLENDFACTOR_SRC_COLOR
	SDL_GPU_BLENDFACTOR_ONE_MINUS_SRC_COLOR
	SDL_GPU_BLENDFACTOR_DST_COLOR
	SDL_GPU_BLENDFACTOR_ONE_MINUS_DST_COLOR
	SDL_GPU_BLENDFACTOR_SRC_ALPHA
	SDL_GPU_BLENDFACTOR_ONE_MINUS_SRC_ALPHA
	SDL_GPU_BLENDFACTOR_DST_ALPHA
	SDL_GPU_BLENDFACTOR_ONE_MINUS_DST_ALPHA
	SDL_GPU_BLENDFACTOR_CONSTANT_COLOR
	SDL_GPU_BLENDFACTOR_ONE_MINUS_CONSTANT_COLOR
	SDL_GPU_BLENDFACTOR_SRC_ALPHA_SATURATE
end enum

type SDL_GPUColorComponentFlags as Uint8

const SDL_GPU_COLORCOMPONENT_R = culng(1u shl 0)
const SDL_GPU_COLORCOMPONENT_G = culng(1u shl 1)
const SDL_GPU_COLORCOMPONENT_B = culng(1u shl 2)
const SDL_GPU_COLORCOMPONENT_A = culng(1u shl 3)

type SDL_GPUFilter as long
enum
	SDL_GPU_FILTER_NEAREST
	SDL_GPU_FILTER_LINEAR
end enum

type SDL_GPUSamplerMipmapMode as long
enum
	SDL_GPU_SAMPLERMIPMAPMODE_NEAREST
	SDL_GPU_SAMPLERMIPMAPMODE_LINEAR
end enum

type SDL_GPUSamplerAddressMode as long
enum
	SDL_GPU_SAMPLERADDRESSMODE_REPEAT
	SDL_GPU_SAMPLERADDRESSMODE_MIRRORED_REPEAT
	SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE
end enum

type SDL_GPUPresentMode as long
enum
	SDL_GPU_PRESENTMODE_VSYNC
	SDL_GPU_PRESENTMODE_IMMEDIATE
	SDL_GPU_PRESENTMODE_MAILBOX
end enum

type SDL_GPUSwapchainComposition as long
enum
	SDL_GPU_SWAPCHAINCOMPOSITION_SDR
	SDL_GPU_SWAPCHAINCOMPOSITION_SDR_LINEAR
	SDL_GPU_SWAPCHAINCOMPOSITION_HDR_EXTENDED_LINEAR
	SDL_GPU_SWAPCHAINCOMPOSITION_HDR10_ST2084
end enum

type SDL_GPUViewport
	x as single
	y as single
	w as single
	h as single
	min_depth as single
	max_depth as single
end type

type SDL_GPUTextureTransferInfo
	transfer_buffer as SDL_GPUTransferBuffer ptr
	offset as Uint32
	pixels_per_row as Uint32
	rows_per_layer as Uint32
end type

type SDL_GPUTransferBufferLocation
	transfer_buffer as SDL_GPUTransferBuffer ptr
	offset as Uint32
end type

type SDL_GPUTextureLocation
	texture as SDL_GPUTexture ptr
	mip_level as Uint32
	layer as Uint32
	x as Uint32
	y as Uint32
	z as Uint32
end type

type SDL_GPUTextureRegion
	texture as SDL_GPUTexture ptr
	mip_level as Uint32
	layer as Uint32
	x as Uint32
	y as Uint32
	z as Uint32
	w as Uint32
	h as Uint32
	d as Uint32
end type

type SDL_GPUBlitRegion
	texture as SDL_GPUTexture ptr
	mip_level as Uint32
	layer_or_depth_plane as Uint32
	x as Uint32
	y as Uint32
	w as Uint32
	h as Uint32
end type

type SDL_GPUBufferLocation
	buffer as SDL_GPUBuffer ptr
	offset as Uint32
end type

type SDL_GPUBufferRegion
	buffer as SDL_GPUBuffer ptr
	offset as Uint32
	size as Uint32
end type

type SDL_GPUIndirectDrawCommand
	num_vertices as Uint32
	num_instances as Uint32
	first_vertex as Uint32
	first_instance as Uint32
end type

type SDL_GPUIndexedIndirectDrawCommand
	num_indices as Uint32
	num_instances as Uint32
	first_index as Uint32
	vertex_offset as Sint32
	first_instance as Uint32
end type

type SDL_GPUIndirectDispatchCommand
	groupcount_x as Uint32
	groupcount_y as Uint32
	groupcount_z as Uint32
end type

type SDL_GPUSamplerCreateInfo
	min_filter as SDL_GPUFilter
	mag_filter as SDL_GPUFilter
	mipmap_mode as SDL_GPUSamplerMipmapMode
	address_mode_u as SDL_GPUSamplerAddressMode
	address_mode_v as SDL_GPUSamplerAddressMode
	address_mode_w as SDL_GPUSamplerAddressMode
	mip_lod_bias as single
	max_anisotropy as single
	compare_op as SDL_GPUCompareOp
	min_lod as single
	max_lod as single
	enable_anisotropy as boolean
	enable_compare as boolean
	padding1 as Uint8
	padding2 as Uint8
	props as SDL_PropertiesID
end type

type SDL_GPUVertexBufferDescription
	slot as Uint32
	pitch as Uint32
	input_rate as SDL_GPUVertexInputRate
	instance_step_rate as Uint32
end type

type SDL_GPUVertexAttribute
	location as Uint32
	buffer_slot as Uint32
	format as SDL_GPUVertexElementFormat
	offset as Uint32
end type

type SDL_GPUVertexInputState
	vertex_buffer_descriptions as const SDL_GPUVertexBufferDescription ptr
	num_vertex_buffers as Uint32
	vertex_attributes as const SDL_GPUVertexAttribute ptr
	num_vertex_attributes as Uint32
end type

type SDL_GPUStencilOpState
	fail_op as SDL_GPUStencilOp
	pass_op as SDL_GPUStencilOp
	depth_fail_op as SDL_GPUStencilOp
	compare_op as SDL_GPUCompareOp
end type

type SDL_GPUColorTargetBlendState
	src_color_blendfactor as SDL_GPUBlendFactor
	dst_color_blendfactor as SDL_GPUBlendFactor
	color_blend_op as SDL_GPUBlendOp
	src_alpha_blendfactor as SDL_GPUBlendFactor
	dst_alpha_blendfactor as SDL_GPUBlendFactor
	alpha_blend_op as SDL_GPUBlendOp
	color_write_mask as SDL_GPUColorComponentFlags
	enable_blend as boolean
	enable_color_write_mask as boolean
	padding1 as Uint8
	padding2 as Uint8
end type

type SDL_GPUShaderCreateInfo
	code_size as uinteger
	code as const Uint8 ptr
	entrypoint as const zstring ptr
	format as SDL_GPUShaderFormat
	stage as SDL_GPUShaderStage
	num_samplers as Uint32
	num_storage_textures as Uint32
	num_storage_buffers as Uint32
	num_uniform_buffers as Uint32
	props as SDL_PropertiesID
end type

type SDL_GPUTextureCreateInfo
	as SDL_GPUTextureType type
	format as SDL_GPUTextureFormat
	usage as SDL_GPUTextureUsageFlags
	width as Uint32
	height as Uint32
	layer_count_or_depth as Uint32
	num_levels as Uint32
	sample_count as SDL_GPUSampleCount
	props as SDL_PropertiesID
end type

type SDL_GPUBufferCreateInfo
	usage as SDL_GPUBufferUsageFlags
	size as Uint32
	props as SDL_PropertiesID
end type

type SDL_GPUTransferBufferCreateInfo
	usage as SDL_GPUTransferBufferUsage
	size as Uint32
	props as SDL_PropertiesID
end type

type SDL_GPURasterizerState
	fill_mode as SDL_GPUFillMode
	cull_mode as SDL_GPUCullMode
	front_face as SDL_GPUFrontFace
	depth_bias_constant_factor as single
	depth_bias_clamp as single
	depth_bias_slope_factor as single
	enable_depth_bias as boolean
	enable_depth_clip as boolean
	padding1 as Uint8
	padding2 as Uint8
end type

type SDL_GPUMultisampleState
	sample_count as SDL_GPUSampleCount
	sample_mask as Uint32
	enable_mask as boolean
	padding1 as Uint8
	padding2 as Uint8
	padding3 as Uint8
end type

type SDL_GPUDepthStencilState
	compare_op as SDL_GPUCompareOp
	back_stencil_state as SDL_GPUStencilOpState
	front_stencil_state as SDL_GPUStencilOpState
	compare_mask as Uint8
	write_mask as Uint8
	enable_depth_test as boolean
	enable_depth_write as boolean
	enable_stencil_test as boolean
	padding1 as Uint8
	padding2 as Uint8
	padding3 as Uint8
end type

type SDL_GPUColorTargetDescription
	format as SDL_GPUTextureFormat
	blend_state as SDL_GPUColorTargetBlendState
end type

type SDL_GPUGraphicsPipelineTargetInfo
	color_target_descriptions as const SDL_GPUColorTargetDescription ptr
	num_color_targets as Uint32
	depth_stencil_format as SDL_GPUTextureFormat
	has_depth_stencil_target as boolean
	padding1 as Uint8
	padding2 as Uint8
	padding3 as Uint8
end type

type SDL_GPUGraphicsPipelineCreateInfo
	vertex_shader as SDL_GPUShader ptr
	fragment_shader as SDL_GPUShader ptr
	vertex_input_state as SDL_GPUVertexInputState
	primitive_type as SDL_GPUPrimitiveType
	rasterizer_state as SDL_GPURasterizerState
	multisample_state as SDL_GPUMultisampleState
	depth_stencil_state as SDL_GPUDepthStencilState
	target_info as SDL_GPUGraphicsPipelineTargetInfo
	props as SDL_PropertiesID
end type

type SDL_GPUComputePipelineCreateInfo
	code_size as uinteger
	code as const Uint8 ptr
	entrypoint as const zstring ptr
	format as SDL_GPUShaderFormat
	num_samplers as Uint32
	num_readonly_storage_textures as Uint32
	num_readonly_storage_buffers as Uint32
	num_readwrite_storage_textures as Uint32
	num_readwrite_storage_buffers as Uint32
	num_uniform_buffers as Uint32
	threadcount_x as Uint32
	threadcount_y as Uint32
	threadcount_z as Uint32
	props as SDL_PropertiesID
end type

type SDL_GPUColorTargetInfo
	texture as SDL_GPUTexture ptr
	mip_level as Uint32
	layer_or_depth_plane as Uint32
	clear_color as SDL_FColor
	load_op as SDL_GPULoadOp
	store_op as SDL_GPUStoreOp
	resolve_texture as SDL_GPUTexture ptr
	resolve_mip_level as Uint32
	resolve_layer as Uint32
	cycle as boolean
	cycle_resolve_texture as boolean
	padding1 as Uint8
	padding2 as Uint8
end type

type SDL_GPUDepthStencilTargetInfo
	texture as SDL_GPUTexture ptr
	clear_depth as single
	load_op as SDL_GPULoadOp
	store_op as SDL_GPUStoreOp
	stencil_load_op as SDL_GPULoadOp
	stencil_store_op as SDL_GPUStoreOp
	cycle as boolean
	clear_stencil as Uint8
	padding1 as Uint8
	padding2 as Uint8
end type

type SDL_GPUBlitInfo
	source as SDL_GPUBlitRegion
	destination as SDL_GPUBlitRegion
	load_op as SDL_GPULoadOp
	clear_color as SDL_FColor
	flip_mode as SDL_FlipMode
	filter as SDL_GPUFilter
	cycle as boolean
	padding1 as Uint8
	padding2 as Uint8
	padding3 as Uint8
end type

type SDL_GPUBufferBinding
	buffer as SDL_GPUBuffer ptr
	offset as Uint32
end type

type SDL_GPUTextureSamplerBinding
	texture as SDL_GPUTexture ptr
	sampler as SDL_GPUSampler ptr
end type

type SDL_GPUStorageBufferReadWriteBinding
	buffer as SDL_GPUBuffer ptr
	cycle as boolean
	padding1 as Uint8
	padding2 as Uint8
	padding3 as Uint8
end type

type SDL_GPUStorageTextureReadWriteBinding
	texture as SDL_GPUTexture ptr
	mip_level as Uint32
	layer as Uint32
	cycle as boolean
	padding1 as Uint8
	padding2 as Uint8
	padding3 as Uint8
end type

declare function SDL_GPUSupportsShaderFormats(byval format_flags as SDL_GPUShaderFormat, byval name as const zstring ptr) as boolean
declare function SDL_GPUSupportsProperties(byval props as SDL_PropertiesID) as boolean
declare function SDL_CreateGPUDevice(byval format_flags as SDL_GPUShaderFormat, byval debug_mode as boolean, byval name as const zstring ptr) as SDL_GPUDevice ptr
declare function SDL_CreateGPUDeviceWithProperties(byval props as SDL_PropertiesID) as SDL_GPUDevice ptr

#define SDL_PROP_GPU_DEVICE_CREATE_DEBUGMODE_BOOLEAN          "SDL.gpu.device.create.debugmode"
#define SDL_PROP_GPU_DEVICE_CREATE_PREFERLOWPOWER_BOOLEAN     "SDL.gpu.device.create.preferlowpower"
#define SDL_PROP_GPU_DEVICE_CREATE_NAME_STRING                "SDL.gpu.device.create.name"
#define SDL_PROP_GPU_DEVICE_CREATE_SHADERS_PRIVATE_BOOLEAN    "SDL.gpu.device.create.shaders.private"
#define SDL_PROP_GPU_DEVICE_CREATE_SHADERS_SPIRV_BOOLEAN      "SDL.gpu.device.create.shaders.spirv"
#define SDL_PROP_GPU_DEVICE_CREATE_SHADERS_DXBC_BOOLEAN       "SDL.gpu.device.create.shaders.dxbc"
#define SDL_PROP_GPU_DEVICE_CREATE_SHADERS_DXIL_BOOLEAN       "SDL.gpu.device.create.shaders.dxil"
#define SDL_PROP_GPU_DEVICE_CREATE_SHADERS_MSL_BOOLEAN        "SDL.gpu.device.create.shaders.msl"
#define SDL_PROP_GPU_DEVICE_CREATE_SHADERS_METALLIB_BOOLEAN   "SDL.gpu.device.create.shaders.metallib"
#define SDL_PROP_GPU_DEVICE_CREATE_D3D12_SEMANTIC_NAME_STRING "SDL.gpu.device.create.d3d12.semantic"

declare sub SDL_DestroyGPUDevice(byval device as SDL_GPUDevice ptr)
declare function SDL_GetNumGPUDrivers() as long
declare function SDL_GetGPUDriver(byval index as long) as const zstring ptr
declare function SDL_GetGPUDeviceDriver(byval device as SDL_GPUDevice ptr) as const zstring ptr
declare function SDL_GetGPUShaderFormats(byval device as SDL_GPUDevice ptr) as SDL_GPUShaderFormat
declare function SDL_CreateGPUComputePipeline(byval device as SDL_GPUDevice ptr, byval createinfo as const SDL_GPUComputePipelineCreateInfo ptr) as SDL_GPUComputePipeline ptr
#define SDL_PROP_GPU_COMPUTEPIPELINE_CREATE_NAME_STRING "SDL.gpu.computepipeline.create.name"
declare function SDL_CreateGPUGraphicsPipeline(byval device as SDL_GPUDevice ptr, byval createinfo as const SDL_GPUGraphicsPipelineCreateInfo ptr) as SDL_GPUGraphicsPipeline ptr
#define SDL_PROP_GPU_GRAPHICSPIPELINE_CREATE_NAME_STRING "SDL.gpu.graphicspipeline.create.name"
declare function SDL_CreateGPUSampler(byval device as SDL_GPUDevice ptr, byval createinfo as const SDL_GPUSamplerCreateInfo ptr) as SDL_GPUSampler ptr
#define SDL_PROP_GPU_SAMPLER_CREATE_NAME_STRING "SDL.gpu.sampler.create.name"
declare function SDL_CreateGPUShader(byval device as SDL_GPUDevice ptr, byval createinfo as const SDL_GPUShaderCreateInfo ptr) as SDL_GPUShader ptr
#define SDL_PROP_GPU_SHADER_CREATE_NAME_STRING "SDL.gpu.shader.create.name"
declare function SDL_CreateGPUTexture(byval device as SDL_GPUDevice ptr, byval createinfo as const SDL_GPUTextureCreateInfo ptr) as SDL_GPUTexture ptr
#define SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_R_FLOAT         "SDL.gpu.texture.create.d3d12.clear.r"
#define SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_G_FLOAT         "SDL.gpu.texture.create.d3d12.clear.g"
#define SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_B_FLOAT         "SDL.gpu.texture.create.d3d12.clear.b"
#define SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_A_FLOAT         "SDL.gpu.texture.create.d3d12.clear.a"
#define SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_DEPTH_FLOAT     "SDL.gpu.texture.create.d3d12.clear.depth"
#define SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_STENCIL_NUMBER  "SDL.gpu.texture.create.d3d12.clear.stencil"
#define SDL_PROP_GPU_TEXTURE_CREATE_NAME_STRING                 "SDL.gpu.texture.create.name"

declare function SDL_CreateGPUBuffer(byval device as SDL_GPUDevice ptr, byval createinfo as const SDL_GPUBufferCreateInfo ptr) as SDL_GPUBuffer ptr

#define SDL_PROP_GPU_BUFFER_CREATE_NAME_STRING "SDL.gpu.buffer.create.name"

declare function SDL_CreateGPUTransferBuffer(byval device as SDL_GPUDevice ptr, byval createinfo as const SDL_GPUTransferBufferCreateInfo ptr) as SDL_GPUTransferBuffer ptr

#define SDL_PROP_GPU_TRANSFERBUFFER_CREATE_NAME_STRING "SDL.gpu.transferbuffer.create.name"

declare sub SDL_SetGPUBufferName(byval device as SDL_GPUDevice ptr, byval buffer as SDL_GPUBuffer ptr, byval text as const zstring ptr)
declare sub SDL_SetGPUTextureName(byval device as SDL_GPUDevice ptr, byval texture as SDL_GPUTexture ptr, byval text as const zstring ptr)
declare sub SDL_InsertGPUDebugLabel(byval command_buffer as SDL_GPUCommandBuffer ptr, byval text as const zstring ptr)
declare sub SDL_PushGPUDebugGroup(byval command_buffer as SDL_GPUCommandBuffer ptr, byval name as const zstring ptr)
declare sub SDL_PopGPUDebugGroup(byval command_buffer as SDL_GPUCommandBuffer ptr)
declare sub SDL_ReleaseGPUTexture(byval device as SDL_GPUDevice ptr, byval texture as SDL_GPUTexture ptr)
declare sub SDL_ReleaseGPUSampler(byval device as SDL_GPUDevice ptr, byval sampler as SDL_GPUSampler ptr)
declare sub SDL_ReleaseGPUBuffer(byval device as SDL_GPUDevice ptr, byval buffer as SDL_GPUBuffer ptr)
declare sub SDL_ReleaseGPUTransferBuffer(byval device as SDL_GPUDevice ptr, byval transfer_buffer as SDL_GPUTransferBuffer ptr)
declare sub SDL_ReleaseGPUComputePipeline(byval device as SDL_GPUDevice ptr, byval compute_pipeline as SDL_GPUComputePipeline ptr)
declare sub SDL_ReleaseGPUShader(byval device as SDL_GPUDevice ptr, byval shader as SDL_GPUShader ptr)
declare sub SDL_ReleaseGPUGraphicsPipeline(byval device as SDL_GPUDevice ptr, byval graphics_pipeline as SDL_GPUGraphicsPipeline ptr)
declare function SDL_AcquireGPUCommandBuffer(byval device as SDL_GPUDevice ptr) as SDL_GPUCommandBuffer ptr
declare sub SDL_PushGPUVertexUniformData(byval command_buffer as SDL_GPUCommandBuffer ptr, byval slot_index as Uint32, byval data as const any ptr, byval length as Uint32)
declare sub SDL_PushGPUFragmentUniformData(byval command_buffer as SDL_GPUCommandBuffer ptr, byval slot_index as Uint32, byval data as const any ptr, byval length as Uint32)
declare sub SDL_PushGPUComputeUniformData(byval command_buffer as SDL_GPUCommandBuffer ptr, byval slot_index as Uint32, byval data as const any ptr, byval length as Uint32)
declare function SDL_BeginGPURenderPass(byval command_buffer as SDL_GPUCommandBuffer ptr, byval color_target_infos as const SDL_GPUColorTargetInfo ptr, byval num_color_targets as Uint32, byval depth_stencil_target_info as const SDL_GPUDepthStencilTargetInfo ptr) as SDL_GPURenderPass ptr
declare sub SDL_BindGPUGraphicsPipeline(byval render_pass as SDL_GPURenderPass ptr, byval graphics_pipeline as SDL_GPUGraphicsPipeline ptr)
declare sub SDL_SetGPUViewport(byval render_pass as SDL_GPURenderPass ptr, byval viewport as const SDL_GPUViewport ptr)
declare sub SDL_SetGPUScissor(byval render_pass as SDL_GPURenderPass ptr, byval scissor as const SDL_Rect ptr)
declare sub SDL_SetGPUBlendConstants(byval render_pass as SDL_GPURenderPass ptr, byval blend_constants as SDL_FColor)
declare sub SDL_SetGPUStencilReference(byval render_pass as SDL_GPURenderPass ptr, byval reference as Uint8)
declare sub SDL_BindGPUVertexBuffers(byval render_pass as SDL_GPURenderPass ptr, byval first_slot as Uint32, byval bindings as const SDL_GPUBufferBinding ptr, byval num_bindings as Uint32)
declare sub SDL_BindGPUIndexBuffer(byval render_pass as SDL_GPURenderPass ptr, byval binding as const SDL_GPUBufferBinding ptr, byval index_element_size as SDL_GPUIndexElementSize)
declare sub SDL_BindGPUVertexSamplers(byval render_pass as SDL_GPURenderPass ptr, byval first_slot as Uint32, byval texture_sampler_bindings as const SDL_GPUTextureSamplerBinding ptr, byval num_bindings as Uint32)
declare sub SDL_BindGPUVertexStorageTextures(byval render_pass as SDL_GPURenderPass ptr, byval first_slot as Uint32, byval storage_textures as SDL_GPUTexture const ptr ptr, byval num_bindings as Uint32)
declare sub SDL_BindGPUVertexStorageBuffers(byval render_pass as SDL_GPURenderPass ptr, byval first_slot as Uint32, byval storage_buffers as SDL_GPUBuffer const ptr ptr, byval num_bindings as Uint32)
declare sub SDL_BindGPUFragmentSamplers(byval render_pass as SDL_GPURenderPass ptr, byval first_slot as Uint32, byval texture_sampler_bindings as const SDL_GPUTextureSamplerBinding ptr, byval num_bindings as Uint32)
declare sub SDL_BindGPUFragmentStorageTextures(byval render_pass as SDL_GPURenderPass ptr, byval first_slot as Uint32, byval storage_textures as SDL_GPUTexture const ptr ptr, byval num_bindings as Uint32)
declare sub SDL_BindGPUFragmentStorageBuffers(byval render_pass as SDL_GPURenderPass ptr, byval first_slot as Uint32, byval storage_buffers as SDL_GPUBuffer const ptr ptr, byval num_bindings as Uint32)
declare sub SDL_DrawGPUIndexedPrimitives(byval render_pass as SDL_GPURenderPass ptr, byval num_indices as Uint32, byval num_instances as Uint32, byval first_index as Uint32, byval vertex_offset as Sint32, byval first_instance as Uint32)
declare sub SDL_DrawGPUPrimitives(byval render_pass as SDL_GPURenderPass ptr, byval num_vertices as Uint32, byval num_instances as Uint32, byval first_vertex as Uint32, byval first_instance as Uint32)
declare sub SDL_DrawGPUPrimitivesIndirect(byval render_pass as SDL_GPURenderPass ptr, byval buffer as SDL_GPUBuffer ptr, byval offset as Uint32, byval draw_count as Uint32)
declare sub SDL_DrawGPUIndexedPrimitivesIndirect(byval render_pass as SDL_GPURenderPass ptr, byval buffer as SDL_GPUBuffer ptr, byval offset as Uint32, byval draw_count as Uint32)
declare sub SDL_EndGPURenderPass(byval render_pass as SDL_GPURenderPass ptr)
declare function SDL_BeginGPUComputePass(byval command_buffer as SDL_GPUCommandBuffer ptr, byval storage_texture_bindings as const SDL_GPUStorageTextureReadWriteBinding ptr, byval num_storage_texture_bindings as Uint32, byval storage_buffer_bindings as const SDL_GPUStorageBufferReadWriteBinding ptr, byval num_storage_buffer_bindings as Uint32) as SDL_GPUComputePass ptr
declare sub SDL_BindGPUComputePipeline(byval compute_pass as SDL_GPUComputePass ptr, byval compute_pipeline as SDL_GPUComputePipeline ptr)
declare sub SDL_BindGPUComputeSamplers(byval compute_pass as SDL_GPUComputePass ptr, byval first_slot as Uint32, byval texture_sampler_bindings as const SDL_GPUTextureSamplerBinding ptr, byval num_bindings as Uint32)
declare sub SDL_BindGPUComputeStorageTextures(byval compute_pass as SDL_GPUComputePass ptr, byval first_slot as Uint32, byval storage_textures as SDL_GPUTexture const ptr ptr, byval num_bindings as Uint32)
declare sub SDL_BindGPUComputeStorageBuffers(byval compute_pass as SDL_GPUComputePass ptr, byval first_slot as Uint32, byval storage_buffers as SDL_GPUBuffer const ptr ptr, byval num_bindings as Uint32)
declare sub SDL_DispatchGPUCompute(byval compute_pass as SDL_GPUComputePass ptr, byval groupcount_x as Uint32, byval groupcount_y as Uint32, byval groupcount_z as Uint32)
declare sub SDL_DispatchGPUComputeIndirect(byval compute_pass as SDL_GPUComputePass ptr, byval buffer as SDL_GPUBuffer ptr, byval offset as Uint32)
declare sub SDL_EndGPUComputePass(byval compute_pass as SDL_GPUComputePass ptr)
declare function SDL_MapGPUTransferBuffer(byval device as SDL_GPUDevice ptr, byval transfer_buffer as SDL_GPUTransferBuffer ptr, byval cycle as boolean) as any ptr
declare sub SDL_UnmapGPUTransferBuffer(byval device as SDL_GPUDevice ptr, byval transfer_buffer as SDL_GPUTransferBuffer ptr)
declare function SDL_BeginGPUCopyPass(byval command_buffer as SDL_GPUCommandBuffer ptr) as SDL_GPUCopyPass ptr
declare sub SDL_UploadToGPUTexture(byval copy_pass as SDL_GPUCopyPass ptr, byval source as const SDL_GPUTextureTransferInfo ptr, byval destination as const SDL_GPUTextureRegion ptr, byval cycle as boolean)
declare sub SDL_UploadToGPUBuffer(byval copy_pass as SDL_GPUCopyPass ptr, byval source as const SDL_GPUTransferBufferLocation ptr, byval destination as const SDL_GPUBufferRegion ptr, byval cycle as boolean)
declare sub SDL_CopyGPUTextureToTexture(byval copy_pass as SDL_GPUCopyPass ptr, byval source as const SDL_GPUTextureLocation ptr, byval destination as const SDL_GPUTextureLocation ptr, byval w as Uint32, byval h as Uint32, byval d as Uint32, byval cycle as boolean)
declare sub SDL_CopyGPUBufferToBuffer(byval copy_pass as SDL_GPUCopyPass ptr, byval source as const SDL_GPUBufferLocation ptr, byval destination as const SDL_GPUBufferLocation ptr, byval size as Uint32, byval cycle as boolean)
declare sub SDL_DownloadFromGPUTexture(byval copy_pass as SDL_GPUCopyPass ptr, byval source as const SDL_GPUTextureRegion ptr, byval destination as const SDL_GPUTextureTransferInfo ptr)
declare sub SDL_DownloadFromGPUBuffer(byval copy_pass as SDL_GPUCopyPass ptr, byval source as const SDL_GPUBufferRegion ptr, byval destination as const SDL_GPUTransferBufferLocation ptr)
declare sub SDL_EndGPUCopyPass(byval copy_pass as SDL_GPUCopyPass ptr)
declare sub SDL_GenerateMipmapsForGPUTexture(byval command_buffer as SDL_GPUCommandBuffer ptr, byval texture as SDL_GPUTexture ptr)
declare sub SDL_BlitGPUTexture(byval command_buffer as SDL_GPUCommandBuffer ptr, byval info as const SDL_GPUBlitInfo ptr)
declare function SDL_WindowSupportsGPUSwapchainComposition(byval device as SDL_GPUDevice ptr, byval window as SDL_Window ptr, byval swapchain_composition as SDL_GPUSwapchainComposition) as boolean
declare function SDL_WindowSupportsGPUPresentMode(byval device as SDL_GPUDevice ptr, byval window as SDL_Window ptr, byval present_mode as SDL_GPUPresentMode) as boolean
declare function SDL_ClaimWindowForGPUDevice(byval device as SDL_GPUDevice ptr, byval window as SDL_Window ptr) as boolean
declare sub SDL_ReleaseWindowFromGPUDevice(byval device as SDL_GPUDevice ptr, byval window as SDL_Window ptr)
declare function SDL_SetGPUSwapchainParameters(byval device as SDL_GPUDevice ptr, byval window as SDL_Window ptr, byval swapchain_composition as SDL_GPUSwapchainComposition, byval present_mode as SDL_GPUPresentMode) as boolean
declare function SDL_GetGPUAllowedFramesInFlight(byval device as SDL_GPUDevice ptr, byval allowed_frames_in_flight as Uint32) as boolean
declare function SDL_GetGPUSwapchainTextureFormat(byval device as SDL_GPUDevice ptr, byval window as SDL_Window ptr) as SDL_GPUTextureFormat
declare function SDL_AcquireGPUSwapchainTexture(byval command_buffer as SDL_GPUCommandBuffer ptr, byval window as SDL_Window ptr, byval swapchain_texture as SDL_GPUTexture ptr ptr, byval swapchain_texture_width as Uint32 ptr, byval swapchain_texture_height as Uint32 ptr) as boolean
declare function SDL_WaitForGPUSwapchain(byval device as SDL_GPUDevice ptr, byval window as SDL_Window ptr) as boolean
declare function SDL_WaitAndAcquireGPUSwapchainTexture(byval command_buffer as SDL_GPUCommandBuffer ptr, byval window as SDL_Window ptr, byval swapchain_texture as SDL_GPUTexture ptr ptr, byval swapchain_texture_width as Uint32 ptr, byval swapchain_texture_height as Uint32 ptr) as boolean
declare function SDL_SubmitGPUCommandBuffer(byval command_buffer as SDL_GPUCommandBuffer ptr) as boolean
declare function SDL_SubmitGPUCommandBufferAndAcquireFence(byval command_buffer as SDL_GPUCommandBuffer ptr) as SDL_GPUFence ptr
declare function SDL_CancelGPUCommandBuffer(byval command_buffer as SDL_GPUCommandBuffer ptr) as boolean
declare function SDL_WaitForGPUIdle(byval device as SDL_GPUDevice ptr) as boolean
declare function SDL_WaitForGPUFences(byval device as SDL_GPUDevice ptr, byval wait_all as boolean, byval fences as SDL_GPUFence const ptr ptr, byval num_fences as Uint32) as boolean
declare function SDL_QueryGPUFence(byval device as SDL_GPUDevice ptr, byval fence as SDL_GPUFence ptr) as boolean
declare sub SDL_ReleaseGPUFence(byval device as SDL_GPUDevice ptr, byval fence as SDL_GPUFence ptr)
declare function SDL_GPUTextureFormatTexelBlockSize(byval format as SDL_GPUTextureFormat) as Uint32
declare function SDL_GPUTextureSupportsFormat(byval device as SDL_GPUDevice ptr, byval format as SDL_GPUTextureFormat, byval type as SDL_GPUTextureType, byval usage as SDL_GPUTextureUsageFlags) as boolean
declare function SDL_GPUTextureSupportsSampleCount(byval device as SDL_GPUDevice ptr, byval format as SDL_GPUTextureFormat, byval sample_count as SDL_GPUSampleCount) as boolean
declare function SDL_CalculateGPUTextureFormatSize(byval format as SDL_GPUTextureFormat, byval width as Uint32, byval height as Uint32, byval depth_or_layer_count as Uint32) as Uint32

#ifdef SDL_PLATFORM_GDK
 declare sub SDL_GDKSuspendGPU(byval device as SDL_GPUDevice ptr)
 declare sub SDL_GDKResumeGPU(byval device as SDL_GPUDevice ptr)
#endif

end extern
