<?php
namespace Sow\Controllers\Admin;

use Sow\Controllers\Controller;
use Sow\Validations\AuthValidation;

class AuthController extends Controller
{
    /**
     *  [indexAction 管理员登录]
     *  @author Sow
     *  @DateTime 2017-06-04T00:52:11+0800
     *  @return   [type]                   [description]
     */
    public function indexAction()
    {
        if($this->session->has('userInfo')){
            $this->response->redirect('admin/index');
        }
        if ($this->request->isPost()) {
            $request = $this->request->getJsonRawBody();
            try {
                validate('auth')->validator($request);
                try {
                    $user = $this->repo->getModel('user')->postLogin($request);
                    return apiSuccess(count($user),$this->lang->_('user.login.success'));
                } catch (\Phalcon\Exception $e) {
                    return apiError($e->getMessage());
                }
            } catch (\Phalcon\Validation\Exception $ex) {
                return apiError($ex->getMessage());
            }
        }
        $this->view->pick('admin/auth/login');
    }
    /**
     *  [logoutAction 管理员退出]
     *  @author Sow
     *  @DateTime 2017-06-04T01:06:18+0800
     *  @return   [type]                   [description]
     */
    public function logoutAction()
    {
         // 删除session变量
        $this->session->remove("userInfo");
        $this->response->redirect('admin/auth');
    }

}

