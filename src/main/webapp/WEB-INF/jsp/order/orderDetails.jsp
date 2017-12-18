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
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">
    <script src="artDialog/lib/jquery-1.10.2.js"></script>
    <link rel="stylesheet" href="artDialog/css/ui-dialog.css">
    <script src="artDialog/dist/dialog-plus.js"></script>
    <script type="text/javascript" src="js/jquery.ajaxfileupload.js"></script>
    <script type="text/javascript" src="jquery.js"></script>
    <script type="text/javascript">
    $(function() {
        $.post(
            "province",
            function(data) {
                for(var pro in data){
                    $("#province").append("<option value="+data[pro].provinceID+">"+data[pro].province+"</option>");
                }
            },
            "json"
        )
        $("#province").change(function() {
            $("#city").html("<option value=''>市区</option>");
            $.post(
                "city",
                {provinceID:$("#province").val()},
                function(data) {
                    for(var city in data){
                        $("#city").append("<option value="+data[city].cityID+">"+data[city].city+"</option>");
                    }
                    
                },
                "json"
            )
        })
        $("#city").change(function() {
            $("#country").html("<option value=''>县区</option>");
            $.post(
                    "country",
                    {cityID:$("#city").val()},
                    function(data) {
                        for(var country in data){
                            $("#country").append("<option value="+data[country].areaID+">"+data[country].area+"</option>"); 
                        }                           
                    },
                    "json"
            )
        })
    });
    </script>
    <script type="text/javascript">
            function confirmInfo() {
            	//汉字
                var ch=/^[\u4e00-\u9fa5]*$/;
            	//保留两位小数
                var num2=/^[1-9]+(\.[0-9]{2})$/
                //字母与数字组合
                var group=/^[a-z|A-Z][a-z|A-Z|0-9|_]*$/;
                //邮箱
                var email=/^[a-z|A-Z|0-9|_|-]+@[a-z|A-Z|0-9|_|-]+(\.[a-z|A-Z|0-9|_|-]+)+$/;
                //手机号
                var tel=/^1[0-9]{10}$/;
                //身份证
                var card=/^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/;
                //不以0开头的数字
                var age=/^[1-9]+[0-9]*$/
                /* var f=/^[0-9]*$/; */
                var emp_name = $("#emp_name").val();
                var account = $("#account").val();
                var emp_tel = $("#emp_tel").val();
                var emp_email = $("#emp_email").val();
                var emp_age = $("#emp_age").val();
                var fk_dep_id = $("#fk_dep_id").val();
                var fk_edu_id = $("#fk_edu_id").val();
                var province=$("#province").val();
                var city=$("#city").val();
                var country=$("#country").val();
                var emp_card=$("#emp_card").val();
                var fk_role_id=$("#fk_role_id").val();
                var emp_logo=$("#emp_logo").val();
                
                //匹配客户姓名
                if(emp_name==""){
                    $("#c_name").css("color","red");
                    $("#c_name").html("不能为空");
                    return false;
                }else if(!ch.test(emp_name)){
                    $("#c_name").css("color","red");
                    $("#c_name").html("请填写汉字");
                    return false;
                }else{
                    $("#c_name").css("color","green");
                    $("#c_name").html("√");
                }
              //匹配账号
                if(account==""){
                    $("#e_account").css("color","red");
                    $("#e_account").html("不能为空");
                    return false;
                }else if(!group.test(account)){
                    $("#e_account").css("color","red");
                    $("#e_account").html("请填写数字与字母组合");
                    return false;
                }else{
                    $("#e_account").css("color","green");
                    $("#e_account").html("√");
                }
                //客户电话以1开头的11尾数字
                if(emp_tel==""){
                    $("#c_tel").css("color","red");
                    $("#c_tel").html("不能为空");
                    return false;
                }else if(!tel.test(emp_tel)){
                    $("#c_tel").css("color","red");
                    $("#c_tel").html("请填写正确的手机号");
                    return false;
                }else {
                    $("#c_tel").css("color","green");
                    $("#c_tel").html("√");
                }
                //邮箱必许包含@**.两个字符
                if(emp_email==""){
                    $("#c_email").css("color","red");
                    $("#c_email").html("不能为空");
                    return false;
                }else if(!email.test(emp_email)){
                    $("#c_email").css("color","red");
                    $("#c_email").html("请填写正确的邮箱号");
                    return false;
                }else {
                    $("#c_email").css("color","green");
                    $("#c_email").html("√");
                }
              //不以0开头的数字
                if(emp_age==""){
                    $("#e_age").css("color","red");
                    $("#e_age").html("不能为空");
                    return false;
                }else if(!age.test(emp_age)){
                    $("#e_age").css("color","red");
                    $("#e_age").html("请填写正确的邮箱号");
                    return false;
                }else {
                    $("#e_age").css("color","green");
                    $("#e_age").html("√");
                }
                //选择住址
                if(province==0){
                    $("#adr_id").css("color","red");
                    $("#adr_id").html("请选择省份");
                    return false;
                }else if(city==0){
                    $("#adr_id").css("color","red");
                    $("#adr_id").html("请选择城市");
                    return false;
                }else if(country==0){
                    $("#adr_id").css("color","red");
                    $("#adr_id").html("请选择乡镇");
                    return false;
                }else {
                    $("#adr_id").css("color","green");
                    $("#adr_id").html("√");
                }
                //选择部门
                if(fk_dep_id==0){
                    $("#dep_id").css("color","red");
                    $("#dep_id").html("请选择部门");
                    return false;
                }else{
                    $("#dep_id").css("color","green");
                    $("#dep_id").html("√");
                }
              //选择学历
                if(fk_edu_id==0){
                    $("#edu_id").css("color","red");
                    $("#edu_id").html("请选择学历");
                    return false;
                }else{
                    $("#edu_id").css("color","green");
                    $("#edu_id").html("√");
                }
             
                //用户身份证
                if(emp_card==""){
                    $("#e_card").css("color","red");
                    $("#e_card").html("不能为空");
                    return false;
                }else if(!card.test(emp_card)){
                    $("#e_card").css("color","red");
                    $("#e_card").html("请输入18位数字或X");
                    return false;
                }else {
                    $("#e_card").css("color","green");
                    $("#e_card").html("√");
                }
              //选择角色
                if(fk_role_id==0){
                    $("#r_id").css("color","red");
                    $("#r_id").html("请选择角色");
                    return false;
                }else{
                    $("#r_id").css("color","green");
                    $("#r_id").html("√");
                }
                
              //上传图片
                if(emp_logo==""){
                    $("#e_logo").css("color","red");
                    $("#e_logo").html("请选择上传图片");
                    return false;
                }else{
                    $("#e_logo").css("color","green");
                    $("#e_logo").html("√");
                }
                return true;
            }
        </script>    
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <form target="_self" method="post" action="employeeAdd.action" class="form-horizontal m-t" id="signupForm" enctype="multipart/form-data" onsubmit="return confirmInfo()">
            <div class="col-sm-6">
                    <div class="ibox float-e-margins">
                        <div class="ibox-content">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">订单单号：</label>
                                    <div class="col-sm-8">
                                        <input id="or_account" name="or_account" value="${order.or_account }" readonly="readonly" class="form-control" type="text">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">订单主题：</label>
                                    <div class="col-sm-8">
                                        <input id="or_theme" name="or_theme" value="${order.or_theme }" readonly="readonly" class="form-control" type="text">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">商品名称：</label>
                                    <div class="col-sm-8">
                                        <input id="fk_goods_id" name="fk_goods_id" value="${order.goods.goods_name }" readonly="readonly" class="form-control" type="text">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">客户姓名：</label>
                                    <div class="col-sm-8">
                                        <input id="fk_con_id" name="fk_con_id" value="${order.consumer.con_name }" readonly="readonly" class="form-control" type="text" aria-required="true" aria-invalid="true" class="error">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">联系方式：</label>
                                    <div class="col-sm-8">
                                        <input id="or_tel" name="or_tel" readonly="readonly" value="${order.or_tel }" class="form-control" type="text" aria-required="true" aria-invalid="true" class="error">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">联系地址：</label>
                                    <div class="col-sm-8">
                                        <input id="adress" name="adress" readonly="readonly" 
                                        value="${order.province.province }${order.city.city }${order.country.area }${order.or_adr }" 
                                        class="form-control" type="text" aria-required="true" aria-invalid="true" class="error">
                                    </div>
                                </div>
                                
                                
                        </div>
                    </div>
                </div>
            <div class="col-sm-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        
                            <div class="form-group">
                                <label class="col-sm-3 control-label">签约时间：</label>
                                <div class="col-sm-8">
                                    <input id="or_signdate" name="or_signdate" value="${order.or_signdate }" readonly="readonly" class="form-control" type="text" placeholder="请输入身份证号码">
                                    <font id="e_card"></font>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">我方代表：</label>
                                <div class="col-sm-8">
                                    <input id="fk_emp_id" name="fk_emp_id" value="${order.employee.emp_name }" readonly="readonly" class="form-control" type="text" placeholder="请输入身份证号码">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">商品单价：</label>
                                <div class="col-sm-8">
                                    <input id="or_price" name="or_price" value="${order.or_price }" readonly="readonly" class="form-control" type="text">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">购买数量：</label>
                                <div class="col-sm-8">
                                    <input id="or_price" name="or_price" value="${order.or_nums }" readonly="readonly" class="form-control" type="text">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">商品总价：</label>
                                <div class="col-sm-8">
                                    <input id="or_sumprice" name="or_sumprice" value="${order.or_sumprice }" readonly="readonly" class="form-control" type="text">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">最晚发货：</label>
                                <div class="col-sm-8">
                                    <input id="or_senddate" name="or_senddate" value="${order.or_senddate }" readonly="readonly" class="form-control" type="text">
                                </div>
                            </div>
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