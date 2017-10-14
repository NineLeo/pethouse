<?php
header("Content-type:text/json; charset=utf-8");
error_reporting(E_ALL || ~E_NOTICE);
date_default_timezone_set('ASIA'); 
require dirname(__FILE__).'/fun/DB_config.php';
require dirname(__FILE__).'/fun/common.php';

// 创建连接
try{
    $conn=new PDO($dsn,$db_user,$db_pass);
}catch(PDOException $e){
    echo 'DB connection failed'.$e->getMessage();
}
$conn->exec("set names 'utf8'"); 
$conn->exec("set character_set_server = utf8;"); 

$error = ['is_success' => 'failed'];

/*
$_POST['uid']
$_POST['mid']
$_POST['session_token']
$_POST['comment']
*/

if (isset($_POST['uid']) && isset($_POST['mid']) && isset($_POST['comment'])) {
	$uid = trim($_POST['uid']);
	$comment = trim($_POST['comment']);
	$mid = trim($_POST['mid']);
}else{	
	echo json_encode($error,JSON_UNESCAPED_UNICODE);
	$conn = null;
	exit();
}

//检查session_token是否合法
$token = $_POST['session_token'];
session_check($token,$uid,$conn);

  
$time = date('Y-m-d H:i:s');
$sql = "insert into comments_statuses (uid,mid,created_time,text) 
values ($uid,$mid,'$time','$comment')" ;

if($conn->exec($sql)){
	$return = ['is_success'=>'success'];
	echo json_encode($return,JSON_UNESCAPED_UNICODE);
}else{
	echo json_encode($error,JSON_UNESCAPED_UNICODE);
}
$conn = null;

