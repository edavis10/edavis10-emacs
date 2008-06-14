;;;; Setting for the emacs client/server

;; Finish editing on a client
(global-set-key (kbd "C-c x") 'server-edit) 

(add-hook 'server-switch-hook
          (lambda nil
            (let ((server-buf (current-buffer)))
              (bury-buffer)
              (switch-to-buffer-other-frame server-buf))))

(add-hook 'server-done-hook 'delete-frame)
(server-start)
