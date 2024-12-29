# raylib-freebasic -> v5.5 (WIP) - DO NOT USE YET

[FreeBasic](https://freebasic.net/) bindings for [raylib](https://github.com/raysan5/raylib)  

'raylib.bi' is coming along nicely.
'raygui.bi' is going to take some noodling - going from 3.x to 4.5
'raymath.bi' not started
  
Lib | Linux | Windows | Mac | BSD |
--- | ----- | ------- | --- | --- |
raylib.bi | untested | untested |  untested |  untested
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

![Example](example.png)  
  
    

## compiling
you need to have raylib on your device, tested with shared lib but static lib should also work

### raylib

#### linux
include **raylib.bi** in your project and it should work, all of dependencies are defined inside the file

#### windows
include **raylib.bi** in your project and it should work, all of dependencies are defined inside the file
i primarily use linux so tests were mostly made using mingw and wine without encountering any issues
some users had problems with linking, changing ``` #include "raylib" ``` to ``` #include "raylibdll" ``` helped

### raygui
you have to either compile raygui with raylib or as a separate lib
for more info i advice looking into this [thread](https://github.com/WIITD/raylib-freebasic/issues/7)

for more info about building raylib visit [official wiki](https://github.com/raysan5/raylib/wiki)
and for raygui check [official repo](https://github.com/raysan5/raygui#building)

## examples
[examples][https://github.com/WIITD/raylib-freebasic/tree/main/examples]
simple game i wrote that uses [raylib-freebasic](https://github.com/WIITD/asteroid_field/tree/raylib-freebasic)
