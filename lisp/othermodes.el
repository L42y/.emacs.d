(use-package autoinsert
  :init
  (add-hook 'python-mode-hook 'auto-insert)
  :config
  (setq auto-insert-query nil
        auto-insert-directory "~/.emacs.d/templates/")
  (define-auto-insert "\.py" "python.py"))


(use-package desktop
  :init
  (desktop-save-mode 1)
  :config
  (setq desktop-restore-eager 20
        desktop-lazy-verbose nil
        desktop-base-file-name "desktop"
        desktop-base-lock-name "desktop.lock")
  (add-to-list 'desktop-modes-not-to-save 'dired-mode)
  (add-to-list 'desktop-modes-not-to-save 'fundamental-mode)
  (add-to-list 'desktop-modes-not-to-save 'company-posframe-mode))


(use-package display-line-numbers
  :init (add-hook 'prog-mode-hook 'display-line-numbers-mode))


(use-package eldoc
  :diminish eldoc-mode)


(use-package eshell
  :config (setq eshell-prompt-function 'epe-theme-lambda))


(use-package ibuffer
  :bind ("C-x C-b" . ibuffer))


(use-package ido
  :init (ido-mode)
  :config
  (setq ido-show-dot-for-dired t
        ido-enable-flex-matching nil))


(use-package newcomment
  :bind (("C-'" . comment-dwim)
         ("C-c g" . comment-or-uncomment-region)))


(use-package wdired
  :init
  (add-hook 'dired-mode-hook
            '(lambda ()
               (define-key dired-mode-map "e" 'wdired-change-to-wdired-mode))))


(use-package whitespace
  :init
  (add-hook 'prog-mode-hook 'whitespace-mode)
  (add-hook 'prog-mode-hook
            '(lambda () (setq show-trailing-whitespace t)))
  :config
  (setq whitespace-line-column 80
        whitespace-style '(face lines-tail))
  :diminish whitespace-mode)


(use-package ag
  :bind (("C-c C-s" . ag-project))
  :config (setq ag-reuse-window t
                ag-highlight-search t))


(use-package avy
  :bind ("C-," . avy-goto-char-2)
  :ensure t)


(use-package aweshell)


(use-package company
  :ensure t
  :config
  (use-package company-lsp
    :ensure t
    :config (push 'company-lsp company-backends))

  (use-package company-web
    :ensure t
    :config (push 'company-web-html company-backends))

  (use-package company-anaconda
    :ensure t
    :config (push 'company-anaconda company-backends))

  (use-package company-posframe
    :init (company-posframe-mode 1)
    :ensure t
    :diminish company-posframe-mode)

  (use-package company-quickhelp
    :ensure t
    :config (company-quickhelp-mode 1))

  (use-package company-statistics
    :ensure
    :config (company-statistics-mode 1))

  (setq company-minimum-prefix-length 1)

  (global-company-mode 1)
  :diminish company-mode)


(use-package diff-hl
  :init
  (add-hook 'prog-mode-hook 'turn-on-diff-hl-mode)
  (add-hook 'vc-dir-mode-hook 'turn-on-diff-hl-mode)
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
  :ensure t)


(use-package editorconfig
  :ensure t)


(use-package eglot
  :bind (:map eglot-mode-map
              ("M-." . xref-find-definitions)
              ("C-c h" . eglot-help-at-point))
  :hook ((css-mode .eglot-ensure)
         (web-mode . (lambda ()
                       (when (string-equal "html" web-mode-content-type)
                         (eglot-ensure))))
         (html-mode . eglot-ensure)
         (json-mode . eglot-ensure)
         (dockerfile-mode . eglot-ensure))
  :config
  (setq eglot-server-programs
        '((sh-mode . ("bash-language-server" "start"))
          ((js2-mode rjsx-mode) . ("javascript-typescript-stdio"))
          (css-mode . ("css-languageserver" "--stdio"))
          (web-mode . (lambda ()
                        (when (string-equal "html" web-mode-content-type)
                          ("html-languageserver" "--stdio"))))
          (html-mode . ("html-languageserver" "--stdio"))
          (json-mode . ("json-languageserver" "--stdio"))
          (dockerfile-mode . ("docker-langserver" "--stdio")))
        eglot-ignored-server-capabilites '(:hoverProvider))
  :ensure t)


(use-package expand-region
  :bind ("C-=" . er/expand-region)
  :ensure t)


(use-package gitattributes-mode
  :ensure t)


(use-package gitconfig-mode
  :ensure t)


(use-package gitignore-mode
  :ensure t)


(use-package helm
  :bind (("M-x" . helm-M-x)
         ("C-x b" . helm-mini)
         ("C-c s" . helm-projectile-ag)
         ("C-x C-y" . helm-show-kill-ring))
  :ensure t
  :config
  (use-package helm-ag
    :ensure t)
  (use-package helm-config)
  (use-package helm-command
    :config (setq helm-M-x-fuzzy-match t))
  (use-package helm-projectile
    :ensure t))


(use-package ibuffer-vc
  :ensure t
  :config
  (add-hook 'ibuffer-hook
            (lambda ()
              (ibuffer-vc-set-filter-groups-by-vc-root)
              (unless (eq ibuffer-sorting-mode 'alphabetic)
                (ibuffer-do-sort-by-alphabetic)))))


(use-package indium
  :ensure t)


(use-package lsp-mode
  :ensure t
  :config
  (use-package lsp-ui
    :hook (lsp-mode . lsp-ui-mode)
    :ensure t)
  (use-package lsp-sh
    :ensure t)
  (use-package lsp-php
    :config
    (setq lsp-php-server-install-dir "~/.composer")
    :ensure t)
  (use-package lsp-typescript
    :ensure t)
  (use-package lsp-javascript-typescript
    :hook ((js-mode . lsp-javascript-typescript-enable)
           (web-mode . (lambda ()
                         (when (string-equal "jsx" web-mode-content-type)
                           (lsp-javascript-typescript-enable))))
           (rjsx-mode . lsp-javascript-typescript-enable)
           (typescript-mode . lsp-javascript-typescript-enable))
    :ensure t)
  (setq lsp-enable-eldoc nil))

(use-package magit
  :bind ("C-x C-z" . magit-status)
  :ensure t
  :config
  (use-package magit-imerge
    :ensure t))


(use-package multiple-cursors
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this))
  :ensure t)


(use-package osx-dictionary
  :if (eq system-type 'darwin)
  :bind (("C-c c" . osx-dictionary-search-input)
         ("C-c d" . osx-dictionary-search-pointer))
  :ensure t)


(use-package projectile
  :ensure t
  :config (projectile-mode)
  :diminish projectile-mode)


(use-package rainbow-delimiters
  :init (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
  :ensure t
  :commands rainbow-delimiters-mode)


(use-package rainbow-identifiers
  :init (add-hook 'prog-mode-hook 'rainbow-identifiers-mode)
  :ensure t
  :commands rainbow-identifiers-mode)


(use-package restart-emacs
  :ensure t)


(use-package smartparens
  :ensure t
  :config
  (smartparens-global-mode t)
  (show-smartparens-global-mode t)
  (use-package smartparens-config)
  :diminish smartparens-mode)


(use-package smex
  :bind ("C-x <RET>" . smex)
  :ensure t)


(use-package string-edit
  :bind ("C-c i" . string-edit-at-point)
  :ensure t)


(use-package switch-window
  :bind ("C-x o" . switch-window)
  :ensure t)


(use-package tagedit
  :init (dolist (hook '(sgml-mode-hook))
          (add-hook hook #'tagedit-mode))
  :ensure t
  :config
  (tagedit-add-paredit-like-keybindings)
  (tagedit-add-experimental-features))


(use-package tide
  :hook ((before-save . tide-format-before-save)
         (web-mode . (lambda ()
                       (when (string-equal "jsx" web-mode-content-type)
                         (tide-setup)
                         (tide-hl-identifier-mode))))
         (typescript-mode . tide-setup)
         (typescript-mode . tide-hl-identifier-mode))
  :after (company flycheck typescript-mode)
  :ensure t)


(use-package wgrep-ag
  :init (add-hook 'ag-mode-hook 'wgrep-ag-setup)
  :ensure t)


(use-package yasnippet
  :ensure t
  :config (yas-global-mode 1))


(provide 'othermodes)
