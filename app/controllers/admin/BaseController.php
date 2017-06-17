<?php
namespace Sow\Controllers\Admin;
use Sow\Controllers\Controller;

class BaseController extends Controller
{
    public function initialize(){
        $this->authCheck();
        $this->menu();
    }
    /**
     *  [beforeExecuteRoute 动作前执行]
     *  @author Sow
     *  @DateTime 2017-06-17T11:16:49+0800
     *  @return   [type]                   [description]
     */
    public function beforeExecuteRoute()
    {
        // 在每一个找到的动作前执行
        // var_dump('ffff222');
        // $this->logger->info('ffffggdddfffgghhh');
    }
    /**
     *  [afterExecuteRoute 动作后执行]
     *  @author Sow
     *  @DateTime 2017-06-17T11:16:55+0800
     *  @return   [type]                   [description]
     */
    public function afterExecuteRoute()
    {
        // 在每一个找到的动作后执行
        // var_dump('ffffeee222');
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
    /**
     *  [menu 左侧菜单]
     *  @author Sow
     *  @DateTime 2017-06-14T22:24:08+0800
     *  @return   [type]                   [description]
     */
    public function menu()
    {
        $action = $this->dispatcher->getActionName();
        $url = $this->router->getRewriteUri();
        $url = substr($url,1);
        $menu = $this->cache->get('userPermissions');
        $this->view->parentId = 999;
        $this->view->id = 999;
        foreach ($menu as $kv) {
            if($kv['slug'] == $url){
                $this->view->parentId = $kv['parent_id'];
                $this->view->id = $kv['id'];
            }
        }
        $this->view->menu = sort_parent($menu);
    }

}

