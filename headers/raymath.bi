#pragma once

#include once "crt/math.bi"

extern "C"

#define RAYMATH_H
'' TODO: #define RMAPI inline
const PI = 3.14159265358979323846f
const EPSILON = 0.000001f
const DEG2RAD = PI / 180.0f
const RAD2DEG = 180.0f / PI
#define MatrixToFloat(mat) MatrixToFloatV(mat).v
#define Vector3ToFloat(vec) Vector3ToFloatV(vec).v

type Vector2
	x as single
	y as single
end type

#define RL_VECTOR2_TYPE

type Vector3
	x as single
	y as single
	z as single
end type

#define RL_VECTOR3_TYPE

type Vector4
	x as single
	y as single
	z as single
	w as single
end type

#define RL_VECTOR4_TYPE
type Quaternion as Vector4
#define RL_QUATERNION_TYPE

type Matrix
	m0 as single
	m4 as single
	m8 as single
	m12 as single
	m1 as single
	m5 as single
	m9 as single
	m13 as single
	m2 as single
	m6 as single
	m10 as single
	m14 as single
	m3 as single
	m7 as single
	m11 as single
	m15 as single
end type

#define RL_MATRIX_TYPE

type float3
	v(0 to 2) as single
end type

type float16
	v(0 to 15) as single
end type

private function Clamp(byval value as single, byval min as single, byval max as single) as single
	dim result as single = iif(value < min, min, value)
	if result > max then
		result = max
	end if
	return result
end function

private function Lerp(byval start as single, byval end as single, byval amount as single) as single
	dim result as single = start + (amount * (end - start))
	return result
end function

private function Normalize(byval value as single, byval start as single, byval end as single) as single
	dim result as single = (value - start) / (end - start)
	return result
end function

private function Remap(byval value as single, byval inputStart as single, byval inputEnd as single, byval outputStart as single, byval outputEnd as single) as single
	dim result as single = (((value - inputStart) / (inputEnd - inputStart)) * (outputEnd - outputStart)) + outputStart
	return result
end function

private function Wrap(byval value as single, byval min as single, byval max as single) as single
	dim result as single = value - ((max - min) * floorf((value - min) / (max - min)))
	return result
end function

private function FloatEquals(byval x as single, byval y as single) as long
	dim result as long = -(fabsf(x - y) <= (0.000001f * fmaxf(1.0f, fmaxf(fabsf(x), fabsf(y)))))
	return result
end function

private function Vector2Zero() as Vector2
	dim result as Vector2 = (0.0f, 0.0f)
	return result
end function

private function Vector2One() as Vector2
	dim result as Vector2 = (1.0f, 1.0f)
	return result
end function

private function Vector2Add(byval v1 as Vector2, byval v2 as Vector2) as Vector2
	dim result as Vector2 = (v1.x + v2.x, v1.y + v2.y)
	return result
end function

private function Vector2AddValue(byval v as Vector2, byval add as single) as Vector2
	dim result as Vector2 = (v.x + add, v.y + add)
	return result
end function

private function Vector2Subtract(byval v1 as Vector2, byval v2 as Vector2) as Vector2
	dim result as Vector2 = (v1.x - v2.x, v1.y - v2.y)
	return result
end function

private function Vector2SubtractValue(byval v as Vector2, byval sub as single) as Vector2
	dim result as Vector2 = (v.x - sub, v.y - sub)
	return result
end function

private function Vector2Length(byval v as Vector2) as single
	dim result as single = sqrtf((v.x * v.x) + (v.y * v.y))
	return result
end function

private function Vector2LengthSqr(byval v as Vector2) as single
	dim result as single = (v.x * v.x) + (v.y * v.y)
	return result
end function

private function Vector2DotProduct(byval v1 as Vector2, byval v2 as Vector2) as single
	dim result as single = (v1.x * v2.x) + (v1.y * v2.y)
	return result
end function

private function Vector2CrossProduct(byval v1 as Vector2, byval v2 as Vector2) as single
	dim result as single = (v1.x * v2.y) - (v1.y * v2.x)
	return result
end function

private function Vector2Distance(byval v1 as Vector2, byval v2 as Vector2) as single
	dim result as single = sqrtf(((v1.x - v2.x) * (v1.x - v2.x)) + ((v1.y - v2.y) * (v1.y - v2.y)))
	return result
end function

private function Vector2DistanceSqr(byval v1 as Vector2, byval v2 as Vector2) as single
	dim result as single = ((v1.x - v2.x) * (v1.x - v2.x)) + ((v1.y - v2.y) * (v1.y - v2.y))
	return result
end function

private function Vector2Angle(byval v1 as Vector2, byval v2 as Vector2) as single
	dim result as single = 0.0f
	dim dot as single = (v1.x * v2.x) + (v1.y * v2.y)
	dim det as single = (v1.x * v2.y) - (v1.y * v2.x)
	result = atan2f(det, dot)
	return result
end function

private function Vector2LineAngle(byval start as Vector2, byval end as Vector2) as single
	dim result as single = 0.0f
	result = -atan2f(end.y - start.y, end.x - start.x)
	return result
end function

private function Vector2Scale(byval v as Vector2, byval scale as single) as Vector2
	dim result as Vector2 = (v.x * scale, v.y * scale)
	return result
end function

private function Vector2Multiply(byval v1 as Vector2, byval v2 as Vector2) as Vector2
	dim result as Vector2 = (v1.x * v2.x, v1.y * v2.y)
	return result
end function

private function Vector2Negate(byval v as Vector2) as Vector2
	dim result as Vector2 = (-v.x, -v.y)
	return result
end function

private function Vector2Divide(byval v1 as Vector2, byval v2 as Vector2) as Vector2
	dim result as Vector2 = (v1.x / v2.x, v1.y / v2.y)
	return result
end function

private function Vector2Normalize(byval v as Vector2) as Vector2
	dim result as Vector2 = (0)
	dim length as single = sqrtf((v.x * v.x) + (v.y * v.y))
	if length > 0 then
		dim ilength as single = 1.0f / length
		result.x = v.x * ilength
		result.y = v.y * ilength
	end if
	return result
end function

private function Vector2Transform(byval v as Vector2, byval mat as Matrix) as Vector2
	dim result as Vector2 = (0)
	dim x as single = v.x
	dim y as single = v.y
	dim z as single = 0
	result.x = (((mat.m0 * x) + (mat.m4 * y)) + (mat.m8 * z)) + mat.m12
	result.y = (((mat.m1 * x) + (mat.m5 * y)) + (mat.m9 * z)) + mat.m13
	return result
end function

private function Vector2Lerp(byval v1 as Vector2, byval v2 as Vector2, byval amount as single) as Vector2
	dim result as Vector2 = (0)
	result.x = v1.x + (amount * (v2.x - v1.x))
	result.y = v1.y + (amount * (v2.y - v1.y))
	return result
end function

private function Vector2Reflect(byval v as Vector2, byval normal as Vector2) as Vector2
	dim result as Vector2 = (0)
	dim dotProduct as single = (v.x * normal.x) + (v.y * normal.y)
	result.x = v.x - ((2.0f * normal.x) * dotProduct)
	result.y = v.y - ((2.0f * normal.y) * dotProduct)
	return result
end function

private function Vector2Min(byval v1 as Vector2, byval v2 as Vector2) as Vector2
	dim result as Vector2 = (0)
	result.x = fminf(v1.x, v2.x)
	result.y = fminf(v1.y, v2.y)
	return result
end function

private function Vector2Max(byval v1 as Vector2, byval v2 as Vector2) as Vector2
	dim result as Vector2 = (0)
	result.x = fmaxf(v1.x, v2.x)
	result.y = fmaxf(v1.y, v2.y)
	return result
end function

private function Vector2Rotate(byval v as Vector2, byval angle as single) as Vector2
	dim result as Vector2 = (0)
	dim cosres as single = cosf(angle)
	dim sinres as single = sinf(angle)
	result.x = (v.x * cosres) - (v.y * sinres)
	result.y = (v.x * sinres) + (v.y * cosres)
	return result
end function

private function Vector2MoveTowards(byval v as Vector2, byval target as Vector2, byval maxDistance as single) as Vector2
	dim result as Vector2 = (0)
	dim dx as single = target.x - v.x
	dim dy as single = target.y - v.y
	dim value as single = (dx * dx) + (dy * dy)
	if (value = 0) orelse ((maxDistance >= 0) andalso (value <= (maxDistance * maxDistance))) then
		return target
	end if
	dim dist as single = sqrtf(value)
	result.x = v.x + ((dx / dist) * maxDistance)
	result.y = v.y + ((dy / dist) * maxDistance)
	return result
end function

private function Vector2Invert(byval v as Vector2) as Vector2
	dim result as Vector2 = (1.0f / v.x, 1.0f / v.y)
	return result
end function

private function Vector2Clamp(byval v as Vector2, byval min as Vector2, byval max as Vector2) as Vector2
	dim result as Vector2 = (0)
	result.x = fminf(max.x, fmaxf(min.x, v.x))
	result.y = fminf(max.y, fmaxf(min.y, v.y))
	return result
end function

private function Vector2ClampValue(byval v as Vector2, byval min as single, byval max as single) as Vector2
	dim result as Vector2 = v
	dim length as single = (v.x * v.x) + (v.y * v.y)
	if length > 0.0f then
		length = sqrtf(length)
		dim scale as single = 1
		if length < min then
			scale = min / length
		elseif length > max then
			scale = max / length
		end if
		result.x = v.x * scale
		result.y = v.y * scale
	end if
	return result
end function

private function Vector2Equals(byval p as Vector2, byval q as Vector2) as long
	dim result as long = -((fabsf(p.x - q.x) <= (0.000001f * fmaxf(1.0f, fmaxf(fabsf(p.x), fabsf(q.x))))) andalso (fabsf(p.y - q.y) <= (0.000001f * fmaxf(1.0f, fmaxf(fabsf(p.y), fabsf(q.y))))))
	return result
end function

private function Vector2Refract(byval v as Vector2, byval n as Vector2, byval r as single) as Vector2
	dim result as Vector2 = (0)
	dim dot as single = (v.x * n.x) + (v.y * n.y)
	dim d as single = 1.0f - ((r * r) * (1.0f - (dot * dot)))
	if d >= 0.0f then
		d = sqrtf(d)
		v.x = (r * v.x) - (((r * dot) + d) * n.x)
		v.y = (r * v.y) - (((r * dot) + d) * n.y)
		result = v
	end if
	return result
