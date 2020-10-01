<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/9/20
  Time: 11:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%String path=request.getContextPath();%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <!--设置移动端-->
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>归档</title>
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
            <a href="<%=path%>/archives" class="active m-item item m-mobile-hide"><i class="tags icon"></i>归档</a>
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
        <div class="ui top attached padded segment">
            <div class="ui middle aligned two column grid">
                <div class="column">
                    <h3 class="ui teal header">归档</h3>
                </div>
                <div class="right aligned column">
                    共<h2 class="ui orange header m-inline-block m-text-thin"> ${count} </h2>篇文章
                </div>
            </div>
        </div>
        <!--2020年-->
        <c:forEach items="${resultMap}" var="documentList">
        <h1 class="ui center aligned header">${documentList.key}</h1>
        <div class="ui fluid vertical menu">
            <c:forEach items="${documentList.value}" var="document">
            <a href="<%=path%>/document/${document.documentId}"  class="item">
                <span>
                <i class="mini teal circle icon"></i>&nbsp;&nbsp;${document.title}
                    <div class="ui teal basic left pointing label m-padded-mini"><fmt:formatDate value="${document.lastEditTime}" pattern="yyyy-MM-dd HH:mm:ss"/> </div>
                </span>
                <div class="ui orange basic left pointing label m-padded-mini">
                    <c:if test="${document.flag==1}">原创</c:if>
                    <c:if test="${document.flag==2}">转载</c:if>
                    <c:if test="${document.flag==3}">翻译</c:if></div>
            </a>
            </c:forEach>
        </div>
        </c:forEach>

    </div>
</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br>
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

</script>
</body>
</html>
