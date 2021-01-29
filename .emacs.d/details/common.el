;; set UTF-8
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)

;; not open startup message
(setq inhibit-startup-message t)

;; don't make backup
(setq backup-inhibited t)

;; delete auto save files on emacs quit
(setq delete-auto-save-files t)

;; tab configs
(setq-default tab-width 4 indent-tabs-mode nil)

;; load dired
(require 'dired-x)

;; change yes-or-no to y-or-n
(fset 'yes-or-no-p 'y-or-n-p)

;; mute bell sound
(setq ring-bell-function 'ignore)

;; change optionkey to cmd (mac)
(setq mac-option-modifier 'meta)
