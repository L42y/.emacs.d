;;; ag
(global-set-key (kbd "<f5>") 'ag-project-at-point)


;;; comment
(global-set-key (kbd "C-'") 'comment-dwim)
(global-set-key (kbd "C-c g") 'comment-or-uncomment-region)


;;; helm
(global-set-key (kbd "C-c h") 'helm-projectile)
(global-set-key (kbd "C-x C-y") 'helm-show-kill-ring)


;;; ace-jump
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)


;;; ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)


;;; quit emacs
(global-set-key (kbd "C-x C-k") 'save-buffers-kill-emacs)


;;; C-a
(global-set-key (kbd "C-a") 'smart-line-beginning)


(provide 'keybindings)
