<%--
  Created by IntelliJ IDEA.
  User: zZ
  Date: 2019/10/10
  Time: 09:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="zh-CN">
<head>
    <meta charset="GB18030">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/theme.css">
    <style>
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
            background: #222;
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

        .nav-tabs > li.active > a, .nav-tabs > li.active > a:focus, .nav-tabs > li.active > a:hover {
            border-bottom-color: #ddd;
        }

        .nav-tabs > li > a {
            border-radius: 0;
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
        span{
            display: none;
            color: #d43f3a;
        }
    </style>
</head>
<body>
<div class="navbar-wrapper">
    <div class="container">
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <img id="logoimg" src="${pageContext.request.contextPath}/resources/img/logo2.png"/>
                    <div id="logodiv"><a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp"
                                         style="font-size:32px;">在线报修平台</a></div>
                </div>
                <div id="navbar" class="navbar-collapse collapse" style="float:right;">
                    <ul class="nav navbar-nav">
                        <li class="dropdown">
                            <c:choose>
                                <c:when test="${account != null}">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i
                                        class="glyphicon glyphicon-user"></i> ${account}<span class="caret"></span></a>
                                </c:when>
                                <c:otherwise>
                                    <a href="${pageContext.request.contextPath}/page/login-leader.jsp">请登录</a>
                                </c:otherwise>
                            </c:choose>

                            <ul class="dropdown-menu" role="menu">
                                <li class="divider"></li>
                                <li><a href="${pageContext.request.contextPath}/user/quit"><i
                                    class="glyphicon glyphicon-off"></i> 退出系统</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</div>

<div class="container theme-showcase" role="main">

    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <nav class="navbar navbar-default" role="navigation">
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" align="right">
                        <ul class="nav navbar-nav">
                            <li>
                                <a rel="nofollow" href="${pageContext.request.contextPath}/index.jsp"><i
                                    class="glyphicon glyphicon-home"></i> 首页</a>
                            </li>
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
                                <a rel="nofollow" href="${pageContext.request.contextPath}/tbQingjia/inQingJiaPage?leaderAccount=${account}"><i
                                    class="glyphicon glyphicon-th-large"></i>请假申请</a>
                            </li>
                            <li>
                                <a rel="nofollow" href="${pageContext.request.contextPath}/leaderpage-2"><i
                                    class="glyphicon glyphicon-user"></i> 修改信息</a>
                            </li>

                        </ul>
                    </div>
                </nav>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-8 column">
                <form id="upUser" name="form1" action="/tbQingjia/addQingJiaInfo" method="post" class="form-horizontal" role="form">
                    <div class="form-group ">
                        <label>
                            标题 &nbsp;&nbsp;&nbsp;&nbsp;<span id="sp1" >标题不能为空</span>
                        </label>
                        <input id="qingjiaTitle" name="qingjiaTitle" type="text" maxlength="255" value=""
                               class="form-control"
                               placeholder="请输入标题"/>
                    </div>
                    <div class="form-group ">
                        <label>
                            联系人&nbsp;&nbsp;&nbsp;&nbsp;<span id="sp2" >联系人不能为空</span>
                            </label>
                        <input id="leaderName" name="leaderName" type="text" maxlength="50"
                               class="form-control form_datetime" value=""/>
                    </div>
                    <div class="form-group ">
                        <label>
                            联系电话&nbsp;&nbsp;&nbsp;&nbsp;<span id="sp3" >联系电话不能为空</span>
                           </label>
                        <input id="leaderTel" name="leaderTel" type="text" maxlength="50"
                               class="form-control form_datetime" value="" placeholder="请输入联系电话"/>
                    </div>
                    <div class="form-group ">
                        <label>
                            请假时间&nbsp;&nbsp;&nbsp;&nbsp;<span id="sp4" >请假时间不能为空</span>
                        </label>
                        <div class="row">
                            <div class="col-sm-5">
                                <input name="startTime" type="date" maxlength="50" id="txtle_time1" class="form-control"  placeholder="" />
                            </div>
                            <div class="col-sm-1 text-center">
                                <p>到</p></div>
                            <div class="col-sm-5">
                                <input name="endTime" type="date" maxlength="50" id="txtle_time2" class="form-control"  placeholder="" />
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label >
                            请假理由&nbsp;&nbsp;&nbsp;&nbsp;<span id="sp5" >请假理由不能为空</span>
                        </label>
                        <textarea name="qingjiaWhy" rows="5" cols="20" id="txtle_remark" class="form-control form_datetime" placeholder="理由不得少于10个字">
</textarea>
                    </div>
                    <div class="form-group "  style="display: none">
                        <input id="leaderId" name="leaderId" readonly type="text" maxlength="50"
                               class="form-control form_datetime" value="${tbLeader.leaderId}"/>
                    </div>
                    <div class=" form-group">
                        <button id="tjQingJia" type="submit" name="btnSubmit" class="btn btn-primary">提交申请</button>
                    </div>
                </form>
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

</div> <!-- /container -->

<script src="${pageContext.request.contextPath}/resources/jquery/jquery-2.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/script/docs.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/script/back-to-top.js"></script>

</body>
<script>
    $(function () {

        $('input').focus(function () {
            $('input').css("border-color", "#CCC");
        });

        $('#tjQingJia').click(function panduan() {
            console.log($("#qingjiaTitle").val().length );
            if ($("#qingjiaTitle").val() == "") {
                $("#qingjiaTitle").css("border-color", "red");
                $('#sp1').show();
                return false;
            }else {
                $('#sp1').attr("display",'none');
            }
            if ($("#leaderName").val() == "") {
                $("#leaderName").css("border-color", "red");
                $('#sp2').show();
                return false;
            }else {
                $('#sp2').attr("display",'none');
            }
            if ($("#leaderTel").val() == "") {
                $("#leaderTel").css("border-color", "red");
                $('#sp3').show();
                return false;
            }else {
                $('#sp3').attr("display",'none');
            }
            if ($("#startTime").val() == "") {
                $("#startTime").css("border-color", "red");
                $('#sp4').show();
                return false;
            }else {
                $('#sp4').attr("display",'none');
            }
            if ($("#endTime").val() == "") {
                $("#endTime").css("border-color", "red");
                $('#sp4').show();
                return false;
            }else {
                $('#sp4').attr("display",'none');
            }
            if ($("#qingjiaWhy").val() == "") {
                $("#qingjiaWhy").css("border-color", "red");
                $('#sp5').show();
                return false;
            }else {
                $('#sp5').attr("display",'none');
            }
        })
    })
</script>
</html>
