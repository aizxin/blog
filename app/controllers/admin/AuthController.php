<?php
namespace Sow\Controllers\Admin;

use Sow\Controllers\Controller;
use Sow\Validations\AuthValidation;
use Sow\Traits\Controller as ControllerTraits;
use Sow\Repositories\Admin\UserRepository;

class AuthController extends Controller
{
    use ControllerTraits;
    protected $uRepo;
    protected $aVa;
    public function initialize()
    {
        $this->uRepo = new UserRepository();
        $this->aVa = new AuthValidation();
    }
    /**
     *  [indexAction 管理员登录]
     *  @author Sow
     *  @DateTime 2017-06-04T00:52:11+0800
     *  @return   [type]                   [description]
     */
    public function indexAction()
    {
        if($this->session->has('userInfo'))
            $this->response->redirect('admin/index');
        if ($this->request->isPost()) {
            $request = $this->request->getJsonRawBody();
            //验证数据
            if(!$this->aVa->validator($request))
                return apiError($this->aVa->firstMessage());
            //防止攻击
            if (!$this->securityCSRF($request))
                return apiError($this->lang->t('handle.check.token'));
            try {
                $user = $this->uRepo->postLogin($request);
                $this->security->destroyToken();
                return apiSuccess(count($user),$this->lang->t('user.login.success'));
            } catch (\Phalcon\Exception $e) {
                return apiError($e->getMessage());
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
        // 删除用户的权限cache
        $this->cache->delete("userPermissions");
        $this->response->redirect('admin/auth');
    }

}

