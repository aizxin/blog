<?php

/**
 * Shared configuration service
 */
$di->setShared('config', function () {
    return include BASE_PATH . "/config/config.php";
});

/**
 * The URL component is used to generate all kind of urls in the application
 */
$di->setShared('url', function () {
    $config = $this->getConfig();

    $url = new \Phalcon\Mvc\Url();
    $url->setBaseUri($config->application->baseUri);

    return $url;
});

/**
 * Setting up the view component
 */
$di->setShared('view', function () {
    $config = $this->getConfig();

    $view = new \Phalcon\Mvc\View();
    $view->setDI($this);
    $view->setViewsDir($config->application->viewsDir);

    $view->registerEngines([
        '.volt' => function ($view) {
            $config = $this->getConfig();
            $volt = new \Phalcon\Mvc\View\Engine\Volt($view, $this);
            $dir = $config->application->cacheDir.'/views/';
            if (!is_dir($dir)) mkdir($dir, 0777, true);
            $volt->setOptions([
                'compiledPath' => $dir,
                'compiledSeparator' => '_',
                'compileAlways' => true
            ]);
            return $volt;
        },
        '.phtml' => \Phalcon\Mvc\View\Engine\Php::class

    ]);

    return $view;
});
/**
 * Database connection is created based in the parameters defined in the configuration file
 */
$di->setShared('db', function () use ($di){
    $config = $this->getConfig();

    $class = 'Phalcon\Db\Adapter\Pdo\\' . $config->database->adapter;
    $params = [
        'host'     => $config->database->host,
        'username' => $config->database->username,
        'password' => $config->database->password,
        'dbname'   => $config->database->dbname,
        'charset'  => $config->database->charset,
        'persistent'=> true
    ];

    if ($config->database->adapter == 'Postgresql') {
        unset($params['charset']);
    }
    // 连接数据库
    $connection = new $class($params);

    if($config->database->dblisten){
        // // 打印sql日志
        $logger = $di->get('logger');

        // // 监听所有数据库事件
        $eventsManager = new \Phalcon\Events\Manager();
        // 分析底层sql性能，并记录日志
        $profiler = new Phalcon\Db\Profiler();
        $eventsManager->attach('db', function ($event, $connection) use ($profiler, $logger) {
            if($event->getType() == 'beforeQuery'){
                //在sql发送到数据库前启动分析
                $profiler->startProfile($connection->getSQLStatement());
            }
            if($event->getType() == 'afterQuery'){
                //在sql执行完毕后停止分析
                $profiler->stopProfile();
                //获取分析结果
                $profile = $profiler->getLastProfile();
                $sql = $profile->getSQLStatement();
                $params = $connection->getSqlVariables();
                (is_array($params) && count($params)) && $params = json_encode($params);
                $executeTime = $profile->getTotalElapsedSeconds();
                //日志记录
                $logger->info("{$sql} {$params} {$executeTime}");
            }
        });
        // 设置事件管理器
        $connection->setEventsManager($eventsManager);
    }

    return $connection;
});


/**
 * If the configuration specify the use of metadata adapter use it or use memory otherwise
 */
$di->setShared('modelsMetadata', function () {
    return new \Phalcon\Mvc\Model\Metadata\Memory();
});

/**
 * Register the session flash service with the Twitter Bootstrap classes
 */
$di->set('flash', function () {
    return new \Phalcon\Flash\Direct([
        'error'   => 'alert alert-danger',
        'success' => 'alert alert-success',
        'notice'  => 'alert alert-info',
        'warning' => 'alert alert-warning'
    ]);
});

/**
 * Start the session the first time some component request the session service
 */
$di->setShared('session', function () {
    $config = $this->getConfig();
    $session = null;
    switch ($config->session->type) {
        case 'redis':
            $session = new \Phalcon\Session\Adapter\Redis([
                "uniqueId"   => $config->unique_id,
                "host"       => $config->redis->host,
                "port"       => $config->redis->port,
                // "auth"       => $config->redis->auth,
                "persistent" => $config->redis->persistent,
                "lifetime"   => $config->session->lifetime,
                "prefix"     => $config->redis->prefix,
                "index"      => $config->redis->index
            ]);
            break;
        case 'file':
        default:
            $session = new \Phalcon\Session\Adapter\Files([
                "uniqueId"   => $config->unique_id,
            ]);
            break;
    }
    if($session != null){
        $session->start();
    }
    return $session;
});
/**
 * Start the session the first time some component request the session service
 */
