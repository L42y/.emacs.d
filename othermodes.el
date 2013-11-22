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
(setq ido-show-dot-for-dired t)
(setq ido-enable-flex-matching nil)


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


;;; org-mode awesomeness
(require 'org)
(add-hook 'org-mode-hook
          (lambda ()
            (toggle-truncate-lines)))

(require 'org-crypt)
(org-crypt-use-before-save-magic)
(setq org-tags-exclude-from-inheritance (quote ("crypt")))
(setq org-crypt-key "i@l42y.com")

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (sh . t)
   (js . t)
   (org . t)
   (python . t)
   (emacs-lisp . t)))
(setq org-src-fontify-natively t)

(require 'org-publish)
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
(require 'ag)
(setq ag-highlight-search t)


;;; helm awesomeness
(require 'helm-config)


;;; $PATH
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


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


;;; rainbow-delimiters
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)


;;; sgml
(require 'sgml-mode)
(setq sgml-basic-offset 4)

;;; after deleting a tag, indent properly
(defadvice sgml-delete-tag (after reindent activate)
  (indent-region (point-min) (point-max)))


;;; zencoding
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)


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
(require 'tern-auto-complete)
(tern-ac-setup)
(setq tern-ac-on-dot t)


;;; ispell
(setq ispell-dictionary "english")
(setq-default ispell-program-name "aspell")
(add-hook 'prog-mode-hook 'flyspell-prog-mode)


(provide 'othermodes)
;;; othermodes.el ends here
