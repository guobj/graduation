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
        function supplierLicenseAdd() {
			var addDialog = top.dialog({
				title:'新增供应商证照',
				url:'supplierLicenseAdd',
				width:'500px',
				//height:'500px',
				onclose:function (){
	                window.location.reload();
	            }
			});
			addDialog.showModal();
		}
    </script>
    <script type="text/javascript">
        function del(id){
        	var delDialog = top.dialog({
                title:'删除此证照',
                url:'supplierLicenseDel?id='+id,
                width:'300px',
                onclose:function (){
                	window.location.href="supplierLtList";
                }
            });
            delDialog.showModal();
        }
    </script>
    <script type="text/javascript">
        function supplierLicenseMoreDel(){
        	var st_ids = new Array();
    	   $("input[name='st_id']:checked").each(function() {
            //将选中数据存到数组里
            st_ids.push($(this).val());
            });
    	   if(st_ids.length<=0){
               alert("请选择要删除的数据！");
           }else{
                var delDialog = top.dialog({
                    title:'删除证照',
                    url:'supplierLicenseMoreDel.action?st_ids='+st_ids,
                    width:'300px',
                    onclose:function (){
                       // self.location.reload();
                    	window.location.href="supplierLtList";
                    }
                });
                delDialog.showModal();
           }
        }
    </script>
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <!-- <div class="col-sm-6"> -->
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5><button type="button" class="btn btn-outline btn-info" onclick="supplierLicenseAdd()">新增证照</button>
                            <button type="button" class="btn btn-outline btn-danger" onclick="supplierLicenseMoreDel()">批量删除</button>
                        </h5>
                        <div class="ibox-tools">
                            <form action="supplierLtList" method="post" target="_self">
                                                             供应商：<input type="text" name="supplier.sup_name" value="${supplierlicensetype.supplier.sup_name }" >
                                   <button type="submit" style="font-weight: 10px" class="btn btn-outline btn-success">查询</button>                             
                            </form>   
                        </div>
                    </div>
                    <div class="ibox-content">

                        <table class="table">
                            <thead>
                                <tr>
                                    <th><input type="checkbox"></th>
                                    <th>供应商</th>
                                    <th>证照名称</th>
                                    <th>证照颁发时间</th>
                                    <th>证照失效时间</th>
                                    <th>操作</th>
                                    
                                </tr>
                            </thead>
                            <tbody>
                            <c:if test="${supplierLicenseList eq null }">
                                <tr style="text-align: center;"><td><font style="text-align: center;" color="red" size="4">${message }</font> </td></tr>
                            </c:if>
                             <c:if test="${supplierLicenseList != null }">
                            <c:forEach items="${supplierLicenseList }" var="supplierLicense">
                                <tr>
                                    
                                    <td><input id="st_id" name="st_id" type="checkbox" value="${supplierLicense.st_id }"></td>
                                    <td>${supplierLicense.supplier.sup_name }</td>
                                    <td>${supplierLicense.licenseType.lt_name }</td>
                                    <td>${supplierLicense.st_startdate }</td>
                                    <td>${supplierLicense.st_enddate }</td>
                                    <td>
                                        <c:if test="${supplierLicense.st_status eq 1}">
                                            <button type="button" class="btn btn-outline btn-danger" onclick="del(${supplierLicense.st_id } )">删除</button>
                                        </c:if>
                                        <c:if test="${supplierLicense.st_status eq 0}">
                                            <font color="red">证照已无效</font>
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