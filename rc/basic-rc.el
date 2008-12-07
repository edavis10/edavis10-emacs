;;;; Basic emacs settings

; Any small files just chillin in here
(setq load-path (append load-path (list "~/.elisp")))

;; Pick a good simple default font (hosts may override this setting)
(set-default-font "Bitstream Vera Sans Mono-12")

;; the center of the screen, but this can make the scrolling confusing
(setq scroll-step 1)

;; default "history" length is just 32, apparently! Jeez.
(setq comint-input-ring-size 2000)

;; Re-read a buffer from disk
(global-set-key (kbd "<f5>") 'revert-buffer)

;; Used IDO mode "interactively do"
(require 'ido)
(ido-mode t)

;;Many times you'll kill a line with the intention of pasting it back a couple of lines up/below. Here's an idea stolen from Textmate, using meta+up and meta+down to move complete lines up or down: 
;; http://www.zafar.se/bkz/Articles/EmacsTips
(local-set-key [(meta up)] 'move-line-up)
(local-set-key [(meta down)] 'move-line-down)

(defun move-line (&optional n)
  "Move current line N (1) lines up/down leaving point in place."
  (interactive "p")
  (when (null n) 
    (setq n 1)) 
  (let ((col (current-column)))
    (beginning-of-line)
    (next-line 1)
    (transpose-lines n)
    (previous-line 1)
    (forward-char col))) 

(defun move-line-up (n)
  "Moves current line N (1) lines up leaving point in place."
  (interactive "p")
  (move-line (if (null n) -1 (- n))))

(defun move-line-down (n)
  "Moves current line N (1) lines down leaving point in place."
  (interactive "p")
  (move-line (if (null n) 1 n)))

(global-set-key [(control tab)] 'find-tag)
