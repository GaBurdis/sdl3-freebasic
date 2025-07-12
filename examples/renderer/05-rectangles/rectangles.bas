'' This example creates an SDL window and renderer, and then draws some
'' rectangles to it every frame.
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
  
    If Not SDL_CreateWindowAndRenderer("Example Renderer Rectangles", WINDOW_WIDTH, WINDOW_HEIGHT, 0, @win, @renderer) Then
        SDL_Log("Couldn't create window/renderer: %s", SDL_GetError())
        SDL_Quit()
        Exit Sub
    End If
    
    Dim As SDL_FRect rects(16)

    Dim As SDL_Event e
    Dim As Boolean quit

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
        
        '' as you can see from this, rendering draws over whatever was drawn before it.
        SDL_SetRenderDrawColor(renderer, 0, 0, 0, SDL_ALPHA_OPAQUE) '' black, full alpha
        SDL_RenderClear(renderer)   '' start with a blank canvas.
        
        '' Rectangles are comprised of set of X and Y coordinates, plus width and
        '' height. (0, 0) is the top left of the window, and larger numbers go
        '' down and to the right. This isn't how geometry works, but this is
        '' pretty standard in 2D graphics.
        
        '' Let's draw a single rectangle (square, really).
        rects(0).x = 100
        rects(0).y = 100
        rects(0).w = 100 + (100 * scale)
        rects(0).h = 100 + (100 * scale)
        SDL_SetRenderDrawColor(renderer, 255, 0, 0, SDL_ALPHA_OPAQUE)   '' red, full alpha
        SDL_RenderRect(renderer, @rects(0))
        
        '' Now let's draw several rectangles with one function call.
        For i As Long = 0 To 3
            Dim As Single size = (i + 1) * 50.0
            rects(i).w = size + (size * scale)
            rects(i).h = rects(i).w
            rects(i).x = (WINDOW_WIDTH - rects(i).w) / 2    '' center it.
            rects(i).y = (WINDOW_HEIGHT - rects(i).h) / 2   '' center it.
        Next i
        
        SDL_SetRenderDrawColor(renderer, 0, 255, 0, SDL_ALPHA_OPAQUE)   '' green, full alpha
        SDL_RenderRects(renderer, @rects(0), 3) '' draw three rectangles at once
        
        '' those were rectangle _outlines_, really. You can also draw _filled_ rectangles!
        rects(0).x = 400
        rects(0).y = 50
        rects(0).w = 100 + (100 * scale)
        rects(0).h = 50 + (50 * scale)
        SDL_SetRenderDrawColor(renderer, 0, 0, 255, SDL_ALPHA_OPAQUE)   '' blue, full alpha
        SDL_RenderFillRect(renderer, @rects(0))
        
        '' ...and also fill a bunch of rectangles at once...
        For i As Long = 0 To UBound(rects)
            Dim As Single w = CSng(WINDOW_WIDTH / UBound(rects))
            Dim As Single h = i * 8.0
            rects(i).x = i * w
            rects(i).y = WINDOW_HEIGHT - h
            rects(i).w = w
            rects(i).h = h
        Next i
        
        SDL_SetRenderDrawColor(renderer, 255, 255, 255, SDL_ALPHA_OPAQUE)   '' white, full alpha
        SDL_RenderFillRects(renderer, @rects(0), UBound(rects))

        SDL_RenderPresent(renderer) '' put it all on the screen!
    Wend
          
    SDL_DestroyRenderer(renderer)
    SDL_DestroyWindow(win)
    SDL_Quit()
End Sub

Main()