<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    pageContext.setAttribute("path", path);
    pageContext.setAttribute("basePath", basePath);
%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
 <!DOCTYPE html>
<html>

<head>
    <base href="${basePath}">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    

    <title>H+ 后台主题UI框架 - 基础表格</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link rel="shortcut icon" href="favicon.ico"> <link href="css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">
    <script type="text/javascript" src="js/jquery.js"></script>
    <script src="artDialog/lib/jquery-1.10.2.js"></script>
    <link rel="stylesheet" href="artDialog/css/ui-dialog.css">
    <script src="artDialog/dist/dialog-plus.js"></script>
    <script type="text/javascript">
        function salesOrderAdd() {
			var addDialog = top.dialog({
				title:'新建订单',
				url:'salesOrderAdd',
				width:'1000px',
				//height:'500px',
				onclose:function (){
	                window.location.reload();
	            }
			});
			addDialog.showModal();
		}
    </script>
    <script type="text/javascript">
        function salesOrderDetails(or_id) {
			var updateDialog = top.dialog({
				title:'编辑信息',
				url:'salesOrderDetails?or_id='+or_id,
				width:'500px',
				onclose:function (){
                    window.location.reload();
                }
			});
			updateDialog.showModal();
		}
    </script>
<!--     取消未生成出库单的订单 -->
    <script type="text/javascript">
        function cancel(id){
        	var delDialog = top.dialog({
                title:'取消订单',
                url:'cancelOrder?or_id='+id,
                width:'300px',
                onclose:function (){
                	window.location.href="salesOrder";
                }
            });
            delDialog.showModal();
        }
    </script>
<!--     取消已生成出库单的订单 -->
    <script type="text/javascript">
        function cancelGoodsOut(id){
            var delDialog = top.dialog({
                title:'取消订单',
                url:'cancelGoodsOut?or_id='+id,
                width:'300px',
                onclose:function (){
                	window.location.reload();
                }
            });
            delDialog.showModal();
        }
    </script>
    <script type="text/javascript">
        function goodsMoreDel(){
        	var goods_ids = new Array();
    	   $("input[name='goods_id']:checked").each(function() {
            //将选中数据存到数组里
            goods_ids.push($(this).val());
            });
    	   if(goods_ids.length<=0){
               alert("请选择要删除的数据！");
           }else{
                var delDialog = top.dialog({
                    title:'删除商品',
                    url:'goodsMoreDel?goods_ids='+goods_ids,
                    width:'500px',
                    onclose:function (){
                       // self.location.reload();
                    	window.location.href="goodsList";
                    }
                });
                delDialog.showModal();
           }
        }
    </script>
