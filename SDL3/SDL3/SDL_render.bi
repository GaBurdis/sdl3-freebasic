#pragma once

extern "C"

#define SDL_SOFTWARE_RENDERER "software"

type SDL_Vertex
	position as SDL_FPoint
	color as SDL_FColor
	tex_coord as SDL_FPoint
end type

type SDL_TextureAccess as long
enum
	SDL_TEXTUREACCESS_STATIC
	SDL_TEXTUREACCESS_STREAMING
	SDL_TEXTUREACCESS_TARGET
end enum

type SDL_RendererLogicalPresentation as long
enum
	SDL_LOGICAL_PRESENTATION_DISABLED
	SDL_LOGICAL_PRESENTATION_STRETCH
	SDL_LOGICAL_PRESENTATION_LETTERBOX
	SDL_LOGICAL_PRESENTATION_OVERSCAN
	SDL_LOGICAL_PRESENTATION_INTEGER_SCALE
end enum

type SDL_Renderer as _SDL_Renderer

#ifndef SDL_INTERNAL
  type SDL_Texture
    format as SDL_PixelFormat
    w as long
    h as long
    refcount as long
  end type
#else
  type SDL_Texture as _SDL_Texture
#endif

declare function SDL_GetNumRenderDrivers() as long
declare function SDL_GetRenderDriver(byval index as long) as const zstring ptr
declare function SDL_CreateWindowAndRenderer(byval title as const zstring ptr, byval width as long, byval height as long, byval window_flags as SDL_WindowFlags, byval window as SDL_Window ptr ptr, byval renderer as SDL_Renderer ptr ptr) as boolean
declare function SDL_CreateRenderer(byval window as SDL_Window ptr, byval name as const zstring ptr) as SDL_Renderer ptr
declare function SDL_CreateRendererWithProperties(byval props as SDL_PropertiesID) as SDL_Renderer ptr

#define SDL_PROP_RENDERER_CREATE_NAME_STRING "SDL.renderer.create.name"
#define SDL_PROP_RENDERER_CREATE_WINDOW_POINTER "SDL.renderer.create.window"
#define SDL_PROP_RENDERER_CREATE_SURFACE_POINTER "SDL.renderer.create.surface"
#define SDL_PROP_RENDERER_CREATE_OUTPUT_COLORSPACE_NUMBER "SDL.renderer.create.output_colorspace"
#define SDL_PROP_RENDERER_CREATE_PRESENT_VSYNC_NUMBER "SDL.renderer.create.present_vsync"
#define SDL_PROP_RENDERER_CREATE_VULKAN_INSTANCE_POINTER "SDL.renderer.create.vulkan.instance"
#define SDL_PROP_RENDERER_CREATE_VULKAN_SURFACE_NUMBER "SDL.renderer.create.vulkan.surface"
#define SDL_PROP_RENDERER_CREATE_VULKAN_PHYSICAL_DEVICE_POINTER "SDL.renderer.create.vulkan.physical_device"
#define SDL_PROP_RENDERER_CREATE_VULKAN_DEVICE_POINTER "SDL.renderer.create.vulkan.device"
#define SDL_PROP_RENDERER_CREATE_VULKAN_GRAPHICS_QUEUE_FAMILY_INDEX_NUMBER "SDL.renderer.create.vulkan.graphics_queue_family_index"
#define SDL_PROP_RENDERER_CREATE_VULKAN_PRESENT_QUEUE_FAMILY_INDEX_NUMBER "SDL.renderer.create.vulkan.present_queue_family_index"

declare function SDL_CreateSoftwareRenderer(byval surface as SDL_Surface ptr) as SDL_Renderer ptr
declare function SDL_GetRenderer(byval window as SDL_Window ptr) as SDL_Renderer ptr
declare function SDL_GetRenderWindow(byval renderer as SDL_Renderer ptr) as SDL_Window ptr
declare function SDL_GetRendererName(byval renderer as SDL_Renderer ptr) as const zstring ptr
declare function SDL_GetRendererProperties(byval renderer as SDL_Renderer ptr) as SDL_PropertiesID

