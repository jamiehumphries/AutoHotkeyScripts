SetTitleMatchMode, 2

; == HOTSTRINGS ==

:*?:,.::=>
:*?:;'::->

; == GENERAL ==

; Open Snipping Tool
#x::
Run C:\Windows\Sysnative\SnippingTool.exe
Sleep 500
Send ^{PrintScreen}
Return

; == MEDIA ==
^F10::Send {Media_Prev}
^F11::Send {Media_Next}
^F12::Send {Media_Play_Pause}

; == GIT ==

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
