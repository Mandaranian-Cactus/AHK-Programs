#SingleInstance Force

;Variables

Boolean = False

Width := 3.5
Height := Width
Gap := 5
Sub_w := 3
Sub_h := 1.25 

*+P::
Gui, Destroy
WinGetActiveStats, Title, ScreenWidth, ScreenHeight, X, Y 
X_center := % ScreenWidth / 2 + X - Width / 2
Y_center := % ScreenHeight / 2 + Y - Height / 2 ; Additional 30 pixels is meant to carry the height of "the heading" (Prob remove if FULL SCREEN)
; Main 
; +13

Gui, add, progress,% " w"Width " h"Height " x"X_center " y"Y_center  " BackGroundF16D51"

; Sides

;Top, Left (In order)
Gui, add, progress,% " w"Sub_w " h"Sub_h " x"X_center + (Width - Sub_w)/2 " y"Y_center - (Gap + Sub_h)  " BackGroundF16D51"
Gui, add, progress,% " w"Sub_h " h"Sub_w " x"X_center - (Gap + Sub_h) " y"Y_center + (Width - Sub_w)/2  " BackGroundF16D51"

;Bottom, Right (In order)
Gui, add, progress,% " w"Sub_w " h"Sub_h " x"X_center + (Width-Sub_w)/2 " y"Y_center + (Height + Gap)  " BackGroundF16D51"
Gui, add, progress,% " w"Sub_h " h"Sub_w " x"X_center + (Width + Gap) " y"Y_center + (Width-Sub_w)/2  " BackGroundF16D51"

Gui, -Caption +LastFound +ToolWindow +AlwaysOnTop +E0x20 ; "+LastFound" puts the window as the last viewed and allows for "winset" (All transparency will show ANY TABS AND IGNORES TASKBAR)
Gui,show, x0 y0 w%A_screenwidth% h%A_screenheight%
Gui, color, Invis
Winset, TransColor, Invis

if (Boolean == "False") {
Gui, Show
Boolean = True 
}
else{
Gui, Hide
Boolean = False
}
return

*^esc::
ExitApp
return