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
    

    <title>H+ 后台主题UI框架 - 表单验证 jQuery Validation</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link rel="shortcut icon" href="favicon.ico"> <link href="css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">
    <script src="artDialog/lib/jquery-1.10.2.js"></script>
    <link rel="stylesheet" href="artDialog/css/ui-dialog.css">
    <script src="artDialog/dist/dialog-plus.js"></script>
    <script type="text/javascript">
            function confirmInfo() {
                //密码至少包含一个数字和字母
                var psd=/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,18}$/;
                var old_password=$("#old_password").val()
                var new_password = $("#new_password").val();
                var confirmPsd = $("#confirmPsd").val();
                $.ajax({  
                        url:"queryPsdBySession",  
                        dataType:"json",  
                        async: false,  
                        success:function(data){
                           if(old_password==""){
                               $("#oldpsd").css("color","red");
                               $("#oldpsd").html("请输入原密码");
                               return false;
                           }else if($("#old_password").val()!=data.password){
                               $("#oldpsd").css("color","red");
                               $("#oldpsd").html("原密码输入不正确");
                               return false;
                           }else if($("#old_password").val()==data.password){
                               $("#oldpsd").css("color","green");
                               $("#oldpsd").html("√");
                           }
                    	   }  
                  });  
                if(new_password==""){
                    $("#psd").css("color","red");
                    $("#psd").html("请输入新密码");
                    return false;
                }else if(!psd.test(new_password)){
                    $("#psd").css("color","red");
                    $("#psd").html("请填写6-18位的字母与数字的组合");
                    return false;
                }else if(confirmPsd==""){
                    $("#conPsd").css("color","red");
                    $("#conPsd").html("请再次输入新密码");
                    return false;
                }else if(confirmPsd!=new_password){
                    $("#conPsd").css("color","red");
                    $("#conPsd").html("两次密码不一致");
                    return false;
                }else{
                    $("#psd").css("color","green");
                    $("#psd").html("√");
                } 
                return true;
            }
        </script>    
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight" style="width: 2600px">
            <div class="col-sm-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-content" >
                        <form method="post" action="passwordMdi.action" class="form-horizontal m-t" id="commentForm" enctype="multipart/form-data" onsubmit="return confirmInfo()">
                            <input type="hidden" name="emp_id" value="${emp_id }">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">原密码：</label>
                                <div class="col-sm-8">
                                    <input style="width: 300px" id="old_password" name="old_password" placeholder="请输入旧密码" class="form-control" type="password">
                                    <font id="oldpsd"></font>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">新密码：</label>
                                <div class="col-sm-8">
                                    <input style="width: 300px" id="new_password" name="password" placeholder="请输入新密码" class="form-control" type="password">
                                    <font id="psd"></font>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">确认密码：</label>
                                <div class="col-sm-8">
                                    <input style="width: 300px" id="confirmPsd" name="confirmPsd" placeholder="请再次输入新密码" class="form-control" type="password">
                                    <font id="conPsd"></font>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-8 col-sm-offset-3">
                                    <button class="btn btn-primary" type="submit">提交</button>
                                </div>
                            </div>
                        </form>
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