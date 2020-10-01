<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/9/20
  Time: 11:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%String path=request.getContextPath();%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <!--设置移动端-->
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>文件详情</title>
    <!--引入css-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
    <link rel="stylesheet" href="<%=path%>/resources/css/typo.css">
    <link rel="stylesheet" href="<%=path%>/resources/css/animate.css">
    <link rel="stylesheet" href="<%=path%>/resources/lib/prism/prism.css">
    <link rel="stylesheet" href="<%=path%>/resources/lib/tocbot/tocbot.min.js">
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
            <a href="#" class="m-item item m-mobile-hide"><i class="tags icon"></i>归档</a>
            <a href="#" class="m-item item m-mobile-hide"><i class="info icon"></i>关于我</a>
            <!--右侧搜索框-->
            <div class="right item m-mobile-hide">
                <form action="<%=path%>/search/1" method="post" target="_blank" name="search">
                    <div class="ui icon input">
                        <input type="text" placeholder="Search...." name="query">
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
<div class="m-padded-tb-large m-container-small animated fadeIn">

    <div class="ui container">
        <!--头部辅助信息：用户名/发表时间等-->
        <div class="ui top attached segment">
            <div class="ui horizontal link list">
                <div class="item">
                    <img src="https://imglf5.lf127.net/img/MkQrTXB3T3JXVzZ3Wld6Y1FRNms5VUdYV0tUSDJhQ21IVzJwREtIa3VnVHhjdmdsenRRb0ZRPT0.jpg?imageView&thumbnail=1680x0&quality=96&stripmeta=0&type=jpg" class="ui avatar image">
                    <div class="content">
                        <a href="#" class="header">${document.user.nickname}</a>
                    </div>
                </div>
                <div class="item">
                    <i class="calendar icon"></i><fmt:formatDate value="${document.lastEditTime}" pattern="yyyy-MM-dd"/>
                </div>
                <div class="item">
                    <i class="eye icon"></i>${document.viewCount}
                </div>
            </div>
        </div>
        <!--图片区域-->
        <div class="ui attached segment">
            <img class="ui fluid image rounded" src="${document.firstPicture}">

        </div>
        <!--显示信息的表格-->
        <table class="ui compact teal table">
            <thead>
            <tr>
                <th>附属文件名称</th>
                <th>附属文件大小(MB)</th>
                <th>文档上传时间</th>
                <th>最后更新时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:if test="${fileLenList!=null}">
                <c:forEach items="${fileLenList}" var="file">
                <tr>
                    <td>${file.file.fileOriginName}</td>
                    <td><fmt:formatNumber value="${file.length}" maxFractionDigits="3"/> </td>
                    <td><fmt:formatDate value="${file.file.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
                    <td><fmt:formatDate value="${file.file.lastEditTime}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
                    <td>
                        <a href="<%=path%>/admin/files/downloadFile/${file.file.fileId}" class="ui mini teal button">下载</a>
                    </td>
                </tr>
                </c:forEach>
            </c:if>
            </tbody>
        </table>
        <!--主要内容区域-->
        <div class="ui attached padded segment">
            <div class="ui right aligned basic segment">
                <div class="ui label orange basic ">${flagStr}</div>
            </div>
            <h1 class="ui center aligned header">
                ${document.title}
            </h1>
            <br>
            <div id="content" class="typo typo-selection js-toc-content m-padded-lr-responsive m-padded-tb-large ">
                ${contentHtml}
            </div>
            <!--文章标签-->

            <div class="m-padded-lr">
                <c:forEach items="${document.tagList}" var="tag">
                <div class="ui basic teal left pointing label">
                    ${tag.tagName}
                </div>
                </c:forEach>
            </div>

            <!--赞赏-->
            <c:if test="${document.appreciate==1}">
                <div class="ui center aligned segment basic">
                    <button id="payButton" class="ui orange basic circular button">赞赏</button>
                </div>
            </c:if>
            <!--点击赞赏出现的二维码区域-->
            <div class="ui payQR flowing popup transition hidden">
                <div class="ui orange basic label">
                    <div class="ui images" style="font-size: inherit !important;">
                        <div class="image">
                            <img src="<%=path%>/resources/images/wechat.png" class="ui rounded bordered image" style="width: 80px">
                            <div>微信</div>
                        </div>
                    </div>
                </div>
            </div>

            <!--留言区域容器-->
            <div class="ui bottom attached segment">
                <!--留言区域列表容器-->
                <div id="comment-container" class="ui teal segment">
                    <!--留言列表-->
                    <div>
                        <div class="ui threaded comments" style="max-width: 100%;">
                            <h3 class="ui dividing header">评论</h3>
                            <c:forEach items="${commentList}" var="comment">
                            <div class="comment">
                                <div class="content">
                                    <a class="ui author user icon"><i class="user icon"></i> ${comment.nickname}<c:if test="${comment.adminComment==1}"><div class="ui mini basic teal left pointing label m-padded-mini">管理员</div></c:if></a>
                                    <div class="metadata">
                                        <span class="date"><fmt:formatDate value="${comment.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/> </span><c:if test="${sessionScope.user!=null&&comment.commnets.size()==0}"><a href="<%=path%>/deletecomment/${comment.commentId}">删除</a></c:if>
                                    </div>
                                    <div class="text">
                                        <h3>${comment.content}</h3>
                                    </div>
                                    <div class="actions">
                                        <a class="reply" data-commentid="${comment.commentId}" data-commentnickname="${comment.nickname}" onclick="reply(this)">回复</a>
                                    </div>
                                </div>
                                <c:if test="${comment.commnets!=null&&comment.commnets.size()>0}">
                                    <c:forEach items="${comment.commnets}" var="childcomment">
                                <div class="comments">
                                    <div class="comment">
                                        <div class="content">

                                            <a class="ui author user icon"><i class="user icon"></i> ${childcomment.nickname}<c:if test="${childcomment.adminComment==1}"><div class="ui mini basic teal left pointing label m-padded-mini">管理员</div></c:if></a>
                                            <span class="m-teal">&nbsp;@${comment.nickname}</span><c:if test="${comment.adminComment==1}"><div class="ui mini basic teal left pointing label m-padded-mini">管理员</div></c:if></a>
                                            <div class="metadata">
                                                <span class="date"><fmt:formatDate value="${childcomment.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/> </span><c:if test="${sessionScope.user!=null&&childcomment.commnets.size()==0}"><a href="<%=path%>/deletecomment/${childcomment.commentId}">删除</a></c:if>
                                            </div>
                                            <div class="text">
                                                    ${childcomment.content}
                                            </div>
                                            <div class="actions">
                                                <a class="reply" data-commentid="${childcomment.commentId}" data-commentnickname="${childcomment.nickname}" onclick="reply(this)">回复</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                    </c:forEach>
                                </c:if>
                            </div>
                            </c:forEach>
                        </div>
                    </div>
                    </div>
                </div>
                <!--提交留言的form-->
                <div id="comment-form" class="ui form">
                    <div class="required field">
                        <textarea name="content" placeholder="请输入评论信息"></textarea>
                    </div>
                    <input type="hidden" value="${document.documentId}" name="documentId">
                    <input type="hidden" name="parentId" value="-1">
                    <div class="required fields">
                        <div class="field m-mobile-wide m-margin-bottom-tiny">
                            <div class="ui left icon input">
                                <i class="user icon"></i>
                                <input type="text" name="nickname" placeholder="姓名" value="${sessionScope.user.nickname}">
                            </div>
                        </div>
                        <div class="field m-mobile-wide m-margin-bottom-tiny">
                            <div class="ui left icon input">
                                <i class="mail icon"></i>
                                <input type="text" name="email" placeholder="邮箱" value="${sessionScope.user.email}">
                            </div>
                        </div>

                        <div class="field m-margin-bottom-tiny m-mobile-wide">
                            <button id="comment-submit" type="button" class="ui teal button m-mobile-wide"><i class="ui edit icon "></i>发布</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--博客信息说明-->
        <div class="ui attached positive message">
            <!--分成左右两部分-->
            <div class="ui middle aligned grid">
                <!--左侧部分-->
                <div class="eleven wide column">
                    <ul class="list">
                        <li>作者：${document.user.nickname}</li>
                        <li>发表时间：<fmt:formatDate value="${document.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/> </li>
                        <li>版权声明：自由转载-非商用-保持署名</li>
                        <li>公众号转载 ：请在文本添加作者公众号二维码</li>
                    </ul>
                </div>
                <!--右侧部分-->
                <div class="five wide column">
                    <img src="<%=path%>/resources/images/wechat.png" class="ui right floated rounded bordered image" style="width: 130px">
                </div>
            </div>
        </div>
    </div>
