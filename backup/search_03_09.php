<?php
header("Content-type:text/json; charset=utf-8");//字符编码设置
error_reporting(E_ALL || ~E_NOTICE);
//include 'fun/com_fun.php';
// 创建连接
$dsn = "mysql:dbname=bdm261699251_db;host=bdm261699251.my3w.com";
$db_user = 'bdm261699251';
$db_pass = 'mao13504';

try{
    $conn=new PDO($dsn,$db_user,$db_pass);
}catch(PDOException $e){
    echo 'DB connection failed'.$e->getMessage();
}
$conn->exec("set names 'utf8'"); 
$conn->exec("set character_set_server = utf8;"); 

//$_GET['keywords']        关键字
//$_GET['type']        	   搜索类别

$kw = urldecode($_GET['keywords']);
if (isset($_GET['type'])) {
	$type = trim($_GET['type']);
}else{exit('参数错误');}
$division = array("+", "-", "/", ",", ".", "%");
$kw = str_replace($division, " ",$kw );
$keywords = explode(" ", $kw);
$count = count($keywords);

//初始化数组
$goods = array();
$store = array();
$goods_index = array();
$arr = array();

if ($type == 'goods') {	
	//构建sql语句, BINARY操作符进行二进制比较
	$sql = "SELECT * FROM goods WHERE gname like BINARY '%$keywords[0]%'";
	foreach($tep as $value){ $keywords = $value; }
	for ($i=1; $i < count($keywords); $i++) {    
	    $sql = $sql." or gname like BINARY '%$keywords[$i]%' ";    
	}
	$result = $conn->query($sql);	
	while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
	    array_push($goods,$row);
	}
	$arr=["searchGoods" => $goods];
}elseif ($type == 'store') {	
	$sql = "SELECT * FROM store WHERE sname like BINARY '%$keywords[0]%'";
	foreach($tep as $value){ $keywords = $value; }
	for ($i=1; $i < count($keywords); $i++) {    
	    $sql = $sql." or sname like BINARY '%$keywords[$i]%' ";    
	}
	$result = $conn->query($sql);	

	while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
		$sql_2 = "SELECT pic_url FROM goods WHERE sid = ".$row['sid']." limit 3";				
		$result_2 = $conn->query($sql_2);
		$a = 1;
		while ($row_2 = $result_2->fetch(PDO::FETCH_ASSOC)) {			
	    	array_push($goods_index,$row_2['pic_url']);
	    	$a++;
		}	
		//sql_3 取得商店的总销售件数
		$sql_3 = "SELECT sum(sales_count) FROM goods WHERE sid = ".$row['sid'];						
		$result_3 = $conn->query($sql_3);
		$row_3 = $result_3->fetch(PDO::FETCH_ASSOC);
		//整合$store, 作为输出json的数组
		$row['sales_count'] = intval($row_3['sum(sales_count)']);			
		$row['goods_index'] = $goods_index;	
	    array_push($store,$row);	
	    $goods_index = array();  		
	}	
	$arr=["searchStore" => $store];
}else{exit('参数错误');}

$arr = json_encode($arr,JSON_UNESCAPED_UNICODE);//json编码
echo stripslashes($arr);
$conn = null;
?>