;; built-in packages
;;; make buffer name uniquify
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward
      uniquify-separator "@")


;;; desktop
(desktop-save-mode 1)
(setq desktop-path '("~/.emacs.d/"))
(setq desktop-base-file-name ".emacs.desktop")
(add-to-list 'desktop-modes-not-to-save 'dired-mode)


;;; use ido for minibuffer completion
(ido-mode t)
(setq ido-show-dot-for-dired t)
(setq ido-save-directory-list-file "~/.emacs.d/.ido.last")


;;; org-mode awesomeness
(require 'org)
(add-hook 'org-mode-hook
          (lambda ()
            (toggle-truncate-lines)))


;; third-party packages
;;; ag.el
(setq ag-arguments (list
                    "--column"
                    "--literal"
                    "--nocolor"
                    "--nogroup"
                    "--all-text"
                    "--smart-case"))


;;; skewer
(setq httpd-root "~/.emacs.d/el-get/skewer-mode")
(httpd-start)

(add-hook 'skewer-css-mode-hook
          (lambda ()
            (add-hook 'after-save-hook 'skewer-css-eval-buffer nil t)))


;;; helm awesomeness
(require 'helm-config)
(global-set-key (kbd "C-x b")
                (lambda() (interactive)
                  (helm
                   :prompt "Switch to: "
                   :candidate-number-limit 10
                   :sources
                   '(helm-c-source-buffers-list
                     helm-c-source-files-in-current-dir
                     helm-c-source-recentf
                     helm-c-source-locate
                     helm-c-source-buffer-not-found))))


;;; $PATH
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


;;; projectile
(projectile-global-mode)


;;; ibuffer-vc
(add-hook 'ibuffer-hook
          (lambda ()
            (ibuffer-vc-set-filter-groups-by-vc-root)
            (unless (eq ibuffer-sorting-mode 'alphabetic)
              (ibuffer-do-sort-by-alphabetic))))


;;; wdired
(add-hook 'dired-mode-hook
          '(lambda ()
             (define-key dired-mode-map "e" 'wdired-change-to-wdired-mode)))


;;; golden ratio
(golden-ratio-enable)


(provide 'othermodes)
