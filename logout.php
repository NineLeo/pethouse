<?php
header("Content-type:text/html; charset=utf-8");//字符编码设置
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
$_POST['$uid']		
$_POST['$session_token']	
*/

$uid = '';
$session_token = '';

if (isset($_POST['uid']) && isset($_POST['session_token'])) {
	 $uid = $_POST['uid'];
	 $session_token = $_POST['session_token'];	 
}else{	
	over_exit('failed');
}


$sql_del = "delete from sessions where uid = $uid and session_token = '$session_token'";


if($conn->exec($sql_del)){
	over_exit('success');
}else{
	over_exit('failed');
}

