#SingleInstance Force
coordmode, mouse, relative
Counter := 0
Key := 0
Rock_x := 1299
Rock_y := 899

*+g::
sleep, 1000
Loop
{
send, {tab}
Mousemove, Rock_x, Rock_y
sleep, 100
Loop, 6
{
click
sleep, 100
}
sleep, 4500
send, {tab}
sleep, 100
Loop, 6
{
Key++
Send, %Key%
sleep, 50
loop, 35
{
click
sleep, 2000
Counter++
}
}
}

*+o::
pause

*^esc::
exitapp
return