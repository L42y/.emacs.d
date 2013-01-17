;;; make buffer name uniquify
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward
      uniquify-separator "@")


;;; desktop
(desktop-save-mode 1)
(setq desktop-base-file-name ".emacs.desktop")
(add-to-list 'desktop-modes-not-to-save 'dired-mode)


;;; helm awesomeness
(require 'helm-config)
(global-set-key (kbd "C-x b")
                (lambda() (interactive)
                  (helm
                   :prompt "Switch to: "
                   :candidate-number-limit 10                 ;; up to 10 of each
                   :sources
                   '(helm-c-source-buffers-list          ;; buffers
                     helm-c-source-files-in-current-dir  ;; current dir
                     helm-c-source-recentf               ;; recent files
                     helm-c-source-locate                ;; use 'locate'
                     helm-c-source-buffer-not-found))))


;;; projectile
(projectile-global-mode)


;;; use ido for minibuffer completion
(ido-mode t)
(setq ido-show-dot-for-dired t)
(setq ido-save-directory-list-file "~/.emacs.d/.ido.last")


;;; ibuffer-vc
(add-hook 'ibuffer-hook
          (lambda ()
            (ibuffer-vc-set-filter-groups-by-vc-root)
            (unless (eq ibuffer-sorting-mode 'alphabetic)
              (ibuffer-do-sort-by-alphabetic))))


;;; org-mode awesomeness
(require 'org)
(define-key global-map "\C-ca" 'org-agenda)
(add-hook 'org-mode-hook
          (lambda ()
            (toggle-truncate-lines)))


;;; wdired
(add-hook 'dired-mode-hook
          '(lambda ()
             (define-key dired-mode-map "e" 'wdired-change-to-wdired-mode)))


;;; golden ratio
(golden-ratio-enable)


(provide 'othermodes)
