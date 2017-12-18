<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	pageContext.setAttribute("path", path);
	pageContext.setAttribute("basePath", basePath);
%>
<!DOCTYPE HTML>
<html>
	<head>

		<base href="${basePath}">
		<meta charset="UTF-8">
        <link rel="shortcut icon" href="favicon.ico"> <link href="css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
        <link href="css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    
        <link href="css/animate.min.css" rel="stylesheet">
        <link href="css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">
        <script type="text/javascript" src="jquery.js"></script>
		<title>H5模版:</title>
        <style type="text/css">
            .logo {
                background-color: #fff;
                position: absolute;
                top: 90px;
                left:420px;
                width: 500px;
                height: 500px;
                border-style: white;
                border-width: 2px;
            }
        </style>
        <script type="text/javascript">
            $(function(){
            	$("#index").click(function () {
                    window.location.href="index.jsp";
                });
            });
        </script>
	</head>
	<body>
		
                <label class="col-sm-3 control-label"></label>
                <div class="col-sm-8">
                <form target="_self" action="logoUpdate.action" enctype="multipart/form-data" method="post">
                    <input type="hidden" name="emp_id" value="${emp_id }">
                    <img width="300px" src="/upload/${employee.emp_logo}" id="img1" >
                    <img src="" id="img0" width="300px">
                    <input style="width: 290px" id="file0" name="file" class="form-control" multiple="multiple" type="file" >
                    <button class="btn btn-info btn-circle btn-lg" type="submit"><i class="fa fa-check"></i>
                    </button>　　　　　　　　　　　　　　　
                    <button class="btn btn-warning btn-circle btn-lg" id="index" type="button"><i class="fa fa-times"></i>
                    </button>
                    <script type="text/javascript"> 
                            $("#file0").change(function(){
                                $("#img1").hide();
                             var objUrl = getObjectURL(this.files[0]) ;
                             console.log("objUrl = "+objUrl) ;
                             if (objUrl) {
                              $("#img0").attr("src", objUrl) ;
                             }
                            }) ;
                            //建立一個可存取到該file的url
                            function getObjectURL(file) {
                             var url = null ; 
                             if (window.createObjectURL!=undefined) { // basic
                              url = window.createObjectURL(file) ;
                             } else if (window.URL!=undefined) { // mozilla(firefox)
                              url = window.URL.createObjectURL(file) ;
                             } else if (window.webkitURL!=undefined) { // webkit or chrome
                              url = window.webkitURL.createObjectURL(file) ;
                             }
                             return url ;
                            }
                    </script>
                    </form>
                </div>
	</body>
</html>