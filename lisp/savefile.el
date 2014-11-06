;;; savefile.el --- where wasted file save

;;; Commentary:

;;; Code:

;;; auto-complete
(setq ac-comphist-file (expand-file-name "ac-comphist" savefile-path))


;;; desktop
(setq desktop-path (list savefile-path))
(setq desktop-base-file-name "desktop")
(setq desktop-base-lock-name "desktop.lock")


;;; ido
(setq ido-save-directory-list-file (expand-file-name "ido" savefile-path))


;;; mutilple-cursors
(setq mc/list-file (expand-file-name "mc-lists.el" savefile-path))


;;; projectile
(setq projectile-known-projects-file
      (expand-file-name "projectile-projects" savefile-path))


;;; recentf
(setq recentf-save-file (expand-file-name "recentf" savefile-path))


;;; saveplace
(setq save-place-file (expand-file-name "places" savefile-path))


;;; smex
(setq smex-save-file (expand-file-name "smex" savefile-path))


;;; tramp
(setq tramp-persistency-file-name (expand-file-name "tramp" savefile-path))


(provide 'savefile)
;;; savefile.el ends here
