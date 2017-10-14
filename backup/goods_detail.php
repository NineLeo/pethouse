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
$_GET['gid']        商品ID
$_GET['session_token']
*/

$pic_url = [];
$thumbnail_pic = [];
$gid = trim($_GET['gid']);
$sql = "select a.gid,a.gname, a.price, a.goods_description, a.sales_count, a.pic_url,a.sid, a.thumbnail_pic, a.sname, a.multi_pic, b.store_description, b.s_icon from goods a,store b where a.gid=$gid and a.sid = b.sid";

$result = $conn->query($sql);

$arr = $result->fetch(PDO::FETCH_ASSOC);

if ($arr['multi_pic'] == 1) {
	//取出商品图片
	$sql_2 = "SELECT th_url,url from pic_goods where gid = $gid";
	$result_2 = $conn->query($sql_2);
	while ( $row_2 = $result_2->fetch(PDO::FETCH_ASSOC) ) {
		array_push($pic_url, $row_2['url']);
		array_push($thumbnail_pic, $row_2['th_url']);
	}	
	unset($arr['pic_url'],$arr['thumbnail_pic'],$arr['multi_pic']);
	$arr['pic_urls'] = $pic_url;
	$arr['thumbnail_pics'] = $thumbnail_pic;
}else{
	$arr['pic_urls'] = [$arr['pic_url']];
	$arr['thumbnail_pics'] = [$arr['thumbnail_pic']];
	unset($arr['pic_url'],$arr['thumbnail_pic'],$arr['multi_pic']);
}


//获取商品所属商店的商店销售总额
$sql_3 = "SELECT sum(sales_count) FROM goods WHERE sid = ".$arr['sid'];					
$result_3 = $conn->query($sql_3);
$row_3 = $result_3->fetch(PDO::FETCH_ASSOC);

//判断是否收藏了该商品
$collect = 'no';
if (($_GET['session_token']) != '0') {
	$uid = get_uid($_GET['session_token'],$conn);
	$collect = check_c_goods($uid,$gid,$conn);
}

$arr['is_collect'] = $collect;
$arr['good_sales_count'] = ($arr['sales_count']);
$arr['store_sales_count'] = ($row_3['sum(sales_count)']);
unset($arr['sales_count']);
unset($arr['multi_pic']);

$arr = json_encode($arr,JSON_UNESCAPED_UNICODE);//json编码
echo stripslashes($arr);
$conn = null;
