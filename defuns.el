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


(provide 'defuns)
;;; defuns.el ends here
