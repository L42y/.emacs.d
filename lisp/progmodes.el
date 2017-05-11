(use-package company
  :ensure t
  :init (global-company-mode)
  :config (progn
            (use-package company-web
              :ensure t
              :init (add-to-list 'company-backends 'company-web-html))
            (use-package company-flow
              :ensure t
              :init (add-to-list 'company-backends 'company-flow))
            (use-package company-tern
              :ensure t
              :init (add-to-list 'company-backends 'company-tern))
            (use-package company-anaconda
              :ensure t
              :init (add-to-list 'company-backends 'company-anaconda))
            (use-package company-quickhelp
              :ensure t
              :init (company-quickhelp-mode 1))
            (use-package company-statistics
              :ensure t
              :init (company-statistics-mode 1))
            (setq company-minimum-prefix-length 1)))


(use-package js2-mode
  :ensure t
  :bind (:map js2-mode-map
              ("M-." . nil))
  :mode ("\\.js$" . js2-mode)
  :config (progn
            (setq-default js2-basic-offset 2)
            (setq js-enabled-frameworks (quote (javascript))
                  js-switch-indent-offset js2-basic-offset
                  js2-include-node-externs t)
            (use-package js-doc
              :ensure t
              :init (add-hook
                     'js2-mode-hook
                     '(lambda ()
                        (define-key js2-mode-map "\C-ci" 'js-doc-insert-function-doc)
                        (define-key js2-mode-map "@" 'js-doc-insert-tag))))
            (use-package rjsx-mode
              :mode ("/\\([[:upper:]]\\w+\\)\\(/index\\)?\\.js$" . rjsx-mode)
              :ensure t)
            (use-package js2-refactor
              :ensure t
              :init (add-hook 'js2-mode-hook #'js2-refactor-mode)
              :config (progn
                        (js2r-add-keybindings-with-prefix "C-c C-m")))
            (use-package js2-highlight-vars
              :init (add-hook 'js2-mode-hook #'js2-highlight-vars-mode)
              :ensure t)))


(use-package typescript-mode
  :mode (("\\.ts$" . typescript-mode))
  :ensure t
  :config (progn
            (use-package tide
              :init (add-hook 'typescript-mode-hook 'tide-mode)
              :config (tide-restart-server)
              :ensure t
              :commands (tide-mode))))


(use-package coffee-mode
  :mode "\\.coffee$"
  :config (setq coffee-tab-width 2)
  :ensure t)


(use-package tj-mode
  :ensure t)


(use-package python
  :ensure t
  :mode ("\\.py$" . python-mode)
  :interpreter ("python" . python-mode)
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


(use-package go-mode
  :ensure t)


(use-package clojure-mode
  :ensure t)


(use-package elm-mode
  :init (add-to-list 'company-backends 'company-elm)
  :ensure t
  :config (setq elm-format-on-save t
                elm-format-command "elm-format-0.17"
                elm-sort-imports-on-save t)
  :commands (company-elm))


(use-package php-mode
  :ensure t)


(provide 'progmodes)
