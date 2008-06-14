;;;; Emacs Code Browser
(add-to-list 'load-path "~/.elisp/ecb-2.32")

;; If this worked, we would not have to rely on the customize
;(setq ecb-options-version "2.32")

;; Dont want graphics
(setq ecb-tree-buffer-style (quote ascii-guides))
(setq ecb-tree-indent 1)

;; Decent layout
;; -------------------------------------------------------
;; |  Directories |                                      |
;; |--------------|                                      |
;; |  Sources     |                 Edit                 |
;; |--------------|                                      |
;; |  Methods     |                                      |
;; -------------------------------------------------------
;; |                    Compilation                      |
;; -------------------------------------------------------
;; -- http://ecb.sourceforge.net/docs/Changing-the-ECB-layout.html
(setq ecb-layout-name "left3")

;; Wait x seconds before doing background stuff (e.g. parse dirs, check vc for *SOURCE*)
(setq ecb-stealthy-tasks-delay 3)

;; Sources, load from a non-byte file for ease of use
(load "~/.emacs-projects")

(require 'ecb-autoloads)
