--TEST--
test1() Basic test
--EXTENSIONS--
evil
--FILE--
<?php
$ret = test1();

var_dump($ret);
?>
--EXPECT--
The extension evil is loaded and working!
NULL
