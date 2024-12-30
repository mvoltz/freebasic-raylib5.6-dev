# raylib-freebasic -> v5.5/5.6 (WIP)

***DISCLAIMER***
I am a "hobby" programmer. 

I only program for fun so if you're experienced in FreeBASIC or Raylib I welcome code critiques.

Expect errors and you won't be disappointed.

[FreeBasic](https://freebasic.net/) bindings for [raylib](https://github.com/raysan5/raylib)  

'raylib.bi' is coming along nicely.

The examples will progress as my FB skills improve.  There's just a few for now.

'raygui.bi' is going to take some noodling - going from 3.x to 4.5.

'raymath.bi' is not yet started.

I will eventually test from Windows, but I don't own a Mac.  Any help is appreciated there.

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
