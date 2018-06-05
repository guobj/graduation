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
                var num2=/^[1-9][0-9]+(\.[0-9]{2})$/
                //字母与数字组合
                var d=/^[a-z|A-Z][a-z|A-Z|0-9|_]*$/;
                //邮箱
                var e=/^[a-z|A-Z|0-9|_|-]+@[a-z|A-Z|0-9|_|-]+(\.[a-z|A-Z|0-9|_|-]+)+$/;
                //手机号
                var f=/^1[0-9]{10}$/;
                /* var f=/^[0-9]*$/; */
                var goods_name = $("#goods_name").val();
                var fk_gt_id = $("#fk_gt_id").val();
                var goods_price = $("#goods_price").val();
                var goods_vipprice = $("#goods_vipprice").val();
                var fk_sup_id = $("#fk_sup_id").val();
                var fk_gu_id=$("#fk_gu_id").val();
                
                //匹配商品名称
                if(goods_name==""){
                    $("#g_name").css("color","red");
                    $("#g_name").html("不能为空");
                    return false;
                }else if(!ch.test(goods_name)){
                    $("#g_name").css("color","red");
                    $("#g_name").html("请填写汉字");
                    return false;
                }else{
                    $("#g_name").css("color","green");
                    $("#g_name").html("√");
                } 
                //商品类型
                if(fk_gt_id==0){
                    $("#t_name").css("color","red");
                    $("#t_name").html("请选择商品类型");
                    return false;
                }else{
                    $("#t_name").css("color","green");
                    $("#t_name").html("√");
                }
                //商品价格
                if(goods_price==""){
                    $("#p_name").css("color","red");
                    $("#p_name").html("不能为空");
                    return false;
                }else if(!num2.test(goods_price)){
                    $("#p_name").css("color","red");
                    $("#p_name").html("请保留两位小数");
                    return false;
                }else {
                    $("#p_name").css("color","green");
                    $("#p_name").html("√");
                }
                //会员价格
                if(goods_vipprice==""){
                    $("#vp_name").css("color","red");
                    $("#vp_name").html("不能为空");
                    return false;
                }else if(!num2.test(goods_vipprice)){
                    $("#vp_name").css("color","red");
                    $("#vp_name").html("请保留两位小数");
                    return false;
                }else {
                    $("#vp_name").css("color","green");
                    $("#vp_name").html("√");
                }
                //供应商
                if(fk_sup_id==0){
                    $("#s_name").css("color","red");
                    $("#s_name").html("请选择供应商");
                    return false;
                }else{
                    $("#s_name").css("color","green");
                    $("#s_name").html("√");
                }
              //商品单位
                if(fk_gu_id==0){
                    $("#u_name").css("color","red");
                    $("#u_name").html("请选择供应商");
                    return false;
                }else{
                    $("#u_name").css("color","green");
                    $("#u_name").html("√");
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
                        <form target="_self" method="post" action="goodsUpdateAction" class="form-horizontal m-t" id="signupForm" enctype="multipart/form-data" onsubmit="return confirmInfo()">
                            <input type="hidden" name="goods_id" value="${gMap.goods_id }">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">商品名称：</label>
                                <div class="col-sm-8">
                                    <input id="goods_name" name="goods_name" class="form-control" type="text" value="${gMap.goods_name }">
                                    <font id="g_name"></font>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">商品类型：</label>
                                <div class="col-sm-8">
                                    <select data-placeholder="选择省份..." id="fk_gt_id" name="fk_gt_id" class="form-control" tabindex="2">
                                        <option value="0">请选择类型</option>
                                        <c:forEach items="${typeList }" var="type">
                                                <option value="${type.gt_id }" <c:if test="${type.gt_id eq gMap.fk_gt_id}">selected="selected"</c:if>>${type.gt_type }</option>
                                        </c:forEach>
                                    </select>
                                     <font id="t_name"></font>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">商品价格：</label>
                                <div class="col-sm-8">
                                    <input id="goods_price" name="goods_price" value="${gMap.goods_price }" class="form-control" type="text" aria-required="true" aria-invalid="true" class="error">
                                     <font id="p_name"></font>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">商品会员价格：</label>
                                <div class="col-sm-8">
                                    <input id="goods_vipprice" name="goods_vipprice" value="${gMap.goods_vipprice }" class="form-control" type="text" aria-required="true" aria-invalid="true" class="error">
                                    <font id="vp_name"></font>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">供应商：</label>
                                <div class="col-sm-8">
                                    <select data-placeholder="选择省份..." id="fk_sup_id" name="fk_sup_id" class="form-control" tabindex="2">
                                        <option value="0">请选择供应商</option>
                                        <c:forEach items="${supList }" var="sup">
                                                <option value="${sup.sup_id }" <c:if test="${sup.sup_id eq gMap.fk_sup_id }">selected="selected"</c:if>>${sup.sup_name }</option>
                                        </c:forEach>
                                    </select>
                                    <font id="s_name"></font>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">商品单位：</label>
                                <div class="col-sm-8">
                                     <select data-placeholder="选择省份..." id="fk_gu_id" name="fk_gu_id" class="form-control" tabindex="2">
                                        <option value="0">请选择商品单位</option>
                                        <c:forEach items="${unitList }" var="unit">
                                                <option value="${unit.gu_id }" <c:if test="${unit.gu_id eq gMap.fk_gu_id}">selected="selected"</c:if>>${unit.gu_name }</option>
                                        </c:forEach>
                                    </select>
                                    <font id="u_name"></font>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">商品图片：</label>
                                <div class="col-sm-8">
                                    <input id="goods_logo" name="file" class="form-control" type="file">
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