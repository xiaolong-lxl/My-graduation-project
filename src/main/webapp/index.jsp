<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html lang="utf-8">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/carousel.css">
    <style>
        h3 {
            font-weight: bold;
        }

        #footer {
            padding: 15px 0;
            background: #fff;
            border-top: 1px solid #ddd;
            text-align: center;
        }

        #topcontrol {
            color: #fff;
            z-index: 99;
            width: 30px;
            height: 30px;
            font-size: 20px;
            background: #46b8da;
            position: relative;
            right: 14px !important;
            bottom: 11px !important;
            border-radius: 3px !important;
        }

        #topcontrol:after {
            /*top: -2px;*/
            left: 8.5px;
            content: "\f106";
            position: absolute;
            text-align: center;
            font-family: FontAwesome;
        }

        #topcontrol:hover {
            color: #fff;
            background: #18ba9b;
            -webkit-transition: all 0.3s ease-in-out;
            -moz-transition: all 0.3s ease-in-out;
            -o-transition: all 0.3s ease-in-out;
            transition: all 0.3s ease-in-out;
        }

        /* 侧栏导航 */
        .sideBox {
            padding: 10px;
            height: 220px;
            background: #fff;
            margin-bottom: 10px;
            overflow: hidden;
        }

        .sideBox .hd {
            height: 30px;
            line-height: 30px;
            background: #f60;
            padding: 0 10px;
            text-align: center;
            overflow: hidden;
        }

        .sideBox .hd .more {
            color: #fff;
        }

        .sideBox .hd h3 span {
            font-weight: bold;
            font-size: 14px;
            color: #fff;
        }

        .sideBox .bd {
            padding: 5px 0 0;
        }

        #sideMenu .bd li {
            margin-bottom: 2px;
            height: 30px;
            line-height: 30px;
            text-align: center;
            overflow: hidden;
        }

        #sideMenu .bd li a {
            display: block;
            background: #EAE6DD;
        }

        #sideMenu .bd li a:hover {
            background: #D5CFBF;
        }

        /* 列表页 */
        #mainBox {
            margin-bottom: 10px;
            padding: 10px;
            background: #fff;
            overflow: hidden;
        }

        #mainBox .mHd {
            border-bottom: 2px solid #09c;
            height: 30px;
            line-height: 30px;
        }

        #mainBox .mHd h3 {
            display: initial;
            *display: inline;
            zoom: 1;
            padding: 0 15px;
            background: #09c;
            color: #fff;
        }

        #mainBox .mHd h3 span {
            color: #fff;
            font-size: 14px;
            font-weight: bold;
        }

        #mainBox .path {
            float: right;
        }

        /* 位置导航 */
        .path {
            height: 30px;
            line-height: 30px;
            padding-left: 10px;
        }

        .path a, .path span {
            margin: 0 5px;
        }

        /* 文章列表 */
        .newsList {
            padding: 10px;
            text-align: left;
        }

        .newsList li {
            background: url("../images/share/point.png") no-repeat 2px 14px;
            padding-left: 10px;
            height: 30px;
            line-height: 30px;
        }

        .newsList li a {
            display: inline-block;
            *display: inline;
            zoom: 1;
            font-size: 14px;
        }

        .newsList li .date {
            float: right;
            color: #999;
        }

        .newsList li.split {
            margin-bottom: 10px;
            padding-bottom: 10px;
            border-bottom: 1px dotted #ddd;
            height: 0px;
            line-height: 0px;
            overflow: hidden;
        }

        /* 通用带图片的信息列表_普通式 */
        .picList {
            padding: 10px;
            text-align: left;
        }

        .picList li {
            margin: 0 5px;
            height: 190px;
        }

        h3.break {
            font-size: 16px;
            display: block;
            white-space: nowrap;
            word-wrap: normal;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        h3.break > a {
            text-decoration: none;
        }

        #myCarousel {
            position: relative;
            top: 50px;
        }

        .mokuai {
            position: relative;
            left: 5%;
        }

        #logoimg {
            float: left;
            width: 150px;
            height: 50%;
            padding: 5px 5px;
        }

        .mokuai:hover {
            cursor: pointer;
        }
    </style>
