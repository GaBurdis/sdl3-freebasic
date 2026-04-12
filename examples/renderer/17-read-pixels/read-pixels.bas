'' This example creates an SDL window and renderer, and draws a
'' rotating texture to it, reads back the rendered pixels, converts them to
'' black and white, and then draws the converted image to a corner of the
'' screen.
''
'' This isn't necessarily an efficient thing to do--in real life one might
'' want to do this sort of thing with a render target--but it's just a visual
'' example of how to use SDL_RenderReadPixels().
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
Dim As SDL_Surface Ptr surface
Dim As SDL_Texture Ptr convertedTexture
Dim As SDL_FPoint center
Dim As SDL_FRect dstRect
Dim As Long convertedTextureWidth
Dim As Long convertedTextureHeight

If Not SDL_Init(SDL_INIT_VIDEO) Then
    SDL_Log("Couldn't initialize SDL: %s", SDL_GetError())
    quit = True
ElseIf Not SDL_CreateWindowAndRenderer("Example Renderer Read Pixels", WINDOW_WIDTH, WINDOW_HEIGHT, SDL_WINDOW_RESIZABLE, @win, @renderer) Then
    SDL_Log("Couldn't create window/renderer: %s", SDL_GetError())
    quit = True
Else
    '' Textures are pixel data that we upload to the video hardware for fast drawing. Lots of 2D
    '' engines refer to these as "sprites." We'll do a static texture (upload once, draw many
    '' times) with data from a bitmap file.

    '' SDL_Surface is pixel data the CPU can access. SDL_Texture is pixel data the GPU can access.
    '' Load a .png into a surface, move it to a texture from there.
    surface = SDL_LoadPNG("../../Data/sample.png")
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

    '' we'll have a texture rotate around over 2 seconds (2000 milliseconds). 360 degrees in a circle!
    Dim As Single rotation = (CSng(CLng(now Mod 2000)) / 2000.0f) * 360.0f

    '' as you can see from this, rendering draws over whatever was drawn before it.
    SDL_SetRenderDrawColor(renderer, 0, 0, 0, SDL_ALPHA_OPAQUE) '' black, full alpha
    SDL_RenderClear(renderer)   '' start with a blank canvas.

    '' Center this one, and draw it with some rotation so it spins!
    dstRect.x = CSng(WINDOW_WIDTH - texture->w) / 2.0f
    dstRect.y = CSng(WINDOW_HEIGHT - texture->h) / 2.0f
    dstRect.w = CSng(texture->w)
    dstRect.h = CSng(texture->h)
    '' rotate it around the center of the texture; you can rotate it from a different point, too!
    center.x = texture->w / 2.0f
    center.y = texture->h / 2.0f
    SDL_RenderTextureRotated(renderer, texture, 0, @dstRect, rotation, @center, SDL_FLIP_NONE)

    '' this next whole thing is _super_ expensive. Seriously, don't do this in real life.

    '' Download the pixels of what has just been rendered. This has to wait for the GPU to finish rendering it
    '' and everything before it, and then make an expensive copy from the GPU to system RAM!
    surface = SDL_RenderReadPixels(renderer, 0)

    '' This is also expensive, but easier: convert the pixels to a format we want.
    If (surface <> 0 And (surface->format <> SDL_PIXELFORMAT_RGBA8888) And (surface->format <> SDL_PIXELFORMAT_BGRA8888)) then
        Dim As SDL_Surface Ptr converted = SDL_ConvertSurface(surface, SDL_PIXELFORMAT_RGBA8888)
        SDL_DestroySurface(surface)
        surface = converted
    End If

    If surface <> 0 Then
        '' Rebuild converted_texture if the dimensions have changed (window resized, etc).
        If ((surface->w <> convertedTextureWidth) Or (surface->h <> convertedTextureHeight)) Then
            SDL_DestroyTexture(convertedTexture)
            convertedTexture = SDL_CreateTexture(renderer, SDL_PIXELFORMAT_RGBA8888, SDL_TEXTUREACCESS_STREAMING, surface->w, surface->h)
            If convertedTexture = 0 Then
                SDL_Log("Couldn't (re)create conversion texture: %s", SDL_GetError())
                quit = True
            End If
            convertedTextureWidth = surface->w
            convertedTextureHeight = surface->h
        End If

        '' Turn each pixel into either black or white. This is a lousy technique but it works here.
        '' In real life, something like Floyd-Steinberg dithering might work
        '' better: https://en.wikipedia.org/wiki/Floyd%E2%80%93Steinberg_dithering
        For y As Long = 0 To surface->h
            Dim As Uint32 Ptr pixels = Cast(Uint32 Ptr, (Cast(Uint8 Ptr, surface->pixels) + (y * surface->pitch)))
            For x As Long = 0 To surface->w
                Dim As uint8 Ptr p = Cast(Uint8 Ptr, @pixels[x])
                Dim As Uint32 average = (Cast(Uint32, p[1]) + (Cast(Uint32, p[2]) + Cast(Uint32, p[3]))) / 3
                If average = 0 Then
                    p[0] = &hFF
                    p[1] = 0
                    p[2] = 0
                    p[3] = &hFF
                Else
                    Dim As Uint8 tmp = IIf(average > 50, &hFF, &h00)
                    p[1] = tmp
                    p[2] = tmp
                    p[3] = tmp
                End If
            Next x
        Next y

        '' upload the processed pixels back into a texture.
        SDL_UpdateTexture(convertedTexture, 0, surface->pixels, surface->pitch)
        SDL_DestroySurface(surface)

        '' draw the texture to the top-left of the screen.
        dstRect.x = 0.0f
        dstRect.y = 0.0f
        dstRect.w = CSng(WINDOW_WIDTH) / 4.0f
        dstRect.h = CSng(WINDOW_HEIGHT) / 4.0f
        SDL_RenderTexture(renderer, convertedTexture, 0, @dstRect)
    End If

    SDL_RenderPresent(renderer) '' put it all on the screen!
Wend

SDL_DestroySurface(surface)
SDL_DestroyTexture(convertedTexture)
SDL_DestroyTexture(texture)
SDL_DestroyRenderer(renderer)
SDL_DestroyWindow(win)
SDL_Quit()
