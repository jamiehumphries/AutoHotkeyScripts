#Requires AutoHotkey v2.0

; === Update check ===

Sleep 60 * 1000

Download("https://www.autohotkey.com/download/2.0/version.txt", "version.txt")
Latest := FileRead("version.txt")

if (A_AhkVersion != Latest)
{
  Result := MsgBox("AutoHotkey can be updated from v" A_AhkVersion " to v" Latest, "AutoHotkey update", "OKCancel")
  if (Result = "OK")
  {
    FileDelete("AutoHotkey_*_setup.exe")
    Download("https://www.autohotkey.com/download/ahk-v2.exe", "AutoHotkey_" Latest "_setup.exe")
    Run("explorer .")
  }
}

Exit
