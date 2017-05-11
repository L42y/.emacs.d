(use-package darkokai-theme
  :ensure t
  :if window-system
  :init (load-theme 'darkokai t))


(add-to-list 'default-frame-alist
             '(font . "Fira Code 13"))
(set-fontset-font t 'han "Hiragino Sans GB")
(setq face-font-rescale-alist (list (cons "Hiragino Sans GB" 1.1)))


(prefer-coding-system 'utf-8)


(setq fill-column 80)


(setq frame-title-format "%b @ %f")


(defalias 'yes-or-no-p 'y-or-n-p)


(use-package autorevert
  :init (global-auto-revert-mode 1)
  :config (progn
            (setq global-auto-revert-non-file-buffers t
                  auto-revert-verbose nil)))


(use-package better-defaults
  :ensure t)


(use-package delsel
  :init (delete-selection-mode t))


(use-package exec-path-from-shell
  :ensure t
  :if (and (eq system-type 'darwin) (display-graphic-p))
  :config (progn
            (dolist (var '("GOPATH" "PYTHONPATH"))
              (add-to-list 'exec-path-from-shell-variables var))
            (exec-path-from-shell-initialize)))


(use-package hl-line
  :init (global-hl-line-mode))


(use-package no-littering
  :ensure t)


(use-package server
  :init (server-start))


(when (string-match "apple-darwin" system-configuration)
  (setq mac-option-modifier 'super
        mac-command-modifier 'meta
        ns-function-modifier 'hyper
        mac-allow-anti-aliasing t)
  (when (fboundp 'mac-auto-operator-composition-mode)
    (mac-auto-operator-composition-mode)))


(provide 'globals)
