{% extends "layouts/common.volt" %}
{% block css %}
<style type="text/css" media="screen">
.layui-tree li i {
    padding-left: 2px;
    color: #fff;
}
ul.ztree li span.button.switch {
    margin-right: 5px
}

ul.ztree ul ul li {
    display: inline-block;
    white-space: normal
}

ul.ztree>li>ul>li {
    padding: 2px
}
ul.ztree>li>ul {
    margin-top: 2px
}

ul.ztree>li {
    padding: 2px;
    padding-right: 25px
}

ul.ztree li {
    white-space: normal!important
}

ul.ztree>li>a>span {
    font-size: 15px;
    font-weight: 700
}

.ztree li {
    padding: 2px;
    margin: 0;
    list-style: none;
    line-height: 14px;
    text-align: left;
    white-space: nowrap;
    outline: 0;
}

.ztree li ul {
    margin: 0;
    padding: 5px 0 0 18px;
}
</style>
{% endblock %}
{% block content %}
<form class="layui-form">
    <div class="layui-form-item">
        <input type="hidden" name="id" value="{{ id }}">
        <input type="hidden" id="permissionIds" value="{{ permissionIds }}">
        <ul id="ztree" class="layui-box layui-tree ztree loading">
        {% for item in permissions %}
            <li><a><cite><input type="checkbox" name="role{{ item['id'] }}" id="role{{item['id']}}" title="{{item['name']}}" value="{{item['id']}}" lay-filter="role" lay-skin="primary"/></cite></a>
                <ul class="layui-show">
                {% for vo in item['child'] %}
                    <li><a><cite><input type="checkbox" id="role{{vo['id']}}" name="role{{vo['id']}}" title="{{vo['name']}}" value="{{vo['id']}}" lay-filter="role" lay-skin="primary"/></cite></a>
                        <ul class="layui-show">
                        {% for v in vo['child'] %}
                            <li><a><cite><input id="role{{v['id']}}" type="checkbox" name="role{{v['id']}}" title="{{v['name']}}" value="{{v['id']}}" lay-filter="role" lay-skin="primary"/></a></li>
                        {% endfor %}
                        </ul>
                    </li>
                {% endfor %}
                </ul>
            </li>
        {% endfor %}
        </ul>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            {% if permissionIds != null %}
            <button class="layui-btn" lay-submit="" lay-filter="addRolePermissionStore">{{ lang.t('common.edit') }}</button>
            {% else %}
            <button class="layui-btn" lay-submit="" lay-filter="addRolePermissionStore">{{ lang.t('setting.save') }}</button>
            {% endif %}
        </div>
    </div>
</form>
{% endblock %}
{% block js %}
<script type="text/javascript" src="{{ static_url('/admin/js/static/role-add.js')}}"></script>
{% endblock %}