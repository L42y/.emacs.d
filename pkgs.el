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
                      markdown-mode
                      multiple-cursors
                      nrepl
                      org
                      paredit
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
