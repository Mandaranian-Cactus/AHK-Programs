#SingleInstance Force
coordMode, Mouse, relative

Loop
{
mousegetpos, xvar, yvar
tooltip, %xvar% %yvar%
sleep, 10
}

*Up::
MouseMove, xvar, yvar - 1
return
*Down::
MouseMove, xvar, yvar + 1
return
*Left::
MouseMove, xvar - 1, yvar
return
*Right::
MouseMove, xvar + 1, yvar
return

*^esc::
Exitapp
Return