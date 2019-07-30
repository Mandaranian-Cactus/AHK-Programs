#SingleInstance Force
Gui, show, x600 y80 w550 h575
WinSet, Style, -0xC00000, A
Gui, Color, 0E3047
Gui, +AlwaysOnTop

Gui, add, picture, x0 y0 w575 h625, E:\AHK_Files\Images folder\Background.PNG          ;Background Image

;Buttons

Gui, font, s15, Impact
Gui, add, text, x218 y180 h30 w144 gChange vHighlight
Gui, add, progress, x218 y180 h30 w110 Backgroundc96172 vHighlight_3               ;"Scanner" Button
Gui, add, progress, x222 y180 h30 w140 Backgroundffffff vHighlight_2
Gui, add, text, x258 y182 c191B1D vHighLight_5 BackGroundTrans, Scanner

Gui, font, s15, Impact
Gui, add, text, x218 y253 h30 w114 gRecorderchange vRecorderHighlight
Gui, add, progress, x218 y253 h30 w110 Backgroundc96172 vRecorderHighlight_3               ;Recorder Button
Gui, add, progress, x222 y253 h30 w140 Backgroundffffff vRecorderHighlight_2
Gui, add, text, x258 y255 c191B1D vRecorderHighLight_5 BackGroundTrans, Recorder
Guicontrol, +redraw, RecorderHighLight_5

Gui, font, s15, Impact
Gui, add, text, x218 y323 h30 w114 gTimerchange vTimer1Highlight
Gui, add, progress, x218 y323 h30 w110 Backgroundc96172 vTimerHighlight_3               ;Timer Button
Gui, add, progress, x222 y323 h30 w140 Backgroundffffff vTimerHighlight_2
Gui, add, text, x268 y325 c191B1D vTimerHighLight_5 BackGroundTrans, Timer
Guicontrol, +redraw, TimerHighLight_5

Gui, font, s15, Impact
Gui, add, text, x218 y393 h30 w114 gRandomizerchange vRandomizerHighlight
Gui, add, progress, x218 y393 h30 w110 Backgroundc96172 vRandomizerHighlight_3               ;Randomizer Button
Gui, add, progress, x222 y393 h30 w140 Backgroundffffff vRandomizerHighlight_2
Gui, add, text, x248 y395 c191B1D vRandomizerHighLight_5 BackGroundTrans, Randomizer
Guicontrol, +redraw, RandomizerHighLight_5


Gui, font, s18, Impact
Gui, add, text, x410 y550 w130 h40 gExit 
Gui, add, progress, x410 y550 w130 h40 Background6BC2CB vExitHighlight_3            ;"Exit" Button
Gui, add, progress, x415 y555 w120 h30 Backgroundffffff vExitHighlight_2
Gui, add, text, x458 y555 vExitHighLight_5 BackGroundTrans, Exit
Guicontrol, +redraw, ExitHighLight_5


Gui, font, s18, Impact
Gui, add, text, x265 y550 w130 h40 ghide
Gui, add, progress, x265 y550 w130 h40 Background6BC2CB vHideHighlight_3            ;"Hide" Button
Gui, add, progress, x270 y555 w120 h30 Backgroundffffff vHideHighlight_2
Gui, add, text, x310 y555 vHideHighLight_5 BackGroundTrans, Hide
GUiControl, +redraw, HideHighlight_5

;Main Menu Title

Gui, font, s60, Impact
Gui, add, text, x120 y20 w500 h150 ce14b63 vsubtitle BackGroundTrans, Main Menu      ;"Main Menu" Title
Gui, add ,text, x116 y20 w500 h150 cffffff vtitle BackGroundTrans, Main Menu

;Title Boarder

Gui, add, progress, x55 y15 w485 h10 Backgroundffffff 
Gui, add, progress, x55 y115 w485 h10 Backgroundffffff                    ;Title Boarder

;Circuit board

