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

$by_follower= $_POST['by_follower'];
$fans = $_POST['uid'];
if ($by_follower == $fans) {
	over_exit('failed');
}

//检查session_token是否合法
$token = $_POST['session_token'];
session_check($token,$fans,$conn);


$sql = "delete from follow where by_follower=$by_follower and fans=$fans";

$ins = $conn->exec($sql);
if ($ins == 0) {
	over_exit('failed');
}elseif ($ins == 1) {
	over_exit('success');
}
