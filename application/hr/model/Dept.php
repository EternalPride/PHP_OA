<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Dept
 *
 * @author Hasee
 */
namespace app\hr\model;
use think\Db;
class Dept extends \think\Model{
    function getName(){
        $data=Db::name('oa_dept')->select();
        return tree($data);
    }
}
