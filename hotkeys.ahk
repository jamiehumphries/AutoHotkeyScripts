SetTitleMatchMode, 2

; == HOTSTRINGS ==

:*?:,.::=>
:*?:;'::->
:*?::@::{U+2192} ; →
:*?:e''::{U+00e9} ; é

^!.::Send {U+2026} ; …

; == GENERAL ==

; Open Snipping Tool
#x::
Run SnippingTool
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

; Set colour to red
!a::
IfWinActive Outlook
{
  Send !efc{Up}{Up}{Right}{Right}{Enter}
}
Return
