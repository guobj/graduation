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
                	if(${consumerMap.fk_pro_id}!=null&&${consumerMap.fk_pro_id}!=''){
                    	if(${consumerMap.fk_pro_id}==data[pro].provinceID){
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
                        if(${consumerMap.fk_city_id}==data[city].cityID){
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
                            if(${consumerMap.fk_country_id}==data[country].areaID){
                                $("#country option[value='"+data[country].areaID+"']").attr("selected",true);
                                
                            }
                        }                           
                    },
                    "json"
            )
        })
        $.post(
                "city",
                {provinceID:${consumerMap.fk_pro_id}},
                function(data) {
                    for(var city in data){
                        $("#city").append("<option value="+data[city].cityID+">"+data[city].city+"</option>");
                        if(${consumerMap.fk_city_id}==data[city].cityID){
                            $("#city option[value='"+data[city].cityID+"']").attr("selected",true);
                            
                        }
                    }
                    
                },
                "json"
            )
            $.post(
                "country",
                {cityID:${consumerMap.fk_city_id}},
                function(data) {
                    for(var country in data){
                        $("#country").append("<option value="+data[country].areaID+">"+data[country].area+"</option>"); 
                        if(${consumerMap.fk_country_id}==data[country].areaID){
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
                var d=/^[a-z|A-Z][a-z|A-Z|0-9|_]*$/;
                //邮箱
                var email=/^[a-z|A-Z|0-9|_|-]+@[a-z|A-Z|0-9|_|-]+(\.[a-z|A-Z|0-9|_|-]+)+$/;
                //手机号
                var tel=/^1[0-9]{10}$/;
                /* var f=/^[0-9]*$/; */
                var con_name = $("#con_name").val();
                var con_tel = $("#con_tel").val();
                var con_email = $("#con_email").val();
                var fk_et_id = $("#fk_et_id").val();
                var fk_in_id = $("#fk_in_id").val();
                var province=$("#province").val();
                var city=$("#city").val();
                var country=$("#country").val();
                var con_price=$("#con_price").val();
                var fk_sm_id=$("#fk_sm_id").val();
                var fk_cs_id=$("#fk_cs_id").val();
                var fk_cg_id=$("#fk_cg_id").val();
                var con_logo=$("#con_logo").val();
                
                //匹配客户姓名
                if(con_name==""){
                    $("#c_name").css("color","red");
                    $("#c_name").html("不能为空");
                    return false;
                }else if(!ch.test(con_name)){
                    $("#c_name").css("color","red");
                    $("#c_name").html("请填写汉字");
                    return false;
                }else{
                    $("#c_name").css("color","green");
                    $("#c_name").html("√");
                } 
                //客户电话以1开头的11尾数字
                if(con_tel==""){
                    $("#c_tel").css("color","red");
                    $("#c_tel").html("不能为空");
                    return false;
                }else if(!tel.test(con_tel)){
                    $("#c_tel").css("color","red");
                    $("#c_tel").html("请填写正确的手机号");
                    return false;
                }else {
                    $("#c_tel").css("color","green");
                    $("#c_tel").html("√");
                }
                //邮箱必许包含@**.两个字符
                if(con_email==""){
                    $("#c_email").css("color","red");
                    $("#c_email").html("不能为空");
                    return false;
                }else if(!email.test(con_email)){
                    $("#c_email").css("color","red");
                    $("#c_email").html("请填写正确的邮箱号");
                    return false;
                }else {
                    $("#c_email").css("color","green");
                    $("#c_email").html("√");
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
              //选择隶属行业
                if(fk_in_id==0){
                    $("#in_id").css("color","red");
                    $("#in_id").html("请选择隶属行业");
                    return false;
                }else{
                    $("#in_id").css("color","green");
                    $("#in_id").html("√");
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
                //消费金额保留两位小数
                if(con_price==""){
                    $("#c_price").css("color","red");
                    $("#c_price").html("不能为空");
                    return false;
                }else if(!num2.test(con_price)){
                    $("#c_price").css("color","red");
                    $("#c_price").html("请保留两位小数");
                    return false;
                }else {
                    $("#c_price").css("color","green");
                    $("#c_price").html("√");
                }
              //选择销售模式
                if(fk_sm_id==0){
                    $("#sm_id").css("color","red");
                    $("#sm_id").html("请选择销售模式");
                    return false;
                }else{
                    $("#sm_id").css("color","green");
                    $("#sm_id").html("√");
                }
                //选择客户来源
                if(fk_cs_id==0){
                    $("#cs_id").css("color","red");
                    $("#cs_id").html("请选择客户来源");
                    return false;
                }else{
                    $("#cs_id").css("color","green");
                    $("#cs_id").html("√");
                }
              //选择客户等级
                if(fk_cg_id==0){
                    $("#cg_id").css("color","red");
                    $("#cg_id").html("请选择客户等级");
                    return false;
                }else{
                    $("#cg_id").css("color","green");
                    $("#cg_id").html("√");
                }
              //上传图片
                if(con_logo==""){
                    $("#c_logo").css("color","red");
                    $("#c_logo").html("请选择上传图片");
                    return false;
                }else{
                    $("#c_logo").css("color","green");
                    $("#c_logo").html("√");
                }
                return true;
            }
        </script>    
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <form target="_self" method="post" action="consumerUpdate.action" class="form-horizontal m-t" id="signupForm" enctype="multipart/form-data" onsubmit="return confirmInfo()">
                <input type="hidden" name="con_id" value="${consumerMap.con_id }">
                <div class="col-sm-6">
                    <div class="ibox float-e-margins">
                        <div class="ibox-content">
                            <!-- <form action="goodsAddAction" class="form-horizontal m-t" id="signupForm" enctype="multipart/form-data" onsubmit="return confirmInfo()"> -->
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">客户姓名：</label>
                                    <div class="col-sm-8">
                                        <input id="con_name" name="con_name" class="form-control" type="text" value="${consumerMap.con_name }">
                                        <font id="c_name"></font>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">客户电话：</label>
                                    <div class="col-sm-8">
                                        <input id="con_tel" name="con_tel" class="form-control" type="text" aria-required="true" aria-invalid="true" class="error" value="${consumerMap.con_tel }">
                                         <font id="c_tel"></font>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">客户邮箱：</label>
                                    <div class="col-sm-8">
                                        <input id="con_email" name="con_email" class="form-control" type="text" aria-required="true" aria-invalid="true" class="error" value="${consumerMap.con_email }">
                                        <font id="c_email"></font>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">经济类型：</label>
                                    <div class="col-sm-8">
                                        <select data-placeholder="选择经济类型..." id="fk_et_id" name="fk_et_id" class="form-control" tabindex="2">
                                            <option value="0">请选择经济类型</option>
                                            <c:forEach items="${economicTypeList }" var="economicType">
                                                <option value="${economicType.et_id }" <c:if test="${economicType.et_id eq consumerMap.fk_et_id}">selected="selected"</c:if>>${economicType.et_type }</option>
                                            </c:forEach>
                                        </select>
                                        <font id="et_id"></font>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">隶属行业：</label>
                                    <div class="col-sm-8">
                                         <select data-placeholder="选择隶属行业..." id="fk_in_id" name="fk_in_id" class="form-control" tabindex="2">
                                            <option value="0">请选择商品单位</option>
                                            <c:forEach items="${industryList }" var="industry">
                                                <option value="${industry.in_id }" <c:if test="${industry.in_id eq consumerMap.fk_in_id}">selected="selected"</c:if>>${industry.in_name }</option>
                                            </c:forEach>
                                        </select>
                                        <font id="in_id"></font>
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
                        </div>
                    </div>
                </div>
            <div class="col-sm-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        
                            <div class="form-group">
                                <label class="col-sm-3 control-label">消费总额：</label>
                                <div class="col-sm-8">
                                    <input id="con_price" name="con_price" class="form-control" type="text" value="${consumerMap.con_price }">
                                    <font id="c_price"></font>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">销售模式：</label>
                                <div class="col-sm-8">
                                    <select data-placeholder="选择销售模式..." id="fk_sm_id" name="fk_sm_id" class="form-control" tabindex="2">
                                        <option value="0">请选择销售模式</option>
                                        <c:forEach items="${saleModelList }" var="saleModel">
                                            <option value="${saleModel.sm_id }" <c:if test="${saleModel.sm_id eq consumerMap.fk_sm_id}">selected="selected"</c:if>>${saleModel.sm_name }</option>
                                        </c:forEach>
                                    </select>
                                     <font id="sm_id"></font>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">客户来源：</label>
                                <div class="col-sm-8">
                                    <select data-placeholder="选择客户来源..." id="fk_cs_id" name="fk_cs_id" class="form-control" tabindex="2">
                                        <option value="0">请选择客户来源</option>
                                        <c:forEach items="${consumerSourceList }" var="consumerSource">
                                            <option value="${consumerSource.cs_id }" <c:if test="${consumerSource.cs_id eq consumerMap.fk_cs_id}">selected="selected"</c:if>>${consumerSource.cs_name }</option>
                                        </c:forEach>
                                    </select>
                                    <font id="cs_id"></font>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">客户等级：</label>
                                <div class="col-sm-8">
                                     <select data-placeholder="选择客户等级..." id="fk_cg_id" name="fk_cg_id" class="form-control" tabindex="2">
                                        <option value="0">请选择客户等级</option>
                                        <c:forEach items="${consumerGrandList }" var="consumerGrand">
                                            <option value="${consumerGrand.cg_id }" <c:if test="${consumerGrand.cg_id eq consumerMap.fk_cg_id}">selected="selected"</c:if>>${consumerGrand.cg_name }</option>
                                        </c:forEach>
                                    </select>
                                    <font id="cg_id"></font>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">客户图片：</label>
                                <div class="col-sm-8">
                                    <input id="con_logo" name="file" class="form-control" type="file">
                                </div>
                                <font id="c_logo"></font>
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