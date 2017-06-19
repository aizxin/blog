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
                        <div class="my-page-box">
                            <h3>404</h3>
                            <p class="msg">Page Not Found</p>
                            <p class="text">对不起,没有找到您所需要的页面,可能是URL不确定,或者页面已被移除。</p>
                            <div class="my-btn-box">
                                <a class="layui-btn layui-btn-small" href="javascript:;">返回首页</a>
                                <a class="layui-btn layui-btn-danger layui-btn-small " href="javascript:;">返回上页</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
{% endblock %}
{% block js %}
{% endblock %}
