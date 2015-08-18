(use-package conf-mode
  :mode (("\\.*rc$" . conf-unix-mode)))


(use-package css-mode
  :config (progn
            (setq css-indent-offset 2)))


(use-package flycheck
  :ensure t
  :init (add-hook 'prog-mode-hook 'flycheck-mode)
  :config (progn
            (setq flycheck-check-syntax-automatically '(mode-enabled save))
            (use-package flycheck-pos-tip
              :ensure t
              :config (progn
                        (setq flycheck-display-errors-function
                              'flycheck-pos-tip-error-messages)))))


(use-package flyspell
  :init (progn
          (add-hook 'text-mode-hook 'flyspell-mode)
          (add-hook 'prog-mode-hook 'flyspell-prog-mode))
  :config (progn
            (use-package flyspell-popup
              :ensure t
              :init (bind-key "C-;" 'flyspell-popup-correct flyspell-mode-map))))


(use-package ispell
  :config (progn
            (when (executable-find "hunspell")
              (setq-default ispell-program-name "hunspell")
              (setq ispell-really-hunspell t))))


(use-package sgml-mode
  :config (progn
            (setq sgml-basic-offset 4)
            ;; after deleting a tag, indent properly
            (defadvice sgml-delete-tag (after reindent activate)
              (indent-region (point-min) (point-max)))))


(use-package rainbow-mode
  :ensure t
  :init (add-hook 'css-mode-hook 'rainbow-mode))


(use-package emmet-mode
  :ensure t
  :init (dolist (hook '(sgml-mode-hook css-mode-hook web-mode-hook))
          (add-hook hook #'emmet-mode)))


(use-package markdown-mode
  :ensure t
  :mode ("README\\.md$" . gfm-mode))


(use-package nginx-mode
  :ensure t)


(use-package pkgbuild-mode
  :ensure t)


(use-package yaml-mode
  :ensure t)


(use-package pip-requirements
  :ensure t)


(provide 'textmodes)
