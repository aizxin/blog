<?php

namespace Sow\Controllers\Admin;

use Sow\Controllers\Admin\BaseController;
use Sow\Repositories\Admin\RoleRepository;
use Sow\Repositories\Admin\PermissionRepository;
use Sow\Validations\RoleValidation;

class RoleController extends BaseController
{
    protected $rRepo;
    protected $rVa;
    public function initialize()
    {
        parent::initialize();
        $this->rRepo = RoleRepository::repositoryInit();
    }

    /**
     *  [indexAction 角色列表]
     *  @author Sow
     *  @DateTime 2017-06-04T16:37:46+0800
     *  @return   [type]                   [description]
     */
    public function indexAction()
    {
        if ($this->request->isPost()) {
            $permission = $this->rRepo->getPage($this->request->getJsonRawBody());
            return apiSuccess($permission,$this->lang->_('setting.success'));
        }
        $this->view->pick('admin/role/index');
    }
    /**
     *  [showAction 角色权限]
     *  @author Sow
     *  @DateTime 2017-06-09T22:00:51+0800
     *  @return   [type]                   [description]
     */
    public function showAction($id)
    {
        $permission = PermissionRepository::repositoryInit();
        $this->view->id = $id;
        $this->view->permissions = $permission->getMenu();
        $permissionIds = $this->rRepo->getPermissions($id);
        $this->view->permissionIds = count($permissionIds) > 0 ? implode(',',$permissionIds):null;
        $this->view->pick('admin/role/permission');
    }
    /**
     *  [createAction 角色添加视图]
     *  @author Sow
     *  @DateTime 2017-06-09T22:00:51+0800
     *  @return   [type]                   [description]
     */
    public function createAction()
    {
        $this->view->pick('admin/role/create');
    }
    /**
     *  [storeAction 角色添加/更新操作]
     *  @author Sow
     *  @DateTime 2017-06-11T20:08:28+0800
     *  @return   [type]                   [description]
     */
    public function storeAction()
    {
        $this->rVa = new RoleValidation();

        $request = $this->request->getJsonRawBody();
        //验证数据
        if(!$this->rVa->validator($request))
            return apiError($this->rVa->firstMessage());
        //防止攻击
        if (!$this->securityCSRF($request))
            return apiError($this->lang->t('handle.check.token'));
        try {
            $res = $this->rRepo->storeRole($request);
            $this->security->destroyToken();
            return apiSuccess(count($res),isset($request->id)?$this->lang->t('handle.update.success'):$this->lang->t('handle.create.success'));
        } catch (\Phalcon\Exception $e) {
            return apiError(isset($request->id)?$this->lang->t('handle.update.failed'):$this->lang->t('handle.create.failed'));
        }
    }
    /**
     *  [createAction 角色更新视图]
     *  @author Sow
     *  @DateTime 2017-06-09T22:00:51+0800
     *  @return   [type]                   [description]
     */
    public function editAction($id)
    {
        $this->view->role = $this->rRepo->find($id);
        $this->view->pick('admin/role/edit');
    }
    /**
     *  [destroyAction 删除角色]
     *  @author Sow
     *  @DateTime 2017-06-12T22:19:27+0800
     *  @param    string                   $value [description]
     *  @return   [type]                          [description]
     */
    public function destroyAction()
    {
        $request = $this->request->getJsonRawBody();
        try {
            $res = $this->rRepo->destroyRole($request);
            return apiSuccess($res,$this->lang->t('handle.delete.success'));
        } catch (\Phalcon\Exception $e) {
            return apiError($this->lang->t('handle.delete.failed'));
        }
    }
    /**
     *  [permission 角色的权限添加/更新]
     *  @author Sow
     *  @DateTime 2017-06-18T17:56:37+0800
     *  @return   [type]                   [description]
     */
    public function permissionAction()
    {
        $request = $this->request->getJsonRawBody();
        try {
            $res = $this->rRepo->addPermission($request);
            return apiSuccess($data,$this->lang->t('handle.delete.success'));
        } catch (\Phalcon\Mvc\Model\Exception $e) {
            return apiError($e->getMessage());
            return apiError($this->lang->t('handle.delete.failed'));
        }
    }

}

