;;; comment
(global-set-key (kbd "C-'") 'comment-dwim)
(global-set-key (kbd "C-c g") 'comment-or-uncomment-region)


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
