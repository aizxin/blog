<?php
namespace Sow\Traits;

trait Repository
{
    /**
     *  [$model description]
     *  @var [type]
     */
    protected $model;
    /**
     *  [$_repo 单例]
     *  @var null
     */
    private static $_repo = null;
    /**
     *  [repositoryInit 单例的初始化]
     *  @author Sow
     *  @DateTime 2017-06-17T15:58:13+0800
     *  @return   [type]                   [description]
     */
    public static function repositoryInit(){
        if(self::$_repo === null){
            self::$_repo = new self();
        }
        return self::$_repo;
    }
    /**
     *  [getPaginate 获取分页数据]
     *  @author Sow
     *  @DateTime 2017-06-08T19:23:38+0800
     *  @param    [type]                   $request [description]
     *  @return   [type]                            [description]
     */
    public function getPaginate($map,$request)
    {
        $paginator = new \Phalcon\Paginator\Adapter\Model(
            [
                "data"  => $this->getBy($map),
                "limit" => isset($request->pageSize)?$request->pageSize:15,
                "page"  => isset($request->page)?$request->page:1
            ]
        );
        return $paginator->getPaginate();
    }
    final protected function __clone()
    {

    }
}