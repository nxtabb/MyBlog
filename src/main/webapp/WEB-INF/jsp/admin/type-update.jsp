<%@ page import="com.hrbeu.pojo.User" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/9/20
  Time: 11:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%String path = request.getContextPath();%>
<%User user = (User)session.getAttribute("user");%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <!--设置移动端-->
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>新增分类</title>
    <!--引入css-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
    <link rel="stylesheet" href="<%=path%>/resources/lib/editormd/css/editormd.min.css">
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
<!--标题-->
<div class="ui attached pointing menu">
    <div class="ui container">
        <div class="right menu">
            <a href="<%=path%>/admin/types/input" class="item active">发布</a>
            <a href="<%=path%>/admin/types/1" class="teal item ">列表</a>
        </div>
    </div>

</div>
<!--博客内容-->
<div class="m-padded-tb-large m-container-small">
    <div class="ui container">
        <form class="ui form" action="<%=path%>/admin/types/updateType/${typeId}" method="post">
            <div class="field">
                <div class="ui left labeled input">
                    <label class="ui teal basic label">名称</label>
                    <input type="text" name="name" id="type_input" value="${type.typeName}" placeholder="分类名称">

                </div>
                <span id="err_type"></span>
            </div>
            <!--checkbox的容器-->

            <div class="ui error message"></div>
            <!--三个按钮-->
            <div class="ui right aligned container">
                <button class="ui button" type="button" onclick="window.history.go(-1)">返回</button>
                <button class="ui teal button">提交</button>
            </div>
        </form>
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
<br>
<br>
<br>
<br>
<br>
<br><br>
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
<script src="<%=path%>/resources/lib/editormd/editormd.min.js"></script>
<script>
    var type_flag = false;
    $(".menu.toggle").click(function (){
        $(".m-item").toggleClass('m-mobile-hide');
    });
    $('.ui.dropdown').dropdown({
        on:'hover'
    });
    $('.ui.form').form({
        fields:{
            title:{
                identifier: 'name',
                rules:[{
                    type:'empty',
                    prompt:'请输入分类内容'
                }]
            }
        }
    })
    $("#type_input").blur(function () {
        var type = $("#type_input").val();
        $.ajax({
            url:'<%=path%>/admin/types/checktype/'+type,
            type:'GET',
            datatype:'JSON',
            success:function(data) {
                if(data.success){
                    type_flag = true;
                }else {
                    alert("此分类已存在");
                    type_flag = false;
                }
            }

        })

    });
    $("#index-btn").click(function () {
        window.location.href='<%=path%>/admin/index';

    })

</script>
</body>
</html>
