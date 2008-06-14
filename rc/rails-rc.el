;;;; Rails rc file for the Ruby on Rails framework

(setq load-path (append load-path (list "~/.elisp/emacs-rails")))
(require 'rails)

(add-to-list 'auto-mode-alist '("\\.rhtml$" . kid-rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.html.erb$" . kid-rhtml-mode))
  
;; From http://pluskid.lifegoo.com/?p=59
(defun kid-rhtml-mode ()
  (nxhtml-mode)
  ;; I don't use cua-mode, but nxhtml always complains. So, OK, let's
  ;; define this dummy variable
  (make-local-variable 'cua-inhibit-cua-keys)
  (setq mumamo-current-chunk-family '("eRuby nXhtml Family" nxhtml-mode
                                      (mumamo-chunk-eruby
                                       mumamo-chunk-inlined-style
                                       mumamo-chunk-inlined-script
                                       mumamo-chunk-style=
                                       mumamo-chunk-onjs=)))
  (mumamo-mode)
  (rails-minor-mode t)
  (setq indent-tabs-mode nil))
