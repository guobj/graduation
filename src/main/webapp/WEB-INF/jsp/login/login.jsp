<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	pageContext.setAttribute("path", path);
	pageContext.setAttribute("basePath", basePath);
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <base href="${basePath}">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

    <title>客户关系管理-登录</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/style.min.css" rel="stylesheet">
    <link href="css/login.min.css" rel="stylesheet">
    <!--[if lt IE 8]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
    <script type="text/javascript" src="js/jquery.js"></script>
    <script>
        if(window.top!==window.self){window.top.location=window.location};
    </script>
    <script language="javascript">
            function loadimage(){
            document.getElementById("randImage").src="validate?"+Math.random();
        }
    </script>
    <script type="text/javascript">
        $(function () {
            $("#submit").click(function () {
                var account = $("#account").val();
                var password = $("#password").val();
                var code = $("#code").val();
                $.ajax({
                    type: "post",
                    url: "loginDo",
                    dataType:"json",
                    traditional: true,
                    data: {"account": account,"password":password,"code":code},
                    success:function (data) {
                        swal("登录成功!", "请尽情使用！", "success");
                        window.location.href="goodsList";
                    },
                    error:function (data) {
                        swal("登录失败", "请重新登陆!", "error");
                        window.location.href="goodsList";
                    }
                });
            });
        });
    </script>
</head>

<body class="signin">
    <div class="signinpanel">
        <div class="row">
            <div class="col-sm-7">
                <div class="signin-info">
                    <div class="logopanel m-b">
                        <h1>[ FireFly ]</h1>
                    </div>
                    <div class="m-b"></div>
                    <h4>欢迎使用 <strong>FireFly CRM</strong></h4>
                    <ul class="m-b">
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势一</li>
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势二</li>
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势三</li>
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势四</li>
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势五</li>
                    </ul>
                    <strong>还没有账号？ <a href="#">立即注册&raquo;</a></strong>
                </div>
            </div>
            <div class="col-sm-5">
                <form method="post" action="loginDo">
                    <h4 class="no-margins">登录：</h4>
                    <p class="m-t-md">登录到FireFly后台主题UI框架</p>
                    <input id="account" type="text" class="form-control uname" placeholder="用户名" name="account" />
                    <input id="password" type="password" class="form-control pword m-b" placeholder="密码" name="password" />
                    <input id="code" type="text" class="form-control pword m-b" placeholder="验证码" name="code" />
                    <img id="randImage" width="80px" src="validate" align="absmiddle" style="position:relative;top:-2px;"/> <a href="javascript:loadimage();" style="color:#999;">看不清，换一张</a>
                    <font color="red">${message }</font>
                    <button type="button" onclick="" id="submit" class="btn btn-success btn-block">登录</button>
                </form>
                
            </div>
            
        </div>
        <div class="signup-footer">
            <div class="pull-left">
                &copy; 2015 All Rights Reserved. H+
            </div>
        </div>
    </div>
</body>

</html>