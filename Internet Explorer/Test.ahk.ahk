#SingleInstance Force

*LButton::
click
Sleep, 50
MouseGetPos, xpos, ypos
MouseMove, Xpos, Ypos + 20
return

F1:: MsgBox, %var%

*^esc::
msgbox, bob
ExitApp
Return
