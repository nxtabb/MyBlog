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
    <title>博客详情</title>
    <!--引入css-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
    <link rel="stylesheet" href="<%=path%>/resources/css/typo.css">
    <link rel="stylesheet" href="<%=path%>/resources/css/animate.css">
    <link rel="stylesheet" href="<%=path%>/resources/lib/prism/prism.css">
    <link rel="stylesheet" href="<%=path%>/resources/lib/tocbot/tocbot.css">
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
            <h2 class="ui teal header item">Liujie's Lib</h2>
            <!--菜单栏-->
            <a href="#" class="m-item item m-mobile-hide" ><i class="home icon"></i>首页</a>
            <a href="#" class="m-item item m-mobile-hide"><i class="idea icon"></i> 分类</a>
            <a href="#" class="m-item item m-mobile-hide"><i class="tags icon"></i>标签</a>
            <a href="#" class="m-item item m-mobile-hide"><i class="tags icon"></i>归档</a>
            <a href="#" class="m-item item m-mobile-hide"><i class="info icon"></i>关于我</a>
            <!--右侧搜索框-->
            <div class="right item m-mobile-hide">
                <div class="ui icon input">
                    <input type="text" placeholder="Search....">
                    <i class="search link icon"></i>
                </div>
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
                        <a href="#" class="header">宁熙桐</a>
                    </div>
                </div>
                <div class="item">
                    <i class="calendar icon"></i>2020-09-16
                </div>
                <div class="item">
                    <i class="eye icon"></i>100
                </div>
            </div>
        </div>
        <!--图片区域-->
        <div class="ui attached segment">
            <img class="ui fluid image rounded" src="https://imglf5.lf127.net/img/MkQrTXB3T3JXVzZ3Wld6Y1FRNms5VUdYV0tUSDJhQ21IVzJwREtIa3VnVHhjdmdsenRRb0ZRPT0.jpg?imageView&thumbnail=1680x0&quality=96&stripmeta=0&type=jpg">

        </div>
        <!--主要内容区域-->
        <div class="ui attached padded segment">
            <div class="ui right aligned basic segment">
                <div class="ui label orange basic ">原创</div>
            </div>
            <h1 class="ui center aligned header">
                失败要趁早
            </h1>
            <br>
            <div id="content" class="typo typo-selection js-toc-content m-padded-lr-responsive m-padded-tb-large ">
                <pre><code class="language-css">p{color: red}</code> </pre>
                <p>提供2个排版实例，第一个中文实例来自于来自于<cite class="typo-unique">张燕婴</cite>的《论语》，由于古文排版涉及到的元素比较多，所以采用《论语》中《学而》的第一篇作为排版实例介绍；第2个来自到经典的
                    Lorem Ipsum，并加入了一些代码和列表等比较具有代表性的排版元素。</p>

                <h3 id="section2-1">例1：论语学而篇第一</h3>

                <p>
                    <small><b>作者：</b><abbr title="名丘，字仲尼">孔子</abbr>（
                        <time>前551年9月28日－前479年4月11日</time>
                        ）
                    </small>
                </p>

                <h4>本篇引语</h4>

                <p>
                    《学而》是《论语》第一篇的篇名。《论语》中各篇一般都是以第一章的前二三个字作为该篇的篇名。《学而》一篇包括16章，内容涉及诸多方面。其中重点是「吾日三省吾身」；「节用而爱人，使民以时」；「礼之用，和为贵」以及仁、孝、信等道德范畴。 </p>

                <h4>原文</h4>

                <p>子曰：「学而时习之，不亦说乎？有朋自远方来，不亦乐乎？人不知，而不愠，不亦君子乎？」 </p>

                <h4>译文</h4>

                <p>孔子说：「学了又时常温习和练习，不是很愉快吗？有志同道合的人从远方来，不是很令人高兴的吗？人家不了解我，我也不怨恨、恼怒，不也是一个有德的君子吗？」 </p>

                <h4>评析</h4>

                <p>宋代著名学者<u class="typo-u">朱熹</u>对此章评价极高，说它是「入道之门，积德之基」。本章这三句话是人们非常熟悉的。历来的解释都是：学了以后，又时常温习和练习，不也高兴吗等等。三句话，一句一个意思，前后句子也没有什么连贯性。但也有人认为这样解释不符合原义，指出这里的「学」不是指学习，而是指学说或主张；「时」不能解为时常，而是时代或社会的意思，「习」不是温习，而是使用，引申为采用。而且，这三句话不是孤立的，而是前后相互连贯的。这三句的意思是：自己的学说，要是被社会采用了，那就太高兴了；退一步说，要是没有被社会所采用，可是很多朋友赞同<abbr
                        title="张燕婴">我</abbr>的学说，纷纷到我这里来讨论问题，我也感到快乐；再退一步说，即使社会不采用，人们也不理解我，我也不怨恨，这样做，不也就是君子吗？（见《齐鲁学刊》1986年第6期文）这种解释可以自圆其说，而且也有一定的道理，供读者在理解本章内容时参考。
                </p>

                <p>此外，在对「人不知，而不愠」一句的解释中，也有人认为，「人不知」的后面没有宾语，人家不知道什么呢？当时因为孔子有说话的特定环境，他不需要说出知道什么，别人就可以理解了，却给后人留下一个谜。有人说，这一句是接上一句说的，从远方来的朋友向我求教，我告诉他，他还不懂，我却不怨恨。这样，「人不知」就是「人家不知道我所讲述的」了。这样的解释似乎有些牵强。</p>

                <p>总之，本章提出以学习为乐事，做到人不知而不愠，反映出孔子学而不厌、诲人不倦、注重修养、严格要求自己的主张。这些思想主张在《论语》书中多处可见，有助于对第一章内容的深入了解。</p>

                <h3 id="section2-2">例2：英文排版</h3>

                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's
                    standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a
                    type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining
                    essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum
                    passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem
                    Ipsum.</p>
                <blockquote>
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna
                    aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                </blockquote>

                <h4>The standard Lorem Ipsum passage, used since the 1500s</h4>

                <p>"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna
                    aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                    Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
                    occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."</p>

                <h4>Section 1.10.32 of "de Finibus Bonorum et Malorum", written by Cicero in 45 BC</h4>

                <p>"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam,
                    eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam
                    voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione
                    voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci
                    velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim
                    ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi
                    consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur,
                    vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"</p>
                <ul>
                    <li>If you wish to succeed, you should use persistence as your good friend, experience as your reference, prudence as
                        your brother and hope as your sentry.
                        <p>如果你希望成功，当以恒心为良友，以经验为参谋，以谨慎为兄弟，以希望为哨兵。</p>
                    </li>
                    <li>Sometimes one pays most for the things one gets for nothing.
                        <p>有时候一个人为不花钱得到的东西付出的代价最高。</p>
                    </li>
                    <li>Only those who have the patience to do simple things perfectly ever acquire the skill to do difficult things
                        easily.
                        <p>只有有耐心圆满完成简单工作的人，才能够轻而易举的完成困难的事。</p>
                    </li>
                </ul>

                <h4>You may want to create a perfect <code>&lt;hr /&gt;</code> line, despite the fact that there will never have one
                </h4>
                <hr/>
                <p><abbr title="法国作家罗切福考尔德">La Racheforcauld</abbr> said:
                    <mark>"Few things are impossible in themselves; and it is often for want of will, rather than of means, that man fails
                        to succeed".
                    </mark>
                    You just need to follow the browser's behavior, and set a right <code>margin</code> to it。it will works nice as the
                    demo you're watching now. The following code is the best way to render typo in Chinese:
                </p>
            </div>
            <!--文章标签-->
            <div class="m-padded-lr">
                <div class="ui basic teal left pointing label">
                    方法论
                </div>
            </div>
            <!--赞赏-->
            <div class="ui center aligned segment basic">
                <button id="payButton" class="ui orange basic circular button">赞赏</button>
            </div>
            <!--点击赞赏出现的二维码区域-->
            <div class="ui payQR flowing popup transition hidden">
                <div class="ui orange basic label">
                    <div class="ui images" style="font-size: inherit !important;">
                        <div class="image">
                            <img src="<%=path%>/resources/images/wechat.png" class="ui rounded bordered image" style="width: 180px">
                            <div>微信</div>
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
                        <li>作者：宁熙桐</li>
                        <li>发表时间：2020-09-15 10：00</li>
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
        <!--留言区域容器-->
        <div id="comment-container" class="ui bottom attached segment">
            <!--留言区域列表容器-->
            <div class="ui teal segment">
                <!--留言列表-->
                <div class="ui comments">
                    <h3 class="ui dividing header">Comments</h3>
                    <div class="comment">
                        <div class="content">
                            <a class="author">Matt</a>
                            <div class="metadata">
                                <span class="date">Today at 5:42PM</span>
                            </div>
                            <div class="text">
                                How artistic!
                            </div>
                            <div class="actions">
                                <a class="reply">回复</a>
                            </div>
                        </div>
                    </div>
                    <div class="comment">
                        <div class="content">
                            <a class="author">Elliot Fu</a>
                            <div class="metadata">
                                <span class="date">Yesterday at 12:30AM</span>
                            </div>
                            <div class="text">
                                <p>This has been very useful for my research. Thanks as well!</p>
                            </div>
                            <div class="actions">
                                <a class="reply">回复</a>
                            </div>
                        </div>
                        <div class="comments">
                            <div class="comment">
                                <div class="content">
                                    <a class="author">Jenny Hess</a>
                                    <div class="metadata">
                                        <span class="date">Just now</span>
                                    </div>
                                    <div class="text">
                                        Elliot you are always so right :)
                                    </div>
                                    <div class="actions">
                                        <a class="reply">回复</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="comment">
                        <div class="content">
                            <a class="author">Joe Henderson</a>
                            <div class="metadata">
                                <span class="date">5 days ago</span>
                            </div>
                            <div class="text">
                                Dude, this is awesome. Thanks so much
                            </div>
                            <div class="actions">
                                <a class="reply">回复</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--提交留言的form-->

            <div class="ui form">
                <div class="field">
                    <textarea name="content" placeholder="请输入评论信息"></textarea>
                </div>
                <div class="fields">
                    <div class="field m-mobile-wide m-margin-bottom-tiny">
                        <div class="ui left icon input">
                            <i class="user icon"></i>
                            <input type="text" name="nickname" placeholder="姓名">
                        </div>
                    </div>
                    <div class="field m-mobile-wide m-margin-bottom-tiny">
                        <div class="ui left icon input">
                            <i class="mail icon"></i>
                            <input type="text" name="email" placeholder="邮箱">
                        </div>
                    </div>
                    <div class="field m-mobile-wide">
                        <div class="ui teal button m-margin-bottom-tiny m-mobile-wide">
                            <i class="ui edit icon "></i>发布
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--小工具条-->
<div class="m-padded-mini m-fixed m-right-bottom">
    <div class="ui vertical buttons ">
        <button type="button" class="ui toc teal button">目录</button>
        <a href="#comment-container" class="ui teal button">留言</a>
        <div id="toTop-button" class="ui teal button"><i class="chevron up icon"></i></div>
    </div>
</div>


<!--点击目录出现的区域-->
<div class="ui toc-container flowing popup transition hidden" style="width: 250px!important;">
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
        headingSelector:'h1,h2,h3',
    });
    $('.toc.button').popup({
        popup:$('.toc-container.popup'),
        on:'click',
        position:'left center'
    })
    $("#toTop-button").click(function () {
        $(window).scrollTo(0,500);

    })
</script>
</body>
</html>
