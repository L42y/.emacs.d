;;; other-modes.el --- Programming unrelated things

;;; Commentary:

;;; Code:

;; built-in packages
;;; make buffer name uniquify
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward
      uniquify-separator "@")


;;; desktop
(require 'desktop)
(desktop-save-mode 1)
(setq desktop-path '("~/.emacs.d/"))
(setq desktop-base-file-name ".emacs.desktop")
(add-to-list 'desktop-modes-not-to-save 'dired-mode)


;;; use ido for minibuffer completion
(require 'ido)
(ido-mode t)
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
;;; main-line
(require 'main-line)
(setq main-line-separator-style 'slant-left)


;;; ag.el
(require 'ag)
(setq ag-arguments (list
                    "--column"
                    "--literal"
                    "--nocolor"
                    "--nogroup"
                    "--all-text"
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
(projectile-global-mode)


;;; ibuffer-vc
(require 'ibuffer-vc)
(add-hook 'ibuffer-hook
          (lambda ()
            (ibuffer-vc-set-filter-groups-by-vc-root)
            (unless (eq ibuffer-sorting-mode 'alphabetic)
              (ibuffer-do-sort-by-alphabetic))))


(provide 'othermodes)
;;; othermodes.el ends here