Gui, add, progress, x0 y405 w150 h5 Background8ccdb0
Gui, add, progress, x0 y425 w90 h5 Background8ccdb0
Gui, add, progress, x0 y385 w90 h5 Background8ccdb0
Gui, add, progress, x150 y395 w25 h25 Background8ccdb0
Gui, add, progress, x85 y350 w5 h35 Background8ccdb0                      ;Three Cord
Gui, add, progress, x90 y425 w5 h35 Background8ccdb0
Gui, add, progress, x90 y350 w60 h5 Background8ccdb0
Gui, add, progress, x90 y460 w60 h5 Background8ccdb0
Gui, add, progress, x150 y340 w25 h25 Background8ccdb0
Gui, add, progress, x150 y450 w25 h25 Background8ccdb0

Gui, add, progress, x500 y325 w200 h5 Background8ccdb0
Gui, add, progress, x500 y275 w5 h50 Background8ccdb0                     ;Single Cord
Gui, add, progress, x425 y275 w75 h5 Background8ccdb0
Gui, add, progress, x400 y265 w25 h25 Background8ccdb0

Gui, add, progress, x135 y125 w7 h75 Background8ccdb0
Gui, add, progress, x125 y200 w25 h25 Background8ccdb0                    ;Dangling Cord

Guicontrol, +redraw, Highlight_5 
Guicontrol, +redraw, subtitle
Guicontrol, +redraw, title


;Hover detector

Loop
{
MouseGetPos, xvar, yvar
	if (218 < xvar and xvar < 362 and 180 < yvar and yvar < 210)
{
GuiControl, +Background5AD261, Highlight_2
GuiControl, +BackgroundC7577E, Highlight_3                                                  ;"Scanner" hover change
Guicontrol, +redraw, Highlight_5
Sleep, 100
GuiControl, +Backgroundffffff, Highlight_2
GuiControl, +Backgroundc96172, Highlight_3
Guicontrol, +redraw, Highlight_5
}
	else if (410 < xvar and xvar < 540 and 550 < yvar and yvar < 590)
{
GuiControl, +Background5AD261, ExitHighlight_2
GuiControl, +BackgroundC7577E, ExitHighlight_3
Guicontrol, +redraw, ExitHighlight_5                                                       ;"Exit" hover Change
Sleep, 100
GuiControl, +Backgroundffffff, ExitHighlight_2
GuiControl, +Background6BC2CB, ExitHighlight_3
Guicontrol, +redraw, ExitHighlight_5  
}
	if (218 < xvar and xvar < 362 and 323 < yvar and 353 > yvar)
{
GuiControl, +Background5AD261, TimerHighlight_2
GuiControl, +BackgroundC7577E, TimerHighlight_3                                                  ;"Timer" hover change
Guicontrol, +redraw, TimerHighlight_5
Sleep, 100
GuiControl, +Backgroundffffff, TimerHighlight_2
GuiControl, +Backgroundc96172, TimerHighlight_3
Guicontrol, +redraw, TimerHighlight_5	
}
	else if (218 < xvar and xvar < 362 and 253 < yvar and 283 > yvar)
{
GuiControl, +Background5AD261, RecorderHighlight_2
GuiControl, +BackgroundC7577E, RecorderHighlight_3                                                  ;"Recorder" hover change
Guicontrol, +redraw, RecorderHighlight_5
Sleep, 100
GuiControl, +Backgroundffffff, RecorderHighlight_2
GuiControl, +Backgroundc96172, RecorderHighlight_3
Guicontrol, +redraw, RecorderHighlight_5
}
	else if (265 < xvar and xvar < 395 and 550 < yvar and yvar < 590)
{
GuiControl, +Background5AD261, HideHighlight_2
GuiControl, +BackgroundC7577E, HideHighlight_3
Guicontrol, +redraw, HideHighlight_5                                                       ;"Hide" hover Change
Sleep, 100
GuiControl, +Backgroundffffff, HideHighlight_2
GuiControl, +Background6BC2CB, HideHighlight_3
Guicontrol, +redraw, HideHighlight_5  
}
	else if (218 < xvar and xvar < 362 and  393 < yvar and yvar < 423)
{
GuiControl, +Background5AD261, RandomizerHighlight_2
GuiControl, +BackgroundC7577E, RandomizerHighlight_3
Guicontrol, +redraw, RandomizerHighlight_5                                                       ;"Randomizer" hover Change
Sleep, 100
GuiControl, +Backgroundffffff, RandomizerHighlight_2
GuiControl, +Backgroundc96172, RandomizerHighlight_3
Guicontrol, +redraw, RandomizerHighlight_5  
}
Sleep, 10
}

