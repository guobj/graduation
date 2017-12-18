<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	pageContext.setAttribute("path", path);
	pageContext.setAttribute("basePath", basePath);
%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE HTML>
<html>
	<head>

		<base href="${basePath}">
		<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    

    <title>H+ 后台主题UI框架 - 表单验证 jQuery Validation</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link rel="shortcut icon" href="favicon.ico"> <link href="css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">
    <style type="text/css">
        #main{
            width: 500px;
        }
        .demo{width:450px; margin:20px auto}
        .select_side{float:left; width:200px}
         select{width:200px; height:200px;border: 1px solid #404040;font-weight: bold}
        .select_opt{float:left; width:40px; height:15%; padding-top: 80px;padding-left: 10px;}
        .select_opt p{width:26px; height:26px; margin-top:6px; background:url(img/arr.gif) no-repeat; cursor:pointer; text-indent:-999em}
        .select_opt p#toright{background-position:2px 0}
        .select_opt p#toleft{background-position:2px -22px}
        .sub_btn{clear:both; height:42px; line-height:42px; padding-top:10px; text-align:center}
    </style>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript">
$(function(){
    var leftSel = $("#selectL");
    var rightSel = $("#selectR");
    $("#toright").bind("click",function(){      
        leftSel.find("option:selected").each(function(){
            $(this).remove().appendTo(rightSel);
        });
    });
    $("#toleft").bind("click",function(){       
        rightSel.find("option:selected").each(function(){
            $(this).remove().appendTo(leftSel);
        });
    });
    leftSel.dblclick(function(){
        $(this).find("option:selected").each(function(){
            $(this).remove().appendTo(rightSel);
        });
    });
    rightSel.dblclick(function(){
        $(this).find("option:selected").each(function(){
            $(this).remove().appendTo(leftSel);
        });
    });

});
function mdiMenu() {
	var you = document.getElementsByName("you");
	for(var i=0;i<you.length;i++){
		
		you[i].selected="selected";
	}
	
	
	var form = document.getElementById("mdiForm");
	form.action="updateMenu";
	form.method="post";
	form.submit();
}
</script>
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        
        <div class="row">
            <div class="col-sm-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <form target="_self" class="form-horizontal m-t" id="mdiForm">
                            <input type="hidden" name="role_id" value="${role_id }">
                            <div class="form-group">
                                <div class="col-sm-8">
                                    <div id="main">
                                        <!-- <h2 align="center">jQuery实现列表框双向选择操作</h2> -->
                                        <div class="demo">
                                            <div class="select_side">
                                                <p align="center">未拥有权限</p>
                                                <select height="300px" size="10" id="selectL" name="selectL" multiple="multiple">
                                                    <c:forEach items="${notList }" var="menu">
                                                        <option name="wei" value="${menu.menu_id }">${menu.menu_name }</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="select_opt">
                                                <p id="toright" title="添加">&gt;</p>
                                                <p id="toleft" title="移除">&lt;</p>
                                            </div>
                                            <div class="select_side">
                                                <p align="center">已拥有权限</p>
                                                <select height="300px" size="10" id="selectR" name="selectR" multiple="multiple">
                                                    <c:forEach items="${haveList }" var="menu">
                                                        <option name="you" value="${menu.menu_id }">${menu.menu_name }</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div> 
                            
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-3">
                                    <a class="btn btn-primary" onclick="mdiMenu()">提交</a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                
            </div>
            
        </div>
    </div>
    <script src="js/jquery.min.js?v=2.1.4"></script>
    <script src="js/bootstrap.min.js?v=3.3.5"></script>
    <script src="js/content.min.js?v=1.0.0"></script>
    <script src="js/plugins/validate/jquery.validate.min.js"></script>
    <script src="js/plugins/validate/messages_zh.min.js"></script>
    <script src="js/demo/form-validate-demo.min.js"></script>
    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>

</html>