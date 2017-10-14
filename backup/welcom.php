<?php 
header("Content-type:text/json; charset=utf-8");//字符编码设置
error_reporting(E_ALL || ~E_NOTICE);
$week = date('w');
$url = "http://www.pethouse.space/img/welcom/".$week.".jpg";
$arr = ['url'=>$url];
$arr = json_encode($arr,JSON_UNESCAPED_UNICODE);//json编码
echo stripslashes($arr);