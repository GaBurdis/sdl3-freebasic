'' This example creates an SDL window and renderer, and then draws some
'' textures to it every frame, adjusting the viewport.
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
Dim As SDL_FRect dstRect
Dim As SDL_Rect viewport

If Not SDL_Init(SDL_INIT_VIDEO) Then
    SDL_Log("Couldn't initialize SDL: %s", SDL_GetError())
    quit = True
ElseIf Not SDL_CreateWindowAndRenderer("Example Renderer Viewport", WINDOW_WIDTH, WINDOW_HEIGHT, 0, @win, @renderer) Then
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

    dstRect = type(0, 0, CSng(texture->w), CSng(texture->h))
End If

While Not quit
    While SDL_PollEvent(@e)
        If e.type = SDL_EVENT_QUIT Then
            quit = True
        End If
    Wend

    '' Setting a viewport has the effect of limiting the area that rendering
    '' can happen, and making coordinate (0, 0) live somewhere else in the
    '' window. It does _not_ scale rendering to fit the viewport.

    '' as you can see from this, rendering draws over whatever was drawn before it.
    SDL_SetRenderDrawColor(renderer, 0, 0, 0, SDL_ALPHA_OPAQUE) '' black, full alpha
    SDL_RenderClear(renderer)   '' start with a blank canvas.

    '' Draw once with the whole window as the viewport.
    viewport.x = 0
    viewport.y = 0
    viewport.w = WINDOW_WIDTH / 2
    viewport.h = WINDOW_HEIGHT / 2
    SDL_SetRenderViewport(renderer, null)   '' NULL means "use the whole window"
    dstRect.y = 0
    SDL_RenderTexture(renderer, texture, null, @dstRect)

    '' top right quarter of the window.
    viewport.x = WINDOW_WIDTH / 2
    viewport.y = WINDOW_HEIGHT / 2
    SDL_SetRenderViewport(renderer, @viewport)
    SDL_RenderTexture(renderer, texture, null, @dstRect)

    '' bottom 20% of the window. Note it clips the width!
    viewport.x = 0
    viewport.y = WINDOW_HEIGHT - (WINDOW_HEIGHT / 5)
    viewport.w = WINDOW_WIDTH / 5
    viewport.h = WINDOW_HEIGHT / 5
    SDL_SetRenderViewport(renderer, @viewport)
    SDL_RenderTexture(renderer, texture, null, @dstRect)

    '' what happens if you try to draw above the viewport? It should clip!
    viewport.x = 100
    viewport.y = 200
    viewport.w = WINDOW_WIDTH
    viewport.h = WINDOW_HEIGHT
    SDL_SetRenderViewport(renderer, @viewport)
    dstRect.y = -50
    SDL_RenderTexture(renderer, texture, null, @dstRect)

    SDL_RenderPresent(renderer) '' put it all on the screen!
Wend

SDL_DestroyTexture(texture)
SDL_DestroyRenderer(renderer)
SDL_DestroyWindow(win)
SDL_Quit()
