<?php 

/*
*错误返回函数
*/
function over_exit($over)
{
	$done = ['is_success' => $over];
	$done = json_encode($done,JSON_UNESCAPED_UNICODE);
	echo $done;
	$conn = null;
	exit();
}

/*
*查询uid
*/

function get_uid($token,$conn)
{
	$sql = "select uid from sessions where session_token = '$token' limit 1";
	$result = $conn->query($sql);
	if($row = $result->fetch(PDO::FETCH_NUM)){
		return $row[0];
	}else{over_exit('session error!');};
}

//检查某个用户是否收藏了指定id的宠物
function check_c_pets($uid,$pid,$conn)
{
	//echo'11';
	$sql = "select * from collect_pets where uid = $uid and pid = $pid";
	$result = $conn->query($sql);
	if ($row = $result->fetch(PDO::FETCH_NUM)) {
		return 'yes';
	}else{
		return 'no';
	}
}

//检查某个用户是否收藏了指定id的商品
function check_c_goods($uid,$gid,$conn)
{
	$sql = "select * from collect_goods where uid = $uid and gid = $gid";
	$result = $conn->query($sql);
	if ($row = $result->fetch(PDO::FETCH_NUM)) {
		return 'yes';
	}else{
		return 'no';
	}
}

//检查某个用户是否收藏了指定id的商店
function check_c_storess($uid,$sid,$conn)
{
	$sql = "select * from collect_stores where uid = $uid and sid = $sid";
	$result = $conn->query($sql);
	if ($row = $result->fetch(PDO::FETCH_NUM)) {
		return 'yes';
	}else{
		return 'no';
	}
}

//检查session_token是否合法
function session_check($token,$uid,$conn)
{
	$true_uid ='';
	$sql = "select uid from sessions where session_token = '$token'";
	$result = $conn->query($sql);
	$row = $result->fetch(PDO::FETCH_NUM);
	if ($row) {
		$true_uid = $row[0];
	}else{
		over_exit("You haven't log in Pethouse! Please log in first.");
	}
	if (!($true_uid == $uid)) {
		over_exit('token error!');
	}
}

?>