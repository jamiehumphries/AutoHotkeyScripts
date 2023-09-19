#Requires AutoHotkey v2.0

; === Update check ===

MaxAttempts := 5
AttemptIntervalMs := 20 * 1000

CheckForUpdate(AttemptNumber := 0)
{
  try
  {
    Download("https://www.autohotkey.com/download/2.0/version.txt", "version.txt")
    Latest := FileRead("version.txt")

    if (RegExMatch(Latest, "^\d+(\.\d+)+$") = 0)
    {
      throw ValueError("Could not find latest version.")
    }

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
  }
  catch
  {
    if (AttemptNumber < MaxAttempts)
    {
      Sleep AttemptIntervalMs
      CheckForUpdate(AttemptNumber + 1)
    }
  }
}

CheckForUpdate()

Exit
