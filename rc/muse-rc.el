;;;; Muse rc file for the Muse wiki

(setq load-path (append load-path (list "~/.elisp/muse/lisp")))

(setq auto-mode-alist (cons '("mdwn$" . text-mode) auto-mode-alist))