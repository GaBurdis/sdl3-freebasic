#pragma once

extern "C"

private function SDL_MostSignificantBitIndex32(byval x as Uint32) as long
'#ifdef(__GNUC__) and (__GNUC__ >= 4 or (__GNUC__ = 3 and __GNUC_MINOR__ >= 4))
'	if x = 0 then
'		return -1
'	end if
'	return 31 - __builtin_clz(x)
'#elseif defined(__WATCOMC__) and defined(__386__)
'  if x = 0 then
'		return -1
'	end if
'	return _SDL_bsr_watcom(x)
'#else
  dim as const Uint32 b(0 to 4) = {&h2, &hC, &hF0, &hFF00, &hFFFF0000}
  dim as const long S(0 to 4) = {1, 2, 4, 8, 16}

  dim as long msbIndex
  dim as long i

  if (x = 0) then
    return -1
  end if

  for i as long = 4 to 0 step -1
    if (x and b(i)) then
      x shr= S(i)
      msbIndex or= S(i)
    end if
  next

  return msbIndex
'#endif
end function

private function SDL_HasExactlyOneBitSet32(byval x as Uint32) as boolean
	if x andalso ((x and (x - 1)) = 0) then
		return true
	end if
	return false
end function

end extern
