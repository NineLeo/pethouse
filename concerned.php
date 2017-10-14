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

$uid = $_POST['uid'];
//检查session_token是否合法
$token = $_POST['session_token'];
session_check($token,$uid,$conn);

$sql = "select uid,name,sex,thumbnail_pic,profile_image_url,user_description,verified_type,mbrank from user where uid in 
(select by_follower from follow where fans = $uid)";

$result = $conn->query($sql);
$arr = [];
while ($row=$result->fetch(PDO::FETCH_ASSOC)) {
	$row = array('screen_name' => $row['name']) + $row;
	unset($row['name']);
	array_push($arr,$row);
}
$arr = json_encode($arr,JSON_UNESCAPED_UNICODE);
echo stripslashes($arr); 
$conn = null;
