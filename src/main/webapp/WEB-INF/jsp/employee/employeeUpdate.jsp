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
                    if(${employeeMap.fk_pro_id}!=null&&${employeeMap.fk_pro_id}!=''){
                        if(${employeeMap.fk_pro_id}==data[pro].provinceID){
                            $("#province option[value='"+[data[pro].provinceID]+"']").attr("selected",true);
                            
                        }
                    }
                    
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
                        if(${employeeMap.fk_city_id}==data[city].cityID){
                            $("#city option[value='"+data[city].cityID+"']").attr("selected",true);
                            
                        }
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
                            if(${employeeMap.fk_country_id}==data[country].areaID){
                                $("#country option[value='"+data[country].areaID+"']").attr("selected",true);
                                
                            }
                        }                           
                    },
                    "json"
            )
        })
        $.post(
                "city",
                {provinceID:${employeeMap.fk_pro_id}},
                function(data) {
                    for(var city in data){
                        $("#city").append("<option value="+data[city].cityID+">"+data[city].city+"</option>");
                        if(${employeeMap.fk_city_id}==data[city].cityID){
                            $("#city option[value='"+data[city].cityID+"']").attr("selected",true);
                            
                        }
                    }
                    
                },
                "json"
            )
            $.post(
                "country",
                {cityID:${employeeMap.fk_city_id}},
                function(data) {
                    for(var country in data){
                        $("#country").append("<option value="+data[country].areaID+">"+data[country].area+"</option>"); 
                        if(${employeeMap.fk_country_id}==data[country].areaID){
                            $("#country option[value='"+data[country].areaID+"']").attr("selected",true);
                            
                        }
                    }                           
                },
                "json"
            )
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
            <form target="_self" method="post" action="employeeUpdate.action" class="form-horizontal m-t" id="signupForm" enctype="multipart/form-data" onsubmit="return confirmInfo()">
            <input type="hidden" name="emp_id" value="${employeeMap.emp_id }">
            <div class="col-sm-6">
                    <div class="ibox float-e-margins">
                        <div class="ibox-content">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">用户姓名：</label>
                                    <div class="col-sm-8">
                                        <input id="emp_name" name="emp_name" class="form-control" type="text" value="${employeeMap.emp_name }">
                                        <font id="c_name"></font>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">用户账号：</label>
                                    <div class="col-sm-8">
                                        <input id="account" name="account" class="form-control" type="text" disabled="disabled" value="${employeeMap.account }">
                                        <font id="e_account"></font>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">用户电话：</label>
                                    <div class="col-sm-8">
                                        <input id="emp_tel" name="emp_tel" class="form-control" value="${employeeMap.emp_tel }" type="text" aria-required="true" aria-invalid="true" class="error">
                                         <font id="c_tel"></font>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">用户邮箱：</label>
                                    <div class="col-sm-8">
                                        <input id="emp_email" name="emp_email" value="${employeeMap.emp_email }"  class="form-control" type="text" aria-required="true" aria-invalid="true" class="error">
                                        <font id="c_email"></font>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">用户年龄：</label>
                                    <div class="col-sm-8">
                                        <input id="emp_age" name="emp_age" value="${employeeMap.emp_age }" class="form-control" type="text" aria-required="true" aria-invalid="true" class="error">
                                        <font id="e_age"></font>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">用户地址：</label>
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
                                <label class="col-sm-3 control-label">用户性别：</label>
                                <div class="radio radio-info radio-inline">
                                    <input type="radio" id="inlineRadio1" value="1" name="emp_sex" <c:if test="${employeeMap.emp_sex eq 1 }">checked="checked"</c:if>>
                                    <label for="inlineRadio1"> 男 </label>
                                </div>
                                <div class="radio radio-inline">
                                    <input type="radio" id="inlineRadio2" value="0" name="emp_sex" <c:if test="${employeeMap.emp_sex eq 0 }">checked="checked"</c:if>>
                                    <label for="inlineRadio2"> 女 </label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">用户部门：</label>
                                <div class="col-sm-8">
                                     <select data-placeholder="选择用户部门..." id="fk_dep_id" name="fk_dep_id" class="form-control" tabindex="2">
                                        <option value="0">请选择用户部门</option>
                                        <c:forEach items="${depList }" var="dep">
                                            <option value="${dep.dep_id }" <c:if test="${dep.dep_id eq employeeMap.fk_dep_id}">selected="selected"</c:if>>${dep.dep_name }</option>
                                        </c:forEach>
                                    </select>
                                    <font id="dep_id"></font>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">用户学历：</label>
                                <div class="col-sm-8">
                                     <select data-placeholder="选择用户学历..." id="fk_edu_id" name="fk_edu_id" class="form-control" tabindex="2">
                                        <option value="0">请选择用户学历</option>
                                        <c:forEach items="${eduList }" var="edu">
                                            <option value="${edu.edu_id }" <c:if test="${edu.edu_id eq employeeMap.fk_edu_id}">selected="selected"</c:if>>${edu.edu_name }</option>
                                        </c:forEach>
                                    </select>
                                    <font id="edu_id"></font>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">用户ID：</label>
                                <div class="col-sm-8">
                                    <input id="emp_card" name="emp_card" class="form-control" type="text" placeholder="请输入身份证号码" value="${employeeMap.emp_card }">
                                    <font id="e_card"></font>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">用户角色：</label>
                                <div class="col-sm-8">
                                     <select data-placeholder="选择客户等级..." id="fk_role_id" name="fk_role_id" class="form-control" tabindex="2">
                                        <option value="0">请选择用户角色</option>
                                        <c:forEach items="${roleEmpList }" var="role">
                                            <option value="${role.role_id }" <c:if test="${role.role_id eq employeeMap.fk_role_id}">selected="selected"</c:if>>${role.role_name }</option>
                                        </c:forEach>
                                    </select>
                                    <font id="r_id"></font>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">用户图片：</label>
                                <div class="col-sm-8">
                                    <input id="emp_logo" name="file" class="form-control" type="file">
                                </div>
                                <font id="e_logo"></font>
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