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
    

    <title>离职用户</title>
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
        function employeeRec(emp_id) {
			var updateDialog = top.dialog({
				title:'编辑信息',
				url:'employeeRec?emp_id='+emp_id,
				//width:'1000px',
				onclose:function (){
                    window.location.reload();
                }
			});
			updateDialog.showModal();
		}
    </script>
    <script type="text/javascript">
        function del(id){
        	var delDialog = top.dialog({
                title:'删除用户',
                url:'employeeDel?id='+id,
                width:'500px',
                onclose:function (){
                	window.location.href="empsList";
                }
            });
            delDialog.showModal();
        }
    </script>
    <!-- <script type="text/javascript">
    function delMore(){
    	var goods_ids = new Array();
        $("input[name='goods_id']:checked").each(function() {
         //将选中数据存到数组里
         goods_ids.push($(this).val());
         });
        if(goods_ids.length<=0){
        	alert("请选择要删除的数据！");
        }else{
        	var delMoreDialog = top.dialog({
                title:'删除商品',
                url:'delMore?goods_ids='+goods_ids,
                width:'500px',
                onclose:function (){
                    window.location.reload();
                }
            });
            delMoreDialog.showModal();
        }
        
    } -->
    </script>
    <script type="text/javascript">
        function employeeMoreDel(){
        	var emp_ids = new Array();
    	   $("input[name='emp_id']:checked").each(function() {
            //将选中数据存到数组里
            emp_ids.push($(this).val());
            });
    	   if(emp_ids.length<=0){
               alert("请选择要删除的数据！");
           }else{
                var delDialog = top.dialog({
                    title:'删除商品',
                    url:'employeeMoreDel.action?emp_ids='+emp_ids,
                    width:'500px',
                    onclose:function (){
                       // self.location.reload();
                    	window.location.href="empsList";
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
                        <h5>
                            <button type="button" class="btn btn-outline btn-danger" onclick="employeeMoreDel()">批量删除</button>
                        </h5>
                        <div class="ibox-tools">
                            <form action="empsNotList" method="post" target="_self">
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
                                    <th>用户头像</th>
                                    <th>用户姓名</th>
                                    <th>用户账号</th>
                                    <th>用户地址</th>
                                    <th>用户电话</th>
                                    <th>用户邮箱</th>
                                    <th>用户年龄</th>
                                    <th>用户性别</th>
                                    <th>用户部门</th>
                                    <th>用户ID</th>
                                    <th>用户学历</th>
                                    <th>用户角色</th>
                                    <th>入职时间</th>
                                    <th>操作</th>
                                    
                                </tr>
                            </thead>
                            <tbody>
                            <c:if test="${employeeNotList eq null}">
                                <tr><td colspan="9"  style="text-align: center;"><font color="red" size="4">${message }</font> </td></tr>
                            </c:if>
                            <c:if test="${employeeNotList != null}">
                            <c:forEach items="${employeeNotList }" var="employee">
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
                                        <button type="button" class="btn btn-outline btn-info" onclick="employeeRec(${employee.emp_id })">恢复</button>
                                        <button type="button" class="btn btn-outline btn-danger" onclick="del(${employee.emp_id })">删除</button>
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