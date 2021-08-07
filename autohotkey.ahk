;;
;; An autohotkey script that provides emacs-like keybinding on Windows
;;
#InstallKeybdHook
#UseHook

; The following line is a contribution of NTEmacs wiki http://www49.atwiki.jp/ntemacs/pages/20.html
SetKeyDelay 0

; -----------------------------------------
; Launcher
; -----------------------------------------

>^1:: ;Brave
  Process,Exist,brave.exe
  If ErrorLevel <> 0
    WinActivate,ahk_pid %ErrorLevel%
  Else
    Run C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe
  Return

>^+1:: ;Firefox
  Process,Exist,firefox.exe
  If ErrorLevel <> 0
    WinActivate,ahk_pid %ErrorLevel%
  Else
    Run C:\Users\kaave\scoop\apps\firefox-developer\current
  Return

>^2:: ;Slack
  Process,Exist,slack.exe
  If ErrorLevel <> 0
    WinActivate,ahk_pid %ErrorLevel%
  Else
    Run C:\Users\kaave\scoop\apps\slack\current\slack.exe
  Return

>^3:: ;Sidekick
  Process,Exist,sidekick.exe
  If ErrorLevel <> 0
    WinActivate,ahk_pid %ErrorLevel%
  Else
    Run C:\Users\kaave\AppData\Local\Sidekick\Application\sidekick.exe
  Return

>^7:: ;Bitwarden
  Process,Exist,Bitwarden.exe
  If ErrorLevel <> 0
    WinActivate,ahk_pid %ErrorLevel%
  Else
    Run C:\Users\kaave\scoop\apps\bitwarden\current\Bitwarden.exe
  Return

>^+7:: ;Authy
  Process,Exist,Authy Desktop.exe
  If ErrorLevel <> 0
    WinActivate,ahk_pid %ErrorLevel%
  Else
    Run C:\Users\kaave\scoop\apps\authy\current\Authy Desktop.exe
  Return

>^8:: ;Obsidian
  Process,Exist,Obsidian.exe
  If ErrorLevel <> 0
    WinActivate,ahk_pid %ErrorLevel%
  Else
    Run C:\Users\kaave\scoop\apps\obsidian\current\Obsidian.exe
  Return

>^+8:: ;Notepad++
  Process,Exist,notepad++.exe
  If ErrorLevel <> 0
    WinActivate,ahk_pid %ErrorLevel%
  Else
    Run C:\Users\kaave\scoop\apps\notepadplusplus\current\notepad++.exe
  Return

>^9:: ;VS Code
  Process,Exist,Code.exe
  If ErrorLevel <> 0
    WinActivate,ahk_pid %ErrorLevel%
  Else
    Run C:\Users\kaave\scoop\apps\vscode\current\Code.exe
  Return

>^0:: ;Windows Terminal
  Process,Exist,WindowsTerminal.exe
  If ErrorLevel <> 0
    WinActivate,ahk_pid %ErrorLevel%
  Else
    Run C:\Users\kaave\AppData\Local\Microsoft\WindowsApps\wt.exe
  Return

>^+0:: ; Tablacus Explorer
  Process,Exist,TE64.exe
  If ErrorLevel <> 0
    WinActivate,ahk_pid %ErrorLevel%
  Else
    Run C:\Apps\Tablacus Explorer\TE64.exe
  Return

; -----------------------------------------
; Utils
; -----------------------------------------

; Current Date / Time
; @see https://www.autohotkey.com/docs/commands/FormatTime.htm
>^+`;:: ; Current Date
  FormatTime,DateString,,yyyy-M-dd
  InsertText(DateString)
  Return

>^+':: ; Current Time
  FormatTime,TimeString,,H:mm
  InsertText(TimeString)
  Return

; -----------------------------------------
; Functions
; -----------------------------------------
; https://did2memo.net/2014/03/19/autohotkey-insert-text/
InsertText(Content) {
  cb_bk = %ClipboardAll%
  Clipboard = %Content%
  Send, ^v
  Sleep, 200
  Clipboard = %cb_bk%
}
