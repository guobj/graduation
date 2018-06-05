<%--
  Created by IntelliJ IDEA.
  User: Guozi
  Date: 2018/2/26
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    pageContext.setAttribute("path", path);
    pageContext.setAttribute("basePath", basePath);
%>
<!DOCTYPE html>
<html>

<head>

    <base href="${basePath}">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>客户关系管理 - 登录</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link rel="shortcut icon" href="favicon.ico"> <link href="css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="css/font-awesome.min.css?v=4.4.0" rel="stylesheet">

    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">
    <script type="text/javascript" src="js/jquery.js"></script>
    <!--[if lt IE 8]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
    <script>if(window.top !== window.self){ window.top.location = window.location;}</script>
    <script language="javascript">
        function loadimage(){
            document.getElementById("randImage").src="validate?"+Math.random();
        }
    </script>
    <style type="text/css">
        .testtitle {
            /*background-color: #f4f4f4;*/
            /*right:560px;*/
            width: 100%;
            height: 100%;
            font-size:35px;
            font-weight:540;
            letter-spacing:10px;
            margin-bottom:0;
            /*border-style: white;*/
            /*border-width: 2px;*/
            /*padding:0 auto;*/
            /*color:#e6e6e6;*/
            text-align:center;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            $("#code").change(function () {
                var code = $("#code").val();
                if(code == ${sessionScope.rand}){
                    $("#code").html("√");
                }else{
                    $("#code").html("√");
                }
            })
        })
    </script>
</head>

<body class="gray-bg">


<div class="middle-box text-center loginscreen  animated fadeInDown">
    <div>

        <div class="testtitle">
            客户关系管理
        </div>
        <h3>欢迎使用</h3>

        <form class="m-t" target="_self" method="post" action="loginDo">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="用户名" name="account" required="">
            </div>
            <div class="form-group">
                <input type="password" class="form-control" placeholder="密码" name="password" required="">
            </div>
            <div class="form-group">
                <input id="code" type="text" class="form-control" placeholder="验证码" name="code" required="">
            </div>
            <img id="randImage" width="80px" src="validate" align="absmiddle" style="position:relative;top:-2px;"/> <a href="javascript:loadimage();" style="color:#999;">看不清，换一张</a>
            <br><font color="red">${message }</font>
            <button type="submit" class="btn btn-primary block full-width m-b">登 录</button>


            <%--<p class="text-muted text-center"> <a href="login.html#"><small>忘记密码了？</small></a> | <a href="register.html">注册一个新账号</a>--%>
            <%--</p>--%>

        </form>
    </div>
</div>
<script src="js/jquery.min.js?v=2.1.4"></script>
<script src="js/bootstrap.min.js?v=3.3.5"></script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>

</html>
