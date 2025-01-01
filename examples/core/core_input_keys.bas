#pragma once

#include "../../raylib.bi"

dim as long scrW = 800
dim as long scrH = 450
dim as Vector2 ballPosition

InitWindow(scrW, scrH, "raylib [core] example - keyboard input")

ballPosition = Vector2(scrW\2, scrH\2)

SetTargetFPS(60)

while not WindowShouldClose()

  if IsKeyDown(KEY_RIGHT) Then ballPosition.x += 2.0
  if IsKeyDown(KEY_LEFT)  Then ballPosition.x -= 2.0
  if IsKeyDown(KEY_UP)    Then ballPosition.y -= 2.0
  if IsKeyDown(KEY_DOWN)  Then ballPosition.y += 2.0

  BeginDrawing()
    ClearBackground(RAYWHITE)
    DrawText("move the ball with arrow keys", 10, 10, 20, DARKGRAY)
    DrawCircleV(ballPosition, 50, MAROON)
  EndDrawing()
wend
CloseWindow()

