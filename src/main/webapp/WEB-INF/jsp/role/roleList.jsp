<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
            String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                    + path + "/";
            pageContext.setAttribute("path", path);
            pageContext.setAttribute("basePath", basePath);
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE HTML>
<html>
<head>
<base href="${basePath}">
<meta charset="UTF-8">
<title>H+ 后台主题UI框架 - 基础表格</title>
<link rel="shortcut icon" href="favicon.ico">
<link href="css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
<link href="css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
<link href="css/plugins/iCheck/custom.css" rel="stylesheet">
<link href="css/animate.min.css" rel="stylesheet">
<link href="css/style.min.css?v=4.0.0" rel="stylesheet">
<base target="_blank">
<script src="artDialog/lib/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="artDialog/css/ui-dialog.css">
<script src="artDialog/dist/dialog-plus.js"></script>
<script type="text/javascript">
	//分配角色
    function mdiMenu(r_id) {
        var addDialog = top.dialog({
            title: '分配资源',
            url:'mdiMenu?role_id='+r_id,
            onclose:function (){
                window.location.reload();
            }
        });
        addDialog.showModal();
    }
</script>
</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <a id="add" class="btn btn-outline btn-primary">添加</a>
                        <div class="ibox-tools">
                            <form target="_self" action="roleList">
                                角色名:
                                <input name="role_name" value="${role.role_name }">
                                <button class="btn btn-outline btn-success">查询</button>
                            </form>
                        </div>
                    </div>
                    <c:forEach items="${roleList }" var="role">
                        <div  class="col-sm-3">
                                    <div class="contact-box">
                                        <div class="text-center">
                                            <img alt="image" class="img-circle m-t-xs img-responsive" src="img/a9.jpg">
                                            <div class="m-t-xs font-bold">${role.role_name }</div>
                                            <div class="m-t-xs font-bold">
                                            <a id="resource" width="100px" onclick="mdiMenu(${role.role_id})"  target="_self" class="btn btn-outline btn-primary">分配资源</a>　
                                            <a width="100px" target="_self" class="btn btn-outline btn-danger">删除角色</a></div>
                                        </div>
                                    </div>
                                    <!-- <div class="col-sm-12"></div>
                                    <div class="clearfix"></div> -->
                        </div>
                    </c:forEach>
                    
                </div>
                
            </div>
                    <jsp:include page="../main/pages.jsp"></jsp:include>
        </div>
    </div>
    <script src="js/jquery.min.js?v=2.1.4"></script>
    <script src="js/bootstrap.min.js?v=3.3.5"></script>
    <script src="js/plugins/peity/jquery.peity.min.js"></script>
    <script src="js/content.min.js?v=1.0.0"></script>
    <script src="js/plugins/iCheck/icheck.min.js"></script>
    <script src="js/demo/peity-demo.min.js"></script>
    <script>
                    $( document ).ready( function() {
                        $( ".i-checks" ).iCheck( {
                            checkboxClass: "icheckbox_square-green",
                            radioClass: "iradio_square-green",
                        } )
                    } );
                </script>
    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>