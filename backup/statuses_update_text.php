<?php
header("Content-type:text/json; charset=utf-8");//字符编码设置
error_reporting(E_ALL || ~E_NOTICE);
date_default_timezone_set('ASIA'); //时区设置, php.ini -> timezone设置后可注释

$dsn = "mysql:dbname=bdm261699251_db;host=bdm261699251.my3w.com";
$db_user = 'bdm261699251';
$db_pass = 'mao13504';

// 创建连接
try{
    $conn=new PDO($dsn,$db_user,$db_pass);
}catch(PDOException $e){
    echo 'DB connection failed'.$e->getMessage();
}
$conn->exec("set names 'utf8'"); 
$conn->exec("set character_set_server = utf8;"); 

$error = ['is_success' => 'failed'];
$source = 'Iphone 7';
/*
$_POST['uid']
$_POST['text']
$_POST['imageData']
*/
if (isset($_POST['uid']) && isset($_POST['text'])) {
	$uid = trim($_POST['uid']);
	$text = trim($_POST['text']);
}else{	
	echo json_encode($error,JSON_UNESCAPED_UNICODE);
	$conn = null;
	exit();
}

$time = date('Y-m-d H:i:s');

$sql = "insert into statuses (uid,created_at,text,source) 
values ($uid,'$time','$text','$source')" ;
if($conn->exec($sql)){
	$return = ['is_success'=>'success'];
	echo json_encode($return,JSON_UNESCAPED_UNICODE);
}else{
	echo json_encode($error,JSON_UNESCAPED_UNICODE);
}
$conn = null;

