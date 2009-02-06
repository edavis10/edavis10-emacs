(defun host-acheron-settings ()
  "These are setting specific to acheron, my desktop"
  (set-default-font "Bitstream Vera Sans Mono-14")
  (add-to-list 'default-frame-alist '(font . "Bitstream Vera Sans Mono-12"))
  (print "acheron settings applied"))

(defun host-aether-settings ()
  "These are setting specific to aether, my laptop"
  (set-default-font "Bitstream Vera Sans Mono-8")
  (add-to-list 'default-frame-alist '(font . "Bitstream Vera Sans Mono-8"))
  (print "aether settings applied"))

(defun host-neon-settings ()
  "These are setting specific to neon, my netbook"
  (set-default-font "Bitstream Vera Sans Mono-10")
  (add-to-list 'default-frame-alist '(font . "Bitstream Vera Sans Mono-10"))
  (print "neon settings applied"))

(cond 
 ((equal system-name "acheron.home.theadmin.org")
  (host-acheron-settings))
 ((equal system-name "aether.home.theadmin.org")
  (host-aether-settings))
 ((equal system-name "neon.home.theadmin.org")
  (host-neon-settings))
 (t (print system-name)))
