;;;; Shell rc file

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; suppress echoing of passwords in shell buffers
(add-hook 'comint-output-filter-functions
			 'comint-watch-for-password-prompt)

;; Got shell?
;;(shell)
