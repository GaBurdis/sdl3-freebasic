'' This example creates an SDL window and renderer, and then draws a streaming
'' texture to it every frame.
''
'' This code is public domain. Feel free to use it for any purpose!

#include "SDL3/SDL.bi"

Const As Long WINDOW_WIDTH = 640
Const As Long WINDOW_HEIGHT = 480
Const As Long TEXTURE_SIZE = 150

'' We will use this renderer to draw into this window every frame.
Dim As SDL_Window Ptr win
Dim As SDL_Renderer Ptr renderer
Dim As Boolean quit
Dim As SDL_Event e

Dim As SDL_Texture Ptr texture
Dim As SDL_Surface Ptr surface
Dim As SDL_FRect dstRect

If Not SDL_Init(SDL_INIT_VIDEO) Then
    SDL_Log("Couldn't initialize SDL: %s", SDL_GetError())
    quit = True
ElseIf Not SDL_CreateWindowAndRenderer("Example Renderer Streaming Textures", WINDOW_WIDTH, WINDOW_HEIGHT, 0, @win, @renderer) Then
    SDL_Log("Couldn't create window/renderer: %s", SDL_GetError())
    quit = True
Else
    texture = SDL_CreateTexture(renderer, SDL_PIXELFORMAT_RGBA8888, SDL_TEXTUREACCESS_STREAMING, TEXTURE_SIZE, TEXTURE_SIZE)
    If texture = Null Then
        SDL_Log("Couldn't create streaming texture: %s", SDL_GetError())
        quit = True
    End If
End If

While Not quit
    While SDL_PollEvent(@e)
        If e.type = SDL_EVENT_QUIT Then
            quit = True
        End If
    Wend

    Dim As Uint64 now = SDL_GetTicks()

    '' we'll have the rectangles grow and shrink over a few seconds.
    Dim As Single direction = IIf((now Mod 2000) >= 1000, 1.0, -1.0)
    Dim As Single scale = CSng((CLng(now Mod 1000) - 500) / 500.0) * direction

    '' To update a streaming texture, you need to lock it first. This gets you access to the pixels.
    '' Note that this is considered a _write-only_ operation: the buffer you get from locking
    '' might not acutally have the existing contents of the texture, and you have to write to every
    '' locked pixel!

    '' You can use SDL_LockTexture() to get an array of raw pixels, but we're going to use
    '' SDL_LockTextureToSurface() here, because it wraps that array in a temporary SDL_Surface,
    '' letting us use the surface drawing functions instead of lighting up individual pixels.
    If SDL_LockTextureToSurface(texture, 0, @surface) Then
        Dim As SDL_Rect r
        SDL_FillSurfaceRect(surface, 0, SDL_MapRGB(SDL_GetPixelFormatDetails(surface->format), 0, 0, 0, 0)) '' make the whole surface black
        r.w = TEXTURE_SIZE
        r.h = TEXTURE_SIZE / 10
        r.x = 0
        r.y = CLng(CSng(TEXTURE_SIZE - r.h) * ((scale + 1.0) / 2.0))
        SDL_FillSurfaceRect(surface, @r, SDL_MapRGB(SDL_GetPixelFormatDetails(surface->format), 0, 0, 255, 0))  '' make a strip of the surface green
        SDL_UnlockTexture(texture)  ' upload the changes (and frees the temporary surface)!
    End If

    '' as you can see from this, rendering draws over whatever was drawn before it.
    SDL_SetRenderDrawColor(renderer, 66, 66, 66, SDL_ALPHA_OPAQUE) '' grey, full alpha
    SDL_RenderClear(renderer)   '' start with a blank canvas.

    '' Just draw the static texture a few times. You can think of it like a
    '' stamp, there isn't a limit to the number of times you can draw with it.

    '' Center this one. It'll draw the latest version of the texture we drew while it was locked.
    dstRect.x = CSng(WINDOW_WIDTH  - TEXTURE_SIZE) / 2
    dstRect.y = CSng(WINDOW_HEIGHT - TEXTURE_SIZE) / 2
    dstRect.w = CSng(TEXTURE_SIZE)
    dstRect.h = dstRect.w
    SDL_RenderTexture(renderer, texture, 0, @dstRect)

    SDL_RenderPresent(renderer) '' put it all on the screen!
Wend

SDL_DestroySurface(surface)
SDL_DestroyTexture(texture)
SDL_DestroyRenderer(renderer)
SDL_DestroyWindow(win)
SDL_Quit()
