<?php
/*
 * Modified: prepend directory path of current file, because of this file own different ENV under between Apache and command line.
 * NOTE: please remove this comment.
 */
defined('BASE_PATH') || define('BASE_PATH', getenv('BASE_PATH') ?: realpath(dirname(__FILE__) . '/../..'));
defined('APP_PATH') || define('APP_PATH', BASE_PATH . '/app');

return new \Phalcon\Config([

    /*
    |--------------------------------------------------------------------------
    | Application Timezone
    |--------------------------------------------------------------------------
    |
    | Here you may specify the default timezone for your application, which
    | will be used by the PHP date and date-time functions. We have gone
    | ahead and set this to a sensible default for you out of the box.
    |
    */
    'timezone' => 'PRC',

    /*
    |--------------------------------------------------------------------------
    | Application Locale Configuration
    |--------------------------------------------------------------------------
    |
    | The application locale determines the default locale that will be used
    | by the translation service provider. You are free to set this value
    | to any of the locales which will be supported by the application.
    |
    */

    'locale' => 'zh-cn',

    'application' => [
        'appDir'         => APP_PATH . '/',
        'controllersDir' => APP_PATH . '/controllers/',
        'modelsDir'      => APP_PATH . '/models/',
        'migrationsDir'  => APP_PATH . '/migrations/',
        'viewsDir'       => BASE_PATH . '/resources/views/',
        'pluginsDir'     => APP_PATH . '/plugins/',
        'libraryDir'     => APP_PATH . '/library/',
        'cacheDir'       => BASE_PATH . '/storage/cache/',
        'logDir' => BASE_PATH . '/storage/log/',

        // This allows the baseUri to be understand project paths that are not in the root directory
        // of the webpspace.  This will break if the public/index.php entry point is moved or
        // possibly if the web server rewrite rules are changed. This can also be set to a static path.
        'baseUri'        => '/',//preg_replace('/public([\/\\\\])index.php$/', '', $_SERVER["PHP_SELF"]),

        'repositoriesDir' => APP_PATH . '/repositories/',
        'servicesDir'     => APP_PATH . '/services/',
        'validationsDir'   => APP_PATH . '/validations/',
        'traitsDir'       => APP_PATH . '/traits/',

    ],
    /**
     *  databases
     */
    'database' => [
        'adapter'     => env('DB_CONNECTION','Mysql'),
        'host'        => env('DB_HOST','127.0.0.1'),
        'username'    => env('DB_USERNAME','secret'),
        'password'    => env('DB_PASSWORD','secret'),
        'dbname'      => env('DB_DATABASE','secret'),
        'charset'     => 'utf8',
        'dbport'      => env('DB_PORT', '3306')
    ],
    'redis' => [
        'host' => env('REDIS_HOST', '127.0.0.1'),
        'port' => env('REDIS_PORT', '6379'),
        'auth' => env('REDIS_AUTH', null),
        'persistent' => env('REDIS_PERSISTENT', false),
        'index' => env('REDIS_INDEX', 0),
        'prefix' => env('REDIS_PREFIX', ''),
    ],
    'mongo' => [
        'host' => env('MONGODB_HOST', '127.0.0.1'),
        'port' => env('MONGODB_PORT', '27017'),
        'connect' => env('MONGODB_CONNECT', true),
        'timeout' => env('MONGODB_TIMEOUT', null),
        'replicaSet' => env('MONGODB_REPLICA_SET', null),
        'username' => env('MONGODB_USERNAME', null),
        'password' => env('MONGODB_PASSWORD', null),
        'db' => env('MONGODB_DB', null),
        'collection' => env('MONGODB_COLLECTION', null),
        // 是否开启Mongo辅助类
        'utils' => env('MONGODB_UTILS', false),
    ],
    /*
    |--------------------------------------------------------------------------
    | Unique_id Environment
    |--------------------------------------------------------------------------
    |
    | This value is your-private-app for this project.
    |
    */
    'unique_id' => env('UNIQUE_ID', 'phalcon'),
    /*
    |--------------------------------------------------------------------------
    | Cache Environment
    |--------------------------------------------------------------------------
    |
    | The default setting is file.
    | If you want to use redis ,you must set type=redis,
    |
    */
    'cache' => [
        'type' => env('CACHE_DRIVER', 'file'),
        'lifetime' => 172800,
    ],

    /*
    |--------------------------------------------------------------------------
    | SESSION Environment
    |--------------------------------------------------------------------------
    |
    | The default setting is file.
    | If you want to use redis ,you must set type=redis,
    |
    */
    'session' => [
        'type' => env('SESSION_DRIVER', 'file'),
        'lifetime' => 172800,
    ],

    /*
    |--------------------------------------------------------------------------
    | COOKIES Environment
    |--------------------------------------------------------------------------
    |
    | isCrypt::是否加密 默认值false.
    |
    */
    'cookies' => [
        'isCrypt' => env('COOKIE_ISCRYPT', false)
    ],

    /*
    |--------------------------------------------------------------------------
    | CRYPT Environment
    |--------------------------------------------------------------------------
    |
    | key::The secret key.
    |
    */
    'crypt' => [
        'key' => env('CRYPT_KEY', 'phalcon-project-cookie->key')
    ],
]);
