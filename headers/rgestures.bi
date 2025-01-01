#pragma once

#include once "stdbool.bi"

extern "C"

#define RGESTURES_H
const PI = 3.14159265358979323846
const MAX_TOUCH_POINTS = 8

type Vector2
	x as single
	y as single
end type

type TouchAction as long
enum
	TOUCH_ACTION_UP = 0
	TOUCH_ACTION_DOWN
	TOUCH_ACTION_MOVE
	TOUCH_ACTION_CANCEL
end enum

type GestureEvent
	touchAction as long
	pointCount as long
	pointId(0 to 7) as long
	position(0 to 7) as Vector2
end type

declare sub ProcessGestureEvent(byval event as GestureEvent)
declare sub UpdateGestures()

end extern
