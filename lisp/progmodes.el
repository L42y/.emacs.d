(use-package js2-mode
  :ensure t
  :bind (:map js2-mode-map
              ("M-." . nil))
  :mode (("\\.js$" . js2-mode)
         ("\\.mjs$" . js2-mode))
  :config
  (setq-default js2-basic-offset 2)
  (setq js-enabled-frameworks (quote (javascript))
        js-switch-indent-offset js2-basic-offset
        js2-include-node-externs t
        js2-strict-missing-semi-warning nil)
  (use-package js-doc
    :ensure t
    :init (add-hook
           'js2-mode-hook
           '(lambda ()
              (define-key js2-mode-map "\C-ci" 'js-doc-insert-function-doc)
              (define-key js2-mode-map "@" 'js-doc-insert-tag))))
  (use-package xref-js2
    :init (add-hook
           'js2-mode-hook
           (lambda ()
             (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))
    :ensure t)
  (use-package rjsx-mode
    :mode ("/\\([[:upper:]]\\w+\\)\\(/index\\)?\\.js$" . rjsx-mode)
    :ensure t)
  (use-package js2-refactor
    :ensure t
    :init (add-hook 'js2-mode-hook #'js2-refactor-mode)
    :config (js2r-add-keybindings-with-prefix "C-c C-m")
    :diminish js2-refactor-mode))


(use-package typescript-mode
  :mode (("\\.ts$" . typescript-mode))
  :config (setq typescript-indent-level 2)
  :ensure t)


(use-package dart-mode
  :mode "\\.dart$"
  :ensure t)


(use-package python
  :ensure t
  :mode ("\\.py$" . python-mode)
  :interpreter ("python" . python-mode)
  :config
  (use-package pyenv-mode
    :ensure t)
  (use-package anaconda-mode
    :ensure t
    :init (add-hook 'python-mode-hook 'anaconda-mode))
  (use-package virtualenvwrapper
    :init (add-hook 'python-mode-hook
                    (lambda ()
                      (hack-local-variables)
                      (when (boundp 'project-venv-name)
                        (venv-workon project-venv-name))))
    :ensure t
    :config
    (venv-initialize-eshell)
    (venv-initialize-interactive-shells)
    (setq venv-location "~/.virtualenvs/")))


(use-package go-mode
  :ensure t)


(provide 'progmodes)
