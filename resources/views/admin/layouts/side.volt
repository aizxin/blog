<div class="layui-side my-side">
    <div class="layui-side-scroll">
        <ul class="layui-nav layui-nav-tree" lay-filter="side">
            {% for item in menu %}
            <!-- 去除 layui-nav-itemed 即可关闭展开 -->
            <li class="layui-nav-item <?php echo $parentId == $item['id']?'layui-nav-itemed':'' ?>">
                <a href="javascript:;"><i class="{{ item['icon'] }}"></i>{{ item['name'] }}</a>
                <dl class="layui-nav-child">
                    {% for vo in item['child'] %}
                    <dd class="layui-nav-item <?php echo $id == $vo['id']?'layui-this':'' ?>"><a href="<?= $this->url->get($vo['slug']) ?>"><i class="{{ vo['icon'] }}"></i>{{vo['name']}}</a></dd>
                    {% endfor %}
                </dl>
            </li>
            {% endfor %}
        </ul>
    </div>
</div>