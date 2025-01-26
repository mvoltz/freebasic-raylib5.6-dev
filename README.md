# raylib-freebasic 5.6-dev

***DISCLAIMER***
I'm a hobby programmer doing this for fun. YMMV.
Expect errors and you won't be disappointed. Please let me know if you find any issues.

---

[FreeBasic](https://freebasic.net/) bindings for [raylib](https://github.com/raysan5/raylib)  

Some examples are compiling and working on linux. More examples should mean more bugs found/fixed.

Lib | Linux | Windows | Mac | BSD |
--- | ----- | ------- | --- | --- |
raylib.bi | In Progress | untested |  untested |  untested
raymath.bi | untested | untested |  untested |  untested
raygui.bi | untested | untested | untested | untested

** Testing with FreeBASIC built from source (1.20) **

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

HOWTO
-----
- Install Freebasic
- Install Raylib
- Clone this repo to a new project folder
- In the 'examples' folder, compile and run an example to see if it works on your system
- That's it, hopefully
