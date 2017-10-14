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

$arr = array();
$gid = array();
$uid = 0;
if (isset($_GET['uid'])) {
	$uid = $_GET['uid'];
}else{
	error_exit();
}

//检查session_token是否合法
$token = $_GET['session_token'];
session_check($token,$uid,$conn);


$sql = "select gid from collect_goods where uid = $uid";
$result = $conn->query($sql);

while ($row=$result->fetch(PDO::FETCH_ASSOC)) {
	array_push($gid,$row['gid']);
}

if (count($gid) == 0) {
	$done = [];
	$done = json_encode($done,JSON_UNESCAPED_UNICODE);
	echo $done;
	$conn = null;
	exit();
}

//获取商品详情
function get_goods($index,$conn)
{
	$arr_row=array();
	$sql = "select * from goods where gid = $index";
	$result = $conn->query($sql);

	$arr_row = $result->fetch(PDO::FETCH_ASSOC) ;	
	return $arr_row;
}

for ($i=0; $i < count($gid); $i++) { 
	$arr_ready = get_goods($gid[$i],$conn);
	array_push($arr,$arr_ready);
}

$arr = json_encode($arr,JSON_UNESCAPED_UNICODE);
echo stripslashes($arr);
$conn = null;
