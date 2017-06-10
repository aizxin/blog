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
    <link rel="stylesheet" href="{{ static_url('/admin/css/font-awesome.min.css') }}">
    <link rel="icon" href="{{ static_url('/admin/image/code.png') }}">
    {% block css %}{% endblock %}
</head>
<body class="body">
    {% block content %}{% endblock %}
</body>
<script type="text/javascript" src="{{ static_url('/admin/plugin/layui/layui.js') }}"></script>
<script type="text/javascript" src="{{ static_url('/admin/js/config.js') }}"></script>
<script type="text/javascript" src="{{ static_url('/admin/plugin/es6-promise/promise.min.js') }}"></script>
<script type="text/javascript" src="{{ static_url('/admin/plugin/axios/axios.min.js') }}"></script>
<script type="text/javascript" src="{{ static_url('/admin/plugin/vue2/vue.min.js') }}"></script>
<script type="text/javascript">
window.conf ={
    APP:'<?php echo env("APP_URL"); ?>'
};
</script>
{% block js %}{% endblock %}
</html>