$di->setShared('cache', function () {
    $config = $this->getConfig();
    $frontCache = new Phalcon\Cache\Frontend\Data(
        [
            "lifetime" => $config->cache->lifetime,
        ]
    );
    $cache = null;
    switch (strtolower($config->cache->type)) {
        case 'memcached':
            $cache = new \Phalcon\Cache\Backend\Libmemcached(
                $frontCache,
                [
                    "host" => env('MEMCACHED_HOST', '127.0.0.1'),
                    "port" => env('MEMCACHED_PORT', '11211'),
                    "weight" => env('MEMCACHED_WEIGHT', 1),
                    'statsKey' => '_PHCM',
                ]
            );
            break;
        case 'redis':
            $cache = new \Phalcon\Cache\Backend\Redis(
                $frontCache,
                [
                    'host' => $config->redis->host,
                    'port' => $config->redis->port,
                    // 'auth' => $config->redis->auth,
                    'persistent' => $config->redis->persistent,
                    'index' => $config->redis->index,
                    'prefix' => $config->redis->prefix,
                    'statsKey' => '_PHCM',
                ]
            );
            break;
        case 'mongo':
            $server = sprintf("mongodb://%s:%d", $config->mongo->host, $config->mongo->port);
            $cache = new \Phalcon\Cache\Backend\Mongo(
                $frontCache,
                [
                    'server' => $server,
                    'db' => $config->mongo->db,
                    'collection' => $config->mongo->collection,
                ]
            );
            break;
        case 'file':
        default:
            $dir = $config->application->cacheDir . 'data/';
            if (!is_dir($dir)) mkdir($dir, 0777, true);
            $cache = new \Phalcon\Cache\Backend\File(
                $frontCache,
                [
                    "cacheDir" => $dir,
                ]
            );
            break;
    }
    return $cache;
});
/**
 * Start the cookies
 */
$di->set( 'cookies', function(){
    $cookies = new \Phalcon\Http\Response\Cookies();
    $cookies->useEncryption( false );
    return $cookies;
 });

/**
 *  // dispatcher
 */
$di->set('dispatcher', function(){
    $eventsManager = new \Phalcon\Events\Manager();
    $eventsManager->attach("dispatch:beforeException", function($event, $dispatcher, $exception) {
        if ($event->getType() == 'beforeException') {
            switch ($exception->getCode()) {
                case \Phalcon\Dispatcher::EXCEPTION_HANDLER_NOT_FOUND:
                    $dispatcher->forward(
                        [
                            'namespace' => 'Sow\Controllers\Admin',
                            'controller' => 'error',
                            'action' => 'show404',
                        ]
                    );
                    return false;
                case \Phalcon\Dispatcher::EXCEPTION_ACTION_NOT_FOUND:
                    $dispatcher->forward(
                        [
                            'namespace' => 'Sow\Controllers\Admin',
                            'controller' => 'error',
                            'action' => 'show404',
                        ]
                    );
                    return false;
            }
        }
    });
    $dispatcher = new \Phalcon\Mvc\Dispatcher();
    $dispatcher->setEventsManager($eventsManager);
    //默认设置为前台的调度器
    // $dispatcher->setDefaultNamespace('Sow\Controllers\Home');
    return $dispatcher;
}, true);
/**
 *  日志记录
 */
$di->setShared('logger', function(){
    $config = $this->getConfig();
    $day = date('Ymd');
    $dir = $config->application->logDir . $day;
    if (!is_dir($dir)) mkdir($dir, 0777, true);
    $logger = new \Phalcon\Logger\Adapter\File($dir."/{$day}.log");
    return $logger;
});

// 语言文件
$di->set('lang', function () {
    $config = $this->getConfig();
    $language = include BASE_PATH . '/resources/lang/' . $config->locale . '.php';
    return new \Phalcon\Translate\Adapter\NativeArray(['content' => $language]);
});
