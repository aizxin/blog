{% extends "layouts/admin.volt" %}
{% block css %}
{% endblock %}
{% block content %}
<div class="layui-tab layui-tab-card my-tab" lay-filter="card" lay-allowClose="true">
    <div class="layui-tab-content" style="padding: 16px;">
        <div class="larry-wrapper">
            <section class="panel panel-padding">
                <form class="layui-form" id="schoolsearch">
                    <div class="layui-form-item" style="margin-bottom: -4px;">
                        <div class="layui-inline">
                            <div class="layui-input-inline">
                                <input class="layui-input" name="name" placeholder="441">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <button class="layui-btn" lay-submit="" lay-filter="searchSchool" type="button">{{ lang._('setting.select') }}</button>
                        </div>
                    </div>
                </form>
            </section>
            <section class="panel panel-padding">
                <div class="group-button body">
                    <select class="layui-btn layui-btn-small layui-btn-primary">
                        <option value="15" selected>{{ lang._('setting.page') }}</option>
                        <option value="50">50</option>
                        <option value="100">100</option>
                        <option value="200">200</option>
                    </select>
                    <button class="layui-btn layui-btn-small layui-btn-danger ajax-all">
                        <i class="fa fa-trash"></i>{{ lang._('setting.save') }}
                    </button>
                    <button class="layui-btn layui-btn-small">
                        <i class="fa fa-plus-square"></i> {{ lang._('setting.allDelete') }}
                    </button>
                </div>
                <div class="layui-tab-item layui-show">
                    <div class="body" lay-accordion="" lay-filter="collapse">
                        <div class="layui-colla-item">
                            <div class="container">
                                <table class="layui-table">
                                    <colgroup>
                                        <col width="150">
                                        <col width="150">
                                        <col width="200">
                                        <col>
                                        <col width="200">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>人物</th>
                                            <th>民族</th>
                                            <th>出场时间</th>
                                            <th>格言</th>
                                            <th>{{ lang._('setting.operate') }}</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>贤心</td>
                                            <td>汉族</td>
                                            <td>1989-10-14</td>
                                            <td>人生似修行</td>
                                            <td>删除</td>
                                        </tr>
                                        <tr>
                                            <td>张爱玲</td>
                                            <td>汉族</td>
                                            <td>1920-09-30</td>
                                            <td>于千万人之中遇见你所遇见的人，于千万年之中，时间的无涯的荒野里…</td>
                                            <td>删除</td>
                                        </tr>
                                        <tr>
                                            <td>Helen Keller</td>
                                            <td>拉丁美裔</td>
                                            <td>1880-06-27</td>
                                            <td> Life is either a daring adventure or nothing.</td>
                                            <td>删除</td>
                                        </tr>
                                        <tr>
                                            <td>岳飞</td>
                                            <td>汉族</td>
                                            <td>1103-北宋崇宁二年</td>
                                            <td>教科书再滥改，也抹不去“民族英雄”的事实</td>
                                            <td>删除</td>
                                        </tr>
                                        <tr>
                                            <td>孟子</td>
                                            <td>华夏族（汉族）</td>
                                            <td>公元前-372年</td>
                                            <td>猿强，则国强。国强，则猿更强！ </td>
                                            <td>删除</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</div>
{% endblock %}
{% block js %}
<script type="text/javascript">
axios.post('/admin/permission', {pageSize:20,page:1})
.then(function(response) {
    console.log(response)
}).catch(function(error) {
    console.log(error);
});
</script>
{% endblock %}
