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


(use-package company
  :ensure t
  :init (global-company-mode)
  :config (progn
            (use-package company-tern
              :ensure t
              :init (add-to-list 'company-backends 'company-tern))
            (use-package company-ycmd
              :ensure t
              :init (company-ycmd-setup))
            (use-package company-quickhelp
              :ensure t
              :init (company-quickhelp-mode 1))))


;;; javascript
(use-package js2-mode
  :ensure t
  :init (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  :config
  (progn
    (setq-default js2-basic-offset 2)
    (use-package js-doc
      :ensure t
      :init (add-hook
             'js2-mode-hook
             '(lambda ()
                (define-key js2-mode-map "\C-ci" 'js-doc-insert-function-doc)
                (define-key js2-mode-map "@" 'js-doc-insert-tag))))))


;;; web
(use-package web-mode
  :ensure t
  :init (add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
  :config (setq web-mode-code-indent-offset 2))


;;; auto insert
(use-package autoinsert
  :init (add-hook 'python-mode-hook 'auto-insert)
  :config (progn
            (setq auto-insert-query nil
                  auto-insert-directory "~/.emacs.d/templates/")
            (define-auto-insert "\.py" "python.py")))


(use-package go-mode
  :ensure t)


(provide 'progmodes)
;;; progmodes.el ends here
