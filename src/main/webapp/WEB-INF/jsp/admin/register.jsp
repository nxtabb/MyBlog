<%@ page import="org.springframework.web.servlet.ModelAndView" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/9/20
  Time: 11:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%String path = request.getContextPath();%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <!--设置移动端-->
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title >注册</title>
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
                        注册
                    </div>
                </h2>
                <form class="ui large form" method="post" id="register-form" action="<%=path%>/admin/register">
                    <div class="ui stacked segment">
                        <div class="field">
                            <div class="ui left icon input">
                                <i class="user icon"></i>
                                <input type="text" name="username" id="username-input" placeholder="用户名">
                            </div>
                            <span id="error_username"></span>
                        </div>
                        <div class="field">
                            <div class="ui left icon input">
                                <i class="lock icon"></i>
                                <input type="password" name="password" id="password-input" placeholder="密码">
                            </div>
                            <span id="error_password"></span>
                        </div>
                        <div class="field">
                            <div class="ui left icon input">
                                <i class="user icon"></i>
                                <input type="text" name="nickname" id="nickname-input" placeholder="昵称"><span id="error_nickname"></span>
                            </div>
                        </div>
                        <div class="field">
                            <div class="ui left icon input">
                                <i class="user icon"></i>
                                <input type="text" name="email" id="email-input" placeholder="邮箱"><span id="error_email"></span>
                            </div>
                        </div>
                        <div class="ui fluid large teal submit button" id="register">注册</div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.2/dist/jquery.min.js"></script>
<!--引入semantic的js库-->
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<script>
    var flag_username = false;
    $("#username-input").blur(function (){
        var checkurl = "<%=path%>/admin/checkusername?username=";
        var username_input = $("#username-input").val()
        var err_username = $("#error_username");
        if(username_input!=''&&username_input!=null){
            err_username.text("");
            flag_username = true;
        }
        else {
            err_username.text("请输入用户名");
            flag_username = false;
            return ;
        }
        $.ajax({
            url:checkurl + username_input,
            type:'GET',
            datatype: 'json',
            success:function (data){
                if(data.success){
                    err_username.text("用户名可以使用");
                    flag_username = true;
                }
                else {
                    err_username.text("用户名已存在");
                    flag_username = false;
                }
            }
        });

    });
    var flag_password= false;
    $("#password-input").blur(function () {
        var password = $("#password-input").val();
        var reg =/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$/;
        if(reg.test(password)){
            $("#error_password").text("密码符合要求");
            flag_password = true;
        }
        else {
            $("#error_password").text("密码不符合要求，需要至少包含数字和英文，长度6-20");
            flag_password = false;              
        }


    })
    $("#register").click(function (){
        $("#register-form").submit();
    })
</script>
</body>
</html>
