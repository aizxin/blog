layui.use(['sow', 'lang', 'form', 'laypage'], function() {
    var lang = layui.lang,
        sow = layui.sow,
        form = layui.form();
    new Vue({
        el: '#app',
        data: {
            permission: [],
            pages: 0,
            search: {
                pageSize: 20
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
                        _this.$set('pages', response.data.result.total_pages);
                        _this.page();
                    }
                    _this.$set('permission', response.data.result.items);
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
        }
    });
});
