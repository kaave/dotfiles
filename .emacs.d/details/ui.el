;; show line-end code
(setq eol-mnemonic-dos "(CRLF)")
(setq eol-mnemonic-mac "(CR)")
(setq eol-mnemonic-unix "(LF)")

;; set theme
(load-theme 'solarized-dark t)

;; remove toolbar
(tool-bar-mode 0)

;; show column number
(column-number-mode t)

;; show row number
(global-linum-mode t)
(setq linum-format " %d ")

;; stop cursor blink
(blink-cursor-mode 0)

;; highlight current line
(global-hl-line-mode t)

;; highlight paren
(show-paren-mode 1)

;; scroll conservatively
(setq scroll-conservatively 1)

;; scroll margin
(setq scroll-margin 10)

