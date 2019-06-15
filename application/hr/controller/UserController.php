<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


namespace app\hr\controller;
use think\Controller;
use think\Db;
use think\Request;
/**
 * Description of UserController
 *
 * @author 132郭浩然
 */
class UserController extends Controller{
    //put your code here
     function index(){ 
         $data=Db::name('user')
                 ->alias('u')
                 ->field('u.*,dept_name,r.role_name')
                 ->join('oa_dept r','u.user_roleid=r.role_id','left')
                 ->join('oa_dept d','u.user_deptid=d.dept_id','left')
                  ->paginate(self::$pagesize);
         $count= Db::name("user")->count();
         $this->assign('count',$count);
         $this->assign('date',$data);
         
//        $result= Db::table('oa_user')
//                    ->select();
//        $this->assign('result', $result); 
//        return $this->fetch("User/index");
    }
     function add(){ 
         $model= model('Dept');
         
        if(request()->isPost()){
          $data= Db::table("oa_user")
                   ->insert(['user_name'=>$_POST["username"],
                     'user_nickname'=>$_POST["nickname"],'user_passwd'=>$_POST["pwd"],
                     'user_roleid'=>$_POST["d_pid"],'user_deptid'=>$_POST["d_pid"],
                     'user_sex'=>$_POST["sex"],'user_birthday'=>$_POST["birthday"],
                     'user_tel'=>$_POST["tel"],'user_email'=>$_POST["email"],
                     'user_ctime'=>$_POST["birthday"]]);
         if($data==1){
            $this->success('添加成功！',url("index"));
        }
        else {
             $this->error('添加失败！');
        }
        }
        else {
            $data=$model->getName();
            $this->assign('data',$data);
             return $this->fetch("User/add");
          //  return $this->fetch("User/add");
        }        
    }
}
