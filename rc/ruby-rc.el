;;;; Ruby rc file for the Ruby programming language

;;; Debian Etch packages
(setq load-path (append load-path (list "~/.elisp/ruby1.8-elisp")))

(require 'ruby-mode)


(defun ruby-indent-command ()
  (interactive)
  (ruby-indent-line t))
;;; ri

(setq ri-ruby-script "~/.elisp/ri-emacs.rb")
(autoload 'ri "~/.elisp/ri-ruby.el" nil t)

;; ;; Rake
(setq auto-mode-alist (cons '("Rakefile$" . ruby-mode) auto-mode-alist))

;; ;; Cap
(setq auto-mode-alist (cons '("Capfile$" . ruby-mode) auto-mode-alist))

(require 'ruby-electric)
(ruby-electric-mode t)
