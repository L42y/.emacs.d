;;; pkgs.el --- Emacs built-in package manager

;;; Commentary:

;;; Code:

;;; builtin package
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)


(provide 'pkgs)
;;; pkgs.el ends here
