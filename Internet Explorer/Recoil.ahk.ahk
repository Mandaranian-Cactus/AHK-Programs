#SingleInstance Force

*Alt:: 
Suspend
return

LButton::
click
DllCall("mouse_event", "UInt", 0x01, "UInt", 0, "UInt", 40)
sleep,100
return

*^esc::
ExitApp
Return
