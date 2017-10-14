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


/*
$_GET['sid']        商家ID
$_GET['count']      返回的商品数量记录条数
$_GET['since_id']
*/
$count = ($_GET['count'] != 0) ? trim($_GET['count']):10;

$sql = "select * from goods order by gid asc limit $count";

if ( ($_GET['since_id'] != 0) && isset($_GET['sid'])){
    $since_id = trim($_GET['since_id']);
    $sid = trim($_GET['sid']);
    $sql = "select * from goods where gid > $since_id
            and sid = $sid
            order by gid asc limit $count";
}elseif (isset($_GET['sid']) && ($_GET['since_id'] == 0)) {
    $sid = trim($_GET['sid']);
    $sql = "select * from goods where  sid = $sid
            order by gid asc limit $count";
}elseif (!isset($_GET['sid']) && ($_GET['since_id'] != 0)) {
    $since_id = trim($_GET['since_id']);
    $sql = "select * from goods where gid > $since_id
            order by gid asc limit $count";
}


$result = $conn->query($sql);//$result的类型是object
$arr = array();

while ($row = $result->fetch(PDO::FETCH_ASSOC)) {   
    array_push($arr,$row);
}
$arr=["goods" => $arr];
$arr = json_encode($arr,JSON_UNESCAPED_UNICODE);//json编码
echo stripslashes($arr);
$conn = null;
