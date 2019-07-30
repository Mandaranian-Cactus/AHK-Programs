#SingleInstance Force
SetBatchLines, -1

Amount := 0

CoordMode, Pixel, Screen
CoordMode, Mouse, Screen
Process, Priority, Aimbot_MS.ahk.ahk, High

Gui, Color, 0xD82A22
Gui, -Caption +AlwaysOnTop 


*^e::
Amount++
if (Amount > 2)
Amount := 1
MouseGetPos, Xvar%Amount%, Yvar%Amount%
if (Amount = 2)
Gui, show,% " x"Xvar1 " y"Yvar1 " w"Xvar2 - Xvar1 " h"Yvar2 - Yvar1 
Winset, Transparent, 100, Aimbot_MS.ahk.ahk
Return

*^z::  
ImageSearch, xvar0, yvar0, xvar1, yvar1, xvar2, yvar2, C:\Users\dannie\Pictures\Half_note.PNG
run, C:\Users\dannie\Pictures\Half_note.PNG
msgbox, %xvar0% %yvar0%
if ErrorLevel
    MsgBox, That image was not found in the specified region.
else
    MsgBox, The image was found.
Sleep, 100
return

*^esc::
ExitApp
Return