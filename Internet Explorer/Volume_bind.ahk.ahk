#SingleInstance Force

;"*" makes it so that keybinds can happen during another script

*+Home::  		;VOLUME UP (Shift + Home)
send {volume_up 1.5}
return

*+End:: 		;VOLUME DOWN (Shift + End)
send {Volume_Down 1.5} 
return

*+Delete:: 		;SET VOLUME TO ZERO (Shift + Delete)
Soundset, +0, Master, Mute	; Second parameter doesn't seem to matter
return

*^ESC:: 		;Terminate script
Exitapp
return