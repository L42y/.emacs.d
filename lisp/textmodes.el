(use-package conf-mode
  :mode (("\\.*rc$" . conf-unix-mode)))


(use-package css-mode
  :config (progn
            (setq css-indent-offset 2)
            (use-package rainbow-mode
              :init (add-hook 'css-mode-hook 'rainbow-mode)
              :ensure t)))


(use-package flycheck
  :ensure t
  :init (add-hook 'prog-mode-hook 'flycheck-mode)
  :config (progn
            (setq flycheck-check-syntax-automatically '(mode-enabled save))
            (use-package flycheck-elm
              :init (add-to-list 'flycheck-checkers 'elm)
              :ensure t)
            (use-package flycheck-pos-tip
              :ensure t
              :config (progn
                        (setq flycheck-display-errors-function
                              'flycheck-pos-tip-error-messages)))))


(use-package flyspell
  :init (progn
          (add-hook 'org-mode-hook 'flyspell-mode)
          (add-hook 'text-mode-hook 'flyspell-mode)
          (add-hook 'prog-mode-hook 'flyspell-prog-mode))
  :config (progn
            (use-package ispell
              :config (when (executable-find "hunspell")
                        (setq ispell-program-name "hunspell"
                              ispell-really-hunspell t)))
            (use-package flyspell-popup
              :init (bind-key "C-;" 'flyspell-popup-correct flyspell-mode-map)
              :ensure t)))


(use-package sgml-mode
  :config (progn
            (setq sgml-basic-offset 2)
            ;; after deleting a tag, indent properly
            (defadvice sgml-delete-tag (after reindent activate)
              (indent-region (point-min) (point-max)))))


(use-package web-mode
  :mode (("\\.hbs$" . web-mode)
         ("\\.html$" . web-mode))
  :ensure t
  :config (progn
            (setq web-mode-style-padding sgml-basic-offset
                  web-mode-script-padding sgml-basic-offset
                  web-mode-css-indent-offset sgml-basic-offset
                  web-mode-code-indent-offset sgml-basic-offset
                  web-mode-markup-indent-offset sgml-basic-offset
                  web-mode-enable-auto-pairing t
                  web-mode-enable-css-colorization t
                  web-mode-enable-current-column-highlight t
                  web-mode-enable-current-element-highlight t)))


(use-package emmet-mode
  :ensure t
  :config (dolist (hook '(sgml-mode-hook css-mode-hook web-mode-hook js2-jsx-mode-hook))
            (add-hook hook #'emmet-mode)))


(use-package markdown-mode
  :mode ("README\\.md$" . gfm-mode)
  :ensure t
  :config (use-package apib-mode
            :mode ("\\.apib$" . apib-mode)
            :ensure t))


(use-package nginx-mode
  :ensure t)


(use-package pkgbuild-mode
  :ensure t)


(use-package pip-requirements
  :ensure t)


(use-package json-mode
  :mode ("\\.json$" . json-mode)
  :ensure t)


(provide 'textmodes)
