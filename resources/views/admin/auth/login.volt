<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>{{ lang._('backend') }}</title>
    <link href="{{ static_url('/admin/plugin/layui/css/layui.css') }}" rel="stylesheet">
    <link rel="stylesheet" href="{{ static_url('/admin/css/style.css') }}">
    <link rel="icon" href="{{ static_url('/admin/image/code.png') }}">
</head>
<body class="login-body">
    <div class="login-main">
        <header class="layui-elip">{{ lang._('backend') }}</header>
        <form class="layui-form">
            <input type="hidden" name="<?php echo $this->security->getTokenKey() ?>"
        value="<?php echo $this->security->getToken() ?>"/>
            <div class="layui-input-inline">
                <input type="text" name="name" lay-verify="required" placeholder="{{ lang._('user.name') }}" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-input-inline">
                <input type="password" lay-verify="required|password" name="password" placeholder="{{ lang._('user.password') }}" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-input-inline login-btn">
                <button type="submit" class="layui-btn" lay-submit="" lay-filter="login">{{ lang._('handle.login') }}</button>
            </div>
        </form>
    </div>
</body>
<script type="text/javascript" src="{{ static_url('/admin/plugin/layui/layui.js') }}"></script>
<script type="text/javascript" src="{{ static_url('/admin/plugin/axios/axios.min.js') }}"></script>
<script type="text/javascript" src="{{ static_url('/admin/js/static/login.js')}}"></script>
</html>
