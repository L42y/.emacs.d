;;; init.el --- Everything begin here

;;; Commentary:

;; Author: L42y <423300@gmail.com>
;; URL: https://github.com/L42y/.emacs.d
;; Licence: WTFPL, grab your copy here: http://sam.zoy.org/wtfpl/
;;
;; This file is NOT part of GNU Emacs.


;;; Code:

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(setq straight-repository-branch "develop")

;; (setq straight-recipe-repositories '(org-elpa melpa gnu-elpa-mirror))

;; (require 'package)
;; (setq package-archives
;;       '(("gnu" . "https://elpa.gnu.org/packages/")
;;         ("org" . "https://orgmode.org/elpa/")
;;         ("ublt" . "https://elpa.ubolonton.org/packages/")
;;         ("melpa" . "https://melpa.org/packages/")))
;; (package-initialize)


;; (unless (package-installed-p 'use-package)
;;   (package-refresh-contents)
;;   (package-install 'use-package))

;; (eval-when-compile
;;   (require 'use-package))
;; (require 'diminish)
;; (require 'bind-key)

(defvar sweet-home (file-name-directory load-file-name))
(defvar elisp-path (expand-file-name "lisp" sweet-home))
(add-to-list 'load-path elisp-path)

;; (setq custom-file (expand-file-name "custom.el" sweet-home))
;; (load custom-file 'noerror)

(require 'defuns)
(require 'globals)
(require 'orgmodes)
(require 'progmodes)
(require 'textmodes)
(require 'othermodes)


(provide 'init)
;;; init.el ends here
