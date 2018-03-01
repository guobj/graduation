<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    pageContext.setAttribute("path", path);
    pageContext.setAttribute("basePath", basePath);
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <script src="js/plugins/sweetalert/sweetalert.min.js"></script>
    <link href="css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <script type="text/javascript">
        function goodsAdd() {
			var addDialog = top.dialog({
				title:'添加商品',
				url:'goodsAdd',
				width:'700px',
				//height:'500px',
				onclose:function (){
	                window.location.reload();
	            }
			});
			addDialog.showModal();
		}
    </script>
    <script type="text/javascript">
        function goodsUpdate(goods_id) {
			var updateDialog = top.dialog({
				title:'编辑信息',
				url:'goodsUpdate?goods_id='+goods_id,
				width:'500px',
				onclose:function (){
                    window.location.reload();
                }
			});
			updateDialog.showModal();
		}
    </script>
    <script type="text/javascript">
       /* function del(id) {
            swal({
                    title: "Are you sure?",
                    text: "You will not be able to recover this imaginary file!",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "删除！",
                    closeOnConfirm: false
                },
                function(isConfirm){
                    if (isConfirm){
                        swal({title:"删除成功！",
                            text:"",
                            type:"success"},
                            function(){

                        })
                    } else {
                        swal({title:"已取消",
                            text:"",
                            type:"error"})
                    }
                });
        }*/
        function del(id){
        	var delDialog = top.dialog({
                title:'删除商品',
                url:'del?id='+id,
                width:'500px',
                onclose:function (){
                	window.location.href="goodsList";
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
    <script type="text/javascript">
        function goodsMoreDel(){
        	var goods_ids = new Array();
    	   $("input[name='goods_id']:checked").each(function() {
            //将选中数据存到数组里
            goods_ids.push($(this).val());
            });
    	   if(goods_ids.length<=0){
               swal({
                   title: '请选择要要删除的数据！',
                   text: '2秒后自动关闭。',
                   timer: 2000
               }).then(
                   function () {},
                   // handling the promise rejection
                   function (dismiss) {
                       if (dismiss === 'timer') {
                           console.log('I was closed by the timer')
                       }
                   }
               )
           }else{
               swal({
                       title: "Are you sure?",
                       text: "You will not be able to recover this imaginary file!",
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
                                url: "goodsMoreDel",
                                dataType:"TEXT",
                                traditional: true,
                                data: {"goods_ids": goods_ids},
                                success:function (data) {
                                    swal("操作成功!", "已成功删除数据！", "success");
                                    window.location.href="goodsList";
                                },
                                error:function (data) {
                                    swal("OMG", "删除操作失败了!", "error");
                                    window.location.href="goodsList";
                                }
                            }
                        )
                            /*.done(
                            function (data) {

                            }
                        ).error(
                            function (data) {
                                swal("OMG", "删除操作失败了!", "error");
                            }
                        )*/
                   });
               /* var delDialog = top.dialog({
                    title:'删除商品',
                    url:'goodsMoreDel?goods_ids='+goods_ids,
                    width:'500px',
                    onclose:function (){
                       // self.location.reload();
                    	window.location.href="goodsList";
                    }
                });
                delDialog.showModal();*/
           }
        }
    </script>
    <script type="text/javascript">
        function goodsExcel(){
        	window.location.href="goodsExcel";
        }
    </script>
     <script type="text/javascript">
        function goodsImportExcelDialog(){
        	var delDialog = top.dialog({
                title:'选择导入文件',
                url:'goodsImportExcelDialog',
                width:'500px',
                onclose:function (){
                	window.location.href="goodsList";
                }
            });
            delDialog.showModal();
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
		                        <button style="width: 50px" type="button" class="btn btn-outline btn-info" onclick="goodsAdd()">添加</button>
		                        <button type="button" class="btn btn-outline btn-danger" onclick="goodsMoreDel()">批量删除</button>
	                        	<button style="width: 50px" type="button" class="btn btn-outline btn-info" onclick="goodsImportExcelDialog()">导入</button>
		                        <button style="width: 50px" type="button" class="btn btn-outline btn-info" onclick="goodsExcel()">导出</button>
	                        </h5>
                        <div class="ibox-tools">
                            <form action="goodsList" method="post" target="_self">
                                                             商品名称：<input type="text" name="goods_name" value="${goods.goods_name }" >
                                   <button type="submit" style="font-weight: 10px" class="btn btn-outline btn-success">查询</button>                             
                            </form>   
                        </div>
                    </div>
                    <div class="ibox-content">

                        <table class="table">
                            <thead>
                                <tr>
                                    <th><input type="checkbox"></th>
                                    <th>商品图片</th>
                                    <th>商品名称</th>
                                    <th>商品类型</th>
                                    <th>价格</th>
                                    <th>会员价</th>
                                    <th>供应商</th>
                                    <th>单位</th>
                                    <th>操作</th>
                                    
                                </tr>
                            </thead>
                            <tbody>
                            <c:if test="${goodsList eq null}">
                                <tr><td colspan="9"  style="text-align: center;"><font color="red" size="4">${message }</font> </td></tr>
                            </c:if>
                            <c:if test="${goodsList != null}">
                            <c:forEach items="${goodsList }" var="goods">
                                <tr>
                                    <td><input id="goods_ids" name="goods_id" type="checkbox" value="${goods.goods_id }"></td>
                                    <td><img width="50px" src="/upload/${goods.goods_logo }"/></td>
                                    <td>${goods.goods_name }</td>
                                    <td>${goods.gtype.gt_type }</td>
                                    <td>${goods.goods_price }</td>
                                    <td>${goods.goods_vipprice }</td>
                                    <td>${goods.supplier.sup_name }</td>
                                    <td>${goods.gu.gu_name }</td>
                                    <td>
                                        <button type="button" class="btn btn-outline btn-info" onclick="goodsUpdate(${goods.goods_id })">编辑</button>
                                        <button type="button" class="btn btn-outline btn-danger" onclick="del(${goods.goods_id })">删除</button>
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