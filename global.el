;; title bar format
(setq frame-title-format "%b @ %f")


;;; on to the visual settings
(menu-bar-mode -1)             ; no menubar
(tool-bar-mode -1)             ; no toolbar
(scroll-bar-mode -1)           ; no scrollbar
(line-number-mode 1)           ; have line numbers and
(column-number-mode 1)         ; column numbers in the mode line
(setq inhibit-splash-screen t) ; no splash screen, thanks

(show-paren-mode 1)
(global-hl-line-mode)          ; highlight current line
(global-linum-mode 1)          ; add line numbers on the left


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


;;; desktop
(desktop-save-mode 1)
(setq desktop-path '("~/.emacs.d/"))
(setq desktop-dirname "~/.emacs.d/")
(setq desktop-base-file-name "emacs-desktop")
(setq desktop-restore-eager 20
      desktop-lazy-verbose nil)


;;; under mac, have Command as Meta and keep Option for localized input
(when (string-match "apple-darwin" system-configuration)
  (setq mac-allow-anti-aliasing t)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'none))


;;; $PATH and exec-path
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))


(provide 'global)
