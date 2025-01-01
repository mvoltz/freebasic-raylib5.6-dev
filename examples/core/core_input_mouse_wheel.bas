#pragma once

#include "../../raylib.bi"

dim as long scrW = 800
dim as long scrH = 450
dim as long boxPositionY
dim as long scrollSpeed

InitWindow(scrW, scrH, "raylib [core] example - input mouse wheel")

boxPositionY = scrH/2 - 40
scrollSpeed = 4

SetTargetFPS(60)

print boxPositionY
print GetMouseWheelMove()

while not WindowShouldClose()

  boxPositionY -= GetMouseWheelMove() * scrollSpeed

  BeginDrawing()

    ClearBackground(RAYWHITE)

    DrawRectangle(scrW\2 - 40, boxPositionY, 80, 80, MAROON)

    DrawText("Use mouse wheel to move the cube up and down!", 10, 10, 20, GRAY)
    DrawText(TextFormat("Box position Y: " & boxPositionY), 10, 40, 20, LIGHTGRAY)

  EndDrawing()

wend

CloseWindow()  
