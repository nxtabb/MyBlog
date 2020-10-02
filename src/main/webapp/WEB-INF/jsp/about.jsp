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
    <title>关于我们</title>
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
            <a href="#"><h2 class="ui teal header item" id="index-btn">Liujie's Lab</h2></a>
            <!--菜单栏-->
            <a href="<%=path%>/" class="m-item item m-mobile-hide" ><i class="home icon"></i>首页</a>
            <a href="<%=path%>/types/-1/1" class="m-item item m-mobile-hide"><i class="idea icon"></i> 分类</a>
            <a href="<%=path%>/tags/-1/1" class="m-item item m-mobile-hide"><i class="tags icon"></i>标签</a>
            <a href="<%=path%>/archives" class="m-item item m-mobile-hide"><i class="tags icon"></i>归档</a>
            <a href="<%=path%>/about" class="active m-item item m-mobile-hide"><i class="info icon"></i>关于我们</a>
            <!--右侧搜索框-->
            <div class="right item m-mobile-hide">
                <form action="<%=path%>/search/1" method="post" target="_blank" name="search">
                    <div class="ui icon input">
                        <input type="text" placeholder="Search...." value="${query}" name="query">
                        <i onclick="document.forms['search'].submit()" class="search link icon"></i>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <a href="#" class="ui menu toggle black icon button m-right-top m-mobile-show">
        <i class="sidebar icon"></i>
    </a>
</nav>
<br><br>
<!--中间内容容器-->
<div class="m-padded-tb-large m-container">
    <div class="ui container">
        <div class="ui stackable grid">
            <!--图片部分-->
            <div class="eleven wide column">
                <div class="ui segment">
                    <img src="<%=path%>/resources/images/school.png" class="ui rounded image" style="height: 570px" width="1213">
                </div>
            </div>
            <!--右侧说明部分-->
            <div class="five wide column">
                <!--关于我-->
                <div class="ui top attached segment">
                    <div class="ui header">关于我们</div>
                </div>
                <!--第一行文字说明-->
                <div class="ui attached segment">
                    <p class="m-text-thin">研究方向:人工智能、数据与知识工程、软件开发技术</p>
                    <p class="m-text-thin">承担项目:<br>
                        1.“自升式钻井平台设计建造信息化管理技术研究”  工信部高技术船舶项目<br>
                        2.  "基于可拓集理论的数据挖掘技术的研究" 省自然基金项目<br>
                        3.  "基于组件的知识发现的平台研究"   校基金项目<br>
                        4. “社会保障联网审计软件系统”  金审工程项目<br>
                        5. “高校实验室综合管理系统” 省级教改项目<br></p>
                </div>
                <!--第二行-->
                <div class="ui attached segment">
                    <div class="ui orange basic left pointing label m-margin-tb-tiny">编程</div>
                    <div class="ui orange basic left pointing label m-margin-tb-tiny">写作</div>
                    <div class="ui orange basic left pointing label m-margin-tb-tiny">研究</div>
                    <div class="ui orange basic left pointing label m-margin-tb-tiny">实践</div>
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
<br><br><br><br><br><br><br>

<jsp:include page="footer.jsp"/>
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
    $("#index-btn").click(function () {
        window.location.href='<%=path%>/';

    });
    $('.ui.dropdown').dropdown({
        on:'hover'
    });

</script>
</body>
</html>