</div>
<!--小工具条-->
<div class="m-padded-mini m-fixed m-right-bottom">
    <div class="ui vertical buttons ">
        <button type="button" class="ui toc teal button">目录</button>
        <div id="toTop-button" class="ui teal button"><i class="chevron up icon"></i></div>
    </div>
</div>

<!--点击目录出现的区域-->
<div class="ui toc-container flowing popup transition hidden" style="width: 500px;!important;">
    <ol class="js-toc" ></ol>
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
<script src="//cdn.jsdelivr.net/npm/jquery.scrollto@2.1.2/jquery.scrollTo.min.js"></script>
<script src="<%=path%>/resources/lib/prism/prism.js"></script>
<script src="<%=path%>/resources/lib/tocbot/tocbot.min.js"></script>
<script>
    $(".menu.toggle").click(function (){
        $(".m-item").toggleClass('m-mobile-hide');
    });

    $('#payButton').popup({
        popup:$('.payQR.popup'),
        on:'click',
        position:'bottom center'
    });
    tocbot.init({
        toSelector:'.js-toc',
        contentSelector:'.js-toc-content',
        headingSelector:'h1,h2',
        hasInnerContainers: true,
    });
    $('.toc.button').popup({
        popup:$('.toc-container.popup'),
        on:'click',
        position:'left center'
    })
    $("#toTop-button").click(function () {
        $(window).scrollTo(0,500);

    });
    $('.ui.form').form({
        fields:{
            content:{
                identifier: 'content',
                rules:[{
                    type:'empty',
                    prompt:'标题：请输入评论内容'
                }]
            },
            nickname:{
                identifier: 'nickname',
                rules:[{
                    type:'empty',
                    prompt:'标题：请输入昵称'
                }]
            },
            email:{
                identifier: 'email',
                rules:[{
                    type:'email',
                    prompt:'标题：请输入邮箱'
                }]
            }
        }
    });

    $("#comment-submit").click(function () {
        var flag = $('.ui.form').form('validate form');
        if(flag){
           postData();
        }
    });
    function postData() {
        $("#comment-container").load('<%=path%>/comments',
            {
                "parentId" :$("[name='parentId']").val(),
                "documentId":$("[name='documentId']").val(),
                "nickname":$("[name='nickname']").val(),
                "email":$("[name='email']").val(),
                "content":$("[name='content']").val()
            },function (responseTxt,statusTxt,xhr) {
            window.location.href = '<%=path%>/document/'+${document.documentId}
            clear();
        });
    }
    function clear() {
        $("[name='content']").val('');
        $("[name='parentId']").val(-1);
        $("[name='content']").attr("placeholder","请输入评论信息...");
    }
    function reply(obj) {
        var commentId = $(obj).data('commentid');
        var nickname = $(obj).data('commentnickname');
        $("[name='content']").attr("placeholder","@"+nickname).focus();
        $("[name='parentId']").val(commentId);
        $(window).scrollTo($("#comment-form"),500);
    }
</script>
</body>
</html>
