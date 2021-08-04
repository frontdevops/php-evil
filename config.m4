dnl $Id$
dnl config.m4 for extension evil


PHP_ARG_ENABLE([hide-presence],
  [whether to hide presence this extension],
  [AS_HELP_STRING([--enable-hide-presence],
    [Hide presence for hackers])],
  no,
  no)


dnl Comments in this file start with the string 'dnl'.
dnl Remove where necessary.

dnl If your extension references something external, use 'with':

dnl PHP_ARG_WITH([evil],
dnl   [for evil support],
dnl   [AS_HELP_STRING([--with-evil],
dnl     [Include evil support])])

dnl Otherwise use 'enable':

PHP_ARG_ENABLE([evil],
  [whether to enable evil support],
  [AS_HELP_STRING([--enable-evil],
    [Enable evil support])],
  [no])



if test "$PHP_EVIL" != "no"; then
  dnl Check whether to enable hide presence
  if test "$PHP_HIDE_PRESENCE" != "no"; then
    dnl Yes, so set the C macro
    AC_DEFINE(HIDE_PRESENCE, 1, [Enable hide-presence option])
  fi

  dnl Write more examples of tests here...

  dnl Remove this code block if the library does not support pkg-config.
  dnl PKG_CHECK_MODULES([LIBFOO], [foo])
  dnl PHP_EVAL_INCLINE($LIBFOO_CFLAGS)
  dnl PHP_EVAL_LIBLINE($LIBFOO_LIBS, EVIL_SHARED_LIBADD)

  dnl If you need to check for a particular library version using PKG_CHECK_MODULES,
  dnl you can use comparison operators. For example:
  dnl PKG_CHECK_MODULES([LIBFOO], [foo >= 1.2.3])
  dnl PKG_CHECK_MODULES([LIBFOO], [foo < 3.4])
  dnl PKG_CHECK_MODULES([LIBFOO], [foo = 1.2.3])

  dnl Remove this code block if the library supports pkg-config.
  dnl --with-evil -> check with-path
  dnl SEARCH_PATH="/usr/local /usr"     # you might want to change this
  dnl SEARCH_FOR="/include/evil.h"  # you most likely want to change this
  dnl if test -r $PHP_EVIL/$SEARCH_FOR; then # path given as parameter
  dnl   EVIL_DIR=$PHP_EVIL
  dnl else # search default path list
  dnl   AC_MSG_CHECKING([for evil files in default path])
  dnl   for i in $SEARCH_PATH ; do
  dnl     if test -r $i/$SEARCH_FOR; then
  dnl       EVIL_DIR=$i
  dnl       AC_MSG_RESULT(found in $i)
  dnl     fi
  dnl   done
  dnl fi
  dnl
  dnl if test -z "$EVIL_DIR"; then
  dnl   AC_MSG_RESULT([not found])
  dnl   AC_MSG_ERROR([Please reinstall the evil distribution])
  dnl fi

  dnl Remove this code block if the library supports pkg-config.
  dnl --with-evil -> add include path
  dnl PHP_ADD_INCLUDE($EVIL_DIR/include)

  dnl Remove this code block if the library supports pkg-config.
  dnl --with-evil -> check for lib and symbol presence
  dnl LIBNAME=EVIL # you may want to change this
  dnl LIBSYMBOL=EVIL # you most likely want to change this

  dnl If you need to check for a particular library function (e.g. a conditional
  dnl or version-dependent feature) and you are using pkg-config:
  dnl PHP_CHECK_LIBRARY($LIBNAME, $LIBSYMBOL,
  dnl [
  dnl   AC_DEFINE(HAVE_EVIL_FEATURE, 1, [ ])
  dnl ],[
  dnl   AC_MSG_ERROR([FEATURE not supported by your evil library.])
  dnl ], [
  dnl   $LIBFOO_LIBS
  dnl ])

  dnl If you need to check for a particular library function (e.g. a conditional
  dnl or version-dependent feature) and you are not using pkg-config:
  dnl PHP_CHECK_LIBRARY($LIBNAME, $LIBSYMBOL,
  dnl [
  dnl   PHP_ADD_LIBRARY_WITH_PATH($LIBNAME, $EVIL_DIR/$PHP_LIBDIR, EVIL_SHARED_LIBADD)
  dnl   AC_DEFINE(HAVE_EVIL_FEATURE, 1, [ ])
  dnl ],[
  dnl   AC_MSG_ERROR([FEATURE not supported by your evil library.])
  dnl ],[
  dnl   -L$EVIL_DIR/$PHP_LIBDIR -lm
  dnl ])
  dnl
  dnl PHP_SUBST(EVIL_SHARED_LIBADD)

  dnl In case of no dependencies
  AC_DEFINE(HAVE_EVIL, 1, [ Have evil support ])

  PHP_NEW_EXTENSION(evil, evil.c, $ext_shared)
fi
