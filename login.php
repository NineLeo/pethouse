<?php
header("Content-type:text/json; charset=utf-8");//字符编码设置
error_reporting(E_ALL || ~E_NOTICE);
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

/*
$_POST['$account']		账户
$_POST['$password']		密码
*/

$account = '';
$password = '';

if (isset($_POST['account']) && isset($_POST['password'])) {
	 $account = $_POST['account'];
	 $password = $_POST['password'];	 
}else{	
	over_exit('failed');
}

//查询账户的密码
$true_pass ='';
$sql = "select password from user where account = '$account'";
$result = $conn->query($sql);
$arr = array();
$row = $result->fetch(PDO::FETCH_ASSOC);
if ($row) {
	$true_pass = $row['password'];
}else{
	echo json_encode($error,JSON_UNESCAPED_UNICODE);
	$conn = null;
	exit();
}

if ($password == $true_pass) {
	$sql_done = "select * from user where account = '$account'";	
	$result_done = $conn->query($sql_done);
	$arr = array();
	$row_done = $result_done->fetch(PDO::FETCH_ASSOC);		
	$uid = $row_done['uid'];		 	
	$arr = [
	'uid' => $uid,
	'name' => $row_done['name'],
	'thumbnail_pic' =>$row_done['thumbnail_pic'],
	'profile_image_url' => $row_done['profile_image_url'],
	'is_success' => 'success'
	];
	$time = date('Y-m-d H:i:s');
	$token = md5(date('YmdHis').$uid);
	$sql_session = "insert into sessions (session_token,create_time,uid) values ('$token','$time',$uid)";
	$conn->exec($sql_session);
	$arr['session_token'] = $token;
	$arr = json_encode($arr,JSON_UNESCAPED_UNICODE);
	echo stripslashes($arr); 
}else{	
	over_exit('failed');	 
}

$conn = null;//关闭连接
