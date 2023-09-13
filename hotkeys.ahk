#Requires AutoHotkey v2.0

#Include "*i local.ahk"

; === Update check ===

Download("https://www.autohotkey.com/download/2.0/version.txt", "version.txt")
Latest := FileRead("version.txt")

if (A_AhkVersion != Latest)
{
  Result := MsgBox("AutoHotkey can be updated from v" A_AhkVersion " to v" Latest, "AutoHotkey update", "OKCancel")
  if (Result = "OK")
  {
    Run("https://www.autohotkey.com/")
  }
}

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

RefreshInactiveWindow(TargetWindowTitle, RefreshKeys)
{
  TargetWindowID := WinExist(TargetWindowTitle)
  if !TargetWindowID
  {
    return
  }
  ActiveWindowID := WinGetID("A")
  WinActivate(TargetWindowID)
  WinWaitActive(TargetWindowTitle)
  Send(RefreshKeys)
  WinActivate(ActiveWindowID)
}

^+F5::
{
  KeyWait("Ctrl")
  KeyWait("Shift")
  RefreshInactiveWindow("gitk", "+{F5}")
}

^!+F5::
{
  KeyWait("Ctrl")
  KeyWait("Alt")
  KeyWait("Shift")
  RefreshInactiveWindow("Git Gui", "{F5}")
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
