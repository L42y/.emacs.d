;;; keybindings.el --- Not just M-x

;;; Commentary:

;;; Code:

;;; comment
(global-set-key (kbd "C-'") 'comment-dwim)
(global-set-key (kbd "C-c g") 'comment-or-uncomment-region)


;;; helm
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-c h") 'helm-projectile)
(global-set-key (kbd "C-x C-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-c o f") 'helm-open-github-from-file)
(global-set-key (kbd "C-c o c") 'helm-open-github-from-commit)
(global-set-key (kbd "C-c o i") 'helm-open-github-from-issues)
(global-set-key (kbd "C-c o p") 'helm-open-github-from-pull-requests)


;;; magit
(global-set-key (kbd "C-x C-z") 'magit-status)


;;; ace-jump
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)


;;; ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)


;;; quit emacs
(global-set-key (kbd "C-x C-k") 'save-buffers-kill-emacs)


;;; org-mode
(global-set-key (kbd "C-c a") 'org-agenda)


;;; smex
(global-set-key (kbd "C-x <RET>") 'smex)


;;; expand-region
(global-set-key (kbd "C-=") 'er/expand-region)


;;; multiple-cursors
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)


;;; string-edit
(global-set-key (kbd "C-c i") 'string-edit-at-point)


;;; defun
(global-set-key (kbd "C-a") 'smart-line-beginning)
(global-set-key (kbd "M-<RET>") 'open-line-then-newline-and-indent)


(provide 'keybindings)
;;; keybindings.el ends here