#define SDL_PROP_RENDERER_NAME_STRING "SDL.renderer.name"
#define SDL_PROP_RENDERER_WINDOW_POINTER "SDL.renderer.window"
#define SDL_PROP_RENDERER_SURFACE_POINTER "SDL.renderer.surface"
#define SDL_PROP_RENDERER_VSYNC_NUMBER "SDL.renderer.vsync"
#define SDL_PROP_RENDERER_MAX_TEXTURE_SIZE_NUMBER "SDL.renderer.max_texture_size"
#define SDL_PROP_RENDERER_TEXTURE_FORMATS_POINTER "SDL.renderer.texture_formats"
#define SDL_PROP_RENDERER_OUTPUT_COLORSPACE_NUMBER "SDL.renderer.output_colorspace"
#define SDL_PROP_RENDERER_HDR_ENABLED_BOOLEAN "SDL.renderer.HDR_enabled"
#define SDL_PROP_RENDERER_SDR_WHITE_POINT_FLOAT "SDL.renderer.SDR_white_point"
#define SDL_PROP_RENDERER_HDR_HEADROOM_FLOAT "SDL.renderer.HDR_headroom"
#define SDL_PROP_RENDERER_D3D9_DEVICE_POINTER "SDL.renderer.d3d9.device"
#define SDL_PROP_RENDERER_D3D11_DEVICE_POINTER "SDL.renderer.d3d11.device"
#define SDL_PROP_RENDERER_D3D11_SWAPCHAIN_POINTER "SDL.renderer.d3d11.swap_chain"
#define SDL_PROP_RENDERER_D3D12_DEVICE_POINTER "SDL.renderer.d3d12.device"
#define SDL_PROP_RENDERER_D3D12_SWAPCHAIN_POINTER "SDL.renderer.d3d12.swap_chain"
#define SDL_PROP_RENDERER_D3D12_COMMAND_QUEUE_POINTER "SDL.renderer.d3d12.command_queue"
#define SDL_PROP_RENDERER_VULKAN_INSTANCE_POINTER "SDL.renderer.vulkan.instance"
#define SDL_PROP_RENDERER_VULKAN_SURFACE_NUMBER "SDL.renderer.vulkan.surface"
#define SDL_PROP_RENDERER_VULKAN_PHYSICAL_DEVICE_POINTER "SDL.renderer.vulkan.physical_device"
#define SDL_PROP_RENDERER_VULKAN_DEVICE_POINTER "SDL.renderer.vulkan.device"
#define SDL_PROP_RENDERER_VULKAN_GRAPHICS_QUEUE_FAMILY_INDEX_NUMBER "SDL.renderer.vulkan.graphics_queue_family_index"
#define SDL_PROP_RENDERER_VULKAN_PRESENT_QUEUE_FAMILY_INDEX_NUMBER  "SDL.renderer.vulkan.present_queue_family_index"
#define SDL_PROP_RENDERER_VULKAN_SWAPCHAIN_IMAGE_COUNT_NUMBER       "SDL.renderer.vulkan.swapchain_image_count"
#define SDL_PROP_RENDERER_GPU_DEVICE_POINTER                        "SDL.renderer.gpu.device"

declare function SDL_GetRenderOutputSize(byval renderer as SDL_Renderer ptr, byval w as long ptr, byval h as long ptr) as boolean
declare function SDL_GetCurrentRenderOutputSize(byval renderer as SDL_Renderer ptr, byval w as long ptr, byval h as long ptr) as boolean
declare function SDL_CreateTexture(byval renderer as SDL_Renderer ptr, byval format as SDL_PixelFormat, byval access as SDL_TextureAccess, byval w as long, byval h as long) as SDL_Texture ptr
declare function SDL_CreateTextureFromSurface(byval renderer as SDL_Renderer ptr, byval surface as SDL_Surface ptr) as SDL_Texture ptr
declare function SDL_CreateTextureWithProperties(byval renderer as SDL_Renderer ptr, byval props as SDL_PropertiesID) as SDL_Texture ptr

