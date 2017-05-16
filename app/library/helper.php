<?php
// +----------------------------------------------------------------------
// | Demo [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2016 http://www.lmx0536.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: limx <715557344@qq.com> <http://www.lmx0536.cn>
// +----------------------------------------------------------------------
// | Date: 2016/11/9 Time: 9:55
// +----------------------------------------------------------------------
use Phalcon\Di\FactoryDefault as DI;

/**
 * [di desc]
 * @desc 获取容器对象
 * @author limx
 * @param $name 容器服务名
 * @return mixed
 */
if (!function_exists('di')) {
    function di($name = null, $isNew = false)
    {
        $di = DI::getDefault();
        if ($name == null) return $di;
        if ($isNew === false) return $di->getShared($name);
        return $di->get($name);
    }
}
/**
 *  [repository 业务仓库工厂]
 *  @author Sow
 *  @DateTime 2017-05-14T14:17:08+0800
 *  @param    [type]                   $repositoryName [description]
 *  @return   [type]                                   [description]
 */
if (! function_exists('repository')) {
    function repository($repositoryName){
        return (new \Sow\Repositories\RepositoryFactory())::repository($repositoryName);
    }
}

/**
* 获取.env文件下的变量值
* @param string $key
* @param null $default
* @return null|string
*/
if (! function_exists('env')) {
    function env(string $key, $default = null)
    {
        static $properties = null;
        $key = strtoupper($key);

        if (!$properties) {
            $properties = new Phalcon\Config\Adapter\Ini(BASE_PATH . '/.env');
        }
        if (isset($properties[$key]) && $properties[$key]) {
            return $properties[$key];
        } else {
            return $default;
        }
    }
}
