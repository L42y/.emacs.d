;; Author: L42y <423300@gmail.com>
;; URL: https://github.com/L42y/.emacs.d
;; Licence: WTFPL, grab your copy here: http://sam.zoy.org/wtfpl/
;; Based on dimitri's emacs-kicker: https://github.com/dimitri/emacs-kicker
;;
;; This file is NOT part of GNU Emacs.


(add-to-list 'load-path "~/.emacs.d")


;;; load color theme
(load-theme 'monokai t)


(require 'cl)
(require 'pkgs)
(require 'defuns)
(require 'global)
(require 'progmodes)
(require 'othermodes)
(require 'keybindings)


(provide 'init)
