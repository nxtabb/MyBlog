<%@ page import="com.hrbeu.pojo.User" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/9/20
  Time: 11:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%String path=request.getContextPath();%>
<%User user = (User)session.getAttribute("user");%>
<html lang="en" xmlns:th="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <!--设置移动端-->
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>后台管理</title>
    <!--引入css-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
    <link rel="stylesheet" href="<%=path%>/resources/css/typo.css" >
    <link rel="stylesheet" href="<%=path%>/resources/css/animate.css">
    <link rel="stylesheet" href="<%=path%>/resources/lib/prism/prism.css">
    <link rel="stylesheet" href="<%=path%>/resources/lib/tocbot/tocbot.css">
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
            <h2 class="ui teal header item">Liujie's Lib后台管理</h2>
            <!--菜单栏-->
            <a href="<%=path%>/admin/documentsIndex/1" class="m-item item m-mobile-hide"><i class="home icon"></i>文档</a>
            <a href="<%=path%>/admin/types/1" class="m-item item m-mobile-hide"><i class="idea icon"></i>分类</a>
            <a href="<%=path%>/admin/tags/1" class="m-item item m-mobile-hide"><i class="tags icon"></i>标签</a>
            <!--头像-->
            <div class="right m-item m-mobile-hide menu">
                <div class="ui dropdown item">
                    <div class="text">
                        <img src="https://imglf5.lf127.net/img/MkQrTXB3T3JXVzZ3Wld6Y1FRNms5VUdYV0tUSDJhQ21IVzJwREtIa3VnVHhjdmdsenRRb0ZRPT0.jpg?imageView&thumbnail=1680x0&quality=96&stripmeta=0&type=jpg" >
                        ${user.nickname}
                    </div>
                    <i class="dropdown icon"></i>
                    <div class="menu">
                        <a href="<%=path%>/admin/logout" class="item">注销</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <a href="#" class="ui menu toggle black icon button m-right-top m-mobile-show">
        <i class="sidebar icon"></i>
    </a>
</nav>

<div class="m-container-small m-padded-tb-big">
    <div class="ui container">
        <div class="ui success large message">
            <h2>Hi,</h2>
            <p><%=user.getNickname()%>，欢迎登录</p>
        </div>
        <img src="https://imglf5.lf127.net/img/MkQrTXB3T3JXVzZ3Wld6Y1FRNms5VUdYV0tUSDJhQ21IVzJwREtIa3VnVHhjdmdsenRRb0ZRPT0.jpg?imageView&thumbnail=800x600&quality=96&stripmeta=0&type=jpg" class="ui rounded bordered fluid image">

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
                        <img src="<%=path%>/resources/images/wechat.png"  class="ui rounded image" style="width: 150px">
                    </div>
                </div>
            </div>
            <div class="three wide column">
                <h4 class="ui inverted header">最新文档</h4>
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
                    这是我的系统，会分享关于编程 写作 思考等任何相关的内容，希望可以对你起到帮助
                </p>
            </div>

        </div>
        <div class="ui inverted section divider"></div>
        <p class="m-text-thin m-text-spaced">Copyright(C)2020-2021 Designed by NingXiTong</p>

    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.2/dist/jquery.min.js"></script>
<!--引入semantic的js库-->
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/jquery.scrollto@2.1.2/jquery.scrollTo.min.js"></script>
<script src="<%=path%>/resources/lib/prism/prism.js" ></script>
<script src="<%=path%>/resources/lib/tocbot/tocbot.min.js"></script>
<script>
    $(".menu.toggle").click(function (){
        $(".m-item").toggleClass('m-mobile-hide');
    });
    $('.ui.dropdown').dropdown({
        on:'hover'
    });
</script>
</body>
</html>
