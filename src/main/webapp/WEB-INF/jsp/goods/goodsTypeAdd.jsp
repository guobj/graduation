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
                //保留两位小数
                var num2=/^[1-9]+(\.[0-9]{2})$/
                //字母与数字组合
                var d=/^[a-z|A-Z][a-z|A-Z|0-9|_]*$/;
                //邮箱
                var e=/^[a-z|A-Z|0-9|_|-]+@[a-z|A-Z|0-9|_|-]+(\.[a-z|A-Z|0-9|_|-]+)+$/;
                //手机号
                var f=/^1[0-9]{10}$/;
                /* var f=/^[0-9]*$/; */
                var gt_type = $("#gt_type").val();
                //匹配商品名称
                if(gt_type==""){
                    $("#g_name").css("color","red");
                    $("#g_name").html("不能为空");
                    return false;
                }else if(!ch.test(gt_type)){
                    $("#g_name").css("color","red");
                    $("#g_name").html("请填写汉字");
                    return false;
                }else{
                    $("#g_name").css("color","green");
                    $("#g_name").html("√");
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
                        <form target="_self" method="post" action="goodsTypeAdd.action" class="form-horizontal m-t" id="signupForm" enctype="multipart/form-data" onsubmit="return confirmInfo()">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">商品类型：</label>
                                <div class="col-sm-8">
                                    <input id="gt_type" name="gt_type" class="form-control" type="text">
                                    <font id="g_name"></font>
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