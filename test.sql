dbname:		bdm261699251_db 	bdm261699251.my3w.com
user:		bdm261699251
password:	mao13504

$dsn = "mysql:dbname=graduation;host=localhost";
$db_user = 'root';
$db_pass = 'root';


$dsn = "mysql:dbname=bdm261699251_db;host=bdm261699251.my3w.com";
$db_user = 'bdm261699251';
$db_pass = 'mao13504';



// 创建连接
try{
    $conn=new PDO($dsn,$db_user,$db_pass);
}catch(PDOException $e){
    echo 'DB connection failed'.$e->getMessage();
}

since_id count;

select * from statuses where mid > since_id limit count;

max_id count;

select * from statuses where mid < max_id limit count;

select * from statuses order by uid desc limit 5;


select * from statuses where mid < 5 order by mid desc limit 2

UPDATE statuses set favorite_count = 1 WHERE mid = 5

SELECT comments_statuses.*,user.* 
FROM comments_statuses   join user
WHERE mid = 3
and cid>1
and comments_statuses.uid=`user`.uid
LIMIT 10


UPDATE statuses set favorite_count = (favorite_count + 1) WHERE mid = 5
UPDATE statuses set favorite_count = 1 WHERE mid = 5

