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
            //        + " " + date.getHours() + seperator2 + date.getMinutes()
            //        + seperator2 + date.getSeconds();
            var account = date.getFullYear() + month  + strDate + date.getHours() 
                      + date.getMinutes() + date.getSeconds()+(parseInt(Math.random()*10)+10000);
            $("#or_account").val(account);        
            $("#or_signdate").val(currentdate);
            $("#or_senddate").val(currentdate);
        })
    </script>
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
            	//以汉字开头的地址
                var adr=/^[\u4e00-\u9fa5][\u4e00-\u9fa5|0-9]*$/;
            	//汉字
            	var ch=/^[\u4e00-\u9fa5]*$/;
            	//保留两位小数
                var num2=/^[1-9]+(\.[0-9]{2})$/
                //字母与数字组合
                var d=/^[a-z|A-Z][a-z|A-Z|0-9|_]*$/;
                //邮箱
                var email=/^[a-z|A-Z|0-9|_|-]+@[a-z|A-Z|0-9|_|-]+(\.[a-z|A-Z|0-9|_|-]+)+$/;
                //手机号
                var tel=/^1[0-9]{10}$/;
                /* var f=/^[0-9]*$/; */
                var or_theme = $("#or_theme").val();
                var fk_con_id = $("#fk_con_id").val();
                var or_adr = $("#or_adr").val();
                var or_tel = $("#or_tel").val();
                var or_signdate = $("#or_signdate").val();
                var province=$("#province").val();
                var city=$("#city").val();
                var country=$("#country").val();
                var or_senddate=$("#or_senddate").val();
                var fk_emp_id=$("#fk_emp_id").val();
                var or_remark=$("#or_remark").val();
                
                //匹配订单主题
                if(or_theme==""){
                    $("#o_theme").css("color","red");
                    $("#o_theme").html("不能为空");
                    return false;
                }else if(!ch.test(or_theme)){
                    $("#o_theme").css("color","red");
                    $("#o_theme").html("请填写汉字");
                    return false;
                }else{
                    $("#o_theme").css("color","green");
                    $("#o_theme").html("√");
                }
              //选择客户
                if(fk_con_id==0){
                    $("#con_id").css("color","red");
                    $("#con_id").html("请选择客户");
                    return false;
                }else{
                    $("#con_id").css("color","green");
                    $("#con_id").html("√");
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
              //填写详细地址数字加汉字
                if(or_adr==""){
                    $("#o_adr").css("color","red");
                    $("#o_adr").html("不能为空");
                    return false;
                }else if(!adr.test(or_adr)){
                    $("#o_adr").css("color","red");
                    $("#o_adr").html("请填写地址和楼牌号");
                    return false;
                }else{
                    $("#o_adr").css("color","green");
                    $("#o_adr").html("√");
                }
                //客户电话以1开头的11尾数字
                if(or_tel==""){
                    $("#o_tel").css("color","red");
                    $("#o_tel").html("不能为空");
                    return false;
                }else if(!tel.test(or_tel)){
                    $("#o_tel").css("color","red");
                    $("#o_tel").html("请填写正确的手机号");
                    return false;
                }else {
                    $("#o_tel").css("color","green");
                    $("#o_tel").html("√");
                }
              //选择我方代表
                if(fk_emp_id==0){
                    $("#emp_id").css("color","red");
                    $("#emp_id").html("请选择我方代表");
                    return false;
                }else{
                    $("#emp_id").css("color","green");
                    $("#emp_id").html("√");
                }
              //填写备注
                if(or_remark==""){
                    $("#o_remark").css("color","red");
                    $("#o_remark").html("不能为空");
                    return false;
                }else{
                    $("#o_remark").css("color","green");
                    $("#o_remark").html("√");
                }
                return true;
            }
        </script>    
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <form target="_self" method="post" action="salesOrderAdd.action" class="form-horizontal m-t" id="signupForm" onsubmit="return confirmInfo()">
            <div class="col-sm-6">
                    <div class="ibox float-e-margins">
                        <div class="ibox-content">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">单号：</label>
                                    <div class="col-sm-8">
                                        <input id="or_account" name="or_account" readonly="readonly" class="form-control" type="text">
                                        <font id="o_account"></font>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">订单主题：</label>
                                    <div class="col-sm-8">
                                        <input id="or_theme" name="or_theme" placeholder="请输入主题" class="form-control" type="text" aria-required="true" aria-invalid="true" class="error">
                                         <font id="o_theme"></font>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">客户：</label>
                                    <div class="col-sm-8">
                                        <select data-placeholder="选择客户..." id="fk_con_id" name="fk_con_id" class="form-control" tabindex="2">
                                            <option value="0">请选择客户</option>
                                            <c:forEach items="${consumerList }" var="consumer">
                                                <option value="${consumer.con_id }">${consumer.con_name }</option>
                                            </c:forEach>
                                        </select>
                                        <font id="con_id"></font>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">客户地址：</label>
                                    <div class="col-sm-8">
                                         <select style="float:left; width: 90px" data-placeholder="选择省份..." id="province" name="fk_pro_id" class="form-control" tabindex="2">
                                            <option value="0">省份</option>
                                            
                                        </select>
                                        
                                        <select style="float:left; width: 90px" data-placeholder="选择市区..." id="city" name="fk_city_id" class="form-control" tabindex="2">
                                            <option value="0">市区</option>
                                            
                                        </select>
                                        
                                         <select style="width: 90px" data-placeholder="选择县区..." id="country" name="fk_country_id" class="form-control" tabindex="2">
                                            <option value="0">县区</option>
                                            
                                        </select>
                                        <font id="adr_id"></font>
                                 </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">详细地址：</label>
                                <div class="col-sm-8">
                                    <input id="or_adr" name="or_adr" placeholder="请输入详细地址" class="form-control" type="text">
                                    <font id="o_adr"></font>
                                </div>
                            </div>
                            <div class="form-group"></div>
                            <div class="form-group"></div>    
                            <div class="form-group"></div>
                            <div class="form-group"></div>
                            <div class="form-group"></div>
                        </div>
                    </div>
                </div>
            <div class="col-sm-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        
                            <div class="form-group">
                                <label class="col-sm-3 control-label">联系方式：</label>
                                <div class="col-sm-8">
                                    <input id="or_tel" name="or_tel" placeholder="请输入手机号" class="form-control" type="text">
                                    <font id="o_tel"></font>
                                </div>
                            </div>
                            <div class="form-group" id="data_1">
                                <label class="col-sm-3 control-label">签约日期：</label>
                                <div class="input-group date">
                                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                    <input style="width: 250px;" id="or_signdate" name="or_signdate" type="text" class="form-control" >
                                </div>
                            </div>
                            <div class="form-group" id="data_1">
                                <label class="col-sm-3 control-label">最晚出货：</label>
                                <div class="input-group date">
                                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                    <input style="width: 250px;" id="or_senddate" name="or_senddate" type="text" class="form-control" >
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">我方代表：</label>
                                <div class="col-sm-8">
                                     <select data-placeholder="选择我方代表..." id="fk_emp_id" name="fk_emp_id" class="form-control" tabindex="2">
                                        <option value="0">请选择我方代表</option>
                                        <c:forEach items="${employeeList }" var="employee">
                                            <option value="${employee.emp_id }">${employee.emp_name }</option>
                                        </c:forEach>
                                    </select>
                                    <font id="emp_id"></font>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">备注：</label>
                                <div class="col-sm-8">
                                    <input id="or_remark" name="or_remark" class="form-control" type="text" placeholder="请输入备注">
                                </div>
                                <font id="o_remark"></font>
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