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
    

    <title>用户</title>
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
        function employeeAdd() {
        	//window.location.href="employeeAdd";
			var addDialog = top.dialog({
				title:'新建用户',
				url:'employeeAdd',
				width:'1000px',
				height:'600px',
				onclose:function (){
	                window.location.reload();
	            }
			});
			addDialog.showModal();
		}
    </script>
    <script type="text/javascript">
        function employeeUpdate(emp_id) {
			var updateDialog = top.dialog({
				title:'编辑信息',
				url:'employeeUpdate?emp_id='+emp_id,
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
                        <h5><button style="width: 50px" type="button" class="btn btn-outline btn-info" onclick="employeeAdd()">添加</button>
                            <button type="button" class="btn btn-outline btn-danger" onclick="delMore('emp_id','employeeMoreDel','empsList')">批量删除</button>
                        </h5>
                        <div class="ibox-tools">
                            <form action="empsList" method="post" target="_self">
                                                             用户姓名：<input type="text" name="emp_name" value="${employee.emp_name }" >
                                                             账号：<input type="text" name="account" value="${employee.account }" >
                                   <button type="submit" style="font-weight: 10px" class="btn btn-outline btn-success">查询</button>                             
                            </form>   
                        </div>
                    </div>
                    <div class="ibox-content">

                        <table class="table">
                            <thead>
                                <tr>
                                    <th><input type="checkbox"></th>
                                    <th style="font-size:12px">用户头像</th>
                                    <th style="font-size:12px;width:70px">用户姓名</th>
                                    <th style="font-size:12px;width:70px">用户账号</th>
                                    <th style="font-size:12px;width:70px">用户地址</th>
                                    <th style="font-size:12px">用户电话</th>
                                    <th style="font-size:12px">用户邮箱</th>
                                    <th style="font-size:12px;width:70px">用户年龄</th>
                                    <th style="font-size:12px;width:70px">用户性别</th>
                                    <th style="font-size:12px">用户部门</th>
                                    <th style="font-size:12px">用户ID</th>
                                    <th style="font-size:12px;width:70px">用户学历</th>
                                    <th style="font-size:12px">用户角色</th>
                                    <th style="font-size:12px">入职时间</th>
                                    <th style="font-size:12px">操作</th>
                                    
                                </tr>
                            </thead>
                            <tbody>
                            <c:if test="${employeeList eq null}">
                                <tr><td colspan="9"  style="text-align: center;"><font color="red" size="4">${message }</font> </td></tr>
                            </c:if>
                            <c:if test="${employeeList != null}">
                            <c:forEach items="${employeeList }" var="employee">
                                <tr>
                                    <td><input id="emp_id" name="emp_id" type="checkbox" value="${employee.emp_id }"></td>
                                    <td><img width="50px" src="/upload/${employee.emp_logo }"/></td>
                                    <td>${employee.emp_name }</td>
                                    <td>${employee.account }</td>
                                    <td>${employee.province.province } ${employee.city.city } ${employee.country.area }</td>
                                    <td>${employee.emp_tel }</td>
                                    <td>${employee.emp_email }</td>
                                    <td>${employee.emp_age }</td>
                                    <td><c:if test="${employee.emp_sex eq 1}">男</c:if>
                                        <c:if test="${employee.emp_sex eq 0}">女</c:if>
                                    </td>
                                    <td>${employee.dep.dep_name}</td>
                                    <td>${employee.emp_card }</td>
                                    <td>${employee.education.edu_name }</td>
                                    <td>${employee.role.role_name }</td>
                                    <td>${employee.emp_time }</td>
                                    <td>
                                        <button type="button" class="btn btn-outline btn-info" onclick="employeeUpdate(${employee.emp_id })">编辑</button>
                                        <c:if test="${employee.emp_id != 1 }">
                                        <button type="button" class="btn btn-outline btn-danger" onclick="del(${employee.emp_id },'employeeDel','empsList')">删除</button>
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