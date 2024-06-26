(use-package conf-mode
  :mode (("\\.*rc$" . conf-unix-mode)))


(use-package css-mode
  :config
  (setq css-indent-offset 2)
  (use-package rainbow-mode
    :hook (css-mode)
    :ensure t))


(use-package flymake)


(use-package flycheck
  :hook (prog-mode . flycheck-mode)
  :ensure t
  :config
  (setq flycheck-check-syntax-automatically '(mode-enabled save)))


(use-package flyspell
  :hook ((org-mode text-mode) . flyspell-mode)
  :hook (prog-mode . flyspell-prog-mode)
  :config
  (use-package ispell
    :config (when (executable-find "enchant-2")
              (setq ispell-dictionary "english"
                    ispell-program-name "enchant-2"
                    ispell-really-enchant t)))
  ;; if spell checking is broken, probably because of enchant-lsmod binary is gone
  (use-package flyspell-popup
    :init (bind-key "C-;" 'flyspell-popup-correct flyspell-mode-map)
    :ensure t)
  :diminish flyspell-mode)


(use-package sgml-mode
  :config
  (setq sgml-basic-offset 2)
  ;; after deleting a tag, indent properly
  (defadvice sgml-delete-tag (after reindent activate)
    (indent-region (point-min) (point-max))))


(use-package ssh-config-mode
  :mode (("/sshd?_config\\'" . ssh-config-mode)
         ("/\\.ssh/config\\'" . ssh-config-mode)
         ("/known_hosts\\'" . ssh-known-hosts-mode)
         ("/authorized_keys2?\\'" . ssh-authorized-keys-mode))
  :ensure t)


(use-package web-mode
  :mode (("\\.hbs$" . web-mode)
         ("\\.html$" . web-mode))
  :ensure t
  :config
  (setq web-mode-style-padding sgml-basic-offset
        web-mode-script-padding sgml-basic-offset
        web-mode-css-indent-offset sgml-basic-offset
        web-mode-code-indent-offset sgml-basic-offset
        web-mode-markup-indent-offset sgml-basic-offset
        web-mode-enable-auto-pairing t
        web-mode-enable-css-colorization t
        web-mode-enable-auto-indentation nil
        web-mode-enable-current-column-highlight t
        web-mode-enable-current-element-highlight t))


(use-package emmet-mode
  :hook (sgml-mode css-mode web-mode rjsx-mode tsx-mode tsx-ts-mode)
  :ensure t
  :config
  (add-hook 'js2-jsx-mode-hook
            '(lambda()
               (setq-local emmet-expand-jsx-className? t)
               (setq-local emmet-self-closing-tag-style " /"))))


(use-package markdown-mode
  :mode (("\\.mdx$" . gfm-mode)
         ("README\\.md$" . gfm-mode))
  :ensure t
  :config
  (use-package markdown-toc
    :ensure t
    :config (setq markdown-toc-header-toc-end "<!-- Markdown TOC end -->"
                  markdown-toc-header-toc-start "<!-- Markdown TOC start -->")))


(use-package nginx-mode
  :ensure t)


(use-package pkgbuild-mode
  :ensure t)


(use-package pip-requirements
  :ensure t)


(use-package json-mode
  :mode ("\\.json$")
  :ensure t)


(use-package yarn-mode
  :ensure t)


(use-package graphql-mode
  :mode ("\\.gql$" . graphql-mode)
  :ensure t)


(provide 'textmodes)
