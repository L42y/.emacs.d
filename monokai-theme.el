;;; monokai-theme.el --- Homemade monokai theme

;;; Commentary:

;;; Code:

(deftheme monokai
  "almost monokai")

(let ((class '((class color) (min-colors 89))))
  (custom-theme-set-faces
   'monokai
   `(default ((,class (:background "#272822" :foreground "#F8F8F0"))))
   `(cursor ((,class (:background "#E6DB74" :foreground "#656565"))))
   ;; Mode line faces
   `(mode-line ((,class (:box nil
                         :background "#E6DB74" :foreground "#656565"))))
   `(mode-line-inactive ((,class (:box nil))))
   ;; hl-line face
   `(hl-line ((,class (:background "#1A1A1A"))))
   ;;
   `(fringe ((,class (:background "#222"))))
   `(vertical-border ((,class (:foreground "#272821"))))
   ;; region face
   `(region ((,class (:background "#49483E"))))
   ;; Font lock faces
   `(font-lock-builtin-face ((,class (:foreground "#A6E22E"))))
   `(font-lock-comment-face ((,class (:italic t :foreground "#75715E"))))
   `(font-lock-comment-delimiter-face ((,class (:italic nil :bold t))))
   `(font-lock-constant-face ((,class (:foreground "#FD971F"))))
   `(font-lock-function-name-face ((,class (:italic t :foreground "#66D9EF"))))
   `(font-lock-keyword-face ((,class (:foreground "#F92672"))))
   `(font-lock-string-face ((,class (:foreground "#E6DB74"))))
   `(font-lock-type-face ((,class (:foreground "#66D9EF"))))
   `(font-lock-variable-name-face ((,class (:foreground "#A6E22E"))))
   `(font-lock-warning-face ((,class (:foreground "#AE81FF"))))))

(provide-theme 'monokai)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; monokai-theme.el ends here
