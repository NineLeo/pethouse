<?php
header("Content-type:text/json; charset=utf-8");//字符编码设置
error_reporting(E_ALL || ~E_NOTICE);
require dirname(__FILE__).'/fun/wiki_fun.php';//百科函数文件
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
$pid = array();
$uid = 0;
if (isset($_GET['uid'])) {
	$uid = $_GET['uid'];
}else{
	error_exit();
}

//检查session_token是否合法
$token = $_GET['session_token'];
session_check($token,$uid,$conn);


$sql = "select pid from collect_pets where uid = $uid";
$result = $conn->query($sql);

while ($row=$result->fetch(PDO::FETCH_ASSOC)) {
	array_push($pid,$row['pid']);
}

if (count($pid) == 0) {
	$done = [];
	$done = json_encode($done,JSON_UNESCAPED_UNICODE);
	echo $done;
	$conn = null;
	exit();
}

//获取宠物详情
function get_wiki($index,$conn)
{
	$arr_row=array();
	$sql = "select * from pet_wiki where pid = $index";
	$result = $conn->query($sql);

	while ( $row = $result->fetch(PDO::FETCH_ASSOC) ) {
		$title = p_detail_title($row['pdetail']);
		$pet_detail = p_detail($row['pdetail']);
		$arr_row = ['pid'=>$row['pid'], "pet_Name"=> $row['pname'],"pet_Pic"=> $row['pet_pic']];
		for ($i=0; $i < count($title); $i++) { 
			$arr_row[$title[$i]] = trimall($pet_detail[$i]);
		}
	}
	return $arr_row;
}

for ($i=0; $i < count($pid); $i++) { 
	$arr_ready = get_wiki($pid[$i],$conn);
	array_push($arr,$arr_ready);
}

$arr = json_encode($arr,JSON_UNESCAPED_UNICODE);
echo stripslashes($arr);
$conn = null;
