#Requires AutoHotkey v2.0

#Include "*i local.ahk"
Run("update.ahk")

; === Text ===

:*?:,.::=>
:*?:;'::->
:*?::@::→
:*?:e''::é
:*?:O''::Ö

^!.::SendText("…")
^!'::SendText("’")
^!8::SendText("•")
^!0::SendText("°")
^!y::SendText("✓")
^!n::SendText("✗")
^!NumpadMult::SendText("★")
^!Numpad1::SendText("¼")
^!Numpad2::SendText("½")
^!Numpad3::SendText("¾")

; == Media ===

^F10::Send("{Media_Prev}")
^F11::Send("{Media_Next}")
^F12::Send("{Media_Play_Pause}")

; === Windows ===

ActivateWindowAndSendKeys(TargetWindowTitle, KeysToSend)
{
  TargetWindowID := WinExist(TargetWindowTitle)
  if !TargetWindowID
  {
    return
  }
  ActiveWindowID := WinGetID("A")
  WinActivate(TargetWindowID)
  WinWaitActive(TargetWindowTitle)
  Send(KeysToSend)
  Sleep(100)
  WinActivate(ActiveWindowID)
}

; Refresh gitk
^+F5::
{
  KeyWait("Ctrl")
  KeyWait("Shift")
  ActivateWindowAndSendKeys("gitk", "+{F5}")
}

; Refresh Git Gui
^!+F5::
{
  KeyWait("Ctrl")
  KeyWait("Alt")
  KeyWait("Shift")
  ActivateWindowAndSendKeys("Git Gui", "{F5}")
}

; Toggle mic mute
RWin::
{
  If WinExist("Huddle") ; Slack
  {
    Send("^+{Space}")
  }
  If WinExist("Microsoft Teams")
  {
    Send("#!k")
  }
  If WinExist("Zoom Meeting")
  {
    Send("!a")
  }
}

; == Jira tickets in Slack ==

^!+J::
{
  If !IsSet(JiraRoot)
  {
    return
  }
  KeyWait("Ctrl")
  KeyWait("Alt")
  KeyWait("Shift")
  Send("^+{Left 3}")
  A_Clipboard := ""
  Send("^c")
  if !ClipWait(1)
  {
    return
  }
  A_Clipboard := JiraRoot . A_Clipboard
  Send("^v")
  Send("{Right}")
}
