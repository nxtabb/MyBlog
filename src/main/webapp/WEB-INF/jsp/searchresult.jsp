<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/9/20
  Time: 11:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%String path=request.getContextPath();%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <!--设置移动端-->
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>搜索结果</title>
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
            <h2 class="ui teal header item">Liujie's Lab</h2>
            <!--菜单栏-->
            <a href="<%=path%>/" class="m-item item m-mobile-hide" ><i class="home icon"></i>首页</a>
            <a href="<%=path%>/types/-1/1" class="m-item item m-mobile-hide"><i class="idea icon"></i> 分类</a>
            <a href="<%=path%>/tags/-1/1" class="m-item item m-mobile-hide"><i class="tags icon"></i>标签</a>
            <a href="<%=path%>/archives" class="m-item item m-mobile-hide"><i class="tags icon"></i>归档</a>
            <a href="<%=path%>/about" class="m-item item m-mobile-hide"><i class="info icon"></i>关于我们</a>
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
<!--中间内容容器-->
<div class="m-padded-tb-large m-container-small">
    <div class="ui container">
        <!--分类页的头部容器-->
        <div class="ui top attached segment">
            <div class="ui middle aligned two column grid">
                <div class="column">
                    <h3 class="ui teal header">查询结果</h3>
                </div>
                <div class="right aligned column">
                    共<h2 class="ui orange header m-inline-block m-text-thin"> ${maxCount} </h2>篇
                </div>
            </div>
        </div>

        <!--标签下面的博客列表-->
        <div class="ui teal top attached segment ">
            <c:forEach items="${documentList}" var="document">
                <!--单个博客-->
                <div class="ui padded vertical segment m-padded-tb-large">
                    <div class="ui mobile reversed stackable grid">
                        <div class="ui eleven wide column">
                            <a href="<%=path%>/document/${document.documentId}"> <h3 class="ui header">${document.title}</h3></a>
                            <p class="m-text"><c:if test="${document.description.length()>150}">${document.description.substring(0,150)}</c:if>
                                <c:if test="${document.description.length()<=150}">${document.description}</c:if></p>
                            <div class="ui stackable grid">
                                <div class="eleven wide column">
                                    <div class="ui horizontal mini link list">
                                        <div class="item">
                                            <img src="${document.user.image.toString()}" class="ui avatar image">
                                            <div class="content">
                                                <a href="#" class="header">${document.user.nickname}</a>
                                            </div>
                                        </div>
                                        <div class="item">
                                            <i class="calendar icon"></i><fmt:formatDate value="${document.lastEditTime}" timeStyle="yyyy-MM-dd"/>
                                        </div>
                                        <div class="item">
                                            <i class="eye icon"></i>${document.viewCount}
                                        </div>
                                    </div>
                                </div>
                                <div class="right aligned five wide column">
                                    <a href="#"class="ui label teal basic m-padded-mini" target="_blank">
                                            ${document.type.typeName}
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="ui five wide column">
                            <a src="#" target="_blank"><img src="${document.firstPicture}" class="ui rounded image"></a>
                        </div>
                    </div>
                </div>
            </c:forEach>

        </div>

        <!--上一页 下一页-->
        <div class="ui bottom attached segment">
            <div class="ui middle aligned two column grid">
                <div class="column">
                    <a href="#" class="ui teal basic button" id="prePageBtn">上一页</a>
                </div>
                <div class="right aligned column">
                    <a href="#" class="ui teal basic button" id="nextPageBtn">下一页</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!--底部容器-->
<jsp:include page="footer.jsp"/>
<!--引入jquery-->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.2/dist/jquery.min.js"></script>
<!--引入semantic的js库-->
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<script>
    $(".menu.toggle").click(function (){
        $(".m-item").toggleClass('m-mobile-hide');
    });
    $("#nextPageBtn").click(function () {
        window.location.href = '<%=path%>/search/${nextPage}'
    });
    $("#prePageBtn").click(function () {
        window.location.href = '<%=path%>/search/${prePage}'
    });
</script>
</body>
</html>
