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
                /* var f=/^[0-9]*$/; */
                var fk_goods_id = $("#fk_goods_id").val();
                var fk_sup_id = $("#fk_sup_id").val();
                var sg_price = $("#sg_price").val();
                var sg_time = $("#sg_time").val();
                var sg_remark = $("#sg_remark").val();
              //选择供应商
                if(fk_sup_id==0){
                    $("#sup_id").css("color","red");
                    $("#sup_id").html("请选择供应商");
                    return false;
                }else{
                    $("#sup_id").css("color","green");
                    $("#sup_id").html("√");
                }
              //选择商品
                if(fk_goods_id==0){
                    $("#goods_id").css("color","red");
                    $("#goods_id").html("请选择商品");
                    return false;
                }else{
                    $("#goods_id").css("color","green");
                    $("#goods_id").html("√");
                }
                //匹配价格
                if(sg_price==""){
                    $("#s_price").css("color","red");
                    $("#s_price").html("不能为空");
                    return false;
                }else if(!num2.test(sg_price)){
                    $("#s_price").css("color","red");
                    $("#s_price").html("请保留两位小数");
                    return false;
                }else{
                    $("#s_price").css("color","green");
                    $("#s_price").html("√");
                } 
                //备注
                if(sg_remark==""){
                    $("#s_remark").css("color","red");
                    $("#s_remark").html("不能为空");
                    return false;
                }else {
                    $("#s_remark").css("color","green");
                    $("#s_remark").html("√");
                }
                return true;
            }
        </script>    
    <script type="text/javascript">
        $(function(){
            var date = new Date();
            var seperator1 = "-";
            //var seperator2 = ":";
            var month = date.getMonth() + 1;
            var strDate = date.getDate();
            if (month >= 1 && month <= 9) {
                month = "0" + month;
            }
            if (strDate >= 0 && strDate <= 9) {
                strDate = "0" + strDate;
            }
            var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate;
            $("#sg_date").val(currentdate);
        })
    </script>
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <form target="_self" method="post" action="supplierGoodsAdd.action" class="form-horizontal m-t" id="signupForm" onsubmit="return confirmInfo()">
            <div class="col-sm-6">
                    <div class="ibox float-e-margins">
                        <div class="ibox-content">
                              <div class="form-group">
                                    <label class="col-sm-3 control-label">供应商：</label>
                                    <div class="col-sm-8">
                                        <select data-placeholder="选择供应商..." id="fk_sup_id" name="fk_sup_id" class="form-control" tabindex="2">
                                            <option value="0">请选择供应商</option>
                                            <c:forEach items="${supplierList }" var="supplier">
                                                <option value="${supplier.sup_id }">${supplier.sup_name }</option>
                                            </c:forEach>
                                        </select>
                                        <font id="sup_id"></font>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">商品名称：</label>
                                    <div class="col-sm-8">
                                        <select data-placeholder="选择商品名称..." id="fk_goods_id" name="fk_goods_id" class="form-control" tabindex="2">
                                            <option value="0">请选择商品名称</option>
                                            <c:forEach items="${goodsList }" var="goods">
                                                <option value="${goods.goods_id }">${goods.goods_name }</option>
                                            </c:forEach>
                                        </select>
                                        <font id="goods_id"></font>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">报价：</label>
                                    <div class="col-sm-8">
                                        <input id="sg_price" name="sg_price" class="form-control" type="text">
                                        <font id="s_price"></font>
                                    </div>
                                </div>
                                <div class="form-group" id="data_1">
                                    <label class="col-sm-3 control-label">报价时间：</label>
                                    <div class="input-group date">
                                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                        <input style="width: 250px;" id="sg_date" name="sg_date" type="text" class="form-control" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">备注：</label>
                                    <div class="col-sm-8">
                                        <input id="sg_remark" name="sg_remark" class="form-control" type="text" aria-required="true" aria-invalid="true" class="error">
                                        <font id="s_remark"></font>
                                    </div>
                                </div>
                                <div class="form-group">
                                <div class="col-sm-8 col-sm-offset-3">
                                    <button class="btn btn-primary" type="submit">提交</button>
                                </div>
                            </div>
                            </div>
                        </div>
                    </div>
                </form>
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