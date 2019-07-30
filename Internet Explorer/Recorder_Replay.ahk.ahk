#SingleInstance Force

State := 0

     If (A_Hour > 12)
{
	totaltime := A_Hour - 12
	FileName := A_YYYY "-" A_MM "-" A_DD " " totaltime ";" A_Min "Pm"                 ;version one (doesn't matter)
}
  
   
     Else If (A_Hour < 12)
{
	FileName = %A_YYYY%-%A_MM%-%A_DD% %A_Hour%;%A_Min%Am					;version two (doesn't matter)  
}

FileAppend, 
(
#SingleInstance Force

), E:\AHK_Files\Text Folder\Recorder_Converter\%FileName%.ahk		

Loop, Read, E:\AHK_Files\Text Folder\Recorder.txt
{
If InStr(A_LoopReadLine, "xvar")
{
StringGetPos, LocationXStart, A_LoopReadLine, xvar     				  
StringGetPos, LocationXYMiddle, A_LoopReadLine, yvar					;For StrinGetPos, 0 is the staring charartcer and not the last
LengthX := LocationXYMiddle - LocationXStart - 9
StringMid, LocationX, A_LoopReadLine, LocationXStart + 9, LengthX			;For StringMid, 0 is the last chararcter			
StringGetPos, LocationYEnd, A_LoopReadLine, -
LengthY := LocationYEnd - LocationXYMiddle - 8
StringMid, LocationY, A_LoopReadLine, LocationXYMiddle + 9, LengthY			;For StringMid, 0 is the last charartcer

FileAppend, 
(

MouseMove, %LocationX%, %locationY%
Sleep, 2000
), E:\AHK_Files\Text Folder\Recorder_Converter\%FileName%.ahk				
}
State := 0
}
											
FileAppend,
( 

*^esc::
{
ExitApp
Return											;Exit Option ------- Added
}
)
, E:\AHK_Files\Text Folder\Recorder_Converter\%FileName%.ahk