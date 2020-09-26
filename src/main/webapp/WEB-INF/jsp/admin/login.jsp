<%@ page import="org.springframework.web.servlet.ModelAndView" %>
<%@ page import="com.hrbeu.pojo.User" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/9/20
  Time: 11:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%String path = request.getContextPath();%>
<%User user = (User)session.getAttribute("user");%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <!--设置移动端-->
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title >登录</title>
    <!--引入css-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
    <link rel="stylesheet" href="<%=path%>/resources/css/typo.css" >
    <link rel="stylesheet" href="<%=path%>/resources/css/animate.css">
    <link rel="stylesheet" href="<%=path%>/resources/lib/prism/prism.css">
    <link rel="stylesheet" href="<%=path%>/resources/lib/tocbot/tocbot.css" >
    <link rel="stylesheet" href="<%=path%>/resources/css/me.css" >
</head>
<body>
<br>
<div class="m-container-small m-padded-tb-massive" style="max-width: 30em!important;">
    <div class="ui container">
        <div class="ui middle aligned center aligned grid">
            <div class="column">
                <h2 class="ui teal image header">
                    <!--<img src="../../static/images/logo.png" class="image">-->
                    <div class="content">
                        后台管理登录
                    </div>
                </h2>
                <form class="ui large form" method="post" id="login-form" action="<%=path%>/admin/login">
                    <div class="ui stacked segment">
                        <div class="required field">
                            <div class="ui left icon input">
                                <i class="user icon"></i>
                                <input type="text" name="username" id="username-input" placeholder="用户名">
                            </div>
                        </div>
                        <div class="field">
                            <div class="ui left icon input">
                                <i class="lock icon"></i>
                                <input type="password" name="password" id="password-input" placeholder="密码">
                            </div>
                        </div>
                        <div class="ui fluid large teal submit button" id="login">登录</div>
                    </div>
                    <div class="ui error message"></div>
                    <div class="ui message">
                        New to us?<a href="<%=path%>/admin/register">Sign Up</a>
                    </div>
                </form>
                <h1>${requestScope.errMsg}</h1>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.2/dist/jquery.min.js"></script>
<!--引入semantic的js库-->
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<script>
    $('.ui.form').form({
        fields:{
            username:{
                identifier: 'username',
                rules:[{
                    type:'empty',
                    prompt:'请输入用户名'
                }]
            },
            password:{
                identifier: 'password',
                rules:[{
                    type:'empty',
                    prompt:'请输入密码'
                }]
            }
        }
    })
</script>
</body>
</html>
