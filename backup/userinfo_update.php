<?php
header("Content-type:text/json; charset=utf-8");//字符编码设置
error_reporting(E_ALL || ~E_NOTICE);
//include 'fun/com_fun.php';

$dsn = "mysql:dbname=bdm261699251_db;host=bdm261699251.my3w.com";
$db_user = 'bdm261699251';
$db_pass = 'mao13504';


// 创建连接, 读取数据
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

if (isset($_POST['name']) && isset($_POST['sex']) && isset($_POST['birthday']) && isset($_POST['user_description'])) {
  over_exit('failed');
}

$name = trim($_POST['name']);
$sex = trim($_POST['sex']);
$birthday = trim($_POST['birthday']);
$user_description = trim($_POST['user_description']);

if (isset($_POST['uid'])) {
    $uid = trim($_POST['uid']);
    $sql = "update user set name='$name' ,sex='$sex' ,birthday='$birthday' ,user_description='$user_description' WHERE uid=$uid";
}else{
  echo $error;
  exit();
}

$ins = $conn->exec($sql);

if ($ins == 0) {
  over_exit('failed');
}elseif ($ins == 1) {
  over_exit('success');
}
