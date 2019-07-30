#SingleInstance Force
SetBatchLines, -1

Gui(Width, Height, color)
{
Global

Gui, show,% " w"Width " h"Height 
Gui, color, % Color
Player2x := 100
Player2y := 100
Playerx := Width - 100
Playery := Height//2 - 30//2
Gui, add, progress, vplayer1 h30 w30 x%playerx% y%playery% BackGroundGreen
Gui, add, progress, vplayer2 h30 w30 x%player2x% y%player2y% BackGroundRed
}


Player_Options()
{
Global

Player_Movement := 15
Delay := 1

BarrierH := 80
BarrierW := 50
BarrierX := 500
BarrierY := 500

Gui, Add, progress, vbarrier x%barrierX% y%barriery% w%barrierW% h%BarrierH% 

Loop
{
if (playerx <= barrierx + barrierw and playery >=  barriery and playery <= barriery + barrierh)
msgbox, hello
if GetKeyState("W")
{
player2y -= Player_Movement
GuiControl, Move, player2,% " x"Player2x " y"Player2y
}
if GetKeyState("S")
{
player2y += Player_Movement
GuiControl, Move, player2,% " x"Player2x " y"Player2y
}
if GetKeyState("A")
{
player2x -= Player_Movement
GuiControl, Move, player2,% " x"Player2x " y"Player2y

}
if GetKeyState("D")
{
player2x += Player_Movement
GuiControl, Move, player2,% " x"Player2x " y"Player2y
}



if GetKeyState("/")
{
Fire()
}
Sleep, 1
}
}

Fire()
{
Global
Fire_Amount += 1
Firey := Playery
Firex := Playerx
Gui, add, progress, % " x"Playerx " y"Playery-40  " v"Fire_Amount " h30" " w30"


if (Dir = 1)
{
Loop, 5
{
Firey -= 50
GuiControl, move, Fire_amount,% " x"Playerx " y"Firey " w30" " h30"

}
}
}


Gui(A_ScreenWidth, A_ScreenHeight, 000000)
Player_Options()

*^esc::
ExitApp
Return

*up::
Sleep, % Delay
playery -= Player_Movement
GuiControl, Move, player1,% " x"Playerx " y"Playery
Dir := 1
Return 

*Down::
Sleep, % Delay
playery += Player_Movement
GuiControl, Move, player1,% " x"Playerx " y"Playery
Dir := 3
Return

*Left::
Sleep, % Delay
playerx -= Player_Movement
GuiControl, Move, player1,% " x"Playerx " y"Playery
Dir := 4
Return

*Right::
Sleep, % Delay
playerx += Player_Movement
GuiControl, Move, player1,% " x"Playerx " y"Playery
Dir := 2
Return
