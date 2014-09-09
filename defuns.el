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


;;; open-line-then-newline-and-indent
(defun open-line-then-newline-and-indent ()
  "Combination of `open-line' and `newline-and-indent'."
  (interactive)
  (open-line 1)
  (newline-and-indent))


(provide 'defuns)
;;; defuns.el ends here
