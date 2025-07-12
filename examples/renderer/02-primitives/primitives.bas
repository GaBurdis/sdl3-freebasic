' This example creates an SDL window and renderer, and then draws some lines,
' rectangles and points to it every frame.
'
' This code is public domain. Feel free to use it for any purpose!

#include "SDL3/SDL.bi"
 
Sub Main()
    If Not SDL_Init(SDL_INIT_VIDEO) Then
        SDL_Log("Couldn't initialize SDL: %s", SDL_GetError())
        Exit Sub
    End If
    
    ' We will use this renderer to draw into this window every frame.
    Dim As SDL_Window Ptr win
    Dim As SDL_Renderer Ptr renderer
  
    If Not SDL_CreateWindowAndRenderer("Example Renderer Primitives", 640, 480, 0, @win, @renderer) Then
        SDL_Log("Couldn't create window/renderer: %s", SDL_GetError())
        SDL_Quit()
        Exit Sub
    End If
    
    Dim As SDL_FPoint points(500)
    Dim As SDL_FRect rect
    
    ' set up some random points
    For i As Long = LBound(points) To UBound(points)
        points(i).x = SDL_randf() * 440.0 + 100.0
        points(i).y = SDL_randf() * 280.0 + 100.0
    Next i
    
    Dim As SDL_Event e
    Dim As Boolean quit

    While Not quit
        While SDL_PollEvent(@e)
            If e.type = SDL_EVENT_QUIT Then
                quit = True
            End If
        Wend
        
        ' as you can see from this, rendering draws over whatever was drawn before it.
        SDL_SetRenderDrawColor(renderer, 33, 33, 33, SDL_ALPHA_OPAQUE) ' dark gray, full alpha
        SDL_RenderClear(renderer)   ' start with a blank canvas.
        
        ' draw a filled rectangle in the middle of the canvas.
        SDL_SetRenderDrawColor(renderer, 0, 0, 255, SDL_ALPHA_OPAQUE)  ' blue, full alpha
        rect.x = 100
        rect.y = 100
        rect.w = 440
        rect.h = 280
        SDL_RenderFillRect(renderer, @rect)
        
        ' draw some points across the canvas.
        SDL_SetRenderDrawColor(renderer, 255, 0, 0, SDL_ALPHA_OPAQUE)  ' red, full alpha
        SDL_RenderPoints(renderer, @points(0), UBound(points))
        
        ' draw a unfilled rectangle in-set a little bit.
        SDL_SetRenderDrawColor(renderer, 0, 255, 0, SDL_ALPHA_OPAQUE)   ' green, full alpha
        rect.x += 30
        rect.y += 30
        rect.w -= 60
        rect.h -= 60
        SDL_RenderRect(renderer, @rect)
        
        ' draw two lines in an X across the whole canvas.
        SDL_SetRenderDrawColor(renderer, 255, 255, 0, SDL_ALPHA_OPAQUE) ' yellow, full alpha
        SDL_RenderLine(renderer, 0, 0, 640, 480)
        SDL_RenderLine(renderer, 0, 480, 640, 0)

        SDL_RenderPresent(renderer) ' put it all on the screen!
    Wend
          
    SDL_DestroyRenderer(renderer)
    SDL_DestroyWindow(win)
    SDL_Quit()
End Sub

Main()