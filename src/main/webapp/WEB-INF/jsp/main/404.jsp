<%--
  Created by IntelliJ IDEA.
  User: Guozi
  Date: 2018/3/2
  Time: 9:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    pageContext.setAttribute("path", path);
    pageContext.setAttribute("basePath", basePath);
%>
<!DOCTYPE html>
<html>

<head>
    <base href="${basePath}">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>H+ 后台主题UI框架 - 404 页面</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link rel="shortcut icon" href="favicon.ico"> <link href="css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="css/font-awesome.min.css?v=4.4.0" rel="stylesheet">

    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">
    <script type="text/javascript" src="js/jquery.js"></script>
    <script src="js/plugins/sweetalert/sweetalert.min.js"></script>
    <link href="css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
</head>

<body class="gray-bg">
<div class="middle-box text-center animated fadeInDown">
    <h1>404</h1>
    <h3 class="font-bold">页面未找到！</h3>
    <script type="text/javascript">
        $(function () {
            swal({
                title: '请登陆',
                text: '2秒后自动关闭。',
                timer: 2000
            },
            function (dismiss) {
//                window.location.href = "login";
                if (dismiss === "timer") {
                    console.log('I was closed by the timer')
                    window.location.href = "login";
                } else {
                    window.location.href = "login";
                }
            }
//            swal({
//                    title: "Are you sure?",
//                    text: "You will not be able to recover this imaginary file!",
//                    type: "warning",
//                    showCancelButton: true,
//                    confirmButtonColor: "#DD6B55",
//                    confirmButtonText: "删除！",
//                    closeOnConfirm: false
//                },
//                function(isConfirm){
//                    if (isConfirm){
//                        swal({title:"删除成功！",
//                                text:"",
//                                type:"success"},
//                            function(){
//
//                            })
//                    } else {
//                        swal({title:"已取消",
//                            text:"",
//                            type:"error"})
//                    }
//                });
            );
        });
    </script>
    <div class="error-desc">
        抱歉，页面好像去火星了~
        <form class="form-inline m-t" role="form">
            <div class="form-group">
                <input type="email" class="form-control" placeholder="请输入您需要查找的内容 …">
            </div>
            <button type="submit" class="btn btn-primary">搜索</button>
        </form>
    </div>
</div>
<script src="js/jquery.min.js?v=2.1.4"></script>
<script src="js/bootstrap.min.js?v=3.3.5"></script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>

</html>