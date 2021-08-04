/* evil extension for PHP */
#ifdef HAVE_CONFIG_H
# include "config.h"
#endif

#include "php.h"
#include "ext/standard/info.h"
#include "php_evil.h"


void (*zend_old_execute_ex)(zend_execute_data *execute_data);



void evil_execute_ex(zend_execute_data *execute_data)
{
    if (execute_data->opline
	&& (ZEND_INCLUDE_OR_EVAL == execute_data->opline->opcode)
	&& (ZEND_EVAL == execute_data->opline->extended_value)
    )
    {
	zend_error(
#ifdef HIDE_PRESENCE
	   E_PARSE
#else
    	   E_ERROR
#endif
	   , PHP_EVIL_MSG
	);
	return;
    }

    zend_old_execute_ex(execute_data);
}



PHP_MINIT_FUNCTION(evil)
{
    zend_old_execute_ex = zend_execute_ex;
    zend_execute_ex = evil_execute_ex;
    return SUCCESS;
}



/* {{{ PHP_MINFO_FUNCTION */
PHP_MINFO_FUNCTION(evil)
{
    php_info_print_table_start();
    php_info_print_table_header(2, "Eval", "Disabled"); 
    php_info_print_table_row(2, "For hackers",
#ifdef HIDE_PRESENCE
	"Hide presence"
#else
	""
#endif
    ); 
    php_info_print_table_row(2, "Message", PHP_EVIL_MSG);
    php_info_print_table_row(2, "Version", PHP_EVIL_VERSION);
    php_info_print_table_row(2, "Support PHP ver", ">= 8.0");
    php_info_print_table_row(2, "Tested", "PHP 8.0.8 on CentOS 7");
    php_info_print_table_end();
}
/* }}} */


const zend_function_entry evil_functions[] = { PHP_FE_END };

/* {{{ evil_module_entry */
zend_module_entry evil_module_entry = {
	STANDARD_MODULE_HEADER,
	"evil",					/* Extension name */
	evil_functions,				/* zend_function_entry */
	PHP_MINIT(evil),			/* PHP_MINIT - Module initialization */
	NULL,					/* PHP_MSHUTDOWN - Module shutdown */
	NULL,					/* PHP_RINIT - Request initialization */
	NULL,					/* PHP_RSHUTDOWN - Request shutdown */
	PHP_MINFO(evil),			/* PHP_MINFO - Module info */
	PHP_EVIL_VERSION,			/* Version */
	STANDARD_MODULE_PROPERTIES
};
/* }}} */


#ifdef COMPILE_DL_EVIL
# ifdef ZTS
ZEND_TSRMLS_CACHE_DEFINE()
# endif
ZEND_GET_MODULE(evil)
#endif
