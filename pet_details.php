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

$error = ['is_success' => 'failed'];

$arr = array();
$pid = $_GET['pid'];

//根据p_index获取宠物详情
function get_wiki($pid,$conn)
{
	$arr_com = array();
	$arr_row=array();
	$sql = "select * from pet_wiki where pid = $pid";
	$result = $conn->query($sql);

	while ( $row = $result->fetch(PDO::FETCH_ASSOC) ) {
		$title = p_detail_title($row['pdetail']);
		$pet_detail = p_detail($row['pdetail']);
		$arr_row = ["pid"=> $row['pid'],"pet_Name"=> $row['pname'],"pet_Pic"=> $row['pet_pic'],'is_collect'=>'no'];
		for ($i=0; $i < count($title); $i++) { 
			$arr_row[$title[$i]] = trimall($pet_detail[$i]);
		}
	}
	return $arr_row;
}

//根据p_index获取宠物详情,并判断是否关注该宠物
function get_wiki_session($pid,$uid,$conn)
{
	$arr_com = array();
	$arr_row=array();
	$sql = "select * from pet_wiki where pid = $pid";
	$result = $conn->query($sql);

	while ( $row = $result->fetch(PDO::FETCH_ASSOC) ) {
		$title = p_detail_title($row['pdetail']);
		$pet_detail = p_detail($row['pdetail']);

		//判断是否收藏了该宠物
		$collect = check_c_pets($uid,$row['pid'],$conn);

		$arr_row = ["pid"=> $row['pid'],"pet_Name"=> $row['pname'],"pet_Pic"=> $row['pet_pic'],'is_collect'=>$collect];
		for ($i=0; $i < count($title); $i++) { 
			$arr_row[$title[$i]] = trimall($pet_detail[$i]);
		}
	}
	return $arr_row;
}

if (($_GET['session_token']) != '0') {

	//把session_token转换成uid
	$uid = get_uid($_GET['session_token'],$conn);
	$arr = get_wiki_session($pid,$uid,$conn);

}else{
	$arr = get_wiki($pid,$conn);	
}

$arr = json_encode($arr,JSON_UNESCAPED_UNICODE);
echo stripslashes($arr);
$conn = null;
