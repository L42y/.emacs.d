;;; init.el --- Everything begin here

;;; Commentary:

;; Author: L42y <423300@gmail.com>
;; URL: https://github.com/L42y/.emacs.d
;; Licence: WTFPL, grab your copy here: http://sam.zoy.org/wtfpl/
;;
;; This file is NOT part of GNU Emacs.


;;; Code:

(require 'package)
(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("org" . "https://orgmode.org/elpa/")
        ("melpa" . "https://melpa.org/packages/")))
(package-initialize)


(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(defvar sweet-home (file-name-directory load-file-name))
(defvar elisp-path (expand-file-name "lisp" sweet-home))
(add-to-list 'load-path elisp-path)

(setq custom-file (expand-file-name "custom.el" sweet-home))
(load custom-file 'noerror)

(use-package defuns)
(use-package globals)
(use-package orgmodes)
(use-package progmodes)
(use-package textmodes)
(use-package othermodes)


(provide 'init)
;;; init.el ends here
