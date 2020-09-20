<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/9/20
  Time: 11:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<%String path=request.getContextPath();%>
<head>
    <meta charset="UTF-8">
    <!--设置移动端-->
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>标签</title>
    <!--引入css-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
    <link rel="stylesheet" href="<%=path%>/resources/css/me.css">
</head>

<body>
<!--导航栏容器-->
<nav class="ui inverted attached segment m-padded-tb-mini m-shadow-small" >
    <!--为了让logo更加靠右，因此将其放入container中-->
    <div class="ui container">
        <!--创建一个menu-->
        <div class="ui inverted secondary stackable menu">
            <!--创建一个logo-->
            <h2 class="ui teal header item">Liujie's Lib</h2>
            <!--菜单栏-->
            <a href="#" class="m-item item m-mobile-hide" ><i class="home icon"></i>首页</a>
            <a href="#" class="m-item item m-mobile-hide"><i class="idea icon"></i> 分类</a>
            <a href="#" class="m-item item m-mobile-hide"><i class="tags icon"></i>标签</a>
            <a href="#" class="m-item item m-mobile-hide"><i class="tags icon"></i>归档</a>
            <a href="#" class="active m-item item m-mobile-hide"><i class="info icon"></i>关于我</a>
            <!--右侧搜索框-->
            <div class="right item m-mobile-hide">
                <div class="ui icon input">
                    <input type="text" placeholder="Search....">
                    <i class="search link icon"></i>
                </div>
            </div>
        </div>
    </div>
    <a href="#" class="ui menu toggle black icon button m-right-top m-mobile-show">
        <i class="sidebar icon"></i>
    </a>
</nav>
<!--中间内容容器-->
<div class="m-padded-tb-large m-container">
    <div class="ui container">
        <div class="ui stackable grid">
            <!--图片部分-->
            <div class="eleven wide column">
                <div class="ui segment">
                    <img src="https://imglf5.lf127.net/img/MkQrTXB3T3JXVzZ3Wld6Y1FRNms5VUdYV0tUSDJhQ21IVzJwREtIa3VnVHhjdmdsenRRb0ZRPT0.jpg?imageView&thumbnail=800x600&quality=96&stripmeta=0&type=jpg" class="ui rounded image">
                </div>
            </div>
            <!--右侧说明部分-->
            <div class="five wide column">
                <!--关于我-->
                <div class="ui top attached segment">
                    <div class="ui header">关于我</div>
                </div>
                <!--第一行文字说明-->
                <div class="ui attached segment">
                    <p class="m-text-thin">宁熙桐，一个独立开发者，折腾在0和1的学生，一个终身学习者，将学习无线循环，希望借是可以共同成长的小伙伴。</p>
                    <p class="m-text-thin">宁熙桐，一个独立开发者，折腾在0和1的学生，一个终身学习者，将学习无线循环，希望借是可以共同成长的小伙伴。</p>
                </div>
                <!--第二行-->
                <div class="ui attached segment">
                    <div class="ui orange basic left pointing label m-margin-tb-tiny">编程</div>
                    <div class="ui orange basic left pointing label m-margin-tb-tiny">写作</div>
                    <div class="ui orange basic left pointing label m-margin-tb-tiny">思考</div>
                    <div class="ui orange basic left pointing label m-margin-tb-tiny">运动</div>
                </div>
                <!--第三行标签-->
                <div class="ui attached segment">
                    <div class="ui teal basic left pointing label m-margin-tb-tiny">java</div>
                    <div class="ui teal basic left pointing label m-margin-tb-tiny">sql</div>
                    <div class="ui teal basic left pointing label m-margin-tb-tiny">redis</div>
                    <div class="ui teal basic left pointing label m-margin-tb-tiny">html</div>
                    <div class="ui teal basic left pointing label m-margin-tb-tiny">python</div>
                    <div class="ui teal basic left pointing label m-margin-tb-tiny">...</div>
                </div>
                <!--qq,wechat，github的标签-->
                <div class="ui bottom attached segment">
                    <a href="https://github.com/nxtabb" target="_blank" class="ui circular icon button"><i class="github icon"></i></a>
                    <a href="#" class="ui wechat circular icon button"><i class="wechat icon"></i></a>
                    <a href="#" class="ui qq circular icon button " data-content="519923938" data-position="bottom center"><i class="qq icon"></i></a>
                    <a href="#" class="ui weibo circular icon button" data-content="宁小木同_" data-position="bottom center"><i class="weibo icon"></i></a>
                </div>
                <!--鼠标悬停到微信标签的图片-->
                <div class="ui wechat-qr flowing popup transition hidden">
                    <img class="ui rounded image" src="http://localhost:8080/MyBlog/resources/images/wechat.png" style="width: 150px">
                </div>
            </div>
        </div>
    </div>

</div>
<!--底部容器-->
<footer class="ui inverted vertical segment m-padded-tb-massive">
    <div class="ui center aligned container">
        <!--将页面分成16份-->
        <div class="ui inverted divided stackable grid">
            <!--微信头像占三份-->
            <div class="three wide column">
                <div class="ui inverted link list">
                    <div class="item">
                        <img src="http://localhost:8080/MyBlog/resources/images/wechat.png" class="ui rounded image" style="width: 150px">
                    </div>
                </div>
            </div>
            <div class="three wide column">
                <h4 class="ui inverted header">最新博客</h4>
                <div class="ui inverted link list">
                    <a href="#" class="item">用户故事</a>
                    <a href="#" class="item">java教程大全</a>
                    <a href="#" class="item">springboot是什么</a>
                </div>
            </div>
            <div class="three wide column">
                <h4 class="ui inverted header">联系我们</h4>
                <div class="ui inverted link list">
                    <a href="#" class="item">Email:519923938@qq.com</a>
                    <a href="#" class="item">QQ:519923938</a>
                    <a href="#" class="item">Phone:18646201718</a>
                </div>
            </div>
            <div class="seven wide column">
                <h4 class="ui inverted header">介绍</h4>
                <p>
                    这是我的博客，会分享关于编程 写作 思考等任何相关的内容，希望可以对你起到帮助
                </p>
            </div>

        </div>
        <div class="ui inverted section divider"></div>
        <p class="m-text-thin m-text-spaced">Copyright(C)2020-2021 Designed by NingXiTong</p>

    </div>
</footer>
<!--引入jquery-->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.2/dist/jquery.min.js"></script>
<!--引入semantic的js库-->
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<script>
    $(".menu.toggle").click(function (){
        $(".m-item").toggleClass('m-mobile-hide');
    });
    $('.qq').popup();
    $('.weibo').popup();


    $('.wechat').popup({
        popup:$('.wechat-qr.popup'),
        position:'bottom center'
    });

</script>
</body>
</html>
