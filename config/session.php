<?php

use Phalcon\Session\Adapter\Files as SessionAdapter;
use Phalcon\Session\Adapter\Redis as SessionRedis;

if ($config->session->type !== false) {
    $session = null;
    switch ($config->session->type) {
        case 'redis':
            $session = new SessionRedis([
                'uniqueId' => $config->unique_id,
                'host' => $config->redis->host,
                'port' => $config->redis->port,
                'auth' => $config->redis->auth,
                'persistent' => $config->redis->persistent,
                'lifetime' => 3600,
                'prefix' => ':session:',
                'index' => $config->redis->index,
            ]);
            break;

        case 'file':
        default:
            $session = new SessionAdapter();
            break;
    }
    if ($session !== null) {
        $session->start();
        $di->setShared('session', function () use ($session) {
            return $session;
        });
    }
}


