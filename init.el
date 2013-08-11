;;; init.el --- Everything begin here

;;; Commentary:

;; Author: L42y <423300@gmail.com>
;; URL: https://github.com/L42y/.emacs.d
;; Licence: WTFPL, grab your copy here: http://sam.zoy.org/wtfpl/
;;
;; This file is NOT part of GNU Emacs.


;;; Code:

(defvar sweet-home (file-name-directory load-file-name))
(defvar savefile-path (expand-file-name "savefile" sweet-home))
(add-to-list 'load-path sweet-home)


(require 'pkgs)
(require 'defuns)
(require 'global)
(require 'progmodes)
(require 'othermodes)
(require 'keybindings)


(provide 'init)
;;; init.el ends here
