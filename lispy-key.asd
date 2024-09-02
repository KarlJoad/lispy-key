(defsystem :lispy-key
  :author "Karl Hallsby <karl@hallsby.com>"
  :description "Simulating HardWare and Time Traveling"
  :pathname #p"source/"
  :components ((:file "lispy-key"))
  :depends-on (:log4cl)
  :build-operation "asdf:program-op"
  ;; NOTE: build-pathname is relative to the :pathname of this system!
  :build-pathname #+linux "../bin/lispy-key"
  :entry-point "lispy-key:hello"
  :in-order-to ((test-op (test-op "lispy-key/tests"))))

;; I wonder if this could be useful for building executables?
;; (asdf:system-relative-pathname :lispy-key "lispy-key")

(defsystem :lispy-key/tests
  :depends-on (:lispy-key :alexandria :lisp-unit2)
  :pathname #p"tests/"
  :components ((:file "example")))

(defmethod asdf:perform ((o asdf:test-op) (c (eql (find-system :lispy-key/tests))))
  ;; Binding `*package*' to package-under-test makes for more reproducible tests.
  (let ((*package* (find-package :lispy-key/tests)))
    (uiop:symbol-call
     :lisp-unit2 :run-tests
     :package *package*
     :name :lispy-key
     :run-contexts (find-symbol "WITH-SUMMARY-CONTEXT" :lisp-unit2))))