#define SDL_PROP_TEXTURE_CREATE_COLORSPACE_NUMBER "SDL.texture.create.colorspace"
#define SDL_PROP_TEXTURE_CREATE_FORMAT_NUMBER "SDL.texture.create.format"
#define SDL_PROP_TEXTURE_CREATE_ACCESS_NUMBER "SDL.texture.create.access"
#define SDL_PROP_TEXTURE_CREATE_WIDTH_NUMBER "SDL.texture.create.width"
#define SDL_PROP_TEXTURE_CREATE_HEIGHT_NUMBER "SDL.texture.create.height"
#define SDL_PROP_TEXTURE_CREATE_SDR_WHITE_POINT_FLOAT "SDL.texture.create.SDR_white_point"
#define SDL_PROP_TEXTURE_CREATE_HDR_HEADROOM_FLOAT "SDL.texture.create.HDR_headroom"
#define SDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_POINTER "SDL.texture.create.d3d11.texture"
#define SDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_U_POINTER "SDL.texture.create.d3d11.texture_u"
#define SDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_V_POINTER "SDL.texture.create.d3d11.texture_v"
#define SDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_POINTER "SDL.texture.create.d3d12.texture"
#define SDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_U_POINTER "SDL.texture.create.d3d12.texture_u"
#define SDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_V_POINTER "SDL.texture.create.d3d12.texture_v"
#define SDL_PROP_TEXTURE_CREATE_METAL_PIXELBUFFER_POINTER "SDL.texture.create.metal.pixelbuffer"
#define SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_NUMBER "SDL.texture.create.opengl.texture"
#define SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_UV_NUMBER "SDL.texture.create.opengl.texture_uv"
#define SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_U_NUMBER "SDL.texture.create.opengl.texture_u"
#define SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_V_NUMBER "SDL.texture.create.opengl.texture_v"
#define SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_NUMBER "SDL.texture.create.opengles2.texture"
#define SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_UV_NUMBER "SDL.texture.create.opengles2.texture_uv"
#define SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_U_NUMBER "SDL.texture.create.opengles2.texture_u"
#define SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_V_NUMBER "SDL.texture.create.opengles2.texture_v"
#define SDL_PROP_TEXTURE_CREATE_VULKAN_TEXTURE_NUMBER "SDL.texture.create.vulkan.texture"

declare function SDL_GetTextureProperties(byval texture as SDL_Texture ptr) as SDL_PropertiesID

#define SDL_PROP_TEXTURE_COLORSPACE_NUMBER "SDL.texture.colorspace"
#define SDL_PROP_TEXTURE_FORMAT_NUMBER "SDL.texture.format"
#define SDL_PROP_TEXTURE_ACCESS_NUMBER "SDL.texture.access"
#define SDL_PROP_TEXTURE_WIDTH_NUMBER "SDL.texture.width"
#define SDL_PROP_TEXTURE_HEIGHT_NUMBER "SDL.texture.height"
#define SDL_PROP_TEXTURE_SDR_WHITE_POINT_FLOAT "SDL.texture.SDR_white_point"
#define SDL_PROP_TEXTURE_HDR_HEADROOM_FLOAT "SDL.texture.HDR_headroom"
#define SDL_PROP_TEXTURE_D3D11_TEXTURE_POINTER "SDL.texture.d3d11.texture"
#define SDL_PROP_TEXTURE_D3D11_TEXTURE_U_POINTER "SDL.texture.d3d11.texture_u"
#define SDL_PROP_TEXTURE_D3D11_TEXTURE_V_POINTER "SDL.texture.d3d11.texture_v"
#define SDL_PROP_TEXTURE_D3D12_TEXTURE_POINTER "SDL.texture.d3d12.texture"
#define SDL_PROP_TEXTURE_D3D12_TEXTURE_U_POINTER "SDL.texture.d3d12.texture_u"
#define SDL_PROP_TEXTURE_D3D12_TEXTURE_V_POINTER "SDL.texture.d3d12.texture_v"
#define SDL_PROP_TEXTURE_OPENGL_TEXTURE_NUMBER "SDL.texture.opengl.texture"
#define SDL_PROP_TEXTURE_OPENGL_TEXTURE_UV_NUMBER "SDL.texture.opengl.texture_uv"
#define SDL_PROP_TEXTURE_OPENGL_TEXTURE_U_NUMBER "SDL.texture.opengl.texture_u"
#define SDL_PROP_TEXTURE_OPENGL_TEXTURE_V_NUMBER "SDL.texture.opengl.texture_v"
#define SDL_PROP_TEXTURE_OPENGL_TEXTURE_TARGET_NUMBER "SDL.texture.opengl.target"
#define SDL_PROP_TEXTURE_OPENGL_TEX_W_FLOAT "SDL.texture.opengl.tex_w"
#define SDL_PROP_TEXTURE_OPENGL_TEX_H_FLOAT "SDL.texture.opengl.tex_h"
#define SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_NUMBER "SDL.texture.opengles2.texture"
#define SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_UV_NUMBER "SDL.texture.opengles2.texture_uv"
#define SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_U_NUMBER "SDL.texture.opengles2.texture_u"
#define SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_V_NUMBER "SDL.texture.opengles2.texture_v"
#define SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_TARGET_NUMBER "SDL.texture.opengles2.target"
#define SDL_PROP_TEXTURE_VULKAN_TEXTURE_NUMBER "SDL.texture.vulkan.texture"

