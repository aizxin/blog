<?php

/**
 * 业务仓库工厂
 */

namespace Sow\Repositories;

class RepositoryFactory{

    private static $_repo = null;
    /**
     * 仓库对象容器
     * @var array
     */
    private static $_repositories = array();

    final protected function __construct()
    {

    }
    final protected function __clone()
    {

    }
    public static function repositoryInit(){
        if(self::$_repo === null){
            self::$_repo = new self();
        }
        return self::$_repo;
    }
    /**
     * 获取仓库对象
     * @param $repositoryName
     * @return object
     * @throws \Exception
     */
    public function getRepository($repositoryName){
        $repositoryName = __NAMESPACE__ . "\\" . ucfirst($repositoryName.'Repository');
        if(!class_exists($repositoryName)){
            throw new \Exception("{$repositoryName}类不存在");
        }
        if(!isset(self::$_repositories[$repositoryName]) || empty(self::$_repositories[$repositoryName])){
            self::$_repositories[$repositoryName] = new $repositoryName();
        }
        return self::$_repositories[$repositoryName];
    }
}
