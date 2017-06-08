<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>{{ lang._('backend') }}</title>
    <link href="{{ static_url('/admin/plugin/layui/css/layui.css') }}" rel="stylesheet">
    <link rel="stylesheet" href="{{ static_url('/admin/css/login.css') }}">
    <link rel="icon" href="{{ static_url('/admin/image/code.png') }}">
</head>
<body class="beg-login-bg" >
    <div class="beg-login-box">
        <header>
            <h1>{{ lang._('backend') }}</h1>
        </header>
        <div class="beg-login-main layui-form">
            <form class="layui-form">
                <div class="layui-form-item">
                    <label class="beg-login-icon">
                        <i class="layui-icon">&#xe612;</i>
                    </label>
                     <input type="hidden" name="<?php echo $this->security->getTokenKey() ?>"
        value="<?php echo $this->security->getToken() ?>"/>
                    <input type="text" name="name" lay-verify="required" autocomplete="off" placeholder="{{ lang._('user.name') }}" class="layui-input">
                </div>
                <div class="layui-form-item">
                    <label class="beg-login-icon">
                    <i class="layui-icon">&#xe642;</i>
                </label>
                    <input type="password" name="password" lay-verify="required" autocomplete="off" placeholder="{{ lang._('user.password') }}" class="layui-input">
                </div>
                <div class="layui-form-item">
                    <div>
                    <button class="layui-input layui-btn layui-btn-primary" lay-submit lay-filter="login" style="color: #fff;font-size: 18px;">
                        {{ lang._('handle.login') }}
                    </button>
                    </div>
                    <div class="beg-clear"></div>
                </div>
            </form>
        </div>
        <footer>
            <p>技术 © <a href="https://izxin.com">Sow开发</a></p>
        </footer>
    </div>
</body>
<script type="text/javascript" src="{{ static_url('/admin/plugin/layui/layui.js') }}"></script>
<script type="text/javascript" src="{{ static_url('/admin/plugin/axios/axios.min.js') }}"></script>
<script type="text/javascript" src="{{ static_url('/admin/js/static/login.js')}}"></script>
</html>
