<?php
namespace app\index\controller;
use think\Controller;
use think\Request;

 class Index extends Controller
{
    public function hello($name='thinkphp')
    {
        $this->assign('name',$name);
        return $this->fetch();
    } 
}