end function

private function Vector3Zero() as Vector3
	dim result as Vector3 = (0.0f, 0.0f, 0.0f)
	return result
end function

private function Vector3One() as Vector3
	dim result as Vector3 = (1.0f, 1.0f, 1.0f)
	return result
end function

private function Vector3Add(byval v1 as Vector3, byval v2 as Vector3) as Vector3
	dim result as Vector3 = (v1.x + v2.x, v1.y + v2.y, v1.z + v2.z)
	return result
end function

private function Vector3AddValue(byval v as Vector3, byval add as single) as Vector3
	dim result as Vector3 = (v.x + add, v.y + add, v.z + add)
	return result
end function

private function Vector3Subtract(byval v1 as Vector3, byval v2 as Vector3) as Vector3
	dim result as Vector3 = (v1.x - v2.x, v1.y - v2.y, v1.z - v2.z)
	return result
end function

private function Vector3SubtractValue(byval v as Vector3, byval sub as single) as Vector3
	dim result as Vector3 = (v.x - sub, v.y - sub, v.z - sub)
	return result
end function

private function Vector3Scale(byval v as Vector3, byval scalar as single) as Vector3
	dim result as Vector3 = (v.x * scalar, v.y * scalar, v.z * scalar)
	return result
end function

private function Vector3Multiply(byval v1 as Vector3, byval v2 as Vector3) as Vector3
	dim result as Vector3 = (v1.x * v2.x, v1.y * v2.y, v1.z * v2.z)
	return result
end function

private function Vector3CrossProduct(byval v1 as Vector3, byval v2 as Vector3) as Vector3
	dim result as Vector3 = ((v1.y * v2.z) - (v1.z * v2.y), (v1.z * v2.x) - (v1.x * v2.z), (v1.x * v2.y) - (v1.y * v2.x))
	return result
end function

private function Vector3Perpendicular(byval v as Vector3) as Vector3
	dim result as Vector3 = (0)
	dim min as single = fabsf(v.x)
	dim cardinalAxis as Vector3 = (1.0f, 0.0f, 0.0f)
	if fabsf(v.y) < min then
		min = fabsf(v.y)
		dim tmp as Vector3 = (0.0f, 1.0f, 0.0f)
		cardinalAxis = tmp
	end if
	if fabsf(v.z) < min then
		dim tmp as Vector3 = (0.0f, 0.0f, 1.0f)
		cardinalAxis = tmp
	end if
	result.x = (v.y * cardinalAxis.z) - (v.z * cardinalAxis.y)
	result.y = (v.z * cardinalAxis.x) - (v.x * cardinalAxis.z)
	result.z = (v.x * cardinalAxis.y) - (v.y * cardinalAxis.x)
	return result
end function

private function Vector3Length(byval v as const Vector3) as single
	dim result as single = sqrtf(((v.x * v.x) + (v.y * v.y)) + (v.z * v.z))
	return result
end function

private function Vector3LengthSqr(byval v as const Vector3) as single
	dim result as single = ((v.x * v.x) + (v.y * v.y)) + (v.z * v.z)
	return result
end function

private function Vector3DotProduct(byval v1 as Vector3, byval v2 as Vector3) as single
	dim result as single = ((v1.x * v2.x) + (v1.y * v2.y)) + (v1.z * v2.z)
	return result
end function

private function Vector3Distance(byval v1 as Vector3, byval v2 as Vector3) as single
	dim result as single = 0.0f
	dim dx as single = v2.x - v1.x
	dim dy as single = v2.y - v1.y
	dim dz as single = v2.z - v1.z
	result = sqrtf(((dx * dx) + (dy * dy)) + (dz * dz))
	return result
end function

private function Vector3DistanceSqr(byval v1 as Vector3, byval v2 as Vector3) as single
	dim result as single = 0.0f
	dim dx as single = v2.x - v1.x
	dim dy as single = v2.y - v1.y
	dim dz as single = v2.z - v1.z
	result = ((dx * dx) + (dy * dy)) + (dz * dz)
	return result
end function

private function Vector3Angle(byval v1 as Vector3, byval v2 as Vector3) as single
	dim result as single = 0.0f
	dim cross as Vector3 = ((v1.y * v2.z) - (v1.z * v2.y), (v1.z * v2.x) - (v1.x * v2.z), (v1.x * v2.y) - (v1.y * v2.x))
	dim len as single = sqrtf(((cross.x * cross.x) + (cross.y * cross.y)) + (cross.z * cross.z))
	dim dot as single = ((v1.x * v2.x) + (v1.y * v2.y)) + (v1.z * v2.z)
	result = atan2f(len, dot)
	return result
end function

private function Vector3Negate(byval v as Vector3) as Vector3
	dim result as Vector3 = (-v.x, -v.y, -v.z)
	return result
end function

private function Vector3Divide(byval v1 as Vector3, byval v2 as Vector3) as Vector3
	dim result as Vector3 = (v1.x / v2.x, v1.y / v2.y, v1.z / v2.z)
	return result
end function

private function Vector3Normalize(byval v as Vector3) as Vector3
	dim result as Vector3 = v
	dim length as single = sqrtf(((v.x * v.x) + (v.y * v.y)) + (v.z * v.z))
	if length <> 0.0f then
		dim ilength as single = 1.0f / length
		result.x *= ilength
		result.y *= ilength
		result.z *= ilength
	end if
	return result
end function

private function Vector3Project(byval v1 as Vector3, byval v2 as Vector3) as Vector3
	dim result as Vector3 = (0)
	dim v1dv2 as single = ((v1.x * v2.x) + (v1.y * v2.y)) + (v1.z * v2.z)
	dim v2dv2 as single = ((v2.x * v2.x) + (v2.y * v2.y)) + (v2.z * v2.z)
	dim mag as single = v1dv2 / v2dv2
	result.x = v2.x * mag
	result.y = v2.y * mag
	result.z = v2.z * mag
	return result
end function

private function Vector3Reject(byval v1 as Vector3, byval v2 as Vector3) as Vector3
	dim result as Vector3 = (0)
	dim v1dv2 as single = ((v1.x * v2.x) + (v1.y * v2.y)) + (v1.z * v2.z)
	dim v2dv2 as single = ((v2.x * v2.x) + (v2.y * v2.y)) + (v2.z * v2.z)
	dim mag as single = v1dv2 / v2dv2
	result.x = v1.x - (v2.x * mag)
	result.y = v1.y - (v2.y * mag)
	result.z = v1.z - (v2.z * mag)
	return result
end function

private sub Vector3OrthoNormalize(byval v1 as Vector3 ptr, byval v2 as Vector3 ptr)
	dim length as single = 0.0f
	dim ilength as single = 0.0f
	dim v as Vector3 = *v1
	length = sqrtf(((v.x * v.x) + (v.y * v.y)) + (v.z * v.z))
	if length = 0.0f then
		length = 1.0f
	end if
	ilength = 1.0f / length
	v1->x *= ilength
	v1->y *= ilength
	v1->z *= ilength
	dim vn1 as Vector3 = ((v1->y * v2->z) - (v1->z * v2->y), (v1->z * v2->x) - (v1->x * v2->z), (v1->x * v2->y) - (v1->y * v2->x))
	v = vn1
	length = sqrtf(((v.x * v.x) + (v.y * v.y)) + (v.z * v.z))
	if length = 0.0f then
		length = 1.0f
	end if
	ilength = 1.0f / length
	vn1.x *= ilength
	vn1.y *= ilength
	vn1.z *= ilength
	dim vn2 as Vector3 = ((vn1.y * v1->z) - (vn1.z * v1->y), (vn1.z * v1->x) - (vn1.x * v1->z), (vn1.x * v1->y) - (vn1.y * v1->x))
	(*v2) = vn2
end sub

private function Vector3Transform(byval v as Vector3, byval mat as Matrix) as Vector3
	dim result as Vector3 = (0)
	dim x as single = v.x
	dim y as single = v.y
	dim z as single = v.z
	result.x = (((mat.m0 * x) + (mat.m4 * y)) + (mat.m8 * z)) + mat.m12
	result.y = (((mat.m1 * x) + (mat.m5 * y)) + (mat.m9 * z)) + mat.m13
	result.z = (((mat.m2 * x) + (mat.m6 * y)) + (mat.m10 * z)) + mat.m14
	return result
end function

private function Vector3RotateByQuaternion(byval v as Vector3, byval q as Quaternion) as Vector3
	dim result as Vector3 = (0)
	result.x = ((v.x * ((((q.x * q.x) + (q.w * q.w)) - (q.y * q.y)) - (q.z * q.z))) + (v.y * (((2 * q.x) * q.y) - ((2 * q.w) * q.z)))) + (v.z * (((2 * q.x) * q.z) + ((2 * q.w) * q.y)))
	result.y = ((v.x * (((2 * q.w) * q.z) + ((2 * q.x) * q.y))) + (v.y * ((((q.w * q.w) - (q.x * q.x)) + (q.y * q.y)) - (q.z * q.z)))) + (v.z * ((((-2) * q.w) * q.x) + ((2 * q.y) * q.z)))
	result.z = ((v.x * ((((-2) * q.w) * q.y) + ((2 * q.x) * q.z))) + (v.y * (((2 * q.w) * q.x) + ((2 * q.y) * q.z)))) + (v.z * ((((q.w * q.w) - (q.x * q.x)) - (q.y * q.y)) + (q.z * q.z)))
	return result
end function

private function Vector3RotateByAxisAngle(byval v as Vector3, byval axis as Vector3, byval angle as single) as Vector3
	dim result as Vector3 = v
	dim length as single = sqrtf(((axis.x * axis.x) + (axis.y * axis.y)) + (axis.z * axis.z))
	if length = 0.0f then
		length = 1.0f
	end if
	dim ilength as single = 1.0f / length
	axis.x *= ilength
	axis.y *= ilength
	axis.z *= ilength
	angle /= 2.0f
	dim a as single = sinf(angle)
	dim b as single = axis.x * a
	dim c as single = axis.y * a
	dim d as single = axis.z * a
	a = cosf(angle)
	dim w as Vector3 = (b, c, d)
	dim wv as Vector3 = ((w.y * v.z) - (w.z * v.y), (w.z * v.x) - (w.x * v.z), (w.x * v.y) - (w.y * v.x))
	dim wwv as Vector3 = ((w.y * wv.z) - (w.z * wv.y), (w.z * wv.x) - (w.x * wv.z), (w.x * wv.y) - (w.y * wv.x))
	a *= 2
	wv.x *= a
	wv.y *= a
	wv.z *= a
	wwv.x *= 2
	wwv.y *= 2
	wwv.z *= 2
	result.x += wv.x
	result.y += wv.y
	result.z += wv.z
	result.x += wwv.x
	result.y += wwv.y
	result.z += wwv.z
	return result
