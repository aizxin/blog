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
            error:'系统错误'
        },
        setting:{

        },
        user:{
            login:'登录'
        },
        permission:{
            create:'权限添加',
            icon:'图标选择'
        }
    };
    exports('lang', lang);
});
