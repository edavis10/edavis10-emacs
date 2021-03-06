;; Hide the details from dired

(require 'dired-details)

(dired-details-install)

;;; Borrowed from: http://www.postulate.org/emacs.php
;; use a single buffer for dired mode
(require 'dired-single)
(defun my-dired-init ()
  "Bunch of stuff to run for dired,
either immediately or when it'sloaded."
  ;; add other stuff here
  (define-key dired-mode-map [return] 'joc-dired-single-buffer)
  (define-key dired-mode-map [mouse-1] 'joc-dired-single-buffer-mouse)
  (define-key dired-mode-map "^"
    (function
     (lambda nil (interactive) (joc-dired-single-buffer "..")))))

;; if dired's already loaded, then the keymap will be bound
(if (boundp 'dired-mode-map)
    ;; we're good to go; just add our bindings
    (my-dired-init)
  ;; it's not loaded yet, so add our bindings to the load-hook
  (add-hook 'dired-load-hook 'my-dired-init))