end function

private function Vector3MoveTowards(byval v as Vector3, byval target as Vector3, byval maxDistance as single) as Vector3
	dim result as Vector3 = (0)
	dim dx as single = target.x - v.x
	dim dy as single = target.y - v.y
	dim dz as single = target.z - v.z
	dim value as single = ((dx * dx) + (dy * dy)) + (dz * dz)
	if (value = 0) orelse ((maxDistance >= 0) andalso (value <= (maxDistance * maxDistance))) then
		return target
	end if
	dim dist as single = sqrtf(value)
	result.x = v.x + ((dx / dist) * maxDistance)
	result.y = v.y + ((dy / dist) * maxDistance)
	result.z = v.z + ((dz / dist) * maxDistance)
	return result
end function

private function Vector3Lerp(byval v1 as Vector3, byval v2 as Vector3, byval amount as single) as Vector3
	dim result as Vector3 = (0)
	result.x = v1.x + (amount * (v2.x - v1.x))
	result.y = v1.y + (amount * (v2.y - v1.y))
	result.z = v1.z + (amount * (v2.z - v1.z))
	return result
end function

private function Vector3CubicHermite(byval v1 as Vector3, byval tangent1 as Vector3, byval v2 as Vector3, byval tangent2 as Vector3, byval amount as single) as Vector3
	dim result as Vector3 = (0)
	dim amountPow2 as single = amount * amount
	dim amountPow3 as single = (amount * amount) * amount
	result.x = ((((((2 * amountPow3) - (3 * amountPow2)) + 1) * v1.x) + (((amountPow3 - (2 * amountPow2)) + amount) * tangent1.x)) + ((((-2) * amountPow3) + (3 * amountPow2)) * v2.x)) + ((amountPow3 - amountPow2) * tangent2.x)
	result.y = ((((((2 * amountPow3) - (3 * amountPow2)) + 1) * v1.y) + (((amountPow3 - (2 * amountPow2)) + amount) * tangent1.y)) + ((((-2) * amountPow3) + (3 * amountPow2)) * v2.y)) + ((amountPow3 - amountPow2) * tangent2.y)
	result.z = ((((((2 * amountPow3) - (3 * amountPow2)) + 1) * v1.z) + (((amountPow3 - (2 * amountPow2)) + amount) * tangent1.z)) + ((((-2) * amountPow3) + (3 * amountPow2)) * v2.z)) + ((amountPow3 - amountPow2) * tangent2.z)
	return result
end function

private function Vector3Reflect(byval v as Vector3, byval normal as Vector3) as Vector3
	dim result as Vector3 = (0)
	dim dotProduct as single = ((v.x * normal.x) + (v.y * normal.y)) + (v.z * normal.z)
	result.x = v.x - ((2.0f * normal.x) * dotProduct)
	result.y = v.y - ((2.0f * normal.y) * dotProduct)
	result.z = v.z - ((2.0f * normal.z) * dotProduct)
	return result
end function

private function Vector3Min(byval v1 as Vector3, byval v2 as Vector3) as Vector3
	dim result as Vector3 = (0)
	result.x = fminf(v1.x, v2.x)
	result.y = fminf(v1.y, v2.y)
	result.z = fminf(v1.z, v2.z)
	return result
end function

private function Vector3Max(byval v1 as Vector3, byval v2 as Vector3) as Vector3
	dim result as Vector3 = (0)
	result.x = fmaxf(v1.x, v2.x)
	result.y = fmaxf(v1.y, v2.y)
	result.z = fmaxf(v1.z, v2.z)
	return result
end function

private function Vector3Barycenter(byval p as Vector3, byval a as Vector3, byval b as Vector3, byval c as Vector3) as Vector3
	dim result as Vector3 = (0)
	dim v0 as Vector3 = (b.x - a.x, b.y - a.y, b.z - a.z)
	dim v1 as Vector3 = (c.x - a.x, c.y - a.y, c.z - a.z)
	dim v2 as Vector3 = (p.x - a.x, p.y - a.y, p.z - a.z)
	dim d00 as single = ((v0.x * v0.x) + (v0.y * v0.y)) + (v0.z * v0.z)
	dim d01 as single = ((v0.x * v1.x) + (v0.y * v1.y)) + (v0.z * v1.z)
	dim d11 as single = ((v1.x * v1.x) + (v1.y * v1.y)) + (v1.z * v1.z)
	dim d20 as single = ((v2.x * v0.x) + (v2.y * v0.y)) + (v2.z * v0.z)
	dim d21 as single = ((v2.x * v1.x) + (v2.y * v1.y)) + (v2.z * v1.z)
	dim denom as single = (d00 * d11) - (d01 * d01)
	result.y = ((d11 * d20) - (d01 * d21)) / denom
	result.z = ((d00 * d21) - (d01 * d20)) / denom
	result.x = 1.0f - (result.z + result.y)
	return result
end function

private function Vector3Unproject(byval source as Vector3, byval projection as Matrix, byval view as Matrix) as Vector3
	dim result as Vector3 = (0)
	dim matViewProj as Matrix = ((((view.m0 * projection.m0) + (view.m1 * projection.m4)) + (view.m2 * projection.m8)) + (view.m3 * projection.m12), (((view.m0 * projection.m1) + (view.m1 * projection.m5)) + (view.m2 * projection.m9)) + (view.m3 * projection.m13), (((view.m0 * projection.m2) + (view.m1 * projection.m6)) + (view.m2 * projection.m10)) + (view.m3 * projection.m14), (((view.m0 * projection.m3) + (view.m1 * projection.m7)) + (view.m2 * projection.m11)) + (view.m3 * projection.m15), (((view.m4 * projection.m0) + (view.m5 * projection.m4)) + (view.m6 * projection.m8)) + (view.m7 * projection.m12), (((view.m4 * projection.m1) + (view.m5 * projection.m5)) + (view.m6 * projection.m9)) + (view.m7 * projection.m13), (((view.m4 * projection.m2) + (view.m5 * projection.m6)) + (view.m6 * projection.m10)) + (view.m7 * projection.m14), (((view.m4 * projection.m3) + (view.m5 * projection.m7)) + (view.m6 * projection.m11)) + (view.m7 * projection.m15), (((view.m8 * projection.m0) + (view.m9 * projection.m4)) + (view.m10 * projection.m8)) + (view.m11 * projection.m12), (((view.m8 * projection.m1) + (view.m9 * projection.m5)) + (view.m10 * projection.m9)) + (view.m11 * projection.m13), (((view.m8 * projection.m2) + (view.m9 * projection.m6)) + (view.m10 * projection.m10)) + (view.m11 * projection.m14), (((view.m8 * projection.m3) + (view.m9 * projection.m7)) + (view.m10 * projection.m11)) + (view.m11 * projection.m15), (((view.m12 * projection.m0) + (view.m13 * projection.m4)) + (view.m14 * projection.m8)) + (view.m15 * projection.m12), (((view.m12 * projection.m1) + (view.m13 * projection.m5)) + (view.m14 * projection.m9)) + (view.m15 * projection.m13), (((view.m12 * projection.m2) + (view.m13 * projection.m6)) + (view.m14 * projection.m10)) + (view.m15 * projection.m14), (((view.m12 * projection.m3) + (view.m13 * projection.m7)) + (view.m14 * projection.m11)) + (view.m15 * projection.m15))
	dim a00 as single = matViewProj.m0
	dim a01 as single = matViewProj.m1
	dim a02 as single = matViewProj.m2
	dim a03 as single = matViewProj.m3
	dim a10 as single = matViewProj.m4
	dim a11 as single = matViewProj.m5
	dim a12 as single = matViewProj.m6
	dim a13 as single = matViewProj.m7
	dim a20 as single = matViewProj.m8
	dim a21 as single = matViewProj.m9
	dim a22 as single = matViewProj.m10
	dim a23 as single = matViewProj.m11
	dim a30 as single = matViewProj.m12
	dim a31 as single = matViewProj.m13
	dim a32 as single = matViewProj.m14
	dim a33 as single = matViewProj.m15
	dim b00 as single = (a00 * a11) - (a01 * a10)
	dim b01 as single = (a00 * a12) - (a02 * a10)
	dim b02 as single = (a00 * a13) - (a03 * a10)
	dim b03 as single = (a01 * a12) - (a02 * a11)
	dim b04 as single = (a01 * a13) - (a03 * a11)
	dim b05 as single = (a02 * a13) - (a03 * a12)
	dim b06 as single = (a20 * a31) - (a21 * a30)
	dim b07 as single = (a20 * a32) - (a22 * a30)
	dim b08 as single = (a20 * a33) - (a23 * a30)
	dim b09 as single = (a21 * a32) - (a22 * a31)
	dim b10 as single = (a21 * a33) - (a23 * a31)
	dim b11 as single = (a22 * a33) - (a23 * a32)
	dim invDet as single = 1.0f / ((((((b00 * b11) - (b01 * b10)) + (b02 * b09)) + (b03 * b08)) - (b04 * b07)) + (b05 * b06))
	dim matViewProjInv as Matrix = ((((a11 * b11) - (a12 * b10)) + (a13 * b09)) * invDet, ((((-a01) * b11) + (a02 * b10)) - (a03 * b09)) * invDet, (((a31 * b05) - (a32 * b04)) + (a33 * b03)) * invDet, ((((-a21) * b05) + (a22 * b04)) - (a23 * b03)) * invDet, ((((-a10) * b11) + (a12 * b08)) - (a13 * b07)) * invDet, (((a00 * b11) - (a02 * b08)) + (a03 * b07)) * invDet, ((((-a30) * b05) + (a32 * b02)) - (a33 * b01)) * invDet, (((a20 * b05) - (a22 * b02)) + (a23 * b01)) * invDet, (((a10 * b10) - (a11 * b08)) + (a13 * b06)) * invDet, ((((-a00) * b10) + (a01 * b08)) - (a03 * b06)) * invDet, (((a30 * b04) - (a31 * b02)) + (a33 * b00)) * invDet, ((((-a20) * b04) + (a21 * b02)) - (a23 * b00)) * invDet, ((((-a10) * b09) + (a11 * b07)) - (a12 * b06)) * invDet, (((a00 * b09) - (a01 * b07)) + (a02 * b06)) * invDet, ((((-a30) * b03) + (a31 * b01)) - (a32 * b00)) * invDet, (((a20 * b03) - (a21 * b01)) + (a22 * b00)) * invDet)
	dim quat as Quaternion = (source.x, source.y, source.z, 1.0f)
	dim qtransformed as Quaternion = ((((matViewProjInv.m0 * quat.x) + (matViewProjInv.m4 * quat.y)) + (matViewProjInv.m8 * quat.z)) + (matViewProjInv.m12 * quat.w), (((matViewProjInv.m1 * quat.x) + (matViewProjInv.m5 * quat.y)) + (matViewProjInv.m9 * quat.z)) + (matViewProjInv.m13 * quat.w), (((matViewProjInv.m2 * quat.x) + (matViewProjInv.m6 * quat.y)) + (matViewProjInv.m10 * quat.z)) + (matViewProjInv.m14 * quat.w), (((matViewProjInv.m3 * quat.x) + (matViewProjInv.m7 * quat.y)) + (matViewProjInv.m11 * quat.z)) + (matViewProjInv.m15 * quat.w))
	result.x = qtransformed.x / qtransformed.w
	result.y = qtransformed.y / qtransformed.w
	result.z = qtransformed.z / qtransformed.w
	return result
