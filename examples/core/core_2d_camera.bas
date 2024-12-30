#include "../../raylib.bi"

#define MAX_BUILDINGS  100

dim as long screen_width = 800
dim as long screen_height = 450
dim as Rectangle player
dim as long spacing
dim as long i
dim as Camera2D camera
dim buildings(0 to 99) as Rectangle
dim buildColors(0 to 255) as RLColor

InitWindow(screen_width, screen_height, "raylib [core] example - 2d camera")

player = Rectangle(400, 280, 40, 40)

spacing = 0

For i as long = 0 To MAX_BUILDINGS - 1
  buildings(i).width_ = GetRandomValue(50, 200)
  buildings(i).height_ = GetRandomValue(100, 800)
  buildings(i).y = screen_height - 130.0 - buildings(i).height_
  buildings(i).x = -6000.0 + spacing
  spacing += buildings(i).width_
  buildColors(i) = RLColor(GetRandomValue(200, 240), GetRandomValue(200, 240), GetRandomValue(200, 250), 255)
Next i
  
'' camera = 0
camera.target = Vector2(player.x + 20.0, player.y + 20.0)
camera.offset = Vector2(screen_width/2.0, screen_height/2.0)
camera.rotation = 0.0
camera.zoom = 1.0
SetTargetFPS(60)

While Not WindowShouldClose()
  if IsKeyDown(KEY_RIGHT) Then 
    player.x += 2
  ElseIf IsKeyDown(KEY_LEFT) Then 
    player.x -= 2
  End If
  camera.target = Vector2(player.x + 20, player.y + 20)
  if IsKeyDown(KEY_A) Then 
    camera.rotation -= 1
  ElseIf IsKeyDown(KEY_S) Then 
    camera.rotation += 1
  End If

  camera.zoom += GetMouseWheelMove()*0.05
  if camera.zoom > 3.0 Then 
    camera.zoom = 3.0
  ElseIf camera.zoom < 0.1 Then 
    camera.zoom = 0.1
  End If
  if IsKeyPressed(KEY_R) Then
    camera.zoom = 1.0
    camera.rotation = 0.0
  End If

  BeginDrawing()
  
    ClearBackground(RAYWHITE)
    
    BeginMode2D(camera)
    
      DrawRectangle(-6000, 320, 13000, 8000, DARKGRAY)
      
      For i as long = 0 to MAX_BUILDINGS - 1
        DrawRectangleRec(buildings(i), buildColors(i))
      Next i 
      
      DrawRectangleRec(player, RED)
      
      DrawLine(camera.target.x, -screen_height*10, camera.target.x, screen_height*10, GREEN)
      
      DrawLine(-screen_width*10, camera.target.y, screen_width*10, camera.target.y, GREEN)
    
    EndMode2D()
    
    DrawText("SCREEN AREA", 640, 10, 20, RED)

    DrawRectangle(0, 0, screen_width, 5, RED)
    DrawRectangle(0, 5, 5, screen_height - 10, RED)
    DrawRectangle(screen_width - 5, 5, 5, screen_height - 10, RED)
    DrawRectangle(0, screen_height - 5, screen_width, 5, RED)

    DrawRectangle(10, 10, 250, 113, Fade(SKYBLUE, 0.5))
    DrawRectangleLines(10, 10, 250, 113, BLUE)

    DrawText("Free 2d camera controls:", 20, 20, 10, BLACK)
    DrawText("- Right/Left to move Offset", 40, 40, 10, DARKGRAY)
    DrawText("- Mouse Wheel to Zoom in-out", 40, 60, 10, DARKGRAY)
    DrawText("- A / S to Rotate", 40, 80, 10, DARKGRAY)
    DrawText("- R to reset Zoom and Rotation", 40, 100, 10, DARKGRAY)

  EndDrawing()

wend
      
