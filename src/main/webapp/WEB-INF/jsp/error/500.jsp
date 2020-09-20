<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/9/20
  Time: 16:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%String path = request.getContextPath();%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <!--设置移动端-->
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>博客详情</title>
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
            <a href="#" class="m-item item m-mobile-hide" ><i class="idea icon"></i> 分类</a>
            <a href="#" class="m-item item m-mobile-hide" ><i class="tags icon"></i>标签</a>
            <a href="#" class="m-item item m-mobile-hide" ><i class="tags icon"></i>归档</a>
            <a href="#" class="m-item item m-mobile-hide" ><i class="info icon"></i>关于我</a>
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


    <div class="m-container-small m-padded-tb-massive">
        <div class="ui error message">
            <div class="ui container">
                <h2>500</h2>
                <p>服务器出现了错误</p>
            </div>
        </div>
    </div>

    <!--底部容器-->
    <footer  class="ui inverted vertical segment m-padded-tb-massive">
        <div class="ui center aligned container">
            <!--将页面分成16份-->
            <div class="ui inverted divided stackable grid">
                <!--微信头像占三份-->
                <div class="three wide column">
                    <div class="ui inverted link list">
                        <div class="item">
                            <img src="<%=path%>/resources/images/wechat.png" class="ui rounded image" style="width: 150px">
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
</nav>
</body>
</html>