end function

private function Vector3ToFloatV(byval v as Vector3) as float3
	dim buffer as float3 = (0)
	buffer.v[0] = v.x
	buffer.v[1] = v.y
	buffer.v[2] = v.z
	return buffer
end function

private function Vector3Invert(byval v as Vector3) as Vector3
	dim result as Vector3 = (1.0f / v.x, 1.0f / v.y, 1.0f / v.z)
	return result
end function

private function Vector3Clamp(byval v as Vector3, byval min as Vector3, byval max as Vector3) as Vector3
	dim result as Vector3 = (0)
	result.x = fminf(max.x, fmaxf(min.x, v.x))
	result.y = fminf(max.y, fmaxf(min.y, v.y))
	result.z = fminf(max.z, fmaxf(min.z, v.z))
	return result
end function

private function Vector3ClampValue(byval v as Vector3, byval min as single, byval max as single) as Vector3
	dim result as Vector3 = v
	dim length as single = ((v.x * v.x) + (v.y * v.y)) + (v.z * v.z)
	if length > 0.0f then
		length = sqrtf(length)
		dim scale as single = 1
		if length < min then
			scale = min / length
		elseif length > max then
			scale = max / length
		end if
		result.x = v.x * scale
		result.y = v.y * scale
		result.z = v.z * scale
	end if
	return result
end function

private function Vector3Equals(byval p as Vector3, byval q as Vector3) as long
	dim result as long = -(((fabsf(p.x - q.x) <= (0.000001f * fmaxf(1.0f, fmaxf(fabsf(p.x), fabsf(q.x))))) andalso (fabsf(p.y - q.y) <= (0.000001f * fmaxf(1.0f, fmaxf(fabsf(p.y), fabsf(q.y)))))) andalso (fabsf(p.z - q.z) <= (0.000001f * fmaxf(1.0f, fmaxf(fabsf(p.z), fabsf(q.z))))))
	return result
end function

private function Vector3Refract(byval v as Vector3, byval n as Vector3, byval r as single) as Vector3
	dim result as Vector3 = (0)
	dim dot as single = ((v.x * n.x) + (v.y * n.y)) + (v.z * n.z)
	dim d as single = 1.0f - ((r * r) * (1.0f - (dot * dot)))
	if d >= 0.0f then
		d = sqrtf(d)
		v.x = (r * v.x) - (((r * dot) + d) * n.x)
		v.y = (r * v.y) - (((r * dot) + d) * n.y)
		v.z = (r * v.z) - (((r * dot) + d) * n.z)
		result = v
	end if
	return result
end function

private function Vector4Zero() as Vector4
	dim result as Vector4 = (0.0f, 0.0f, 0.0f, 0.0f)
	return result
end function

private function Vector4One() as Vector4
	dim result as Vector4 = (1.0f, 1.0f, 1.0f, 1.0f)
	return result
end function

private function Vector4Add(byval v1 as Vector4, byval v2 as Vector4) as Vector4
	dim result as Vector4 = (v1.x + v2.x, v1.y + v2.y, v1.z + v2.z, v1.w + v2.w)
	return result
end function

private function Vector4AddValue(byval v as Vector4, byval add as single) as Vector4
	dim result as Vector4 = (v.x + add, v.y + add, v.z + add, v.w + add)
	return result
end function

private function Vector4Subtract(byval v1 as Vector4, byval v2 as Vector4) as Vector4
	dim result as Vector4 = (v1.x - v2.x, v1.y - v2.y, v1.z - v2.z, v1.w - v2.w)
	return result
end function

private function Vector4SubtractValue(byval v as Vector4, byval add as single) as Vector4
	dim result as Vector4 = (v.x - add, v.y - add, v.z - add, v.w - add)
	return result
end function

private function Vector4Length(byval v as Vector4) as single
	dim result as single = sqrtf((((v.x * v.x) + (v.y * v.y)) + (v.z * v.z)) + (v.w * v.w))
	return result
end function

private function Vector4LengthSqr(byval v as Vector4) as single
	dim result as single = (((v.x * v.x) + (v.y * v.y)) + (v.z * v.z)) + (v.w * v.w)
	return result
end function

private function Vector4DotProduct(byval v1 as Vector4, byval v2 as Vector4) as single
	dim result as single = (((v1.x * v2.x) + (v1.y * v2.y)) + (v1.z * v2.z)) + (v1.w * v2.w)
	return result
end function

private function Vector4Distance(byval v1 as Vector4, byval v2 as Vector4) as single
	dim result as single = sqrtf(((((v1.x - v2.x) * (v1.x - v2.x)) + ((v1.y - v2.y) * (v1.y - v2.y))) + ((v1.z - v2.z) * (v1.z - v2.z))) + ((v1.w - v2.w) * (v1.w - v2.w)))
	return result
end function

private function Vector4DistanceSqr(byval v1 as Vector4, byval v2 as Vector4) as single
	dim result as single = ((((v1.x - v2.x) * (v1.x - v2.x)) + ((v1.y - v2.y) * (v1.y - v2.y))) + ((v1.z - v2.z) * (v1.z - v2.z))) + ((v1.w - v2.w) * (v1.w - v2.w))
	return result
end function

private function Vector4Scale(byval v as Vector4, byval scale as single) as Vector4
	dim result as Vector4 = (v.x * scale, v.y * scale, v.z * scale, v.w * scale)
	return result
end function

private function Vector4Multiply(byval v1 as Vector4, byval v2 as Vector4) as Vector4
	dim result as Vector4 = (v1.x * v2.x, v1.y * v2.y, v1.z * v2.z, v1.w * v2.w)
	return result
end function

private function Vector4Negate(byval v as Vector4) as Vector4
	dim result as Vector4 = (-v.x, -v.y, -v.z, -v.w)
	return result
end function

private function Vector4Divide(byval v1 as Vector4, byval v2 as Vector4) as Vector4
	dim result as Vector4 = (v1.x / v2.x, v1.y / v2.y, v1.z / v2.z, v1.w / v2.w)
	return result
end function

private function Vector4Normalize(byval v as Vector4) as Vector4
	dim result as Vector4 = (0)
	dim length as single = sqrtf((((v.x * v.x) + (v.y * v.y)) + (v.z * v.z)) + (v.w * v.w))
	if length > 0 then
		dim ilength as single = 1.0f / length
		result.x = v.x * ilength
		result.y = v.y * ilength
		result.z = v.z * ilength
		result.w = v.w * ilength
	end if
	return result
end function

private function Vector4Min(byval v1 as Vector4, byval v2 as Vector4) as Vector4
	dim result as Vector4 = (0)
	result.x = fminf(v1.x, v2.x)
	result.y = fminf(v1.y, v2.y)
	result.z = fminf(v1.z, v2.z)
	result.w = fminf(v1.w, v2.w)
	return result
end function

private function Vector4Max(byval v1 as Vector4, byval v2 as Vector4) as Vector4
	dim result as Vector4 = (0)
	result.x = fmaxf(v1.x, v2.x)
	result.y = fmaxf(v1.y, v2.y)
	result.z = fmaxf(v1.z, v2.z)
	result.w = fmaxf(v1.w, v2.w)
	return result
end function

private function Vector4Lerp(byval v1 as Vector4, byval v2 as Vector4, byval amount as single) as Vector4
	dim result as Vector4 = (0)
	result.x = v1.x + (amount * (v2.x - v1.x))
	result.y = v1.y + (amount * (v2.y - v1.y))
	result.z = v1.z + (amount * (v2.z - v1.z))
	result.w = v1.w + (amount * (v2.w - v1.w))
	return result
end function

private function Vector4MoveTowards(byval v as Vector4, byval target as Vector4, byval maxDistance as single) as Vector4
	dim result as Vector4 = (0)
	dim dx as single = target.x - v.x
	dim dy as single = target.y - v.y
	dim dz as single = target.z - v.z
	dim dw as single = target.w - v.w
	dim value as single = (((dx * dx) + (dy * dy)) + (dz * dz)) + (dw * dw)
	if (value = 0) orelse ((maxDistance >= 0) andalso (value <= (maxDistance * maxDistance))) then
		return target
	end if
	dim dist as single = sqrtf(value)
	result.x = v.x + ((dx / dist) * maxDistance)
	result.y = v.y + ((dy / dist) * maxDistance)
	result.z = v.z + ((dz / dist) * maxDistance)
	result.w = v.w + ((dw / dist) * maxDistance)
	return result
end function

private function Vector4Invert(byval v as Vector4) as Vector4
	dim result as Vector4 = (1.0f / v.x, 1.0f / v.y, 1.0f / v.z, 1.0f / v.w)
	return result
end function

