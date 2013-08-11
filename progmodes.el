;;; progmodes.el --- Programming related things

;;; Commentary:

;;; Code:

;;; code style
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
(prefer-coding-system 'utf-8)


;;; subword
(add-hook 'prog-mode-hook 'subword-mode)


;;; only use tab-width of 2 for certain modes.
(mapc (lambda (hook)
        (add-hook hook (lambda ()
                         (setq-default tab-width 2))))
      '(js2-mode-hook
        js-mode-hook
        css-mode-hook))


;;; auto-complte
(require 'auto-complete-config)
(ac-config-default)
(add-hook 'prog-mode-hook 'auto-complete-mode)
(setq ac-comphist-file (expand-file-name "ac-comphist" savefile-path))

(define-key ac-completing-map (kbd "C-n") 'ac-next)
(define-key ac-completing-map (kbd "C-p") 'ac-previous)
(define-key ac-complete-mode-map "\r" nil)


;;; flycheck
(require 'flycheck)
(add-hook 'prog-mode-hook 'flycheck-mode)
(setq flycheck-check-syntax-automatically '(mode-enabled save))


;;; electric
(electric-indent-mode t)


;;; C
(add-hook 'c-mode-hook
          '(lambda ()
             (c-set-style "k&r")
             (setq tab-width 8)
             (setq c-basic-offset 8)))


;;; clojure
(add-hook 'clojure-mode-hook 'paredit-mode)


;;; python
(require 'jedi)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)


;;; javascript
(require 'js)
(require 'js2-mode)
(setq-default js-indent-level 2
              js2-basic-offset 2)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))


;; scss
(require 'scss-mode)
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
(setq scss-compile-at-save nil)


;;; auto insert
(require 'autoinsert)
(auto-insert-mode)
(setq auto-insert-directory "~/.emacs.d/templates/")
(setq auto-insert-query nil)
(define-auto-insert "\.py" "python.py")
(define-auto-insert "\.html" "html.html")


(provide 'progmodes)
;;; progmodes.el ends here
