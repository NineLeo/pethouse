<?php
header("Content-type:text/json; charset=utf-8");//字符编码设置
//error_reporting(E_ALL || ~E_NOTICE);
//include 'fun/com_fun.php';
$dsn = "mysql:dbname=graduation;host=localhost";
$db_user = 'root';
$db_pass = 'root';

// 创建连接
try{
    $conn=new PDO($dsn,$db_user,$db_pass);
}catch(PDOException $e){
    echo 'DB connection failed'.$e->getMessage();
}
/*
$_GET['access_token']
$_GET['since_id']		若指定此参数，则返回ID比since_id大的微博（即比since_id时间晚的微博），默认为0
$_GET['max_id']			若指定此参数，则返回ID小于或等于max_id的微博，默认为0
$_GET['count']			单页返回的记录条数，最大不超过xx，默认为2。
*/
$sql = '';
if (isset($_GET['count'])) {
	$count = $_GET['count'];
	if (isset($_GET['since_id'])) {
		$since_id = $_GET['since_id'];
		$sql = "select * from statuses where mid > ".$since_id." order by mid asc limit ".$count;		
	}elseif (isset($_GET['max_id'])) {
		$max_id = $_GET['max_id'];
		$sql = "select * from statuses where mid < ".$max_id." order by mid desc limit ".$count;		
	}else{
		$sql = "select * from statuses order by mid desc limit ".$count;
	}
}else {
	if (isset($_GET['since_id'])) {
		$since_id = $_GET['since_id'];
		$sql = "select * from statuses where mid > ".$since_id." limit 2";		
	}elseif (isset($_GET['max_id'])) {
		$max_id = $_GET['max_id'];
		$sql = "select * from statuses where mid < ".$max_id." limit 2";		
	}else{
		$sql = $sql = "select * from statuses order by mid desc limit 2";
	}		
}
$result = $conn->query($sql);//$result的类型是object
$arr = array();
// 输出每行数据,$result是mysql的一个查询结果集，fetch()函数可以提取结果的一行，并且指针指向下一行，如果不能提取就返回false，while语句就可以循环提取$result，从第一行到最后一行，直到false为止
while ($row = $result->fetch()) {
	$count=count($row);
	foreach ($row as $k=>$v) {  //使用iconv()函数将查询结果转换成utf8, 因为json格式支持utf8
        $row["$k"] = iconv('GB2312', 'UTF-8', $v);  
    }
	for($i=0;$i<$count;$i++){	
    unset($row[$i]);//删除冗余数据, mysql_fetch_row函数提取的数组自带一个自增索引, 比如uid=1会自带一个0=>1,username会带一个1=>Alice unset能删除这些int类型的索引, 而保留字符串类型的索引(e.g. "username"=>"Alice"), 字符串类型的索引就是sql查询出来的数据
    }
    array_push($arr,$row);
}
$arr=["statuses" => $arr];
$arr = json_encode($arr,JSON_UNESCAPED_UNICODE);//json编码
echo stripslashes($arr); // 反引用一个引用字符串
$conn = null;
?>