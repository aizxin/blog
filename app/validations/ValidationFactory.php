<?php

/**
 * 验证仓库工厂
 */

namespace Sow\Validations;

class ValidationFactory{

    /**
     * 仓库对象容器
     * @var array
     */
    private static $_validation = array();

    /**
     * 获取仓库对象
     * @param $validationName
     * @return object
     * @throws \Exception
     */
    public static function getValidator($validationName){
        $validationName = __NAMESPACE__ . "\\" . ucfirst($validationName.'Validation');
        if(!class_exists($validationName)){
            throw new \Exception("{$validationName}类不存在");
        }
        if(!isset(self::$_validation[$validationName]) || empty(self::$_validation[$validationName])){
            self::$_validation[$validationName] = new $validationName();
        }
        return self::$_validation[$validationName];
    }
}
