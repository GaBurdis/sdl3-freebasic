'' FreeBASIC binding for SDL3_mixer-3.2.0
''
'' based on the C header files:
''  SDL_mixer: An audio mixer library based on the SDL library
''  Copyright (C) 1997-2026 Sam Lantinga <slouken@libsdl.org>
''
''  This software is provided 'as-is', without any express or implied
''  warranty.  In no event will the authors be held liable for any damages
''  arising from the use of this software.
''
''  Permission is granted to anyone to use this software for any purpose,
''  including commercial applications, and to alter it and redistribute it
''  freely, subject to the following restrictions:
''
''  1. The origin of this software must not be misrepresented; you must not
''     claim that you wrote the original software. If you use this software
''     in a product, an acknowledgment in the product documentation would be
''     appreciated but is not required.
''  2. Altered source versions must be plainly marked as such, and must not be
''     misrepresented as being the original software.
''  3. This notice may not be removed or altered from any source distribution.

#pragma once

#inclib "SDL3_mixer"

#include once "SDL3/SDL.bi"

extern "C"

type MIX_Mixer as MIX_Mixer_
type MIX_Audio as MIX_Audio_
type MIX_Track as MIX_Track_
type MIX_Group as MIX_Group_

const SDL_MIXER_MAJOR_VERSION = 3
const SDL_MIXER_MINOR_VERSION = 2
const SDL_MIXER_MICRO_VERSION = 0

#define SDL_MIXER_VERSION SDL_VERSIONNUM(SDL_MIXER_MAJOR_VERSION, SDL_MIXER_MINOR_VERSION, SDL_MIXER_MICRO_VERSION)
#define SDL_MIXER_VERSION_ATLEAST(X, Y, Z) ((SDL_MIXER_MAJOR_VERSION >= X) andalso (SDL_MIXER_MAJOR_VERSION > X orelse SDL_MIXER_MINOR_VERSION >= Y) andalso (SDL_MIXER_MAJOR_VERSION > X orelse SDL_MIXER_MINOR_VERSION > Y orelse SDL_MIXER_MICRO_VERSION >= Z))

declare function MIX_Version() as long
declare function MIX_Init() as boolean
declare sub MIX_Quit()

declare function MIX_GetNumAudioDecoders() as long
declare function MIX_GetAudioDecoder(byval index as long) as const zstring ptr

declare function MIX_CreateMixerDevice(byval devid as SDL_AudioDeviceID, byval spec as const SDL_AudioSpec ptr) as MIX_Mixer ptr
declare function MIX_CreateMixer(byval spec as const SDL_AudioSpec ptr) as MIX_Mixer ptr

declare sub MIX_DestroyMixer(byval mixer as MIX_Mixer ptr)

declare function MIX_GetMixerProperties(byval mixer as MIX_Mixer ptr) as SDL_PropertiesID

#define MIX_PROP_MIXER_DEVICE_NUMBER "SDL_mixer.mixer.device"

declare function MIX_GetMixerFormat(byval mixer as MIX_Mixer ptr, byval spec as SDL_AudioSpec ptr) as boolean

declare sub MIX_LockMixer(byval mixer as MIX_Mixer ptr)
declare sub MIX_UnlockMixer(byval mixer as MIX_Mixer ptr)

declare function MIX_LoadAudio_IO(byval mixer as MIX_Mixer ptr, byval io as SDL_IOStream ptr, byval predecode as boolean, byval closeio as boolean) as MIX_Audio ptr
declare function MIX_LoadAudio(byval mixer as MIX_Mixer ptr, byval path as const zstring ptr, byval predecode as boolean) as MIX_Audio ptr
declare function MIX_LoadAudioNoCopy(byval mixer as MIX_Mixer ptr, byval data as const void ptr, byval datalen as uinteger, byval free_when_done as boolean) as MIX_Audio ptr
declare function MIX_LoadAudioWithProperties(byval props as SDL_PropertiesID) as MIX_Audio ptr

#define MIX_PROP_AUDIO_LOAD_IOSTREAM_POINTER "SDL_mixer.audio.load.iostream"
#define MIX_PROP_AUDIO_LOAD_CLOSEIO_BOOLEAN "SDL_mixer.audio.load.closeio"
#define MIX_PROP_AUDIO_LOAD_PREDECODE_BOOLEAN "SDL_mixer.audio.load.predecode"
#define MIX_PROP_AUDIO_LOAD_PREFERRED_MIXER_POINTER "SDL_mixer.audio.load.preferred_mixer"
#define MIX_PROP_AUDIO_LOAD_SKIP_METADATA_TAGS_BOOLEAN "SDL_mixer.audio.load.skip_metadata_tags"
#define MIX_PROP_AUDIO_DECODER_STRING "SDL_mixer.audio.decoder"

