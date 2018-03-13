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
    

    <title>供应商</title>
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
    <script src="js/jsutil.js" type="text/javascript"></script>
    <script src="js/plugins/sweetalert/sweetalert.min.js"></script>
    <link href="css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <script type="text/javascript">
        function supplierAdd() {
			var addDialog = top.dialog({
				title:'新建供应商',
				url:'supplierAdd',
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
        function supplierUpdate(sup_id) {
			var updateDialog = top.dialog({
				title:'编辑信息',
				url:'supplierUpdate?sup_id='+sup_id,
				width:'1000px',
				onclose:function (){
                    window.location.reload();
                }
			});
			updateDialog.showModal();
		}
    </script>
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <!-- <div class="col-sm-6"> -->
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5><button style="width: 50px" type="button" class="btn btn-outline btn-info" onclick="supplierAdd()">添加</button>
                            <button type="button" class="btn btn-outline btn-danger" onclick="delMore('sup_id','supplierMoreDel','supplierList')">批量删除</button>
                        </h5>
                        <div class="ibox-tools">
                            <form action="supplierList" method="post" target="_self">
                                                             供应商姓名：<input type="text" name="sup_name" value="${supplier.sup_name }" >
                                                             供应商电话：<input type="text" name="sup_tel" value="${supplier.sup_tel }" >
                                   <button type="submit" style="font-weight: 10px" class="btn btn-outline btn-success">查询</button>                             
                            </form>   
                        </div>
                    </div>
                    <div class="ibox-content">

                        <table class="table">
                            <thead>
                                <tr>
                                    <th><input type="checkbox"></th>
                                    <th>供应商图片</th>
                                    <th>供应商姓名</th>
                                    <th>供应商地址</th>
                                    <th>供应商电话</th>
                                    <th>开户银行</th>
                                    <th>银行账户</th>
                                    <th>重要程度</th>
                                    <th>经济类型</th>
                                    <th>经营范围</th>
                                    <th>建立时间</th>
                                    <th>操作</th>
                                    
                                </tr>
                            </thead>
                            <tbody>
                            <c:if test="${supplierList eq null }">
                                <tr style="text-align: center;"><td  colspan="9"><font style="text-align: center;" color="red" size="4">${message }</font> </td></tr>
                            </c:if>
                             <c:if test="${supplierList != null }">
                            <c:forEach items="${supplierList }" var="supplier">
                                <tr>
                                    
                                    <td><input id="sup_id" name="sup_id" type="checkbox" value="${supplier.sup_id }"></td>
                                    <td><img width="50px" src="/upload/${supplier.sup_logo }"/></td>
                                    <td>${supplier.sup_name }</td>
                                    <td>${supplier.province.province } ${supplier.city.city } ${supplier.country.area }</td>
                                    <td>${supplier.sup_tel }</td>
                                    <td>${supplier.sup_bank }</td>
                                    <td>${supplier.sup_bank_id }</td>
                                    <td>${supplier.consumerGrand.cg_name }</td>
                                    <td>${supplier.economicType.et_type }</td>
                                    <td>${supplier.sup_scope }</td>
                                    <td>${supplier.sup_time }</td>
                                    <td>
                                        <button type="button" class="btn btn-outline btn-info" onclick="supplierUpdate(${supplier.sup_id })">编辑</button>
                                        <button type="button" class="btn btn-outline btn-danger" onclick="del(${supplier.sup_id },'supplierDel','supplierList' )">删除</button>
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