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

        th, td {
            vertical-align: middle;
            text-align: center;
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
                            缓急程度
                        </th>
                        <th>
                            维修负责人
                        </th>
                        <th>
                            状态
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
    <!-- 模态框（Modal） 查看-->
    <div class="modal fade " id="myLook" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" style="width: 95%; height: 600px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true">×
                    </button>
                    <h4 class="modal-title" id="myModalLook">
                        报修单详情
                    </h4>
                </div>
                <div class="modal-body">
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
                                        缓急程度
                                    </th>
                                    <th>
                                        联系人
                                    </th>
                                    <th>
                                        联系电话
                                    </th>
                                    <th>
                                        问题描述
                                    </th>
                                    <th>
                                        维修地址
                                    </th>
                                    <th>
                                        申请时间
                                    </th>
                                    <th>
                                        故障图片1
                                    </th>
                                    <th>
                                        故障图片2
                                    </th>
                                </tr>
                                </thead>
                                <tbody id="looks"></tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default"
                            data-dismiss="modal">关闭
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <!-- 模态框（Modal）修改-->
    <div class="modal fade" id="myUpdate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true">×
                    </button>
                    <h4 class="modal-title" id="myModalUpdate">
                        修改报修单信息
                    </h4>
                </div>
                <div class="modal-body">
                    <form id="modal-up" class="form-horizontal" role="form">

                    </form>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
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

    $(function () {
        //请求此页面就加载
        $.ajax({
            url: "/tbOrder/searchAll",
            data: {
                pageSize: 5
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
                url: '/tbOrder/searchAll',
                data: {
                    page: page,
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
                url: "/tbOrder/searchAll",
                data: {
                    pageSize: 5
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
                    url: '/tbOrder/searchAll',
                    data: {
                        page: page,
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
                    '<td>' + data.list[i].orderId + '</td>' +
                    '<td>' + data.list[i].machineModel + '</td>' +
                    '<td>' + data.list[i].problemLever + '</td>' +
                    '<td>' + data.list[i].tbLeader.leaderName + '</td>' +
                    '<td>' + data.list[i].statu + '</td>' +
                    '<td>' + new Date(data.list[i].addTime).format("yyyy-MM-dd") + '</td>' +
                    '<td>' +
                    '<button class="btn btn-info" name="' + data.list[i].orderId + '">查看' + '</button>&nbsp;' +
                    '<button class="btn btn-primary" name="' + data.list[i].orderId + '">修改' + '</button>&nbsp;' +
                    '<button class="btn btn-danger" name="' + data.list[i].orderId + '">删除' + '</button>' +
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
        //控制用户操作模态框
        //查看
        $("#tbody1").on('click', '.btn-info', function () {
            var id = $(this).attr("name");
            console.log(id + "=============info=====");
            $("#myLook").modal("show");
            $.ajax({
                url: '/tbOrder/selectOne/' + id,
                data: {
                    id: id,
                },
                type: 'GET',
                dataType: 'json',
                success: function (data) {
                    looking(data);
                }
            });
        });

//查看模块数据
        function looking(data) {
            //var pList = eval(data.pictureList);
            //console.log(pList);
            var html = '';

            // console.log("1111111111111111111111");
            html +=
                '<tr>' +
                '<td>' + data.orderId + '</td>' +
                '<td>' + data.machineModel + '</td>' +
                '<td>' + data.problemLever + '</td>' +
                '<td>' + data.lianxiUser + '</td>' +
                '<td>' + data.lianxiTel + '</td>' +
                '<td>' + data.problemDesc + '</td>' +
                '<td>' + data.machineAddress + '</td>' +
                '<td>' + new Date(data.addTime).format("yyyy-MM-dd") + '</td>' +
                '<td><img style="width: 200px; height: 200px" alt="图片XX" onerror="this.style.display=\'none\'" src="/upload/' + data.orderImg1 + '"</td>' +
                '<td><img style="width: 200px; height: 200px" alt="图片XX" onerror="this.style.display=\'none\'" src="/upload/' + data.orderImg2 + '"</td>' +
                '</tr>';

            $("#looks").html(html);

        };
        //更新
        $("#tbody1").on('click', '.btn-primary', function () {
            var id = $(this).attr("name");
            console.log(id + "============primary======");
            $("#myUpdate").modal("show");
            //使用模态框 和查看一样 先获取数据  然后在修改数据 进行提交
            $.ajax({
                url: '/tbOrder/selectOne/' + id,
                data: {
                    id: id,
                },
                type: 'GET',
                success: function (date) {
                    updating(date);
                }
            });
        });

        function updating(data) {
            var html = '';
            html +=

                '<div class="form-group">' +
                '<label for="orderId" class="col-sm-2 control-label">序号</label>' +
                '<div class="col-sm-10">' +
                '<input type="text" class="form-control" id="orderId" readonly value="' + data.orderId + '" name="orderId"></div></div>' +
                '<div class="form-group">' +
                '<label for="machineModel" class="col-sm-2 control-label">机器型号</label>' +
                '<div class="col-sm-10">' +
                '<input type="text" class="form-control" id="machineModel" value="' + data.machineModel + '" name="machineModel"></div></div>' +
                '<div class="form-group">' +
                '<label for="problemLever" class="col-sm-2 control-label">缓急程度</label>' +
                '<div class="col-sm-10">' +
                '<input type="text" class="form-control" id="problemLever" value="' + data.problemLever + '" name="problemLever"></div></div>' +
                '<div class="form-group">' +
                '<label for="lianxiUser" class="col-sm-2 control-label">联系人</label>' +
                '<div class="col-sm-10">' +
                '<input type="text" class="form-control" id="lianxiUser" value="' + data.lianxiUser + '" name="lianxiUser"></div></div>' +
                '<div class="form-group">' +
                '<label for="lianxiTel" class="col-sm-2 control-label">联系电话</label>' +
                '<div class="col-sm-10">' +
                '<input type="text" class="form-control" id="lianxiTel" value="' + data.lianxiTel + '" name="lianxiTel"></div></div>' +
                '<div class="form-group">' +
                '<label for="problemDesc" class="col-sm-2 control-label">报修详情</label>' +
                '<div class="col-sm-10">' +
                '<input type="text" class="form-control" id="problemDesc" value="' + data.problemDesc + '" name="problemDesc"></div></div>' +
                '<div class="form-group">' +
                '<label for="machineAddress" class="col-sm-2 control-label">报修地址</label>' +
                '<div class="col-sm-10">' +
                '<input type="text" class="form-control" id="machineAddress" value="' + data.machineAddress + '" name="machineAddress"></div></div>' +
                '<div class="form-group">' +
                '<label for="addTime" class="col-sm-2 control-label">申请时间</label>' +
                '<div class="col-sm-10">' +
                '<input type="date" class="form-control" id="addTime" value="' + new Date(data.addTime).format("yyyy-MM-dd") + '" name="addTime"></div></div>' +
                '<div class="form-group">' +
                '<div class="col-sm-offset-2 col-sm-10">' +
                '<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>&nbsp;' +
                '<button type="button" class="btn btn-primary">提交更改</button></div></div>'
            ;
            $("#modal-up").html(html);
        };

        //提交更新数据
        $("#modal-up").on('click', '.btn-primary', function () {
            console.log($('#orderId').attr("value"));
            $.ajax({
                url: '/tbOrder/update',
                data: $("#modal-up").serialize(),
                type: 'POST',
                dataType: 'JSON',
                success: function (data) {
                    if (data) {
                        alert("修改成功" + data);
                        $('#myUpdate').modal('hide');//关闭模态框
                        //location.reload();//重新加载页面
                        reajax();//重新加载页面
                    } else {
                        alert("修改失败");
                    }
                },
                error: (function (reason) {
                    alert("修改失败" + reason);
                })
            });
        });
        //删除
        $("#tbody1").on('click', '.btn-danger', function () {
            var id = $(this).attr("name");
            console.log(id + "===========danger=======");
            if (confirm("确认删除?")) {
                $.ajax({
                    url: '/tbOrder/update',
                    data: {
                        orderId: id,
                        isDeleted: 1
                    },
                    type: 'POST',
                    dataType: 'JSON',
                    success: function (data) {
                        reajax();//重新加载页面
                    }
                });
            }
        })
    });
</script>
</body>
</html>
