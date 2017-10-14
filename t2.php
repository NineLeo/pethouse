$_POST['session_token']

<?php
require dirname(__FILE__).'/fun/common.php';


$token = $_POST['session_token'];
session_check($token,$uid,$conn);
