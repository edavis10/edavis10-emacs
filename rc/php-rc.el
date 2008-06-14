;;;; PHP settings

(setq auto-mode-alist (cons '("\\.php$" . nxhtml-php-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.phps$" . nxhtml-php-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.php4$" . nxhtml-php-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.php5$" . nxhtml-php-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.php.inc$" . nxhtml-php-mode) auto-mode-alist))

;; Cake PHP templates
(setq auto-mode-alist (cons '("\\.thtml$" . nxhtml-php-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.ctp$" . nxhtml-php-mode) auto-mode-alist))

(defun nxhtml-php-mode ()
  (nxhtml-mode)
  ;; I don't use cua-mode, but nxhtml always complains. So, OK, let's
  ;; define this dummy variable
  (make-local-variable 'cua-inhibit-cua-keys)
  (mumamo-mode)
  (setq indent-tabs-mode nil))