private function Vector4Equals(byval p as Vector4, byval q as Vector4) as long
	dim result as long = -((((fabsf(p.x - q.x) <= (0.000001f * fmaxf(1.0f, fmaxf(fabsf(p.x), fabsf(q.x))))) andalso (fabsf(p.y - q.y) <= (0.000001f * fmaxf(1.0f, fmaxf(fabsf(p.y), fabsf(q.y)))))) andalso (fabsf(p.z - q.z) <= (0.000001f * fmaxf(1.0f, fmaxf(fabsf(p.z), fabsf(q.z)))))) andalso (fabsf(p.w - q.w) <= (0.000001f * fmaxf(1.0f, fmaxf(fabsf(p.w), fabsf(q.w))))))
	return result
end function

private function MatrixDeterminant(byval mat as Matrix) as single
	dim result as single = 0.0f
	dim a00 as single = mat.m0
	dim a01 as single = mat.m1
	dim a02 as single = mat.m2
	dim a03 as single = mat.m3
	dim a10 as single = mat.m4
	dim a11 as single = mat.m5
	dim a12 as single = mat.m6
	dim a13 as single = mat.m7
	dim a20 as single = mat.m8
	dim a21 as single = mat.m9
	dim a22 as single = mat.m10
	dim a23 as single = mat.m11
	dim a30 as single = mat.m12
	dim a31 as single = mat.m13
	dim a32 as single = mat.m14
	dim a33 as single = mat.m15
	result = (((((((((((((((((((((((((a30 * a21) * a12) * a03) - (((a20 * a31) * a12) * a03)) - (((a30 * a11) * a22) * a03)) + (((a10 * a31) * a22) * a03)) + (((a20 * a11) * a32) * a03)) - (((a10 * a21) * a32) * a03)) - (((a30 * a21) * a02) * a13)) + (((a20 * a31) * a02) * a13)) + (((a30 * a01) * a22) * a13)) - (((a00 * a31) * a22) * a13)) - (((a20 * a01) * a32) * a13)) + (((a00 * a21) * a32) * a13)) + (((a30 * a11) * a02) * a23)) - (((a10 * a31) * a02) * a23)) - (((a30 * a01) * a12) * a23)) + (((a00 * a31) * a12) * a23)) + (((a10 * a01) * a32) * a23)) - (((a00 * a11) * a32) * a23)) - (((a20 * a11) * a02) * a33)) + (((a10 * a21) * a02) * a33)) + (((a20 * a01) * a12) * a33)) - (((a00 * a21) * a12) * a33)) - (((a10 * a01) * a22) * a33)) + (((a00 * a11) * a22) * a33)
	return result
end function

private function MatrixTrace(byval mat as Matrix) as single
	dim result as single = ((mat.m0 + mat.m5) + mat.m10) + mat.m15
	return result
end function

private function MatrixTranspose(byval mat as Matrix) as Matrix
	dim result as Matrix = (0)
	result.m0 = mat.m0
	result.m1 = mat.m4
	result.m2 = mat.m8
	result.m3 = mat.m12
	result.m4 = mat.m1
	result.m5 = mat.m5
	result.m6 = mat.m9
	result.m7 = mat.m13
	result.m8 = mat.m2
	result.m9 = mat.m6
	result.m10 = mat.m10
	result.m11 = mat.m14
	result.m12 = mat.m3
	result.m13 = mat.m7
	result.m14 = mat.m11
	result.m15 = mat.m15
	return result
end function

private function MatrixInvert(byval mat as Matrix) as Matrix
	dim result as Matrix = (0)
	dim a00 as single = mat.m0
	dim a01 as single = mat.m1
	dim a02 as single = mat.m2
	dim a03 as single = mat.m3
	dim a10 as single = mat.m4
	dim a11 as single = mat.m5
	dim a12 as single = mat.m6
	dim a13 as single = mat.m7
	dim a20 as single = mat.m8
	dim a21 as single = mat.m9
	dim a22 as single = mat.m10
	dim a23 as single = mat.m11
	dim a30 as single = mat.m12
	dim a31 as single = mat.m13
	dim a32 as single = mat.m14
	dim a33 as single = mat.m15
	dim b00 as single = (a00 * a11) - (a01 * a10)
	dim b01 as single = (a00 * a12) - (a02 * a10)
	dim b02 as single = (a00 * a13) - (a03 * a10)
	dim b03 as single = (a01 * a12) - (a02 * a11)
	dim b04 as single = (a01 * a13) - (a03 * a11)
	dim b05 as single = (a02 * a13) - (a03 * a12)
	dim b06 as single = (a20 * a31) - (a21 * a30)
	dim b07 as single = (a20 * a32) - (a22 * a30)
	dim b08 as single = (a20 * a33) - (a23 * a30)
	dim b09 as single = (a21 * a32) - (a22 * a31)
	dim b10 as single = (a21 * a33) - (a23 * a31)
	dim b11 as single = (a22 * a33) - (a23 * a32)
	dim invDet as single = 1.0f / ((((((b00 * b11) - (b01 * b10)) + (b02 * b09)) + (b03 * b08)) - (b04 * b07)) + (b05 * b06))
	result.m0 = (((a11 * b11) - (a12 * b10)) + (a13 * b09)) * invDet
	result.m1 = ((((-a01) * b11) + (a02 * b10)) - (a03 * b09)) * invDet
	result.m2 = (((a31 * b05) - (a32 * b04)) + (a33 * b03)) * invDet
	result.m3 = ((((-a21) * b05) + (a22 * b04)) - (a23 * b03)) * invDet
	result.m4 = ((((-a10) * b11) + (a12 * b08)) - (a13 * b07)) * invDet
	result.m5 = (((a00 * b11) - (a02 * b08)) + (a03 * b07)) * invDet
	result.m6 = ((((-a30) * b05) + (a32 * b02)) - (a33 * b01)) * invDet
	result.m7 = (((a20 * b05) - (a22 * b02)) + (a23 * b01)) * invDet
	result.m8 = (((a10 * b10) - (a11 * b08)) + (a13 * b06)) * invDet
	result.m9 = ((((-a00) * b10) + (a01 * b08)) - (a03 * b06)) * invDet
	result.m10 = (((a30 * b04) - (a31 * b02)) + (a33 * b00)) * invDet
	result.m11 = ((((-a20) * b04) + (a21 * b02)) - (a23 * b00)) * invDet
	result.m12 = ((((-a10) * b09) + (a11 * b07)) - (a12 * b06)) * invDet
	result.m13 = (((a00 * b09) - (a01 * b07)) + (a02 * b06)) * invDet
	result.m14 = ((((-a30) * b03) + (a31 * b01)) - (a32 * b00)) * invDet
	result.m15 = (((a20 * b03) - (a21 * b01)) + (a22 * b00)) * invDet
	return result
end function

private function MatrixIdentity() as Matrix
	dim result as Matrix = (1.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f)
	return result
end function

private function MatrixAdd(byval left as Matrix, byval right as Matrix) as Matrix
	dim result as Matrix = (0)
	result.m0 = left.m0 + right.m0
	result.m1 = left.m1 + right.m1
	result.m2 = left.m2 + right.m2
	result.m3 = left.m3 + right.m3
	result.m4 = left.m4 + right.m4
	result.m5 = left.m5 + right.m5
	result.m6 = left.m6 + right.m6
	result.m7 = left.m7 + right.m7
	result.m8 = left.m8 + right.m8
	result.m9 = left.m9 + right.m9
	result.m10 = left.m10 + right.m10
	result.m11 = left.m11 + right.m11
	result.m12 = left.m12 + right.m12
	result.m13 = left.m13 + right.m13
	result.m14 = left.m14 + right.m14
	result.m15 = left.m15 + right.m15
	return result
end function

private function MatrixSubtract(byval left as Matrix, byval right as Matrix) as Matrix
	dim result as Matrix = (0)
	result.m0 = left.m0 - right.m0
	result.m1 = left.m1 - right.m1
	result.m2 = left.m2 - right.m2
	result.m3 = left.m3 - right.m3
	result.m4 = left.m4 - right.m4
	result.m5 = left.m5 - right.m5
	result.m6 = left.m6 - right.m6
	result.m7 = left.m7 - right.m7
	result.m8 = left.m8 - right.m8
	result.m9 = left.m9 - right.m9
	result.m10 = left.m10 - right.m10
	result.m11 = left.m11 - right.m11
	result.m12 = left.m12 - right.m12
	result.m13 = left.m13 - right.m13
	result.m14 = left.m14 - right.m14
	result.m15 = left.m15 - right.m15
	return result
end function

private function MatrixMultiply(byval left as Matrix, byval right as Matrix) as Matrix
	dim result as Matrix = (0)
	result.m0 = (((left.m0 * right.m0) + (left.m1 * right.m4)) + (left.m2 * right.m8)) + (left.m3 * right.m12)
	result.m1 = (((left.m0 * right.m1) + (left.m1 * right.m5)) + (left.m2 * right.m9)) + (left.m3 * right.m13)
	result.m2 = (((left.m0 * right.m2) + (left.m1 * right.m6)) + (left.m2 * right.m10)) + (left.m3 * right.m14)
	result.m3 = (((left.m0 * right.m3) + (left.m1 * right.m7)) + (left.m2 * right.m11)) + (left.m3 * right.m15)
	result.m4 = (((left.m4 * right.m0) + (left.m5 * right.m4)) + (left.m6 * right.m8)) + (left.m7 * right.m12)
	result.m5 = (((left.m4 * right.m1) + (left.m5 * right.m5)) + (left.m6 * right.m9)) + (left.m7 * right.m13)
	result.m6 = (((left.m4 * right.m2) + (left.m5 * right.m6)) + (left.m6 * right.m10)) + (left.m7 * right.m14)
	result.m7 = (((left.m4 * right.m3) + (left.m5 * right.m7)) + (left.m6 * right.m11)) + (left.m7 * right.m15)
	result.m8 = (((left.m8 * right.m0) + (left.m9 * right.m4)) + (left.m10 * right.m8)) + (left.m11 * right.m12)
	result.m9 = (((left.m8 * right.m1) + (left.m9 * right.m5)) + (left.m10 * right.m9)) + (left.m11 * right.m13)
	result.m10 = (((left.m8 * right.m2) + (left.m9 * right.m6)) + (left.m10 * right.m10)) + (left.m11 * right.m14)
	result.m11 = (((left.m8 * right.m3) + (left.m9 * right.m7)) + (left.m10 * right.m11)) + (left.m11 * right.m15)
	result.m12 = (((left.m12 * right.m0) + (left.m13 * right.m4)) + (left.m14 * right.m8)) + (left.m15 * right.m12)
	result.m13 = (((left.m12 * right.m1) + (left.m13 * right.m5)) + (left.m14 * right.m9)) + (left.m15 * right.m13)
	result.m14 = (((left.m12 * right.m2) + (left.m13 * right.m6)) + (left.m14 * right.m10)) + (left.m15 * right.m14)
	result.m15 = (((left.m12 * right.m3) + (left.m13 * right.m7)) + (left.m14 * right.m11)) + (left.m15 * right.m15)
	return result
