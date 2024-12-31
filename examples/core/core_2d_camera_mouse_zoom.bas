#include "../../raylib.bi"
#include "../../rlgl.bi"
#include "../../raymath.bi"

dim as long screen_width = 800
dim as long screen_height = 450
dim as Camera2D camera
dim as long zoomMode = 0
dim as Vector2 delta
dim as single wheel
dim as Vector2 mouseWorldPos
dim as single scaleFactor
dim as single deltaX

InitWindow(screen_width, screen_height, "raylib [core] example - 2d camera mouse zoom")

camera.zoom = 1.0

SetTargetFPS(60)

While Not WindowShouldClose()

  if IsKeyPressed(KEY_ONE) Then
    zoomMode = 0
  Elseif IsKeyPressed (KEY_TWO) Then
    zoomMode = 1
  End If

  if IsMouseButtonDown(MOUSE_BUTTON_LEFT) Then
    delta = GetMouseDelta
    delta = Vector2Scale(delta, -1.0/camera.zoom)
    camera.target = Vector2Add(camera.target, delta)
  End If

  if zoomMode = 0 Then
    wheel = GetMouseWheelMove()
    if wheel <> 0 Then
      mouseWorldPos = GetScreenToWorld2D(GetMousePosition(), camera)
      camera.offset = GetMousePosition()
      camera.target = mouseWorldPos

      scaleFactor = 1.0 + (0.25*fabsf(wheel))
      if wheel < 0 Then
        scaleFactor = 1.0/scaleFactor
        camera.zoom = Clamp(camera.zoom*scaleFactor, 0.125, 64.0)
      End If
    End If
  End If
  if IsMouseButtonPressed(MOUSE_BUTTON_RIGHT) Then
    mouseWorldPos = GetScreenToWorld2D(GetMousePosition(), camera)
    camera.offset = GetMousePosition()
    camera.target = mouseWorldPos
  End If
  if IsMouseButtonDown(MOUSE_BUTTON_RIGHT) Then
    deltaX = GetMouseDelta.x
    scaleFactor = 1.0 + (0.01*fabsf(deltaX))
    if deltaX < 0 Then
      scaleFactor = 1.0/scaleFactor
      camera.zoom = Clamp(camera.zoom*scaleFactor, 0.125, 64.0)
    End If
  End If
    
      
  BeginDrawing()
  
    ClearBackground(RAYWHITE)
    
    BeginMode2D(camera)
      '' grid
      rlPushMatrix()
        rlTranslatef(0, 25*50, 0)
        rlRotatef(90, 1, 0, 0)
        DrawGrid(100, 50)
      rlPopMatrix()

      DrawCircle(GetScreenWidth()/2, GetScreenHeight()/2, 50, MAROON)
    
    EndMode2D()
    '' draw mouse reference
    DrawCircleV(GetMousePosition(), 4, DARKGRAY)

    '' TODO 
    DrawTextEx(GetFontDefault(), TextFormat("        ", GetMouseX(), GetMouseY()), Vector2Add(GetMousePosition(), Vector2(-44, -24)), 20, 2, BLACK)
    DrawText("[1][2] Select mouse zoom mode (Wheel or Move)", 20, 20, 20, DARKGRAY)
    if zoomMode = 0 Then
      DrawText("Mouse left button drag to move, mouse wheel to zoom", 20, 50, 20, DARKGRAY)
    Else 
      DrawText("Mouse left button drag to move, mouse press and move to zoom", 20, 50, 20, DARKGRAY)
    End If
    
  EndDrawing()

wend
CloseWindow()
      
