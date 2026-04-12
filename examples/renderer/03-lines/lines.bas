'' This example creates an SDL window and renderer, and then draws some lines
'' to it every frame.
''
'' This code is public domain. Feel free to use it for any purpose!

#include "SDL3/SDL.bi"

'' We will use this renderer to draw into this window every frame.
Dim As SDL_Window Ptr win
Dim As SDL_Renderer Ptr renderer
Dim As SDL_Event e
Dim As Boolean quit

'' Lines (line segments, really) are drawn in terms of points: a set of
'' X and Y coordinates, one set for each end of the line.
'' (0, 0) is the top left of the window, and larger numbers go down
'' and to the right. This isn't how geometry works, but this is pretty
'' standard in 2D graphics.
Dim As SDL_FPoint linePoints(9) = { _
    Type(100, 354), Type(220, 230), Type(140, 230), Type(320, 100), Type(500, 230), _
    Type(420, 230), Type(540, 354), Type(400, 354), Type(100, 354)}

Dim As Single size = 30.0f
Dim As Single x = 320.0f
Dim As Single y =  95.0f - (size / 2.0f)

If Not SDL_Init(SDL_INIT_VIDEO) Then
    SDL_Log("Couldn't initialize SDL: %s", SDL_GetError())
    quit = True
ElseIf Not SDL_CreateWindowAndRenderer("Example Renderer Lines", 640, 480, SDL_WINDOW_RESIZABLE, @win, @renderer) Then
    SDL_Log("Couldn't create window/renderer: %s", SDL_GetError())
    quit = True
End If

While Not quit
    While SDL_PollEvent(@e)
        If e.type = SDL_EVENT_QUIT Then
            quit = True
        End If
    Wend

    '' as you can see from this, rendering draws over whatever was drawn before it.
    SDL_SetRenderDrawColor(renderer, 100, 100, 100, SDL_ALPHA_OPAQUE) '' grey, full alpha
    SDL_RenderClear(renderer)   '' start with a blank canvas.

    '' You can draw lines, one at a time, like these brown ones...
    SDL_SetRenderDrawColor(renderer, 127, 49, 32, SDL_ALPHA_OPAQUE)
    SDL_RenderLine(renderer, 240, 450, 400, 450)
    SDL_RenderLine(renderer, 240, 356, 400, 356)
    SDL_RenderLine(renderer, 240, 356, 240, 450)
    SDL_RenderLine(renderer, 400, 356, 400, 450)

    '' You can also draw a series of connected lines in a single batch...
    SDL_SetRenderDrawColor(renderer, 0, 255, 0, SDL_ALPHA_OPAQUE)
    SDL_RenderLines(renderer, @linePoints(0), UBound(linePoints))

    '' here's a bunch of lines drawn out from a center point in a circle.
    '' we randomize the color of each line, so it functions as animation.
    For i As Long = 0 To 360
        Dim As Single r = CSng(i * (SDL_PI_F / 180.0f))
        SDL_SetRenderDrawColor(renderer, SDL_rand(256), SDL_rand(256), SDL_rand(256), SDL_ALPHA_OPAQUE)
        SDL_RenderLine(renderer, x, y, x + SDL_cosf(r) * size, y + SDL_sinf(r) * size)
    Next i

    SDL_RenderPresent(renderer) '' put it all on the screen!
Wend

SDL_DestroyRenderer(renderer)
SDL_DestroyWindow(win)
SDL_Quit()
