<?php
namespace Sow\Controllers\Admin;
use Sow\Controllers\Admin\Controller;

class IndexController extends Controller
{
    public function indexAction()
    {
        // var_dump('expression');
        $user = $this->repo->getModel('user')->find(1);
        $pes = $user->getPermissions();
        var_dump($pes->toArray());
        // return apiSuccess($pes,$this->lang->_('user.login.success'));
        $this->view->disable();
        $this->view->pick('admin/index/index');
        // return $this->view->render('admin', 'index');
    }

}

