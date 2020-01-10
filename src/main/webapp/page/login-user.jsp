<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="utf-8">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="keys" content="">
    <meta name="author" content="">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">
    <style>
        h2 {
            color: #2a6496;
        }

        #reloadImage {

            position: absolute;
            left: 200px;
            top: 8px;
        }

        .glyphicon {
            color: #2a6496;
        }

        #logoimg {
            width: 150px;
            position: absolute;
            left: 15px;
            padding: 5px 5px;
        }

        #logodiv {
            position: absolute;
            left: 165px;
        }
        #mydiv2{
            position: absolute;
            left: 110%;
            top: 10%;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <img id="logoimg" src="${pageContext.request.contextPath}/resources/img/logo2.png"/>
            <div id="logodiv"><a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp"
                                 style="font-size:32px;">在线报修平台</a></div>
        </div>
        <div id="navbar" class="navbar-collapse collapse" style="float:right;">
            <ul class="nav navbar-nav ">
                <li><a href="${pageContext.request.contextPath}/page/login-leader.jsp">负责人登录</a></li>
                <li><a href="${pageContext.request.contextPath}/page/register.jsp">我要注册</a></li>
                <li><a href="${pageContext.request.contextPath}/index.jsp">返回首页</a></li>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="row" id="mydiv">
    <div class="container col-md-3 col-md-offset-4">

        <form action="${pageContext.request.contextPath}/tbUser/login-user" method="post" class="form-signin"
              role="form">
            <h2 class="form-signin-heading"><i class="glyphicon glyphicon-user"></i> 用户登录</h2>
            <div class="form-group has-success has-feedback">
                <input value="zhangsan" type="text" class="form-control" id="inputSuccess1" name="userAccount" placeholder="请输入登录账号"
                       autofocus>
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
            </div>
            <div class="form-group has-success has-feedback">
                <input value="111111111" type="password" class="form-control" id="inputSuccess2" name="userPassword" placeholder="请输入登录密码"
                       style="margin-top:10px;">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="form-group has-success has-feedback">
                <label class="block clearfix">
                    <input class="form-control" type="text" name="verifyCode" id="verifyCode" style="width: 200px"
                           placeholder="请输入验证码"/>
                    <img src="${pageContext.request.contextPath}/captcha/image" id="reloadImage" width="100px"
                         height="32px"/>
                </label>
            </div>
            <div class="form-group has-success has-feedback">
                <input type="text" class="form-control" readonly placeholder="登陆状态信息"
                       style="margin-top:10px;opacity: 0.7;border: #A5A5A5;color: red;" value="${msg}">
            </div>
            <div class="checkbox">
                <label>
                    <input type="checkbox" value="remember-me"> 记住我
                </label>
                <label style="float:right">
                    <a href="register.jsp">我要注册</a>
                </label>
            </div>
            <input type="submit" class="form-control btn btn-primary" value="登陆"/>
        </form>
        <div class="col-md-6 " id="mydiv2">
            <hr>
            <h3 class="text-info ">须知 <span class="glyphicon glyphicon glyphicon-hand-down "></span></h3>
            <hr>
            <p class="text-info">一、为了保障您能登陆成功，请您访问正确的页面。</p>
        </div>

    </div>
</div>
<script src="${pageContext.request.contextPath}/resources/jquery/jquery-2.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script>
    jQuery(function ($) {
        //刷新验证码
        $("#reloadImage").on("click", function () {
            $("#reloadImage").attr("src", $("#reloadImage").attr("src") + "?time=" + Math.random()); //显示图片
        });
    });
</script>
</body>
</html>