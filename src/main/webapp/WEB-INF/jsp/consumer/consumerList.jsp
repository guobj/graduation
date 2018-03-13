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
    

    <title>客户列表</title>
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
        function consumerAdd() {
			var addDialog = top.dialog({
				title:'新建客户',
				url:'consumerAdd',
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
        function consumerUpdate(con_id) {
			var updateDialog = top.dialog({
				title:'编辑信息',
				url:'consumerUpdate?con_id='+con_id,
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
                        <h5><button style="width: 50px" type="button" class="btn btn-outline btn-info" onclick="consumerAdd()">添加</button>
                            <button type="button" class="btn btn-outline btn-danger" onclick="delMore('con_id','consumerMoreDel','consumerList')">批量删除</button>
                        </h5>
                        <div class="ibox-tools">
                            <form action="consumerList" method="post" target="_self">
                                                             客户姓名：<input type="text" name="con_name" value="${consumer.con_name }" >
                                                             客户电话：<input type="text" name="con_tel" value="${consumer.con_tel }" >
                                   <button type="submit" style="font-weight: 10px" class="btn btn-outline btn-success">查询</button>                             
                            </form>   
                        </div>
                    </div>
                    <div class="ibox-content">

                        <table class="table">
                            <thead>
                                <tr>
                                    <th><input type="checkbox"></th>
                                    <th style="font-size:12px">客户图片</th>
                                    <th style="font-size:12px;width:80px">客户姓名</th>
                                    <th style="font-size:12px;width:100px">客户地址</th>
                                    <th style="font-size:12px">客户电话</th>
                                    <th style="font-size:12px">客户邮箱</th>
                                    <th style="font-size:12px">客户等级</th>
                                    <th style="font-size:12px">经济类型</th>
                                    <th style="font-size:12px">隶属行业</th>
                                    <th style="font-size:12px">消费总金额</th>
                                    <th style="font-size:12px">销售模式</th>
                                    <th style="font-size:12px">客户来源</th>
                                    <th style="font-size:12px">加入时间</th>
                                    <th>操作</th>
                                    
                                </tr>
                            </thead>
                            <tbody>
                            <c:if test="${consumerList eq null}">
                                <tr><td colspan="9"  style="text-align: center;"><font color="red" size="4">${message }</font> </td></tr>
                            </c:if>
                            <c:if test="${consumerList != null}">
                            <c:forEach items="${consumerList }" var="consumer">
                                <tr>
                                    <td><input id="con_id" name="con_id" type="checkbox" value="${consumer.con_id }"></td>
                                    <td><img width="50px" src="/upload/${consumer.con_logo }"/></td>
                                    <td>${consumer.con_name }</td>
                                    <td>${consumer.province.province } ${consumer.city.city } ${consumer.country.area }</td>
                                    <td>${consumer.con_tel }</td>
                                    <td>${consumer.con_email }</td>
                                    <td>${consumer.consumerGrand.cg_name }</td>
                                    <td>${consumer.economicType.et_type }</td>
                                    <td>${consumer.industry.in_name }</td>
                                    <td>${consumer.con_price }</td>
                                    <td>${consumer.saleModel.sm_name }</td>
                                    <td>${consumer.consumerSource.cs_name }</td>
                                    <td>${consumer.con_time }</td>
                                    <td>
                                        <button type="button" class="btn btn-outline btn-info" onclick="consumerUpdate(${consumer.con_id })">编辑</button>
                                        <button type="button" class="btn btn-outline btn-danger" onclick="del(${consumer.con_id },'consumerDel','consumerList')">删除</button>
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