(defun smart-line-beginning ()
  "Move point to the beginning of text on the current line.
if that is already the current position of point,
then move it to the beginning of the line."
  (interactive)
  (let ((pt (point)))
    (back-to-indentation)
    (when (eq pt (point))
      (beginning-of-line))))

(global-set-key (kbd "C-a") 'smart-line-beginning)


(defun open-line-then-newline-and-indent ()
  "Combination of `open-line' and `newline-and-indent'."
  (interactive)
  (newline-and-indent)
  (newline-and-indent)
  (forward-line -1)
  (indent-according-to-mode))

(global-set-key (kbd "M-<RET>") 'open-line-then-newline-and-indent)


(defmacro rename-modeline (package-name mode new-name)
  `(eval-after-load ,package-name
     '(defadvice ,mode (after rename-modeline activate)
        (setq mode-name ,new-name))))

(rename-modeline "js2-mode" js2-mode "JS2")


(defun relay-activation-fn (filename &optional _)
  (let* ((projectile-root (ignore-errors (projectile-project-root)))
         (relay-config-json-path
          (expand-file-name "relay.config.json" projectile-root))
         (relay-config-js-path
          (expand-file-name "relay.config.js" projectile-root)))
    (or (file-exists-p relay-config-json-path)
        (file-exists-p relay-config-js-path))))
(defun relay-lsp-server-start ()
  (let* ((projectile-root (ignore-errors (projectile-project-root)))
         (default-directory (or projectile-root default-directory)))
    (list "npx" "relay-compiler" "lsp")))


(provide 'defuns)
