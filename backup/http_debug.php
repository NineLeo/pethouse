<?php
function get_http_raw()
{
	$raw = '';
	$raw .= $_SERVER['REQUEST_METHOD'].' '.$_SERVER['REQUEST_URI'].' '.$_SERVER['SERVER_PROTOCOL']."\r\n";
	foreach($_SERVER as $key => $value)
	{
		if(substr($key, 0, 5) === 'HTTP_')
		{
			$key = substr($key, 5);
			$key = str_replace('_', '-', $key);
			$raw .= $key.': '.$value."\r\n";
		}
	}
	$raw .= "\r\n";
	$raw .= file_get_contents('php://input');
	return $raw;
}

$ret=get_http_raw();
file_put_contents('1.txt', $ret);
echo $ret;