(use-package desktop
  :init (progn
          (desktop-save-mode 1))
  :config (progn
            (setq desktop-restore-eager 20
                  desktop-lazy-verbose nil
                  desktop-path (list savefile-path)
                  desktop-base-file-name "desktop"
                  desktop-base-lock-name "desktop.lock")
            (add-to-list 'desktop-modes-not-to-save '(dired-mode fundamental-mode))))


(use-package ibuffer
  :bind ("C-x C-b" . ibuffer))


(use-package ido
  :config (progn
            (setq ido-show-dot-for-dired t
                  ido-enable-flex-matching nil
                  ido-save-directory-list-file (expand-file-name
                                                "ido" savefile-path))))


(use-package newcomment
  :bind (("C-'" . comment-dwim)
         ("C-c g" . comment-or-uncomment-region)))


(use-package whitespace
  :diminish whitespace-mode
  :init (progn
          (add-hook 'prog-mode-hook 'whitespace-mode)
          (add-hook 'prog-mode-hook
                    '(lambda () (setq show-trailing-whitespace t))))
  :config (progn
            (setq whitespace-line-column 80
                  whitespace-style '(face lines-tail))))


(use-package wdired
  :init (progn
          (add-hook 'dired-mode-hook
                    '(lambda ()
                       (define-key dired-mode-map "e" 'wdired-change-to-wdired-mode)))))


(use-package ag
  :ensure t
  :bind ("<f5>" . ag-project-at-point)
  :config (progn
            (setq ag-reuse-buffers t)
            (setq ag-highlight-search t)))


(use-package helm
  :ensure t
  :bind (("C-x b" . helm-mini)
         ("C-c h" . helm-projectile)
         ("C-x C-y" . helm-show-kill-ring))
  :config (progn
            (use-package helm-config)
            (use-package helm-projectile
              :ensure t)))


(use-package projectile
  :ensure t
  :diminish projectile-mode
  :init (projectile-global-mode)
  :config (progn
            (setq projectile-known-projects-file
                  (expand-file-name "projectile-projects" savefile-path))))


(use-package ibuffer-vc
  :ensure t
  :config (progn
            (add-hook 'ibuffer-hook
                      (lambda ()
                        (ibuffer-vc-set-filter-groups-by-vc-root)
                        (unless (eq ibuffer-sorting-mode 'alphabetic)
                          (ibuffer-do-sort-by-alphabetic))))))


(use-package rainbow-delimiters
  :ensure t
  :commands rainbow-delimiters-mode
  :init (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))


(use-package rainbow-identifiers
  :ensure t
  :commands rainbow-identifiers-mode
  :init (add-hook 'prog-mode-hook 'rainbow-identifiers-mode))


(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :init (progn
          (smartparens-global-mode t)
          (show-smartparens-global-mode t))
  :config (progn
            (use-package smartparens-config)))


(use-package tagedit
  :ensure t
  :init (add-hook 'html-mode-hook 'tagedit-mode)
  :config (progn
            (tagedit-add-paredit-like-keybindings)
            (tagedit-add-experimental-features)))


(use-package expand-region
  :ensure t
  :bind ("C-=" . er/expand-region))


(use-package diff-hl
  :ensure t
  :init (global-diff-hl-mode))


(use-package tern
  :ensure t
  :diminish tern-mode
  :init (dolist (hook '(js2-mode-hook web-mode-hook))
          (add-hook hook #'tern-mode)))


(use-package osx-dictionary
  :if (eq system-type 'darwin)
  :ensure t
  :bind (("C-c c" . osx-dictionary-search-input)
         ("C-c d" . osx-dictionary-search-pointer)))


(use-package magit
  :ensure t
  :diminish magit-auto-revert-mode
  :bind ("C-x C-z" . magit-status))


(use-package gitattributes-mode
  :ensure t)


(use-package gitconfig-mode
  :ensure t)


(use-package gitignore-mode
  :ensure t)


(use-package ace-jump-mode
  :ensure t
  :bind ("C-." . ace-jump-mode))


(use-package smex
  :ensure t
  :bind ("C-x <RET>" . smex)
  :config (progn
            (setq smex-save-file (expand-file-name "smex" savefile-path))))


(use-package multiple-cursors
  :ensure t
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this))
  :config (progn
            (setq mc/list-file (expand-file-name "mc-lists.el" savefile-path))))


(use-package string-edit
  :ensure t
  :bind ("C-c i" . string-edit-at-point))


(use-package editorconfig
  :ensure t)


(use-package yasnippet
  :ensure t)


(use-package wgrep-ag
  :ensure t)


(use-package pcache
  :config (progn
            (setq pcache-directory (expand-file-name "pcache" savefile-path))))


(provide 'othermodes)
