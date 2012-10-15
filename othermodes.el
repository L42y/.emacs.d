;;; make buffer name uniquify
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward
      uniquify-separator "@")

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

(global-set-key (kbd "C-x C-y") 'helm-show-kill-ring)


;;; use ido for minibuffer completion
(require 'ido)

(ido-mode t)
(setq ido-show-dot-for-dired t)
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point 'guess)
(setq ido-auto-merge-work-directories-length -1)
(setq ido-save-directory-list-file "~/.emacs.d/.ido.last")


;;; ibuffer
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;;; jump to most recent buffer name at ibuffer list
(defadvice ibuffer (around ibuffer-point-to-most-recent) ()
  "Open ibuffer with cursor pointed to most recent buffer name"
  (let ((recent-buffer-name (buffer-name)))
    ad-do-it
    (ibuffer-jump-to-buffer recent-buffer-name)))
(ad-activate 'ibuffer)

;;; ibuffer auto group
(require 'ibuf-ext nil t)
(when (featurep 'ibuf-ext)
  (add-hook 'ibuffer-mode-hook
            (lambda ()
              (setq ibuffer-filter-groups
                    '(("Org Life"
                       (or (mode . org-mode)
                           (mode . org-agenda-mode)))
                      ("Web Development"
                       (or (mode . js-mode)
                           (mode . js2-mode)
                           (mode . php-mode)
                           (mode . web-mode)
                           (mode . css-mode)
                           (mode . sass-mode)
                           (mode . scss-mode)
                           (mode . html-mode)
                           (mode . nxml-mode)
                           (mode . haml-mode)
                           (mode . jinja2-mode)
                           (mode . nxhtml-mode)))
                      ("Python"
                       (or (mode . python-mode)))
                      ("Emacs-Lisp" (or (mode . emacs-lisp-mode)))
                      ("Buffer" (name . "\\*.*\\*"))
                      ("Dired" (mode . dired-mode)))))))


;;; org-mode awesomeness
(require 'org-install)
(define-key global-map "\C-ca" 'org-agenda)


;;; dired
(setq dired-listing-switches "-aluh") ;; ls alias
;;; wdired
(add-hook 'dired-mode-hook '(lambda ()
                              (define-key dired-mode-map "e" 'wdired-change-to-wdired-mode)))


;;; popwin
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)


;;; golden ratio
(golden-ratio-enable)


(provide 'othermodes)
