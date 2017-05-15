<?php
namespace Aizxin\Controllers;
use Aizxin\Controllers\Controller;
use Phalcon\Session\Adapter\Redis;
class IndexController extends Controller
{
    public function indexAction()
    {
         $this->cache->save('my-data', [1, 2, 3, 4, 5]);

        var_dump($this->cache->get('my-data'));
        // di('logger')->info("This is an info message");
        // 取消  默认视图
        $this->view->disable();
        echo 'ddd';
    }

}

