/* evil extension for PHP */

#ifndef PHP_EVIL_H
# define PHP_EVIL_H

extern zend_module_entry evil_module_entry;
# define phpext_evil_ptr &evil_module_entry

# define PHP_EVIL_VERSION "0.1.0"

# if defined(ZTS) && defined(COMPILE_DL_EVIL)
ZEND_TSRMLS_CACHE_EXTERN()
# endif


#ifdef HIDE_PRESENCE
# define PHP_EVIL_MSG "syntax error, unexpected token, expecting end of file"
#else
# define PHP_EVIL_MSG "[eval] is not a function"
#endif

void evil_execute_ex(zend_execute_data *execute_data);

#endif	/* PHP_EVIL_H */
