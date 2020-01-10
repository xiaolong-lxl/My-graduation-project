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
                                    <a href="${pageContext.request.contextPath}/page/login-user.jsp">请登录</a>
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

                        </ul>
                    </div>
                </nav>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <div class="row clearfix">
                    <div class="col-md-8 column">
                        <form id="addOrder" class="form-horizontal" role="form" action="/tbOrder/addOrder" method="post"
                              enctype="multipart/form-data">
                            <input type="hidden" id="msg" value="${msg}">
                            <div class="form-group ">
                                <label>
                                    标题
                                    <span id="machineModel" style="color:Red;visibility:hidden;">必填</span></label>
                                <input name="machineModel" type="text" maxlength="255" id="txtr_title"
                                       class="form-control"
                                       placeholder="报修内容标题"/>
                            </div>
                            <div class="form-group ">
                                <label>
                                    优先级</label>
                                <br/>

                                <input name="problemLever" type="text" maxlength="255" id="problemLever"
                                       class="form-control"
                                       placeholder="选填其一：立刻  普通  优先  允许暂缓  "/>
                            </div>
                            <div class="form-group ">
                                <label>
                                    联系人
                                    <span id="lianxiUser" style="color:Red;visibility:hidden;">必填</span></label>
                                <input name="lianxiUser" type="text" value="" maxlength="50" id="txtr_linkMan"
                                       class="form-control form_datetime" placeholder="输入报修联系人"/>
                            </div>
                            <div class="form-group ">
                                <label>
                                    联系电话
                                    <span id="lianxiTel" style="color:Red;visibility:hidden;">必填</span></label>
                                <input name="lianxiTel" type="text" value="" maxlength="50" id="txtr_phone"
                                       class="form-control form_datetime" placeholder="输入报修联系人电话"/>
                            </div>
                            <div class="form-group ">
                                <label>
                                    报修详细
                                    <span id="problemDesc" style="color:Red;visibility:hidden;">必填</span></label>
                                <textarea name="problemDesc" rows="5" cols="20" id="txtr_description"
                                          class="form-control form_datetime">
</textarea>
                            </div>
                            <div class="form-group ">
                                <label>
                                    报修地址
                                    <span id="machineAddress" style="color:Red;visibility:hidden;">必填</span></label>
                                <input name="machineAddress" type="text" maxlength="50" id="txtr_address"
                                       class="form-control form_datetime" placeholder="填写故障设施所在地"/>
                            </div>
                            <div class="form-group ">
                                <label>
                                    故障照片1</label>
                                <input name="file1" type="file"/>
                            </div>
                            <div class="form-group ">
                                <label>
                                    故障照片2</label>
                                <input  name="file2" type="file"/>
                                <p class=" help-block">
                                    您可选择故障照片上传,只允许上传 .jpg, .jpeg, .gif, .png, .bmp 格式图片！</p>
                            </div>
                            <div class=" form-group">
                                <input id="addInt" type="submit" class="btn btn-primary" value="提交报修申请"/>
                            </div>
                        </form>
                    </div>
                    <div class="col-md-4 column">

                        <div class="panel-heading">
                            <h3>
                                报修须知
                            </h3>
                        </div>
                        <div class="panel-body">
                            <p> 1·报修标题 ：设备的名称；如：打印机。<br>
                            <hr>
                            2·优先级：下拉菜单根据报修的紧迫性来定。<br>
                            <hr>
                            3·报修人的姓名必需填写，维修员称呼及联系。<br>
                            <hr>
                            4·报修人的联系电话，维修员好即时联系。<br>
                            <hr>
                            5·报修地址：请认真填写，好让上门的维修员明确设备故障在什么地方。<br>
                            <hr>
                            6·故障照片：可以拍照上传。<br>
                            <hr>
                            7·报修详细：描述设备故障情况，好让维修员带上相应的工具及解决办法。</p>
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

</div> <!-- /container -->

<script src="${pageContext.request.contextPath}/resources/jquery/jquery-2.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/script/docs.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/script/back-to-top.js"></script>
<script>
    $(function () {
        $("#addOrder").on('click','.btn-primary',function () {
            var hasSuccess = $("#msg").val();
            alert("====="+hasSuccess);
        })
    })
</script>
</body>
</html>
