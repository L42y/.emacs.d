(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default fill-column 80)
(setq indent-line-function 'insert-tab)
(prefer-coding-system 'utf-8)


(use-package linum
  :init (add-hook 'prog-mode-hook 'linum-mode))


(use-package company
  :ensure t
  :init (global-company-mode)
  :config (progn
            (use-package company-tern
              :ensure t
              :init (add-to-list 'company-backends 'company-tern))
            (use-package company-anaconda
              :ensure t
              :init (add-to-list 'company-backends 'company-anaconda))
            (use-package company-quickhelp
              :ensure t
              :init (company-quickhelp-mode 1))
            (setq company-minimum-prefix-length 1)))


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


(use-package python
  :ensure t
  :config (progn
            (use-package pyenv-mode
              :ensure t)
            (use-package anaconda-mode
              :ensure t
              :init (add-hook 'python-mode-hook 'anaconda-mode))
            (use-package virtualenvwrapper
              :ensure t
              :init (add-hook 'python-mode-hook
                              (lambda ()
                                (hack-local-variables)
                                (when (boundp 'project-venv-name)
                                  (venv-workon project-venv-name))))
              :config (progn
                        (venv-initialize-eshell)
                        (venv-initialize-interactive-shells)
                        (setq venv-location "~/.virtualenvs/")))))


(use-package web-mode
  :ensure t
  :init (progn
          (add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
          (add-to-list 'auto-mode-alist '("\\.json\\'" . web-mode)))
  :config (progn
            (setq web-mode-code-indent-offset 2)
            (setq web-mode-markup-indent-offset 2)))


(use-package autoinsert
  :init (add-hook 'python-mode-hook 'auto-insert)
  :config (progn
            (setq auto-insert-query nil
                  auto-insert-directory "~/.emacs.d/templates/")
            (define-auto-insert "\.py" "python.py")))


(use-package go-mode
  :ensure t)


(provide 'progmodes)
