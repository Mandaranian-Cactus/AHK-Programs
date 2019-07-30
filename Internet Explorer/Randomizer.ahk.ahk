#SingleInstance Force

Random(Amount, Multiplier, Delay)
{
Global 

------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------- Variables --------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------

Movement_Dir := 0											;Gets the "Dir" and "Movement" for NPCs

xorigin := Screen.w // 2 - NPC.width // 2  
yorigin := Screen.h // 2 - NPC.Height // 2

------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------- Gui Display --------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------

Gui, show,  % " h"Screen.h " w"Screen.w, GuiScreen									;Delete X and Y options to center GUI		(" x0" " y0")
Gui, -Caption 								
Gui, color, % " c"Screen.color
Gui, add, progress, %  " x"xorigin  " y"yorigin " h"NPC.Height " w"NPC.Width " vOrigin" " BackGroundffffff"			;Origin Template 	

------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------- Naming And NPC Characteristics -------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------

While (A_Index <= Amount)
{
Xvar%A_Index% := xorigin														;A_Index Bot Traits
Yvar%A_Index% := yorigin
Random, Color, 1, Color_Array.GetCapacity()
NPC_Color%A_Index% := Color_Array[Color]	 
Gui, add, progress, % " x"xorigin  " y"yorigin  " h"NPC.Height " w"NPC.Width " vBot"A_Index " BackGround"NPC_Color%A_Index%	
Gui, Add, Progress, % " vSubBot"A_Index " x"xorigin " y"yorigin " h"NPC.height " w"NPC.Width " BackGround"NPC_Color%A_Index%		;Currently unused
}

------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------- Transition Delay ---------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------

Sleep, 300 																  ;Wait time for Transition

------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------- Direction And Movement ---------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------

Loop
{
Loop
{
If (Movement_Dir < Amount)                 												  ;"<=" is not used due to the value of "Movement_Value"
{
Movement_Dir++
Random, Dir%A_Index%, 1, 4
Random, Movement%A_Index%, 1, 8
True_Movement%A_Index% := Movement%A_Index% * Multiplier
if(Dir%A_Index% = 1)
{
Yvar%A_Index% -= True_Movement%A_Index%
}
Else if (Dir%A_Index% = 2)
{
Xvar%A_Index% += True_Movement%A_Index%
}
Else if (Dir%A_Index% = 3)														;Specifications for Direction (Dir)
{
Yvar%A_Index% += True_Movement%A_Index%
}
Else if (Dir%A_Index% = 4)
{
Xvar%A_Index% -= True_Movement%A_Index%
}
GuiControl, move, Bot%A_Index%,% " x"Xvar%A_Index% " y"Yvar%A_Index% 
Reset() 
If (Movement_Dir = Amount)
{
Movement_Dir := 0
break
}
}
}
Sleep, %Delay%											;DELAY BETWEEN EACH ITERATION				
}
}

------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------- Cutomizable Options ------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------

Color_Array := ["90E48B", "C98BE4", "E24E4E", "7BD7EB"]
Screen := {x:600, y:300, h:650, w:1000, color:"000000"}
NPC := {Height:15, Width:15}	

Random(10, 19, 150)    					;(Amount, Multiplier, Delay)


------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------- Other Functions ----------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------

Reset()
{
Global
if (xvar%A_Index% >= Screen.w)					;Right
{
Gui, Add, Progress, % " x"Screen.w-NPC.Width+7 " y"Yvar%A_Index% " w"NPC.Width " h"NPC.Height 				;REMINDER!!!!!!!!!!!!!!!!!!!!!!!
;Guicontrol, Move, SubBot%A_Index%,% " x"Screen.w " y"Yvar%A_Index% " BackGroundRed"							;OPTIONS "UP" AND "DOWN"
GuiControl, move, Bot%A_Index%,  % " x"xorigin  " y"yorigin										;ARE FLIPPING STUPID AND UNREASONABLE
xvar%A_Index% := xorigin														;REMEMBER!!!!!!!!!!!!!!!!!!!!!!
yvar%A_Index% := yorigin
}
if (xvar%A_Index% <= 0)						;Left
{
Gui, Add, Progress,% " x0" " y"yvar%A_Index% " w"NPC.Width " h"NPC.Height 						
;Guicontrol, Move, SubBot%A_Index%,% " x0" " y"yvar%A_Index% " BackGroundRed"
GuiControl, move, Bot%A_Index%,  % " x"xorigin  " y"yorigin	
xvar%A_Index% := xorigin
yvar%A_Index% := yorigin
}
if (yvar%A_Index% >=  Screen.H)					;Down
{
Gui, Add, Progress,% " x"xvar%A_Index% " y"Screen.H+15 " w"NPC.Width " h"NPC.Height 					;CODE FOR SUBBOTS MAY SEEM A LITTLE WEIRD 			
;Guicontrol, Move, SubBot%A_Index%,% " x"xvar%A_Index% " y"Screen.H " BackGroundRed"
GuiControl, move, Bot%A_Index%,  % " x"xorigin  " y"yorigin	
xvar%A_Index% := xorigin
yvar%A_Index% := yorigin
}
if(yvar%A_Index% <= 0)						;Up
{
Gui, Add, Progress,% " x"xvar%A_Index% " y0" " w"NPC.Width " h"NPC.Height 
;Guicontrol, Move, SubBot%A_Index%,% " x"xvar%A_Index% " y0" " BackGroundRed"
GuiControl, move, Bot%A_Index%,  % " x"xorigin  " y"yorigin	
xvar%A_Index% := xorigin
yvar%A_Index% := yorigin
}
}



------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------- Key Bindings -------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------

*^esc::
ExitApp
Return
