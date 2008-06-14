;;;; Generic development settings

;; Indent with spaces
(setq-default indent-tabs-mode nil)

;; Syntax highlight please
(global-font-lock-mode t)

;; Spel check comments
(setq-default flyspell-prog-mode t)

;; Magic Function to chmod +x anyfile that starts with a hashbang
;; http://rubygarden.org/ruby?InstallingEmacsExtensions
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)


;;;; Other CHANGELOG names
(setq auto-mode-alist (cons '("CHANGES.txt$" . change-log-mode-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("CHANGES$" . change-log-mode-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("CHANGELOG.txt$" . change-log-mode-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("CHANGELOG$" . change-log-mode-mode) auto-mode-alist))


;;; Keybinding
(global-set-key (kbd "C-c C-3") 'comment-region)
(global-set-key (kbd "C-c C-4") 'uncomment-region) 

;;; mmm mode
;;(setq load-path (append load-path (list "~/.elisp/mmm-mode")))
;;(require 'mmm-mode)