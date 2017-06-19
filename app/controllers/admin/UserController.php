<?php

namespace Sow\Controllers\Admin;

use Sow\Controllers\Admin\BaseController;
use Sow\Repositories\Admin\UserRepository;
use Sow\Validations\AuthValidation;

class UserController extends BaseController
{
    protected $uRepo;
    protected $uVa;
    public function initialize()
    {
        parent::initialize();
        $this->uRepo = UserRepository::repositoryInit();
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
            $permission = $this->uRepo->getPage($this->request->getJsonRawBody());
            return apiSuccess($permission,$this->lang->_('setting.success'));
        }
        $this->view->pick('admin/user/index');
    }
    /**
     *  [createAction 权限添加视图]
     *  @author Sow
     *  @DateTime 2017-06-09T22:00:51+0800
     *  @return   [type]                   [description]
     */
    public function createAction()
    {
        $this->view->permissions =$this->uRepo->getMenu();
        $this->view->pick('admin/permission/create');
    }
    /**
     *  [storeAction 权限添加/更新操作]
     *  @author Sow
     *  @DateTime 2017-06-11T20:08:28+0800
     *  @return   [type]                   [description]
     */
    public function storeAction()
    {
        $this->uVa = new AuthValidation();
        $request = $this->request->getJsonRawBody();
        //验证数据
        if(!$this->pVa->validator($request))
            return apiError($this->pVa->firstMessage());
        //防止攻击
        if (!$this->securityCSRF($request))
            return apiError($this->lang->t('handle.check.token'));
        try {
            $user = $this->uRepo->storePermission($request);
            $this->security->destroyToken();
            return apiSuccess(count($user),isset($request->id)?$this->lang->t('handle.update.success'):$this->lang->t('handle.create.success'));
        } catch (\Phalcon\Exception $e) {
            return apiError(isset($request->id)?$this->lang->t('handle.update.failed'):$this->lang->t('handle.create.failed'));
        }
    }
    /**
     *  [createAction 权限更新视图]
     *  @author Sow
     *  @DateTime 2017-06-09T22:00:51+0800
     *  @return   [type]                   [description]
     */
    public function editAction($id)
    {
        $this->view->permissions = $this->uRepo->getMenu();
        $this->view->permission = $this->uRepo->find($id);
        $this->view->pick('admin/permission/edit');
    }
    /**
     *  [destroyAction 删除权限]
     *  @author Sow
     *  @DateTime 2017-06-12T22:19:27+0800
     *  @param    string                   $value [description]
     *  @return   [type]                          [description]
     */
    public function destroyAction()
    {
        $request = $this->request->getJsonRawBody();
        try {
            $user = $this->uRepo->destroyPermission($request);
            return apiSuccess($user,$this->lang->t('handle.delete.success'));
        } catch (\Phalcon\Exception $e) {
            return apiError($this->lang->t('handle.delete.failed'));
        }
    }

}