declare function MIX_LoadRawAudio_IO(byval mixer as MIX_Mixer ptr, byval io as SDL_IOStream ptr, byval spec as const SDL_AudioSpec ptr, byval closeio as boolean) as MIX_Audio ptr
declare function MIX_LoadRawAudio(byval mixer as MIX_Mixer ptr, byval data as const void ptr, byval datalen as uinteger, byval spec as const SDL_AudioSpec ptr) as MIX_Audio ptr
declare function MIX_LoadRawAudioNoCopy(byval mixer as MIX_Mixer ptr, byval data as const void ptr, byval datalen as uinteger, byval spec as const SDL_AudioSpec ptr, byval free_when_done as boolean) as MIX_Audio ptr

declare function MIX_CreateSineWaveAudio(byval mixer as MIX_Mixer ptr, byval hz as long, byval amplitude as single, byval ms as Sint64) as MIX_Audio ptr

declare function MIX_GetAudioProperties(byval audio as MIX_Audio ptr) as SDL_PropertiesID

#define MIX_PROP_METADATA_TITLE_STRING "SDL_mixer.metadata.title"
#define MIX_PROP_METADATA_ARTIST_STRING "SDL_mixer.metadata.artist"
#define MIX_PROP_METADATA_ALBUM_STRING "SDL_mixer.metadata.album"
#define MIX_PROP_METADATA_COPYRIGHT_STRING "SDL_mixer.metadata.copyright"
#define MIX_PROP_METADATA_TRACK_NUMBER "SDL_mixer.metadata.track"
#define MIX_PROP_METADATA_TOTAL_TRACKS_NUMBER "SDL_mixer.metadata.total_tracks"
#define MIX_PROP_METADATA_YEAR_NUMBER "SDL_mixer.metadata.year"
#define MIX_PROP_METADATA_DURATION_FRAMES_NUMBER "SDL_mixer.metadata.duration_frames"
#define MIX_PROP_METADATA_DURATION_INFINITE_BOOLEAN "SDL_mixer.metadata.duration_infinite"

declare function MIX_GetAudioDuration(byval audio as MIX_Audio ptr) as Sint64

#define MIX_DURATION_UNKNOWN -1
#define MIX_DURATION_INFINITE -2

declare function MIX_GetAudioFormat(byval audio as MIX_Audio ptr, byval spec as SDL_AudioSpec ptr) as boolean

declare sub MIX_DestroyAudio(byval audio as MIX_Audio ptr)

declare function MIX_CreateTrack(byval mixer as MIX_Mixer ptr) as MIX_Track ptr
declare sub MIX_DestroyTrack(byval track as MIX_Track ptr)
declare function MIX_GetTrackProperties(byval track as MIX_Track ptr) as SDL_PropertiesID
declare function MIX_GetTrackMixer(byval track as MIX_Track ptr) as MIX_Mixer ptr
declare function MIX_SetTrackAudio(byval track as MIX_Track ptr, byval audio as MIX_Audio ptr) as boolean
declare function MIX_SetTrackAudioStream(byval track as MIX_Track ptr, byval stream as SDL_AudioStream ptr) as boolean
declare function MIX_SetTrackIOStream(byval track as MIX_Track ptr, byval io as SDL_IOStream ptr, byval closeio as boolean) as boolean
declare function MIX_SetTrackRawIOStream(byval track as MIX_Track ptr, byval io as SDL_IOStream ptr, byval spec as const SDL_AudioSpec ptr, byval closeio as boolean) as boolean

declare function MIX_TagTrack(byval track as MIX_Track ptr, byval tag as const zstring ptr) as boolean
declare sub MIX_UntagTrack(byval track as MIX_Track ptr, byval tag as const zstring ptr)
declare function MIX_GetTrackTags(byval track as MIX_Track ptr, byval count as long ptr) as zstring
declare function MIX_GetTaggedTracks(byval mixer as MIX_Mixer ptr, byval tag as const zstring ptr, byval count as long ptr) as MIX_Track

