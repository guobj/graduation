<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
        function jumpPage(pages) {
            $("#pages").val(pages);
            //var pageForm = ;
            $("#pageForm").action="${url}";
            $("#pageForm").method="post";
            $("#pageForm").submit();
        }
    </script>
<div class="row">
    <c:if test="${pages != null}">
        <div class="col-sm-6">
            <div class="dataTables_info" id="DataTables_Table_0_info" role="alert" aria-live="polite" aria-relevant="all">当前第<font color="red">${pages }</font>页，共 <font color="red">${sumPage }</font>页</div>
        </div>
    </c:if>
    <form target="_self" id="pageForm">
        <input type="hidden" id="pages" name="pages">
        <c:if test="${goods.goods_name!=null and goods.goods_name.trim()!='' }">
            <input type="hidden" id="goods_name" name="goods_name" value="${goods.goods_name }">
        </c:if>
        <c:if test="${goodstype.gt_type!=null and goodstype.gt_type.trim()!='' }">
            <input type="hidden" id="gt_type" name="gt_type" value="${goodstype.gt_type}">
        </c:if>
        <c:if test="${role.role_name!=null and role.role_name.trim()!='' }">
            <input type="hidden" id="role_name" name="role_name" value="${role.role_name }">
        </c:if>
        <c:if test="${goodsunit.gu_name!=null and goodsunit.gu_name.trim()!='' }">
            <input type="hidden" id="gu_name" name="gu_name" value="${goodsunit.gu_name }">
        </c:if>
        <c:if test="${consumer.con_name!=null and consumer.con_name.trim()!='' }">
            <input type="hidden" id="con_name" name="con_name" value="${consumer.con_name }">
        </c:if>
        <c:if test="${consumer.con_tel!=null and consumer.con_tel.trim()!='' }">
            <input type="hidden" id="con_tel" name="con_tel" value="${consumer.con_tel }">
        </c:if>
        <c:if test="${consumergrand.cg_name!=null and consumergrand.cg_name.trim()!='' }">
            <input type="hidden" id="cg_name" name="cg_name" value="${consumergrand.cg_name }">
        </c:if>
        <c:if test="${employee.emp_name!=null and employee.emp_name.trim()!=''}">
            <input type="hidden" id="emp_name" name="emp_name" value="${employee.emp_name }">
        </c:if>
        <c:if test="${employee.account!=null and employee.account.trim()!=''}">
            <input type="hidden" id="account" name="account" value="${employee.account }">
        </c:if>
        <c:if test="${supplier.sup_name!=null and supplier.sup_name.trim()!=''}">
            <input type="hidden" id="sup_name" name="sup_name" value="${supplier.sup_name }">
        </c:if>
        <c:if test="${supplier.sup_tel!=null and supplier.sup_tel.trim()!=''}">
            <input type="hidden" id="sup_tel" name="sup_tel" value="${supplier.sup_tel }">
        </c:if>
        <c:if test="${goodsout.go_name!=null and goodsout.go_name.trim()!=''}">
            <input type="hidden" id="go_name" name="go_name" value="${goodsout.go_name }">
        </c:if>
         <c:if test="${order.or_account!=null and order.or_account.trim()!=''}">
            <input type="hidden" id="or_account" name="or_account" value="${order.or_account }">
        </c:if>
        <c:if test="${suppliergoods.goods.goods_name!=null and suppliergoods.goods.goods_name.trim()!=''}">
            <input type="hidden" id="goods.goods_name" name="goods.goods_name" value="${suppliergoods.goods.goods_name }">
        </c:if>
        <c:if test="${supplierlicensetype.supplier.sup_name !=null and supplierlicensetype.supplier.sup_name.trim()!=''}">
            <input type="hidden" id="supplier.sup_name" name="supplier.sup_name" value="${supplierlicensetype.supplier.sup_name }">
        </c:if>
         <%-- <c:if test="${suppliergoods.supplier.sup_name!=null and suppliergoods.supplier.sup_name.trim()!=''}">
            <input type="hidden" id="supplier.sup_name" name="supplier.sup_name" value="${suppliergoods.supplier.sup_name }">
        </c:if> --%>

        <c:if test="${pages != null}">
            <div class="col-sm-6">
                <div class="dataTables_paginate paging_simple_numbers" id="DataTables_Table_0_paginate">
                    <ul class="pagination">
                        <li class="paginate_button next" aria-controls="DataTables_Table_0" tabindex="0" >
                            <a onclick="jumpPage(1)" href="javascript:void(0);">首页</a>
                        </li>
                        <li class="paginate_button next" aria-controls="DataTables_Table_0" tabindex="0" >
                            <a onclick="jumpPage(${(pages-1<1)?1:(pages-1)})" href="javascript:void(0);">上一页</a>
                        </li>
                        <li class="paginate_button next" aria-controls="DataTables_Table_0" tabindex="0" >
                            <a onclick="jumpPage(${(pages+1>sumPage)?sumPage:(pages+1)})" href="javascript:void(0);">下一页</a>
                        </li>
                        <li class="paginate_button next" aria-controls="DataTables_Table_0" tabindex="0" >
                            <a onclick="jumpPage(${sumPage})" href="javascript:void(0);">尾页</a>
                        </li>
                    </ul>
                </div>
            </div>
        </c:if>
    </form>
</div>