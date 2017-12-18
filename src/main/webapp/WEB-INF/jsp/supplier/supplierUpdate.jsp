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
    $(function() {
        $.post(
            "province",
            function(data) {
                for(var pro in data){
                    $("#province").append("<option value="+data[pro].provinceID+">"+data[pro].province+"</option>");
                    if(${supplierMap.fk_pro_id}!=null&&${supplierMap.fk_pro_id}!=''){
                        if(${supplierMap.fk_pro_id}==data[pro].provinceID){
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
                        if(${supplierMap.fk_city_id}==data[city].cityID){
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
                            if(${supplierMap.fk_country_id}==data[country].areaID){
                                $("#country option[value='"+data[country].areaID+"']").attr("selected",true);
                                
                            }
                        }                           
                    },
                    "json"
            )
        })
        $.post(
                "city",
                {provinceID:${supplierMap.fk_pro_id}},
                function(data) {
                    for(var city in data){
                        $("#city").append("<option value="+data[city].cityID+">"+data[city].city+"</option>");
                        if(${supplierMap.fk_city_id}==data[city].cityID){
                            $("#city option[value='"+data[city].cityID+"']").attr("selected",true);
                            
                        }
                    }
                    
                },
                "json"
            )
            $.post(
                "country",
                {cityID:${supplierMap.fk_city_id}},
                function(data) {
                    for(var country in data){
                        $("#country").append("<option value="+data[country].areaID+">"+data[country].area+"</option>"); 
                        if(${supplierMap.fk_country_id}==data[country].areaID){
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
                //银行卡号
                var bank=/^\d{16}|\d{19}$/
                /* var f=/^[0-9]*$/; */
                var sup_name = $("#sup_name").val();
                var sup_tel = $("#sup_tel").val();
                var sup_bank = $("#sup_bank").val();
                var sup_bank_id = $("#sup_bank_id").val();
                var sup_logo = $("#sup_logo").val();
                var province=$("#province").val();
                var city=$("#city").val();
                var country=$("#country").val();
                var fk_cg_id=$("#fk_cg_id").val();
                var fk_et_id = $("#fk_et_id").val();
                var sup_scope= $("#sup_scope").val();
                //匹配客户姓名
                if(sup_name==""){
                    $("#c_name").css("color","red");
                    $("#c_name").html("不能为空");
                    return false;
                }else if(!ch.test(sup_name)){
                    $("#c_name").css("color","red");
                    $("#c_name").html("请填写汉字");
                    return false;
                }else{
                    $("#c_name").css("color","green");
                    $("#c_name").html("√");
                }
                //客户电话以1开头的11尾数字
                if(sup_tel==""){
                    $("#c_tel").css("color","red");
                    $("#c_tel").html("不能为空");
                    return false;
                }else if(!tel.test(sup_tel)){
                    $("#c_tel").css("color","red");
                    $("#c_tel").html("请填写正确的手机号");
                    return false;
                }else {
                    $("#c_tel").css("color","green");
                    $("#c_tel").html("√");
                }
              //匹配银行
                if(sup_bank==""){
                    $("#s_bank").css("color","red");
                    $("#s_bank").html("不能为空");
                    return false;
                }else if(!ch.test(sup_bank)){
                    $("#s_bank").css("color","red");
                    $("#s_bank").html("请填写汉字");
                    return false;
                }else{
                    $("#s_bank").css("color","green");
                    $("#s_bank").html("√");
                }
              //匹配银行账号
                if(sup_bank_id==""){
                    $("#s_bank_id").css("color","red");
                    $("#s_bank_id").html("不能为空");
                    return false;
                }else if(!bank.test(sup_bank_id)){
                    $("#s_bank_id").css("color","red");
                    $("#s_bank_id").html("请填写有效的银行账户");
                    return false;
                }else{
                    $("#s_bank_id").css("color","green");
                    $("#s_bank_id").html("√");
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
              //选择经济类型
                if(fk_et_id==0){
                    $("#et_id").css("color","red");
                    $("#et_id").html("请选择经济类型");
                    return false;
                }else{
                    $("#et_id").css("color","green");
                    $("#et_id").html("√");
                }
              //选择客户等级
                if(fk_cg_id==0){
                    $("#cg_id").css("color","red");
                    $("#cg_id").html("请选择供应商等级");
                    return false;
                }else{
                    $("#cg_id").css("color","green");
                    $("#cg_id").html("√");
                }
              //匹配客户姓名
                if(sup_scope==""){
                    $("#s_scope").css("color","red");
                    $("#s_scope").html("不能为空");
                    return false;
                }else if(!ch.test(sup_scope)){
                    $("#s_scope").css("color","red");
                    $("#s_scope").html("请填写汉字");
                    return false;
                }else{
                    $("#s_scope").css("color","green");
                    $("#s_scope").html("√");
                }
              //上传图片
                if(sup_logo==""){
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
            <form target="_self" method="post" action="supplierUpdate.action" class="form-horizontal m-t" id="signupForm" enctype="multipart/form-data" onsubmit="return confirmInfo()">
                <input type="hidden" value="${supplierMap.sup_id }" name="sup_id">
            <div class="col-sm-6">
                    <div class="ibox float-e-margins">
                        <div class="ibox-content">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">供应商姓名：</label>
                                    <div class="col-sm-8">
                                        <input id="sup_name" name="sup_name" value="${supplierMap.sup_name }" class="form-control" type="text">
                                        <font id="c_name"></font>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">供应商电话：</label>
                                    <div class="col-sm-8">
                                        <input id="sup_tel" name="sup_tel" value="${supplierMap.sup_tel }" class="form-control" type="text" aria-required="true" aria-invalid="true" class="error">
                                         <font id="c_tel"></font>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">开户银行：</label>
                                    <div class="col-sm-8">
                                        <input id="sup_bank" name="sup_bank" value="${supplierMap.sup_bank }" class="form-control" type="text" aria-required="true" aria-invalid="true" class="error">
                                        <font id="s_bank"></font>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">银行账户：</label>
                                    <div class="col-sm-8">
                                        <input id="sup_bank_id" name="sup_bank_id" value="${supplierMap.sup_bank_id }" class="form-control" type="text" aria-required="true" aria-invalid="true" class="error">
                                        <font id="s_bank_id"></font>
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
                                    <label class="col-sm-3 control-label">经济类型：</label>
                                    <div class="col-sm-8">
                                        <select data-placeholder="选择经济类型..." id="fk_et_id" name="fk_et_id" class="form-control" tabindex="2">
                                            <option value="0">请选择经济类型</option>
                                            <c:forEach items="${economicTypeList }" var="economicType">
                                                <option value="${economicType.et_id }" <c:if test="${economicType.et_id eq supplierMap.fk_et_id}">selected="selected"</c:if>>${economicType.et_type }</option>
                                            </c:forEach>
                                        </select>
                                        <font id="et_id"></font>
                                    </div>
                                </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">供应商等级：</label>
                                <div class="col-sm-8">
                                     <select data-placeholder="选择客户等级..." id="fk_cg_id" name="fk_cg_id" class="form-control" tabindex="2">
                                        <option value="0">请选择客户等级</option>
                                        <c:forEach items="${consumerGrandList }" var="consumerGrand">
                                            <option value="${consumerGrand.cg_id }" <c:if test="${consumerGrand.cg_id eq supplierMap.fk_cg_id}">selected="selected"</c:if>>${consumerGrand.cg_name }</option>
                                        </c:forEach>
                                    </select>
                                    <font id="cg_id"></font>
                                </div>
                            </div>
                            <div class="form-group">
                                    <label class="col-sm-3 control-label">经营范围：</label>
                                    <div class="col-sm-8">
                                        <input id="sup_scope" name="sup_scope" value="${supplierMap.sup_scope }" class="form-control" type="text" aria-required="true" aria-invalid="true" class="error">
                                        <font id="s_scope"></font>
                                    </div>
                                </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">供应商图片：</label>
                                <div class="col-sm-8">
                                    <input id="sup_logo" name="file" class="form-control" type="file">
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