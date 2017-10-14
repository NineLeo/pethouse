<?php
require dirname(__FILE__).'/fun/common.php';


$_POST['session_token'];


//检查session_token是否合法
$token = $_POST['session_token'];
session_check($token,$uid,$conn);
