;;; pkgs.el --- Emacs built-in package manager

;;; Commentary:

;;; Code:

;;; builtin package
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)


;;; install missing packages
(defvar my-packages '(ag
                      ace-jump-mode
                      angular-snippets
                      auto-complete
                      better-defaults
                      clojure-mode
                      clojure-test-mode
                      diff-hl
                      exec-path-from-shell
                      expand-region
                      flycheck
                      helm
                      helm-projectile
                      ibuffer-vc
                      jedi
                      js2-mode
                      magit
                      magit-commit-training-wheels
                      markdown-mode
                      monokai-theme
                      multiple-cursors
                      nrepl
                      org
                      paredit
                      pkgbuild-mode
                      projectile
                      rainbow-delimiters
                      scss-mode
                      simplezen
                      skewer-mode
                      smartparens
                      smex
                      tagedit
                      yasnippet))

(dolist (package my-packages)
  (unless (package-installed-p package)
    (package-refresh-contents)
    (package-install package)))



(provide 'pkgs)
;;; pkgs.el ends here
