'' This example code creates an SDL window and renderer, and then clears the
'' window to a different color every frame, so you'll effectively get a window
'' that's smoothly fading between colors.
''
'' This code is public domain. Feel free to use it for any purpose!

#include "SDL3/SDL.bi"

'' We will use this renderer to draw into this window every frame.
Dim As SDL_Window Ptr win
Dim As SDL_Renderer Ptr renderer
Dim As SDL_Event e
Dim As Boolean quit

If Not SDL_Init(SDL_INIT_VIDEO) Then
    SDL_Log("Couldn't initialize SDL: %s", SDL_GetError())
    quit = True
ElseIf Not SDL_CreateWindowAndRenderer("Example Renderer Clear", 640, 480, SDL_WINDOW_RESIZABLE, @win, @renderer) Then
    SDL_Log("Couldn't create window/renderer: %s", SDL_GetError())
    quit = True
End If

While Not quit
    While SDL_PollEvent(@e)
        If e.type = SDL_EVENT_QUIT Then
            quit = True
        End If
    Wend

    Dim As Double now = CDbl(SDL_GetTicks()) / 1000.0 '' convert from milliseconds to seconds.
    '' choose the color for the frame we will draw. The sine wave trick makes it fade between colors smoothly.
    Dim As Single red   = CSng(0.5 + 0.5 * SDL_sin(now))
    Dim As Single green = CSng(0.5 + 0.5 * SDL_sin(now + SDL_PI_D * 2 / 3))
    Dim As Single blue  = CSng(0.5 + 0.5 * SDL_sin(now + SDL_PI_D * 4 / 3))
    SDL_SetRenderDrawColorFloat(renderer, red, green, blue, SDL_ALPHA_OPAQUE_FLOAT) '' new color, full alpha.
    
    '' clear the window to the draw color.
    SDL_RenderClear(renderer)
    
    '' put the newly-cleared rendering on the screen.
    SDL_RenderPresent(renderer)
Wend

SDL_DestroyRenderer(renderer)
SDL_DestroyWindow(win)
SDL_Quit()
