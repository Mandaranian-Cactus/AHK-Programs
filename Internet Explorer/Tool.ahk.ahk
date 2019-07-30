#SingleInstance Force

Loop
{
MouseGetPos, xvar, yvar
Tooltip, xvar := %xvar%  yvar := %yvar%
Sleep, 10
}

*^esc::
ExitApp
Return