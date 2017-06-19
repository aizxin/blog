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
        // $this->logger->info('ffffggdddfffgghhh');
        var_dump('expression');
        $this->view->disable();
    }
    public function showAction($id)
    {
        var_dump($id);
        // $this->logger->info('ffffggdddfffgghhh');
        var_dump('expression');
        $this->view->disable();
    }

    public function targetAction()
    {
        var_dump(Permission::find()->toArray());
        var_dump($this->pRepo);
        echo "路由命名测试";
    }
}

