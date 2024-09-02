LISP_PROG := @LISP_PROGRAM@
LISP_FLAGS := --no-userinit --non-interactive

makefile_dir := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

lisp_eval := $(LISP_PROG) $(LISP_FLAGS) \
             --eval '(require "asdf")' \
             --eval '(asdf:load-asd "$(makefile_dir)/lispy-key.asd")' \
             --eval

lisp_quit := --eval '(uiop:quit)'

lispy_key_files := lispy-key.asd $(shell find . -type f -name '*.lisp')

.PHONY: build
build: $(lispy_key_files)
	$(lisp_eval) '(asdf:compile-system :lispy-key)'

executable: $(lispy_key_files)
	$(lisp_eval) '(asdf:operate :build-op :lispy-key)'

lispy_key_tests := lispy-key.asd $(shell find ./tests/ -type f -name '*.lisp')
.PHONY: check
check: $(lispy_key_files) $(lispy_key_tests)
	$(lisp_eval) '(asdf:test-system :lispy-key)'

include doc/local.mk
