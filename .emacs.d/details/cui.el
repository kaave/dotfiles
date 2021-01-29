(if (not window-system) (progn
    ;; remove menubar
    (menu-bar-mode 0)

    ;; translate delete key
    (keyboard-translate ?\C-h ?\C-?)
    ;; set M-? to Help
    (global-set-key (kbd "M-?") 'help-command)
))
