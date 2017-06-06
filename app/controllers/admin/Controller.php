<?php
namespace Sow\Controllers\Admin;
use Sow\Controllers\Controller as BaseController;

class Controller extends BaseController
{
    public function initialize(){
        $this->authCheck();
    }
    /**
     *  [authCheck 判断管理员是否登录]
     *  @author Sow
     *  @DateTime 2017-06-04T00:39:26+0800
     *  @return   [type]                   [description]
     */
    public function authCheck()
    {
        if(!$this->session->has('userInfo')){
            $this->response->redirect('admin/auth');
        }
    }

}