Change:
{
GuiControl, +Background48AAE6, Highlight_2
GuiControl, +BackgroundB21D85, Highlight_3
Guicontrol, +redraw, Highlight_5                               ;"Tracker" click change
Sleep, 200
GuiControl, +Backgroundffffff, Highlight_2
GuiControl, +Backgroundc96172, Highlight_3
Guicontrol, +redraw, Highlight_5
Run, E:\AHK_Files\Internet Explorer\Tracker.ahk.ahk
Return
}


Recorderchange:
{
GuiControl, +Background48AAE6, RecorderHighlight_2
GuiControl, +BackgroundB21D85, RecorderHighlight_3
Guicontrol, +redraw, RecorderHighlight_5                               ;"Recorder" click change
Sleep, 200
GuiControl, +Backgroundffffff, RecorderHighlight_2
GuiControl, +Backgroundc96172, RecorderHighlight_3
Guicontrol, +redraw, RecorderHighlight_5
Run, E:\AHK_Files\Internet Explorer\Recorder.ahk.ahk
Return
}

Timerchange:
{
GuiControl, +Background48AAE6, TimerHighlight_2
GuiControl, +BackgroundB21D85, TimerHighlight_3
Guicontrol, +redraw, TimerHighlight_5                               ;"Timer" click change
Sleep, 200
GuiControl, +Backgroundffffff, TimerHighlight_2
GuiControl, +Backgroundc96172, TimerHighlight_3
Guicontrol, +redraw, TimerHighLight_5
Run, E:\AHK_Files\Internet Explorer\Timer.ahk.ahk
Return
}

Randomizerchange:
{
GuiControl, +Background48AAE6, RandomizerHighlight_2
GuiControl, +BackgroundB21D85, RandomizerHighlight_3
Guicontrol, +redraw, RandomizerHighlight_5                               ;"Randomizer" click change
Sleep, 200
GuiControl, +Backgroundffffff, RandomizerHighlight_2
GuiControl, +Backgroundc96172, RandomizerHighlight_3
Guicontrol, +redraw, RandomizerHighLight_5
Run, E:\AHK_Files\Internet Explorer\Randomizer.ahk.ahk
Return
}

exit:
{
GuiControl, +BackgroundF9D877, ExitHighlight_2
GuiControl, +BackgroundA0B5F1, ExitHighLight_3
Guicontrol, +redraw, ExitHighlight_5                                      ;"Exit" click change
Sleep, 200
GuiControl, +Background6BC2CB, ExitHighlight_3
GuiControl, +Backgroundffffff, ExitHighlight_2
Guicontrol, +redraw, ExitHighlight_5
ExitApp
Return
}

hide:
{
GuiControl, +BackgroundF9D877, HideHighlight_2
GuiControl, +BackgroundA0B5F1, HideHighLight_3				;"Hide" command (need to color change)
Guicontrol, +redraw, HideHighlight_5                                     
Sleep, 200
WinMinimize 								
GuiControl, +Background6BC2CB, HideHighlight_3
GuiControl, +Backgroundffffff, HideHighlight_2
Guicontrol, +redraw, HideHighlight_5                                                    
Return
}

