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
    

    <title>更新</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link rel="shortcut icon" href="favicon.ico"> <link href="css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">
    <script src="artDialog/lib/jquery-1.10.2.js"></script>
    <link rel="stylesheet" href="artDialog/css/ui-dialog.css">
    <script src="artDialog/dist/dialog-plus.js"></script>
    <script type="text/javascript" src="js/jquery.ajaxfileupload.js"></script>
    <!-- <script type="text/javascript">
            $(function () {
                $("#imgs").hide();
                $("#bt").click(function(){
                    $("#imgs").click();
                });
                $("input[type='file']").ajaxfileupload({
                    action:'test02',
                    onComplete:function(data){
                        $("#img").attr("src","/upload/"+JSON.stringify(data).substring(1,JSON.stringify(data).length-1));
                    }
                });
            });
        </script> -->
    <script type="text/javascript">
            function confirmInfo() {
            	//汉字
                var ch=/^[\u4e00-\u9fa5]*$/;
                var con_remark = $("#con_remark").val();
              //匹配客户姓名
                if(con_name==""){
                    $("#c_remark").css("color","red");
                    $("#c_remark").html("不能为空");
                    return false;
                }else if(!ch.test(con_remark)){
                    $("#c_remark").css("color","red");
                    $("#c_remark").html("请填写汉字");
                    return false;
                }else{
                    $("#c_remark").css("color","green");
                    $("#c_remark").html("√");
                } 
                return true;
            }
        </script>    
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
            <div class="col-sm-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <form target="_self" method="post" action="consumerRemarkUpdate.action" class="form-horizontal m-t" id="signupForm" onsubmit="return confirmInfo()">
                            <input name="con_id" value="${consumerMap.con_id }" type="hidden">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">客户图片：</label>
                                <div class="col-sm-8">
                                    <img width="100px" src="/upload/${consumerMap.con_logo }">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">客户姓名：</label>
                                <div class="col-sm-8">
                                    <input readonly="readonly" id="con_name" name="con_name" class="form-control" type="text" value="${consumerMap.con_name }">
                                       <font id="c_name"></font>
                                </div>
                            </div>
                            <div class="form-group">
                                    <label class="col-sm-3 control-label">客户备注：</label>
                                    <div class="col-sm-8">
                                        <input id="con_remark" name="con_remark" class="form-control" type="text" aria-required="true" aria-invalid="true" class="error" value="${consumerMap.con_remark }">
                                         <font id="c_remark"></font>
                                    </div>
                                </div>
                            <div class="form-group">
                                <div class="col-sm-8 col-sm-offset-3">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" class="checkbox" id="agree" name="agree"> 我已经认真阅读并同意《H+使用协议》
                                        </label>
                                    </div>
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