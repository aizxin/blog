layui.config({
    base: '/admin/js/',
}).extend({
    sow: 'modules/sow',
    lang: 'lang/zh-en'
});
layui.use(['layer', 'element', 'util'], function() {
    var element = layui.element(),
        layer = layui.layer,
        $ = layui.jquery,
        util = layui.util; //导航的hover效果、二级菜单等功能，需要依赖element模块
    var side = $('.my-side');
    var body = $('.my-body');
    var footer = $('.my-footer');

    // 导航栏收缩
    function navHide(t, st) {
        var time = t ? t : 50;
        st ? localStorage.log = 1 : localStorage.log = 0;
        side.animate({ 'left': -200 }, time);
        body.animate({ 'left': 0 }, time);
        footer.animate({ 'left': 0 }, time);
    }

    // 导航栏展开
    function navShow(t, st) {
        var time = t ? t : 50;
        st ? localStorage.log = 0 : localStorage.log = 1;
        side.animate({ 'left': 0 }, time);
        body.animate({ 'left': 200 }, time);
        footer.animate({ 'left': 200 }, time);
    }

    // 监听导航(side)点击切换页面
    element.on('nav(side)', function(elem) {
        // 添加tab方法
        addTab(element, elem);
    });

    // 监听顶部左侧导航
    element.on('nav(side-left)', function(elem) {
        // 添加tab方法
        addTab(element, elem);
    });

    // 监听顶部右侧导航
    element.on('nav(side-right)', function(elem) {
        // 修改skin
        if ($(this).attr('data-skin')) {
            localStorage.skin = $(this).attr('data-skin');
            skin();
        } else {
            // 添加tab方法
            addTab(element, elem);
        }

    });

    // 根据导航栏text获取lay-id
    function getTitleId(card, title) {
        var id = -1;
        $(document).find(".layui-tab[lay-filter=" + card + "] ul li").each(function() {
            if (title === $(this).find('span').html()) {
                id = $(this).attr('lay-id');
            }
        });
        return id;
    }

    // 工具
    function _util() {
        var bar = $('.layui-fixbar');
        // 分辨率小于1024  使用内部工具组件
        if ($(window).width() < 1024) {
            util.fixbar({
                bar1: '&#xe602;',
                css: { left: 10, bottom: 54 },
                click: function(type) {
                    if (type === 'bar1') {
                        //iframe层
                        layer.open({
                            type: 1, // 类型
                            title: false, // 标题
                            offset: 'l', // 定位 左边
                            closeBtn: 0, // 关闭按钮
                            anim: 0, // 动画
                            shadeClose: true, // 点击遮罩关闭
                            shade: 0.8, // 半透明
                            area: ['150px', '100%'], // 区域
                            skin: 'my-mobile', // 样式
                            content: $('body .my-side').html() // 内容
                        });
                    }
                    element.init();
                }
            });
            bar.removeClass('layui-hide');
            bar.addClass('layui-show');
        } else {
            bar.removeClass('layui-show');
            bar.addClass('layui-hide');
        }
    }

    // 皮肤
    function skin() {
        var skin = localStorage.skin ? localStorage.skin : 0;
        var layout = $('.layui-layout-admin');
        layout.removeClass('skin-0');
        layout.removeClass('skin-1');
        layout.removeClass('skin-2');
        layout.addClass('skin-' + skin);
    }


    // 自适应
    $(window).on('resize', function() {
        if ($(this).width() > 1024) {
            if (localStorage.log == 0) {
                navShow();
            }
        } else {
            if (localStorage.log == 1) {
                navHide();
            }
        }
        init();
    });

    // 监听控制content高度
    function init() {
        // 起始判断收缩还是展开
        if (localStorage.log == 0) {
            navHide(100);
        } else {
            navShow(1);
        }
        // 工具
        _util();
        // skin
        skin();
        // 选项卡高度
        cardTitleHeight = $(document).find(".layui-tab[lay-filter='card'] ul.layui-tab-title").height();
        // 需要减去的高度
        height = $(window).height() - $('.layui-header').height() - cardTitleHeight - $('.layui-footer').height();
        // 设置高度
        $(document).find(".layui-tab[lay-filter='card'] div.layui-tab-content").height(height - 2);
    };
    $(function() {
        // 表格选中
        $('#dateTable tbody').on('click', 'tr input[type="checkbox"]', function() {
            var obj = $(this).parent().parent();
            if (this.checked) {
                obj.addClass('selected');
            } else {
                obj.removeClass('selected');
            }
        });

        // 全选和反选
        $('#dateTable thead').on('click', 'tr input[type="checkbox"]', function() {
            var obj = $("#dateTable tbody input[type='checkbox']:checkbox");
            var allTr = $("#dateTable tbody tr");
            if (this.checked) {
                obj.prop("checked", true);
                allTr.addClass('selected');
            } else {
                obj.prop("checked", false);
                allTr.removeClass('selected');
            }
        });
        // 监听导航栏收缩
        $('.btn-nav').on('click', function() {
            if (localStorage.log == 0) {
                navShow(50);
            } else {
                navHide(50);
            }

        });
    });
    // 初始化
    init();
});
