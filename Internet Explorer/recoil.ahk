#NoEnv
#SingleInstance Force
SendMode Input

~Q:: Suspend

*^esc::
ExitApp
return

~C & ~LButton::
Loop ;Loops through to check if keys are held down
	If GetKeyState("LButton", "LCtrl") {
		Sleep, 17
		moveAmount := (moveAmount = 2) ? -2 : 2  ; moveAmount := (moveAmount = 0) ? 3 : 0 
 		counter ++
		mouseXY(moveAmount,3.2) ;3.4
		
	}
	else
	break
	
Return

mouseXY(x,y)
{
DllCall("mouse_event",int,1,int,x,int,y,uint,0,uint,0)
}