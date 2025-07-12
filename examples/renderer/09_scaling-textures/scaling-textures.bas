'' This example creates an SDL window and renderer, and then draws some
'' textures to it every frame.
''
'' This code is public domain. Feel free to use it for any purpose!

#include "SDL3/SDL.bi"
 
Sub Main()
    If Not SDL_Init(SDL_INIT_VIDEO) Then
        SDL_Log("Couldn't initialize SDL: %s", SDL_GetError())
        Exit Sub
    End If
    
    '' We will use this renderer to draw into this window every frame.
    Dim As SDL_Window Ptr win
    Dim As SDL_Renderer Ptr renderer
    
    Const As Long WINDOW_WIDTH = 640
    Const As Long WINDOW_HEIGHT = 480
  
    If Not SDL_CreateWindowAndRenderer("Example Renderer Scaling Textures", WINDOW_WIDTH, WINDOW_HEIGHT, 0, @win, @renderer) Then
        SDL_Log("Couldn't create window/renderer: %s", SDL_GetError())
        SDL_Quit()
        Exit Sub
    End If
    
    Dim As SDL_Texture Ptr texture
    Dim As SDL_Surface Ptr surface
    Dim As SDL_FPoint center
    Dim As SDL_FRect dstRect
    
    Dim As Boolean quit
    Dim As SDL_Event e
    
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

    While Not quit
        While SDL_PollEvent(@e)
            If e.type = SDL_EVENT_QUIT Then
                quit = True
            End If
        Wend
        
        Dim As Uint64 now = SDL_GetTicks()
        
        '' we'll have the texture grow and shrink over a few seconds.
        Dim As Single direction = IIf((now Mod 2000) >= 1000, 1.0, -1.0)
        Dim As Single scale = CSng((CLng(now Mod 1000) - 500) / 500.0) * direction
        
        '' as you can see from this, rendering draws over whatever was drawn before it.
        SDL_SetRenderDrawColor(renderer, 0, 0, 0, SDL_ALPHA_OPAQUE) '' black, full alpha
        SDL_RenderClear(renderer)   '' start with a blank canvas.

        '' center this one and make it grow and shrink.
        dstRect.x = CSng(WINDOW_WIDTH - dstRect.w) / 2.0
        dstRect.y = CSng(WINDOW_HEIGHT - dstRect.h) / 2.0
        dstRect.w = CSng(texture->w) + CSng(texture->w) * scale
        dstRect.h = CSng(texture->h) + CSng(texture->h) * scale
        SDL_RenderTexture(renderer, texture, 0, @dstRect)

        SDL_RenderPresent(renderer) '' put it all on the screen!
    Wend
    
    SDL_DestroyTexture(texture)
    SDL_DestroyRenderer(renderer)
    SDL_DestroyWindow(win)
    SDL_Quit()
End Sub

Main()