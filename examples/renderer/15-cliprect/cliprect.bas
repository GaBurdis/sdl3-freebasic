'' This example creates an SDL window and renderer, and then draws a scene
'' to it every frame, while sliding around a clipping rectangle.
''
'' This code is public domain. Feel free to use it for any purpose!

#include "SDL3/SDL.bi"

Const As Long WINDOW_WIDTH = 640
Const As Long WINDOW_HEIGHT = 480
Const As Long CLIPRECT_SIZE = 250
Const As Long CLIPRECT_SPEED = 200  '' pixels per second

'' We will use this renderer to draw into this window every frame.
Dim As SDL_Window Ptr win
Dim As SDL_Renderer Ptr renderer
Dim As Boolean quit
Dim As SDL_Event e

Dim As SDL_Texture Ptr texture
Dim As SDL_FPoint cliprectPosition
Dim As SDL_FPoint cliprectDirection
Dim As SDL_Rect cliprect
Dim As Uint64 lastTime

If Not SDL_Init(SDL_INIT_VIDEO) Then
    SDL_Log("Couldn't initialize SDL: %s", SDL_GetError())
    quit = True
ElseIf Not SDL_CreateWindowAndRenderer("Example Renderer Clipping Rectangle", WINDOW_WIDTH, WINDOW_HEIGHT, 0, @win, @renderer) Then
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

    cliprectDirection.x = 1.0
    cliprectDirection.y = 1.0

    cliprect.w = CLIPRECT_SIZE
    cliprect.h = CLIPRECT_SIZE

    lastTime = SDL_GetTicks()
End If

While Not quit
    While SDL_PollEvent(@e)
        If e.type = SDL_EVENT_QUIT Then
            quit = True
        End If
    Wend

    cliprect.x = CLng(SDL_roundf(cliprectPosition.x))
    cliprect.y = CLng(SDL_roundf(cliprectPosition.y))

    Dim As Uint64 now = SDL_GetTicks()
    Dim As Single elapsed = CSng(now - lastTime) / 1000.0   '' seconds since last iteration
    Dim As Single distance = elapsed * CLIPRECT_SPEED

    '' Set a new clipping rectangle position
    cliprectPosition.x += distance * cliprectDirection.x
    If cliprectPosition.x < 0.0 Then
        cliprectPosition.x = 0.0
        cliprectDirection.x = 1.0
    ElseIf cliprectPosition.x >= (WINDOW_WIDTH - CLIPRECT_SIZE) Then
        cliprectPosition.x = (WINDOW_WIDTH - CLIPRECT_SIZE) - 1
        cliprectDirection.x = -1.0
    End If

    cliprectPosition.y += distance * cliprectDirection.y
    If cliprectPosition.y < 0.0 Then
        cliprectPosition.y = 0.0
        cliprectDirection.y = 1.0
    ElseIf cliprectPosition.y >= (WINDOW_HEIGHT - CLIPRECT_SIZE) Then
        cliprectPosition.y = (WINDOW_HEIGHT - CLIPRECT_SIZE) - 1
        cliprectDirection.y = -1.0
    End If
    SDL_SetRenderClipRect(renderer, @cliprect)

    lastTime = now

    '' okay, now draw!

    '' Note that SDL_RenderClear is _not_ affected by the clipping rectangle!
    SDL_SetRenderDrawColor(renderer, 33, 33, 33, SDL_ALPHA_OPAQUE) '' grey, full alpha
    SDL_RenderClear(renderer)   '' start with a blank canvas.

    '' stretch the texture across the entire window. Only the piece in the
    '' clipping rectangle will actually render, though!
    SDL_RenderTexture(renderer, texture, Null, Null)

    SDL_RenderPresent(renderer) '' put it all on the screen!
Wend

SDL_DestroyTexture(texture)
SDL_DestroyRenderer(renderer)
SDL_DestroyWindow(win)
SDL_Quit()
