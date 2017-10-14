<?php
header("Content-type:text/json; charset=utf-8");//字符编码设置
error_reporting(E_ALL || ~E_NOTICE);
require dirname(__FILE__).'/fun/DB_config.php';
require dirname(__FILE__).'/fun/common.php';

// 创建连接, 读取数据
try{
    $conn=new PDO($dsn,$db_user,$db_pass);
}catch(PDOException $e){
    echo 'DB connection failed'.$e->getMessage();
}
$conn->exec("set names 'utf8'"); 
$conn->exec("set character_set_server = utf8;"); 

/*
$_POST['uid']        用户ID 
*/

function userinfo_query($uid,$conn)
{  
  $sql = "select * from user where uid = ".$uid;
  $result = $conn->query($sql);
  $row = $result->fetch(PDO::FETCH_ASSOC);
      
  //取出该用户所发微博的总条数        
  $result_2 = $conn->query("SELECT count(*) FROM statuses WHERE uid = $uid");
  $row_2 = $result_2->fetch(PDO::FETCH_NUM);
  $statuses_count = intval($row_2[0]);

  //取出该用户的粉丝数
  $result_3 = $conn->query("SELECT count(*) FROM follow WHERE by_follower = $uid");
  $row_3 = $result_3->fetch(PDO::FETCH_NUM);

  //取出该用户关注的数量
  $result_4 = $conn->query("SELECT count(*) FROM follow WHERE fans = $uid");
  $row_4 = $result_4->fetch(PDO::FETCH_NUM);

  $arr=[  "uid" => $row['uid'],
    "screen_name" => $row['name'],
    "sex" => $row['sex'],
    "statuses_count" => $statuses_count,
    "account" => $row['account'], 
    "thumbnail_pic" => $row['thumbnail_pic'],
    "profile_image_url" => $row['profile_image_url'],
    'concerned' => intval($row_4[0]),
    'fans' => intval($row_3[0]),
    "birthday" => $row['birthday'],
    "user_description" => $row['user_description'], 
    "created_date" => $row['created_date'],
    "verified_type" => intval($row['verified_type']),
    "mbrank" => intval($row['mbrank']),
    "is_success" => 'success'];
   return $arr;
}

$uid = trim($_POST['uid']);
/*$token = $_POST['session_token'];
session_check($token,$uid,$conn);
*/
if (isset($_POST['other_id'])) {
  $other_id = trim($_POST['other_id']);
  $arr = userinfo_query($other_id,$conn);
  $sql_fans = "select count(*) from follow where by_follower = $other_id and fans = $uid";
  $query = $conn->query($sql_fans);
  $check_fans = $query->fetch(PDO::FETCH_NUM);
  $arr['is_concerned'] = ($check_fans[0] == 0)?'no':'yes';
}else{
  $arr = userinfo_query($uid,$conn);
}

$arr = json_encode($arr,JSON_UNESCAPED_UNICODE);
echo stripslashes($arr);
$conn = null;
