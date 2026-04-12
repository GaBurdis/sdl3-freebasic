#pragma once

extern "C"

type SDL_Point
	x as long
	y as long
end type

type SDL_FPoint
	x as single
	y as single
end type

type SDL_Rect
	x as long
	y as long
	w as long
	h as long
end type

type SDL_FRect
	x as single
	y as single
	w as single
	h as single
end type

private sub SDL_RectToFRect(byval rect as const SDL_Rect ptr, byval frect as SDL_FRect ptr)
	frect->x = SDL_static_cast(CSng, rect->x)
	frect->y = SDL_static_cast(CSng, rect->y)
	frect->w = SDL_static_cast(CSng, rect->w)
	frect->h = SDL_static_cast(CSng, rect->h)
end sub

private function SDL_PointInRect(byval p as const SDL_Point ptr, byval r as const SDL_Rect ptr) as boolean
	return iif(((((p andalso r) andalso (p->x >= r->x)) andalso (p->x < (r->x + r->w))) andalso (p->y >= r->y)) andalso (p->y < (r->y + r->h)), true, false)
end function

private function SDL_RectEmpty(byval r as const SDL_Rect ptr) as boolean
	return iif(((r = 0) orelse (r->w <= 0)) orelse (r->h <= 0), true, false)
end function

private function SDL_RectsEqual(byval a as const SDL_Rect ptr, byval b as const SDL_Rect ptr) as boolean
	return iif(((((a andalso b) andalso (a->x = b->x)) andalso (a->y = b->y)) andalso (a->w = b->w)) andalso (a->h = b->h), true, false)
end function

declare function SDL_HasRectIntersection(byval A as const SDL_Rect ptr, byval B as const SDL_Rect ptr) as boolean
declare function SDL_GetRectIntersection(byval A as const SDL_Rect ptr, byval B as const SDL_Rect ptr, byval result as SDL_Rect ptr) as boolean
declare function SDL_GetRectUnion(byval A as const SDL_Rect ptr, byval B as const SDL_Rect ptr, byval result as SDL_Rect ptr) as boolean
declare function SDL_GetRectEnclosingPoints(byval points as const SDL_Point ptr, byval count as long, byval clip as const SDL_Rect ptr, byval result as SDL_Rect ptr) as boolean
declare function SDL_GetRectAndLineIntersection(byval rect as const SDL_Rect ptr, byval X1 as long ptr, byval Y1 as long ptr, byval X2 as long ptr, byval Y2 as long ptr) as boolean

private function SDL_PointInRectFloat(byval p as const SDL_FPoint ptr, byval r as const SDL_FRect ptr) as boolean
	return iif(((((p andalso r) andalso (p->x >= r->x)) andalso (p->x <= (r->x + r->w))) andalso (p->y >= r->y)) andalso (p->y <= (r->y + r->h)), true, false)
end function

private function SDL_RectEmptyFloat(byval r as const SDL_FRect ptr) as boolean
	return iif(((r = 0) orelse (r->w < 0.0f)) orelse (r->h < 0.0f), true, false)
end function

private function SDL_RectsEqualEpsilon(byval a as const SDL_FRect ptr, byval b as const SDL_FRect ptr, byval epsilon as const single) as boolean
	return iif((a andalso b) andalso ((a = b) orelse ((((SDL_fabsf(a->x - b->x) <= epsilon) andalso (SDL_fabsf(a->y - b->y) <= epsilon)) andalso (SDL_fabsf(a->w - b->w) <= epsilon)) andalso (SDL_fabsf(a->h - b->h) <= epsilon))), true, false)
end function

private function SDL_RectsEqualFloat(byval a as const SDL_FRect ptr, byval b as const SDL_FRect ptr) as boolean
  return SDL_RectsEqualEpsilon(a, b, SDL_FLT_EPSILON)
end function

declare function SDL_HasRectIntersectionFloat(byval A as const SDL_FRect ptr, byval B as const SDL_FRect ptr) as boolean
declare function SDL_GetRectIntersectionFloat(byval A as const SDL_FRect ptr, byval B as const SDL_FRect ptr, byval result as SDL_FRect ptr) as boolean
declare function SDL_GetRectUnionFloat(byval A as const SDL_FRect ptr, byval B as const SDL_FRect ptr, byval result as SDL_FRect ptr) as boolean
declare function SDL_GetRectEnclosingPointsFloat(byval points as const SDL_FPoint ptr, byval count as long, byval clip as const SDL_FRect ptr, byval result as SDL_FRect ptr) as boolean
declare function SDL_GetRectAndLineIntersectionFloat(byval rect as const SDL_FRect ptr, byval X1 as single ptr, byval Y1 as single ptr, byval X2 as single ptr, byval Y2 as single ptr) as boolean

end extern
