;;; progmodes.el --- Programming related things

;;; Commentary:

;;; Code:

;;; code style
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)


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

(define-key ac-completing-map (kbd "C-n") 'ac-next)
(define-key ac-completing-map (kbd "C-p") 'ac-previous)
(define-key ac-complete-mode-map "\r" nil)


;;; flycheck
(require 'flycheck)
(add-hook 'prog-mode-hook 'flycheck-mode)


;;; yasnippet
(yas-global-mode 1)


;;; electric
(electric-indent-mode t)


;;; C
(add-hook 'c-mode-hook
          '(lambda ()
             (c-set-style "k&r")
             (setq tab-width 8)
             (setq c-basic-offset 8)))


;;; python
(add-hook 'python-mode-hook 'jedi:setup)


;;; javascript
(require 'js)
(require 'js2-mode)
(setq js-indent-level 2
      js2-basic-offset 2)


;;; web-mode
(require 'web-mode)
(setq web-mode-markup-indent-offset 4)
(setq web-mode-disable-auto-pairing t)
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))


;;; zencoding
(add-hook 'web-mode-hook 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode)


;;; haml
(require 'haml-mode)
(add-to-list 'auto-mode-alist '("\\.haml\\'" . haml-mode))
(add-hook 'haml-mode-hook
	  (lambda ()
	    (setq indent-tabs-mode nil)
	    (define-key haml-mode-map "\C-m" 'newline-and-indent)))


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
