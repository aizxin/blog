<?php
// +----------------------------------------------------------------------
// | ERROR 控制器 [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2016 http://www.lmx0536.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: limx <715557344@qq.com> <http://www.lmx0536.cn>
// +----------------------------------------------------------------------
// | Date: 2016/11/15 Time: 15:13
// +----------------------------------------------------------------------
namespace Sow\Controllers\Admin;

use Sow\Controllers\Admin\Controller;

class ErrorController extends Controller
{

    public function indexAction($code = '500', $msg = '出错了')
    {
        $this->view->code = $code;
        $this->view->msg = $msg;
        $this->view->pick('admin/public/error');
    }
    public function show404Action()
    {
        if ($this->request->isPost()) {
            return error('页面找不到了~');
        }
        $this->view->pick('admin/public/404');
    }
}