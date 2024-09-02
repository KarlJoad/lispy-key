(defpackage :lispy-key/tests
  (:use :cl :lisp-unit2))

(in-package :lispy-key/tests)

(define-test example ()
  (assert-eql 1 (- 2 1)))
