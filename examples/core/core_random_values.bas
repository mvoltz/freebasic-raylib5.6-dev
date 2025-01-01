#pragma once

#include "../../raylib.bi"

dim as long scrW = 800
dim as long scrH = 450
dim as long randValue
dim as long framesCounter = 0

InitWindow(scrW, scrH, "raylib [core] example - generate random values")

randValue = GetRandomValue(-8, 5)

SetTargetFPS(60)

while not WindowShouldClose()

  framesCounter += 1

  if ((framesCounter/120)\2) = 1 Then
    randValue = GetRandomValue(-8, 5)
    framesCounter = 0
  End if

  BeginDrawing()

    ClearBackground(RAYWHITE)

    DrawText("Every 2 seconds a new random value is generated:", 130, 100, 20, MAROON)

    DrawText(TextFormat("%i", randValue), 360, 180, 80, LIGHTGRAY)

  EndDrawing()

wend

CloseWindow()
