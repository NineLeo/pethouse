<?php
//取出宠物详情的内容
function p_detail($detail)
{
	$insider_arr=array();
	$outer_arr=array();	
	$one = explode("： ", $detail);
	for ($i=0; $i < count($one); $i++) { 
		$two = explode("\n", $one[$i]);
		foreach ($two as $key => $value) {
			array_push($insider_arr, $value);
		}
	}
	for ($i=1; $i < 2*count($one)-2; $i=$i+2) { 
		array_push($outer_arr,$insider_arr[$i]);
	}	
	return $outer_arr;
}

//取出宠物详情的标题
function p_detail_title($detail)
{
	$insider_arr=array();
	$outer_arr=array();	
	$one = explode("： ", $detail);
	for ($i=0; $i < count($one); $i++) { 
		$two = explode("\n", $one[$i]);
		foreach ($two as $key => $value) {
			array_push($insider_arr, $value);
		}
	}
	for ($i=0; $i < 2*count($one)-2; $i=$i+2) { 
		array_push($outer_arr,$insider_arr[$i]);
	}
	return $outer_arr;
}

//删除字符串的换行 空格等
function trimall($str){
    $illegal=array(" ","　","\t","\n","\r");
    return str_replace($illegal, '', $str);   
}
