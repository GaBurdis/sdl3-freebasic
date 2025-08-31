'' This example creates an SDL window and renderer, and then draws some text
'' using SDL_RenderDebugText() every frame.
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

If Not SDL_Init(SDL_INIT_VIDEO) Then
    SDL_Log("Couldn't initialize SDL: %s", SDL_GetError())
    quit = True
ElseIf Not SDL_CreateWindowAndRenderer("Example Renderer Debug Texture", WINDOW_WIDTH, WINDOW_HEIGHT, 0, @win, @renderer) Then
    SDL_Log("Couldn't create window/renderer: %s", SDL_GetError())
    quit = True
End If

While Not quit
    While SDL_PollEvent(@e)
        If e.type = SDL_EVENT_QUIT Then
            quit = True
        End If
    Wend

    Dim As Long charsize = SDL_DEBUG_TEXT_FONT_CHARACTER_SIZE

    '' as you can see from this, rendering draws over whatever was drawn before it.
    SDL_SetRenderDrawColor(renderer, 0, 0, 0, SDL_ALPHA_OPAQUE) '' black, full alpha
    SDL_RenderClear(renderer)   '' start with a blank canvas.

    SDL_SetRenderDrawColor(renderer, 255, 255, 255, SDL_ALPHA_OPAQUE)  '' white, full alpha
    SDL_RenderDebugText(renderer, 272, 100, "Hello world!")
    SDL_RenderDebugText(renderer, 224, 150, "This is some debug text.")

    SDL_SetRenderDrawColor(renderer, 51, 102, 255, SDL_ALPHA_OPAQUE)  '' light blue, full alpha
    SDL_RenderDebugText(renderer, 184, 200, "You can do it in different colors.")
    SDL_SetRenderDrawColor(renderer, 255, 255, 255, SDL_ALPHA_OPAQUE)  '' white, full alpha

    SDL_SetRenderScale(renderer, 4.0, 4.0)
    SDL_RenderDebugText(renderer, 14, 65, "It can be scaled.")
    SDL_SetRenderScale(renderer, 1.0, 1.0)
    SDL_RenderDebugText(renderer, 64, 350, "This only does ASCII chars. So this laughing emoji won't draw: 🤣")

    SDL_RenderDebugTextFormat(renderer, CSng((WINDOW_WIDTH - (charsize * 46)) / 2), 400, "(This program has been running for %d seconds.)", CULngInt(SDL_GetTicks() / 1000) )

    SDL_RenderPresent(renderer) '' put it all on the screen!
Wend

SDL_DestroyRenderer(renderer)
SDL_DestroyWindow(win)
SDL_Quit()
