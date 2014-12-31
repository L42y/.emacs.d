;;; pkgs.el --- Emacs built-in package manager

;;; Commentary:

;;; Code:

;;; builtin package
(require 'package)
(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("org" . "http://orgmode.org/elpa/")
        ("melpa" . "http://melpa.org/packages/")))
(package-initialize)


;;; install missing packages
(defvar my-packages '(ag
                      ace-jump-mode
                      angular-snippets
                      auto-complete
                      better-defaults
                      diff-hl
                      editorconfig
                      emmet-mode
                      exec-path-from-shell
                      expand-region
                      flatui-theme
                      flycheck
                      flycheck-pos-tip
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
                      multiple-cursors
                      nginx-mode
                      org-plus-contrib
                      ox-gfm
                      paredit
                      pip-requirements
                      pkgbuild-mode
                      projectile
                      rainbow-delimiters
                      rainbow-identifiers
                      rainbow-mode
                      smartparens
                      smex
                      string-edit
                      tagedit
                      tern
                      tern-auto-complete
                      virtualenvwrapper
                      web-mode
                      wgrep-ag
                      yaml-mode
                      yasnippet))

(dolist (package my-packages)
  (unless (package-installed-p package)
    (package-refresh-contents)
    (package-install package)))


;;; el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil t)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://github.com/dimitri/el-get/raw/master/el-get-install.el")
    (end-of-buffer)
    (eval-print-last-sexp)))

(setq
 my:el-get-packages
 '(el-get))

(el-get 'sync my:el-get-packages)


(provide 'pkgs)
;;; pkgs.el ends here
