
InputBox, Password, Enter Password, Enter Password (Hidden), hide
 If Password = hotdog
   {
    MsgBox, 4, ,
(
Password is correct!
Run script?
)
}
     IfMsgBox, Yes 
  
  {

Run, https://discordapp.com/channels/126520334525399040/126520334525399040

Loop
{
Sleep, 10000
ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *75 C:\Users\dannie\Pictures\Capture.png

if ErrorLevel = 2
    MsgBox Could not conduct the search.
else if ErrorLevel = 1
    {
  
      if (A_Hour > 12)
{
  totaltime := (A_Hour - 12)
FileAppend, 
(
`
%A_YYYY%-%A_MM%-%A_DD% %totaltime%:%A_Min%Pm ------------------------------------------- Offline
  ), E:\AHK_Files\Text Folder\DiscordActivity_Recorder.txt
  
    }

else
   {
    FileAppend, 
(
`
%A_YYYY%-%A_MM%-%A_DD% %A_Hour%:%A_Min%Am ------------------------------------------- Offline
), E:\AHK_Files\Text Folder\DiscordActivity_Recorder.txt
  
    
}
}
else
  {  
 MouseClickDrag, L, , , FoundX, FoundY 
  MouseMove, FoundX + 50 , FoundY + 25
    Sleep, 500
     
      if (A_Hour > 12)
{
  totaltime := (A_Hour - 12)
  FileAppend, 
(
`
%A_YYYY%-%A_MM%-%A_DD% %totaltime%:%A_Min%Pm ------------------------------------------- Online
), E:\AHK_Files\Text Folder\DiscordActivity_Recorder.txt
 
    }

else
   {
 FileAppend, 
(
`
%A_YYYY%-%A_MM%-%A_DD% %A_Hour%:%A_Min%Am ------------------------------------------- Online
), E:\AHK_Files\Text Folder\DiscordActivity_Recorder.txt
      
}

   
  }	
Sleep, 120000
}


}
  Else, 
{
   MsgBox, You have pressed no.
        Exitapp
}


