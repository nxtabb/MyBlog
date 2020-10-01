<%@ page import="java.util.List" %>
<%@ page import="com.hrbeu.pojo.User" %><%--
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
<%User user = (User)session.getAttribute("user");%>
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
            <a href="#"><h2 class="ui teal header item" id="index-btn">Liujie's Lab后台管理</h2></a>
            <!--菜单栏-->
            <a href="<%=path%>/admin/documentsIndex/1" class="active m-item item m-mobile-hide"><i class="home icon"></i>文档</a>
            <a href="<%=path%>/admin/types/1" class="m-item item m-mobile-hide"><i class="idea icon"></i>分类</a>
            <a href="<%=path%>/admin/tags/1" class="m-item item m-mobile-hide"><i class="tags icon"></i>标签</a>
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
            <a href="<%=path%>/admin/documents/adddocument" class="item">发布</a>
            <a href="<%=path%>/admin/documentsIndex/1" class="teal item active">列表</a>
        </div>

    </div>

</div>
<!--中间内容容器-->
<div class="m-padded-tb-large m-container-small">
    <div class="ui container">
        <!--搜索的form-->
        <h2>当前位置：首页</h2>
        <form action="<%=path%>/admin/documents/search/1" method="post" class="ui  secondary form segment" id="search_form">
            <div class="inline fields">
                <!--标题输入框-->
                <div class="field">
                    <input type="text" name="title" placeholder="标题" id="title_input">
                </div>
                <!--类型下拉框-->
                <div class="field">

                    <select  name="type">
                        <c:forEach items="${typeList}" var="type">
                            <option value="${type.typeId}">${type.typeName}</option>
                        </c:forEach>
                    </select>

                </div>
                <!--是否推荐的checkbox-->
                <div class="field">
                    <div class="ui checkbox">
                        <input type="checkbox" name="recommend" id="recommend">
                        <label for="recommend">推荐</label>
                    </div>
                </div>
                <!--按钮-->
                <div class="field">
                    <button class="ui mini teal basic button" id="search-btn">
                        <i class="search icon" ></i>搜索
                    </button>
                </div>

            </div>
        </form>

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
                        <a href="<%=path%>/admin/documents/updatedocument/${document.documentId}" class="ui mini teal button">编辑</a>
                        <a href="<%=path%>/admin/documents/deleteById/${document.documentId}" class="ui mini red button">删除</a>
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

                    <a href="<%=path%>/admin/documents/adddocument" class="ui mini right floated basic button">新增</a>
                </th>
            </tr>
            </tfoot>
        </table>
    </div>
</div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

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
        window.location.href="<%=path%>/admin/documentsIndex/"+${nextPage};
    })
    $("#prePage").click(function () {
        window.location.href="<%=path%>/admin/documentsIndex/"+${prePage};
    })

    $("#search-btn").click(function (){
        $("#search_form").submit();

    })
    $("#index-btn").click(function () {
        window.location.href='<%=path%>/admin/index';

    })

</script>
</body>
</html>
