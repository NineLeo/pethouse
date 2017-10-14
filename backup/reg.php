<?php 
header("Content-type:text/json; charset=utf-8");//字符编码设置
error_reporting(E_ALL || ~E_NOTICE);
//include 'fun/com_fun.php';
date_default_timezone_set('PRC');
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

/*
$_POST['name']					昵称
$_POST['account']				登陆账号
$_POST['password']				密码
$_POST['user_description']		用户描述
$_POST['sex']		用户性别
*/

if (isset($_POST['name']) && isset($_POST['account']) && isset($_POST['password'])) {
	$name = trim($_POST['name']);
	$account = trim($_POST['account']);
	$password = trim($_POST['password']);
	$user_description = trim($_POST['user_description']);
	$sex = trim($_POST['sex']);
}else{
	$return = ['is_success' => 'failed'];
	echo json_encode($return,JSON_UNESCAPED_UNICODE);
	$conn = null;
	exit();
}

$sql_check = "select account from user where account = '$account'";
$check = $conn->query($sql_check);
if ($check->fetch()) {
	$return = ['is_success' => 'Registered account'];
	echo json_encode($return,JSON_UNESCAPED_UNICODE);
	$conn = null;
	exit();
}

$time = date('Y-m-d');
$sql = "insert into user 
		(name,sex,account,password,user_description,created_date) values
		('$name','$sex','$account','$password','$user_description','$time')";
$conn->exec($sql);

$id = $conn->lastInsertId();	//获取刚插入的ID
$sql_done = "select * from user where uid = $id";
$result = $conn->query($sql_done);
$row = $result->fetch(PDO::FETCH_ASSOC);
$arr=[  "uid" => $row['uid'],
  "name" => $row['name'],
  "sex" => $row['sex'],
  "account" => $row['account'],
  "password" => $row['password'],
  "thumbnail_pic" => $row['thumbnail_pic'],
  "profile_image_url" => $row['profile_image_url'],
  "user_description" => $row['user_description'],
  "created_date" => $row['created_date'],
  "is_success" => 'success'];

$arr = json_encode($arr,JSON_UNESCAPED_UNICODE);
echo stripslashes($arr);
$conn = null;
