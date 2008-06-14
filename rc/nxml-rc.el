;;;; nXML rc file for XML modes and XHTML

(load "~/.elisp/nxml/autostart.el")

;; do not turn on rng-validate-mode automatically, I don't like
;; the anoying red underlines
(setq rng-nxml-auto-validate-flag nil)

;; only special background in submode
(setq mumamo-chunk-coloring 'submode-colored)

(setq nxhtml-skip-welcome t)

;; CSS
(let ((load-path (cons "~/.elisp/"
                       load-path)))
  (require 'css-mode))

(setq auto-mode-alist (cons '("\\.html$" . nxhtml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.htm$" . nxhtml-mode) auto-mode-alist))

