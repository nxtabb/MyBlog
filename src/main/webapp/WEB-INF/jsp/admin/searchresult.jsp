<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/9/20
  Time: 11:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%String path = request.getContextPath();%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <!--设置移动端-->
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>文档管理</title>
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
            <h2 class="ui teal header item">Liujie's Lib后台管理</h2>
            <!--菜单栏-->
            <a href="<%=path%>/admin/documentsIndex/1" class="active m-item item m-mobile-hide"><i class="home icon"></i>文档</a>
            <a href="<%=path%>/admin/types/1" class="m-item item m-mobile-hide"><i class="idea icon"></i>分类</a>
            <a href="<%=path%>/admin/tags/1" class="m-item item m-mobile-hide"><i class="tags icon"></i>标签</a>
            <!--头像-->
            <div class="right m-item m-mobile-hide menu">
                <div class="ui dropdown item">
                    <div class="text">
                        <img src="https://imglf5.lf127.net/img/MkQrTXB3T3JXVzZ3Wld6Y1FRNms5VUdYV0tUSDJhQ21IVzJwREtIa3VnVHhjdmdsenRRb0ZRPT0.jpg?imageView&thumbnail=1680x0&quality=96&stripmeta=0&type=jpg" >
                        宁熙桐
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

<div class="ui attached pointing menu">
    <div class="ui container">
        <div class="right menu">
            <a href="#" class="item">发布</a>
            <a href="#" class="teal item active">列表</a>
        </div>

    </div>

</div>
<!--中间内容容器-->
<div class="m-padded-tb-large m-container-small">
    <div class="ui container">
        <!--显示信息的表格-->
        <table class="ui compact teal table">
            <thead>
            <tr>
                <th></th>
                <th>标题</th>
                <th>类型</th>
                <th>推荐</th>
                <th>更新时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>

            <c:forEach var="document" items="${documentList}">

                <tr>
                    <td>${document.documentId}</td>
                    <td>${document.title}</td>
                    <td>${document.type.typeName}</td>
                    <td><c:if test="${document.recommend==1}">是</c:if>
                        <c:if test="${document.recommend==0}">否</c:if></td>
                    <td><fmt:formatDate value="${document.lastEditTime}" timeStyle="yyyy-MM-dd"/>  </td>
                    <td>
                        <a href="#" class="ui mini teal button">编辑</a>
                        <a href="<%=path%>/admin/documents/deleteById/${document.documentId}" class="ui mini red button">删除</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
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
                        <img src="<%=path%>/resources/images/wechat.png" class="ui rounded image" style="width: 150px">
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
<!--引入jquery-->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.2/dist/jquery.min.js"></script>
<!--引入semantic的js库-->
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<script>

    $(".menu.toggle").click(function (){
        $(".m-item").toggleClass('m-mobile-hide');
    });
    $('.ui.dropdown').dropdown({
        on:'hover'
    });
    $("#nextPage").click(function () {
        window.location.href="<%=path%>/admin/documentsIndex/"+${nextPage};
    })
    $("#prePage").click(function () {
        window.location.href="<%=path%>/admin/documentsIndex/"+${prePage};
    })

    $("#search-btn").click(function (){
        $("#search_form").submit();

    })


</script>
</body>
</html>
