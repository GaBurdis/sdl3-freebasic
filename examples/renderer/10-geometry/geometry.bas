'' This example creates an SDL window and renderer, and then draws some
'' geometry (arbitrary polygons) to it every frame.
''
'' This code is public domain. Feel free to use it for any purpose!

#include "SDL3/SDL.bi"

Const As Long WINDOW_WIDTH = 640
Const As Long WINDOW_HEIGHT = 480

'' We will use this renderer to draw into this window every frame.
Dim As SDL_Window Ptr win
Dim As SDL_Renderer Ptr renderer
Dim As Boolean quit
Dim As SDL_Event e

Dim As SDL_Texture Ptr texture

If Not SDL_Init(SDL_INIT_VIDEO) Then
    SDL_Log("Couldn't initialize SDL: %s", SDL_GetError())
    quit = True
ElseIf Not SDL_CreateWindowAndRenderer("Example Renderer Geometry", WINDOW_WIDTH, WINDOW_HEIGHT, 0, @win, @renderer) Then
    SDL_Log("Couldn't create window/renderer: %s", SDL_GetError())
    quit = True
Else
    Dim As SDL_Surface Ptr surface

    '' Textures are pixel data that we upload to the video hardware for fast drawing. Lots of 2D
    '' engines refer to these as "sprites." We'll do a static texture (upload once, draw many
    '' times) with data from a bitmap file.

    '' SDL_Surface is pixel data the CPU can access. SDL_Texture is pixel data the GPU can access.
    '' Load a .bmp into a surface, move it to a texture from there.
    surface = SDL_LoadBMP("../../Data/sample.bmp")
    If surface = Null Then
        SDL_Log("Couldn't load bitmap: %s", SDL_GetError())
        quit = True
    End If

    texture = SDL_CreateTextureFromSurface(renderer, surface)
    If texture = Null Then
        SDL_Log("Couldn't create static texture: %s", SDL_GetError())
        quit = True
    End If

    SDL_DestroySurface(surface) '' done with this, the texture has a copy of the pixels now.
End If

While Not quit
    While SDL_PollEvent(@e)
        If e.type = SDL_EVENT_QUIT Then
            quit = True
        End If
    Wend

    Dim As Uint64 now = SDL_GetTicks()

    '' we'll have the texture grow and shrink over a few seconds.
    Dim As Single direction = IIf((now Mod 2000) >= 1000, 1.0, -1.0)
    Dim As Single scale = (CSng(CLng(now Mod 1000) - 500) / 500.0) * direction
    Dim As Single size = 200.0 + (200.0 * scale)

    Dim As SDL_Vertex vertices(4)

    '' as you can see from this, rendering draws over whatever was drawn before it.
    SDL_SetRenderDrawColor(renderer, 0, 0, 0, SDL_ALPHA_OPAQUE) '' black, full alpha
    SDL_RenderClear(renderer)   '' start with a blank canvas.

    '' Draw a single triangle with a different color at each vertex. Center this one and make it grow and shrink.
    '' You always draw triangles with this, but you can string triangles together to form polygons.
    vertices(0).position.x = CSng(WINDOW_WIDTH) / 2
    vertices(0).position.y = (CSng(WINDOW_HEIGHT) - size) / 2
    vertices(0).color.r = 1.0
    vertices(0).color.a = 1.0
    vertices(1).position.x = (CSng(WINDOW_WIDTH) + size) / 2
    vertices(1).position.y = (CSng(WINDOW_HEIGHT) + size) / 2
    vertices(1).color.g = 1.0
    vertices(1).color.a = 1.0
    vertices(2).position.x = (CSng(WINDOW_WIDTH) - size) / 2
    vertices(2).position.y = (CSng(WINDOW_HEIGHT) + size) / 2
    vertices(2).color.b = 1.0
    vertices(2).color.a = 1.0
    SDL_RenderGeometry(renderer, 0, @vertices(0), 3, 0, 0)

    '' you can also map a texture to the geometry! Texture coordinates go from 0.0f to 1.0f. That will be the location
    '' in the texture bound to this vertex.
    vertices(0).position.x = 10
    vertices(0).position.y = 10
    vertices(0).color.r = 1.0
    vertices(0).color.g = 1.0
    vertices(0).color.b = 1.0
    vertices(0).color.a = 1.0
    vertices(0).tex_coord.x = 0
    vertices(0).tex_coord.y = 0
    vertices(1).position.x = 150
    vertices(1).position.y = 10
    vertices(1).color.r = 1.0
    vertices(1).color.g = 1.0
    vertices(1).color.b = 1.0
    vertices(1).color.a = 1.0
    vertices(1).tex_coord.x = 1.0
    vertices(1).tex_coord.y = 0
    vertices(2).position.x = 10
    vertices(2).position.y = 150
    vertices(2).color.r = 1.0
    vertices(2).color.g = 1.0
    vertices(2).color.b = 1.0
    vertices(2).color.a = 1.0
    vertices(2).tex_coord.x = 0
    vertices(2).tex_coord.y = 1
    SDL_RenderGeometry(renderer, texture, @vertices(0), 3, 0, 0)

    '' Did that only draw half of the texture? You can do multiple triangles sharing some vertices,
    '' using indices, to get the whole thing on the screen:

    '' Let's just move this over so it doesn't overlap...
    For i As Long = 0 To 3
        vertices(i).position.x += 450
    Next i

    '' we need one more vertex, since the two triangles can share two of them.
    vertices(3).position.x = 600
    vertices(3).position.y = 150
    vertices(3).color.r = 1.0
    vertices(3).color.g = 1.0
    vertices(3).color.b = 1.0
    vertices(3).color.a = 1.0
    vertices(3).tex_coord.x = 1.0
    vertices(3).tex_coord.y = 1.0

    '' 4 vertices, but 6 actual places they used. Indices need less bandwidth to transfer and can reorder vertices easily!
    Dim As Long indices(6) = {0, 1, 2, 1, 2, 3}
    SDL_RenderGeometry(renderer, texture, @vertices(0), 4, @indices(0), UBound(indices))

    SDL_RenderPresent(renderer) '' put it all on the screen!
Wend

SDL_DestroyTexture(texture)
SDL_DestroyRenderer(renderer)
SDL_DestroyWindow(win)
SDL_Quit()
