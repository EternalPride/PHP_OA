<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
use think\Db;
namespace app\hr\controller;

/**
 * Description of ValidateController
 *
 * @author 132郭浩然
 *  */
class ValidateController extends \think\Controller{
    //put your code here
    function lsk_username(){
        $username= request()->param("username");
        $r= \think\Db::name("oa_user")->where('user_name',$username)->find();
        if($r){
            echo '用户已存在';
        }
 else {
            echo ''; 
 }
    }
}
