<%@ page import="com.hrbeu.pojo.User" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/9/20
  Time: 11:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%String path = request.getContextPath();%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <!--设置移动端-->
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>发布文档</title>
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
            <a href="<%=path%>/admin/documentsIndex/1" class="active m-item item m-mobile-hide"><i class="home icon"></i>文档</a>
            <a href="<%=path%>/admin/types/1" class="m-item item m-mobile-hide"><i class="idea icon"></i>分类</a>
            <a href="<%=path%>/admin/tags/1" class="m-item item m-mobile-hide"><i class="tags icon"></i>标签</a>
            <!--头像-->
            <div class="right m-item m-mobile-hide menu">
                <div class="ui dropdown item">
                    <div class="text">
                        <img src="${sessionScope.user.image}" >
                        ${sessionScope.user.nickname}
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
            <a href="<%=path%>/admin/documents/adddocument" class="teal item active">发布</a>
            <a href="<%=path%>/admin/documentsIndex/1" class="item">列表</a>
        </div>
    </div>

</div>
<!--文档内容-->
<div class="m-padded-tb-large m-container">
    <div class="ui container">
        <div class="ui success message">
            <i class="close icon"></i>
            <div class="header">提示：</div>
            <p>上传代码、配置文件、环境、心得等文件</p>
        </div>
        <form class="ui form" action="<%=path%>/admin/documents/adddocument" method="post" id="document_form"  enctype="multipart/form-data">
            <!--输入标题-->
            <div class="required field">
                <div class="ui left labeled input">
                    <div class="ui selection compact teal basic dropdown label">
                        <input type="hidden" value="1" name="flag">
                        <i class="dropdown icon"></i>
                        <div class="text">原创</div>
                        <div class="menu">
                            <div class="item" data-value="1">原创</div>
                            <div class="item" data-value="2">转载</div>
                            <div class="item" data-value="3">翻译</div>
                        </div>
                    </div>
                    <input type="text" name="title" placeholder="标题">
                </div>
            </div>
            <!--文档描述-->
            <h2>文档摘要</h2>
            <div class="required field">
                <textarea placeholder="文档描述" name="description"></textarea>
            </div>
            <!--textarea-->
            <div class="required field">
                <div id="md-content" style="z-index: 1 !important;">
                    <textarea placeholder="文档内容" name="content" style="display: none"></textarea>
                </div>
            </div>
            <!--两个下拉框的容器-->
            <div class="two fields">
                <!--选择分类的下拉框-->
                <div class="required field">
                    <div class="ui left labeled action input">
                        <label class="ui compact teal basic label">分类</label>
                        <div class="ui fluid selection dropdown">
                            <input type="hidden" name="typeId">
                            <i class="dropdown icon"></i>
                            <div class="default text">分类</div>
                            <div class="menu">
                                <c:forEach items="${typeList}" var="type">
                                    <div class="item" data-value="${type.typeId}">${type.typeName}</div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
                <!--选择标签的下拉框-->
                <div class="field">
                    <div class="ui left labeled action input">
                        <label class="ui compact teal basic label">标签</label>
                        <div class="ui fluid multiple search selection dropdown">
                            <input type="hidden" name="tagIdList">
                            <i class="dropdown icon"></i>
                            <div class="default text">标签</div>
                            <div class="menu">
                                <c:forEach items="${tagList}" var="tag">
                                    <div class="item" data-value="${tag.tagId}">${tag.tagName}</div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--首图地址栏-->
            <div class="required field">
                <div class="ui left labeled input">
                    <label class="ui teal basic label">首图</label>
                    <input type="text" name="firstPicture" placeholder="首图引用地址" value="http://qgxs8kk0x.hb-bkt.clouddn.com/timg.jpg">
                </div>
            </div>
            <input type="hidden" name="saveorpublic" id="saveorpublic">
            <!--checkbox的容器-->
            <div class="inline fields">
                <!--是否被推荐-->
                <div class="field">
                    <input type="checkbox" name="recommend" class="hidden" id="recommend" checked>
                    <label for="recommend">推荐</label>
                </div>
                <!--是否被转载-->
                <div class="field">
                    <input type="checkbox" name="shareInfo" class="hidden" id="shareInfo">
                    <label for="shareInfo">转载</label>
                </div>
                <!--是否被赞赏-->
                <div class="field">
                    <input type="checkbox" name="appreciate" class="hidden" id="appreciate">
                    <label for="appreciate">赞赏</label>
                </div>
                <!--是否可以留言-->
                <div class="field">
                    <input type="checkbox" name="commentAble" class="hidden" id="commentAble">
                    <label for="commentAble">评论</label>
                </div>
                <h6>附属文件上传</h6>
                <input type="file"  name="codefile" multiple>
            </div>

            <div class="ui error message"></div>
            <!--三个按钮-->
            <div class="ui right aligned container">
                <button class="ui button" type="button" onclick="window.history.go(-1)">返回</button>
                <button class="ui secondary button" id="btn_save">保存</button>
                <button class="ui teal button" id="btn_public">发布</button>
            </div>
        </form>
    </div>
</div>
<!--底部容器-->
<jsp:include page="../footer.jsp"/>
<!--引入jquery-->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.2/dist/jquery.min.js"></script>
<!--引入semantic的js库-->
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<script src="<%=path%>/resources/lib/editormd/editormd.min.js"></script>
<script>
    var contentEditor;
    $(function (){
        //初始化编辑器
        contentEditor = editormd("md-content",{
            width:"100%",
            height:"500px",
            syncScrolling: "single",
            path:"<%=path%>/resources/lib/editormd/lib/"
        });
    })

    $(".menu.toggle").click(function (){
        $(".m-item").toggleClass('m-mobile-hide');
    });
    $('.ui.dropdown').dropdown({
        on:'hover'
    });
    $('.ui.form').form({
        fields:{
            title:{
                identifier: 'title',
                rules:[{
                    type:'empty',
                    prompt:'标题：请输入文档标题'
                }]
            },
            content:{
                identifier: 'content',
                rules:[{
                    type:'empty',
                    prompt:'标题：请输入文档内容'
                }]
            },
            typeId:{
                identifier: 'typeId',
                rules:[{
                    type:'empty',
                    prompt:'标题：请输入文档类别'
                }]
            },
            firstPicture:{
                identifier: 'firstPicture',
                rules:[{
                    type:'empty',
                    prompt:'标题：请输入文档首图地址'
                }]
            },
            tagIdList:{
                identifier: 'tagIdList',
                rules:[{
                    type:'empty',
                    prompt:'标题：请输入文档标签'
                }]
            },
            description:{
                identifier: 'description',
                rules:[{
                    type:'empty',
                    prompt:'标题：请输入文档描述'
                }]
            }
        }
    })

    $("#btn_save").click(function () {
        $("#saveorpublic").val("0");
        $("#document_form").submit();
    })

    $("#btn_public").click(function () {
        $("#saveorpublic").val("1");
        $("#document_form").submit();
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
