;;; progmodes.el --- Programming related things

;;; Commentary:

;;; Code:

;;; code style
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
(prefer-coding-system 'utf-8)


;; linum
(add-hook 'prog-mode-hook 'linum-mode)


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

(define-key ac-completing-map (kbd "C-n") 'ac-next)
(define-key ac-completing-map (kbd "C-p") 'ac-previous)
(define-key ac-complete-mode-map "\r" nil)


;;; flycheck
(require 'flycheck)
(add-hook 'prog-mode-hook 'flycheck-mode)
(setq flycheck-check-syntax-automatically '(mode-enabled save))

(require 'flycheck-tip)
(setq flycheck-tip-avoid-show-func nil
      flycheck-display-errors-function
      'flycheck-tip-display-current-line-error-message)


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


;;; auto insert
(require 'autoinsert)
(auto-insert-mode)
(setq auto-insert-directory "~/.emacs.d/templates/")
(setq auto-insert-query nil)
(define-auto-insert "\.py" "python.py")
(define-auto-insert "\.html" "html.html")


(provide 'progmodes)
;;; progmodes.el ends here
