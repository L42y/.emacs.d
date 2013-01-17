;; title bar format
(setq frame-title-format "%b @ %f")


;;; don't blink, please
(blink-cursor-mode 0)


;;; on to the visual settings
(menu-bar-mode -1)             ; no menubar
(tool-bar-mode -1)             ; no toolbar
(scroll-bar-mode -1)           ; no scrollbar

(show-paren-mode 1)
(global-hl-line-mode)          ; highlight current line
(global-linum-mode 1)          ; add line numbers on the left
(delete-selection-mode t)      ; delete marked text on typing

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


;;; desktop
(desktop-save-mode 1)
(setq desktop-path '("~/.emacs.d/"))
(setq desktop-dirname "~/.emacs.d/")
(setq desktop-base-file-name "emacs-desktop")
(setq desktop-restore-eager 20
      desktop-lazy-verbose nil)


;;; save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))


;;; under mac, have Command as Meta and keep Option for localized input
(when (string-match "apple-darwin" system-configuration)
  (setq mac-allow-anti-aliasing t)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'none))


;;; $PATH
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


(provide 'global)
