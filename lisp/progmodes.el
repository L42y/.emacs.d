;;; progmodes.el --- Programming related things

;;; Commentary:

;;; Code:

;;; code style
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default fill-column 80)
(setq indent-line-function 'insert-tab)
(prefer-coding-system 'utf-8)


;; linum
(use-package linum
  :init (add-hook 'prog-mode-hook 'linum-mode))


;;; auto-complte
(require 'auto-complete-config)
(ac-config-default)

(define-key ac-completing-map (kbd "C-n") 'ac-next)
(define-key ac-completing-map (kbd "C-p") 'ac-previous)
(define-key ac-complete-mode-map "\r" nil)


;;; python
(require 'jedi)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)


;;; javascript
(use-package js2-mode
  :ensure t
  :init (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  :config
  (progn
    (setq js2-basic-offset 2)
    (use-package js-doc
      :ensure t
      :init (add-hook
             'js2-mode-hook
             '(lambda ()
                (define-key js2-mode-map "\C-ci" 'js-doc-insert-function-doc)
                (define-key js2-mode-map "@" 'js-doc-insert-tag))))))


;;; web
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))


;;; auto insert
(require 'autoinsert)
(auto-insert-mode)
(setq auto-insert-directory "~/.emacs.d/templates/")
(setq auto-insert-query nil)
(define-auto-insert "\.py" "python.py")
(define-auto-insert "\.html" "html.html")


(provide 'progmodes)
;;; progmodes.el ends here
