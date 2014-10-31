;;; pkgs.el --- Emacs built-in package manager

;;; Commentary:

;;; Code:

;;; builtin package
(require 'package)
(setq package-archives
  '(
     ("gnu" . "https://elpa.gnu.org/packages/")
     ("org" . "http://orgmode.org/elpa/")
     ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)


;;; install missing packages
(defvar my-packages '(
                       ag
                       ace-jump-mode
                       angular-snippets
                       auto-complete
                       better-defaults
                       color-identifiers-mode
                       diff-hl
                       editorconfig
                       emmet-mode
                       exec-path-from-shell
                       expand-region
                       flatui-theme
                       flycheck
                       flycheck-tip
                       gitattributes-mode
                       gitconfig-mode
                       gitignore-mode
                       go-mode
                       helm
                       helm-open-github
                       helm-projectile
                       htmlize
                       ibuffer-vc
                       jedi
                       js-doc
                       js2-mode
                       json-mode
                       magit
                       markdown-mode
                       monokai-theme
                       multiple-cursors
                       nginx-mode
                       org
                       org-plus-contrib
                       paredit
                       pip-requirements
                       pkgbuild-mode
                       projectile
                       rainbow-delimiters
                       rainbow-mode
                       smartparens
                       smex
                       string-edit
                       tagedit
                       tern
                       tern-auto-complete
                       virtualenvwrapper
                       yasnippet))

(dolist (package my-packages)
  (unless (package-installed-p package)
    (package-refresh-contents)
    (package-install package)))



(provide 'pkgs)
;;; pkgs.el ends here
