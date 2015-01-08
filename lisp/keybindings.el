;;; keybindings.el --- Not just M-x

;;; Commentary:

;;; Code:

;;; quit emacs
(global-set-key (kbd "C-x C-k") 'save-buffers-kill-emacs)


;;; string-edit
(global-set-key (kbd "C-c i") 'string-edit-at-point)


;;; defun
(global-set-key (kbd "C-a") 'smart-line-beginning)
(global-set-key (kbd "M-<RET>") 'open-line-then-newline-and-indent)


(provide 'keybindings)
;;; keybindings.el ends here
