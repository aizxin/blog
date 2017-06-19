{% extends "layouts/admin.volt" %}
{% block css %}
<link rel="stylesheet" type="text/css" href="{{ static_url('/admin/plugin/thooClock/main.css') }}">
<style type="text/css" media="screen">
    @media only screen and (max-width: 560px) {
        .container canvas {
            width: 300px;
            height: 300px;
        }
    }
</style>
{% endblock %}
{% block content %}
<div class="layui-tab layui-tab-card my-tab" lay-filter="card" lay-allowClose="true">
    <ul class="layui-tab-title">
        <li class="layui-this" lay-id="0"><span>欢迎页</span></li>
    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <div class="body" lay-accordion="" lay-filter="collapse">
                <div class="layui-colla-item">
                    <div class="container">
                        <div id="myclock"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
{% endblock %}
{% block js %}
<script src="{{ static_url('/admin/plugin/thooClock/jquery-2.0.3.min.js') }}"></script>
<script src="{{ static_url('/admin/plugin/thooClock/jquery.thooClock.js') }}"></script>
<script type="text/javascript" src="{{ static_url('/admin/js/static/index.js')}}"></script>
{% endblock %}
