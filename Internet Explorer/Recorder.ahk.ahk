#SingleInstance Force					

Recorder(Delay, Hide)                           
{
Global 
State:=0
Amount := 0
CoordMode, Mouse, Screen
Screen()
Position:=[] 
If (Hide = On)
{
Msgbox, Option is not yet complete
}
Loop
{
ToolTip, click "e" to set location `nclick "ctrl" & "r" to replay                        ;SET ACTIONS
If (GetKeyState("e")&&state=0)
{
Amount++
State:=1
Gui, 2:Font, s16
MouseGetPos, xvar, yvar
Position[Amount]:={X:xvar, Y:yvar}
	Gui, 2:Add, text,% " x"Position[Amount].x-10 " y"Position[Amount].y-12 " c000000",%Amount%
	Gui, 1:Add, Progress,% " x"Position[Amount].x-15 " y" Position[Amount].y-15 " h30" " w30" " BackgroundRed" 
	Append()
}
If(!GetKeystate("e")&&state=1)
{
state:=0
}
If (GetKeyState("r")&&GetKeyState("ctrl"))
{
FileAppend, 
(

------------------------------------------------------------------------------------------
), E:\AHK_Files\Text Folder\Recorder.txt
Tooltip
State:=3
While (1=1)
{
Loop, % Position.Length()                                  ;REPEAT ACTIONS FROM TOTAL ARRAY COUNT
{
If (Actions_List[A_Index] = "")
Status = Off
Else
Status = On
	MouseMove, Position[A_Index].x, Position[A_Index].y 
	ToolTip,% "Values within array: " Actions_list.MaxIndex() "`nCurrent Iteration = " A_Index "`nBlank status: " Status
	Send,% Actions_List[A_Index]
	Sleep,% Delay
}
}
}
}
}

Screen()
{

	Gui,1:-Caption +AlwaysOnTop +E0x20 +LastFound +ToolWindow
	Winset, TransColor, 123456
	Gui, 1:Color, 123456
	Gui, 1:show, x0 y0 w%A_ScreenWidth% h%A_ScreenHeight%

	Gui,2:-Caption +AlwaysOnTop +E0x20 +LastFound +ToolWindow
	Winset, TransColor, 123456
	Gui, 2:Color, 123456
	Gui, 2:show, x0 y0 w%A_ScreenWidth% h%A_ScreenHeight%

}

Append()
{
Global Position, Amount
FileAppend, % "`nxvar := " Position[Amount].x " yvar := " Position[Amount].y, E:\AHK_Files\Text Folder\Recorder.txt
if (A_Hour > 12)
{
totaltime := (A_Hour - 12)  
FileAppend,------------------------ %A_YYYY%-%A_MM%-%A_DD% %totaltime%:%A_Min%Pm, E:\AHK_Files\Text Folder\Recorder.txt
}
else
{
FileAppend,------------------------ %A_YYYY%-%A_MM%-%A_DD% %A_Hour%:%A_Min%Am, E:\AHK_Files\Text Folder\Recorder.txt    
}
}


Actions_List:=["{Click}","https://youtube.com","",""]                                                             ;MAKE SURE TO ADD HIDDEN OPTION
Recorder(500, "Off")

*^P::
{
Pause
Tooltip
Return
}

*^1::
{
If FileExist("E:\AHK_Files\Internet Explorer\Test.ahk.ahk")
{
Run, E:\AHK_Files\Internet Explorer\Test.ahk.ahk
}
Else if FileExist("C:\Users\dannie\Desktop\Internet Explorer\Test.ahk.ahk")
{
Run, C:\Users\dannie\Desktop\Internet Explorer\Test.ahk.ahk
}
Return
}

*^esc::
{
ExitApp
Return
}
