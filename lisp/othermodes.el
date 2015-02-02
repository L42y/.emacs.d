;;; other-modes.el --- Programming unrelated things

;;; Commentary:

;;; Code:

;; built-in packages
;;; desktop
(use-package desktop
  :init (progn
          (desktop-save-mode 1))
  :config (progn
            (setq desktop-restore-eager 20
                  desktop-lazy-verbose nil)
            (add-to-list 'desktop-modes-not-to-save '(dired-mode fundamental-mode))))


(use-package ibuffer
  :bind ("C-x C-b" . ibuffer))


;;; use ido for minibuffer completion
(use-package ido
  :config (progn
            (setq ido-show-dot-for-dired t)
            (setq ido-enable-flex-matching nil)))


;;; newcomment
(use-package newcomment
  :bind (("C-'" . comment-dwim)
         ("C-c g" . comment-or-uncomment-region)))


;;; whitespace
(use-package whitespace
  :init (progn
          (add-hook 'prog-mode-hook 'whitespace-mode)
          (add-hook 'prog-mode-hook
                    '(lambda () (setq show-trailing-whitespace t))))
  :config (progn
            (setq whitespace-line-column 80
                  whitespace-style '(face lines-tail))))


;;; wdired
(use-package wdired
  :init (progn
          (add-hook 'dired-mode-hook
                    '(lambda ()
                       (define-key dired-mode-map "e" 'wdired-change-to-wdired-mode)))))


;; third-party packages
;;; ag.el
(use-package ag
  :ensure t
  :bind ("<f5>" . ag-project-at-point)
  :config (progn
            (setq ag-reuse-buffers t)
            (setq ag-highlight-search t)))


;;; helm awesomeness
(use-package helm
  :ensure t
  :bind (("C-x b" . helm-mini)
         ("C-c h" . helm-projectile)
         ("C-x C-y" . helm-show-kill-ring))
  :config (progn
            (use-package helm-config)
            (use-package helm-projectile
              :ensure t)))


;;; projectile
(use-package projectile
  :ensure t
  :init (projectile-global-mode))


;;; ibuffer-vc
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


;;; smartparens
(use-package smartparens
  :ensure t
  :init (progn
          (smartparens-global-mode t)
          (show-smartparens-global-mode t))
  :config (progn
            (use-package smartparens-config)))


;;; tagedit
(use-package tagedit
  :ensure t
  :init (add-hook 'html-mode-hook 'tagedit-mode)
  :config (progn
            (tagedit-add-paredit-like-keybindings)
            (tagedit-add-experimental-features)))


;;; expand-region
(use-package expand-region
  :ensure t
  :bind ("C-=" . er/expand-region))


;;; diff-hl
(use-package diff-hl
  :ensure t
  :init (global-diff-hl-mode))


;;; virtualenvwrapper
(use-package virtualenvwrapper
  :ensure t
  :config (progn
            (venv-initialize-eshell)
            (venv-initialize-interactive-shells)
            (setq venv-location "~/.virtualenvs/")))


;;; tern
(use-package tern
  :ensure t
  :init (dolist (hook '(js2-mode-hook web-mode-hook))
          (add-hook hook #'tern-mode)))


(use-package osx-dictionary
  :if (eq system-type 'darwin)
  :ensure t
  :bind (("C-c c" . osx-dictionary-search-input)
         ("C-c d" . osx-dictionary-search-pointer)))


(use-package magit
  :ensure t
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
  :bind ("C-x <RET>" . smex))


(use-package multiple-cursors
  :ensure t
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)))


(use-package string-edit
  :ensure t
  :bind ("C-c i" . string-edit-at-point))


(use-package editorconfig
  :ensure t)


(use-package yasnippet
  :ensure t)


(use-package wgrep-ag
  :ensure t)


(provide 'othermodes)
;;; othermodes.el ends here
