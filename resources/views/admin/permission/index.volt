{% extends "layouts/admin.volt" %}
{% block css %}
{% endblock %}
{% block content %}
<div class="layui-tab layui-tab-card my-tab" lay-filter="card" lay-allowClose="true" id="app">
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <div class="body" lay-accordion="" lay-filter="collapse">
                <div class="layui-colla-item">
                    <div class="layui-body container layui-body-index" style="padding: 16px;">
                        <section class="panel panel-padding">
                            <form class="layui-form" id="schoolsearch">
                                <div class="layui-form-item" style="margin-bottom: -4px;">
                                    <div class="layui-inline">
                                        <div class="layui-input-inline">
                                            <input class="layui-input" v-model="search.name" name="name" placeholder="{{ lang._('permission.name') }}">
                                        </div>
                                    </div>
                                    <div class="layui-inline">
                                        <button class="layui-btn" lay-submit="" lay-filter="searchPermission" type="button">{{ lang.t('setting.select') }}</button>
                                    </div>
                                </div>
                            </form>
                        </section>
                        <section class="panel panel-padding">
                                <div class="group-button body layui-show">
                                    <select v-model="search.pageSize" class="layui-btn layui-btn-small layui-btn-primary" v-on:change="changePage(search.pageSize)">
                                        <option value="15" selected>{{ lang.t('setting.page') }}</option>
                                        <option value="50">50</option>
                                        <option value="100">100</option>
                                        <option value="200">200</option>
                                    </select>
                                    <button @click="addPermission()" class="layui-btn layui-btn-small layui-btn-danger ajax-all">
                                        <i class="fa fa-trash"></i>{{ lang.t('setting.save') }}
                                    </button>
                                    <button class="layui-btn layui-btn-small">
                                        <i class="fa fa-plus-square"></i> {{ lang.t('setting.allDelete') }}
                                    </button>
                                </div>
                                <div class="layui-tab-item layui-show">
                                    <div class="body" lay-accordion="" lay-filter="collapse">
                                        <div class="layui-colla-item">
                                            <div class="container layui-form">
                                                <table class="layui-table">
                                                    <colgroup>
                                                        <col width="50">
                                                        <col width="150">
                                                        <col width="150">
                                                        <col>
                                                        <col width="200">
                                                    </colgroup>
                                                    <thead>
                                                        <tr>
                                                            <th><input type="checkbox" name="" lay-skin="primary" lay-filter="allChoose"></th>
                                                            <th>{{ lang.t('common.index') }}</th>
                                                            <th>{{ lang.t('permission.name') }}</th>
                                                            <th>{{ lang.t('permission.slug') }}</th>
                                                            <th>{{ lang.t('setting.operate') }}</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr v-for="item in permission">
                                                            <td><input type="checkbox" name="" lay-skin="primary"></td>
                                                            <td v-text="item.id"></td>
                                                            <td v-text="item.name"></td>
                                                            <td v-text="item.slug"></td>
                                                            <td>
                                                                <div class="layui-btn-group">
                                                                    <button class="layui-btn layui-btn-primary layui-btn-small" @click="edithtml(vo.id)"><i class="layui-icon"></i></button>
                                                                    <button class="layui-btn layui-btn-danger layui-btn-small" @click="elDelete(vo.id)"><i class="layui-icon"></i></button>
                                                            </div>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="text-right" id="page"></div>
                                        </div>
                                    </div>
                                </div>
                        </section>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="addForm" style="display: none">
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
</div>
{% endblock %}
{% block js %}
<script type="text/javascript" src="{{ static_url('/admin/js/static/permission.js')}}"></script>
{% endblock %}
