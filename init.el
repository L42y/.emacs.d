;; Author: L42y <423300@gmail.com>
;; URL: https://github.com/L42y/.emacs.d
;; Licence: WTFPL, grab your copy here: http://sam.zoy.org/wtfpl/
;; Based on dimitri's emacs-kicker: https://github.com/dimitri/emacs-kicker
;;
;; This file is NOT part of GNU Emacs.

;; common lisp goodies, loop
(require 'cl)


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


;; el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil t)
  (url-retrieve
   "https://github.com/dimitri/el-get/raw/master/el-get-install.el"
   (lambda (s)
     (end-of-buffer)
     (eval-print-last-sexp))))

;;; now either el-get is `require'd already, or have been `load'ed by the
;;; el-get installer.

;;; set local recipes
(setq el-get-sources
      '((:name magit                         ; git meet emacs, and a binding
               :after (progn
                        (global-set-key (kbd "C-x C-z") 'magit-status)))

        (:name smex                          ; a better (ido like) M-x
               :after (progn
                        (setq smex-save-file "~/.emacs.d/.smex-items")
                        (global-set-key (kbd "C-x <RET>") 'smex)))))

(setq my-packages
      (append
       '(el-get
         helm
         go-mode
         js2-mode
         python-mode
         haml-mode
         sass-mode
         scss-mode
         jinja2-mode
         calfw
         popwin
         full-ack
         powerline
         yasnippet
         virtualenv
         nginx-mode
         sr-speedbar
         hl-tags-mode
         auto-complete
         pkgbuild-mode
         zencoding-mode
         twittering-mode)
       (mapcar 'el-get-source-name el-get-sources)))

;;; install new packages and init already installed packages
(el-get 'sync my-packages)


;;general

;;; encoding
(prefer-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)


;;; on to the visual settings
(menu-bar-mode -1)
(tool-bar-mode -1)                      ; no tool bar with icons
(scroll-bar-mode -1)                    ; no scroll bars
(line-number-mode 1)                    ; have line numbers and
(column-number-mode 1)                  ; column numbers in the mode line
(setq inhibit-splash-screen t)          ; no splash screen, thanks

(global-hl-line-mode)                   ; highlight current line
(show-paren-mode 1)
(global-linum-mode 1)                   ; add line numbers on the left

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

;; title bar format
(setq frame-title-format "%b @ %f")

;;; take from https://github.com/josh/emacs.d/blob/master/global.el by @joshpeek
;;; disable auto-save files (#foo#)
(setq auto-save-default nil)
;;; disable backup files (foo~)
(setq backup-inhibited t)
;;; disable auto-save-list/.saves
(setq auto-save-list-file-prefix nil)
;;; disable bell
(setq visible-bell nil)
;;; always open in the same window
(setq ns-pop-up-frames nil)
;;; show extra whitespace
(setq show-trailing-whitespace t)
;;; hide empty line fringe
(set-default 'indicate-empty-lines nil)


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

;;; avoid compiz manager rendering bugs
(add-to-list 'default-frame-alist '(alpha . 100))

;;; under mac, have Command as Meta and keep Option for localized input
(when (string-match "apple-darwin" system-configuration)
  (setq mac-allow-anti-aliasing t)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'none))

;; Use the clipboard, pretty please, so that copy/paste "works"
(setq x-select-enable-clipboard t)

;; Navigate windows with M-<arrows>
(windmove-default-keybindings 'meta)
(setq windmove-wrap-around t)

;; winner-mode provides C-<left> to get back to previous window layout
(winner-mode 1)

;; whenever an external process changes a file underneath emacs, and there
;; was no unsaved changes in the corresponding buffer, just revert its
;; content to reflect what's on-disk.
(global-auto-revert-mode 1)

;; M-x shell is a nice shell interface to use, let's make it colorful.  If
;; you need a terminal emulator rather than just a shell, consider M-x term
;; instead.
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; If you do use M-x term, you will notice there's line mode that acts like
;; emacs buffers, and there's the default char mode that will send your
;; input char-by-char, so that curses application see each of your key
;; strokes.
;;
;; The default way to toggle between them is C-c C-j and C-c C-k, let's
;; better use just one key to do the same.
(require 'term)
(define-key term-raw-map  (kbd "C-'") 'term-line-mode)
(define-key term-mode-map (kbd "C-'") 'term-char-mode)

;; Have C-y act as usual in term-mode, to avoid C-' C-y C-'
;; Well the real default would be C-c C-j C-y C-c C-k.
(define-key term-raw-map  (kbd "C-y") 'term-paste)


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
(require 'auto-complete)
(global-auto-complete-mode t)
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


;; default key to switch buffer is C-x b, but that's not easy enough
;;
;; when you do that, to kill emacs either close its frame from the window
;; manager or do M-x kill-emacs.  Don't need a nice shortcut for a once a
;; week (or day) action.
(global-set-key (kbd "C-x C-c") 'ido-switch-buffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)


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
                           (mode . css-mode)
                           (mode . sass-mode)
                           (mode . scss-mode)
                           (mode . less-mode)
                           (mode . html-mode)
                           (mode . nxml-mode)
                           (mode . haml-mode)
                           (mode . jinja2-mode)
                           (mode . nxhtml-mode)
                           (mode . mumamo-border-mode)))
                      ("Python"
                       (or (mode . python-mode)))
                      ("Emacs-Lisp" (or (mode . emacs-lisp-mode)))
                      ("Buffer" (name . "\\*.*\\*"))
                      ("Dired" (mode . dired-mode)))))))


;; sr-speedbar
(require 'sr-speedbar)
(global-set-key (kbd "C-c C-s") 'sr-speedbar-toggle)
(global-set-key (kbd "C-c C-o") 'sr-speedbar-select-window)

(setq speedbar-show-unknown-files t)
(setq speedbar-smart-directory-expand-flag t)
(setq speedbar-use-images nil)
(setq sr-speedbar-auto-refresh nil)
(setq sr-speedbar-right-side nil)
(setq sr-speedbar-width-console 40)


;; electric
(electric-pair-mode t)
(electric-layout-mode t)


;; coding
;; indent
(setq-default indent-tabs-mode nil)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (add-hook 'write-file-hooks                                   ;;
;;           (lambda () (if (not indent-tabs-mode)               ;;
;;                          (untabify (point-min) (point-max)))) ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; html
(add-hook 'html-mode-hook
          (lambda ()
            ;; Default indentation is usually 2 spaces, changing to 4.
            (set (make-local-variable 'sgml-basic-offset) 4)
            (sgml-guess-indent)))

;; php+ mode
;; (require 'php+-mode)
;; (php+-mode-setup)

;; cedet
(global-ede-mode 1)
;; (add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode)
;; (add-to-list 'semantic-default-submodes 'global-semantic-idle-completions-mode)

;; (semantic-mode 1)

;; python
(setq python-python-command "python2")


;; javascript
(setq js2-basic-offset 2)


;; ctags
(setq path-to-ctags "/usr/bin/ctags")

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


;; less css
(setq less-css-compile-at-save nil)
(setq less-css-lessc-command "/home/bug/.npm/less/1.3.0/package/bin/lessc")


;; rainbow
(add-hook 'css-mode-hook 'rainbow-turn-on)


;; yasnippet
;; (yas/initialize)

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

;;; calendar
(require 'calfw)
(require 'calfw-cal)

;;; popwin
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)

;;; twit
(setq twittering-username "L42y"
      twittering-icon-mode t
      twittering-timer-interval 60
      twittering-use-master-password t
      twittering-initial-timeline-spec-string
      '(":replies" ":home"))

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


;; session
;;; desktop
(desktop-save-mode 1)
(setq desktop-path '("~/.emacs.d/"))
(setq desktop-dirname "~/.emacs.d/")
(setq desktop-base-file-name "emacs-desktop")
(setq desktop-restore-eager 20
      desktop-lazy-verbose nil)


;; transparency
(set-frame-parameter (selected-frame) 'alpha '(95 95))
(add-to-list 'default-frame-alist '(alpha 95 95))
