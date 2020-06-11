SetTitleMatchMode, 2

; == HOTSTRINGS ==

:*?:,.::=>
:*?:;'::->
:*?::@::{U+2192} ; →
:*?:e''::{U+00e9} ; é
^!8::Send {U+2605} ; ★
^!NumpadMult::Send {U+2605} ; ★

:*?:ppp::p{!}catch{Space}
:*?:rrr::p{!}release{Space}
:*?:ccc::p{!}confirm

^!.::Send {U+2026} ; …
^+9::Send ☹ ;
^+0::Send ☺ ;
^!0::Send {U+00B0} ; °
^!'::Send ’ ;
^!y::Send ✓ ;
^!n::Send ✗ ;
^!Numpad2::Send {U+00BD} ; ½
^!Numpad3::Send {U+00BE} ; ¾
^!Numpad4::Send {U+00BC} ; ¼

; == GENERAL ==

; Open Snipping Tool
#x::
Run SnippingTool
Sleep 500
Send ^{PrintScreen}
Return

; Refresh browser

^!+r::
WinGetActiveTitle activeWindow
WinActivate Chrome
WinWaitActive Chrome,,0
Send ^r
WinActivate %activeWindow%
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

; SimplyFile undo
^!+z::
IfWinActive Outlook
{
  Send !hy5
}
Return