end function

private function MatrixTranslate(byval x as single, byval y as single, byval z as single) as Matrix
	dim result as Matrix = (1.0f, 0.0f, 0.0f, x, 0.0f, 1.0f, 0.0f, y, 0.0f, 0.0f, 1.0f, z, 0.0f, 0.0f, 0.0f, 1.0f)
	return result
end function

private function MatrixRotate(byval axis as Vector3, byval angle as single) as Matrix
	dim result as Matrix = (0)
	dim x as single = axis.x
	dim y as single = axis.y
	dim z as single = axis.z
	dim lengthSquared as single = ((x * x) + (y * y)) + (z * z)
	if (lengthSquared <> 1.0f) andalso (lengthSquared <> 0.0f) then
		dim ilength as single = 1.0f / sqrtf(lengthSquared)
		x *= ilength
		y *= ilength
		z *= ilength
	end if
	dim sinres as single = sinf(angle)
	dim cosres as single = cosf(angle)
	dim t as single = 1.0f - cosres
	result.m0 = ((x * x) * t) + cosres
	result.m1 = ((y * x) * t) + (z * sinres)
	result.m2 = ((z * x) * t) - (y * sinres)
	result.m3 = 0.0f
	result.m4 = ((x * y) * t) - (z * sinres)
	result.m5 = ((y * y) * t) + cosres
	result.m6 = ((z * y) * t) + (x * sinres)
	result.m7 = 0.0f
	result.m8 = ((x * z) * t) + (y * sinres)
	result.m9 = ((y * z) * t) - (x * sinres)
	result.m10 = ((z * z) * t) + cosres
	result.m11 = 0.0f
	result.m12 = 0.0f
	result.m13 = 0.0f
	result.m14 = 0.0f
	result.m15 = 1.0f
	return result
end function

private function MatrixRotateX(byval angle as single) as Matrix
	dim result as Matrix = (1.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f)
	dim cosres as single = cosf(angle)
	dim sinres as single = sinf(angle)
	result.m5 = cosres
	result.m6 = sinres
	result.m9 = -sinres
	result.m10 = cosres
	return result
end function

private function MatrixRotateY(byval angle as single) as Matrix
	dim result as Matrix = (1.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f)
	dim cosres as single = cosf(angle)
	dim sinres as single = sinf(angle)
	result.m0 = cosres
	result.m2 = -sinres
	result.m8 = sinres
	result.m10 = cosres
	return result
end function

private function MatrixRotateZ(byval angle as single) as Matrix
	dim result as Matrix = (1.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f)
	dim cosres as single = cosf(angle)
	dim sinres as single = sinf(angle)
	result.m0 = cosres
	result.m1 = sinres
	result.m4 = -sinres
	result.m5 = cosres
	return result
end function

private function MatrixRotateXYZ(byval angle as Vector3) as Matrix
	dim result as Matrix = (1.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f)
	dim cosz as single = cosf(-angle.z)
	dim sinz as single = sinf(-angle.z)
	dim cosy as single = cosf(-angle.y)
	dim siny as single = sinf(-angle.y)
	dim cosx as single = cosf(-angle.x)
	dim sinx as single = sinf(-angle.x)
	result.m0 = cosz * cosy
	result.m1 = ((cosz * siny) * sinx) - (sinz * cosx)
	result.m2 = ((cosz * siny) * cosx) + (sinz * sinx)
	result.m4 = sinz * cosy
	result.m5 = ((sinz * siny) * sinx) + (cosz * cosx)
	result.m6 = ((sinz * siny) * cosx) - (cosz * sinx)
	result.m8 = -siny
	result.m9 = cosy * sinx
	result.m10 = cosy * cosx
	return result
end function

private function MatrixRotateZYX(byval angle as Vector3) as Matrix
	dim result as Matrix = (0)
	dim cz as single = cosf(angle.z)
	dim sz as single = sinf(angle.z)
	dim cy as single = cosf(angle.y)
	dim sy as single = sinf(angle.y)
	dim cx as single = cosf(angle.x)
	dim sx as single = sinf(angle.x)
	result.m0 = cz * cy
	result.m4 = ((cz * sy) * sx) - (cx * sz)
	result.m8 = (sz * sx) + ((cz * cx) * sy)
	result.m12 = 0
	result.m1 = cy * sz
	result.m5 = (cz * cx) + ((sz * sy) * sx)
	result.m9 = ((cx * sz) * sy) - (cz * sx)
	result.m13 = 0
	result.m2 = -sy
	result.m6 = cy * sx
	result.m10 = cy * cx
	result.m14 = 0
	result.m3 = 0
	result.m7 = 0
	result.m11 = 0
	result.m15 = 1
	return result
end function

private function MatrixScale(byval x as single, byval y as single, byval z as single) as Matrix
	dim result as Matrix = (x, 0.0f, 0.0f, 0.0f, 0.0f, y, 0.0f, 0.0f, 0.0f, 0.0f, z, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f)
	return result
end function

private function MatrixFrustum(byval left as double, byval right as double, byval bottom as double, byval top as double, byval nearPlane as double, byval farPlane as double) as Matrix
	dim result as Matrix = (0)
	dim rl as single = csng(right - left)
	dim tb as single = csng(top - bottom)
	dim fn as single = csng(farPlane - nearPlane)
	result.m0 = (csng(nearPlane) * 2.0f) / rl
	result.m1 = 0.0f
	result.m2 = 0.0f
	result.m3 = 0.0f
	result.m4 = 0.0f
	result.m5 = (csng(nearPlane) * 2.0f) / tb
	result.m6 = 0.0f
	result.m7 = 0.0f
	result.m8 = (csng(right) + csng(left)) / rl
	result.m9 = (csng(top) + csng(bottom)) / tb
	result.m10 = (-(csng(farPlane) + csng(nearPlane))) / fn
	result.m11 = -1.0f
	result.m12 = 0.0f
	result.m13 = 0.0f
	result.m14 = (-((csng(farPlane) * csng(nearPlane)) * 2.0f)) / fn
	result.m15 = 0.0f
	return result
end function

private function MatrixPerspective(byval fovY as double, byval aspect as double, byval nearPlane as double, byval farPlane as double) as Matrix
	dim result as Matrix = (0)
	dim top as double = nearPlane * tan(fovY * 0.5)
	dim bottom as double = -top
	dim right as double = top * aspect
	dim left as double = -right
	dim rl as single = csng(right - left)
	dim tb as single = csng(top - bottom)
	dim fn as single = csng(farPlane - nearPlane)
	result.m0 = (csng(nearPlane) * 2.0f) / rl
	result.m5 = (csng(nearPlane) * 2.0f) / tb
	result.m8 = (csng(right) + csng(left)) / rl
	result.m9 = (csng(top) + csng(bottom)) / tb
	result.m10 = (-(csng(farPlane) + csng(nearPlane))) / fn
	result.m11 = -1.0f
	result.m14 = (-((csng(farPlane) * csng(nearPlane)) * 2.0f)) / fn
	return result
end function

private function MatrixOrtho(byval left as double, byval right as double, byval bottom as double, byval top as double, byval nearPlane as double, byval farPlane as double) as Matrix
	dim result as Matrix = (0)
	dim rl as single = csng(right - left)
	dim tb as single = csng(top - bottom)
	dim fn as single = csng(farPlane - nearPlane)
	result.m0 = 2.0f / rl
	result.m1 = 0.0f
	result.m2 = 0.0f
	result.m3 = 0.0f
	result.m4 = 0.0f
	result.m5 = 2.0f / tb
	result.m6 = 0.0f
	result.m7 = 0.0f
	result.m8 = 0.0f
	result.m9 = 0.0f
	result.m10 = (-2.0f) / fn
	result.m11 = 0.0f
	result.m12 = (-(csng(left) + csng(right))) / rl
	result.m13 = (-(csng(top) + csng(bottom))) / tb
	result.m14 = (-(csng(farPlane) + csng(nearPlane))) / fn
	result.m15 = 1.0f
	return result
end function

private function MatrixLookAt(byval eye as Vector3, byval target as Vector3, byval up as Vector3) as Matrix
	dim result as Matrix = (0)
	dim length as single = 0.0f
	dim ilength as single = 0.0f
	dim vz as Vector3 = (eye.x - target.x, eye.y - target.y, eye.z - target.z)
	dim v as Vector3 = vz
	length = sqrtf(((v.x * v.x) + (v.y * v.y)) + (v.z * v.z))
	if length = 0.0f then
		length = 1.0f
	end if
	ilength = 1.0f / length
	vz.x *= ilength
	vz.y *= ilength
	vz.z *= ilength
	dim vx as Vector3 = ((up.y * vz.z) - (up.z * vz.y), (up.z * vz.x) - (up.x * vz.z), (up.x * vz.y) - (up.y * vz.x))
	v = vx
	length = sqrtf(((v.x * v.x) + (v.y * v.y)) + (v.z * v.z))
	if length = 0.0f then
		length = 1.0f
	end if
	ilength = 1.0f / length
	vx.x *= ilength
	vx.y *= ilength
	vx.z *= ilength
	dim vy as Vector3 = ((vz.y * vx.z) - (vz.z * vx.y), (vz.z * vx.x) - (vz.x * vx.z), (vz.x * vx.y) - (vz.y * vx.x))
	result.m0 = vx.x
	result.m1 = vy.x
	result.m2 = vz.x
	result.m3 = 0.0f
	result.m4 = vx.y
	result.m5 = vy.y
	result.m6 = vz.y
	result.m7 = 0.0f
	result.m8 = vx.z
	result.m9 = vy.z
	result.m10 = vz.z
	result.m11 = 0.0f
	result.m12 = -(((vx.x * eye.x) + (vx.y * eye.y)) + (vx.z * eye.z))
	result.m13 = -(((vy.x * eye.x) + (vy.y * eye.y)) + (vy.z * eye.z))
	result.m14 = -(((vz.x * eye.x) + (vz.y * eye.y)) + (vz.z * eye.z))
	result.m15 = 1.0f
	return result
