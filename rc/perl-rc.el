;;;; Perl settings

;; perl rather than prolog from .pl files
(autoload 'perl-mode "perl-mode" "Major mode for editing Perl scripts." t)
(setq auto-mode-alist 
      (append (list (cons "\\.pl$" 'perl-mode)) auto-mode-alist))
