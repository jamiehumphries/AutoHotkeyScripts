SetTitleMatchMode, 2

; == HOTSTRINGS ==

:*?:,.::=>
:*?:;'::->

; == GENERAL ==

; Open Snipping Tool
#x::
Run SnippingTool
Sleep 500
Send ^{PrintScreen}
Return

; == GIT / CYGWIN ==

; Open Cygwin
#z::
IfWinExist Cygwin
{
  WinActivate
}
Else
{
  Run C:\cygwin\bin\rxvt.exe -fg black -bg white -fn 7x14 -sl 2000 -sr -title bash -e bash  --login -i
}
Return

; Refresh gitk
^+F5::
WinGetActiveTitle activeWindow
WinActivate gitk
WinWaitActive gitk,,0
Send +{F5}
WinActivate %activeWindow%
Return

; Refresh git gui
^!+F5::
WinGetActiveTitle activeWindow
WinActivate Git Gui
WinWaitActive Git Gui,,0
Send {F5}
WinActivate %activeWindow%
Return

; == OUTLOOK ==

; File
!x::
IfWinActive Outlook
{
  Send !hh
}
Return

; Set colour to red
!a::
IfWinActive Outlook
{
  Send !efc{Up}{Up}{Right}{Right}{Enter}
}
Return
