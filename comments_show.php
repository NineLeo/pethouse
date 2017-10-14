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
$_GET['mid']			需要查询的微博ID
$_GET['since_id']		若指定此参数，则返回ID比since_id大的微博（即比since_id时间晚的微博），默认为0
$_GET['max_id']			若指定此参数，则返回ID小于或等于max_id的微博，默认为0
$_GET['count']			单页返回的记录条数，最大不超过xx，默认为2。
*/

$count = ($_GET['count'] == 0) ? trim($_GET['count']):10;
if (isset($_GET['mid'])) {
	$mid = $_GET['mid'];
}else{
	exit();$conn = null;
}
$sql = "select comments_statuses.*, user.*  from comments_statuses join user where mid=$mid and comments_statuses.uid=user.uid limit $count";
if (($_GET['since_id'] != 0) && ($_GET['max_id'] == 0)) {
	$since_id = trim($_GET['since_id']);
	$sql = "select comments_statuses.*,user.*
	 from comments_statuses join user
	 where mid=$mid and cid>$since_id
	 and comments_statuses.uid=user.uid 
	 limit $count";
}elseif (($_GET['since_id'] == 0) && ($_GET['max_id'] != 0)) {
	$max_id = trim($_GET['max_id']);
	$sql = "select comments_statuses.*,user.*
	 from comments_statuses join user
	 where mid=$mid and cid<$max_id
	 and comments_statuses.uid=user.uid 
	 order by comments_statuses.cid desc
	 limit $count";
}
$result = $conn->query($sql);
$arr = array();
while ($row =$result->fetch(PDO::FETCH_ASSOC)) {
	$arr_row = array('cid' => $row['cid'],
		'uid' => $row['uid'],
		'text'	=>$row['text'],
		'th_com_pic' =>$row['th_com_pic'],
		'com_pic' =>$row['com_pic'],
		'created_time' =>$row['created_time'],
		'name'	=>$row['name'],
		'thumbnail_pic'	=>$row['thumbnail_pic'],
		'profile_image_url'	=>$row['profile_image_url'],
	 );
	array_push($arr,$arr_row);
}
$arr = ['comments' => $arr];
$arr = json_encode($arr,JSON_UNESCAPED_UNICODE);//json编码
echo stripslashes($arr);
$conn = null;
