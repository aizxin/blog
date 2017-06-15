<div class="layui-side my-side">
    <div class="layui-side-scroll">
        <ul class="layui-nav layui-nav-tree" lay-filter="side">
            {% for item in menu %}
            <li class="layui-nav-item <?php echo $parentId == $item['id']?'layui-nav-itemed':'' ?>"><!-- 去除 layui-nav-itemed 即可关闭展开 -->
                <a href="javascript:;"><i class="layui-icon">&#xe620;</i>{{ item['name'] }}</a>
                <dl class="layui-nav-child">
                    {% for vo in item['child'] %}
                    <dd class="layui-nav-item <?php echo $id == $vo['id']?'layui-this':'' ?>"><a href="<?= $this->url->get($vo['slug']) ?>"><i class="layui-icon">&#xe621;</i>{{vo['name']}}</a></dd>
                    {% endfor %}
                </dl>
            </li>
            {% endfor %}
            <!-- <li class="layui-nav-item layui-nav-itemed">
                <a href="javascript:;"><i class="layui-icon">&#xe628;</i>扩展</a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:;" href-url="demo/login.html"><i class="layui-icon">&#xe621;</i>登录页</a></dd>
                    <dd><a href="javascript:;" href-url="demo/register.html"><i class="layui-icon">&#xe621;</i>注册页</a></dd>
                    <dd><a href="javascript:;" href-url="demo/login2.html"><i class="layui-icon">&#xe621;</i>登录页2</a></dd>
                    <dd><a href="javascript:;" href-url="demo/map.html"><i class="layui-icon">&#xe621;</i>图表</a></dd>
                    <dd><a href="javascript:;" href-url="demo/add-edit.html"><i class="layui-icon">&#xe621;</i>添加-修改</a></dd>
                    <dd><a href="javascript:;" href-url="demo/data-table.html"><i class="layui-icon">&#xe621;</i>data-table 表格页</a></dd>
                    <dd><a href="javascript:;" href-url="demo/tree-table.html"><i class="layui-icon">&#xe621;</i>Tree table树表格页</a></dd>
                    <dd><a href="javascript:;" href-url="demo/404.html"><i class="layui-icon">&#xe621;</i>404页</a></dd>
                    <dd><a href="javascript:;" href-url="demo/tips.html"><i class="layui-icon">&#xe621;</i>提示页</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a target="_blank" href="http://qm.qq.com/cgi-bin/qm/qr?k=jVYSxzwk9dZXNHdZq8owgzwzVjbzAp02"><i class="layui-icon">&#xe61e;</i>加入群下载源码</a></li> -->
        </ul>
    </div>
</div>