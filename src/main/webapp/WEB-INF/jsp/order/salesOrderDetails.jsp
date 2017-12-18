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
    <link href="css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="css/plugins/chosen/chosen.css" rel="stylesheet">
    <link href="css/plugins/colorpicker/css/bootstrap-colorpicker.min.css" rel="stylesheet">
    <link href="css/plugins/cropper/cropper.min.css" rel="stylesheet">
    <link href="css/plugins/switchery/switchery.css" rel="stylesheet">
    <link href="css/plugins/jasny/jasny-bootstrap.min.css" rel="stylesheet">
    <link href="css/plugins/nouslider/jquery.nouislider.css" rel="stylesheet">
    <link href="css/plugins/datapicker/datepicker3.css" rel="stylesheet">
    <link href="css/plugins/ionRangeSlider/ion.rangeSlider.css" rel="stylesheet">
    <link href="css/plugins/ionRangeSlider/ion.rangeSlider.skinFlat.css" rel="stylesheet">
    <link href="css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
    <link href="css/plugins/clockpicker/clockpicker.css" rel="stylesheet">
    <script src="artDialog/lib/jquery-1.10.2.js"></script>
    <link rel="stylesheet" href="artDialog/css/ui-dialog.css">
    <script src="artDialog/dist/dialog-plus.js"></script>
    <script type="text/javascript" src="js/jquery.ajaxfileupload.js"></script>
    <script type="text/javascript" src="jquery.js"></script>
    <script type="text/javascript">
            function confirmInfo() {
            	//以汉字开头的地址
                var adr=/^[\u4e00-\u9fa5][\u4e00-\u9fa5|0-9]*$/;
            	//汉字
            	var ch=/^[\u4e00-\u9fa5]*$/;
            	//保留两位小数
                var num2=/^[1-9][0-9]*(\.[0-9]{2})$/
                //字母与数字组合
                var d=/^[a-z|A-Z][a-z|A-Z|0-9|_]*$/;
                //邮箱
                var email=/^[a-z|A-Z|0-9|_|-]+@[a-z|A-Z|0-9|_|-]+(\.[a-z|A-Z|0-9|_|-]+)+$/;
                //手机号
                var tel=/^1[0-9]{10}$/;
                //整数
                var num=/^[1-9]+[0-9]*$/;
                var fk_goods_id = $("#fk_goods_id").val();
                var or_price = $("#or_price").val();
                var or_sumprice = $("#or_sumprice").val();
                var or_nums = $("#or_nums").val();
              //选择客户
                if(fk_goods_id==0){
                    $("#goods_id").css("color","red");
                    $("#goods_id").html("请选择商品");
                    return false;
                }else{
                    $("#goods_id").css("color","green");
                    $("#goods_id").html("√");
                }
                //匹配价格
                if(or_price==""){
                    $("#o_price").css("color","red");
                    $("#o_price").html("不能为空");
                    return false;
                }else if(!num2.test(or_price)){
                    $("#o_price").css("color","red");
                    $("#o_price").html("请保留两位小数");
                    return false;
                }else{
                    $("#o_price").css("color","green");
                    $("#o_price").html("√");
                }
                //数量
                if(or_nums==""){
                    $("#o_nums").css("color","red");
                    $("#o_nums").html("不能为空");
                    return false;
                }else if(!num.test(or_nums)){
                    $("#o_nums").css("color","red");
                    $("#o_nums").html("请填写整数");
                    return false;
                }else{
                    $("#o_nums").css("color","green");
                    $("#o_nums").html("√");
                }
                return true;
            }
        </script>    
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
        $(function () {
			$("#or_nums").change(function () {
				$("#or_sumprice").val(Number($("#or_price").val())*Number($("#or_nums").val()))
			})
		});
    </script>
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-6">
                    <div class="ibox float-e-margins">
                        <div class="ibox-content">
                        <form target="_self" method="post" action="salesOrderDetails.action" class="form-horizontal m-t" id="signupForm" onsubmit="return confirmInfo()">
                                <input type="hidden" value="${or_id }" name="or_id">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">商品名称：</label>
                                    <div class="col-sm-8">
                                        <select data-placeholder="选择商品名称..." id="fk_goods_id" name="fk_goods_id" class="form-control" tabindex="2">
                                            <option value="0">请选择商品</option>
                                            <c:forEach items="${goodsList }" var="goods">
                                                <option value="${goods.goods_id }">${goods.goods_name }</option>
                                            </c:forEach>
                                        </select>
                                        <font id="goods_id"></font>
                                    </div>
                                </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">商品单价：</label>
                                <div class="col-sm-8">
                                    <input id="or_price" name="or_price" placeholder="请输入商品单价" class="form-control" type="text">
                                    <font id="o_price"></font>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">订购数量：</label>
                                <div class="col-sm-8">
                                    <input id="or_nums" name="or_nums" placeholder="请输入订购数量" class="form-control" type="text">
                                    <font id="o_nums"></font>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">订单总价：</label>
                                <div class="col-sm-8">
                                    <input id="or_sumprice" name="or_sumprice" placeholder="订购数量" class="form-control" type="text">
                                    <font id="o_sumprice"></font>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-8 col-sm-offset-3">
                                    <button class="btn btn-primary" type="submit">保存</button>
                                    <button id="close" class="btn btn-primary" type="button">取消</button>
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
    <script src="js/plugins/chosen/chosen.jquery.js"></script>
    <script src="js/plugins/jsKnob/jquery.knob.js"></script>
    <script src="js/plugins/jasny/jasny-bootstrap.min.js"></script>
    <script src="js/plugins/datapicker/bootstrap-datepicker.js"></script>
    <script src="js/plugins/prettyfile/bootstrap-prettyfile.js"></script>
    <script src="js/plugins/nouslider/jquery.nouislider.min.js"></script>
    <script src="js/plugins/switchery/switchery.js"></script>
    <script src="js/plugins/ionRangeSlider/ion.rangeSlider.min.js"></script>
    <script src="js/plugins/iCheck/icheck.min.js"></script>
    <script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="js/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
    <script src="js/plugins/clockpicker/clockpicker.js"></script>
    <script src="js/plugins/cropper/cropper.min.js"></script>
    <script src="js/demo/form-advanced-demo.min.js"></script>
    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>

</html>