<?php

/**
 * 业务仓库工厂
 */

namespace Sow\Repositories;

class RepositoryFactory{
    /**
     * 仓库对象容器
     * @var array
     */
    private static $_repositories = array();

    protected $modelName;

    public function __construct($modelName)
    {
        $this->modelName = $modelName;
        return $this->getModel($this->modelName);
    }


    /**
     * 获取仓库对象
     * @param $repositoryName
     * @return object
     * @throws \Exception
     */
    public static function getModel($repositoryName){
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
