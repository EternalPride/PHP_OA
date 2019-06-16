<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\hr\controller;

/**
 * Description of LoginController
 *
 * @author 浩然
 */
class LoginController extends \think\Controller{
    //put your code here
    function login()
    {
        return $this->fetch();
    }
}
