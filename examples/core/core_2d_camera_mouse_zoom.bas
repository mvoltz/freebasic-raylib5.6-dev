#include "../../raylib.bi"
#include "../../rlgl.bi"
#include "../../raymath.bi"


dim as long screen_width = 800
dim as long screen_height = 450
dim as Camera2D camera
dim as long zoomMode = 0

InitWindow(screen_width, screen_height, "raylib [core] example - 2d camera mouse zoom")

camera.zoom = 1.0

SetTargetFPS(60)

While Not WindowShouldClose()

  BeginDrawing()
  
    ClearBackground(RAYWHITE)
    
    BeginMode2D(camera)
    
    
    EndMode2D()
    
  EndDrawing()

wend
      
