;; title bar format
(setq frame-title-format "%b @ %f")


;;; on to the visual settings
(menu-bar-mode 0)         ; no menubar
(tool-bar-mode 0)         ; no toolbar
(scroll-bar-mode 0)       ; no scrollbar
(blink-cursor-mode 0)     ; don't blink, please

(show-paren-mode 1)
(global-hl-line-mode)     ; highlight current line
(global-linum-mode)       ; add line numbers on the left
(delete-selection-mode t) ; delete marked text on typing

;;; shorter answer
(defalias 'yes-or-no-p 'y-or-n-p)


;;; take from https://github.com/josh/emacs.d/blob/master/global.el by @joshpeek

(setq auto-save-default nil)            ; disable auto-save files (#foo#)
(setq backup-inhibited t)               ; disable backup files (foo~)
(setq auto-save-list-file-prefix nil)   ; disable auto-save-list/.saves
(setq visible-bell nil)                 ; disable bell
(setq ns-pop-up-frames nil)             ; always open in the same window
(setq show-trailing-whitespace t)       ; show extra whitespace
(set-default 'indicate-empty-lines nil) ; hide empty line fringe


;; Use the clipboard, pretty please, so that copy/paste "works"
(setq x-select-enable-clipboard t)


;; whenever an external process changes a file underneath emacs, and there
;; was no unsaved changes in the corresponding buffer, just revert its
;; content to reflect what's on-disk.
(global-auto-revert-mode 1)

;; also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)


;;; under mac, have Command as Meta and keep Option for localized input
(when (string-match "apple-darwin" system-configuration)
  (setq mac-allow-anti-aliasing t)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'super)
  (setq ns-function-modifier 'hyper))


(provide 'global)