declare function MIX_SetTrackPlaybackPosition(byval track as MIX_Track ptr, byval frames as Sint64) as boolean
declare function MIX_GetTrackPlaybackPosition(byval track as MIX_Track ptr) as Sint64
declare function MIX_GetTrackFadeFrames(byval track as MIX_Track ptr) as Sint64
declare function MIX_GetTrackLoops(byval track as MIX_Track ptr) as long
declare function MIX_SetTrackLoops(byval track as MIX_Track ptr, byval num_loops as long) as boolean
declare function MIX_GetTrackAudio(byval track as MIX_Track ptr) as MIX_Audio ptr
declare function MIX_GetTrackAudioStream(byval track as MIX_Track ptr) as SDL_AudioStream ptr
declare function MIX_GetTrackRemaining(byval track as MIX_Track ptr) as Sint64
declare function MIX_TrackMSToFrames(byval track as MIX_Track ptr, byval ms as Sint64) as Sint64
declare function MIX_TrackFramesToMS(byval track as MIX_Track ptr, byval frames as Sint64) as Sint64
declare function MIX_AudioMSToFrames(byval audio as MIX_Audio ptr, byval ms as Sint64) as Sint64
declare function MIX_AudioFramesToMS(byval audio as MIX_Audio ptr, byval frames as Sint64) as Sint64
declare function MIX_MSToFrames(byval sample_rate as long, byval ms as Sint64) as Sint64
declare function MIX_FramesToMS(byval sample_rate as long, byval frames as Sint64) as Sint64

declare function MIX_PlayTrack(byval track as MIX_Track ptr, byval options as SDL_PropertiesID) as boolean

#define MIX_PROP_PLAY_LOOPS_NUMBER "SDL_mixer.play.loops"
#define MIX_PROP_PLAY_MAX_FRAME_NUMBER "SDL_mixer.play.max_frame"
#define MIX_PROP_PLAY_MAX_MILLISECONDS_NUMBER "SDL_mixer.play.max_milliseconds"
#define MIX_PROP_PLAY_START_FRAME_NUMBER "SDL_mixer.play.start_frame"
#define MIX_PROP_PLAY_START_MILLISECOND_NUMBER "SDL_mixer.play.start_millisecond"
#define MIX_PROP_PLAY_LOOP_START_FRAME_NUMBER "SDL_mixer.play.loop_start_frame"
#define MIX_PROP_PLAY_LOOP_START_MILLISECOND_NUMBER "SDL_mixer.play.loop_start_millisecond"
#define MIX_PROP_PLAY_FADE_IN_FRAMES_NUMBER "SDL_mixer.play.fade_in_frames"
#define MIX_PROP_PLAY_FADE_IN_MILLISECONDS_NUMBER "SDL_mixer.play.fade_in_milliseconds"
#define MIX_PROP_PLAY_FADE_IN_START_GAIN_FLOAT "SDL_mixer.play.fade_in_start_gain"
#define MIX_PROP_PLAY_APPEND_SILENCE_FRAMES_NUMBER "SDL_mixer.play.append_silence_frames"
#define MIX_PROP_PLAY_APPEND_SILENCE_MILLISECONDS_NUMBER "SDL_mixer.play.append_silence_milliseconds"
#define MIX_PROP_PLAY_HALT_WHEN_EXHAUSTED_BOOLEAN "SDL_mixer.play.halt_when_exhausted"

declare function MIX_PlayTag(byval mixer as MIX_Mixer ptr, byval tag as const zstring ptr, byval options as SDL_PropertiesID) as boolean
declare function MIX_PlayAudio(byval mixer as MIX_Mixer ptr, byval audio as MIX_Audio ptr) as boolean
declare function MIX_StopTrack(byval track as MIX_Track ptr, byval fade_out_frames as Sint64) as boolean
declare function MIX_StopAllTracks(byval mixer as MIX_Mixer ptr, byval fade_out_ms as Sint64) as boolean
declare function MIX_StopTag(byval mixer as MIX_Mixer ptr, byval tag as const zstring ptr, byval fade_out_ms as Sint64) as boolean
declare function MIX_PauseTrack(byval track as MIX_Track ptr) as boolean
declare function MIX_PauseAllTracks(byval mixer as MIX_Mixer ptr) as boolean
declare function MIX_PauseTag(byval mixer as MIX_Mixer ptr, byval tag as const zstring ptr) as boolean
declare function MIX_ResumeTrack(byval track as MIX_Track ptr) as boolean
declare function MIX_ResumeAllTracks(byval mixer as MIX_Mixer ptr) as boolean
declare function MIX_ResumeTag(byval mixer as MIX_Mixer ptr, byval tag as const zstring ptr) as boolean
declare function MIX_TrackPlaying(byval track as MIX_Track ptr) as boolean
declare function MIX_TrackPaused(byval track as MIX_Track ptr) as boolean
declare function MIX_SetMixerGain(byval mixer as MIX_Mixer ptr, byval gain as single) as boolean
declare function MIX_GetMixerGain(byval mixer as MIX_Mixer ptr) as single
declare function MIX_SetTrackGain(byval track as MIX_Track ptr, byval gain as single) as boolean
declare function MIX_GetTrackGain(byval track as MIX_Track ptr) as single
declare function MIX_SetTagGain(byval mixer as MIX_Mixer ptr, byval tag as const zstring ptr, byval gain as single) as boolean

