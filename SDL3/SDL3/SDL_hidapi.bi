#pragma once

extern "C"

type SDL_hid_device as _SDL_hid_device

type SDL_hid_bus_type as long
enum
	SDL_HID_API_BUS_UNKNOWN = &h00
	SDL_HID_API_BUS_USB = &h01
	SDL_HID_API_BUS_BLUETOOTH = &h02
	SDL_HID_API_BUS_I2C = &h03
	SDL_HID_API_BUS_SPI = &h04
end enum

type SDL_hid_device_info
	path as zstring ptr
	vendor_id as ushort
	product_id as ushort
	serial_number as wstring ptr
	release_number as ushort
	manufacturer_string as wstring ptr
	product_string as wstring ptr
	usage_page as ushort
	usage as ushort
	interface_number as long
	interface_class as long
	interface_subclass as long
	interface_protocol as long
	bus_type as SDL_hid_bus_type
	next as SDL_hid_device_info ptr
end type

declare function SDL_hid_init() as long
declare function SDL_hid_exit() as long
declare function SDL_hid_device_change_count() as Uint32
declare function SDL_hid_enumerate(byval vendor_id as ushort, byval product_id as ushort) as SDL_hid_device_info ptr
declare sub SDL_hid_free_enumeration(byval devs as SDL_hid_device_info ptr)
declare function SDL_hid_open(byval vendor_id as ushort, byval product_id as ushort, byval serial_number as const wstring ptr) as SDL_hid_device ptr
declare function SDL_hid_open_path(byval path as const zstring ptr) as SDL_hid_device ptr
declare function SDL_hid_get_properties(byval dev as SDL_hid_device ptr) as SDL_PropertiesID

#define SDL_PROP_HIDAPI_LIBUSB_DEVICE_HANDLE_POINTER   "SDL.hidapi.libusb.device.handle"

declare function SDL_hid_write(byval dev as SDL_hid_device ptr, byval data as const ubyte ptr, byval length as uinteger) as long
declare function SDL_hid_read_timeout(byval dev as SDL_hid_device ptr, byval data as ubyte ptr, byval length as uinteger, byval milliseconds as long) as long
declare function SDL_hid_read(byval dev as SDL_hid_device ptr, byval data as ubyte ptr, byval length as uinteger) as long
declare function SDL_hid_set_nonblocking(byval dev as SDL_hid_device ptr, byval nonblock as long) as long
declare function SDL_hid_send_feature_report(byval dev as SDL_hid_device ptr, byval data as const ubyte ptr, byval length as uinteger) as long
declare function SDL_hid_get_feature_report(byval dev as SDL_hid_device ptr, byval data as ubyte ptr, byval length as uinteger) as long
declare function SDL_hid_get_input_report(byval dev as SDL_hid_device ptr, byval data as ubyte ptr, byval length as uinteger) as long
declare function SDL_hid_close(byval dev as SDL_hid_device ptr) as long
declare function SDL_hid_get_manufacturer_string(byval dev as SDL_hid_device ptr, byval string as wstring ptr, byval maxlen as uinteger) as long
declare function SDL_hid_get_product_string(byval dev as SDL_hid_device ptr, byval string as wstring ptr, byval maxlen as uinteger) as long
declare function SDL_hid_get_serial_number_string(byval dev as SDL_hid_device ptr, byval string as wstring ptr, byval maxlen as uinteger) as long
declare function SDL_hid_get_indexed_string(byval dev as SDL_hid_device ptr, byval string_index as long, byval string as wstring ptr, byval maxlen as uinteger) as long
declare function SDL_hid_get_device_info(byval dev as SDL_hid_device ptr) as SDL_hid_device_info ptr
declare function SDL_hid_get_report_descriptor(byval dev as SDL_hid_device ptr, byval buf as ubyte ptr, byval buf_size as uinteger) as long
declare sub SDL_hid_ble_scan(byval active as boolean)

end extern
