<?php 
require dirname(__FILE__).'common.php';

$dsn = "mysql:dbname=bdm261699251_db;host=bdm261699251.my3w.com";
$db_user = 'bdm261699251';
$db_pass = 'mao13504';

try{
    $conn=new PDO($dsn,$db_user,$db_pass);
}catch(PDOException $e){
    echo 'DB connection failed'.$e->getMessage();
}
$conn->exec("set names 'utf8';"); 
$conn->exec("set character_set_server = utf8;"); 

$uid = $_POST['uid'];
$session_token = $_POST['session_token'];

//查询登陆用户的session_token
$true_token ='';
$sql = "select session_token from sessions where uid = $uid order by session_id desc limit 1";
$result = $conn->query($sql);
$row = $result->fetch(PDO::FETCH_NUM);
if ($row) {
	$true_token = $row[0];
}else{
	over_exit("You haven't log in Pethouse! Please log in first.");
}
if (!($true_token == $session_token)) {
	over_exit('token error!');
}

?>