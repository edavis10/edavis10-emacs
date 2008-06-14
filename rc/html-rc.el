;;;; HTML settings


(setq auto-mode-alist (cons '("\\.php$" . nxhtml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.phps$" . nxhtml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.php4$" . nxhtml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.php5$" . nxhtml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.php.inc$" . nxhtml-mode) auto-mode-alist))

;; Cake PHP templates
(setq auto-mode-alist (cons '("\\.thtml$" . nxhtml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.ctp$" . nxhtml-mode) auto-mode-alist))
