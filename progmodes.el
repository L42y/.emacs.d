;;; auto-complte
(require 'auto-complete-config)
(ac-config-default)

(dolist (hook '(sass-mode-hook
                scss-mode-hook
                haml-mode-hook))
  (add-hook hook (lambda () (auto-complete-mode 1))))

(define-key ac-completing-map (kbd "C-n") 'ac-next)
(define-key ac-completing-map (kbd "C-p") 'ac-previous)
(define-key ac-complete-mode-map "\r" nil)


;;; electric
(electric-pair-mode t)
(electric-indent-mode t)
(electric-layout-mode t)


;;; python
(setq python-python-command "python2")


;;; javascript
(setq js2-basic-offset 2)


;;; jinja2
(add-to-list 'auto-mode-alist '("\\.jinja\\'" . jinja2-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . jinja2-mode))


;; hl-tags-mode
(require 'hl-tags-mode)
(add-hook 'sgml-mode-hook (lambda () (hl-tags-mode 1)))
(add-hook 'nxml-mode-hook (lambda () (hl-tags-mode 1)))


;;; zencoding
(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode)


;;; haml
(require 'haml-mode)
(add-to-list 'auto-mode-alist '("\\.haml\\'" . haml-mode))
(add-hook 'haml-mode-hook '(lambda ()
                             (add-hook 'before-save-hook
                                       (lambda ()
                                         (untabify (point-min) (point-max))))))


;; scss
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
(setq scss-compile-at-save nil)


;;; auto insert
(require 'autoinsert)
(auto-insert-mode)
(setq auto-insert-directory "~/.emacs.d/templates/")
(setq auto-insert-query nil)
(define-auto-insert "\.py" "python.py")

(provide 'progmodes)
