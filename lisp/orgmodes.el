(use-package org
  :config (progn
            (add-hook 'org-mode-hook
                      (lambda ()
                        (toggle-truncate-lines)))
            (use-package ob
              :config (progn
                        (setq org-src-fontify-natively t)
                        (org-babel-do-load-languages
                         'org-babel-load-languages
                         '((sh . t)
                           (js . t)
                           (org . t)
                           (python . t)
                           (emacs-lisp . t)))))
            (use-package ox-md
              :config (progn
                        (setq org-md-headline-style 'atx)
                        (use-package ox-gfm
                          :ensure t)))
            (use-package ox-html
              :config (progn
                        (setq org-html-doctype "html5"
                              org-html-html5-fancy t
                              org-html-metadata-timestamp-format "%Y-%m-%d %H:%M")))
            (use-package org-crypt)
            (use-package org-agenda
              :bind ("C-c a" . org-agenda))
            (use-package org-crypt
              :config (progn
                        (org-crypt-use-before-save-magic)
                        (setq org-crypt-key "i@l42y.com"
                              org-tags-exclude-from-inheritance (quote ("crypt")))))))


(use-package ox-publish
  :config (progn
            (use-package htmlize
              :ensure t)
            (setq org-publish-project-alist
                  '(("L42y"
                     :components ("L42y-content" "L42y-static" "L42y-rss"))
                    ("L42y-content"
                     :base-directory "~/Dropbox/Emacs/Org/L42y.org/"
                     :base-extension "org"
                     :html-extension "html"
                     :publishing-directory "~/Projects/L42y.org/"
                     :publishing-function (org-html-publish-to-html)
                     :with-toc nil
                     :recursive t
                     :html-preamble nil
                     :html-postamble nil
                     :section-numbers nil
                     :preserve-breaks t
                     :html-head-extra
                     "<link rel=\"stylesheet\" href=\"/_/css/main.css\">"
                     :htmlized-source t
                     :html-head-include-scripts nil
                     :html-head-include-default-style nil)
                    ("L42y-static"
                     :base-directory "~/Dropbox/Emacs/Org/L42y.org/_/"
                     :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf"
                     :publishing-directory "~/Projects/L42y.org/_/"
                     :recursive t
                     :publishing-function (org-publish-attachment))
                    ("L42y-rss"
                     :base-directory "~/Dropbox/Emacs/Org/L42y.org/"
                     :base-extension "org"
                     :publishing-function (org-rss-publish-to-rss)
                     :publishing-directory "~/Projects/L42y.org/"
                     :exclude ".*"
                     :include ("writing.org")
                     :with-toc nil
                     :html-link-home "https://l42y.com/"
                     :html-link-use-abs-url t)))))


(provide 'orgmodes)
