#SingleInstance Force

Gui,1:-Caption +AlwaysOnTop 

e::
Screen()
Return

Screen()
{
Global

Color_array := ["9CF3FD", "B59CFD", "FD9CEE", "9CFDED", "FDF99C", "FEC882", "ADFE82", "0022FC", "FC00FC", "FC0000", "00FCE5", "3200FC"]
Gui, show, x0 y0 w%A_Screenwidth% h%A_screenheight%

Loop
{
random, color, 1, Color_Array.GetCapacity()
background := Color_array[color]
gui, color, %background%
sleep, 57
}
}

*^esc::
{
ExitApp
}
