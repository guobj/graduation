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
        <title>H5模版:</title>
        <link rel="shortcut icon" href="favicon.ico"> <link href="css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
        <link href="css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
        <link href="css/plugins/iCheck/custom.css" rel="stylesheet">
        <link href="css/animate.min.css" rel="stylesheet">
        <link href="css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">
        <script src="artDialog/lib/jquery-1.10.2.js"></script>
        <link rel="stylesheet" href="artDialog/css/ui-dialog.css">
        <script src="artDialog/dist/dialog-plus.js"></script>
        <script type="text/javascript">
        $(function() {
            $("#close").click(function () {
                var dialog = top.dialog.get(window);
                dialog.close().remove();
                return false;
            });
        });
        </script>
        <script type="text/javascript">
        function goodsStockOut(go_id){
            window.location.href="${url}?go_id="+go_id;
        }
    </script>
    </head>
    <body>
        <h2>${message }</h2>
        <button type="button" class="btn btn-outline btn-info"  onclick="goodsStockOut(${go_id })">确认生成</button>
        <button id ="close" type="button" class="btn btn-outline btn-danger">取消生成</button>
    </body>
</html>