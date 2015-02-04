(setq ac-comphist-file (expand-file-name "ac-comphist" savefile-path))


(setq desktop-path (list savefile-path))
(setq desktop-base-file-name "desktop")
(setq desktop-base-lock-name "desktop.lock")


(setq ido-save-directory-list-file (expand-file-name "ido" savefile-path))


(setq mc/list-file (expand-file-name "mc-lists.el" savefile-path))


(setq projectile-known-projects-file
      (expand-file-name "projectile-projects" savefile-path))


(setq recentf-save-file (expand-file-name "recentf" savefile-path))


(setq save-place-file (expand-file-name "places" savefile-path))


(setq smex-save-file (expand-file-name "smex" savefile-path))


(setq tramp-persistency-file-name (expand-file-name "tramp" savefile-path))


(provide 'savefile)
