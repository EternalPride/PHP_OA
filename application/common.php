<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件
function tree($arr,$pid=0,$level=0){
    static $result= array();
    foreach ($arr as $value) {
        if($value['dept_pid']==$pid)
        {
            $value['level']=$level;
            $result[]=$value;
            tree($arr,$value['dept_id'],$level+1);
        }
    }
    return $result;
}