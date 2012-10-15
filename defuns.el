;;; choose my own fonts
(defun frame-setting ()
  (set-frame-font "monofur 15")
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset
                      (font-spec :family "华文黑体" :size 13))))


(if (and (fboundp 'daemonp) (daemonp))
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (with-selected-frame frame
                  (frame-setting))))
  (frame-setting))


;;; full screen
(defun fullscreen ()
  "Full screen FTW"
  (interactive)
  (set-frame-parameter nil 'fullscreen
                       (if (frame-parameter nil 'fullscreen) nil 'fullboth)))


;;; ctags
(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command (format "%s -f %s/TAGS -e -R %s" path-to-ctags dir-name (directory-file-name dir-name))))


;;; C-a behaviour
(defun smart-line-beginning ()
  "Move point to the beginning of text on the current line; if that is already
the current position of point, then move it to the beginning of the line."
  (interactive)
  (let ((pt (point)))
    (back-to-indentation)
    (when (eq pt (point))
      (beginning-of-line))))


;;; Mac dictionary.app integration
;;; take from https://github.com/renard/dictionary-app/blob/master/dictionary-app.el
(defun dictionary-app-search (&optional term)
  "Search for TERM in OSX Dictionary.app.
If TERM is nil, try in order terms in the region, then
`word-at-point' finally read from minibuffer."
  (interactive)
  (let ((term
         (cond
          (term term)
          ((region-active-p) (buffer-substring-no-properties (mark) (point)))
          ((word-at-point) (substring-no-properties (word-at-point)))
          (t (read-from-minibuffer "Look up for: ")))))
    (when term
      (shell-command (format "open 'dict://%s'" (url-hexify-string term))))))

(provide 'defuns)
