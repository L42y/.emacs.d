;;; global.el --- Random configs

;;; Commentary:

;;; Code:

;;; load color theme
(if (display-graphic-p)
    (load-theme 'flatui t))


;;; set fonts
(set-frame-font "Fantasque Sans Mono 15")
(set-fontset-font t 'han "Hiragino Sans GB 12")
(setq face-font-rescale-alist (list (cons "Hiragino Sans GB" 1.2)))


;;; better defaults
(require 'better-defaults)


;; title bar format
(setq frame-title-format "%b @ %f")


;;; global enabled modes
(global-hl-line-mode)     ; highlight current line
(delete-selection-mode t) ; delete marked text on typing

;;; shorter answer
(defalias 'yes-or-no-p 'y-or-n-p)


;; whenever an external process changes a file underneath emacs, and there
;; was no unsaved changes in the corresponding buffer, just revert its
;; content to reflect what's on-disk.
(global-auto-revert-mode 1)


;;; $PATH
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


;;; under mac, have Command as Meta and keep Option for localized input
(when (string-match "apple-darwin" system-configuration)
  (setq mac-allow-anti-aliasing t)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'super)
  (setq ns-function-modifier 'hyper))


;;; start server
(require 'server)
(unless (server-running-p) (server-start))


(provide 'global)
;;; global.el ends here