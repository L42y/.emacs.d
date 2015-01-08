;;; keybindings.el --- Not just M-x

;;; Commentary:

;;; Code:

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
