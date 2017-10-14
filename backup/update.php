<?php
header("Content-type:text/json; charset=utf-8");//字符编码设置
error_reporting(E_ALL || ~E_NOTICE);
date_default_timezone_set('PRC'); //时区设置, php.ini -> timezone设置后可注释
require dirname(__FILE__).'/fun/DB_config.php';

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

function receiveStreamFile($receiveFile){

    $streamData = isset($GLOBALS['HTTP_RAW_POST_DATA'])? $GLOBALS['HTTP_RAW_POST_DATA'] : '';

    if(empty($streamData)){
        $streamData = file_get_contents('php://input');
    }

    if($streamData!=''){
        $ret = file_put_contents($receiveFile, $streamData, true);
    }else{
        $ret = false;
    }

    return $ret;

}

$source = 'Iphone 7';
/*
$_POST['uid']
$_POST['text']
$_POST['imageData']
*/
if (isset($_POST['uid']) && isset($_POST['text'])) {
	$uid = trim($_POST['uid']);
	$text = trim($_POST['text']);
}else{	
	over_exit('failed');
}

//$source = trim($_POST['source']);

$time = date('Y-m-d H:i:s');
/*pic*/

$imgDir = 'statuses_img/large/';
//要生成的图片名字
$ftime = date('YmdHis').'rand'.rand(0,30).'.png';
$newFilePath = $imgDir.$ftime;

$ret = receiveStreamFile($newFilePath);
 
$th_W = 50;    //    缩略图宽
$th_H = 50;    //     缩略图高
$th_filename = "statuses_img/thumbnail/".$ftime;   
CImage::CreateThumbnail($newFilePath, $th_W, $th_H, $th_filename);

$sql = "insert into statuses (uid,created_at,text,thumbnail_pic,pic_urls,source) 
values ($uid,'$time','$text','$th_filename','$newFilePath','$source')" ;
if($conn->exec($sql)){
	$return = ['is_success'=>'success'];
	echo json_encode($arr,JSON_UNESCAPED_UNICODE);
}else{
	echo json_encode($error,JSON_UNESCAPED_UNICODE);
}
$conn = null;

