#SingleInstance Force


pause = 0
hr = 0
thr = 0
sec = 0
tsec = 0
min = 0
tmin = 0

Gui, +AlwaysOnTop
Gui, Color, 000000
Gui, Add, Button, x20 y50 h20 w80 gPause vPause, Pause
Gui, Add, BUtton, x55 y70 h20 w80 gwakeup vwakeup, Egg Timer
Gui, Add, Button, x100 y50 w80 h20 greset vReset, Reset
Gui, font, s19
Gui, Add, Text, x55 y12 BackgroundTrans vTText c1EB400, %thr%%hr%:%tmin%%min%:%tsec%%sec%
Gui, Show, x1150 y0 h100 w200, Stopwatch
 
Settimer, timer, 1000
Return


Timer: 
{
sec += 1                                     ;Actual timer

if (sec > 9)                                           ;Restrictions begin from here
{
tsec += 1          
sec = 0
}

if (tsec > 5 and sec = 0)
{
min += 1 
tsec = 0
}

if (min > 9) 
{
tmin += 1
min = 0
}

if (tmin > 5 and min = 0)
{
hr += 1
tmin = 0
}

if (hr > 9)
{
thr += 1
hr = 0
}

GuiControl, text, TText, %thr%%hr%:%tmin%%min%:%tsec%%sec%
Return
}

Pause:
{
if(stopped = 0)
{
	Settimer, timer, off
	stopped = 1
}
else
{
	Settimer, timer, on
	stopped = 0
}
Return
}

Wakeup:
return

Reset:
{
hr = 0
thr = 0
sec = 0
tsec = 0
min = 0
tmin = 0
GuiControl, text, TText, %thr%%hr%:%tmin%%min%:%tsec%%sec%
Settimer, timer, off
stopped = 1
Return
}