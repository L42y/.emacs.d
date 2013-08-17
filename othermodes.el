;;; other-modes.el --- Programming unrelated things

;;; Commentary:

;;; Code:

;; built-in packages
;;; desktop
(require 'desktop)
(desktop-save-mode 1)
(setq desktop-path (list savefile-path))
(setq desktop-base-file-name "desktop")
(setq desktop-base-lock-name "desktop.lock")
(setq desktop-restore-eager 20
      desktop-lazy-verbose nil)
(add-to-list 'desktop-modes-not-to-save '(dired-mode fundamental-mode))


;;; use ido for minibuffer completion
(setq ido-show-dot-for-dired t)
(setq ido-enable-flex-matching nil)
(setq ido-save-directory-list-file (expand-file-name "ido" savefile-path))


;;; recentf
(require 'recentf)
(setq recentf-save-file (expand-file-name "recentf" savefile-path))


;;; saveplace
(require 'saveplace)
(setq save-place-file (expand-file-name "places" savefile-path))


;;; whitespace
(require 'whitespace)
(setq whitespace-line-column 80)
(setq whitespace-style '(face lines-tail))

(add-hook 'prog-mode-hook 'whitespace-mode)


;;; wdired
(add-hook 'dired-mode-hook
          '(lambda ()
             (define-key dired-mode-map "e" 'wdired-change-to-wdired-mode)))


;;; org-mode awesomeness
(require 'org)
(add-hook 'org-mode-hook
          (lambda ()
            (toggle-truncate-lines)))


;; third-party packages
;;; ag.el
(require 'ag)
(setq ag-highlight-search t)


;;; helm awesomeness
(require 'helm-config)


;;; $PATH
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


;;; projectile
(require 'projectile)
(projectile-global-mode)
(setq projectile-known-projects-file
      (expand-file-name "projectile-projects" savefile-path))


;;; ibuffer-vc
(require 'ibuffer-vc)
(add-hook 'ibuffer-hook
          (lambda ()
            (ibuffer-vc-set-filter-groups-by-vc-root)
            (unless (eq ibuffer-sorting-mode 'alphabetic)
              (ibuffer-do-sort-by-alphabetic))))


;;; rainbow-delimiters
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)


;;; sgml
(require 'sgml-mode)
(setq sgml-basic-offset 4)

;;; after deleting a tag, indent properly
(defadvice sgml-delete-tag (after reindent activate)
  (indent-region (point-min) (point-max)))


;;; zencoding
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)


;;; smartparens
(require 'smartparens)
(require 'smartparens-config)
(smartparens-global-mode t)
(show-smartparens-global-mode t)


;;; tagedit
(require 'tagedit)
(add-hook 'html-mode-hook (lambda () (tagedit-mode 1)))
(tagedit-add-paredit-like-keybindings)
(tagedit-add-experimental-features)


;;; expand-region
(require 'expand-region)


;;; multiple-cursors
(require 'multiple-cursors)
(setq mc/list-file (expand-file-name "mc-lists.el" savefile-path))


;;; diff-hl
(require 'diff-hl)
(global-diff-hl-mode)


;;; markdown
(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))


;;; virtualenvwrapper
(require 'virtualenvwrapper)
(venv-initialize-interactive-shells)
(venv-initialize-eshell)
(setq venv-location "~/.virtualenvs/")


;;; tern
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))
(setq tern-ac-on-dot t)


;;; smex
(require 'smex)
(setq smex-save-file (expand-file-name "smex" savefile-path))


(provide 'othermodes)
;;; othermodes.el ends here
