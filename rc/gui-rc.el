;;;; GUI rc file for setting pretty things

;; Highlight the current line
(global-hl-line-mode 1)

;; Kill the extra GUI crap
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Bye bye startup message
(setq inhibit-startup-message t)

;; Show line number of cursor
(setq line-number-mode t)

;; Show column number of cursor
(setq column-number-mode t)

;; paste where the cursor is, not mouse
(setq mouse-yank-at-point t)

(setq visible-bell t)

(set-background-color "Black")
(set-foreground-color "LightGray")
(set-border-color "DarkGray")
(set-mouse-color "DarkSlateBlue")
(set-face-background 'default "Black")
(set-face-foreground 'default "LightGray")
(set-face-background 'modeline "DarkSlateBlue")
;; Current line highlight
(set-face-background 'hl-line "#222") 


;; format the title-bar to always include the buffer name
(setq frame-title-format (list "" "emacs" "@" (getenv "HOST") " : %f" ))
