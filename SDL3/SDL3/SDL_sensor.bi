#pragma once

extern "C"

type SDL_Sensor as _SDL_Sensor
type SDL_SensorID as Uint32

const SDL_STANDARD_GRAVITY = 9.80665f

type SDL_SensorType as long
enum
	SDL_SENSOR_INVALID = -1
	SDL_SENSOR_UNKNOWN
	SDL_SENSOR_ACCEL
	SDL_SENSOR_GYRO
	SDL_SENSOR_ACCEL_L
	SDL_SENSOR_GYRO_L
	SDL_SENSOR_ACCEL_R
	SDL_SENSOR_GYRO_R
    SDL_SENSOR_COUNT
end enum

declare function SDL_GetSensors(byval count as long ptr) as SDL_SensorID ptr
declare function SDL_GetSensorNameForID(byval instance_id as SDL_SensorID) as const zstring ptr
declare function SDL_GetSensorTypeForID(byval instance_id as SDL_SensorID) as SDL_SensorType
declare function SDL_GetSensorNonPortableTypeForID(byval instance_id as SDL_SensorID) as long
declare function SDL_OpenSensor(byval instance_id as SDL_SensorID) as SDL_Sensor ptr
declare function SDL_GetSensorFromID(byval instance_id as SDL_SensorID) as SDL_Sensor ptr
declare function SDL_GetSensorProperties(byval sensor as SDL_Sensor ptr) as SDL_PropertiesID
declare function SDL_GetSensorName(byval sensor as SDL_Sensor ptr) as const zstring ptr
declare function SDL_GetSensorType(byval sensor as SDL_Sensor ptr) as SDL_SensorType
declare function SDL_GetSensorNonPortableType(byval sensor as SDL_Sensor ptr) as long
declare function SDL_GetSensorID(byval sensor as SDL_Sensor ptr) as SDL_SensorID
declare function SDL_GetSensorData(byval sensor as SDL_Sensor ptr, byval data as single ptr, byval num_values as long) as boolean
declare sub SDL_CloseSensor(byval sensor as SDL_Sensor ptr)
declare sub SDL_UpdateSensors()

end extern
