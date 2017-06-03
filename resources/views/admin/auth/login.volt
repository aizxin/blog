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
                <input type="text" name="name" placeholder="{{ lang._('user.name') }}" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-input-inline">
                <input type="password" name="password" placeholder="{{ lang._('user.password') }}" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-input-inline login-btn">
                <button type="button" class="layui-btn" lay-submit="" lay-filter="login">{{ lang._('handle.login') }}</button>
            </div>
        </form>
    </div>
</body>
<script type="text/javascript" src="{{ static_url('/admin/plugin/layui/layui.js') }}"></script>
<script type="text/javascript" src="{{ static_url('/admin/plugin/axios/axios.min.js') }}"></script>
<script type="text/javascript">
    layui.use(['form', 'layer'], function () {
        var $ = layui.jquery,form = layui.form(),layer = layui.layer;
        // 验证
        form.verify({
            password: [/(.+){6,12}$/, '密码必须6到12位']
        });
        // 提交监听
        form.on('submit(login)', function (data) {
            axios.post('/admin/auth', data.field)
            .then(function(response) {
                console.log(response)
            }).catch(function(error) {
                console.log(error);
            });
            // $.post('/admin/auth', data.field, function (response) {
            //     console.log(response)
            // }, "json");
            // layer.alert(JSON.stringify(data.field), {
            //     title: '最终的提交信息'
            // });
            return false;
        })
    });
</script>
</html>
