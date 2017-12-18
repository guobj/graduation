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
    <script type="text/javascript" src="jquery.js"></script>
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
                //纯数字
                var number=/^[1-9]+[0-9]*$/;
                /* var f=/^[0-9]*$/; */
                var goods_id = $("#goods_id").val();
                var goods_price = $("#goods_price").val();
                var goods_nums = $("#goods_nums").val();
                
                //匹配商品名称
                if(goods_id==0){
                    $("#g_name").css("color","red");
                    $("#g_name").html("请选择要添加的商品");
                    return false;
                }else{
                    $("#g_name").css("color","green");
                    $("#g_name").html("√");
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
                //商品数量只能是数字
                if(goods_nums==""){
                    $("#g_nums").css("color","red");
                    $("#g_nums").html("不能为空");
                    return false;
                }else if(!number.test(goods_nums)){
                    $("#g_nums").css("color","red");
                    $("#g_nums").html("请保留两位小数");
                    return false;
                }else {
                    $("#g_nums").css("color","green");
                    $("#g_nums").html("√");
                }
                return true;
            }
        </script>
        <script type="text/javascript">
        $(function (){
        	$("#goods_id").change(function() {
        		$.post(
        	            "load",
        	            {goods_id:$("#goods_id").val()},
        	            function(data) {
        	            	for(var key in data){
        	            		$("#goods_price").val(data[key].goods_price);
        	            	}
        	            },
        	            "json"
        	        )
                
            })
    		$("#goods_nums").change(function() {
    			var goods_price=$("#goods_price").val();
                var goods_nums=$("#goods_nums").val();
    			//alert(goods_price);
    			$("#goods_sumprice").val(Number(goods_price)*Number(goods_nums));
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
                        <form target="_self" action="goodsStockInUpdate.action" method="post" class="form-horizontal m-t" id="signupForm" onsubmit="return confirmInfo()">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">商品名称：</label>
                                <div class="col-sm-8">
                                    <select data-placeholder="选择商品名称..." id="goods_id" name="goods_id" class="form-control" tabindex="2">
                                        <option value="0">请选择类型</option>
                                        <c:forEach items="${goodsAllList }" var="goods">
                                            <option value="${goods.goods_id }">${goods.goods_name }</option>
                                        </c:forEach>
                                    </select>
                                     <font id="g_name"></font>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">商品价格：</label>
                                <div class="col-sm-8">
                                    <input id="goods_price" name="goods_price" readonly="readonly" class="form-control" type="text" aria-required="true" aria-invalid="true" class="error">
                                     <font id="p_name"></font>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">商品数量：</label>
                                <div class="col-sm-8">
                                    <input id="goods_nums" name="goods_nums" class="form-control" type="text" aria-required="true" aria-invalid="true" class="error">
                                    <font id="g_nums"></font>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">商品总价：</label>
                                <div class="col-sm-8">
                                    <input id="goods_sumprice" name="goods_sumprice" readonly="readonly" class="form-control" type="text" aria-required="true" aria-invalid="true" class="error">
                                    <font id="s_price"></font>
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