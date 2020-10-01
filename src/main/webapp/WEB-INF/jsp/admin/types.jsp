<%@ page import="com.hrbeu.pojo.User" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/9/20
  Time: 11:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%String path = request.getContextPath();%>
<%User user = (User)session.getAttribute("user");%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <!--设置移动端-->
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>分类管理</title>
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
            <a href="#"><h2 class="ui teal header item" id="index-btn">Liujie's Lab后台管理</h2></a>
            <!--菜单栏-->
            <a href="<%=path%>/admin/documentsIndex/1" class="m-item item m-mobile-hide" ><i class="home icon"></i>博客</a>
            <a href="<%=path%>/admin/types/1" class="active m-item item m-mobile-hide"><i class="idea icon"></i> 分类</a>
            <a href="<%=path%>/admin/tags/1" class="m-item item m-mobile-hide"><i class="tags icon"></i>标签</a>
            <!--头像-->
            <div class="right m-item m-mobile-hide menu">
                <div class="ui dropdown item">
                    <div class="text">
                        <img src="https://imglf5.lf127.net/img/MkQrTXB3T3JXVzZ3Wld6Y1FRNms5VUdYV0tUSDJhQ21IVzJwREtIa3VnVHhjdmdsenRRb0ZRPT0.jpg?imageView&thumbnail=1680x0&quality=96&stripmeta=0&type=jpg" >
                        <%=user.getNickname()%>
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
            <a href="<%=path%>/admin/types/input" class="item">发布</a>
            <a href="<%=path%>/admin/types/1" class="teal item active">列表</a>
        </div>
    </div>
</div>
<!--中间内容容器-->
<div class="m-padded-tb-large m-container-small">
    <div class="ui container">
        <!--显示信息的表格-->
        <div class="ui success message">
            <i class="close icon"></i>
            <div class="header">现在可以对分类进行操作。</div>
            <p>注意：分类具有外键约束，请不要随意删除分类信息。修改和添加可以任意操作</p>
        </div>
        <table class="ui celled table">
            <thead>
            <tr>
                <th></th>
                <th>分类名称</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="type" items="${typeList}">
                <tr>
                    <td>${type.typeId}</td>
                    <td>${type.typeName}</td>
                    <td class="center-pill">
                        <a href="<%=path%>/admin/types/updateType/${type.typeId}" class="ui mini teal button">编辑</a>
                        <a href="<%=path%>/admin/types/deleteById/${type.typeId}" class="ui mini red button">删除</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
            <tfoot>
            <tr>
                <th colspan="6">
                    <div class="ui mini floated pagination menu">
                        <a class="icon item" id="prePage">上一页</a>
                        <a class="icon item" id="nextPage">下一页</a>
                    </div>

                    <a href="<%=path%>/admin/types/input" class="ui mini right floated basic button">新增</a>
                </th>
            </tr>
            </tfoot>
        </table>
    </div>
</div>
<!--底部容器-->
<jsp:include page="../footer.jsp"/>
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
        window.location.href="<%=path%>/admin/types/"+${nextPage};
    })
    $("#prePage").click(function () {
        window.location.href="<%=path%>/admin/types/"+${prePage};
    })
    $(".message.close").on('click',function () {
        $(this).closest('.message').transition('fade');

    });
    $("#index-btn").click(function () {
        window.location.href='<%=path%>/admin/index';

    })

</script>
</body>
</html>
