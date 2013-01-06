(deftheme monokai
  "almost monokai")

(let ((class '((class color) (min-colors 89))))
  (custom-theme-set-faces
   'monokai
   `(default ((,class (:background "#272821" :foreground "#F8F8F2"))))
   `(cursor ((,class (:background "#DAD085" :foreground "#656565"))))
   ;; Mode line faces
   `(mode-line ((,class (:box (:line-width -1 :style released-button)
                         :background "white" :foreground "black"))))
   ;; hl-line face
   `(hl-line ((,class (:background "#1A1A1A"))))
   ;;
   `(fringe ((,class (:background "#222"))))
   ;; region face
   `(region ((,class (:background "#6DC5F1"))))
   ;; Font lock faces
   `(font-lock-builtin-face ((,class (:foreground "#A6E22A"))))
   `(font-lock-comment-face ((,class (:italic t :foreground "#75715D"))))
   `(font-lock-constant-face ((,class (:foreground "#A6E22A"))))
   `(font-lock-function-name-face ((,class (:italic t :foreground "#F1266F"))))
   `(font-lock-keyword-face ((,class (:foreground "#66D9EF"))))
   `(font-lock-string-face ((,class (:foreground "#DFD874"))))
   `(font-lock-type-face ((,class (:foreground "#89BDFF"))))
   `(font-lock-variable-name-face ((,class (:foreground "#A6E22A"))))
   `(font-lock-warning-face ((,class (:foreground "#FD5FF1"))))

   `(flymake-errline ((,class (:foreground "#F1266F" :underline t))))
   `(flymake-warnline ((,class (:foreground "#FD5FF1" :underline t))))))

(provide-theme 'monokai)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; monokai-theme.el ends here
