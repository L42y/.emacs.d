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
                      magit
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
