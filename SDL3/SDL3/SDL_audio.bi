#pragma once

extern "C"

const SDL_AUDIO_MASK_BITSIZE    = &hFFu
const SDL_AUDIO_MASK_FLOAT      = culng(1u shl 8)
const SDL_AUDIO_MASK_BIG_ENDIAN = culng(1u shl 12)
const SDL_AUDIO_MASK_SIGNED     = culng(1u shl 15)

'' TODO: #define SDL_DEFINE_AUDIO_FORMAT(signed, bigendian, flt, size) \
'' TODO:   (((Uint16)(signed) << 15) | ((Uint16)(bigendian) << 12) | ((Uint16)(flt) << 8) | ((size) & SDL_AUDIO_MASK_BITSIZE))

type SDL_AudioFormat as long
enum
	SDL_AUDIO_UNKNOWN = &h0000u
	SDL_AUDIO_U8      = &h0008u
	SDL_AUDIO_S8      = &h8008u
	SDL_AUDIO_S16LE   = &h8010u
	SDL_AUDIO_S16BE   = &h9010u
	SDL_AUDIO_S32LE   = &h8020u
	SDL_AUDIO_S32BE   = &h9020u
	SDL_AUDIO_F32LE   = &h8120u
	SDL_AUDIO_F32BE   = &h9120u

	#if SDL_BYTEORDER = SDL_LIL_ENDIAN
	SDL_AUDIO_S16 = SDL_AUDIO_S16LE
	SDL_AUDIO_S32 = SDL_AUDIO_S32LE
	SDL_AUDIO_F32 = SDL_AUDIO_F32LE
	#else
    SDL_AUDIO_S16 = SDL_AUDIO_S16BE
    SDL_AUDIO_S32 = SDL_AUDIO_S32BE
	SDL_AUDIO_F32 = SDL_AUDIO_F32BE
	#endif
end enum

#define SDL_AUDIO_BITSIZE(x)        (x and SDL_AUDIO_MASK_BITSIZE)
#define SDL_AUDIO_BYTESIZE(x)       (SDL_AUDIO_BITSIZE(x) / 8)
#define SDL_AUDIO_ISFLOAT(x)        (x and SDL_AUDIO_MASK_FLOAT)
#define SDL_AUDIO_ISBIGENDIAN(x)    (x and SDL_AUDIO_MASK_BIG_ENDIAN)
#define SDL_AUDIO_ISLITTLEENDIAN(x) (SDL_AUDIO_ISBIGENDIAN(x) = 0)
#define SDL_AUDIO_ISSIGNED(x)       (x and SDL_AUDIO_MASK_SIGNED)
#define SDL_AUDIO_ISINT(x)          (SDL_AUDIO_ISFLOAT(x) = 0)
#define SDL_AUDIO_ISUNSIGNED(x)     (SDL_AUDIO_ISSIGNED(x) = 0)

type SDL_AudioDeviceID as Uint32

const SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK = cast(SDL_AudioDeviceID, &hFFFFFFFFu)
const SDL_AUDIO_DEVICE_DEFAULT_RECORDING = cast(SDL_AudioDeviceID, &hFFFFFFFEu)

type SDL_AudioSpec
	format as SDL_AudioFormat
	channels as long
	freq as long
end type

#define SDL_AUDIO_FRAMESIZE(x) (SDL_AUDIO_BYTESIZE((x).format) * (x).channels)

type SDL_AudioStream as _SDL_AudioStream

