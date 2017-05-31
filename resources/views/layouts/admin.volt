<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>后台管理</title>
    <link href="{{ static_url('/admin/plugin/layui/css/layui.css') }}" rel="stylesheet">
    <link rel="stylesheet" href="{{ static_url('/admin/css/style.css') }}">
    <link rel="icon" href="{{ static_url('/admin/image/code.png') }}">
    {% block css %}{% endblock %}
</head>
<body>
<!-- admin -->
<div class="layui-layout layui-layout-admin"> <!-- 添加skin-1类可手动修改主题为纯白，添加skin-2类可手动修改主题为蓝白 -->
    <!-- header -->
    {% include "admin/layouts/header.volt" %}
    <!-- side -->
    {% include "admin/layouts/side.volt" %}
    <!-- body -->
    <div class="layui-body my-body">
        {% block content %}{% endblock %}
    </div>
    <!-- footer -->
    <div class="layui-footer my-footer">
        <p><a href="http://vip-admin.com" target="_blank">后台模板</a>&nbsp;&nbsp;&&nbsp;&nbsp;<a href="http://vip-admin.com/index/gather/index.html" target="_blank">管理系统</a></p>
        <p>2017 © copyright 蜀ICP备17005881号</p>
    </div>
</div>
<script type="text/javascript" src="{{ static_url('/admin/plugin/layui/layui.js') }}"></script>
<script type="text/javascript" src="{{ static_url('/admin/js/global.js') }}"></script>
<script type="text/javascript" src="{{ static_url('/admin/plugin/axios/axios.min.js') }}"></script>
<script type="text/javascript" src="{{ static_url('/admin/plugin/vue/vue.min.js') }}"></script>
{% block js %}{% endblock %}
</body>
</html>
