AC_INIT([Lispy-Key], [0.1])
AC_CONFIG_SRCDIR([source])
AC_CONFIG_AUX_DIR([build-aux])
AM_INIT_AUTOMAKE([foreign])

# Checks for a Lisp program.
AC_SUBST(LISP_PROGRAM)
AC_ARG_WITH(lisp,    [  --with-lisp=IMPL        use the specified lisp], LISP_PROGRAM=$withval, LISP_PROGRAM="sbcl")

AC_CHECK_PROG(LISP_CHECK,$LISP_PROGRAM,yes,no)
if test "$LISP_CHECK" = "no"; then
   AC_MSG_ERROR([*** No lisp is available.])
fi

AC_MSG_NOTICE([Using $LISP at $LISP_PROGRAM])

# Check for makeinfo
AC_CHECK_PROG(MAKEINFO,makeinfo,yes,no)

if test "$MAKEINFO" = "no"; then
   AC_MSG_WARN([You do not seem to have makeinfo, so you will not be able
to build the manuals. Please install makeinfo for the manual.])
   elif test "$MAKEINFO" = "yes"; then
   MAKEINFO=makeinfo
fi

AC_SUBST([MAKEINFO])

AC_CONFIG_FILES([Makefile])
AC_OUTPUT
