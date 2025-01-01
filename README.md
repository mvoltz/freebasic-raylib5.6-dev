# raylib-freebasic 5.6-dev

***DISCLAIMER***
I'm a hobby programmer programming for fun. YMMV.
Expect errors and you won't be disappointed.

---

[FreeBasic](https://freebasic.net/) bindings for [raylib](https://github.com/raysan5/raylib)  

Some examples are compiling and working on linux.

I'm using fbfrog to translate header files to .bi files.


Lib | Linux | Windows | Mac | BSD |
--- | ----- | ------- | --- | --- |
raylib.bi | In Progress | untested |  untested |  untested
raymath.bi | untested | untested |  untested |  untested
raygui.bi | untested | untested | untested | untested

## example
```basic
#include "raylib.bi"

Dim As Const Integer screen_width = 800
Dim As Const Integer screen_height = 450

InitWindow(screen_width, screen_height, "Hello World")
SetTargetFPS(60)

While Not WindowShouldClose()
	BeginDrawing()
		ClearBackground(RAYWHITE)
		DrawText("Hello World from raylib and FreeBasic!", 200, 200, 20, GRAY)
	EndDrawing()
Wend

CloseWindow()
```

Instructions TBD
