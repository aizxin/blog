{% extends "layouts/common.volt" %}
{% block css %}

{% endblock %}
{% block content %}
<form class="layui-form">
    <div class="layui-form-item">
        <label class="layui-form-label">{{ lang.t('permission.parent_id') }}</label>
        <div class="layui-input-inline">
            <select name="parent_id">
                <option value="0" selected>{{ lang.t('common.up') }}{{ lang.t('permission.parent_id') }}</option>
                {% for item in permission %}
                    <option value="{{ item['id'] }}">{{item['name']}}</option>
                    {% for vo in item['child'] %}
                        <option value="{{ vo['id'] }}">&nbsp;├&nbsp;{{ vo['name'] }}</option>
                    {% endfor %}
                {% endfor %}
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">{{ lang.t('permission.name') }}</label>
        <div class="layui-input-inline">
            <input type="text" name="name" lay-verify="required" autocomplete="off" class="layui-input" placeholder="{{ lang.t('common.up') }}{{ lang.t('permission.name') }}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">{{ lang.t('permission.slug') }}</label>
        <div class="layui-input-inline">
            <input type="text" name="slug" lay-verify="required" autocomplete="off" class="layui-input" placeholder="{{ lang.t('common.up') }}{{ lang.t('permission.slug') }}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">{{ lang.t('permission.issort') }}</label>
        <div class="layui-input-inline">
            <input type="text" name="issort" lay-verify="required" autocomplete="off" class="layui-input" value="55" placeholder="{{ lang.t('common.up') }}{{ lang.t('permission.issort') }}">
        </div>
    </div>
    <div class="layui-form-item">
          <label class="layui-form-label">{{ lang.t('permission.icon') }}</label>
          <div class="layui-input-block">
            <input type="text" name="icon" placeholder="{{ lang.t('common.up') }}{{ lang.t('permission.icon') }}" autocomplete="off" class="layui-input-inline layui-input">
            <span class='layui-btn layui-btn-primary' style='padding:0 12px;min-width:45.2px'>
                <i id='icon-preview' style='font-size:1.2em' class=''></i>
            </span>
            <button type='button' data-icon='icon' class='layui-btn layui-btn-primary layui-btn-icon'>{{ lang.t('common.select') }}</button>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">{{ lang.t('permission.ismenu') }}</label>
        <div class="layui-input-block">
            <input type="checkbox" name="ismenu" lay-skin="switch" lay-filter="switchTest" lay-text="{{ lang.t('common.no') }}|{{ lang.t('common.yes') }}">
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">{{ lang.t('permission.description') }}</label>
        <div class="layui-input-block">
            <textarea class="layui-textarea layui-hide" name="description" lay-verify="content" id="LAY_demo_editor"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="addPermissionStore">{{ lang.t('setting.save') }}</button>
            <button type="reset" class="layui-btn layui-btn-primary">{{ lang.t('common.reset') }}</button>
        </div>
    </div>
</form>
{% endblock %}
{% block js %}
<script type="text/javascript" src="{{ static_url('/admin/js/static/permission-add.js')}}"></script>
{% endblock %}