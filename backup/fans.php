<?php
header("Content-type:text/json; charset=utf-8");//字符编码设置
error_reporting(E_ALL || ~E_NOTICE);
require ('fun/DB_config.php'); 

// 创建连接
try{
    $conn=new PDO($dsn,$db_user,$db_pass);
}catch(PDOException $e){
    echo 'DB connection failed'.$e->getMessage();
}
$conn->exec("set names 'utf8'"); 
$conn->exec("set character_set_server = utf8;"); 

$uid = $_POST['uid'];

$sql = "select uid,name,sex,thumbnail_pic,profile_image_url,user_description,verified_type,mbrank from user where uid in 
(select fans from follow where by_follower = $uid)";

$result = $conn->query($sql);
$arr = [];

/*
*查询是否互相关注
*/
function each_other($uid,$other_id,$conn)
{
	$sql_inner = "select count(*) from follow where by_follower = $other_id and fans = $uid";
	$res = $conn->query($sql_inner);
	$row = $res->fetch(PDO::FETCH_NUM);
	if ($row[0]) {
		return 1;
	}else{return 0;}
}


while ($row=$result->fetch(PDO::FETCH_ASSOC)) {
	$row = array('screen_name' => $row['name']) + $row;
	unset($row['name']);
	if (each_other($uid,$row['uid'],$conn)) {
		$row['follow_each_other']='yes';
	}else{$row['follow_each_other']='no';}
	array_push($arr,$row);
}
$arr = json_encode($arr,JSON_UNESCAPED_UNICODE);
echo stripslashes($arr); 
$conn = null;