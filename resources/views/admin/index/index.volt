{% extends "layouts/admin.volt" %}
{% block css %}
<link rel="stylesheet" type="text/css" href="{{ static_url('/admin/plugin/thooClock/main.css') }}">
<style type="text/css" media="screen">
    @media only screen and (max-width: 560px) {
        .container canvas {
            width: 300px;
            height: 300px;
        }
    }
</style>
{% endblock %}
{% block content %}
<div class="layui-tab layui-tab-card my-tab" lay-filter="card" lay-allowClose="true">
    <ul class="layui-tab-title">
        <li class="layui-this" lay-id="0"><span>欢迎页</span></li>
    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <div class="body" lay-accordion="" lay-filter="collapse">
                <div class="layui-colla-item">
                    <div class="container">
                        <div id="myclock"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
{% endblock %}
{% block js %}
<script src="{{ static_url('/admin/plugin/thooClock/jquery-2.0.3.min.js') }}"></script>
<script src="{{ static_url('/admin/plugin/thooClock/jquery.thooClock.js') }}"></script>
<script>
layui.use(['jquery'],function(){
    var $ = layui.jquery;
    $(function() {
        var intVal, myclock;
        var audioElement = new Audio("");
        //clock plugin constructor
        $('#myclock').thooClock({
            size:$(document).height()/1.4,
            onAlarm:function(){
                //all that happens onAlarm
                $('#alarm1').show();
                alarmBackground(0);
                //audio element just for alarm sound
                document.body.appendChild(audioElement);
                var canPlayType = audioElement.canPlayType("audio/ogg");
                if(canPlayType.match(/maybe|probably/i)) {
                    audioElement.src = 'alarm.ogg';
                } else {
                    audioElement.src = 'alarm.mp3';
                }
                // erst abspielen wenn genug vom mp3 geladen wurde
                audioElement.addEventListener('canplay', function() {
                    audioElement.loop = true;
                    audioElement.play();
                }, false);
            },
            showNumerals:true,
            brandText:'THOOYORK',
            brandText2:'Germany',
            onEverySecond:function(){
                //callback that should be fired every second
            },
            //alarmTime:'15:10',
            offAlarm:function(){
                $('#alarm1').hide();
                audioElement.pause();
                clearTimeout(intVal);
                $('body').css('background-color','#FCFCFC');
            }
        });
    });
});
</script>
{% endblock %}
