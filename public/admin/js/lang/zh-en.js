/**

 @Name：layui.sow 工具集
 @Author：Sow
 @License：MIT

*/

layui.define('jquery', function(exports) {
    "use strict";
    var $ = layui.jquery;
    var lang = lang || {};
    lang = {
        sys:{
            error:'系统错误',
            del:'确认是否删除',
            clear:'删除'
        },
        setting:{

        },
        user:{
            login:'登录'
        },
        permission:{
            index:'权限',
            create:'权限添加',
            icon:'图标选择',
            edit:'权限修改',
            delE:'没有删除的权限',
        }
    };
    exports('lang', lang);
});
