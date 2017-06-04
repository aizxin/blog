<?php
namespace Sow\Repositories;

use MicheleAngioni\PhalconRepositories\AbstractRepository;
use Sow\Models\User;

class UserRepository extends AbstractRepository
{
    protected $model;

    public function __construct()
    {
        $this->model = new User();
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
        try {
            $userInfo = $this->firstBy($data);
            if($userInfo->password != setPassword($request->password)){
                throw new \Phalcon\Exception(di('lang')->_('use.login.error'));
                return false;
            }
            di('session')->set('userInfo',$userInfo);
            return $userInfo;
        } catch (\Phalcon\Exception $e) {
            throw new \Phalcon\Exception(di('lang')->_('user.login.error'));
            return false;
        }
    }
}