;;;; Conditional load other RunControl (rc) files depending on settings ;;;;

;;;; Basic Emacs ;;;;

(load "~/.elisp/rc/basic-rc")

(load "~/.elisp/rc/gui-rc")

(load "~/.elisp/rc/text-rc")

(load "~/.elisp/rc/shell-rc")

;;;; Work environment ;;;;

;;; Muse
(load "~/.elisp/rc/muse-rc")

;;; Planner
(load "~/.elisp/rc/planner-rc")

;;; Printing
(load "~/.elisp/rc/printing-rc")

;;; Version Control
(load "~/.elisp/rc/vc-rc")

;;; emacs-server
(load "~/.elisp/rc/emacs-server-rc")

;;; TRAMP
(load "~/.elisp/rc/tramp-rc")

;;; Dired / Files
(load "~/.elisp/rc/dired-rc")

;;;; Development Section ;;;;

;;; Generic development
(load "~/.elisp/rc/development-rc")

;;; cedit (needed for ecb)
(load "~/.elisp/rc/cedet-rc")

;;; EMacs code browser
(load "~/.elisp/rc/ecb-rc")

;;; nXML / nXHTML
(load "~/.elisp/rc/nxml-rc")

;;; PHP
(load "~/.elisp/rc/php-rc")

;;; Ruby
(load "~/.elisp/rc/ruby-rc")

;;; Rails (requires Ruby and nXML)
(load "~/.elisp/rc/rails-rc")

;;; (s/p/P/)(s/erl/erl)
(load "~/.elisp/rc/perl-rc")

;;; CC-mode (with C#)
(load "~/.elisp/rc/cc-rc")

;;; Markdown, somehow it doesn't work is loaded eariler.  load-path issue?
(load "~/.elisp/rc/markdown-rc")

;;; Textmate
(add-to-list 'load-path "~/.elisp/textmate.el/textmate.el")
(require 'textmate)
(textmate-mode)

;;; yasnippet
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/.elisp/yasnippet-0.5.7/snippets/")

;;;; Custom 
;;; Load anything for custom-set-varables in one place.
;;;  These should be setq's but some don't work as advertised
(load "~/.elisp/rc/custom-rc")

;;;; Host specific variables
(load "~/.elisp/rc/host-rc")
