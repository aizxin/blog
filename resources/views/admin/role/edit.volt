{% extends "layouts/common.volt" %}
{% block css %}

{% endblock %}
{% block content %}
<form class="layui-form">
    <input type="hidden" name="<?php echo $this->security->getTokenKey() ?>"
        value="<?php echo $this->security->getToken() ?>"/>
    <input type="hidden" name="id"
        value="{{ role.id }}"/>
    <div class="layui-form-item">
        <label class="layui-form-label">{{ lang.t('role.name') }}</label>
        <div class="layui-input-inline">
            <input type="text" name="name" lay-verify="required" autocomplete="off" class="layui-input" placeholder="{{ lang.t('common.up') }}{{ lang.t('role.name') }}" value="{{ role.name }}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">{{ lang.t('role.slug') }}</label>
        <div class="layui-input-inline">
            <input type="text" name="slug" lay-verify="required" autocomplete="off" class="layui-input" placeholder="{{ lang.t('common.up') }}{{ lang.t('role.slug') }}" value="{{ role.slug }}">
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">{{ lang.t('role.description') }}</label>
        <div class="layui-input-block">
            <textarea class="layui-textarea" lay-verify="required" autocomplete="off" name="description">{{ role.slug }}</textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="addRoleStore">{{ lang.t('common.edit') }}</button>
        </div>
    </div>
</form>
{% endblock %}
{% block js %}
<script type="text/javascript" src="{{ static_url('/admin/js/static/role-add.js')}}"></script>
{% endblock %}