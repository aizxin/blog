{% extends "layouts/admin.volt" %}
{% block css %}

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
                        {{ code }}
                        {{ msg }}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
{% endblock %}
{% block js %}
{% endblock %}
