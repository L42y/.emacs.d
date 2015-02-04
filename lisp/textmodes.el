(use-package conf-mode
  :init (add-to-list 'auto-mode-alist '("\\.*rc$" . conf-unix-mode)))


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


(use-package ispell
  :init (add-hook 'prog-mode-hook 'flyspell-prog-mode)
  :config (progn
            (setq ispell-dictionary "english")
            (setq-default ispell-program-name "aspell")))


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
  :init (add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode)))


(use-package json-mode
  :ensure t)


(use-package nginx-mode
  :ensure t)


(use-package pkgbuild-mode
  :ensure t)


(use-package yaml-mode
  :ensure t)


(use-package pip-requirements
  :ensure t)


(provide 'textmodes)
