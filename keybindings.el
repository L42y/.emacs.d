;;; comment
(global-set-key (kbd "C-'") 'comment-dwim)
(global-set-key (kbd "C-c g") 'comment-or-uncomment-region)


;;; helm
(global-set-key (kbd "C-c h") 'helm-projectile)
(global-set-key (kbd "C-x C-y") 'helm-show-kill-ring)


;;; ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)


;;; quit emacs
(global-set-key (kbd "C-x C-k") 'save-buffers-kill-emacs)


;;; C-a
(global-set-key (kbd "C-a") 'smart-line-beginning)


(provide 'keybindings)
