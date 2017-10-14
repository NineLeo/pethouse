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
$sid = array();
$uid = 0;
if (isset($_GET['uid'])) {
	$uid = $_GET['uid'];
}else{
	error_exit();
}

//检查session_token是否合法
$token = $_GET['session_token'];
session_check($token,$uid,$conn);


$sql_uid = "select sid from collect_stores where uid = $uid";
$result = $conn->query($sql_uid);

while ($row_uid=$result->fetch(PDO::FETCH_ASSOC)) {
	array_push($sid,$row_uid['sid']);
}

if (count($sid) == 0) {
	$done = [];
	$done = json_encode($done,JSON_UNESCAPED_UNICODE);
	echo $done;
	$conn = null;
	exit();
}

//获取店铺详情
function get_stores($index,$conn)
{
	$arr_row=array();
	$goods_index = array();
	$sql = "select * from store where sid = $index";
	$result = $conn->query($sql);	

	$arr_row = $result->fetch(PDO::FETCH_ASSOC);
	$sql_2 = "SELECT pic_url FROM goods WHERE sid = $index limit 3";				
	$result_2 = $conn->query($sql_2);
	//取出商铺中的三件商品的图片
	while ($row_2 = $result_2->fetch(PDO::FETCH_ASSOC)) {			
    	array_push($goods_index,$row_2['pic_url']);
	}
	//sql_3 取得商店的总销售件数
	$sql_3 = "SELECT sum(sales_count) FROM goods WHERE sid = $index";						
	$result_3 = $conn->query($sql_3);
	$row_3 = $result_3->fetch(PDO::FETCH_ASSOC);
	//整合$store, 作为输出json的数组
	$arr_row['sales_count'] = intval($row_3['sum(sales_count)']);			
	$arr_row['goods_index'] = $goods_index;		  	
	return $arr_row;
}

for ($i=0; $i < count($sid); $i++) { 
	$arr_ready = get_stores($sid[$i],$conn);
	array_push($arr,$arr_ready);
}

$arr = json_encode($arr,JSON_UNESCAPED_UNICODE);
echo stripslashes($arr);
$conn = null;
