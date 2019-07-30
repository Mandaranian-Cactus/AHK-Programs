#SingleInstance Force

Box_wh := 30
Bot0_wh := 22
Apple_wh := Bot0_wh + 10 

Gui_W := Box_wh * 21
Gui_H := Box_wh * 19

Boarder_Gap := 30
Boarder_H := Gui_H - 2*Boarder_Gap
Boarder_W := Gui_W - 2*Boarder_Gap

Bot0_x := Gui_w//2 - Bot0_wh//2 
Bot0_y := Gui_h//2 - Bot0_wh//2 

Gui, show, w%Gui_w% h%Gui_h%
Gui, color, FF8181

Gui, add, progress, x%Boarder_Gap% y%Boarder_Gap% w%Boarder_W% h%Boarder_H%  BackGround0e3047
Gui, add, progress,  vbot0 x%Bot0_x% y%Bot0_y% w%Bot0_wh% h%Bot0_wh% backGround9CF3FD
Gui, add, progress, vApple w%Apple_Wh% h%Apple_wH% BackGround8ccdb0 

Subbot_Amount := 1
Apple_State := off

Loop
{
if (dir = 1)
Bot0_y -= Box_wh
if (dir = 2)
Bot0_x += Box_wh
if (dir = 3)
Bot0_y += Box_wh
if (dir = 4)
Bot0_x -= Box_wh

Guicontrol, move, Bot0, x%Bot0_x% y%Bot0_y%

if (Bot0_x < Boarder_Gap or Bot0_x > Boarder_Gap + Boarder_w or Bot0_y < Boarder_Gap or Bot0_y > Boarder_Gap + Boarder_h)
{
Ending()
}

Loop, %Subbot_Amount%
{
AIndex := A_Index + 1
Extra_x := Bot0_x
Extra_y := Bot0_y
Other_Bot0_x :=	Bot0_x + Bot0_wh				;CORNERS
Other_Bot0_y := Bot0_y + Bot0_wh

if (Bot0_x = Bot%AIndex%_x and Bot0_y = Bot%AIndex%_y)
{
Reset()
}

else if (Other_Bot0_x = Bot%AIndex%_x and Other_Bot0_y= Bot%AIndex%_y)
{
Reset()
}
}

if (Bot0_x >= Apple_x and Bot0_x <= Apple_x + Apple_Wh and Bot0_y >= Apple_y and bot0_y <= Apple_y + Apple_wH )
{
Subbot_amount++
gui, add, progress,% " vbot"Subbot_amount " w"Bot0_wh " h"Bot0_wh

Apple_State := off
}

else if (Other_Bot0_x >= Apple_x and Other_Bot0_x <= Apple_x + Apple_Wh and Other_Bot0_y >= Apple_y and Other_bot0_y <= Apple_y + Apple_H )
{
Subbot_amount++
gui, add, progress,% " vbot"Subbot_amount " w"Bot0_wh " h"Bot0_wh

Apple_State := off
}

if (Apple_State = off)
{
Random, Apple_x, 1,% Gui_w // Box_wh - 2
Random, Apple_y, 1,% Gui_h // Box_wh - 2
Apple_x := Apple_x * 30 
Apple_y := Apple_y * 30 
GuiControl, Hide, Apple
GuiControl, +redraw, Apple
Guicontrol, move, Apple, x%Apple_x% y%Apple_y% 
Apple_State = On
}

Subbot_# := Subbot_Amount 				;GENERATES SUBBOT_#

Loop, %Subbot_amount%
{
Fake_Subbot_# := Subbot_# - 1
bot%Subbot_#%_x := bot%Fake_Subbot_#%_x
bot%subbot_#%_y := bot%Fake_Subbot_#%_y
Guicontrol, move,bot%subbot_#%,% " x"bot%Subbot_#%_x " y"bot%subbot_#%_y  
Subbot_#--
}

if(Subbot_# = 0)
{
Subbot_# := Subbot_Amount				;RESET SUBBOT_#
}
Sleep, 100
}

Reset()
{
Global 

if (dir = 1)
Extra_y += Box_wh
if (dir = 2)
Extra_x -= Box_wh
if (dir = 3)
Extra_y -= Box_wh
if (dir = 4)
Extra_x += Box_wh
Gui, add, progress, x%Extra_x% y%Extra_y% w%Bot0_wh% h%Bot0_wh%  Backgroundfff000
Gui, add, progress, x%Bot0_x% y%Bot0_y% w%Bot0_wh% h%Bot0_wh%  BackGroundFF8181
Ending()
pause
}

Grid()
{
Global 
Gap := 1

Loop,% Gui_w // Box_wh 
{
x_add += Box_wh - gap
Gui, add, progress, x%x_add% y0 w2 h%Gui_h%
x_add += gap
}

Loop,% Gui_h // Box_wh
{
y_add += Box_wh - gap
Gui, add, progress, x0 y%y_add% w%Gui_w% h2 
y_add += gap
}
}

Ending()
{
Global

Color_array := ["9CF3FD", "B59CFD", "FD9CEE", "9CFDED", "FDF99C"]

ignore_thisy := 0
ignore_thisx := 0

Loop,% Gui_h // 75 + 1
{
Loop,% Gui_w // 75 + 1
{
gui, add, progress, x%ignore_thisx% y%ignore_thisy% w150 h150
ignore_thisx += 75
sleep, 3
}
ignore_thisy += 75
ignore_thisx := 0
}

random, color, 1, Color_Array.GetCapacity()
background := Color_array[color]
Gui, add, progress, vasdf x0 y0 w%Gui_w% h%Gui_h% backGround%background%
Sleep, 100

Loop, 13
{
random, color, 1, Color_Array.GetCapacity()
background := Color_array[color]
Guicontrol, +Background%background%, asdf
sleep, 100
}


Pause
}

*up::
Dir := 1
Return

*down::
Dir := 3
Return

*left::
Dir := 4
Return

*right::
Dir := 2
Return

*^esc::
ExitApp
Return


*^r::
run, E:\AHK_Files\Internet Explorer\Snake_game.ahk.ahk
Return