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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css">
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
            left: 60%;
            top: 30%;
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
                <li><a href="${pageContext.request.contextPath}/page/login-user.jsp">用户登陆</a></li>
                <li><a href="${pageContext.request.contextPath}/page/login-leader.jsp">负责人登录</a></li>
                <li><a href="${pageContext.request.contextPath}/page/login-admin.jsp">管理员登陆</a></li>
                <li><a href="${pageContext.request.contextPath}/index.jsp">返回首页</a></li>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="row" id="mydiv">
    <div class="container col-md-3 col-md-offset-4">
        <form class="form-signin" action="${pageContext.request.contextPath}/tbUser/register" method="post" role="form">
            <h2 class="form-signin-heading"><i class="glyphicon glyphicon-log-in"></i> 报修人注册</h2>
            <div class="form-group has-success has-feedback">
                <input type="text" class="form-control" id="userAccount" name="userAccount" 
                       placeholder="请输入账号" autofocus><span style="display: none" id="sp">账号不能为空或账号长度最短6字符</span>
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
            </div>
            <div class="form-group has-success has-feedback">
                <input type="password" class="form-control" id="userPassword" name="userPassword" placeholder="请输入密码"
                       style="margin-top:10px;"><span style="display: none" id="sp2">数字字母组成不少于8位</span>
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="form-group has-success has-feedback">
                <input type="password" class="form-control" id="reuserPassword" name="reuserPassword" 
                       placeholder="请再次输入密码" style="margin-top:10px;"><span style="display: none" id="sp3">密码不一致</span>
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="form-group has-success has-feedback">
                <input type="text" class="form-control" id="username" name="username" 
                       placeholder="请输入用户名" autofocus><span style="display: none" id="sp4">用户名不能为空或用户名长度最短4字符</span>
                <span class="glyphicon glyphicon-heart-empty form-control-feedback"></span>
            </div>
            <div class="form-group has-success has-feedback">
                <input type="text" class="form-control" id="userTel" name="userTel" placeholder="请输入手机号"
                       style="margin-top:10px;" onkeyup="value=value.replace(/[^\d]/g,'')" maxlength=11>
                <span style="display: none" id="sp5">数字组成11位或8位(不加区号)</span>
                <span class="glyphicon glyphicon-earphone form-control-feedback"></span>

            </div>
            <div class="form-group has-success has-feedback">
                <input type="text" class="form-control" id="userEmail" name="userEmail" 
                       placeholder="请输入邮箱地址"
                       style="margin-top:10px;"><span style="display: none" id="sp6">邮箱格式不正确</span>
                <span class="glyphicon glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>
            <div class="form-group has-success has-feedback">
                <c:if test="${sessionScope.status == 1}">
                <input type="text" class="form-control" readonly placeholder="登陆状态信息"
                       style="margin-top:10px;opacity: 0.7;border: #A5A5A5;color: red;" value="${sessionScope.msg}">
                </c:if>
                <c:if test="${sessionScope.status == 0}">
                    <input type="text" class="form-control" readonly placeholder="登陆状态信息"
                           style="margin-top:10px;opacity: 0.7;border: #A5A5A5;color: red;" value="${sessionScope.msg}">
                </c:if>
            </div>
            <div class="checkbox">
                <label style="float:right">
                    <a href="${pageContext.request.contextPath}/page/login-user.jsp">我有账号</a>
                </label>
            </div>
            <input id="add" class="form-control btn btn-primary" type="submit" value="注册"/>
        </form>
    </div>
    <div class="col-md-3 " id="mydiv2"><hr>
        <h3 class="text-info ">注册须知 <span class="glyphicon glyphicon glyphicon-hand-down "></span></h3><hr>
        <p class="text-info">一、为了保障您的注册能通过审核，请您在报修时填写真实的资料，以便我们和您联系验证。</p><hr>

        <p class="text-info">二、用户注册后需管理员审核通过后才能使用系统，我们将最快的速度验证您的注册信息。</p>
    </div>
</div>

</body>
<script src="${pageContext.request.contextPath}/resources/jquery/jquery-2.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(function () {
        $('input').focus(function () {
            $('input').css("border-color", "#3c763d");
        });

        $('#add').click(function panduan() {
            console.log($("#userAccount").val().length);
            if ($("#userAccount").val() == "" || $("#userAccount").val().length < 6) {
                $("#userAccount").css("border-color", "red");
                $('#sp').show();
                return false;
            } else {
                $('#sp').attr("display", 'none');
            }
            if ($("#userPassword").val() == "" || $("#userPassword").val().length < 8) {
                $("#userPassword").css("border-color", "red");
                $('#sp2').show();
                return false;
            } else {
                $('#sp2').attr("display", 'none');
            }
            if ($("#reuserPassword").val() == "" || $("#reuserPassword").val().length < 8 || $("#userPassword").val() != $("#reuserPassword").val()) {
                $("#reuserPassword").css("border-color", "red");
                $('#sp3').show();
                return false;
            } else {
                $('#sp3').attr("display", 'none');
            }
            if ($("#username").val() == "" || $("#username").val().length < 4) {
                $("#username").css("border-color", "red");
                $('#sp4').show();
                return false;
            } else {
                $('#sp4').attr("display", 'none');
            }
            console.log("userTel :"+$("#userTel").val().length);
            if ($("#userTel").val() == "" || $("#userTel").val().length != 11 ) {
                $("#userTel").css("border-color", "red");
                $('#sp5').show();
                return false;
            } else {
                $('#sp5').attr("display", 'none');
            }
            var email = $("#email").val();
            var reg1 = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)/;
            if (!reg1.match(email)) {
                $("#userEmail").css("border-color", "red");
                $('#sp6').show();
                return false;
            } else {
                $('#sp6').attr("display", 'none');
            }

        })
    })
</script>
</html>