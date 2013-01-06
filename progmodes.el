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

(dolist (hook '(sass-mode-hook
                scss-mode-hook
                haml-mode-hook))
  (add-hook hook (lambda () (auto-complete-mode 1))))

(define-key ac-completing-map (kbd "C-n") 'ac-next)
(define-key ac-completing-map (kbd "C-p") 'ac-previous)
(define-key ac-complete-mode-map "\r" nil)


;;; flycheck
(dolist (hook '(js-mode-hook
                js2-mode-hook
                css-mode-hook
                sgml-mode-hook
                haml-mode-hook
                sass-mode-hook
                ruby-mode-hook
                python-mode-hook
                emacs-lisp-mode-hook))
  (add-hook hook (lambda () (flycheck-mode-on))))


;;; yasnippet
(yas-global-mode 1)


;;; electric
(electric-pair-mode t)
(electric-layout-mode t)


;;; C
(add-hook 'c-mode-hook
          '(lambda ()
             (c-set-style "k&r")
             (setq tab-width 8)
             (setq c-basic-offset 8)))


;;; python
(autoload 'jedi:setup "jedi" nil t)
(add-hook 'python-mode-hook 'jedi:setup)


;;; javascript
(setq js2-basic-offset 2)


;;; web-mode
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))


;; hl-tags-mode
(add-hook 'web-mode-hook (lambda () (hl-tags-mode 1)))
(add-hook 'sgml-mode-hook (lambda () (hl-tags-mode 1)))
(add-hook 'nxml-mode-hook (lambda () (hl-tags-mode 1)))


;;; zencoding
(add-hook 'web-mode-hook 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode)


;;; haml
(add-to-list 'auto-mode-alist '("\\.haml\\'" . haml-mode))
(add-hook 'haml-mode-hook
	  (lambda ()
	    (setq indent-tabs-mode nil)
	    (define-key haml-mode-map "\C-m" 'newline-and-indent)))

;; scss
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
(setq scss-compile-at-save nil)


;;; auto insert
(auto-insert-mode)
(setq auto-insert-directory "~/.emacs.d/templates/")
(setq auto-insert-query nil)
(define-auto-insert "\.py" "python.py")
(define-auto-insert "\.html" "html.html")


(provide 'progmodes)
