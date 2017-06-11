<?php
namespace Sow\Traits;

trait Repository
{
    /**
     *  [getPaginate 获取分页数据]
     *  @author Sow
     *  @DateTime 2017-06-08T19:23:38+0800
     *  @param    [type]                   $request [description]
     *  @return   [type]                            [description]
     */
    public function getPaginate($map,$request)
    {
        // if(!empty($request->name)){
        //     $map = [
        //         "name like :name:",
        //         "bind" => [
        //             "name" => '%'.$request->name.'%'
        //         ]
        //     ];
        // }
        // $paginator = new \Phalcon\Paginator\Adapter\Model(
        //     [
        //         "data"  => $this->model->find($map),
        //         "limit" => $request->pageSize,
        //         "page"  => $request->page
        //     ]
        // );
        $paginator = new \Phalcon\Paginator\Adapter\Model(
            [
                "data"  => $this->getBy($map),
                "limit" => isset($request->pageSize)?$request->pageSize:15,
                "page"  => isset($request->page)?$request->page:1
            ]
        );
        return $paginator->getPaginate();
    }
}