;; Author: L42y <423300@gmail.com>
;; URL: https://github.com/L42y/.emacs.d
;; Licence: WTFPL, grab your copy here: http://sam.zoy.org/wtfpl/
;; Based on dimitri's emacs-kicker: https://github.com/dimitri/emacs-kicker
;;
;; This file is NOT part of GNU Emacs.


(add-to-list 'load-path "~/.emacs.d")

(require 'cl)
(require 'pkg)
(require 'global)


;; not me
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-indent-next-pair-timer-interval (quote ((default 0.0005))))
 '(custom-safe-themes (quote ("27690557dea9e52cf8dd81773e5e779309431ff00a4ebcc88b8cae336eeefa04" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; load color theme
(load-theme 'monokai)

;;; choose my own fonts
(defun frame-setting ()
  (set-frame-font "monofur 15")
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset
                      (font-spec :family "华文黑体" :size 13))))
(if (and (fboundp 'daemonp) (daemonp))
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (with-selected-frame frame
                  (frame-setting))))
  (frame-setting))


;; key binding

;;; comment
(global-set-key (kbd "C-'") 'comment-dwim)
(global-set-key (kbd "C-c g") 'comment-or-uncomment-region)

;;; quit emacs
(global-set-key (kbd "C-x C-k") 'save-buffers-kill-emacs)

;;; disable keys
(global-unset-key (kbd "<pause>"))

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


;; auto-complte
(require 'auto-complete-config)
(ac-config-default)
(dolist (hook '(sass-mode-hook
                scss-mode-hook
                haml-mode-hook))
  (add-hook hook (lambda () (auto-complete-mode 1))))
(define-key ac-completing-map (kbd "C-n") 'ac-next)
(define-key ac-completing-map (kbd "C-p") 'ac-previous)
(define-key ac-complete-mode-map "\r" nil)


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


;; full screen
(defun fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen
                       (if (frame-parameter nil 'fullscreen) nil 'fullboth)))
(global-set-key [f11] 'fullscreen)


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


;; electric
(electric-pair-mode t)
(electric-layout-mode t)


;; coding
;; python
(setq python-python-command "python2")


;; javascript
(setq js2-basic-offset 2)


;; ctags
(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command (format "%s -f %s/TAGS -e -R %s" path-to-ctags dir-name (directory-file-name dir-name))))


;; nxhtml
(setq nxml-child-indent 4 ; global nxhtml child mode indent
      ourcomments-ido-ctrl-tab t
      mumamo-chunk-coloring '2 ; no ugly color
      sml-modeline-mode t)


;; jinja2
(add-to-list 'auto-mode-alist '("\\.jinja\\'" . jinja2-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . jinja2-mode))


;; hl-tags-mode
(require 'hl-tags-mode)
(add-hook 'sgml-mode-hook (lambda () (hl-tags-mode 1)))
(add-hook 'nxml-mode-hook (lambda () (hl-tags-mode 1)))


;; zencoding
(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode)


;; haml
(require 'haml-mode)
(add-to-list 'auto-mode-alist '("\\.haml\\'" . haml-mode))
(add-hook 'haml-mode-hook '(lambda ()
                             (add-hook 'before-save-hook
                                       (lambda ()
                                         (untabify (point-min) (point-max))))))


;; scss
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
(setq scss-compile-at-save nil)


;; rainbow
(add-hook 'css-mode-hook 'rainbow-turn-on)


;;; auto insert
(require 'autoinsert)
(auto-insert-mode)
(setq auto-insert-directory "~/.emacs.d/templates/")
(setq auto-insert-query nil)
(define-auto-insert "\.py" "python.py")


;;; C-a behaviour
(defun smart-line-beginning ()
  "Move point to the beginning of text on the current line; if that is already
the current position of point, then move it to the beginning of the line."
  (interactive)
  (let ((pt (point)))
    (back-to-indentation)
    (when (eq pt (point))
      (beginning-of-line))))

(global-set-key (kbd "C-a") 'smart-line-beginning)


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


;; intergration
;;; mac dictionary
;;;; take from https://github.com/renard/dictionary-app/blob/master/dictionary-app.el
(defun dictionary-app-search (&optional term)
  "Search for TERM in OSX Dictionary.app.

If TERM is nil, try in order terms in the region, then
`word-at-point' finally read from minibuffer."
  (interactive)
  (let ((term
         (cond
          (term term)
          ((region-active-p) (buffer-substring-no-properties (mark) (point)))
          ((word-at-point) (substring-no-properties (word-at-point)))
          (t (read-from-minibuffer "Look up for: ")))))
    (when term
      (shell-command (format "open 'dict://%s'" (url-hexify-string term))))))

(global-set-key (kbd "C-M-g") '(lambda () (interactive) (dictionary-app-search (current-word))))


;; transparency
(set-frame-parameter (selected-frame) 'alpha '(95 95))
(add-to-list 'default-frame-alist '(alpha 95 95))
