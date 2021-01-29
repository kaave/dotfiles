;;
;; An autohotkey script that provides emacs-like keybinding on Windows
;;
#InstallKeybdHook
#UseHook

; The following line is a contribution of NTEmacs wiki http://www49.atwiki.jp/ntemacs/pages/20.html
SetKeyDelay 0

; Applications you want to disable emacs-like keybindings
; (Please comment out applications you don't use)
is_target()
{
  IfWinActive,ahk_class Vim ; GVIM
    Return 1
  IfWinActive,ahk_class mintty ; mintty
    Return 1
  ; IfWinActive,ahk_class ConsoleWindowClass ; PowerShell
  ;   Return 1
  IfWinActive,ahk_exe Code.exe ; VSCode
    Return 1
  Return 0
}

; -----------------------------------------
; functions
; -----------------------------------------

delete_char()
{
  Send {Del}
  Return
}
delete_backward_char()
{
  Send {BS}
  Return
}
kill_line()
{
  Send {ShiftDown}{END}{SHIFTUP}
  Sleep 50 ;[ms] this value depends on your environment
  Send ^x
  Return
}
open_line()
{
  Send {END}{Enter}{Up}
  Return
}
newline()
{
  Send {Enter}
  Return
}
yank()
{
  Send ^v
  Return
}
move_beginning_of_line()
{
  global
  Send {HOME}
  Return
}
move_end_of_line()
{
  global
  Send {END}
  Return
}
previous_line()
{
  global
  Send {Up}
  Return
}
next_line()
{
  global
  Send {Down}
  Return
}
forward_char()
{
  global
  Send {Right}
  Return
}
backward_char()
{
  global
  Send {Left}
  Return
}

; -----------------------------------------
; key remaps
; -----------------------------------------
>^f::
  If is_target()
    ; TODO: 以下の変数が機能しない
    ; Send %A_ThisHotkey%
    Send ^f
  Else
    forward_char()
  Return
>^b::
  If is_target()
    Send ^b
  Else
    backward_char()
  Return
>^p::
  If is_target()
    Send ^p
  Else
    previous_line()
  Return
>^n::
  If is_target()
    Send ^n
  Else
    next_line()
  Return
>^a::
  If is_target()
    Send ^a
  Else
    move_beginning_of_line()
  Return
>^e::
  If is_target()
    Send ^e
  Else
    move_end_of_line()
  Return
RCtrl & d::
  If is_target()
    Send ^d
  Else
    delete_char()
  Return
>^h::
  If is_target()
    Send ^h
  Else
    delete_backward_char()
  Return
>^k::
  If is_target()
    Send ^k
  Else
    kill_line()
  Return
>^y::
  If is_target()
    Send ^y
  Else
    yank()
  Return
>^m::
  If is_target()
    Send ^m
  Else
    newline()
  Return
>^o::
  If is_target()
    Send ^o
  Else
    open_line()
  Return

; -----------------------------------------
; Replace PgUp & Down to L/R
; -----------------------------------------
PgUp::Send {Left}
PgDn::Send {Right}
^PgUp::Send ^{Left}
^PgDn::Send ^{Right}
+PgUp::Send +{Left}
+PgDn::Send +{Right}
!PgUp::Send !{Left}
!PgDn::Send !{Right}
#PgUp::Send #{Left}
#PgDn::Send #{Right}
