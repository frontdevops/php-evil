--TEST--
Check if evil is loaded
--EXTENSIONS--
evil
--FILE--
<?php
echo 'The extension "evil" is available';
?>
--EXPECT--
The extension "evil" is available