declare function SDL_GetRendererFromTexture(byval texture as SDL_Texture ptr) as SDL_Renderer ptr
declare function SDL_GetTextureSize(byval texture as SDL_Texture ptr, byval w as single ptr, byval h as single ptr) as boolean
declare function SDL_SetTextureColorMod(byval texture as SDL_Texture ptr, byval r as Uint8, byval g as Uint8, byval b as Uint8) as boolean
declare function SDL_SetTextureColorModFloat(byval texture as SDL_Texture ptr, byval r as single, byval g as single, byval b as single) as boolean
declare function SDL_GetTextureColorMod(byval texture as SDL_Texture ptr, byval r as Uint8 ptr, byval g as Uint8 ptr, byval b as Uint8 ptr) as boolean
declare function SDL_GetTextureColorModFloat(byval texture as SDL_Texture ptr, byval r as single ptr, byval g as single ptr, byval b as single ptr) as boolean
declare function SDL_SetTextureAlphaMod(byval texture as SDL_Texture ptr, byval alpha as Uint8) as boolean
declare function SDL_SetTextureAlphaModFloat(byval texture as SDL_Texture ptr, byval alpha as single) as boolean
declare function SDL_GetTextureAlphaMod(byval texture as SDL_Texture ptr, byval alpha as Uint8 ptr) as boolean
declare function SDL_GetTextureAlphaModFloat(byval texture as SDL_Texture ptr, byval alpha as single ptr) as boolean
declare function SDL_SetTextureBlendMode(byval texture as SDL_Texture ptr, byval blendMode as SDL_BlendMode) as boolean
declare function SDL_GetTextureBlendMode(byval texture as SDL_Texture ptr, byval blendMode as SDL_BlendMode ptr) as boolean
declare function SDL_SetTextureScaleMode(byval texture as SDL_Texture ptr, byval scaleMode as SDL_ScaleMode) as boolean
declare function SDL_GetTextureScaleMode(byval texture as SDL_Texture ptr, byval scaleMode as SDL_ScaleMode ptr) as boolean
declare function SDL_UpdateTexture(byval texture as SDL_Texture ptr, byval rect as const SDL_Rect ptr, byval pixels as const any ptr, byval pitch as long) as boolean
declare function SDL_UpdateYUVTexture(byval texture as SDL_Texture ptr, byval rect as const SDL_Rect ptr, byval Yplane as const Uint8 ptr, byval Ypitch as long, byval Uplane as const Uint8 ptr, byval Upitch as long, byval Vplane as const Uint8 ptr, byval Vpitch as long) as boolean
declare function SDL_UpdateNVTexture(byval texture as SDL_Texture ptr, byval rect as const SDL_Rect ptr, byval Yplane as const Uint8 ptr, byval Ypitch as long, byval UVplane as const Uint8 ptr, byval UVpitch as long) as boolean
declare function SDL_LockTexture(byval texture as SDL_Texture ptr, byval rect as const SDL_Rect ptr, byval pixels as any ptr ptr, byval pitch as long ptr) as boolean
declare function SDL_LockTextureToSurface(byval texture as SDL_Texture ptr, byval rect as const SDL_Rect ptr, byval surface as SDL_Surface ptr ptr) as boolean
declare sub SDL_UnlockTexture(byval texture as SDL_Texture ptr)
declare function SDL_SetRenderTarget(byval renderer as SDL_Renderer ptr, byval texture as SDL_Texture ptr) as boolean
declare function SDL_GetRenderTarget(byval renderer as SDL_Renderer ptr) as SDL_Texture ptr
declare function SDL_SetRenderLogicalPresentation(byval renderer as SDL_Renderer ptr, byval w as long, byval h as long, byval mode as SDL_RendererLogicalPresentation) as boolean
declare function SDL_GetRenderLogicalPresentation(byval renderer as SDL_Renderer ptr, byval w as long ptr, byval h as long ptr, byval mode as SDL_RendererLogicalPresentation ptr) as boolean
declare function SDL_GetRenderLogicalPresentationRect(byval renderer as SDL_Renderer ptr, byval rect as SDL_FRect ptr) as boolean
declare function SDL_RenderCoordinatesFromWindow(byval renderer as SDL_Renderer ptr, byval window_x as single, byval window_y as single, byval x as single ptr, byval y as single ptr) as boolean
declare function SDL_RenderCoordinatesToWindow(byval renderer as SDL_Renderer ptr, byval x as single, byval y as single, byval window_x as single ptr, byval window_y as single ptr) as boolean
declare function SDL_ConvertEventToRenderCoordinates(byval renderer as SDL_Renderer ptr, byval event as SDL_Event ptr) as boolean
declare function SDL_SetRenderViewport(byval renderer as SDL_Renderer ptr, byval rect as const SDL_Rect ptr) as boolean
declare function SDL_GetRenderViewport(byval renderer as SDL_Renderer ptr, byval rect as SDL_Rect ptr) as boolean
declare function SDL_RenderViewportSet(byval renderer as SDL_Renderer ptr) as boolean
declare function SDL_GetRenderSafeArea(byval renderer as SDL_Renderer ptr, byval rect as SDL_Rect ptr) as boolean
declare function SDL_SetRenderClipRect(byval renderer as SDL_Renderer ptr, byval rect as const SDL_Rect ptr) as boolean
declare function SDL_GetRenderClipRect(byval renderer as SDL_Renderer ptr, byval rect as SDL_Rect ptr) as boolean
declare function SDL_RenderClipEnabled(byval renderer as SDL_Renderer ptr) as boolean
declare function SDL_SetRenderScale(byval renderer as SDL_Renderer ptr, byval scaleX as single, byval scaleY as single) as boolean
declare function SDL_GetRenderScale(byval renderer as SDL_Renderer ptr, byval scaleX as single ptr, byval scaleY as single ptr) as boolean
declare function SDL_SetRenderDrawColor(byval renderer as SDL_Renderer ptr, byval r as Uint8, byval g as Uint8, byval b as Uint8, byval a as Uint8) as boolean
declare function SDL_SetRenderDrawColorFloat(byval renderer as SDL_Renderer ptr, byval r as single, byval g as single, byval b as single, byval a as single) as boolean
declare function SDL_GetRenderDrawColor(byval renderer as SDL_Renderer ptr, byval r as Uint8 ptr, byval g as Uint8 ptr, byval b as Uint8 ptr, byval a as Uint8 ptr) as boolean
declare function SDL_GetRenderDrawColorFloat(byval renderer as SDL_Renderer ptr, byval r as single ptr, byval g as single ptr, byval b as single ptr, byval a as single ptr) as boolean
declare function SDL_SetRenderColorScale(byval renderer as SDL_Renderer ptr, byval scale as single) as boolean
declare function SDL_GetRenderColorScale(byval renderer as SDL_Renderer ptr, byval scale as single ptr) as boolean
declare function SDL_SetRenderDrawBlendMode(byval renderer as SDL_Renderer ptr, byval blendMode as SDL_BlendMode) as boolean
declare function SDL_GetRenderDrawBlendMode(byval renderer as SDL_Renderer ptr, byval blendMode as SDL_BlendMode ptr) as boolean
declare function SDL_RenderClear(byval renderer as SDL_Renderer ptr) as boolean
declare function SDL_RenderPoint(byval renderer as SDL_Renderer ptr, byval x as single, byval y as single) as boolean
declare function SDL_RenderPoints(byval renderer as SDL_Renderer ptr, byval points as const SDL_FPoint ptr, byval count as long) as boolean
declare function SDL_RenderLine(byval renderer as SDL_Renderer ptr, byval x1 as single, byval y1 as single, byval x2 as single, byval y2 as single) as boolean
declare function SDL_RenderLines(byval renderer as SDL_Renderer ptr, byval points as const SDL_FPoint ptr, byval count as long) as boolean
declare function SDL_RenderRect(byval renderer as SDL_Renderer ptr, byval rect as const SDL_FRect ptr) as boolean
declare function SDL_RenderRects(byval renderer as SDL_Renderer ptr, byval rects as const SDL_FRect ptr, byval count as long) as boolean
declare function SDL_RenderFillRect(byval renderer as SDL_Renderer ptr, byval rect as const SDL_FRect ptr) as boolean
declare function SDL_RenderFillRects(byval renderer as SDL_Renderer ptr, byval rects as const SDL_FRect ptr, byval count as long) as boolean
declare function SDL_RenderTexture(byval renderer as SDL_Renderer ptr, byval texture as SDL_Texture ptr, byval srcrect as const SDL_FRect ptr, byval dstrect as const SDL_FRect ptr) as boolean
declare function SDL_RenderTextureRotated(byval renderer as SDL_Renderer ptr, byval texture as SDL_Texture ptr, byval srcrect as const SDL_FRect ptr, byval dstrect as const SDL_FRect ptr, byval angle as double, byval center as const SDL_FPoint ptr, byval flip as SDL_FlipMode) as boolean
declare function SDL_RenderTextureAffine(byval renderer as SDL_Renderer ptr, byval texture as SDL_Texture ptr, byval srcrect as const SDL_FRect ptr, byval origin as const SDL_FPoint ptr, byval right as const SDL_FPoint ptr, byval down as const SDL_FPoint ptr) as boolean
declare function SDL_RenderTextureTiled(byval renderer as SDL_Renderer ptr, byval texture as SDL_Texture ptr, byval srcrect as const SDL_FRect ptr, byval scale as single, byval dstrect as const SDL_FRect ptr) as boolean
declare function SDL_RenderTexture9Grid(byval renderer as SDL_Renderer ptr, byval texture as SDL_Texture ptr, byval srcrect as const SDL_FRect ptr, byval left_width as single, byval right_width as single, byval top_height as single, byval bottom_height as single, byval scale as single, byval dstrect as const SDL_FRect ptr) as boolean
declare function SDL_RenderGeometry(byval renderer as SDL_Renderer ptr, byval texture as SDL_Texture ptr, byval vertices as const SDL_Vertex ptr, byval num_vertices as long, byval indices as const long ptr, byval num_indices as long) as boolean
declare function SDL_RenderGeometryRaw(byval renderer as SDL_Renderer ptr, byval texture as SDL_Texture ptr, byval xy as const single ptr, byval xy_stride as long, byval color as const SDL_FColor ptr, byval color_stride as long, byval uv as const single ptr, byval uv_stride as long, byval num_vertices as long, byval indices as const any ptr, byval num_indices as long, byval size_indices as long) as boolean
declare function SDL_RenderReadPixels(byval renderer as SDL_Renderer ptr, byval rect as const SDL_Rect ptr) as SDL_Surface ptr
declare function SDL_RenderPresent(byval renderer as SDL_Renderer ptr) as boolean
declare sub SDL_DestroyTexture(byval texture as SDL_Texture ptr)
declare sub SDL_DestroyRenderer(byval renderer as SDL_Renderer ptr)
declare function SDL_FlushRenderer(byval renderer as SDL_Renderer ptr) as boolean
declare function SDL_GetRenderMetalLayer(byval renderer as SDL_Renderer ptr) as any ptr
declare function SDL_GetRenderMetalCommandEncoder(byval renderer as SDL_Renderer ptr) as any ptr
declare function SDL_AddVulkanRenderSemaphores(byval renderer as SDL_Renderer ptr, byval wait_stage_mask as Uint32, byval wait_semaphore as Sint64, byval signal_semaphore as Sint64) as boolean
declare function SDL_SetRenderVSync(byval renderer as SDL_Renderer ptr, byval vsync as long) as boolean

const SDL_RENDERER_VSYNC_DISABLED = 0
const SDL_RENDERER_VSYNC_ADAPTIVE = -1

declare function SDL_GetRenderVSync(byval renderer as SDL_Renderer ptr, byval vsync as long ptr) as boolean

const SDL_DEBUG_TEXT_FONT_CHARACTER_SIZE = 8

declare function SDL_RenderDebugText(byval renderer as SDL_Renderer ptr, byval x as single, byval y as single, byval str as const zstring ptr) as boolean
declare function SDL_RenderDebugTextFormat(byval renderer as SDL_Renderer ptr, byval x as single, byval y as single, byval fmt as const zstring ptr, ...) as boolean

end extern
