(use-package flatui-theme
  :ensure t
  :if window-system
  :init (load-theme 'flatui t))


(set-frame-font "Fantasque Sans Mono 15")
(set-fontset-font t 'han "Hiragino Sans GB")
(setq face-font-rescale-alist (list (cons "Hiragino Sans GB" 1.1)))


(use-package better-defaults
  :ensure t)


(setq frame-title-format "%b @ %f")


(use-package autorevert
  :init (global-auto-revert-mode 1)
  :config (progn
            (setq global-auto-revert-non-file-buffers t
                  auto-revert-verbose nil)))


(use-package hl-line
  :init (global-hl-line-mode))


(use-package delsel
  :init (delete-selection-mode t))


(defalias 'yes-or-no-p 'y-or-n-p)


(use-package exec-path-from-shell
  :ensure t
  :if (memq window-system '(mac ns))
  :init (exec-path-from-shell-initialize))


(when (string-match "apple-darwin" system-configuration)
  (setq mac-allow-anti-aliasing t)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'super)
  (setq ns-function-modifier 'hyper))


(use-package server
  :init (server-start))


(provide 'global)