end function

private function MatrixToFloatV(byval mat as Matrix) as float16
	dim result as float16 = (0)
	result.v[0] = mat.m0
	result.v[1] = mat.m1
	result.v[2] = mat.m2
	result.v[3] = mat.m3
	result.v[4] = mat.m4
	result.v[5] = mat.m5
	result.v[6] = mat.m6
	result.v[7] = mat.m7
	result.v[8] = mat.m8
	result.v[9] = mat.m9
	result.v[10] = mat.m10
	result.v[11] = mat.m11
	result.v[12] = mat.m12
	result.v[13] = mat.m13
	result.v[14] = mat.m14
	result.v[15] = mat.m15
	return result
end function

private function QuaternionAdd(byval q1 as Quaternion, byval q2 as Quaternion) as Quaternion
	dim result as Quaternion = (q1.x + q2.x, q1.y + q2.y, q1.z + q2.z, q1.w + q2.w)
	return result
end function

private function QuaternionAddValue(byval q as Quaternion, byval add as single) as Quaternion
	dim result as Quaternion = (q.x + add, q.y + add, q.z + add, q.w + add)
	return result
end function

private function QuaternionSubtract(byval q1 as Quaternion, byval q2 as Quaternion) as Quaternion
	dim result as Quaternion = (q1.x - q2.x, q1.y - q2.y, q1.z - q2.z, q1.w - q2.w)
	return result
end function

private function QuaternionSubtractValue(byval q as Quaternion, byval sub as single) as Quaternion
	dim result as Quaternion = (q.x - sub, q.y - sub, q.z - sub, q.w - sub)
	return result
end function

private function QuaternionIdentity() as Quaternion
	dim result as Quaternion = (0.0f, 0.0f, 0.0f, 1.0f)
	return result
end function

private function QuaternionLength(byval q as Quaternion) as single
	dim result as single = sqrtf((((q.x * q.x) + (q.y * q.y)) + (q.z * q.z)) + (q.w * q.w))
	return result
end function

private function QuaternionNormalize(byval q as Quaternion) as Quaternion
	dim result as Quaternion = (0)
	dim length as single = sqrtf((((q.x * q.x) + (q.y * q.y)) + (q.z * q.z)) + (q.w * q.w))
	if length = 0.0f then
		length = 1.0f
	end if
	dim ilength as single = 1.0f / length
	result.x = q.x * ilength
	result.y = q.y * ilength
	result.z = q.z * ilength
	result.w = q.w * ilength
	return result
end function

private function QuaternionInvert(byval q as Quaternion) as Quaternion
	dim result as Quaternion = q
	dim lengthSq as single = (((q.x * q.x) + (q.y * q.y)) + (q.z * q.z)) + (q.w * q.w)
	if lengthSq <> 0.0f then
		dim invLength as single = 1.0f / lengthSq
		result.x *= -invLength
		result.y *= -invLength
		result.z *= -invLength
		result.w *= invLength
	end if
	return result
end function

private function QuaternionMultiply(byval q1 as Quaternion, byval q2 as Quaternion) as Quaternion
	dim result as Quaternion = (0)
	dim qax as single = q1.x
	dim qay as single = q1.y
	dim qaz as single = q1.z
	dim qaw as single = q1.w
	dim qbx as single = q2.x
	dim qby as single = q2.y
	dim qbz as single = q2.z
	dim qbw as single = q2.w
	result.x = (((qax * qbw) + (qaw * qbx)) + (qay * qbz)) - (qaz * qby)
	result.y = (((qay * qbw) + (qaw * qby)) + (qaz * qbx)) - (qax * qbz)
	result.z = (((qaz * qbw) + (qaw * qbz)) + (qax * qby)) - (qay * qbx)
	result.w = (((qaw * qbw) - (qax * qbx)) - (qay * qby)) - (qaz * qbz)
	return result
end function

private function QuaternionScale(byval q as Quaternion, byval mul as single) as Quaternion
	dim result as Quaternion = (0)
	result.x = q.x * mul
	result.y = q.y * mul
	result.z = q.z * mul
	result.w = q.w * mul
	return result
end function

private function QuaternionDivide(byval q1 as Quaternion, byval q2 as Quaternion) as Quaternion
	dim result as Quaternion = (q1.x / q2.x, q1.y / q2.y, q1.z / q2.z, q1.w / q2.w)
	return result
end function

private function QuaternionLerp(byval q1 as Quaternion, byval q2 as Quaternion, byval amount as single) as Quaternion
	dim result as Quaternion = (0)
	result.x = q1.x + (amount * (q2.x - q1.x))
	result.y = q1.y + (amount * (q2.y - q1.y))
	result.z = q1.z + (amount * (q2.z - q1.z))
	result.w = q1.w + (amount * (q2.w - q1.w))
	return result
end function

private function QuaternionNlerp(byval q1 as Quaternion, byval q2 as Quaternion, byval amount as single) as Quaternion
	dim result as Quaternion = (0)
	result.x = q1.x + (amount * (q2.x - q1.x))
	result.y = q1.y + (amount * (q2.y - q1.y))
	result.z = q1.z + (amount * (q2.z - q1.z))
	result.w = q1.w + (amount * (q2.w - q1.w))
	dim q as Quaternion = result
	dim length as single = sqrtf((((q.x * q.x) + (q.y * q.y)) + (q.z * q.z)) + (q.w * q.w))
	if length = 0.0f then
		length = 1.0f
	end if
	dim ilength as single = 1.0f / length
	result.x = q.x * ilength
	result.y = q.y * ilength
	result.z = q.z * ilength
	result.w = q.w * ilength
	return result
end function

private function QuaternionSlerp(byval q1 as Quaternion, byval q2 as Quaternion, byval amount as single) as Quaternion
	dim result as Quaternion = (0)
	dim cosHalfTheta as single = (((q1.x * q2.x) + (q1.y * q2.y)) + (q1.z * q2.z)) + (q1.w * q2.w)
	if cosHalfTheta < 0 then
		q2.x = -q2.x
		q2.y = -q2.y
		q2.z = -q2.z
		q2.w = -q2.w
		cosHalfTheta = -cosHalfTheta
	end if
	if fabsf(cosHalfTheta) >= 1.0f then
		result = q1
	elseif cosHalfTheta > 0.95f then
		result = QuaternionNlerp(q1, q2, amount)
	else
		dim halfTheta as single = acosf(cosHalfTheta)
		dim sinHalfTheta as single = sqrtf(1.0f - (cosHalfTheta * cosHalfTheta))
		if fabsf(sinHalfTheta) < 0.000001f then
			result.x = (q1.x * 0.5f) + (q2.x * 0.5f)
			result.y = (q1.y * 0.5f) + (q2.y * 0.5f)
			result.z = (q1.z * 0.5f) + (q2.z * 0.5f)
			result.w = (q1.w * 0.5f) + (q2.w * 0.5f)
		else
			dim ratioA as single = sinf((1 - amount) * halfTheta) / sinHalfTheta
			dim ratioB as single = sinf(amount * halfTheta) / sinHalfTheta
			result.x = (q1.x * ratioA) + (q2.x * ratioB)
			result.y = (q1.y * ratioA) + (q2.y * ratioB)
			result.z = (q1.z * ratioA) + (q2.z * ratioB)
			result.w = (q1.w * ratioA) + (q2.w * ratioB)
		end if
	end if
	return result
end function

private function QuaternionCubicHermiteSpline(byval q1 as Quaternion, byval outTangent1 as Quaternion, byval q2 as Quaternion, byval inTangent2 as Quaternion, byval t as single) as Quaternion
	dim t2 as single = t * t
	dim t3 as single = t2 * t
	dim h00 as single = ((2 * t3) - (3 * t2)) + 1
	dim h10 as single = (t3 - (2 * t2)) + t
	dim h01 as single = ((-2) * t3) + (3 * t2)
	dim h11 as single = t3 - t2
	dim p0 as Quaternion = QuaternionScale(q1, h00)
	dim m0 as Quaternion = QuaternionScale(outTangent1, h10)
	dim p1 as Quaternion = QuaternionScale(q2, h01)
	dim m1 as Quaternion = QuaternionScale(inTangent2, h11)
	dim result as Quaternion = (0)
	result = QuaternionAdd(p0, m0)
	result = QuaternionAdd(result, p1)
	result = QuaternionAdd(result, m1)
	result = QuaternionNormalize(result)
	return result
end function

private function QuaternionFromVector3ToVector3(byval from as Vector3, byval to as Vector3) as Quaternion
	dim result as Quaternion = (0)
	dim cos2Theta as single = ((from.x * to.x) + (from.y * to.y)) + (from.z * to.z)
	dim cross as Vector3 = ((from.y * to.z) - (from.z * to.y), (from.z * to.x) - (from.x * to.z), (from.x * to.y) - (from.y * to.x))
	result.x = cross.x
	result.y = cross.y
	result.z = cross.z
	result.w = 1.0f + cos2Theta
	dim q as Quaternion = result
	dim length as single = sqrtf((((q.x * q.x) + (q.y * q.y)) + (q.z * q.z)) + (q.w * q.w))
	if length = 0.0f then
		length = 1.0f
	end if
	dim ilength as single = 1.0f / length
	result.x = q.x * ilength
	result.y = q.y * ilength
	result.z = q.z * ilength
	result.w = q.w * ilength
	return result
end function

