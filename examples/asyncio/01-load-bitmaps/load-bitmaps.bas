'' This example code loads a bitmap with asynchronous i/o and renders it.
''
'' This code is public domain. Feel free to use it for any purpose!

#include "SDL3/SDL.bi"

'' We will use this renderer to draw into this window every frame.
Dim As SDL_Window Ptr win
Dim As SDL_Renderer Ptr renderer
Dim As SDL_Event e
Dim As Boolean quit

Dim As SDL_AsyncIOQueue Ptr queue

Const As Long TOTAL_TEXTURES = 4
Dim As String pngs(TOTAL_TEXTURES) = {"sample.png", "gamepad_front.png", "speaker.png", "icon2x.png"}
Dim As SDL_Texture Ptr textures(TOTAL_TEXTURES)
Dim As SDL_FRect textureRects(TOTAL_TEXTURES) = { _
    Type(116, 156, 408, 167), _
    Type( 20, 200,  96,  60), _
    Type(525, 180,  96,  96), _
    Type(288, 375,  64,  64)}

If Not SDL_Init(SDL_INIT_VIDEO) Then
    SDL_ShowSimpleMessageBox(SDL_MESSAGEBOX_ERROR, "Couldn't initialize SDL!", SDL_GetError(), 0)
    quit = True
ElseIf Not SDL_CreateWindowAndRenderer("SDL3 AsyncIO load-bitmaps", 640, 480, SDL_WINDOW_RESIZABLE, @win, @renderer) Then
    SDL_ShowSimpleMessageBox(SDL_MESSAGEBOX_ERROR, "Couldn't create window/renderer!", SDL_GetError(), 0)
    quit = True
Else
    queue = SDL_CreateAsyncIOQueue()
    If queue = 0 Then
        SDL_ShowSimpleMessageBox(SDL_MESSAGEBOX_ERROR, "Couldn't create async i/o queue!", SDL_GetError(), 0)
        quit = True
    End If

    '' Load some .bmp files asynchronously from wherever the app is being run from, put them in the same queue.
    For i As Long = 0 To UBound(pngs)
        SDL_LoadFileAsync("../../Data/" & pngs(i), queue,  @pngs(i))   '' attach the filename as app-specific data, so we can see it later.
    Next i
End If

While Not quit
    While SDL_PollEvent(@e)
        If e.type = SDL_EVENT_QUIT Then
            quit = True
        End If
    Wend

    Dim As SDL_AsyncIOOutcome outcome
    Dim As Long i

    If SDL_GetAsyncIOResult(queue, @outcome) Then   '' a .png file load has finished?
        If outcome.result = SDL_ASYNCIO_COMPLETE Then
            '' this might be _any_ of the pngs; they might finish loading in any order.
            For i = 0 To UBound(pngs)
                '' this doesn't need a strcmp because we gave the pointer from this array to SDL_LoadFileAsync
                If outcome.userdata = @pngs(i) Then
                    Exit For
                End If
            Next i

            If i < UBound(pngs) Then    '' (just in case.)
                Dim As SDL_Surface Ptr surface = SDL_LoadPNG_IO(SDL_IOFromConstMem(outcome.buffer, CUint(outcome.bytes_transferred)), True)
                If surface <> 0 Then '' the renderer is not multithreaded, so create the texture here once the data loads.
                    textures(i) = SDL_CreateTextureFromSurface(renderer, surface)
                    If textures(i) = 0 Then
                        SDL_ShowSimpleMessageBox(SDL_MESSAGEBOX_ERROR, "Couldn't create texture!", SDL_GetError(), 0)
                        quit = True
                    End If
                    SDL_DestroySurface(surface)
                End If
            End If
        End If
        SDL_free(outcome.buffer)
    End If

    SDL_SetRenderDrawColor(renderer, 0, 0, 0, 255)
    SDL_RenderClear(renderer)

    For i = 0 To UBound(textures)
        SDL_RenderTexture(renderer, textures(i), 0, @textureRects(i))
    Next i

    SDL_RenderPresent(renderer)
Wend

SDL_DestroyAsyncIOQueue(queue)

For i As Long = 0 To UBound(textures)
    SDL_DestroyTexture(textures(i))
Next i

SDL_DestroyRenderer(renderer)
SDL_DestroyWindow(win)
SDL_Quit()
