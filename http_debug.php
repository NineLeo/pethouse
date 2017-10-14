<?php
function get_http_raw()
{
	$raw = '';

	$raw .= file_get_contents('php://input');
	return $raw;
}

$ret=get_http_raw();
var_dump($_FILES);
$a = $_FILES['img1']['1_1.jpg'];

echo gettype($a);
file_put_contents('1.jpg', $a);
file_put_contents('1.txt', $ret);
//echo $ret;