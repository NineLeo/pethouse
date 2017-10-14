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

//$_POST['keywords']        关键字

$kw = urldecode($_POST['keywords']);
$division = array("+", "-", "/", ",", ".", "%");
$kw = str_replace($division, " ",$kw );
$keywords = explode(" ", $kw);
$arr = array();

//根据关键词模糊查询
function get_wiki($search_words,$conn)
{
	$arr_com = array();
	$arr_row=array();
	$sql = "SELECT * from pet_wiki where pname like  BINARY '%$search_words[0]%'";
	for ($i=1; $i < count($search_words); $i++) {    
	    $sql = $sql." or pname like BINARY '%$search_words[$i]%' ";    
	}
	$result = $conn->query($sql);

	while ( $row = $result->fetch(PDO::FETCH_ASSOC) ) {
		$title = p_detail_title($row['pdetail']);
		$pet_detail = p_detail($row['pdetail']);
		$arr_row = ["pid"=> $row['pid'],"pet_Name"=> $row['pname'],"pet_Pic"=> $row['pet_pic']];
		for ($i=0; $i < count($title); $i++) { 
			$arr_row[$title[$i]] = trimall($pet_detail[$i]);
		}
		array_push($arr_com,$arr_row);
	}
	return $arr_com;
}


//根据关键词模糊查询,并判断是否关注该宠物
function get_wiki_session($search_words,$uid,$conn)
{
	$arr_com = array();
	$arr_row=array();
	$sql = "SELECT * from pet_wiki where pname like  BINARY '%$search_words[0]%'";
	for ($i=1; $i < count($search_words); $i++) {    
	    $sql = $sql." or pname like BINARY '%$search_words[$i]%' ";    
	}
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
		array_push($arr_com,$arr_row);
	}
	return $arr_com;
}


if ($_POST['session_token'] != '0') {
	//把session_token转换成uid
	$uid = get_uid($_POST['session_token'],$conn);

	$arr_temp = get_wiki_session($keywords,$uid,$conn);
	for ($j=0; $j < count($arr_temp); $j++) { 
		array_push($arr,$arr_temp[$j]);
	}		
}else{
	$arr_temp = get_wiki($keywords,$conn);
	for ($j=0; $j < count($arr_temp); $j++) { 
		array_push($arr,$arr_temp[$j]);
	}	
}

$arr = json_encode($arr,JSON_UNESCAPED_UNICODE);//json编码
echo stripslashes($arr);
$conn = null;
