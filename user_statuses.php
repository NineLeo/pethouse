 <?php
header("Content-type:text/json; charset=utf-8");//字符编码设置
error_reporting(E_ALL || ~E_NOTICE);
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

/*
$_GET['since_id']		若指定此参数，则返回ID比since_id大的微博（即比since_id时间晚的微博），默认为0
$_GET['max_id']		若指定此参数，则返回ID小于或等于max_id的微博，默认为0
$_GET['count']			单页返回的记录条数，最大不超过xx，默认为2。
$_GET['uid']
*/

$sql = '';
$arr = array();
$th_pic = array();
$large_pic = array();
$arr_done = array();
$error=["is_success" => 'failed'];
$error = json_encode($error,JSON_UNESCAPED_UNICODE);
$count = isset($_GET['count']) ? trim($_GET['count']):10;

//datetime转CTS时间
function CTS_time($re_time)
{
	$date = strtotime($re_time); 
	$week = array('Sun','Mon','Tue','Wed','Thu','Fri','Sat');
	return $week[date('w',$date)].date(' M m H:m:s +0800 Y',$date); 
}

$uid = get_uid($_GET['session_token'],$conn);

$sql = "select statuses.*,user.* from statuses,user where statuses.uid =$uid and statuses.uid = user.uid order by statuses.mid desc limit $count";
if ($_GET['since_id']!=0 && $_GET['max_id']==0) {
	$since_id = trim($_GET['since_id']);
	$sql = "select statuses.*,user.* from statuses,user where  statuses.uid =$uid and statuses.uid = user.uid and mid>$since_id order by statuses.mid  limit $count ";
}elseif ($_GET['since_id']==0 && $_GET['max_id']!=0) {
	$max_id = trim($_GET['max_id']);
	$sql = "select statuses.*,user.* from statuses,user where  statuses.uid =$uid and statuses.uid = user.uid and mid<$max_id order by statuses.mid desc limit $count";
}

$result = $conn->query($sql);
while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
	
	//sql_3 取得评论的总条数
	$sql_3 = "SELECT count(*) FROM comments_statuses WHERE mid = ".$row['mid'];						
	$result_3 = $conn->query($sql_3);
	$comments_count = 0;
	while ( $row_3 = $result_3->fetch(PDO::FETCH_NUM)) {
		$comments_count = $row_3[0];
	}

	if ($row['is_pic'] == 1) {
		$sql_done = "select * from pic_statuses where mid=".$row['mid'];
		$res_pic = $conn->query($sql_done);
		while ($row_pic = $res_pic->fetch(PDO::FETCH_ASSOC)) {
			array_push($th_pic,$row_pic['th_url']);
			array_push($large_pic,$row_pic['url']);
		}
		$arr_done = [
		'mid' =>$row['mid'],
		'user' => ['uid' =>$row['uid'],
		'screen_name' =>$row['name'],
		'th_user_pic' =>$row['thumbnail_pic'],
		'profile_image_url' =>$row['profile_image_url'],
		'verified_type' =>$row['verified_type'],
		'mbrank' =>$row['mbrank'],],		
		'text' =>$row['text'],
		'created_at' =>CTS_time($row['created_at']),
		'favorite_count' =>$row['favorite_count'],
		'comments_count' =>$comments_count,
		'source' =>$row['source'],
		'thumbnail_pic' => $th_pic,
		'pic_urls' => $large_pic];
	}elseif ($row['is_pic'] == 0) {
		$arr_done = ['mid' =>$row['mid'],
		'mid' =>$row['mid'],
		'user' => ['uid' =>$row['uid'],
		'screen_name' =>$row['name'],
		'th_user_pic' =>$row['thumbnail_pic'],
		'profile_image_url' =>$row['profile_image_url'],
		'verified_type' =>$row['verified_type'],
		'mbrank' =>$row['mbrank'],],		
		'text' =>$row['text'],
		'created_at' =>CTS_time($row['created_at']),
		'favorite_count' =>$row['favorite_count'],
		'comments_count' =>$comments_count,
		'source' =>$row['source'],
		];
	}
	array_push($arr,$arr_done);
	$arr_done = array();
	$th_pic = array();
	$large_pic = array();
}

/*
*数组倒序排列
*/
function arr_rev($arr)
{
	$a_temp = array();
	for ($i=count($arr)-1; $i >= 0 ; $i--) { 
		array_push($a_temp, $arr[$i]);
	}
	return $a_temp;
}


if ($_GET['since_id']!=0 && $_GET['max_id']==0) {
	$arr = arr_rev($arr);
}
$arr = ['statuses'=>$arr];
$arr = json_encode($arr,JSON_UNESCAPED_UNICODE);//json编码
echo stripslashes($arr);
$conn = null;
