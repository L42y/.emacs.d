;;; pkgs.el --- Emacs built-in package manager

;;; Commentary:

;;; Code:

;;; builtin package
(require 'package)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("org" . "http://orgmode.org/elpa/")
        ("melpa" . "http://melpa.milkbox.net/packages/")
        ))
(package-initialize)


;;; install missing packages
(defvar my-packages '(ag
                      ace-jump-mode
                      auto-complete
                      better-defaults
                      clojure-mode
                      clojure-test-mode
                      diff-hl
                      emmet-mode
                      exec-path-from-shell
                      expand-region
                      flycheck
                      helm
                      helm-projectile
                      ibuffer-vc
                      jedi
                      js2-mode
                      json-mode
                      magit
                      markdown-mode
                      monokai-theme
                      multiple-cursors
                      nrepl
                      org
                      org-plus-contrib
                      paredit
                      pkgbuild-mode
                      projectile
                      rainbow-delimiters
                      scss-mode
                      smartparens
                      smex
                      tagedit
                      tern
                      tern-auto-complete
                      virtualenvwrapper))

(dolist (package my-packages)
  (unless (package-installed-p package)
    (package-refresh-contents)
    (package-install package)))



(provide 'pkgs)
;;; pkgs.el ends here
