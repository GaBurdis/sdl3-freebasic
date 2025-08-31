'' This example creates an SDL window and renderer, and then draws some
'' textures to it every frame, adjusting their color.
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

If Not SDL_Init(SDL_INIT_VIDEO) Then
    SDL_Log("Couldn't initialize SDL: %s", SDL_GetError())
    quit = True
ElseIf Not SDL_CreateWindowAndRenderer("Example Renderer Color Mods", WINDOW_WIDTH, WINDOW_HEIGHT, 0, @win, @renderer) Then
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
        SDL_Log("Couldn't initialize SDL: %s", SDL_GetError())
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

    Dim As double now = Cdbl(SDL_GetTicks()) / 1000.0   '' convert from milliseconds to seconds.
    '' choose the modulation values for the center texture. The sine wave trick makes it fade between colors smoothly.
    Dim As Single red   = CSng(0.5 + 0.5 * SDL_sin(now))
    Dim As Single green = CSng(0.5 + 0.5 * SDL_sin(now + SDL_PI_D * 2 / 3))
    Dim As Single blue  = CSng(0.5 + 0.5 * SDL_sin(now + SDL_PI_D * 4 / 3))

    '' as you can see from this, rendering draws over whatever was drawn before it.
    SDL_SetRenderDrawColor(renderer, 0, 0, 0, SDL_ALPHA_OPAQUE) '' black, full alpha
    SDL_RenderClear(renderer)   '' start with a blank canvas.

    '' Just draw the static texture a few times. You can think of it like a
    '' stamp, there isn't a limit to the number of times you can draw with it.

    '' Color modulation multiplies each pixel's red, green, and blue intensities by the mod values,
    '' so multiplying by 1.0f will leave a color intensity alone, 0.0f will shut off that color
    '' completely, etc.

    '' top left; let's make this one blue!
    dstRect.x = 0
    dstRect.y = 0
    dstRect.w = CSng(texture->w)
    dstRect.h = CSng(texture->h)
    SDL_SetTextureColorModFloat(texture, 0.0, 0.0, 1.0) '' kill all red and green.
    SDL_RenderTexture(renderer, texture, null, @dstRect)

    '' center this one, and have it cycle through red/green/blue modulations.
    dstRect.x = CSng(WINDOW_WIDTH - texture->w) / 2.0
    dstRect.y = CSng(WINDOW_HEIGHT - texture->h) / 2.0
    SDL_SetTextureColorModFloat(texture, red, green, blue)
    SDL_RenderTexture(renderer, texture, null, @dstRect)

    '' bottom right; let's make this one red!
    dstRect.x = CSng(WINDOW_WIDTH - texture->w)
    dstRect.y = CSng(WINDOW_HEIGHT - texture->h)
    SDL_SetTextureColorModFloat(texture, 1.0, 0.0, 0.0) '' kill all green and blue.
    SDL_RenderTexture(renderer, texture, null, @dstRect)

    SDL_RenderPresent(renderer) '' put it all on the screen!
Wend

SDL_DestroyTexture(texture)
SDL_DestroyRenderer(renderer)
SDL_DestroyWindow(win)
SDL_Quit()
