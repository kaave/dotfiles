;;
;; An autohotkey script that provides emacs-like keybinding on Windows
;;
InstallKeybdHook()
#UseHook

; The following line is a contribution of NTEmacs wiki http://www49.atwiki.jp/ntemacs/pages/20.html
SetKeyDelay(0)

; -----------------------------------------
; Launcher
; -----------------------------------------

>^1:: ;brave
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
  ErrorLevel := ProcessExist("brave.exe")
  SetWorkingDir("C:\Users\voriv\scoop\apps\brave\current")
  if (ErrorLevel != 0)
    WinActivate("ahk_pid " ErrorLevel)
  Else
    ; SetWorkingDir("C:\Users\voriv\scoop\apps\brave\current")
    Run("C:\Users\voriv\scoop\apps\brave\current\brave.exe --user-data-dir=`"C:\Users\voriv\scoop\apps\brave\current\User` Data`"")
  Return
} ; V1toV2: Added Bracket before hotkey or Hotstring

>^2:: ;Slack
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
  ErrorLevel := ProcessExist("slack.exe")
  if (ErrorLevel != 0)
    WinActivate("ahk_pid " ErrorLevel)
  Else
    Run("C:\Users\voriv\scoop\apps\slack\current\slack.exe")
  Return
} ; V1toV2: Added Bracket before hotkey or Hotstring

>^+5:: ;Kindle
{
  global
  ErrorLevel := ProcessExist("Kindle.exe")
  if (ErrorLevel != 0)
    WinActivate("ahk_pid " ErrorLevel)
  Else
    Run("C:\Users\voriv\AppData\Local\Amazon\Kindle\application\Kindle.exe")

  Return
} ; V1toV2: Added Bracket before hotkey or Hotstring

>^7:: ;Bitwarden
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
  ErrorLevel := ProcessExist("Bitwarden.exe")
  if (ErrorLevel != 0)
    WinActivate("ahk_pid " ErrorLevel)
  Else
    Run("C:\Users\voriv\scoop\apps\bitwarden\current\Bitwarden.exe")
  Return
} ; V1toV2: Added Bracket before hotkey or Hotstring

>^8:: ;Obsidian
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
  ErrorLevel := ProcessExist("Obsidian.exe")
  if (ErrorLevel != 0)
    WinActivate("ahk_pid " ErrorLevel)
  Else
    Run("C:\Users\voriv\scoop\apps\obsidian\current\Obsidian.exe")
  Return
} ; V1toV2: Added Bracket before hotkey or Hotstring

>^+8:: ;Notepad++
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
  ErrorLevel := ProcessExist("notepad++.exe")
  if (ErrorLevel != 0)
    WinActivate("ahk_pid " ErrorLevel)
  Else
    Run("C:\Users\voriv\scoop\apps\notepadplusplus\current\notepad++.exe")
  Return
} ; V1toV2: Added Bracket before hotkey or Hotstring

>^9:: ;VS Code
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
  ErrorLevel := ProcessExist("Code.exe")
  if (ErrorLevel != 0)
    WinActivate("ahk_pid " ErrorLevel)
  Else
    Run("C:\Users\voriv\scoop\apps\vscode\current\Code.exe")
  Return
} ; V1toV2: Added Bracket before hotkey or Hotstring

>^0:: ;Windows Terminal
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
  ErrorLevel := ProcessExist("WindowsTerminal.exe")
  if (ErrorLevel != 0)
    WinActivate("ahk_pid " ErrorLevel)
  Else
    Run("C:\Users\voriv\AppData\Local\Microsoft\WindowsApps\wt.exe")
  Return
} ; V1toV2: Added Bracket before hotkey or Hotstring

>^+0:: ; Tablacus Explorer
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
  ErrorLevel := ProcessExist("Files.exe")
  if (ErrorLevel != 0)
    WinActivate("ahk_pid " ErrorLevel)
  Else
    Run("C:\Users\voriv\AppData\Local\Microsoft\WindowsApps\files.exe")
  Return

; -----------------------------------------
; Utils
; -----------------------------------------

; Current Date / Time
; @see https://www.autohotkey.com/docs/commands/FormatTime.htm
} ; V1toV2: Added Bracket before hotkey or Hotstring
>^+d:: ; Current Date
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
  DateString := FormatTime(, "yyyy-M-dd")
  InsertText(DateString)
  Return
} ; V1toV2: Added Bracket before hotkey or Hotstring

>^+t:: ; Current Time
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
  TimeString := FormatTime(, "H:mm")
  InsertText(TimeString)
  Return

; >^+u:: ; UUID
;   guid := GUID()
;   StringUpper, guid, guid
;   InsertText(guid)
;   return

; -----------------------------------------
; Functions
; -----------------------------------------
; https://did2memo.net/2014/03/19/autohotkey-insert-text/
} ; V1toV2: Added bracket before function
InsertText(Content) {
  cb_bk := ClipboardAll()
  A_Clipboard := Content
  Send("^v")
  Sleep(200)
  A_Clipboard := cb_bk
}

; https://gist.github.com/ijprest/3845947
; GUID() {
; V1toV2: Removed ;   format = %A_FormatInteger%       ; save original integer format
; V1toV2: Removed ;   SetFormat Integer, Hex           ; for converting bytes to hex
;   VarSetCapacity(A,16)
;   DllCall("rpcrt4\UuidCreate","Str",A)
;   Address := &A
;   Loop 16
;   {
;      x := 256 + *Address           ; get byte in hex, set 17th bit
;      StringTrimLeft x, x, 3        ; remove 0x1
;      h = %x%%h%                    ; in memory: LS byte first
;      Address++
;   }
; V1toV2: Removed ;   SetFormat Integer, %format%      ; restore original format
;   h := SubStr(h,1,8) . "-" . SubStr(h,9,4) . "-" . SubStr(h,13,4) . "-" . SubStr(h,17,4) . "-" . SubStr(h,21,12)
;   return h
; }
