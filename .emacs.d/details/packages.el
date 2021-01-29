(require 'package)

(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)
(package-refresh-contents)

(package-install 'solarized-theme)
(package-install 'web-mode)
(package-install 'projectile)
(package-install 'magit)
(package-install 'auto-complete)
(package-install 'helm)