<!--    确认生成出库单 -->
    <script type="text/javascript">
        function goodsStockOut(or_id){
        	var addDialog = top.dialog({
                title:'确认出库',
                url:'goodsStockOutConfirm?or_id='+or_id,
                width:'300px',
                //height:'500px',
                onclose:function (){
                    window.location.reload();
                }
            });
            addDialog.showModal();
        }
    </script>
    <script type="text/javascript">
        function orderDetails(or_id) {
        	var orderDialog = top.dialog({
                title:'编辑信息',
                url:'orderDetails?or_id='+or_id,
                width:'1000px',
                onclose:function (){
                    window.location.reload();
                }
            });
        	orderDialog.showModal();
		}
    </script>
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <!-- <div class="col-sm-6"> -->
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5><button type="button" class="btn btn-outline btn-info" onclick="salesOrderAdd()">新建订单</button>
                            <button type="button" class="btn btn-outline btn-danger" onclick="goodsMoreDel()">批量删除</button>
                        </h5>
                        <div class="ibox-tools">
                            <form action="salesOrder" method="post" target="_self">
                                                            单号：<input type="text" name="or_account" value="${order.or_account }" >
                                   <button type="submit" style="font-weight: 10px" class="btn btn-outline btn-success">查询</button>                             
                            </form>   
                        </div>
                    </div>
                    <div class="ibox-content">

                        <table class="table">
                            <thead>
                                <tr>
                                    <th><input type="checkbox"></th>
                                    <th>单号</th>
                                    <th>主题</th>
                                    <th>客户</th>
                                    <th>地址</th>
                                    <th>联系方式</th>
                                    <th>签约日期</th>
                                    <th>最晚出货</th>
                                    <th>我方代表</th>
                                    <th>状态</th>
                                    <th>备注</th>
                                    <th>操作</th>
                                    
                                </tr>
                            </thead>
                            <tbody>
                            <c:if test="${salesOrderList eq null }">
                                <tr style="text-align: center;><td><font style="text-align: center;" color="red" size="4">${message }</font> </td></tr>
                            </c:if>
                            <c:if test="${salesOrderList != null }">
                            <c:forEach items="${salesOrderList }" var="order">
                                <tr>
                                    <td><input id="or_ids" name="or_id" type="checkbox" value="${order.or_id }"></td>
                                    <td>${order.or_account }</td>
                                    <td>${order.or_theme }</td>
                                    <td>${order.consumer.con_name }</td>
                                    <td>${order.province.province } ${order.city.city }${order.country.area }${order.or_adr}</td>
                                    <td>${order.or_tel }</td>
                                    <td>${order.or_signdate }</td>
                                    <td>${order.or_senddate }</td>
                                    <td>${order.employee.emp_name }</td>
                                    <td><c:if test="${order.or_status eq 0 }"><font color="orange">待执行</font></c:if>
                                        <c:if test="${order.or_status eq 1 }"><font color="blue">执行中</font></c:if>
                                        <c:if test="${order.or_status eq 3 }"><font color="blue">执行中</font></c:if>
                                        <c:if test="${order.or_status eq 2 }"><font color="green">已完成</font></c:if>
                                        <c:if test="${order.or_status eq -1 }"><font color="red">失败</font></c:if>
                                    </td>
                                    <td>${order.or_remark }</td>
                                    <td><c:if test="${order.or_status eq 0 }">
                                            <button type="button" class="btn btn-outline btn-info" onclick="salesOrderDetails(${order.or_id })">编辑订单明细</button>
                                            <button type="button" class="btn btn-outline btn-danger" onclick="cancel(${order.or_id })">取消</button>
                                        </c:if>
                                        <c:if test="${order.or_status eq 1 }">
                                            <button type="button" class="btn btn-outline btn-info" onclick="orderDetails(${order.or_id })">订单明细</button>
                                            <button type="button" class="btn btn-outline btn-info" onclick="goodsStockOut(${order.or_id })">生成出库单</button>
                                            <button type="button" class="btn btn-outline btn-danger" onclick="cancel(${order.or_id })">取消</button>
                                        </c:if>
                                        <c:if test="${order.or_status eq -1 }">
                                            <button type="button" class="btn btn-outline btn-danger" onclick="del(${order.or_id })">删除</button>
                                        </c:if>
                                        <c:if test="${order.or_status eq 2 }">
                                            <button type="button" class="btn btn-outline btn-info" onclick="orderDetails(${order.or_id })">订单明细</button>
                                        </c:if>
<!--                                         已生成出库单取消需改变两个状态   出库单的状态和订单的状态 -->
                                        <c:if test="${order.or_status eq 3 }">
                                            <button type="button" class="btn btn-outline btn-info" onclick="salesOrderDetail(${order.or_id })">订单明细</button>
                                            <button type="button" class="btn btn-outline btn-danger" onclick="cancelGoodsOut(${order.or_id })">取消</button>
                                        </c:if>
                                        
                                    </td>
                                    
                                </tr>
                            </c:forEach>
                            </c:if> 
                            </tbody>
                        </table>
                        <jsp:include page="../main/pages.jsp"></jsp:include>
                    </div>
                </div>
            </div>            
        </div>
    <!-- </div> -->
    <script src="js/jquery.min.js?v=2.1.4"></script>
    <script src="js/bootstrap.min.js?v=3.3.5"></script>
    <script src="js/plugins/peity/jquery.peity.min.js"></script>
    <script src="js/content.min.js?v=1.0.0"></script>
    <script src="js/plugins/iCheck/icheck.min.js"></script>
    <script src="js/demo/peity-demo.min.js"></script>
    <script>
        $(document).ready(function(){$(".i-checks").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green",})});
    </script>
    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>

</html>