private function QuaternionFromMatrix(byval mat as Matrix) as Quaternion
	dim result as Quaternion = (0)
	dim fourWSquaredMinus1 as single = (mat.m0 + mat.m5) + mat.m10
	dim fourXSquaredMinus1 as single = (mat.m0 - mat.m5) - mat.m10
	dim fourYSquaredMinus1 as single = (mat.m5 - mat.m0) - mat.m10
	dim fourZSquaredMinus1 as single = (mat.m10 - mat.m0) - mat.m5
	dim biggestIndex as long = 0
	dim fourBiggestSquaredMinus1 as single = fourWSquaredMinus1
	if fourXSquaredMinus1 > fourBiggestSquaredMinus1 then
		fourBiggestSquaredMinus1 = fourXSquaredMinus1
		biggestIndex = 1
	end if
	if fourYSquaredMinus1 > fourBiggestSquaredMinus1 then
		fourBiggestSquaredMinus1 = fourYSquaredMinus1
		biggestIndex = 2
	end if
	if fourZSquaredMinus1 > fourBiggestSquaredMinus1 then
		fourBiggestSquaredMinus1 = fourZSquaredMinus1
		biggestIndex = 3
	end if
	dim biggestVal as single = sqrtf(fourBiggestSquaredMinus1 + 1.0f) * 0.5f
	dim mult as single = 0.25f / biggestVal
	'' TODO: switch (biggestIndex) { case 0: result.w = biggestVal; result.x = (mat.m6 - mat.m9)*mult; result.y = (mat.m8 - mat.m2)*mult; result.z = (mat.m1 - mat.m4)*mult; break; case 1: result.x = biggestVal; result.w = (mat.m6 - mat.m9)*mult; result.y = (mat.m1 + mat.m4)*mult; result.z = (mat.m8 + mat.m2)*mult; break; case 2: result.y = biggestVal; result.w = (mat.m8 - mat.m2)*mult; result.x = (mat.m1 + mat.m4)*mult; result.z = (mat.m6 + mat.m9)*mult; break; case 3: result.z = biggestVal; result.w = (mat.m1 - mat.m4)*mult; result.x = (mat.m8 + mat.m2)*mult; result.y = (mat.m6 + mat.m9)*mult; break; }
	return result
end function

private function QuaternionToMatrix(byval q as Quaternion) as Matrix
	dim result as Matrix = (1.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f)
	dim a2 as single = q.x * q.x
	dim b2 as single = q.y * q.y
	dim c2 as single = q.z * q.z
	dim ac as single = q.x * q.z
	dim ab as single = q.x * q.y
	dim bc as single = q.y * q.z
	dim ad as single = q.w * q.x
	dim bd as single = q.w * q.y
	dim cd as single = q.w * q.z
	result.m0 = 1 - (2 * (b2 + c2))
	result.m1 = 2 * (ab + cd)
	result.m2 = 2 * (ac - bd)
	result.m4 = 2 * (ab - cd)
	result.m5 = 1 - (2 * (a2 + c2))
	result.m6 = 2 * (bc + ad)
	result.m8 = 2 * (ac + bd)
	result.m9 = 2 * (bc - ad)
	result.m10 = 1 - (2 * (a2 + b2))
	return result
end function

private function QuaternionFromAxisAngle(byval axis as Vector3, byval angle as single) as Quaternion
	dim result as Quaternion = (0.0f, 0.0f, 0.0f, 1.0f)
	dim axisLength as single = sqrtf(((axis.x * axis.x) + (axis.y * axis.y)) + (axis.z * axis.z))
	if axisLength <> 0.0f then
		angle *= 0.5f
		dim length as single = 0.0f
		dim ilength as single = 0.0f
		length = axisLength
		if length = 0.0f then
			length = 1.0f
		end if
		ilength = 1.0f / length
		axis.x *= ilength
		axis.y *= ilength
		axis.z *= ilength
		dim sinres as single = sinf(angle)
		dim cosres as single = cosf(angle)
		result.x = axis.x * sinres
		result.y = axis.y * sinres
		result.z = axis.z * sinres
		result.w = cosres
		dim q as Quaternion = result
		length = sqrtf((((q.x * q.x) + (q.y * q.y)) + (q.z * q.z)) + (q.w * q.w))
		if length = 0.0f then
			length = 1.0f
		end if
		ilength = 1.0f / length
		result.x = q.x * ilength
		result.y = q.y * ilength
		result.z = q.z * ilength
		result.w = q.w * ilength
	end if
	return result
end function

private sub QuaternionToAxisAngle(byval q as Quaternion, byval outAxis as Vector3 ptr, byval outAngle as single ptr)
	if fabsf(q.w) > 1.0f then
		dim length as single = sqrtf((((q.x * q.x) + (q.y * q.y)) + (q.z * q.z)) + (q.w * q.w))
		if length = 0.0f then
			length = 1.0f
		end if
		dim ilength as single = 1.0f / length
		q.x = q.x * ilength
		q.y = q.y * ilength
		q.z = q.z * ilength
		q.w = q.w * ilength
	end if
	dim resAxis as Vector3 = (0.0f, 0.0f, 0.0f)
	dim resAngle as single = 2.0f * acosf(q.w)
	dim den as single = sqrtf(1.0f - (q.w * q.w))
	if den > 0.000001f then
		resAxis.x = q.x / den
		resAxis.y = q.y / den
		resAxis.z = q.z / den
	else
		resAxis.x = 1.0f
	end if
	(*outAxis) = resAxis
	(*outAngle) = resAngle
end sub

private function QuaternionFromEuler(byval pitch as single, byval yaw as single, byval roll as single) as Quaternion
	dim result as Quaternion = (0)
	dim x0 as single = cosf(pitch * 0.5f)
	dim x1 as single = sinf(pitch * 0.5f)
	dim y0 as single = cosf(yaw * 0.5f)
	dim y1 as single = sinf(yaw * 0.5f)
	dim z0 as single = cosf(roll * 0.5f)
	dim z1 as single = sinf(roll * 0.5f)
	result.x = ((x1 * y0) * z0) - ((x0 * y1) * z1)
	result.y = ((x0 * y1) * z0) + ((x1 * y0) * z1)
	result.z = ((x0 * y0) * z1) - ((x1 * y1) * z0)
	result.w = ((x0 * y0) * z0) + ((x1 * y1) * z1)
	return result
end function

private function QuaternionToEuler(byval q as Quaternion) as Vector3
	dim result as Vector3 = (0)
	dim x0 as single = 2.0f * ((q.w * q.x) + (q.y * q.z))
	dim x1 as single = 1.0f - (2.0f * ((q.x * q.x) + (q.y * q.y)))
	result.x = atan2f(x0, x1)
	dim y0 as single = 2.0f * ((q.w * q.y) - (q.z * q.x))
	y0 = iif(y0 > 1.0f, 1.0f, y0)
	y0 = iif(y0 < (-1.0f), -1.0f, y0)
	result.y = asinf(y0)
	dim z0 as single = 2.0f * ((q.w * q.z) + (q.x * q.y))
	dim z1 as single = 1.0f - (2.0f * ((q.y * q.y) + (q.z * q.z)))
	result.z = atan2f(z0, z1)
	return result
end function

private function QuaternionTransform(byval q as Quaternion, byval mat as Matrix) as Quaternion
	dim result as Quaternion = (0)
	result.x = (((mat.m0 * q.x) + (mat.m4 * q.y)) + (mat.m8 * q.z)) + (mat.m12 * q.w)
	result.y = (((mat.m1 * q.x) + (mat.m5 * q.y)) + (mat.m9 * q.z)) + (mat.m13 * q.w)
	result.z = (((mat.m2 * q.x) + (mat.m6 * q.y)) + (mat.m10 * q.z)) + (mat.m14 * q.w)
	result.w = (((mat.m3 * q.x) + (mat.m7 * q.y)) + (mat.m11 * q.z)) + (mat.m15 * q.w)
	return result
end function

private function QuaternionEquals(byval p as Quaternion, byval q as Quaternion) as long
	dim result as long = -(((((fabsf(p.x - q.x) <= (0.000001f * fmaxf(1.0f, fmaxf(fabsf(p.x), fabsf(q.x))))) andalso (fabsf(p.y - q.y) <= (0.000001f * fmaxf(1.0f, fmaxf(fabsf(p.y), fabsf(q.y)))))) andalso (fabsf(p.z - q.z) <= (0.000001f * fmaxf(1.0f, fmaxf(fabsf(p.z), fabsf(q.z)))))) andalso (fabsf(p.w - q.w) <= (0.000001f * fmaxf(1.0f, fmaxf(fabsf(p.w), fabsf(q.w)))))) orelse ((((fabsf(p.x + q.x) <= (0.000001f * fmaxf(1.0f, fmaxf(fabsf(p.x), fabsf(q.x))))) andalso (fabsf(p.y + q.y) <= (0.000001f * fmaxf(1.0f, fmaxf(fabsf(p.y), fabsf(q.y)))))) andalso (fabsf(p.z + q.z) <= (0.000001f * fmaxf(1.0f, fmaxf(fabsf(p.z), fabsf(q.z)))))) andalso (fabsf(p.w + q.w) <= (0.000001f * fmaxf(1.0f, fmaxf(fabsf(p.w), fabsf(q.w)))))))
	return result
end function

private sub MatrixDecompose(byval mat as Matrix, byval translation as Vector3 ptr, byval rotation as Quaternion ptr, byval scale as Vector3 ptr)
	translation->x = mat.m12
	translation->y = mat.m13
	translation->z = mat.m14
	dim a as const single = mat.m0
	dim b as const single = mat.m4
	dim c as const single = mat.m8
	dim d as const single = mat.m1
	dim e as const single = mat.m5
	dim f as const single = mat.m9
	dim g as const single = mat.m2
	dim h as const single = mat.m6
	dim i as const single = mat.m10
	dim A as const single = (e * i) - (f * h)
	dim B as const single = (f * g) - (d * i)
	dim C as const single = (d * h) - (e * g)
	dim det as const single = ((a * A) + (b * B)) + (c * C)
	dim abc as Vector3 = (a, b, c)
	dim def as Vector3 = (d, e, f)
	dim ghi as Vector3 = (g, h, i)
	dim scalex as single = Vector3Length(abc)
	dim scaley as single = Vector3Length(def)
	dim scalez as single = Vector3Length(ghi)
	dim s as Vector3 = (scalex, scaley, scalez)
	if det < 0 then
		s = Vector3Negate(s)
	end if
	(*scale) = s
	dim clone as Matrix = mat
	if FloatEquals(det, 0) = 0 then
		clone.m0 /= s.x
		clone.m4 /= s.x
		clone.m8 /= s.x
		clone.m1 /= s.y
		clone.m5 /= s.y
		clone.m9 /= s.y
		clone.m2 /= s.z
		clone.m6 /= s.z
		clone.m10 /= s.z
		(*rotation) = QuaternionFromMatrix(clone)
	else
		(*rotation) = QuaternionIdentity()
	end if
end sub

end extern
