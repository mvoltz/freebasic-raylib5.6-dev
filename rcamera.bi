#pragma once

extern "C"

#define RCAMERA_H
#define RLAPI
#define CAMERA_CULL_DISTANCE_NEAR RL_CULL_DISTANCE_NEAR
#define CAMERA_CULL_DISTANCE_FAR RL_CULL_DISTANCE_FAR

declare function GetCameraForward(byval camera as Camera ptr) as Vector3
declare function GetCameraUp(byval camera as Camera ptr) as Vector3
declare function GetCameraRight(byval camera as Camera ptr) as Vector3
declare sub CameraMoveForward(byval camera as Camera ptr, byval distance as single, byval moveInWorldPlane as bool)
declare sub CameraMoveUp(byval camera as Camera ptr, byval distance as single)
declare sub CameraMoveRight(byval camera as Camera ptr, byval distance as single, byval moveInWorldPlane as bool)
declare sub CameraMoveToTarget(byval camera as Camera ptr, byval delta as single)
declare sub CameraYaw(byval camera as Camera ptr, byval angle as single, byval rotateAroundTarget as bool)
declare sub CameraPitch(byval camera as Camera ptr, byval angle as single, byval lockView as bool, byval rotateAroundTarget as bool, byval rotateUp as bool)
declare sub CameraRoll(byval camera as Camera ptr, byval angle as single)
declare function GetCameraViewMatrix(byval camera as Camera ptr) as Matrix
declare function GetCameraProjectionMatrix(byval camera as Camera ptr, byval aspect as single) as Matrix

end extern
