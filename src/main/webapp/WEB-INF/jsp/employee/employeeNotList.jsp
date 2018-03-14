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
    <script src="js/jsutil.js" type="text/javascript"></script>
    <script src="js/plugins/sweetalert/sweetalert.min.js"></script>
    <link href="css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <script type="text/javascript">
        function employeeRec(emp_id) {
            swal({
                    title: "Are you sure?",
                    text: "You confirm the recovery!",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#8DEEEE",
                    confirmButtonText: "恢复！",
                    closeOnConfirm: false
                },
                function () {
                    $.ajax(
                        {
                            type: "get",
                            url: "employeeRec",
                            contentType: 'application/json;charset=UTF-8',
                            dataType: "json",
                            traditional: true,
                            async: false,
                            data: {"id": emp_id},
                            success: function (data) {
//                                console.log(data.data.goods_id)
                                swal({
                                        title: '操作成功',
                                        text: '2秒后自动关闭。',
                                        timer: 2000
                                    },
                                    function () {
                                        window.location.href = "empsNotList";
                                    });
//                                    swal("操作成功!", "已成功删除数据！", "success");
//                                    window.location.href="goodsList";
                            },
                            error: function (data) {
                                swal({
                                        title: '操作失败',
                                        text: '2秒后自动关闭。',
                                        timer: 2000
                                    },
                                    function () {
                                        window.location.href = "empsNotList";
                                    });
//                                    swal("OMG", "删除操作失败了!", "error");
//                                    window.location.href="goodsList";
                            }
                        }
                    )
                });
		}
    </script>
    <script type="text/javascript">
        function employeeMoreDel(){
            var ids = new Array();
            $("input[name='emp_id']:checked").each(function() {
                //将选中数据存到数组里
                ids.push($(this).val());
                console.log(ids)
            });
            if(ids.length<=0){
                swal({
                        title: '请选择要要删除的数据！',
                        text: '2秒后自动关闭。',
                        timer: 2000
                    },
                    function () {
                        window.location.href="empsNotList";
                    });
                // handling the promise rejection

            }else{
                swal({
                        title: "Are you sure?",
                        text: "Not recoverable after the file is deleted!",
                        type: "warning",
                        showCancelButton: true,
                        confirmButtonColor: "#DD6B55",
                        confirmButtonText: "删除",
                        closeOnConfirm: false
                    },
                    function(){
                        $.ajax(
                            {
                                type: "post",
                                url: "employeeMoreDel",
                                dataType:"JSON",
                                traditional: true,
                                // contentType: 'application/json;charset=UTF-8',
                                data:{"ids": ids},
                                success:function (data) {
                                    //console.log(data,'<>?')
                                    swal({
                                            title: '操作成功',
                                            text: '2秒后自动关闭。',
                                            timer: 2000
                                        },
                                        function () {
                                            window.location.href="empsNotList";
                                        });
//                                    swal("操作成功!", "已成功删除数据！", "success");
//                                    window.location.href="goodsList";
                                },
                                error:function (data) {
                                    swal({
                                            title: '操作失败',
                                            text: '2秒后自动关闭。',
                                            timer: 2000
                                        },
                                        function () {
                                            window.location.href="empsNotList";
                                        });
//                                    swal("OMG", "删除操作失败了!", "error");
//                                    window.location.href="goodsList";
                                }
                            }
                        )
                    });
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
                                        <button type="button" class="btn btn-outline btn-info" onclick="employeeRec(${employee.emp_id },'employeeRec','empsNotList')">恢复</button>
                                        <%--<button type="button" class="btn btn-outline btn-danger" onclick="del(${employee.emp_id })">删除</button>--%>
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