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
                <option value="浙江" selected="">浙江省</option>
                <option value="你的工号">江西省</option>
                <option value="你最喜欢的老师">福建省</option>
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
<script type="text/javascript">
    layui.use(['form', 'layedit','lang','sow'], function(){
        var form = layui.form(),
        layer = layui.layer,
        lang = layui.lang,
        sow = layui.sow,
        $ = layui.jquery,
        layedit = layui.layedit;
        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');

        //监听提交
        form.on('submit(addPermissionStore)', function(data){
            layer.msg(JSON.stringify(data.field));
            console.log(parent.conf.vn);
            return false;
        });
        $('.layui-btn-icon').on('click',function(){
            layer.open({
                type: 2, //1:test//2:url
                title: lang.permission.icon,
                full: false,
                shadeClose: true,
                shade: 0.5,
                zIndex:99999999,
                maxmin: true, //开启最大化最小化按钮
                area: ['700px', '500px'],
                anim: 1, // 动作方向
                content: sow.U('admin/icon'),
                success:function(layero, index){}
            });
        });

    });
</script>
{% endblock %}