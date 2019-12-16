(use-package conf-mode
  :mode (("\\.*rc$" . conf-unix-mode)))


(use-package css-mode
  :config
  (setq css-indent-offset 2)
  (use-package css-comb
    :bind (:map css-mode-map
                ("C-c C-x c" . css-comb))
    :ensure t)
  (use-package rainbow-mode
    :init (add-hook 'css-mode-hook 'rainbow-mode)
    :ensure t))


(use-package flymake)


(use-package flycheck
  :init (add-hook 'prog-mode-hook 'flycheck-mode)
  :ensure t
  :config
  (setq flycheck-check-syntax-automatically '(mode-enabled save))
  (use-package flycheck-elm
    :init (add-to-list 'flycheck-checkers 'elm)
    :ensure t)
  (use-package flycheck-flow
    :config
    (flycheck-add-mode 'javascript-flow 'flow-minor-mode)
    (flycheck-add-mode 'javascript-eslint 'flow-minor-mode)
    (flycheck-add-next-checker 'javascript-flow 'javascript-eslint)
    :ensure t)
  (use-package flycheck-posframe
    :init (add-hook 'flycheck-mode-hook #'flycheck-posframe-mode)
    :ensure t
    :config (flycheck-posframe-configure-pretty-defaults)))


(use-package flyspell
  :init
  (add-hook 'org-mode-hook 'flyspell-mode)
  (add-hook 'text-mode-hook 'flyspell-mode)
  (add-hook 'prog-mode-hook 'flyspell-prog-mode)
  :config
  (use-package ispell
    :config (when (executable-find "enchant-2")
              (setq ispell-dictionary "english"
                    ispell-really-enchant t)))
  ;; if spell checking is broken, probably because of enchant-lsmod binary is gone
  (use-package flyspell-popup
    :init (bind-key "C-;" 'flyspell-popup-correct flyspell-mode-map)
    :ensure t)
  :diminish flyspell-mode)


(use-package prettier-js
  :hook ((js2-mode . prettier-js-mode)
         (web-mode . prettier-js-mode)
         (json-mode . prettier-js-mode)
         (typescript-mode . prettier-js-mode))
  :ensure t
  :diminish prettier-js-mode)


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
         ("\\.tsx$" . web-mode)
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
  :ensure t
  :config
  (dolist (hook '(sgml-mode-hook css-mode-hook web-mode-hook rjsx-mode-hook))
    (add-hook hook #'emmet-mode))
  (add-hook 'js2-jsx-mode-hook
            '(lambda()
               (setq-local emmet-expand-jsx-className? t)
               (setq-local emmet-self-closing-tag-style " /"))))


(use-package markdown-mode
  :mode (("\\.mdx$" . gfm-mode)
         ("README\\.md$" . gfm-mode))
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


(use-package yarn-mode
  :ensure t)


(use-package graphql-mode
  :mode ("\\.gql$" . graphql-mode)
  :ensure t)


(provide 'textmodes)
