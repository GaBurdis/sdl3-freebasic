'' This example code creates a simple audio stream for playing sound, and
'' loads a .wav file that is pushed through the stream in a loop.
''
'' This code is public domain. Feel free to use it for any purpose!
''
'' The .wav file is a sample from Will Provost's song, The Living Proof,
'' used with permission.
''
''    From the album The Living Proof
''    Publisher: 5 Guys Named Will
''    Copyright 1996 Will Provost
''    https://itunes.apple.com/us/album/the-living-proof/id4153978
''    http://www.amazon.com/The-Living-Proof-Will-Provost/dp/B00004R8RH

#include "SDL3/SDL.bi"

'' We will use this renderer to draw into this window every frame.
Dim As SDL_Window Ptr win
Dim As SDL_Renderer Ptr renderer
Dim As SDL_Event e
Dim As Boolean quit

Dim As SDL_AudioStream Ptr stream
Dim As Uint8 Ptr wavData
Dim As Uint32 wavDataLen

If Not SDL_Init(SDL_INIT_VIDEO Or SDL_INIT_AUDIO) Then
    SDL_Log("Couldn't initialize SDL: %s", SDL_GetError())
    quit = True
ElseIf Not SDL_CreateWindowAndRenderer("Example Audio Load Wave", 640, 480, 0, @win, @renderer) Then
    SDL_Log("Couldn't create window/renderer: %s", SDL_GetError())
    quit = True
Else
    Dim As SDL_AudioSpec spec
    
    '' Load the .wav file from wherever the app is being run from.
    If Not SDL_LoadWAV("../../Data/sample.wav", @spec, @wavData, @wavDataLen) Then
        SDL_Log("Couldn't load .wav file: %s", SDL_GetError())
        quit = True
    End If

    '' Create our audio stream in the same format as the .wav file. It'll convert to what the audio hardware wants.
    stream = SDL_OpenAudioDeviceStream(SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK, @spec, 0, 0)
    If stream = Null Then
        SDL_Log("Couldn't create audio stream: %s", SDL_GetError())
        quit = True
    End If

    '' SDL_OpenAudioDeviceStream starts the device paused. You have to tell it to start!
    SDL_ResumeAudioStreamDevice(stream)
End If

While Not quit
    While SDL_PollEvent(@e)
        If e.type = SDL_EVENT_QUIT Then
            quit = True
        End If
    Wend

    '' see if we need to feed the audio stream more data yet.
    '' We're being lazy here, but if there's less than the entire wav file left to play,
    '' just shove a whole copy of it into the queue, so we always have _tons_ of
    '' data queued for playback.
    If SDL_GetAudioStreamQueued(stream) < CLng(wavDataLen) Then
        '' feed more data to the stream. It will queue at the end, and trickle out as the hardware needs more data.
        SDL_PutAudioStreamData(stream, wavData, wavDataLen)
    End If

    '' we're not doing anything with the renderer, so just blank it out.
    SDL_RenderClear(renderer)
    SDL_RenderPresent(renderer)
Wend

SDL_free(wavData)   '' strictly speaking, this isn't necessary because the process is ending, but it's good policy.
SDL_DestroyRenderer(renderer)
SDL_DestroyWindow(win)
SDL_Quit()
