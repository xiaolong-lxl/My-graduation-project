<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/theme.css">
    <style>

        footer {
            text-align: center;
            background-color: #fff;
            padding: 15px 0;
        }

        footer.fixed-bottom {
            position: fixed;
            bottom: 0;

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

        table {

        }

        th, td {
            vertical-align: middle;
            text-align: center;
            word-wrap: break-word;
        }

        img:hover {
            transform: scale(1.5, 1.5)
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
                    <ul class="nav navbar-nav navbar-right">
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
        <div class="row">
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
                                <a rel="nofollow"
                                   href="${pageContext.request.contextPath}/tbQingjia/inQingJiaPage?leaderAccount=${account}"><i
                                    class="glyphicon glyphicon-th-large"></i>请假申请</a>
                            </li>
                            <li>
                                <a rel="nofollow" href="${pageContext.request.contextPath}/leaderpage-3"><i
                                    class="glyphicon glyphicon-user"></i> 修改信息</a>
                            </li>

                        </ul>
                    </div>
                </nav>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-12 table-responsive">
                <table class="table table-hover ">
                    <thead>
                    <tr>
                        <th>
                            序号
                        </th>
                        <th>
                            标题
                        </th>
                        <th>
                            联系人
                        </th>
                        <th>
                            联系电话
                        </th>
                        <th>
                            请假日期
                        </th>
                        <th>
                            请假理由
                        </th>
                        <th>
                            申请日期
                        </th>
                        <th>
                            操作
                        </th>
                    </tr>
                    </thead>
                    <tbody id="tbody1"></tbody>
                    <tfoot id="page"></tfoot>
                </table>
            </div>
        </div>
    </div>
    <!-- FOOTER -->
    <footer class="fixed-bottom">
        <div class="container">
            <div class="row">
                <div class="col-md-12 column">

                    <a rel="nofollow" href="#">关于我们</a> | <a rel="nofollow"
                                                             href="#">服务条款</a> |<a
                    rel="nofollow" href="/page/login-admin.jsp"
                    style="text-decoration:none;color: #13A8F8; ">管理员登陆</a>| <a
                    rel="nofollow" href="#">联系我们</a>

                    <div class="copyRight">
                        King_2020@163.com ? 2020bs 个人所有
                    </div>
                </div>
            </div>
        </div>
    </footer>
</div>
<script src="${pageContext.request.contextPath}/resources/jquery/jquery-2.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/script/docs.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/script/back-to-top.js"></script>
<script>
    //js转换时间格式
    Date.prototype.format = function (format) {

        var o = {
            "M+": this.getMonth() + 1, // month
            "d+": this.getDate(), // day
            "h+": this.getHours(), // hour
            "m+": this.getMinutes(), // minute
            "s+": this.getSeconds(), // second
            "q+": Math.floor((this.getMonth() + 3) / 3), // quarter
            "S": this.getMilliseconds()
            // millisecond
        }
        if (/(y+)/.test(format)) {
            format = format.replace(RegExp.$1, (this.getFullYear() + "")
                .substr(4 - RegExp.$1.length));
        }
        for (var k in o) {
            if (new RegExp("(" + k + ")").test(format)) {
                format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k]
                    : ("00" + o[k]).substr(("" + o[k]).length));
            }
        }
        return format;
    }

    //判断数据是否为Null或者undefined或者为空字符串
    function CheckIsNullOrEmpty(value) {
        //正则表达式用于判斷字符串是否全部由空格或换行符组成
        var reg = /^\s*$/
        //返回值为true表示不是空字符串
        return (value != null && value != undefined && !reg.test(value))
    }

    //获取url中的参数
    function getUrlParam(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
        var r = window.location.search.substr(1).match(reg);  //匹配目标参数
        if (r != null) return unescape(r[2]);
        return null; //返回参数值
    }

    $(function () {
        // var leaderId = getUrlParam("leaderId");  问题是  直接其他页面跳转  没有leader属性
        var leaderId = '<%=session.getAttribute("leaderId")%>';
        console.log(leaderId + "=============")
        //请求此页面就加载
        $.ajax({
            url: "/tbQingjia/searchByLeaderId",
            data: {
                pageSize: 5,
                leaderId: leaderId
            },
            type: "GET",
            success: function (data, status) {
                console.log(typeof data.list);
                show(data);
                pages(data);
            }
        });
//控制上下页面跳转
        $('body').on('click', '.pageCount', function () {
            var page = $(this).attr("name");
            $.ajax({
                url: '/tbQingjia/searchByLeaderId',
                data: {
                    page: page,
                    leaderId: leaderId
                },
                type: 'GET',
                success: function (data) {
                    show(data);
                    pages(data);
                }
            });
        });

//重新局部加载数据
        function reajax() {
            $.ajax({
                url: "/tbQingjia/searchByLeaderId",
                data: {
                    pageSize: 5,
                    leaderId: leaderId
                },
                type: "GET",
                success: function (data, status) {
                    console.log(typeof data.list);
                    show(data);
                    pages(data);
                }
            });
            $('body').on('click', '.pageCount', function () {
                var page = $(this).attr("name");
                $.ajax({
                    url: '/tbQingjia/searchByLeaderId',
                    data: {
                        page: page,
                        leaderId: leaderId
                    },
                    type: 'GET',
                    success: function (data) {
                        show(data);
                        pages(data);
                    }
                });
            });
        };

//展示数据模块
        function show(data) {
            var html = '';
            for (var i = 0; i < data.list.length; i++) {
                html +=
                    '<tr>' +
                    '<td>' + data.list[i].qingjiaId + '</td>' +
                    '<td>' + data.list[i].qingjiaTitle + '</td>' +
                    '<td >' + data.list[i].leaderName + '</td>' +
                    '<td >' + data.list[i].leaderTel + '</td>' +
                    '<td>' + new Date(data.list[i].startTime).format("yyyy-MM-dd") +
                    '至' + new Date(data.list[i].endTime).format("yyyy-MM-dd") + '</td>' +
                    '<td >' + data.list[i].qingjiaWhy + '</td>' +
                    '<td >' + new Date(data.list[i].addTime).format("yyyy-MM-dd")  + '</td>' +
                    '<td>' +
                    '<button class="btn btn-primary" name="' + data.list[i].qingjiaId + '" value="' + data.list[i].qingjiaId + '">取消申请' + '</button>&nbsp;' +
                    '</td>' +
                    '</tr>'
            }
            $("#tbody1").html(html);
        };

//分页模块
        function pages(data) {
            var html = '';
            html +=
                '<div class="table-responsive">' +
                '<table class="table  table-bordered"><tr><td colspan="7" align="center">当前' +
                data.pageNum + '页,总' + data.pages + '页,总' + data.total + '条记录</td></tr>' +
                '<tr><td colspan="7" align="center"><ul class="pagination">' +
                '<li><a class="pageCount" name="1">首页</a></li>';
//判断是否有上一页
            if (data.hasPreviousPage) {
                html += '<li><a class="pageCount" name="' + data.prePage + '" aria-label="Previous">' +
                    '<span aria-hidden="true">&laquo;</span></a></li>';
            }
//遍历一共有几页数据
            for (var i = 0; i < data.navigatepageNums.length; i++) {
                //console.log(data.navigatepageNums[i]);

                if (data.navigatepageNums[i] == data.pageNum) {
                    html +=
                        '<li class="active"><a href="#">' + data.navigatepageNums[i] + '</a></li>'
                } else {
                    html +=
                        '<li><a href="#" class="pageCount" name="' + data.navigatepageNums[i] + '">' + data.navigatepageNums[i] + '</a></li>'
                }
            }
            //判断是否有下一页
            if (data.hasNextPage) {
                html += '<li><a class="pageCount" name="' + data.nextPage + '" aria-label="Next">' +
                    '<span aria-hidden="true">&raquo;</span></a></li>';
            }
            //最后一页
            html +=
                '<li><li>' +
                '<a class="pageCount" name="' + data.pages + '">末页</a>' +
                '</li></ul></tr></tfoot></table></div>';
            $("#page").html(html);
        };
        $("#tbody1").on('click', '.btn-primary', function () {
            var qingjiaId = $(this).val();
            //alert(1111111111111 + "=====" + qingjiaId)
            if (confirm("确定要取消请假吗?")) {
                $.ajax({
                    url: "/tbQingjia/delQingjia",
                    data: {
                        qingjiaId: qingjiaId
                    },
                    type: 'POST',
                    success: function (data) {
                        //alert("===success====="+data)
                        if (data) {
                            location.replace("/qjListpage");
                        }else {
                            alert("取消失败");
                        }
                    },
                    error: function (error) {
                        //请求出错处理
                        alert("===error=====" + date)
                    }
                })
            }
        })
    });
</script>
</body>
</html>
