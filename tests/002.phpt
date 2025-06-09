--TEST--
phpinfo() shows evil info
--EXTENSIONS--
evil
--FILE--
<?php
ob_start();
phpinfo(INFO_MODULES);
$info = ob_get_clean();
if (strpos($info, 'Eval') !== false && strpos($info, 'Disabled') !== false) {
    echo 'info found';
} else {
    echo 'info missing';
}
?>
--EXPECT--
info found
