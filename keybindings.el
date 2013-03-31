;;; ag
(global-set-key (kbd "<f5>") 'ag-project-at-point)


;;; comment
(global-set-key (kbd "C-'") 'comment-dwim)
(global-set-key (kbd "C-c g") 'comment-or-uncomment-region)


;;; helm
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-c h") 'helm-projectile)
(global-set-key (kbd "C-x C-y") 'helm-show-kill-ring)


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


;;; C-a
(global-set-key (kbd "C-a") 'smart-line-beginning)


(provide 'keybindings)
