<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/9/20
  Time: 11:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%String path=request.getContextPath();%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <!--设置移动端-->
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>首页</title>
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
            <a href="<%=path%>/" class="active m-item item m-mobile-hide" ><i class="home icon"></i>首页</a>
            <a href="<%=path%>/types/-1/1" class="m-item item m-mobile-hide"><i class="idea icon"></i> 分类</a>
            <a href="<%=path%>/tags/-1/1" class="m-item item m-mobile-hide"><i class="tags icon"></i>标签</a>
            <a href="<%=path%>/archives" class="m-item item m-mobile-hide"><i class="tags icon"></i>归档</a>
            <a href="<%=path%>/about" class="m-item item m-mobile-hide"><i class="info icon"></i>关于我们</a>
            <!--右侧搜索框-->
            <div class="right item m-mobile-hide">
                <form action="<%=path%>/search/1" method="post" target="_blank" name="search">
                <div class="ui icon input">
                    <input type="text" placeholder="Search...." name="query">
                    <i onclick="document.forms['search'].submit()" class="search link icon"></i>
                </div>
                </form>
            </div>
            <c:if test="${sessionScope.user==null}"><a href="<%=path%>/login" class="m-item item m-mobile-hide"><i class="user icon"></i>登录</a></c:if>
            <c:if test="${sessionScope.user!=null}">
                <!--头像-->
                <div class="right m-item m-mobile-hide menu">
                    <div class="ui dropdown item">
                        <div class="text">
                            <img src="${sessionScope.user.image}" >
                                ${sessionScope.user.nickname}
                        </div>
                        <i class="dropdown icon"></i>
                        <div class="menu">
                            <a href="<%=path%>/logout" class="item">注销</a>
                        </div>
                    </div>
                </div>
            </c:if>
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
            <!--左侧整体布局容器-->
            <div class="eleven wide column">
                <!--首页左侧的头部容器-->
                <div class="ui top attached segment">
                    <div class="ui middle aligned two column grid">
                        <div class="column">
                            <h3 class="ui teal header">文章总览</h3>
                        </div>
                        <div class="right aligned column">
                            共<h2 class="ui orange header m-inline-block m-text-thin"> ${maxCount} </h2>篇
                        </div>
                    </div>
                </div>
                <!--博客的列表容器-->
                <div class="ui attached segment ">
                    <c:forEach items="${documentList}" var="document">
                        <!--单个列表-->
                        <div class="ui padded vertical segment m-padded-tb-large">
                            <div class="ui middle aligned mobile reversed stackable grid">
                                <div class="ui eleven wide column">
                                    <a href="<%=path%>/document/${document.documentId}" class="ui header"><h3>${document.title}</h3></a>
                                    <p class="m-text"><c:if test="${document.description.length()>75}">${document.description.substring(0,75)}</c:if>
                                        <c:if test="${document.description.length()<=75}">${document.description}</c:if></p>
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
                                            <a href="<%=path%>/types/${document.type.typeId}/1"class="ui label teal basic m-padded-mini" target="_blank">
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
                <!--左侧footer容器 上一页 下一页-->
                <div class="ui bottom attached segment">
                    <div class="ui middle aligned two column grid">
                        <div class="column">
                            <a href="#" class="ui teal basic button" id="prePage">上一页</a>
                        </div>
                        <div class="right aligned column">
                            <a href="#" class="ui teal basic button" id="nextPage">下一页</a>
                        </div>
                    </div>
                </div>

            </div>
            <!--右侧整体布局容器-->
            <div class="five wide column">
                <!--右侧分类-->
                <div class="ui segments">
                    <!--带灯泡的那一行-->
                    <div class="ui secondary segment">

                        <div class="ui two column grid">
                            <div class="column">
                                <i class="idea icon"></i>分类
                            </div>
                            <div class="right aligned column">
                                <a href="<%=path%>/types/-1/1"  class="">more <i class=" angle double right icon "></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="ui teal segment">
                        <div class="ui fluid vertical menu">
                            <c:forEach items="${typeCountList}" var="typeCount">
                                <a href="<%=path%>/types/${typeCount.typeId}/1" class="item">${typeCount.typeName}
                                    <div class="ui teal basic left pointing label">${typeCount.count}</div>
                                </a>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <!--右侧标签-->
                <div class="ui segments">
                    <!--标签图标那一行-->
                    <div class="ui secondary segment">
                        <div class="ui two column grid">
                            <div class="column">
                                <i class="tags icon"></i>标签
                            </div>
                            <div class="right aligned column">
                                <a href="<%=path%>/tags/-1/1"  class="">more <i class=" angle double right icon "></i></a>
                            </div>
                        </div>
                    </div>
                    <!--标签的具体内容-->
                    <div class="ui teal segment">
                        <c:forEach items="${tagCountList}" var="tag">
                        <a href="<%=path%>/tags/${tag.tagId}/1"  class="ui teal basic left pointing label m-margin-tb-tiny">${tag.tagName}
                            <div class="detail">${tag.count}</div>
                        </a>
                        </c:forEach>
                    </div>

                </div>
                <!--右侧最新推荐-->
                <div class="ui segments">
                    <!--最新推荐那一行-->
                    <div class="ui secondary segment">
                        <i class="bookmark icon"></i>最新推荐
                    </div>
                    <c:forEach items="${recommendDocumentList}" var="recommendDocument">
                        <!--最新推荐的具体内容-->
                        <div class="ui segment">
                            <a href="<%=path%>/document/${recommendDocument.documentId}"  class="m-black m-text-thin" >${recommendDocument.title}</a>
                        </div>
                    </c:forEach>
                </div>
                <!--二维码-->
                <div class="ui horizontal divider header">
                    扫码关注我
                </div>
                <div class="ui centered card" style="width: 11em">
                    <img src="<%=path%>/resources/images/wechat.png" class="ui rounded image">
                </div>
            </div>
        </div>
    </div>
</div>
<br><br><br><br><br>
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

    $("#nextPage").click(function () {
        window.location.href='<%=path%>/'+${nextPage}
    });
    $("#prePage").click(function () {
        window.location.href='<%=path%>/'+${prePage}
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
