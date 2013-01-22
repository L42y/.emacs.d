;;; builtin package
(require 'package)
(add-to-list 'package-archives
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)


;;; el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil t)
  (url-retrieve
   "https://github.com/dimitri/el-get/raw/master/el-get-install.el"
   (lambda (s)
     (end-of-buffer)
     (eval-print-last-sexp))))

;;; now either el-get is `require'd already, or have been `load'ed by the
;;; el-get installer.

;;; set local recipes
(setq el-get-sources
      '((:name magit ; git meet emacs, and a binding
               :after (progn
                        (global-set-key (kbd "C-x C-z") 'magit-status)))
        (:name smex ; a better (ido like) M-x
               :after (progn
                        (setq smex-save-file "~/.emacs.d/.smex-items")
                        (global-set-key (kbd "C-x <RET>") 'smex)))))

(setq my-packages
      (append
       '(el-get

         ;; major modes
         go-mode
         js2-mode
         web-mode
         haml-mode
         sass-mode
         scss-mode
         nginx-mode
         pkgbuild-mode

         ;; minor modes
         dash
         s
         jedi
         helm
         rinari
         flycheck
         powerline
         yasnippet
         git-modes
         pony-mode
         ibuffer-vc
         projectile
         virtualenv
         golden-ratio
         hl-tags-mode
         ace-jump-mode
         auto-complete
         zencoding-mode
         exec-path-from-shell)
       (mapcar 'el-get-source-name el-get-sources)))

;;; install new packages and init already installed packages
(el-get 'sync my-packages)


(provide 'pkgs)
