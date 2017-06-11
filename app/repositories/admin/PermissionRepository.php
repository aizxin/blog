<?php
namespace Sow\Repositories\Admin;

use MicheleAngioni\PhalconRepositories\AbstractRepository;
use Sow\Models\Permission;
use Sow\Traits\Repository;
class PermissionRepository extends AbstractRepository
{
    use Repository;
    protected $model;

    public function __construct()
    {
        $this->model = new Permission();
    }
    /**
     *  [getPage 获取分页数据]
     *  @author Sow
     *  @DateTime 2017-06-04T17:21:56+0800
     *  @param    [type]                   $request [description]
     *  @return   [type]                            [description]
     */
    public function getPage($request)
    {
        $map = [];
        if(!empty($request->name))
            $map['name'] = ['%'.$request->name.'%', 'LIKE'];
        return $this->getPaginate($map,$request);
    }
    /**
     *  [getParent 顶级权限]
     *  @author Sow
     *  @DateTime 2017-06-11T10:58:19+0800
     *  @return   [type]                   [description]
     */
    public function getMenu()
    {
        if(di('cache')->exists('permissionMenu'))
            return di('cache')->get('permissionMenu');
        $permission = sort_parent($this->getBy(['ismenu'=>1])->toArray());
        di('cache')->save('permissionMenu',$permission);
        return $permission;

    }
    /**
     *  [findById getModelsManager 测试]
     *  @author Sow
     *  @DateTime 2017-06-08T21:17:00+0800
     *  @param    [type]                   $aid [description]
     *  @return   [type]                        [description]
     */
    public function findById($aid){
        $aid = intval($aid);
        if($aid <= 0){
            throw new \Exception('参数错误');
        }
        $phql = "SELECT * FROM \Sow\Models\Permission WHERE id = :aid: ";
        $result = $this->model->getModelsManager()->executeQuery($phql, array(
            'aid' => $aid
        ));
        return $result->toArray();
    }
}