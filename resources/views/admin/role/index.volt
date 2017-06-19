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
                                            <input class="layui-input" v-model="search.name" name="name" placeholder="{{ lang._('role.name') }}">
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
                                    <button @click="addHtml()" class="layui-btn layui-btn-small layui-btn-danger ajax-all">
                                        <i class="fa fa-trash"></i>{{ lang.t('setting.save') }}
                                    </button>
                                    <button @click="allDel()" class="layui-btn layui-btn-small">
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
                                                        <col width="200">
                                                    </colgroup>
                                                    <thead>
                                                        <tr>
                                                            <th><input type="checkbox" name="" lay-skin="primary" lay-filter="allChoose"></th>
                                                            <th>{{ lang.t('common.index') }}</th>
                                                            <th>{{ lang.t('role.name') }}</th>
                                                            <th>{{ lang.t('role.slug') }}</th>
                                                            <th>{{ lang.t('role.permission') }}</th>
                                                            <th>{{ lang.t('setting.operate') }}</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr v-for="item in roles">
                                                            <td><input type="checkbox" lay-skin="primary" v-bind:value="item.id"></td>
                                                            <td v-text="item.id"></td>
                                                            <td v-text="item.name"></td>
                                                            <td v-text="item.slug"></td>
                                                            <td>
                                                                <button class="layui-btn" @click="editRoleHtml(item.id)">
                                                                    {{ lang.t('role.permission') }}
                                                                </button>
                                                            </td>
                                                            <td>
                                                                <div class="layui-btn-group">
                                                                    <button class="layui-btn layui-btn-primary layui-btn-small" @click="editHtml(item.id)"><i class="layui-icon"></i></button>
                                                                    <button class="layui-btn layui-btn-danger layui-btn-small" @click="elDel(item.id)"><i class="layui-icon"></i></button>
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
{% endblock %}
{% block js %}
<script type="text/javascript" src="{{ static_url('/admin/js/static/role.js')}}"></script>
{% endblock %}
