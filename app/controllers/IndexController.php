<?php
namespace Aizxin\Controllers;
use Aizxin\Controllers\Controller;

class IndexController extends Controller
{
    public function indexAction()
    {
        // var_dump(repository('user')->find(1)->toArray());
        // var_dump(di('userRepo')->find(1)->toArray());
        di('logger')->info("This is an info message");
        // 取消  默认视图
        $this->view->disable();
        echo 'ddd';
    }

}

