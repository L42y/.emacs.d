;;; global.el --- Random configs

;;; Commentary:

;;; Code:

;;; load color theme
(use-package flatui-theme
  :if window-system
  :init (load-theme 'flatui t))


;;; set fonts
(set-frame-font "Fantasque Sans Mono 15")
(set-fontset-font t 'han "Hiragino Sans GB")
(setq face-font-rescale-alist (list (cons "Hiragino Sans GB" 1.1)))


;;; better defaults
(use-package better-defaults)


;; title bar format
(setq frame-title-format "%b @ %f")


(use-package hl-line
  ;; highlight current line
  :init (global-hl-line-mode))


(use-package delsel
  ;; delete marked text on typing
  :init (delete-selection-mode t))


;;; shorter answer
(defalias 'yes-or-no-p 'y-or-n-p)


;; whenever an external process changes a file underneath emacs, and there
;; was no unsaved changes in the corresponding buffer, just revert its
;; content to reflect what's on-disk.
(global-auto-revert-mode 1)


;;; $PATH
(use-package exec-path-from-shell
  :if (memq window-system '(mac ns))
  :init (exec-path-from-shell-initialize))


;;; under mac, have Command as Meta and keep Option for localized input
(when (string-match "apple-darwin" system-configuration)
  (setq mac-allow-anti-aliasing t)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'super)
  (setq ns-function-modifier 'hyper))


;;; start server
(use-package server
  :init (server-start))


(provide 'global)
;;; global.el ends here
