<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of DeptController
 *列表
 * @author 132郭浩然
 */
namespace app\hr\controller;
use think\Controller;
use think\Db;
use think\Request;


 class DeptController extends Controller{
      
    //put your code here
    function index(){
        $sql="select d1.* ,d2.dept_name as pname from oa_dept d1 left join oa_dept d2 on d1.dept_pid=d2.dept_id";
        $result= Db::query($sql);
        $result=tree($result);
        $this->assign('result', $result); 
        return $this->fetch("Dept/list");
    }

    function add() {
        $model= model('Dept');
        if(request()->isPost()){
         $data= Db::execute("insert into oa_dept(dept_name,dept_pid,dept_desc) values ('".$_POST["d_name"]."','".$_POST["d_pid"]."','".$_POST["d_desc"]."')");
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
            return $this->fetch();
        }        
    }
     public function update()
    {
        $dept= model('Dept');
        if(request()->isPost())
        {
            $id=$_POST['d_id'];
            $name=$_POST['d_name'];
            $dpid=$_POST['d_pid'];
            $txt=$_POST['d_desc'];
            $r= Db::table('oa_dept')
                    ->where('dept_id',$id)
                    ->update(['dept_name'=>$name,'dept_pid'=>$dpid,'dept_desc'=>$txt]);
            if($r>0)
            {
                $this->success("修改成功！", url('index'));
            }
            else 
            {
                $this->error("修改失败！");
            }
        } else {
        
            if(request()->isGet())
            {
                $id= request()->get('id');
                $list= Db::name('oa_dept')->find($id);
                $this->assign('list',$list);
                $this->assign('dept_name', $dept->getName());
                return $this->fetch();
            }
 }
    }
    function del() {
         if(request()->isGet())
        {
            $i=request()->get('id');
            $a=Db::table('oa_dept')->where('dept_id',$i)->delete();
            if($a>0)
            {
                $this->success("删除成功！", url('index'));
            }
            else 
            {
                $this->error("删除失败！");
            }
        }
        else 
        {
            return $this->fetch('Dept/list');
        } 
    }  
    function dels(){
        if(request()->isGet())
        {
            $ids=request()->param('ids');
            $r=db("oa_dept")->where('dept_id','in',$ids)->delete();
            if($r)
            {
              $this->success("批量删除部门成功！")  ;
                }
                else{
                    $this->error("批量删除部门失败！")  ;
                }
        }
    }
 }