</head>
<body>
<div class="navbar-wrapper ">
    <div class="container ">
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <img id="logoimg" src="${pageContext.request.contextPath}/resources/img/logo2.png"/>
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp" style="font-size:32px;">在线报修平台</a>
                </div>
                <c:if test="${account == null}">
                    <div id="navbar" class="navbar-collapse collapse" style="float:right;">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="${pageContext.request.contextPath}/page/login-user.jsp">用户登录</a></li>
                            <li><a href="${pageContext.request.contextPath}/page/login-leader.jsp">负责人登录</a></li>
                            <li><a href="${pageContext.request.contextPath}/page/register.jsp">我要注册</a></li>
                            <li class="dropdown">
                        </ul>
                    </div>
                </c:if>
                <c:if test="${account !=null && hasRole == 'hasUser'}">
                    <div id="navbar1" class="navbar-collapse collapse" style="float:right;">
                        <ul class="nav navbar-nav navbar-right">
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i
                                    class="glyphicon glyphicon-user"></i>欢迎 &nbsp; ${account}&nbsp;<span
                                    class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li>
                                        <a rel="nofollow" href="${pageContext.request.contextPath}/userpage"><i
                                            class="glyphicon glyphicon-th-large"></i> 报修申请</a>
                                    </li>
                                    <li>
                                        <a rel="nofollow" href="${pageContext.request.contextPath}/userpage-2"><i
                                            class="glyphicon glyphicon-edit"></i> 我的报修</a>
                                    </li>
                                    <li>
                                        <a rel="nofollow" href="${pageContext.request.contextPath}/userpage-3"><i
                                            class="glyphicon glyphicon-user"></i> 修改信息</a>
                                    </li>
                                    <li class="divider"></li>
                                    <li><a href="${pageContext.request.contextPath}/user/quit"><i
                                        class="glyphicon glyphicon-off"></i> 退出系统</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </c:if>
                <c:if test="${account !=null && hasRole == 'hasLeader'}">
                    <div id="navbar1" class="navbar-collapse collapse" style="float:right;">
                        <ul class="nav navbar-nav navbar-right">
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i
                                    class="glyphicon glyphicon-user"></i>欢迎 &nbsp; ${account}&nbsp;<span
                                    class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu">

                                    <li>
                                        <a rel="nofollow" href="${pageContext.request.contextPath}/leaderpage"><i
                                            class="glyphicon glyphicon-th-large"></i>报修申请单</a>
                                    </li>
                                    <li>
                                        <a rel="nofollow" href="${pageContext.request.contextPath}/gaipaipage"><i
                                            class="glyphicon glyphicon-th-large"></i>改派申请</a>
                                    </li>
                                    <li>
                                        <a rel="nofollow" href="${pageContext.request.contextPath}/qjListpage"><i
                                            class="glyphicon glyphicon-th-large"></i>请假申请单</a>
                                    </li>
                                    <li>
                                        <a rel="nofollow"
                                           href="${pageContext.request.contextPath}/tbQingjia/inQingJiaPage?leaderAccount=${account}"><i
                                            class="glyphicon glyphicon-th-large"></i>请假申请</a>
                                    </li>
                                    <li>
                                        <a rel="nofollow" href="${pageContext.request.contextPath}/leaderpage-3"><i
                                            class="glyphicon glyphicon-user"></i> 修改信息</a>
                                    </li>
                                    <li class="divider"></li>
                                    <li><a href="${pageContext.request.contextPath}/user/quit"><i
                                        class="glyphicon glyphicon-off"></i> 退出系统</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </c:if>
                <c:if test="${account !=null && hasRole == 'hasAdmin'}">
                    <div id="navbar1" class="navbar-collapse collapse" style="float:right;">
                        <ul class="nav navbar-nav navbar-right">
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i
                                    class="glyphicon glyphicon-user"></i>欢迎 &nbsp; ${account}&nbsp;<span
                                    class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu">
                                        <%--留空--%>
                                    <li class="divider"></li>
                                    <li><a href="${pageContext.request.contextPath}/user/quit"><i
                                        class="glyphicon glyphicon-off"></i> 退出系统</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </c:if>
            </div>
        </nav>

    </div>
</div>


<!-- Carousel
================================================== -->
<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <img src="${pageContext.request.contextPath}/resources/img/carousel-2.jpg" alt="First slide">
        </div>
        <div class="item">
            <img src="${pageContext.request.contextPath}/resources/img/carousel-1.jpg" alt="Second slide">
        </div>
        <div class="item">
            <img src="${pageContext.request.contextPath}/resources/img/carousel-3.jpg" alt="Third slide">
        </div>
    </div>
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right"></span>
        <span class="sr-only">Next</span>
    </a>
</div><!-- /.carousel -->


<!-- Marketing messaging and featurettes
================================================== -->
<!-- Wrap the rest of the page in another container to center all the content. -->

<div class="container marketing">

    <!-- Three columns of text below the carousel -->
    <div class="row">
        <div class="col-lg-4 mokuai">
            <img class="img-circle" src="${pageContext.request.contextPath}/resources/img/zujian1.jpg"
                 alt="Generic placeholder image" style="width: 140px; height: 140px;">
            <h2 class="bt">电脑入门</h2>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4 mokuai">
            <img class="img-circle" src="${pageContext.request.contextPath}/resources/img/zujian3.jpg"
                 alt="Generic placeholder image" style="width: 140px; height: 140px;">
            <h2 class="bt">常见故障</h2>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4 mokuai">
            <img class="img-circle" src="${pageContext.request.contextPath}/resources/img/zujian7.jpg"
                 alt="Generic placeholder image" style="width: 140px; height: 140px;">
            <h2 class="bt">IT资讯</h2>
        </div><!-- /.col-lg-4 -->
    </div><!-- /.row -->
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <div class="box ui-draggable" id="mainBox">
                    <div class="mHd" style="">
                        <div class="path">
                            <a href="/projects">更多...</a>
                        </div>
                        <h3 id="biaoti">
                            展示
                            <small style="color:#FFF;">热话题</small>
                        </h3>
                    </div>
                    <div class="mBd" style="padding-top:10px;">
                        <div id="div1" class="row">

                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- FOOTER -->
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <div id="footer">
                    <div class="footerNav">
                        <a rel="nofollow" href="http://www.qf.com">关于我们</a> | <a rel="nofollow"
                                                                                 href="http://www.qf.com">服务条款</a> |<a
                        rel="nofollow" href="/page/login-admin.jsp"
                        style="text-decoration:none;color: #13A8F8; ">管理员登陆</a>| <a
                        rel="nofollow" href="http://www.qf.com">联系我们</a>
                    </div>
                    <div class="copyRight">
                        Copyright ?2019-2020bs.com 版权所有
                    </div>
                </div>

            </div>
        </div>
    </div>

</div><!-- /.container -->


<script src="${pageContext.request.contextPath}/resources/jquery/jquery-2.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/script/docs.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/script/back-to-top.js"></script>
</body>
<script>
    $(function () {

    });
</script>
</html>