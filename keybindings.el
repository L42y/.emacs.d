;;; comment
(global-set-key (kbd "C-'") 'comment-dwim)
(global-set-key (kbd "C-c g") 'comment-or-uncomment-region)


;;; quit emacs
(global-set-key (kbd "C-x C-k") 'save-buffers-kill-emacs)


;;; disable keys
(global-unset-key (kbd "<pause>"))


(provide 'keybindings)
