<?php
header("Content-type:text/json; charset=utf-8");//字符编码设置
error_reporting(E_ALL || ~E_NOTICE);
require dirname(__FILE__).'/fun/DB_config.php';

// 创建连接
try{
    $conn=new PDO($dsn,$db_user,$db_pass);
}catch(PDOException $e){
    echo 'DB connection failed'.$e->getMessage();
}
$conn->exec("set names 'utf8'"); 
$conn->exec("set character_set_server = utf8;"); 

/*
$_GET['type']		访问类型
$_GET['mid']	
*/
$sql = '';
$arr = array();
$mid = $_GET['mid'];
$error=["is_success" => 'failed'];
$error = json_encode($error,JSON_UNESCAPED_UNICODE);
$success = ["is_success" => 'success'];
$success = json_encode($success,JSON_UNESCAPED_UNICODE);


if ($_GET['type'] == 'like') {
	$result = ($conn->query("select favorite_count from statuses where mid=$mid"));
	$row = $result->fetch(PDO::FETCH_NUM);
	if ($row[0] == 'null' or $row[0] == 0) {
		$conn->exec("UPDATE statuses set favorite_count = 1 WHERE mid = $mid");
		echo $success;
	}else{
		$conn->exec("UPDATE statuses set favorite_count = (favorite_count + 1) WHERE mid = $mid");
		echo $success;
	}
}elseif ($_GET['type'] == 'dislike') {
	$result = ($conn->query("select favorite_count from statuses where mid=$mid"));
	$row = $result->fetch(PDO::FETCH_NUM);
	if ($row[0] == 'null' or $row[0] == 0) {
		echo $error;
		$conn = null;
		exit();
	}else{
		$conn->exec("UPDATE statuses set favorite_count = (favorite_count - 1) WHERE mid = $mid");
		echo $success;
	}
}else{
	echo $error;
}

$conn = null;
