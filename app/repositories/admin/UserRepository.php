<?php
namespace Sow\Repositories\Admin;

use MicheleAngioni\PhalconRepositories\AbstractRepository;
use Sow\Models\User;
use Sow\Traits\Repository;

class UserRepository extends AbstractRepository
{
    use Repository;
    final protected function __construct()
    {
        $this->model = User::modelInit();
    }
    /**
     *  [postLogin 管理员登录]
     *  @author Sow
     *  @DateTime 2017-06-03T00:02:46+0800
     *  @param    [type]                   $request [description]
     *  @return   [type]                            [description]
     */
    public function postLogin($request)
    {
        $data['name'] = $request->name;
        $userInfo = $this->firstBy($data);
        if(!$userInfo){
            throw new \Phalcon\Exception(di('lang')->t('user.login.error'));
            return false;
        }
        if($userInfo->password != setMd5($request->password)){
            throw new \Phalcon\Exception(di('lang')->t('user.login.error'));
            return false;
        }
        di('cache')->save('userPermissions',$userInfo->getPermissions()->toArray());
        di('session')->set('userInfo',$userInfo->toArray());
        return $userInfo;
    }
}