;;; other-modes.el --- Programming unrelated things

;;; Commentary:

;;; Code:

;; built-in packages
;;; conf-mode
(add-to-list 'auto-mode-alist '("\\.*rc$" . conf-unix-mode))


;;; desktop
(require 'desktop)
(desktop-save-mode 1)
(setq desktop-restore-eager 20
      desktop-lazy-verbose nil)
(add-to-list 'desktop-modes-not-to-save '(dired-mode fundamental-mode))


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
(require 'whitespace)
(setq whitespace-line-column 80)
(setq whitespace-style '(face lines-tail))

(add-hook 'prog-mode-hook 'whitespace-mode)
(add-hook 'prog-mode-hook
          '(lambda () (setq show-trailing-whitespace t)))


;;; wdired
(add-hook 'dired-mode-hook
          '(lambda ()
             (define-key dired-mode-map "e" 'wdired-change-to-wdired-mode)))


;;; easypg
(require 'epa-file)
(epa-file-enable)


;;; org-mode awesomeness
(require 'org)
(add-hook 'org-mode-hook
          (lambda ()
            (toggle-truncate-lines)))

(require 'ox-md)
(require 'ox-gfm)
(setq org-md-headline-style 'atx)

(require 'org-crypt)
(org-crypt-use-before-save-magic)
(setq org-tags-exclude-from-inheritance (quote ("crypt")))
(setq org-crypt-key "i@l42y.com")

(org-babel-do-load-languages
 'org-babel-load-languages
 '((sh . t)
   (js . t)
   (org . t)
   (python . t)
   (emacs-lisp . t)))
(setq org-src-fontify-natively t)

(setq org-html-doctype "html5"
      org-html-html5-fancy t
      org-html-metadata-timestamp-format "%Y-%m-%d %H:%M")
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
         :html-link-use-abs-url t)))

;; third-party packages
;;; ag.el
(use-package ag
  :bind ("<F5>" . ag-project-at-point)
  :config (progn
            (setq ag-reuse-buffers t)
            (setq ag-highlight-search t)))


;;; helm awesomeness
(use-package helm
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
(require 'expand-region)


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
  :bind ("C-x C-z" . magit-status))


(provide 'othermodes)
;;; othermodes.el ends here