declare function MIX_SetMixerFrequencyRatio(byval mixer as MIX_Mixer ptr, byval ratio as single) as boolean
declare function MIX_GetMixerFrequencyRatio(byval mixer as MIX_Mixer ptr) as single
declare function MIX_SetTrackFrequencyRatio(byval track as MIX_Track ptr, byval ratio as single) as boolean
declare function MIX_GetTrackFrequencyRatio(byval track as MIX_Track ptr) as single
declare function MIX_SetTrackOutputChannelMap(byval track as MIX_Track ptr, byval chmap as const long ptr, byval count as long) as boolean

type MIX_StereoGains
    left as single
    right as single
end type

declare function MIX_SetTrackStereo(byval track as MIX_Track ptr, byval gains as const MIX_StereoGains ptr) as boolean

type MIX_Point3D
    x as single
    y as single
    z as single
end type

declare function MIX_SetTrack3DPosition(byval track as MIX_Track ptr, byval position as const MIX_Point3D ptr) as boolean
declare function MIX_GetTrack3DPosition(byval track as MIX_Track ptr, byval position as MIX_Point3D ptr) as boolean

declare function MIX_CreateGroup(byval mixer as MIX_Mixer ptr) as MIX_Group ptr
declare sub MIX_DestroyGroup(byval group as MIX_Group ptr)
declare function MIX_GetGroupProperties(byval group as MIX_Group ptr) as SDL_PropertiesID
declare function MIX_GetGroupMixer(byval group as MIX_Group ptr) as MIX_Mixer ptr
declare function MIX_SetTrackGroup(byval track as MIX_Track ptr, byval group as MIX_Group ptr) as boolean

type MIX_TrackStoppedCallback as sub(byval userdata as any ptr, byval track as MIX_Track ptr)

declare function MIX_SetTrackStoppedCallback(byval track as MIX_Track ptr, byval cb as MIX_TrackStoppedCallback, byval userdata as void ptr) as boolean

type MIX_TrackMixCallback as sub(byval userdata as any ptr, byval track as MIX_Track tr, byval spec as const SDL_AudioSpec ptr, byval pcm as single ptr, byval samples as long)

declare function MIX_SetTrackRawCallback(byval track as MIX_Track ptr, byval cb as MIX_TrackMixCallback, byval userdata as void ptr) as boolean
declare function MIX_SetTrackCookedCallback(byval track as MIX_Track ptr, byval cb as MIX_TrackMixCallback, byval userdata as void ptr) as boolean

type MIX_GroupMixCallback as sub(byval userdata as any ptr, byval group as MIX_Group ptr, byval spec as const SDL_AudioSpec ptr, byval pcm as single ptr, byval samples as long)

declare function MIX_SetGroupPostMixCallback(byval group as MIX_Group ptr, byval cb as MIX_GroupMixCallback, byval userdata as void ptr) as boolean

type MIX_PostMixCallback as sub(byval userdata as any ptr, byval mixer as MIX_Mixer ptr, byval spec as const SDL_AudioSpec ptr, byval pcm as single ptr, byval samples as long)

declare function MIX_SetPostMixCallback(byval mixer as MIX_Mixer ptr, byval cb as MIX_PostMixCallback, byval userdata as void ptr) as boolean

declare function MIX_Generate(byval mixer as MIX_Mixer ptr, byval buffer as void ptr, byval buflen as long) as long

type MIX_AudioDecoder as MIX_AudioDecoder_

declare function MIX_CreateAudioDecoder(byval path as const zstring ptr, byval props as SDL_PropertiesID) as MIX_AudioDecoder ptr
declare function MIX_CreateAudioDecoder_IO(byval io as SDL_IOStream ptr, byval closeio as boolean, byval props as SDL_PropertiesID) as MIX_AudioDecoder ptr
declare sub MIX_DestroyAudioDecoder(byval audiodecoder as MIX_AudioDecoder ptr)
declare function MIX_GetAudioDecoderProperties(byval audiodecoder as MIX_AudioDecoder ptr) as SDL_PropertiesID
declare function MIX_GetAudioDecoderFormat(byval audiodecoder as MIX_AudioDecoder ptr, byval spec as SDL_AudioSpec ptr) as boolean
declare function MIX_DecodeAudio(byval audiodecoder as MIX_AudioDecoder ptr, byval buffer as void ptr, byval buflen as long, byval spec as const SDL_AudioSpec ptr) as long

end extern
