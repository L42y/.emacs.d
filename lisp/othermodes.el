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


(use-package ibuffer
  :bind ("C-x C-b" . ibuffer))


(use-package ido
  :init (ido-mode)
  :config
  (setq ido-show-dot-for-dired t
        ido-enable-flex-matching nil))


(use-package newcomment
  :bind (("C-'" . comment-dwim)
         ("C-c g" . comment-or-uncomment-region))
  :straight (:type built-in))


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


(use-package abridge-diff
  :after magit
  :ensure t
  :diminish abridge-diff-mode)


(use-package ag
  :bind (("C-c C-p" . ag-project))
  :ensure t
  :config (setq ag-reuse-window t
                ag-highlight-search t))


(use-package apheleia
  :init (apheleia-global-mode +1)
  :config (add-to-list 'apheleia-mode-alist '(tsx-mode . prettier))
  :ensure t)


(use-package company
  :ensure t
  :custom
  (company-minimum-prefix-length 1)
  :config
  (global-company-mode 1)
  :delight " 🏢")

(use-package company-web
  :ensure t
  :config
  (push 'company-web-html company-backends))

(use-package company-anaconda
  :ensure t
  :config
  (push 'company-anaconda company-backends))

(use-package company-posframe
  :ensure t
  :delight)

(use-package company-statistics
  :ensure
  :config (company-statistics-mode 1))


(use-package copilot
  :bind (:map copilot-completion-map
              ("<tab>" . copilot-accept-completion)
              ("TAB" . copilot-accept-completion))
  :hook prog-mode
  :ensure t
  :straight (:host github :repo "zerolfx/copilot.el" :files ("dist" "*.el")))


(use-package delight
  :ensure t)


(use-package diminish
  :ensure t)


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
  :hook ((css-mode . eglot-ensure)
         (js2-mode . eglot-ensure)
         (web-mode . (lambda ()
                       (when (string-equal "html" web-mode-content-type)
                         (eglot-ensure))))
         (html-mode . eglot-ensure)
         (json-mode . eglot-ensure)
         (rjsx-mode . eglot-ensure)
         (dockerfile-mode . eglot-ensure))
  :config
  (setq eglot-server-programs
        '((sh-mode . ("bash-language-server" "start"))
          ((js2-mode rjsx-mode) . ("typescript-language-server" "--stdio"))
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


;; (use-package gitattributes-mode
;;   :ensure t)


;; (use-package gitconfig-mode
;;   :ensure t)


;; (use-package gitignore-mode
;;   :ensure t)


(use-package helm
  :bind (("M-x" . helm-M-x)
         ("C-x b" . helm-mini)
         ("C-c p" . helm-projectile)
         ("C-x C-y" . helm-show-kill-ring))
  :ensure t
  :config
  (setq helm-M-x-fuzzy-match t)
  :straight (:includes (helm-config helm-command)))

(use-package helm-ag
  :after helm
  :ensure t)

(use-package helm-projectile
  :after helm
  :ensure t)


(use-package ibuffer-vc
  :ensure t
  :config
  (add-hook 'ibuffer-hook
            (lambda ()
              (ibuffer-vc-set-filter-groups-by-vc-root)
              (unless (eq ibuffer-sorting-mode 'alphabetic)
                (ibuffer-do-sort-by-alphabetic)))))

(use-package magit
  :bind ("C-x C-z" . magit-status)
  :ensure t
  :custom
  (magit-diff-refine-hunk 'all))

(use-package forge
  :after magit
  :ensure t)

(use-package magit-imerge
  :after magit
  :ensure t)


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


(use-package rg
  :config
  (rg-enable-menu)
  (rg-enable-default-bindings)
  :ensure t)


(use-package smartparens
  :ensure t
  :config
  (smartparens-global-mode t)
  (show-smartparens-global-mode t)
  :diminish smartparens-mode
  :straight (:includes smartparens-config))


(use-package smex
  :bind ("C-x <RET>" . smex)
  :ensure t)


(use-package switch-window
  :bind ("C-x o" . switch-window)
  :ensure t)


(use-package tide
  :hook ((tsx-mode typescript-mode) . tide-setup)
  :hook ((tsx-mode typescript-mode) . tide-hl-identifier-mode)
  :after (company flycheck typescript-mode)
  :ensure t)


(use-package tree-sitter
  :hook (typescript-mode)
  :ensure t
  :delight " 🌲")

(use-package tree-sitter-langs
  :after tree-sitter
  :ensure t)


(use-package tsi
  :straight (:host github
                   :repo "orzechowskid/tsi.el"
                   :files ("*.el"
                           (:exclude "*.test.el"))))


(use-package tsx-mode
  :init (add-hook 'tsx-mode-hook (lambda () (tree-sitter-hl-mode -1)))
  :mode ("\\.tsx$" . tsx-mode)
  :straight (:host github
                   :repo "orzechowskid/tsx-mode.el"
                   :files ("*.el")))


(use-package wgrep-ag
  :init (add-hook 'ag-mode-hook 'wgrep-ag-setup)
  :ensure t)


(use-package yasnippet
  :ensure t
  :config (yas-global-mode 1))


(provide 'othermodes)
