;; Markdown mode
(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)
(setq auto-mode-alist (cons '("\\.mdwn$" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.page$" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.eml$" . markdown-mode) auto-mode-alist))

