;; Author: L42y <423300@gmail.com>
;; URL: https://github.com/L42y/.emacs.d
;; Licence: WTFPL, grab your copy here: http://sam.zoy.org/wtfpl/
;; Based on dimitri's emacs-kicker: https://github.com/dimitri/emacs-kicker
;;
;; This file is NOT part of GNU Emacs.


(add-to-list 'load-path "~/.emacs.d")


;;; load color theme
(custom-set-variables
 '(custom-safe-themes (quote ("27690557dea9e52cf8dd81773e5e779309431ff00a4ebcc88b8cae336eeefa04" default))))
(load-theme 'monokai)


(require 'cl)
(require 'pkg)
(require 'defuns)
(require 'global)
(require 'progmodes)
(require 'othermodes)
(require 'keybindings)
