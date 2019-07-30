#SingleInstance Force

Gui, font, c191B1D s15, Lato
Gui, add, edit, w150 h100 vstuff
Gui, add, button, gbutt1, text
Gui, add, button, gbutt2, Confirm
Gui, add, button, gbutt3, Display
Gui, add, text, x351 y51 h30 w114 gchange vHighlight
Gui, add, progress, x347 y51 h30 w110 BackgroundE322A8 vHighlight_3
Gui, add, progress, x351 y51 h30 w110 BackgroundDCD9D9 vHighlight_2
Gui, add, text, x383 y53 vHighLight_5 BackGroundTrans, Hello

Guicontrol, +redraw, Highlight_3
Gui, show, x800 y50 w500 h280
Gui, Color, 0E3047

Return

butt1: 
InputBox, thetext, send text
Return
butt2:
Msgbox, %thetext%
Return
butt3:
GuiControl,text, stuff, %thetext%
Return
change:
{

GuiControl, +Background48AAE6, Highlight_2
GuiControl, +BackgroundB21D85, Highlight_3
Guicontrol, +redraw, Highlight_5
Sleep, 500
GuiControl, +BackgroundDCD9D9, Highlight_2
GuiControl, +BackgroundE322A8, Highlight_3
Guicontrol, +redraw, Highlight_5
Return
}

Loop
{
MouseGetPos, xvar, yvar
	if (347 < xvar and xvar < 467 and 76 < yvar and yvar < 107)
{
GuiControl, +Background5AD261, Highlight_2
GuiControl, +BackgroundC7577E, Highlight_3
Guicontrol, +redraw, Highlight_5
Sleep, 190
GuiControl, +BackgroundDCD9D9, Highlight_2
GuiControl, +BackgroundE322A8, Highlight_3
Guicontrol, +redraw, Highlight_5
}
	else 
{
	 
}
Sleep, 15
}