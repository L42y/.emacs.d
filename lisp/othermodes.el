(use-package autoinsert
  :init (progn
          (add-hook 'python-mode-hook 'auto-insert))
  :config (progn
            (setq auto-insert-query nil
                  auto-insert-directory "~/.emacs.d/templates/")
            (define-auto-insert "\.py" "python.py")))


(use-package desktop
  :init (progn
          (desktop-save-mode 1))
  :config (progn
            (setq desktop-restore-eager 20
                  desktop-lazy-verbose nil
                  desktop-base-file-name "desktop"
                  desktop-base-lock-name "desktop.lock")
            (add-to-list 'desktop-modes-not-to-save '(dired-mode fundamental-mode))))


(use-package ibuffer
  :bind ("C-x C-b" . ibuffer))


(use-package ido
  :init (ido-mode)
  :config (progn
            (setq ido-show-dot-for-dired t
                  ido-enable-flex-matching nil)))


(use-package linum
  :init (add-hook 'prog-mode-hook 'linum-mode)
  :commands (linum-mode))


(use-package newcomment
  :bind (("C-'" . comment-dwim)
         ("C-c g" . comment-or-uncomment-region)))


(use-package wdired
  :init (progn
          (add-hook 'dired-mode-hook
                    '(lambda ()
                       (define-key dired-mode-map "e" 'wdired-change-to-wdired-mode)))))


(use-package whitespace
  :init (progn
          (add-hook 'prog-mode-hook 'whitespace-mode)
          (add-hook 'prog-mode-hook
                    '(lambda () (setq show-trailing-whitespace t))))
  :config (progn
            (setq whitespace-line-column 80
                  whitespace-style '(face lines-tail)))
  :diminish whitespace-mode)


(use-package avy
  :bind ("C-," . avy-goto-char-2)
  :ensure t)


(use-package diff-hl
  :init
  (add-hook 'prog-mode-hook 'turn-on-diff-hl-mode)
  (add-hook 'vc-dir-mode-hook 'turn-on-diff-hl-mode)
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
  :ensure t)


(use-package editorconfig
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
         ("C-c h" . helm-projectile)
         ("C-c s" . helm-projectile-ag)
         ("C-x C-y" . helm-show-kill-ring))
  :ensure t
  :config (progn
            (use-package helm-ag
              :ensure t)
            (use-package helm-config)
            (use-package helm-command
              :config (setq helm-M-x-fuzzy-match t))
            (use-package helm-projectile
              :ensure t)))


(use-package ibuffer-vc
  :ensure t
  :config (progn
            (add-hook 'ibuffer-hook
                      (lambda ()
                        (ibuffer-vc-set-filter-groups-by-vc-root)
                        (unless (eq ibuffer-sorting-mode 'alphabetic)
                          (ibuffer-do-sort-by-alphabetic))))))


(use-package magit
  :bind ("C-x C-z" . magit-status)
  :ensure t
  :config (progn
            (use-package magit-gerrit
              :ensure t)))


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
  :config (progn
            (projectile-global-mode))
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
  :config (progn
            (smartparens-global-mode t)
            (show-smartparens-global-mode t)
            (use-package smartparens-config))
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
  :config (progn
            (tagedit-add-paredit-like-keybindings)
            (tagedit-add-experimental-features)))


(use-package tern
  :init (dolist (hook '(js2-mode-hook web-mode-hook))
          (add-hook hook #'tern-mode))
  :ensure t
  :diminish tern-mode)


(use-package wgrep-ag
  :ensure t)


(use-package yasnippet
  :ensure t
  :config (yas-global-mode 1))


(provide 'othermodes)
