;;; comment
(global-set-key (kbd "C-'") 'comment-dwim)
(global-set-key (kbd "C-c g") 'comment-or-uncomment-region)


;;; smart-forward
(global-set-key (kbd "M-<up>") 'smart-up)
(global-set-key (kbd "M-<down>") 'smart-down)
(global-set-key (kbd "M-<left>") 'smart-backward)
(global-set-key (kbd "M-<right>") 'smart-forward)
(global-set-key (kbd "C-M-p") 'smart-up)
(global-set-key (kbd "C-M-n") 'smart-down)
(global-set-key (kbd "C-M-b") 'smart-backward)
(global-set-key (kbd "C-M-f") 'smart-forward)


;;; helm
(global-set-key (kbd "C-x C-a") 'helm-ack)
(global-set-key (kbd "C-x C-y") 'helm-show-kill-ring)


;;; quit emacs
(global-set-key (kbd "C-x C-k") 'save-buffers-kill-emacs)


;;; full screen
(global-set-key [f11] 'fullscreen)


;;; C-a
(global-set-key (kbd "C-a") 'smart-line-beginning)


;;; dictionary search
(global-set-key (kbd "C-M-g") '(lambda () (interactive) (dictionary-app-search (current-word))))


;;; disable keys
(global-unset-key (kbd "<pause>"))


(provide 'keybindings)
