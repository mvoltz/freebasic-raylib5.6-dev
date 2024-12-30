#include "../../raylib.bi"

Enum GameScreen 
  LOGO = 0
  TITLE
  GAMEPLAY
  ENDING
End Enum

dim as integer screen_width = 800
dim as integer screen_height = 450
dim as long framesCounter
dim as GameScreen currentScreen

InitWindow(screen_width, screen_height, "raylib [core] example - basic screen manager")

currentScreen = LOGO

framesCounter = 0

SetTargetFPS(60)

while not WindowShouldClose()

  Select Case currentScreen
    Case LOGO
      framesCounter+=1
      if framesCounter > 120 Then
        currentScreen = TITLE
      End If
    Case TITLE
      if IsKeyPressed(KEY_ENTER) OrElse IsGestureDetected(GESTURE_TAP) Then
        currentScreen = GAMEPLAY
      End If
    Case GAMEPLAY
      if IsKeyPressed(KEY_ENTER) OrElse IsGestureDetected(GESTURE_TAP) Then
        currentScreen = ENDING
      End If
    Case ENDING
      if IsKeyPressed(KEY_ENTER) OrElse IsGestureDetected(GESTURE_TAP) Then
        currentScreen = TITLE
      End If
  End Select

  BeginDrawing()
    ClearBackground(RAYWHITE)
    Select Case currentScreen
      Case LOGO
        DrawText("LOGO SCREEN", 20, 20, 40, LIGHTGRAY)
        DrawText("WAIT for 2 SECONDS...", 290, 220, 20, GRAY)
      Case TITLE
        DrawRectangle(0, 0, screen_width, screen_height, GREEN)
        DrawText("TITLE SCREEN", 20, 20, 40, DARKGREEN)
        DrawText("PRESS ENTER or TAP to JUMP to GAMEPLAY SCREEN", 120, 220, 20, DARKGREEN)
      Case GAMEPLAY
        DrawRectangle(0, 0, screen_width, screen_height, PURPLE)
        DrawText("GAMEPLAY SCREEN", 20, 20, 40, MAROON)
        DrawText("PRESS ENTER or TAP to RETURN to ENDING SCREEN", 130, 220, 20, MAROON)
      Case ENDING
        DrawRectangle(0, 0, screen_width, screen_height, BLUE)
        DrawText("ENDING SCREEN", 20, 20, 40, DARKBLUE)
        DrawText("PRESS ENTER or TAP to RETURN to TITLE SCREEN", 120, 220, 20, DARKBLUE)
    End Select

  EndDrawing()
wend
