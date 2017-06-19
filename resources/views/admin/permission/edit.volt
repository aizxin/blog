{% extends "layouts/common.volt" %}
{% block css %}

{% endblock %}
{% block content %}
<form class="layui-form">
    <div class="layui-form-item">
        <input type="hidden" name="<?php echo $this->security->getTokenKey() ?>"
        value="<?php echo $this->security->getToken() ?>"/>
        <input type="hidden" name="id"
        value="{{ permission.id }}"/>
        <label class="layui-form-label">{{ lang.t('permission.parent_id') }}</label>
        <div class="layui-input-inline">
            <select name="parent_id">
                <option value="0" <?php echo $permission->parent_id == 0?'selected':'' ?>>{{ lang.t('common.up') }}{{ lang.t('permission.parent_id') }}</option>
                {% for item in permissions %}
                    <option value="{{ item['id'] }}" <?php echo $permission->parent_id == $item['id']?'selected':'' ?>>{{item['name']}}</option>
                    {% for vo in item['child'] %}
                        <option value="{{ vo['id'] }}" <?php echo $permission->parent_id == $vo['id']?'selected':'' ?>>&nbsp;├&nbsp;{{ vo['name'] }}</option>
                    {% endfor %}
                {% endfor %}
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">{{ lang.t('permission.name') }}</label>
        <div class="layui-input-inline">
            <input type="text" name="name" lay-verify="required" autocomplete="off" class="layui-input" placeholder="{{ lang.t('common.up') }}{{ lang.t('permission.name') }}" value="{{ permission.name }}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">{{ lang.t('permission.slug') }}</label>
        <div class="layui-input-inline">
            <input type="text" name="slug" lay-verify="required" autocomplete="off" class="layui-input" placeholder="{{ lang.t('common.up') }}{{ lang.t('permission.slug') }}" value="{{ permission.slug }}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">{{ lang.t('permission.issort') }}</label>
        <div class="layui-input-inline">
            <input type="text" name="issort" lay-verify="required" autocomplete="off" class="layui-input" placeholder="{{ lang.t('common.up') }}{{ lang.t('permission.issort') }}" value="{{ permission.issort }}">
        </div>
    </div>
    <div class="layui-form-item">
          <label class="layui-form-label">{{ lang.t('permission.icon') }}</label>
          <div class="layui-input-block">
            <input type="text" name="icon" placeholder="{{ lang.t('common.up') }}{{ lang.t('permission.icon') }}" value="{{ permission.icon }}" autocomplete="off" class="layui-input-inline layui-input">
            <span class='layui-btn layui-btn-primary' style='padding:0 12px;min-width:45.2px'>
                <i id='icon-preview' style='font-size:1.2em' class='{{ permission.icon }}'></i>
            </span>
            <button type='button' data-icon='icon' class='layui-btn layui-btn-primary layui-btn-icon'>{{ lang.t('common.select') }}</button>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">{{ lang.t('permission.ismenu') }}</label>
        <div class="layui-input-block">
            <input type="checkbox" name="ismenu" lay-skin="switch" lay-text="{{ lang.t('common.yes') }}|{{ lang.t('common.no') }}" <?php echo $permission->ismenu?'checked':'' ?> />
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">{{ lang.t('permission.description') }}</label>
        <div class="layui-input-block">
            <textarea class="layui-textarea layui-hide" name="description" lay-verify="content" id="LAY_demo_editor">{{ permission.description }}</textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="addPermissionStore">{{ lang.t('common.edit') }}</button>
        </div>
    </div>
</form>
{% endblock %}
{% block js %}
<script type="text/javascript" src="{{ static_url('/admin/js/static/permission-add.js')}}"></script>
{% endblock %}