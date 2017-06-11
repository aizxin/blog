layui.use(['sow', 'lang', 'form', 'laypage'], function() {
    var lang = layui.lang,
        sow = layui.sow,
        $ = layui.jquery
        form = layui.form();
    $(function() {
        window.conf.vn = new Vue({
            el: '#app',
            data: {
                permission: [],
                pages: 0,
                search: {
                    pageSize: 15
                }
            },
            created: function() {
                this.list();
            },
            methods: {
                list: function() {
                    var _this = this;
                    axios.post(sow.U('admin/permission'), this.search).then(function(response) {
                        if (_this.pages != response.data.result.total_pages) {
                            _this.$set(_this, 'pages', response.data.result.total_pages);
                            _this.page();
                        }
                        _this.$set(_this, 'permission', response.data.result.items);
                        _this.$nextTick(function() {
                            form.render();
                        });
                    }).catch(function(error) {
                        console.log(error);
                    });
                },
                // 分页
                page: function() {
                    var _this = this;
                    layui.laypage({
                        cont: 'page',
                        pages: this.pages,
                        skip: true,
                        jump: function(obj, first) {
                            if (!first) {
                                _this.search.page = obj.curr;
                                _this.list();
                            }
                        }
                    });
                },
                changePage: function(pages) {
                    this.$set(this, 'search.pageSize', pages);
                    this.list();
                },
                addPermission: function() {
                    layer.open({
                        type: 2, //1:test//2:url
                        title: lang.permission.create,
                        shade: 0.3,
                        full: false,
                        shadeClose: true,
                        maxmin: true, //开启最大化最小化按钮
                        area: ['893px', '700px'],
                        anim: 1, // 动作方向
                        content: [sow.U("admin/permission/create"), 'yes']
                    });
                },
                topList:function(){
                    this.search.pageSize = 15;
                    this.search.page = 1;
                    this.list();
                }
            }
        });
        //监听查询
        form.on('submit(searchPermission)', function(data) {
            window.conf.vn.$set(window.conf.vn, 'search.page', 1);
            window.conf.vn.$set(window.conf.vn, 'search.name', data.field.name);
            window.conf.vn.list();
            return false;
        });
    });
});
