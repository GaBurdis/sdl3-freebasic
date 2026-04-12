'' This example code looks for the current gamepad state once per frame,
'' and draws a visual representation of it. See 01-joystick-polling for the
'' equivalent example code for the lower-level joystick API.
''
'' This code is public domain. Feel free to use it for any purpose!

'' Joysticks are low-level interfaces: there's something with a bunch of
'' buttons, axes and hats, in no understood order or position. This is
'' a flexible interface, but you'll need to build some sort of configuration
'' UI to let people tell you what button, etc, does what. On top of this
'' interface, SDL offers the "gamepad" API, which works with lots of devices,
'' and knows how to map arbitrary buttons and such to look like an
'' Xbox/PlayStation/etc gamepad. This is easier, and better, for many games,
'' but isn't necessarily a good fit for complex apps and hardware. A flight
'' simulator, a realistic racing game, etc, might want the joystick interface
'' instead of gamepads.

'' SDL can handle multiple gamepads, but for simplicity, this program only
'' deals with the first gamepad it sees.

#include "SDL3/SDL.bi"

'' We will use this renderer to draw into this window every frame.
Dim As SDL_Window Ptr win
Dim As SDL_Renderer Ptr renderer
Dim As SDL_Event e
Dim As Boolean quit

Dim As SDL_Texture ptr texture
Dim As SDL_Gamepad ptr gamepad

Const WINDOW_WIDTH = 640
Const WINDOW_HEIGHT = 480

If Not SDL_Init(SDL_INIT_VIDEO Or SDL_INIT_GAMEPAD) Then
    SDL_Log("Couldn't initialize SDL: %s", SDL_GetError())
    quit = True
ElseIf Not SDL_CreateWindowAndRenderer("Example Input Gamepad-Polling", 640, 480, SDL_WINDOW_RESIZABLE, @win, @renderer) Then
    SDL_Log("Couldn't create window/renderer: %s", SDL_GetError())
    quit = True
Else
    Dim As SDL_Surface ptr surface
    
    '' Textures are pixel data that we upload to the video hardware for fast drawing. Lots of 2D
    '' engines refer to these as "sprites." We'll do a static texture (upload once, draw many
    '' times) with data from a bitmap file.

    '' SDL_Surface is pixel data the CPU can access. SDL_Texture is pixel data the GPU can access.
    '' Load a .png into a surface, move it to a texture from there.
    surface = SDL_LoadPNG("../../Data/gamepad_front.png")
    If surface = 0 Then
        SDL_Log("Couldn't load bitmap: %s", SDL_GetError())
        quit = True
    End If
    
    texture = SDL_CreateTextureFromSurface(renderer, surface)
    If texture = 0 Then
        SDL_Log("Couldn't create static texture: %s", SDL_GetError())
        quit = True
    End If
    
    SDL_DestroySurface(surface) '' done with this, the texture has a copy of the pixels now.
End If

