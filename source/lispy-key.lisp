(defpackage lispy-key
  (:use :cl :log4cl)
  (:export #:hello))

(in-package :lispy-key)

(defun example ()
  "An example."
  (log:trace "Doing something."))

(defun hello ()
  (log:config :trace)
  (progn
    (let ((msg (format 'nil "Hello to Lispy-Key!")))
      (log:info msg)
      (when (log:debug)
        (log:debug "This is a fancy remapper!")))
    (example)))
