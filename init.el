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
(require 'keybindings)

;; helper
;;; make buffer name uniquify
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward
      uniquify-separator "@")

;;; purge outdated buffer
(require 'midnight)
(setq midnight-mode 't)


;; helm
(require 'helm-config)
(helm-mode 1)
(global-set-key (kbd "C-x b")
                (lambda() (interactive)
                  (helm
                   :prompt "Switch to: "
                   :candidate-number-limit 15                 ;; up to 10 of each
                   :sources
                   '(helm-c-source-buffers-list          ;; buffers
                     helm-c-source-recentf               ;; recent files
                     helm-c-source-bookmarks             ;; bookmarks
                     helm-c-source-files-in-current-dir  ;; current dir
                     helm-c-source-locate                ;; use 'locate'
                     helm-c-source-buffer-not-found))))
(global-set-key (kbd "C-x C-y") 'helm-show-kill-ring)


;; use ido for minibuffer completion
(require 'ido)

(ido-mode t)
(setq ido-show-dot-for-dired t)
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point 'guess)
(setq ido-auto-merge-work-directories-length -1)
(setq ido-save-directory-list-file "~/.emacs.d/.ido.last")


;; C-x C-j opens dired with the cursor right on the file you're editing
(require 'dired-x)


;; ibuffer
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;;; jump to most recent buffer name at ibuffer list
(defadvice ibuffer (around ibuffer-point-to-most-recent) ()
  "Open ibuffer with cursor pointed to most recent buffer name"
  (let ((recent-buffer-name (buffer-name)))
    ad-do-it
    (ibuffer-jump-to-buffer recent-buffer-name)))
(ad-activate 'ibuffer)

;;; ibuffer auto group
(require 'ibuf-ext nil t)
(when (featurep 'ibuf-ext)
  (add-hook 'ibuffer-mode-hook
            (lambda ()
              (setq ibuffer-filter-groups
                    '(("Org Life"
                       (or (mode . org-mode)
                           (mode . org-agenda-mode)))
                      ("Web Development"
                       (or (mode . js-mode)
                           (mode . js2-mode)
                           (mode . php-mode)
                           (mode . web-mode)
                           (mode . css-mode)
                           (mode . sass-mode)
                           (mode . scss-mode)
                           (mode . html-mode)
                           (mode . nxml-mode)
                           (mode . haml-mode)
                           (mode . jinja2-mode)
                           (mode . nxhtml-mode)))
                      ("Python"
                       (or (mode . python-mode)))
                      ("Emacs-Lisp" (or (mode . emacs-lisp-mode)))
                      ("Buffer" (name . "\\*.*\\*"))
                      ("Dired" (mode . dired-mode)))))))


;; write
;;; org
(require 'org-install)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-agenda-files (list "~/.org/todo.org"))


;; view
;;; dired
(setq dired-listing-switches "-aluh") ;; ls alias
;;; wdired
(add-hook 'dired-mode-hook '(lambda ()
                              (define-key dired-mode-map "e" 'wdired-change-to-wdired-mode)))


;; tools
;;; secret service api
;; (require 'secrets)

;;; notify
(require 'notifications)

;;; popwin
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)

;;; golden ratio
(golden-ratio-enable)


;; transparency
(set-frame-parameter (selected-frame) 'alpha '(95 95))
(add-to-list 'default-frame-alist '(alpha 95 95))