While Not quit
    While SDL_PollEvent(@e)
        If e.type = SDL_EVENT_QUIT Then
            quit = True
        ElseIf e.type = SDL_EVENT_GAMEPAD_ADDED Then
            '' this event is sent for each hotplugged gamepad, but also each already-connected gamepad during SDL_Init().
            If gamepad = 0 Then '' we don't have a stick yet and one was added, open it!
                gamepad = SDL_OpenGamepad(e.gdevice.which)
                If gamepad = 0 Then
                    SDL_Log("Failed to open gamepad ID %u: %s", CULng(e.gdevice.which), SDL_GetError())
                End If
            End If
        ElseIf e.type = SDL_EVENT_GAMEPAD_REMOVED Then
            If (gamepad <> 0 And (SDL_GetGamepadID(gamepad) = e.gdevice.which)) Then
                SDL_CloseGamepad(gamepad)   '' our controller was unplugged.
                gamepad = 0
            End If
        End If
    Wend

    Dim As Const ZString Ptr text = @"Plug in a gamepad, please."
    Dim As Uint64 leftthumblast = &hFFFFFFFF
    Dim As Uint64 rightthumblast = &hFFFFFFFF
    Dim As Uint64 now = SDL_GetTicks()
    Dim As Sint16 axis_x, axis_y
    Dim As Single x, y
    
    If gamepad <> 0 Then    '' we have a stick opened?
        text = SDL_GetGamepadName(gamepad)
    End If
    
    SDL_SetRenderDrawColor(renderer, &hFF, &hFF, &hFF, &hFF) '' white
    SDL_RenderClear(renderer)
    
    '' note that you can get input as events, instead of polling, which is
    '' better since it won't miss button presses if the system is lagging,
    '' but often times checking the current state per-frame is good enough,
    '' and maybe better if you'd rather _drop_ inputs due to lag.
    
    If gamepad <> 0 Then    '' we have a stick opened?
        '' where to draw the buttons
        Dim As SDL_FRect buttons(16) = { _
            Type( 497, 266, 38,  38 ), _  '' SDL_GAMEPAD_BUTTON_SOUTH
            Type( 550, 217, 38,  38 ), _  '' SDL_GAMEPAD_BUTTON_EAST
            Type( 445, 221, 38,  38 ), _  '' SDL_GAMEPAD_BUTTON_WEST
            Type( 499, 173, 38,  38 ), _  '' SDL_GAMEPAD_BUTTON_NORTH
            Type( 235, 228, 32,  29 ), _  '' SDL_GAMEPAD_BUTTON_BACK
            Type( 287, 195, 69,  69 ), _  '' SDL_GAMEPAD_BUTTON_GUIDE
            Type( 377, 228, 32,  29 ), _  '' SDL_GAMEPAD_BUTTON_START
            Type(  91, 234, 63,  63 ), _  '' SDL_GAMEPAD_BUTTON_LEFT_STICK
            Type( 381, 354, 63,  63 ), _  '' SDL_GAMEPAD_BUTTON_RIGHT_STICK
            Type(  74,  73, 102, 29 ), _  '' SDL_GAMEPAD_BUTTON_LEFT_SHOULDER
            Type( 468,  73, 102, 29 ), _  '' SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER
            Type( 207, 316, 32,  32 ), _  '' SDL_GAMEPAD_BUTTON_DPAD_UP
            Type( 207, 384, 32,  32 ), _  '' SDL_GAMEPAD_BUTTON_DPAD_DOWN
            Type( 173, 351, 32,  32 ), _  '' SDL_GAMEPAD_BUTTON_DPAD_LEFT
            Type( 242, 351, 32,  32 ), _  '' SDL_GAMEPAD_BUTTON_DPAD_RIGHT
            Type( 310, 286, 23,  27 )}    '' SDL_GAMEPAD_BUTTON_MISC1
        '' there are other buttons: paddles on the back of the gamepad, touchpads, etc, but this is good enough for now.
        
        SDL_RenderTexture(renderer, texture, 0, 0)  '' draw the gamepad picture to the whole window.
        
        '' draw green boxes over buttons that are currently pressed.
        SDL_SetRenderDrawColor(renderer, &h00, &hFF, &h00, &hFF)    '' green
        For i As long = 0 To UBound(buttons)
            If SDL_GetGamepadButton(gamepad,  i) Then
                SDL_RenderFillRect(renderer, @buttons(i))
            End If
        Next i
        
        SDL_SetRenderDrawColor(renderer, &hFF, &hFF, &h00, &hFF)    '' yellow
        
        '' left thumb axis.
        axis_x = SDL_GetGamepadAxis(gamepad, SDL_GAMEPAD_AXIS_LEFTX)
        axis_y = SDL_GetGamepadAxis(gamepad, SDL_GAMEPAD_AXIS_LEFTY)
        If ((SDL_abs(axis_x) > 1000) Or (SDL_abs(axis_x) > 1000)) Then  '' zero means centered, but it might be a little off zero...
            leftthumblast = now '' keep drawing, we're still moving.
        End If
        If ((now - leftthumblast) < 500) Then   '' draw if there was movement in the last half-second.
            Dim As SDL_FRect box = Type(107 + ((axis_x / 32767.0f) * 30.0f), 252 + ((axis_y / 32767.0f) * 30.0f), 30, 30)
            SDL_RenderFillRect(renderer, @box)
        End If
        
        '' right thumb axis.
        axis_x = SDL_GetGamepadAxis(gamepad, SDL_GAMEPAD_AXIS_RIGHTX)
        axis_y = SDL_GetGamepadAxis(gamepad, SDL_GAMEPAD_AXIS_RIGHTY)
        If ((SDL_abs(axis_x) > 1000) Or (SDL_abs(axis_x) > 1000)) Then  '' zero means centered, but it might be a little off zero...
            rightthumblast = now '' keep drawing, we're still moving.
        End If
        If ((now - rightthumblast) < 500) Then   '' draw if there was movement in the last half-second.
            Dim As SDL_FRect box = Type(397 + ((axis_x / 32767.0f) * 30.0f), 370 + ((axis_y / 32767.0f) * 30.0f), 30, 30)
            SDL_RenderFillRect(renderer, @box)
        End If
        
        '' left trigger.
        axis_y = SDL_GetGamepadAxis(gamepad, SDL_GAMEPAD_AXIS_LEFT_TRIGGER)
        If axis_y > 1000 Then   '' zero means unpressed, but it might be a little off zero...
            Dim As Single height = (axis_y / 32767.0f) * 65.0f
            Dim As SDL_FRect box = Type(127, 1 + (65.0f - height), 37, height)
            SDL_RenderFillRect(renderer, @box)
        End If
        
        '' right trigger.
        axis_y = SDL_GetGamepadAxis(gamepad, SDL_GAMEPAD_AXIS_RIGHT_TRIGGER)
        If axis_y > 1000 Then   '' zero means unpressed, but it might be a little off zero...
            Dim As Single height = (axis_y / 32767.0f) * 65.0f
            Dim As SDL_FRect box = Type(481, 1 + (65.0f - height), 37, height)
            SDL_RenderFillRect(renderer, @box)
        End If
    End If
    
    x = (CSng(WINDOW_WIDTH) - (SDL_strlen(text) * SDL_DEBUG_TEXT_FONT_CHARACTER_SIZE)) / 2.0f
    If gamepad <> 0 Then
        y = CSng(WINDOW_HEIGHT - (SDL_DEBUG_TEXT_FONT_CHARACTER_SIZE + 2))
    Else
        y = (CSng(WINDOW_HEIGHT) - SDL_DEBUG_TEXT_FONT_CHARACTER_SIZE) / 2.0f
    End If
    
    SDL_SetRenderDrawColor(renderer, &h00, &h00, &hFF, &hFF)    '' blue
    SDL_RenderDebugText(renderer, x, y, text)
    
    SDL_RenderPresent(renderer)
Wend

SDL_DestroyTexture(texture)
SDL_CloseGamepad(gamepad)
SDL_DestroyRenderer(renderer)
SDL_DestroyWindow(win)
SDL_Quit()
