--TEST--
Eval disabled
--EXTENSIONS--
evil
--FILE--
<?php
eval('1+1;');
?>
--EXPECTF--
Fatal error: %s
