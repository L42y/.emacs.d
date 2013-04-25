;;; global.el --- Random configs

;;; Commentary:

;;; Code:

;;; better defaults
(require 'better-defaults)


;; title bar format
(setq frame-title-format "%b @ %f")


;;; global enabled modes
(global-hl-line-mode)     ; highlight current line
(global-linum-mode)       ; add line numbers on the left
(delete-selection-mode t) ; delete marked text on typing

;;; shorter answer
(defalias 'yes-or-no-p 'y-or-n-p)


;; whenever an external process changes a file underneath emacs, and there
;; was no unsaved changes in the corresponding buffer, just revert its
;; content to reflect what's on-disk.
(global-auto-revert-mode 1)


;;; under mac, have Command as Meta and keep Option for localized input
(when (string-match "apple-darwin" system-configuration)
  (setq mac-allow-anti-aliasing t)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'super)
  (setq ns-function-modifier 'hyper))


(provide 'global)
;;; global.el ends here
