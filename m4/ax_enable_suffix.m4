AC_DEFUN([AX_ENABLE_SUFFIX],
[AC_ARG_ENABLE([suffix],[AS_HELP_STRING([--enable-suffix],
                                        [Use/set the installation command suffix])],
               [true],[enable_suffix=no])
if test X$enable_suffix = Xyes; then
  install_suffix='-dev'
elif test X$enable_suffix = Xno; then
  install_suffix=''
else
  install_suffix="$enable_suffix"
fi
AC_SUBST([install_suffix])

dnl suffix without leading '-' for libraries
library_install_suffix=''
if test -n "$install_suffix"; then
library_install_suffix=$(echo $install_suffix | sed 's,^\-,,g')
fi
AC_SUBST([library_install_suffix])

dnl used by libtool based libraries
LIBRARY_RELEASE_SUFFIX=''
if test -n "$library_install_suffix"; then
LIBRARY_RELEASE_SUFFIX='-release $library_install_suffix'
fi
AC_SUBST([LIBRARY_RELEASE_SUFFIX])

])# AX_ENABLE_SUFFIX
