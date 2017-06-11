<?php

namespace Sow\Controllers\Admin;
use Sow\Controllers\Admin\Controller;
use Sow\Repositories\Admin\PermissionRepository;

class PermissionController extends Controller
{
    protected $pRepo;
    public function initialize()
    {
        parent::initialize();
        $this->pRepo = new PermissionRepository();
    }

    /**
     *  [indexAction 权限列表]
     *  @author Sow
     *  @DateTime 2017-06-04T16:37:46+0800
     *  @return   [type]                   [description]
     */
    public function indexAction()
    {
        if ($this->request->isPost()) {
            $permission = $this->pRepo->getPage($this->request->getJsonRawBody());
            return apiSuccess($permission,$this->lang->_('setting.success'));
        }
        $this->view->pick('admin/permission/index');
    }
    /**
     *  [createAction 权限添加视图]
     *  @author Sow
     *  @DateTime 2017-06-09T22:00:51+0800
     *  @return   [type]                   [description]
     */
    public function createAction()
    {
        $this->view->permission =$this->pRepo->getMenu();
        $this->view->pick('admin/permission/create');
    }

}

