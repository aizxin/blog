<?php
namespace Sow\Controllers\Home;

use Sow\Controllers\Controller;


class IndexController extends Controller
{
    /**
     * 初始化
     */
    public function onConstruct(){
    }
    /**
     * 资源初始化
     */
    public function initialize() {
    }
    public function indexAction()
    {
       var_dump($this->repo('user')->find(1)->toArray());
        $this->logger->info('ffffggdddfffgghhh');
        $this->view->disable();
    }
    public function targetAction()
    {
        var_dump($this->repo('Permission')->all()->toArray());
        var_dump(Permission::find()->toArray());
        var_dump($this->pRepo);
        echo "路由命名测试";
    }
}

