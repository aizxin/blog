layui.use(['form', 'layedit', 'lang', 'sow'], function() {
    var form = layui.form(),
        layer = layui.layer,
        lang = layui.lang,
        sow = layui.sow,
        $ = layui.jquery,
        layedit = layui.layedit;
    //创建一个编辑器
    var editIndex = layedit.build('LAY_demo_editor');
    //监听提交
    form.on('submit(addPermissionStore)', function(data) {
        var index = sow.load(1);
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
        layer.open({
            type: 2, //1:test//2:url
            title: lang.permission.icon,
            full: false,
            shadeClose: true,
            shade: 0.5,
            zIndex: 99999999,
            maxmin: true, //开启最大化最小化按钮
            area: ['700px', '500px'],
            anim: 1, // 动作方向
            content: sow.U('admin/icon'),
            success: function(layero, index) {}
        });
    });
});
