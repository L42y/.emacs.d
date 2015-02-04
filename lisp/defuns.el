;;; defuns.el --- Homemade defuns

;;; Commentary:

;;; Code:

;;; C-a behaviour
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


;;; open-line-then-newline-and-indent
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


(provide 'defuns)
;;; defuns.el ends here
