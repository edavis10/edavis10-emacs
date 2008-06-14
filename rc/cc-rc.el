;;;; CC-Mode rc file for C/C++/C# modes

;(use add to list so it is prepended and thus overrides any system level settings
(add-to-list 'load-path "~/.elisp/cc-mode")

; File is in the cc-mode folder, it must be in there....
(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
(setq auto-mode-alist
      (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))


;;; TODO: Is this what I like?
(lambda nil (c-set-style "bsd"))
