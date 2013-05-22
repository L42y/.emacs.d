;;; other-modes.el --- Programming unrelated things

;;; Commentary:

;;; Code:

;; built-in packages
;;; desktop
(require 'desktop)
(desktop-save-mode 1)
(setq desktop-path '("~/.emacs.d/"))
(setq desktop-base-file-name ".emacs.desktop")
(add-to-list 'desktop-modes-not-to-save 'dired-mode)


;;; use ido for minibuffer completion
(setq ido-show-dot-for-dired t)
(setq ido-save-directory-list-file "~/.emacs.d/.ido.last")


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
(setq ag-arguments (list
                    "--column"
                    "--literal"
                    "--nocolor"
                    "--nogroup"
                    "--smart-case"))


;;; skewer
(require 'simple-httpd)
(setq httpd-root "~/.emacs.d/el-get/skewer-mode")
(httpd-start)

(add-hook 'skewer-css-mode-hook
          (lambda ()
            (add-hook 'after-save-hook 'skewer-css-eval-buffer nil t)))


;;; helm awesomeness
(require 'helm-config)


;;; $PATH
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


;;; projectile
(require 'projectile)
(projectile-global-mode)


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
(setq sgml-basic-offset 4)


;;; smartparens
(require 'smartparens)
(require 'smartparens-config)
(smartparens-global-mode t)
(show-smartparens-global-mode t)
(sp-with-modes '(web-mode)
  (sp-local-pair "<" ">")
  (sp-local-tag  "<" "<_>" "</_>" :transform 'sp-match-sgml-tags))


;;; tagedit
(require 'tagedit)
(add-hook 'web-mode-hook (lambda () (tagedit-mode 1)))
(tagedit-add-paredit-like-keybindings)
(tagedit-add-experimental-features)


;;; expand-region
(require 'expand-region)


;;; diff-hl
(require 'diff-hl)
(global-diff-hl-mode)


;;; markdown
(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))


(provide 'othermodes)
;;; othermodes.el ends here
