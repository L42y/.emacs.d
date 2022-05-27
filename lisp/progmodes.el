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
  :diminish js2-minor-mode)


(use-package rjsx-mode
  :mode ("/\\([[:upper:]]\\w+\\)\\(/index\\)?\\.js$" . rjsx-mode)
  :ensure t
  :diminish rjsx-minor-mode)

(use-package typescript-mode
  :mode ("\\.ts$" . typescript-mode)
  :config
  (setq typescript-indent-level 2)
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
