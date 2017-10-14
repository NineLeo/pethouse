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

//检查传入参数
function check_POST(&$id,$value)
{
	if (isset($value)) {
		$id = $value;
	}else{
		over_exit('failed');
	}
}

//删除数据
function cancel($uid,$target_id,$id,$target_table,$conn)
{
	$sql = "delete from $target_table where $id = $target_id and uid = $uid";
	$ins = $conn->exec($sql);
	if ($ins == 0) {
		over_exit('failed');
	}elseif ($ins == 1) {
		over_exit('success');
	}
}

$uid = 0;
$target_id = 0;
$type = '';

check_POST($uid,$_POST['uid']);
check_POST($session_token,$_POST['session_token']);
check_POST($target_id,$_POST['target_id']);
check_POST($type,$_POST['type']);

//判断session_token是否合法
session_check($session_token,$uid,$conn);

if ($type == 'good') {
	$id = 'gid';
	cancel($uid,$target_id,$id,'collect_goods',$conn);
}elseif ($type == 'pet') {
	$id = 'pid';
	cancel($uid,$target_id,$id,'collect_pets',$conn);
}elseif ($type == 'store') {
	$id = 'sid';
	cancel($uid,$target_id,$id,'collect_stores',$conn);
}else{over_exit('failed');}

