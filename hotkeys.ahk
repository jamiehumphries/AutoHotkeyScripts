#Requires AutoHotkey v2.0

#Include "*i local.ahk"

; === Text ===

:*?:,.::=>
:*?:;'::->
:*?::@::→
:*?:e''::é
:*?:O''::Ö

^!.::
{
  SendText("…")
}
^!'::
{
  SendText("’")
}
^!8::
{
  SendText("•")
}
^!0::
{
  SendText("°")
}
^!y::
{
  SendText("✓")
}
^!n::
{
  SendText("✗")
}
^!NumpadMult::
{
  SendText("★")
}
^!Numpad1::
{
  SendText("¼")
}
^!Numpad2::
{
  SendText("½")
}
^!Numpad3::
{
  SendText("¾")
}

; == Media ===

^F10::
{
  Send("{Media_Prev}")
}
^F11::
{
  Send("{Media_Next}")
}
^F12::
{
  Send("{Media_Play_Pause}")
}

; === Windows ===

RefreshInactiveWindow(TargetWindowTitle, RefreshKeys)
{
  TargetWindowID := WinExist(TargetWindowTitle)
  if !TargetWindowID
    return
  ActiveWindowID := WinGetID("A")
  WinActivate(TargetWindowID)
  Send(RefreshKeys)
  WinActivate(ActiveWindowID)
}

^+F5::
{
  RefreshInactiveWindow("gitk", "+{F5}")
}
^!+F5::
{
  RefreshInactiveWindow("Git Gui", "{F5}")
}