declare function SDL_GetNumAudioDrivers() as long
declare function SDL_GetAudioDriver(byval index as long) as const zstring ptr
declare function SDL_GetCurrentAudioDriver() as const zstring ptr
declare function SDL_GetAudioPlaybackDevices(byval count as long ptr) as SDL_AudioDeviceID ptr
declare function SDL_GetAudioRecordingDevices(byval count as long ptr) as SDL_AudioDeviceID ptr
declare function SDL_GetAudioDeviceName(byval devid as SDL_AudioDeviceID) as const zstring ptr
declare function SDL_GetAudioDeviceFormat(byval devid as SDL_AudioDeviceID, byval spec as SDL_AudioSpec ptr, byval sample_frames as long ptr) as boolean
declare function SDL_GetAudioDeviceChannelMap(byval devid as SDL_AudioDeviceID, byval count as long ptr) as long ptr
declare function SDL_OpenAudioDevice(byval devid as SDL_AudioDeviceID, byval spec as const SDL_AudioSpec ptr) as SDL_AudioDeviceID
declare function SDL_IsAudioDevicePhysical(byval devid as SDL_AudioDeviceID) as boolean
declare function SDL_IsAudioDevicePlayback(byval devid as SDL_AudioDeviceID) as boolean
declare function SDL_PauseAudioDevice(byval devid as SDL_AudioDeviceID) as boolean
declare function SDL_ResumeAudioDevice(byval devid as SDL_AudioDeviceID) as boolean
declare function SDL_AudioDevicePaused(byval devid as SDL_AudioDeviceID) as boolean
declare function SDL_GetAudioDeviceGain(byval devid as SDL_AudioDeviceID) as single
declare function SDL_SetAudioDeviceGain(byval devid as SDL_AudioDeviceID, byval gain as single) as boolean
declare sub SDL_CloseAudioDevice(byval devid as SDL_AudioDeviceID)
declare function SDL_BindAudioStreams(byval devid as SDL_AudioDeviceID, byval streams as const SDL_AudioStream ptr ptr, byval num_streams as long) as boolean
declare function SDL_BindAudioStream(byval devid as SDL_AudioDeviceID, byval stream as SDL_AudioStream ptr) as boolean
declare sub SDL_UnbindAudioStreams(byval streams as const SDL_AudioStream ptr ptr, byval num_streams as long)
declare sub SDL_UnbindAudioStream(byval stream as SDL_AudioStream ptr)
declare function SDL_GetAudioStreamDevice(byval stream as SDL_AudioStream ptr) as SDL_AudioDeviceID
declare function SDL_CreateAudioStream(byval src_spec as const SDL_AudioSpec ptr, byval dst_spec as const SDL_AudioSpec ptr) as SDL_AudioStream ptr
declare function SDL_GetAudioStreamProperties(byval stream as SDL_AudioStream ptr) as SDL_PropertiesID
declare function SDL_GetAudioStreamFormat(byval stream as SDL_AudioStream ptr, byval src_spec as SDL_AudioSpec ptr, byval dst_spec as SDL_AudioSpec ptr) as boolean
declare function SDL_SetAudioStreamFormat(byval stream as SDL_AudioStream ptr, byval src_spec as const SDL_AudioSpec ptr, byval dst_spec as const SDL_AudioSpec ptr) as boolean
declare function SDL_GetAudioStreamFrequencyRatio(byval stream as SDL_AudioStream ptr) as single
declare function SDL_SetAudioStreamFrequencyRatio(byval stream as SDL_AudioStream ptr, byval ratio as single) as boolean
declare function SDL_GetAudioStreamGain(byval stream as SDL_AudioStream ptr) as single
declare function SDL_SetAudioStreamGain(byval stream as SDL_AudioStream ptr, byval gain as single) as boolean
declare function SDL_GetAudioStreamInputChannelMap(byval stream as SDL_AudioStream ptr, byval count as long ptr) as long ptr
declare function SDL_GetAudioStreamOutputChannelMap(byval stream as SDL_AudioStream ptr, byval count as long ptr) as long ptr
declare function SDL_SetAudioStreamInputChannelMap(byval stream as SDL_AudioStream ptr, byval chmap as const long ptr, byval count as long) as boolean
declare function SDL_SetAudioStreamOutputChannelMap(byval stream as SDL_AudioStream ptr, byval chmap as const long ptr, byval count as long) as boolean
declare function SDL_PutAudioStreamData(byval stream as SDL_AudioStream ptr, byval buf as const any ptr, byval len as long) as boolean
declare function SDL_GetAudioStreamData(byval stream as SDL_AudioStream ptr, byval buf as any ptr, byval len as long) as long
declare function SDL_GetAudioStreamAvailable(byval stream as SDL_AudioStream ptr) as long
declare function SDL_GetAudioStreamQueued(byval stream as SDL_AudioStream ptr) as long
declare function SDL_FlushAudioStream(byval stream as SDL_AudioStream ptr) as boolean
declare function SDL_ClearAudioStream(byval stream as SDL_AudioStream ptr) as boolean
declare function SDL_PauseAudioStreamDevice(byval stream as SDL_AudioStream ptr) as boolean
declare function SDL_ResumeAudioStreamDevice(byval stream as SDL_AudioStream ptr) as boolean
declare function SDL_AudioStreamDevicePaused(byval stream as SDL_AudioStream ptr) as boolean
declare function SDL_LockAudioStream(byval stream as SDL_AudioStream ptr) as boolean
declare function SDL_UnlockAudioStream(byval stream as SDL_AudioStream ptr) as boolean

type SDL_AudioStreamCallback as sub(byval userdata as any ptr, byval stream as SDL_AudioStream ptr, byval additional_amount as long, byval total_amount as long)

declare function SDL_SetAudioStreamGetCallback(byval stream as SDL_AudioStream ptr, byval callback as SDL_AudioStreamCallback, byval userdata as any ptr) as boolean
declare function SDL_SetAudioStreamPutCallback(byval stream as SDL_AudioStream ptr, byval callback as SDL_AudioStreamCallback, byval userdata as any ptr) as boolean
declare sub SDL_DestroyAudioStream(byval stream as SDL_AudioStream ptr)
declare function SDL_OpenAudioDeviceStream(byval devid as SDL_AudioDeviceID, byval spec as const SDL_AudioSpec ptr, byval callback as SDL_AudioStreamCallback, byval userdata as any ptr) as SDL_AudioStream ptr

type SDL_AudioPostmixCallback as sub(byval userdata as any ptr, byval spec as const SDL_AudioSpec ptr, byval buffer as single ptr, byval buflen as long)

declare function SDL_SetAudioPostmixCallback(byval devid as SDL_AudioDeviceID, byval callback as SDL_AudioPostmixCallback, byval userdata as any ptr) as boolean
declare function SDL_LoadWAV_IO(byval src as SDL_IOStream ptr, byval closeio as boolean, byval spec as SDL_AudioSpec ptr, byval audio_buf as Uint8 ptr ptr, byval audio_len as Uint32 ptr) as boolean
declare function SDL_LoadWAV(byval path as const zstring ptr, byval spec as SDL_AudioSpec ptr, byval audio_buf as Uint8 ptr ptr, byval audio_len as Uint32 ptr) as boolean
declare function SDL_MixAudio(byval dst as Uint8 ptr, byval src as const Uint8 ptr, byval format as SDL_AudioFormat, byval len as Uint32, byval volume as single) as boolean
declare function SDL_ConvertAudioSamples(byval src_spec as const SDL_AudioSpec ptr, byval src_data as const Uint8 ptr, byval src_len as long, byval dst_spec as const SDL_AudioSpec ptr, byval dst_data as Uint8 ptr ptr, byval dst_len as long ptr) as boolean
declare function SDL_GetAudioFormatName(byval format as SDL_AudioFormat) as const zstring ptr
declare function SDL_GetSilenceValueForFormat(byval format as SDL_AudioFormat) as long

end extern
