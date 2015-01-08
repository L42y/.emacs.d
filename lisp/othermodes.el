;;; other-modes.el --- Programming unrelated things

;;; Commentary:

;;; Code:

;; built-in packages
;;; conf-mode
(use-package conf-mode
  :init (add-to-list 'auto-mode-alist '("\\.*rc$" . conf-unix-mode)))


;;; desktop
(use-package desktop
  :init (progn
          (desktop-save-mode 1))
  :config (progn
            (setq desktop-restore-eager 20
                  desktop-lazy-verbose nil)
            (add-to-list 'desktop-modes-not-to-save '(dired-mode fundamental-mode))))


(use-package ibuffer
  :bind ("C-x C-b" . ibuffer))


;;; use ido for minibuffer completion
(use-package ido
  :config (progn
            (setq ido-show-dot-for-dired t)
            (setq ido-enable-flex-matching nil)))


;;; ispell
(use-package ispell
  :init (add-hook 'prog-mode-hook 'flyspell-prog-mode)
  :config (progn
            (setq ispell-dictionary "english")
            (setq-default ispell-program-name "aspell")))


;;; newcomment
(use-package newcomment
  :bind (("C-'" . comment-dwim)
         ("C-c g" . comment-or-uncomment-region)))


;;; whitespace
(use-package whitespace
  :init (progn
          (add-hook 'prog-mode-hook 'whitespace-mode)
          (add-hook 'prog-mode-hook
                    '(lambda () (setq show-trailing-whitespace t))))
  :config (progn
            (setq whitespace-line-column 80
                  whitespace-style '(face lines-tail))))


;;; wdired
(use-package wdired
  :init (progn
          (add-hook 'dired-mode-hook
                    '(lambda ()
                       (define-key dired-mode-map "e" 'wdired-change-to-wdired-mode)))))


;;; easypg
(require 'epa-file)
(epa-file-enable)


;;; org-mode awesomeness
(use-package org
  :config (progn
            (add-hook 'org-mode-hook
                      (lambda ()
                        (toggle-truncate-lines)))
            (use-package org-crypt)))

(use-package org-agenda
  :bind ("C-c a" . org-agenda))

(use-package org-crypt
  :config (progn
            (org-crypt-use-before-save-magic)
            (setq org-tags-exclude-from-inheritance (quote ("crypt")))
            (setq org-crypt-key "i@l42y.com")))

(use-package ob
  :config (progn
            (setq org-src-fontify-natively t)
            (org-babel-do-load-languages
             'org-babel-load-languages
             '((sh . t)
               (js . t)
               (org . t)
               (python . t)
               (emacs-lisp . t)))))

(use-package ox-md
  :config (progn
            (use-package ox-gfm)
            (setq org-md-headline-style 'atx)))

(use-package ox-html
  :config (progn
            (setq org-html-doctype "html5"
                  org-html-html5-fancy t
                  org-html-metadata-timestamp-format "%Y-%m-%d %H:%M")))

(use-package ox-publish
  :config (progn
            (setq org-publish-project-alist
                  '(("L42y"
                     :components ("L42y-content" "L42y-static" "L42y-rss"))
                    ("L42y-content"
                     :base-directory "~/Dropbox/Emacs/Org/L42y.org/"
                     :base-extension "org"
                     :html-extension "html"
                     :publishing-directory "~/BTSync/L42y.org/"
                     :publishing-function (org-html-publish-to-html)
                     :with-toc nil
                     :recursive t
                     :html-preamble nil
                     :html-postamble nil
                     :section-numbers nil
                     :html-head-extra
                     "<link rel=\"stylesheet\" href=\"/_/css/main.css\">"
                     :htmlized-source t
                     :html-head-include-scripts nil
                     :html-head-include-default-style nil)
                    ("L42y-static"
                     :base-directory "~/Dropbox/Emacs/Org/L42y.org/_/"
                     :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf"
                     :publishing-directory "~/BTSync/L42y.org/_/"
                     :recursive t
                     :publishing-function (org-publish-attachment))
                    ("L42y-rss"
                     :base-directory "~/Dropbox/Emacs/Org/L42y.org/"
                     :base-extension "org"
                     :publishing-function (org-rss-publish-to-rss)
                     :publishing-directory "~/BTSync/L42y.org/"
                     :exclude ".*"
                     :include ("writing.org")
                     :with-toc nil
                     :html-link-home "https://l42y.com/"
                     :html-link-use-abs-url t)))))


;; third-party packages
;;; ag.el
(use-package ag
  :ensure t
  :bind ("<F5>" . ag-project-at-point)
  :config (progn
            (setq ag-reuse-buffers t)
            (setq ag-highlight-search t)))


;;; helm awesomeness
(use-package helm
  :ensure t
  :bind (("C-x b" . helm-mini)
         ("C-c h" . helm-projectile)
         ("C-x C-y" . helm-show-kill-ring))
  :config (progn
            (use-package helm-config)))


;;; projectile
(require 'projectile)
(projectile-global-mode)


;;; ibuffer-vc
(require 'ibuffer-vc)
(add-hook 'ibuffer-hook
          (lambda ()
            (ibuffer-vc-set-filter-groups-by-vc-root)
            (unless (eq ibuffer-sorting-mode 'alphabetic)
              (ibuffer-do-sort-by-alphabetic))))


;;; rainbow
(add-hook 'css-mode-hook 'rainbow-mode)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook 'rainbow-identifiers-mode)


;;; sgml
(require 'sgml-mode)
(setq sgml-basic-offset 4)

;;; after deleting a tag, indent properly
(defadvice sgml-delete-tag (after reindent activate)
  (indent-region (point-min) (point-max)))


;;; zencoding
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode)


;;; smartparens
(require 'smartparens)
(require 'smartparens-config)
(smartparens-global-mode t)
(show-smartparens-global-mode t)


;;; tagedit
(require 'tagedit)
(add-hook 'html-mode-hook (lambda () (tagedit-mode 1)))
(tagedit-add-paredit-like-keybindings)
(tagedit-add-experimental-features)


;;; expand-region
(use-package expand-region
  :ensure t
  :bind ("C-=" . er/expand-region))


;;; diff-hl
(require 'diff-hl)
(global-diff-hl-mode)


;;; markdown
(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))


;;; virtualenvwrapper
(require 'virtualenvwrapper)
(venv-initialize-interactive-shells)
(venv-initialize-eshell)
(setq venv-location "~/.virtualenvs/")


;;; tern
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))
(add-hook 'web-mode-hook (lambda () (tern-mode t)))
(require 'tern-auto-complete)
(tern-ac-setup)
(setq tern-ac-on-dot t)


(use-package osx-dictionary
  :ensure t
  :bind (("C-c c" . osx-dictionary-search-word)
         ("C-c d" . osx-dictionary-search-pointer)))


(use-package magit
  :ensure t
  :bind ("C-x C-z" . magit-status))


(use-package ace-jump-mode
  :ensure t
  :bind ("C-." . ace-jump-mode))


(use-package smex
  :ensure t
  :bind ("C-x <RET>" . smex))


(use-package multiple-cursors
  :ensure t
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)))


(use-package string-edit
  :ensure t
  :bind ("C-c i" . string-edit-at-point))


(provide 'othermodes)
;;; othermodes.el ends here
