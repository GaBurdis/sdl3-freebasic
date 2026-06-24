# sdl3-freebasic

FreeBasic bindings:

Lib | Version |
--- | ------- |
[SDL3](https://github.com/libsdl-org/SDL) | 3.4.4 |
[SDL3_image](https://github.com/libsdl-org/SDL_image) | 3.4.4 |
[SDL3_ttf](https://github.com/libsdl-org/SDL_ttf) | 3.2.2 |
[SDL3_mixer](https://github.com/libsdl-org/SDL_mixer) | 3.2.0 |

## Status
This project is at an early stage, and feature testing is underway in Windows 10. The FreeBASIC version is used 1.10.1 x64

## Requirements
You need to have SDL3 (at least version 3.4.4) installed as shared library. That means at runtime, it is trying to load SDL:
- Windows: `SDL3.dll`

## Example
This simple example just opens a window with a gray background:

```FreeBASIC
#include "SDL3/SDL.bi"

Dim As SDL_Window Ptr win
Dim As SDL_Renderer Ptr renderer
Dim As SDL_Event e
Dim As Boolean quit

If Not SDL_Init(SDL_INIT_VIDEO) Then
    SDL_Log("Couldn't initialize SDL: %s", SDL_GetError())
    quit = True
ElseIf Not SDL_CreateWindowAndRenderer("SDL3 on FreeBASIC", 640, 480, 0, @win, @renderer) Then
    SDL_Log("Couldn't create window/renderer: %s", SDL_GetError())
    quit = True
Else
    SDL_SetRenderDrawColor(renderer, 66, 66, 66, 255)
End If

While Not quit
    While SDL_PollEvent(@e)
        If e.type = SDL_EVENT_QUIT Then
            quit = True
        End If
    Wend
    
    SDL_RenderClear(renderer)
    
    SDL_RenderPresent(renderer)
Wend

SDL_DestroyRenderer(renderer)
SDL_DestroyWindow(win)
SDL_Quit()

```

![Screenshot Windows](./exemple.png)
