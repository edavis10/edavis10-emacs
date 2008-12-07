;;;; Text editing rc file

;; text mode as default
(setq default-major-mode 'text-mode)

;; uncompress before editing
(auto-compression-mode 1)

;; Always wordwrap
(setq truncate-partial-width-windows nil)

;; no autofills please
(setq auto-fill-mode 0)

;; Flyspell - Check my speling 
;; TODO: OFF
(setq-default flyspell-mode 1)

;; Highlight the regin btwn point and mark
(transient-mark-mode t)

;; Show matching ()'s
(show-paren-mode 1)

;; Another simple optimization - you'll almost always type parens, braces and square brackets pairwise so why not let Emacs do this for you? 
;; http://www.zafar.se/bkz/Articles/EmacsTips
(setq skeleton-pair t)
(local-set-key (kbd "[") 'skeleton-pair-insert-maybe)
(local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
(local-set-key (kbd "{") 'skeleton-pair-insert-maybe) 
(local-set-key (kbd "<") 'skeleton-pair-insert-maybe)

;; Another cool vi feature, pressing % when on a left or right parenthese will jump to the matching parenthese: 
;; http://www.zafar.se/bkz/Articles/EmacsTips
(local-set-key "%" 'match-paren)

(defun match-paren (arg)
  "Go to the matching parenthesis if on parenthesis otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

;; Time inserts
(defun insert-time ()
  "2007-09-03-20:54"
  (interactive)
  (insert (format-time-string "%Y-%m-%d-%R")))

;; ISO time
(defun insert-time-ISO ()
  "20070903"
  (interactive)
  (insert (format-time-string "%Y%m%d")))


;; Word counts
(defun word-count nil "Count words in buffer or region" (interactive)
  (shell-command-on-region (point) (mark) "wc -w"))

;; Tab completion
;; http://www.emacsblog.org/2007/03/12/tab-completion-everywhere/
(global-set-key [(tab)] 'smart-tab)
(defun smart-tab ()
  "This smart tab is minibuffer compliant: it acts as usual in
    the minibuffer. Else, if mark is active, indents region. Else if
    point is at the end of a symbol, expands it. Else indents the
    current line."
  (interactive)
  (if (minibufferp)
      (unless (minibuffer-complete)
        (dabbrev-expand nil))
    (if mark-active
        (indent-region (region-beginning)
                       (region-end))
      (if (looking-at "\\_>")
          (dabbrev-expand nil)
        (indent-for-tab-command)))))
