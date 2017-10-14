<?php
header("Content-type:text/json; charset=utf-8");//字符编码设置
error_reporting(E_ALL || ~E_NOTICE);

$dsn = "mysql:dbname=bdm261699251_db;host=bdm261699251.my3w.com";
$db_user = 'bdm261699251';
$db_pass = 'mao13504';

// 创建连接
try{
    $conn=new PDO($dsn,$db_user,$db_pass);
}catch(PDOException $e){
    echo 'DB connection failed'.$e->getMessage();
}
$conn->exec("set names 'utf8'"); 
$conn->exec("set character_set_server = utf8;"); 

function over_exit($over)
{
	$done = ['is_success' => $over];
	$done = json_encode($done,JSON_UNESCAPED_UNICODE);
	echo $done;
	$conn = null;
	exit();
}

//检查传入参数
function check_POST(&$id,$value)
{
	if (isset($value)) {
		$id = $value;
	}else{
		over_exit('failed');
	}
}

//插入数据
function collect($uid,$target_id,$id,$name,$table,$target_table,$conn)
{
	$sql = "select $name from $table where $id = $target_id";
	$result = $conn->query($sql);
	$row = $result->fetch(PDO::FETCH_NUM);
	$target_name = $row[0];
	//echo "$target_name";
	$sql_ins = "insert into $target_table values ($uid,$target_id,'$target_name')";
	// echo 'sql='.$sql_ins;
	$ins = $conn->exec($sql_ins);
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
check_POST($target_id,$_POST['target_id']);
check_POST($type,$_POST['type']);

if ($type == 'good') {
	$id = 'gid';$name = 'gname';
	collect($uid,$target_id,$id,$name,'goods','collect_goods',$conn);
}elseif ($type == 'pet') {
	$id = 'pid';$name = 'pname';
	collect($uid,$target_id,$id,$name,'pet_wiki','collect_pets',$conn);
}elseif ($type == 'store') {
	$id = 'sid';$name = 'sname';
	collect($uid,$target_id,$id,$name,'store','collect_stores',$conn);
}else{over_exit('failed');}

