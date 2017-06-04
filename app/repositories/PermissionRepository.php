<?php
namespace Sow\Repositories;

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
        $paginator = new \Phalcon\Paginator\Adapter\Model(
            [
                "data"  => $this->model->find(),
                "limit" => $request->pageSize,
                "page"  => $request->page
            ]
        );
        return $paginator->getPaginate();
    }
}