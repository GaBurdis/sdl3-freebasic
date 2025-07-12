'' This example creates an SDL window and renderer, and then draws some points
'' to it every frame.
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
  
    If Not SDL_CreateWindowAndRenderer("Example Renderer Points", WINDOW_WIDTH, WINDOW_HEIGHT, 0, @win, @renderer) Then
        SDL_Log("Couldn't create window/renderer: %s", SDL_GetError())
        SDL_Quit()
        Exit Sub
    End If
    
    Dim As Uint64 lastTime
    Const As Long NUM_POINTS = 500
    Const As Long MIN_PIXELS_PER_SECOND = 30    '' move at least this many pixels per second.
    Const As Long MAX_PIXELS_PER_SECOND = 60    '' move this many pixels per second at most.
    
    '' (track everything as parallel arrays instead of a array of structs,
    '' so we can pass the coordinates to the renderer in a single function call.)
   
    '' Points are plotted as a set of X and Y coordinates.
    '' (0, 0) is the top left of the window, and larger numbers go down
    '' and to the right. This isn't how geometry works, but this is pretty
    '' standard in 2D graphics.
    Dim As SDL_FPoint points(NUM_POINTS)
    Dim As Single pointSpeeds(NUM_POINTS)
    
    For i As Long = 0 To UBound(points)
        points(i).x = SDL_randf() * CSng(WINDOW_WIDTH)
        points(i).y = SDL_randf() * CSng(WINDOW_HEIGHT)
        pointSpeeds(i) = MIN_PIXELS_PER_SECOND + (SDL_randf() * (MAX_PIXELS_PER_SECOND - MIN_PIXELS_PER_SECOND))
    Next i
    
    lastTime = SDL_GetTicks()

    Dim As SDL_Event e
    Dim As Boolean quit

    While Not quit
        While SDL_PollEvent(@e)
            If e.type = SDL_EVENT_QUIT Then
                quit = True
            End If
        Wend
        
        Dim As Uint64 now = SDL_GetTicks()
        Dim As Single elapsed = CSng(now - lastTime) / 1000.0   '' seconds since last iteration
        
        '' let's move all our points a little for a new frame.
        For i As Long = 0 To UBound(points)
            Dim As Single distance = elapsed * pointSpeeds(i)
            points(i).x += distance
            points(i).y += distance
            If (points(i).x >= WINDOW_WIDTH Or points(i).y >= WINDOW_HEIGHT) Then
                '' off the screen; restart it elsewhere!
                If SDL_rand(2) Then
                    points(i).x = SDL_randf() * CSng(WINDOW_WIDTH)
                    points(i).y = 0.0
                Else
                    points(i).x = 0.0
                    points(i).y = SDL_randf() * CSng(WINDOW_HEIGHT)
                End If
                pointSpeeds(i) = MIN_PIXELS_PER_SECOND + (SDL_randf * (MAX_PIXELS_PER_SECOND - MIN_PIXELS_PER_SECOND))
            End If
        Next i
        
        lastTime = now
        
        '' as you can see from this, rendering draws over whatever was drawn before it.
        SDL_SetRenderDrawColor(renderer, 0, 0, 0, SDL_ALPHA_OPAQUE) '' black, full alpha
        SDL_RenderClear(renderer)   '' start with a blank canvas.
        
        SDL_SetRenderDrawColor(renderer, 255, 255, 255, SDL_ALPHA_OPAQUE)   '' white, full alpha
        SDL_RenderPoints(renderer, @points(0), UBound(Points))  '' draw all the points!
        
        '' You can also draw single points with SDL_RenderPoint(), but it's
        '' cheaper (sometimes significantly so) to do them all at once.

        SDL_RenderPresent(renderer) '' put it all on the screen!
    Wend
          
    SDL_DestroyRenderer(renderer)
    SDL_DestroyWindow(win)
    SDL_Quit()
End Sub

Main()