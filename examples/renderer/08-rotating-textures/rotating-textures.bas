'' This example creates an SDL window and renderer, and then draws some
'' rotated textures to it every frame.
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
Dim As SDL_FPoint center
Dim As SDL_FRect dstRect

If Not SDL_Init(SDL_INIT_VIDEO) Then
    SDL_Log("Couldn't initialize SDL: %s", SDL_GetError())
    quit = True
ElseIf Not SDL_CreateWindowAndRenderer("Example Renderer Rotating Textures", WINDOW_WIDTH, WINDOW_HEIGHT, SDL_WINDOW_RESIZABLE, @win, @renderer) Then
    SDL_Log("Couldn't create window/renderer: %s", SDL_GetError())
    quit = True
Else
    Dim As SDL_Surface Ptr surface

    '' Textures are pixel data that we upload to the video hardware for fast drawing. Lots of 2D
    '' engines refer to these as "sprites." We'll do a static texture (upload once, draw many
    '' times) with data from a bitmap file.

    '' SDL_Surface is pixel data the CPU can access. SDL_Texture is pixel data the GPU can access.
    '' Load a .png into a surface, move it to a texture from there.
    surface = SDL_LoadPNG("../../Data/sample.png")
    If surface = 0 Then
        SDL_Log("Couldn't load bitmap: %s", SDL_GetError())
        quit = True
    End If

    texture = SDL_CreateTextureFromSurface(renderer, surface)
    If texture = 0 Then
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

    '' we'll have a texture rotate around over 2 seconds (2000 milliseconds). 360 degrees in a circle!
    Dim As Single rotation = (CSng(now Mod 2000) / 2000.0f) * 360.0f

    '' as you can see from this, rendering draws over whatever was drawn before it.
    SDL_SetRenderDrawColor(renderer, 0, 0, 0, SDL_ALPHA_OPAQUE) '' grey, full alpha
    SDL_RenderClear(renderer)   '' start with a blank canvas.

    '' Center this one, and draw it with some rotation so it spins!
    dstRect.x = CSng(WINDOW_WIDTH - texture->w) / 2.0f
    dstRect.y = CSng(WINDOW_HEIGHT - texture->h) / 2.0f
    dstRect.w = CSng(texture->w)
    dstRect.h = CSng(texture->h)
    '' rotate it around the center of the texture; you can rotate it from a different point, too!
    center.x = texture->w / 2
    center.y = texture->h / 2
    SDL_RenderTextureRotated(renderer, texture, 0, @dstRect, rotation, @center, SDL_FLIP_NONE)

    SDL_RenderPresent(renderer) '' put it all on the screen!
Wend

SDL_DestroyTexture(texture)
SDL_DestroyRenderer(renderer)
SDL_DestroyWindow(win)
SDL_Quit()
