<?php
namespace Sow\Repositories\Admin;

use MicheleAngioni\PhalconRepositories\AbstractRepository;
use Sow\Models\Permission;

class PermissionRepository extends AbstractRepository
{
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
        if(!empty($request->name)){
            $map = [
                "name like :name:",
                "bind" => [
                    "name" => '%'.$request->name.'%'
                ]
            ];
        }
        $paginator = new \Phalcon\Paginator\Adapter\Model(
            [
                "data"  => $this->model->find($map),
                "limit" => $request->pageSize,
                "page"  => $request->page
            ]
        );
        return $paginator->getPaginate();
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