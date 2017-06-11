layui.use(['form', 'layedit', 'lang', 'sow'], function() {
    var form = layui.form(),
        layer = layui.layer,
        lang = layui.lang,
        sow = layui.sow,
        $ = layui.jquery,
        layedit = layui.layedit;
    $(function(){
        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');
        //监听提交
        form.on('submit(addPermissionStore)', function(data) {
            var index = sow.load(1);
            data.field.ismenu = data.field.ismenu != undefined ? 1 : 0;
            data.field.description = layedit.getContent(editIndex)
            axios.post(sow.U('admin/permission/store'), data.field).then(function(response) {
                if (response.data.code == 200) {
                    layer.close(index)
                    sow.msgS(response.data.message,function(){
                        top.layer.closeAll();
                        top.conf.vn.topList();
                    })
                }else{
                    layer.close(index)
                    sow.msgE(response.data.message)
                }
            }).catch(function(error) {
                layer.close(index)
                sow.msgE(lang.sys.error)
            });
            return false;
        });
        $('.layui-btn-icon').on('click', function() {
            sow.open(lang.permission.icon,sow.U('admin/icon'),['700px', '500px']);
        });
        form.render('checkbox');
    });
});
