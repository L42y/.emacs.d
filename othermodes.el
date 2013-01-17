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
(helm-mode 1)

(global-set-key (kbd "C-x b")
                (lambda() (interactive)
                  (helm
                   :prompt "Switch to: "
                   :candidate-number-limit 15                 ;; up to 10 of each
                   :sources
                   '(helm-c-source-buffers-list          ;; buffers
                     helm-c-source-recentf               ;; recent files
                     helm-c-source-bookmarks             ;; bookmarks
                     helm-c-source-files-in-current-dir  ;; current dir
                     helm-c-source-locate                ;; use 'locate'
                     helm-c-source-buffer-not-found))))


;;; projectile
(projectile-global-mode)


;;; use ido for minibuffer completion
(ido-mode t)
(setq ido-show-dot-for-dired t)
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point 'guess)
(setq ido-auto-merge-work-directories-length -1)
(setq ido-save-directory-list-file "~/.emacs.d/.ido.last")


;;; ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

;;; jump to most recent buffer name at ibuffer list
(defadvice ibuffer (around ibuffer-point-to-most-recent) ()
  "Open ibuffer with cursor pointed to most recent buffer name"
  (let ((recent-buffer-name (buffer-name)))
    ad-do-it
    (ibuffer-jump-to-buffer recent-buffer-name)))
(ad-activate 'ibuffer)

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
