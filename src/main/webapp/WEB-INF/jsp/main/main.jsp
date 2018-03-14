<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	pageContext.setAttribute("path", path);
	pageContext.setAttribute("basePath", basePath);
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>

<head>
    <base href="${basePath}">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>首页</title>

    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <!--[if lt IE 8]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

    <link rel="shortcut icon" href="favicon.ico">
    <link href="css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/style.min.css?v=4.0.0" rel="stylesheet">
    <script src="artDialog/lib/jquery-1.10.2.js"></script>
    <link rel="stylesheet" href="artDialog/css/ui-dialog.css">
    <script src="artDialog/dist/dialog-plus.js"></script>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script src="js/plugins/sweetalert/sweetalert.min.js"></script>
    <link href="css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <script type="text/javascript" src="js/jsutil.js"></script>
    <style type="text/css">
        .date_now {
                background-color: #f4f4f4;
                position: absolute;
                top:15px;
                right:560px;
                width: 250px;
                height: 30px;
                border-style: white;
                border-width: 2px;
            }
    </style>
    <script type="text/javascript">
            function loginOut() {
                swal({
                        title: "Are you sure?",
                        text: "You are going to quit!",
                        type: "warning",
                        showCancelButton: true,
                        confirmButtonColor: "#DD6B55",
                        confirmButtonText: "退出！",
                        closeOnConfirm: false
                    },
                    function () {
                        $.ajax(
                            {
                                type: "get",
                                url: "loginOut",
                                contentType: 'application/json;charset=UTF-8',
                                dataType: "json",
                                traditional: true,
                                async: false,
//                                data: {"id": id},
                                success: function (data) {
//                                console.log(data.data.goods_id)
                                    swal({
                                            title: '即将退出',
                                            text: '2秒后自动关闭。',
                                            timer: 2000
                                        },
                                        function () {
                                            window.location.href = "login";
                                        });
//                                    swal("操作成功!", "已成功删除数据！", "success");
//                                    window.location.href="goodsList";
                                },
                                error: function (data) {
                                    swal({
                                            title: 'OMG，出错了',
                                            text: '2秒后自动关闭。',
                                            timer: 2000
                                        });
//                                    swal("OMG", "删除操作失败了!", "error");
//                                    window.location.href="goodsList";
                                }
                            }
                        )
                    });
            }
    </script>
</head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
    <div id="wrapper">
        <!--左侧导航开始-->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="nav-close"><i class="fa fa-times-circle"></i>
            </div>
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element">
                            <span><img width="75px" height="75px" alt="image" class="img-circle" src="/upload/${employee.emp_logo }" /></span>
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                               <span class="block m-t-xs"><strong class="font-bold">${employee.emp_name }</strong></span>
                                <span class="text-muted text-xs block">${employee.role.role_name }<b class="caret"></b></span>
                                </span>
                            </a>
                            <ul class="dropdown-menu animated fadeInRight m-t-xs">
                                <li><a class="J_menuItem" href="logoUpdate">修改头像</a>
                                </li>
                                <li><a class="J_menuItem" href="personalInfo">个人资料</a>
                                </li>
                                <li class="divider"></li>
                                <li><a href="javascript:void(0);" onclick="loginOut()">安全退出</a>
                                </li>
                            </ul>
                        </div>
                        <div class="logo-element">H+
                        </div>
                    </li>
                    <c:forEach items="${fatherMenuList }" var="father">
                    <li>
                        <a href="#">
                            <i class="fa fa-home"></i>
                            <span class="nav-label">${father.menu_name }</span>
                            <span class="fa arrow"></span>
                        </a>
                        
                        <ul class="nav nav-second-level">
                        <c:forEach items="${sonMenuList }" var="son">
                            <c:if test="${father.menu_id eq son.father_menu }">
                            <li>
                                <a class="J_menuItem" href="${son.url }" data-index="0">${son.menu_name }</a>
                            </li>
                            </c:if>
                        </c:forEach>
                        </ul>
                    </li>
                    </c:forEach>
                </ul>
            </div>
        </nav>
        <!--左侧导航结束-->
        <!--右侧部分开始-->
        <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row border-bottom">
                <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                    <ul class="nav navbar-top-links navbar-right">
                    <div class="date_now"><font id="date" size="4"></font></div>
                    <script type="text/javascript">
                        var weekend = ["星期天","星期一","星期二","星期三","星期四","星期五","星期六"];
                        function time_show(){
                            var date = new Date();
                            var seperator1 = "-";
                            var seperator2 = ":";
                            var month = date.getMonth() + 1;
                            var strDate = date.getDate();
                            if (month >= 1 && month <= 9) {
                                month = "0" + month;
                            }
                            if (strDate >= 0 && strDate <= 9) {
                                strDate = "0" + strDate;
                            }
                            var minute = date.getMinutes();
                            if(minute >= 0 && minute <= 9){
                            	minute = "0" + minute;
                            }
                            var second = date.getSeconds();
                            if(second >= 0 && second <= 9){
                            	second = "0" + second;
                            }
                            var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
                                    + " " + date.getHours() + seperator2 + minute
                                    + seperator2 + second + " "+weekend[date.getDay()];
                            $("#date").html(currentdate);
                        }
                        setInterval("time_show()", 1000);
                    </script>
                    </ul>
                </nav>
            </div>
            <div class="row content-tabs">
                <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i>
                </button>
                <nav class="page-tabs J_menuTabs">
                    <div class="page-tabs-content">
                        <a href="javascript:;" class="active J_menuTab" data-id="index">首页</a>
                    </div>
                </nav>
                <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i>
                </button>
                <div class="btn-group roll-nav roll-right">
                    <button class="dropdown J_tabClose" data-toggle="dropdown">关闭操作<span class="caret"></span>

                    </button>
                    <ul role="menu" class="dropdown-menu dropdown-menu-right">
                        <li class="J_tabShowActive"><a>定位当前选项卡</a>
                        </li>
                        <li class="divider"></li>
                        <li class="J_tabCloseAll"><a>关闭全部选项卡</a>
                        </li>
                        <li class="J_tabCloseOther"><a>关闭其他选项卡</a>
                        </li>
                    </ul>
                </div>
                <a href="login.html" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i> 退出</a>
            </div>
            <div class="row J_mainContent" id="content-main">
                <iframe id="testindex" class="J_iframe" name="iframe0" width="100%" height="100%" src="index" frameborder="0" data-id="index_v2.html" seamless></iframe>
                <%--<jsp:include page="../main/index.jsp"></jsp:include>--%>
            </div>
        </div>
        <!--右侧部分结束-->
        <!--右侧边栏开始-->
        <!--右侧边栏结束-->
        <!--mini聊天窗口开始-->
    </div>
    <script src="js/jquery.min.js?v=2.1.4"></script>
    <script src="js/bootstrap.min.js?v=3.3.5"></script>
    <script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="js/plugins/layer/layer.min.js"></script>
    <script src="js/hplus.min.js?v=4.0.0"></script>
    <script type="text/javascript" src="js/contabs.min.js"></script>
    <script src="js/plugins/pace/pace.min.js"></script>
</body>

</html>