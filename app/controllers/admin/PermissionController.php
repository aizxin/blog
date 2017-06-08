<?php

namespace Sow\Controllers\Admin;
use Sow\Controllers\Admin\Controller;

class PermissionController extends Controller
{

    /**
     *  [indexAction 权限列表]
     *  @author Sow
     *  @DateTime 2017-06-04T16:37:46+0800
     *  @return   [type]                   [description]
     */
    public function indexAction()
    {
        if ($this->request->isPost()) {
            $permission = $this->repo('permission')->getPage($this->request->getJsonRawBody());
            return apiSuccess($permission,$this->lang->_('setting.success'));
        }
        $this->view->pick('admin/permission/index');
    }


}

