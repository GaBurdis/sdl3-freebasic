'' This example code loads two .wav files, puts them an audio streams and
'' binds them for playback, repeating both sounds on loop. This shows several
'' streams mixing into a single playback device.
''
'' This code is public domain. Feel free to use it for any purpose!

#include "SDL3/SDL.bi"

Type Sound
    wavData As Uint8 Ptr
    wavDataLen As Uint32
    stream As SDL_AudioStream Ptr
End Type

Function InitSound(ByVal fname As String, ByVal snd As Sound Ptr, ByVal audioDevice As SDL_AudioDeviceID) As Boolean
    Dim As Boolean retval
    Dim As SDL_AudioSpec spec
    
    '' Load the .wav files from wherever the app is being run from.
    If Not SDL_LoadWAV("../../Data/" & fname, @spec, @snd->wavData, @snd->wavDataLen) Then
        SDL_Log("Couldn't load .wav file: %s", SDL_GetError())
        Return False
    End If
    
    '' Create an audio stream. Set the source format to the wav's format (what
    '' we'll input), leave the dest format NULL here (it'll change to what the
    '' device wants once we bind it).
    snd->stream = SDL_CreateAudioStream(@spec, 0)
    If  snd->stream = 0 Then
        SDL_Log("Couldn't create audio stream: %s", SDL_GetError())
    ElseIf Not SDL_BindAudioStream(audioDevice, snd->stream) Then  '' once bound, it'll start playing when there is data available!
        SDL_Log("Failed to bind '%s' stream to device: %s", fname, SDL_GetError())
    Else
        retval = True
    End If
    
    Return retval
End Function

Sub Main()
    If Not SDL_Init(SDL_INIT_VIDEO Or SDL_INIT_AUDIO) Then
        SDL_Log("Couldn't initialize SDL: %s", SDL_GetError())
        Exit Sub
    End If
    
    '' We will use this renderer to draw into this window every frame.
    Dim As SDL_Window Ptr win
    Dim As SDL_Renderer Ptr renderer
    
    '' we don't _need_ a window for audio-only things but it's good policy to have one.
    If Not SDL_CreateWindowAndRenderer("Example Audio Multiple Streams", 640, 480, 0, @win, @renderer) Then
        SDL_Log("Couldn't create window/renderer: %s", SDL_GetError())
        SDL_Quit()
        Exit Sub
    End If
    
    Dim As SDL_AudioDeviceID audioDevice
    Dim As Sound sounds(2)
    
    Dim As SDL_Event e
    Dim As Boolean quit

    '' open the default audio device in whatever format it prefers; our audio streams will adjust to it.
    audioDevice = SDL_OpenAudioDevice(SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK, 0)
    If audioDevice = 0 Then
        SDL_Log("Couldn't open audio device: %s", SDL_GetError())
        quit = True
    End If
    
    If Not InitSound("sample.wav", @sounds(0), audioDevice) Then
        quit = True
    ElseIf Not InitSound("sword.wav", @sounds(1), audioDevice) Then
        quit = True
    End If

    While Not quit
        While SDL_PollEvent(@e)
            If e.type = SDL_EVENT_QUIT Then
                quit = True
            End If
        Wend

        For i As Long = 0 To UBound(sounds)
            '' If less than a full copy of the audio is queued for playback, put another copy in there.
            '' This is overkill, but easy when lots of RAM is cheap. One could be more careful and
            '' queue less at a time, as long as the stream doesn't run dry.
            If SDL_GetAudioStreamQueued(sounds(i).stream) < CLng(sounds(i).wavDataLen) Then
                SDL_PutAudioStreamData(sounds(i).stream, sounds(i).wavData, CLng(sounds(i).wavDataLen))
            End If
        Next i
        
        '' just blank the screen.
        SDL_SetRenderDrawColor(renderer, 0, 0, 0, 255)
        SDL_RenderClear(renderer)
        SDL_RenderPresent(renderer)
    Wend
    
    SDL_CloseAudioDevice(audioDevice)
    
    For i As Long = 0 To UBound(sounds)
        If sounds(i).stream Then
            SDL_DestroyAudioStream(sounds(i).stream)
        End If
        SDL_free(sounds(i).wavData)
    Next i
    
    SDL_DestroyRenderer(renderer)
    SDL_DestroyWindow(win)
    SDL_Quit()
End Sub

Main()