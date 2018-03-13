/**
 * Created by guobj on 2018/3/12.
 */
//单个删除

/**
 *
 * @param id  删除数据id
 * @param requestUrl  请求地址
 * @param responseUrl  刷新地址
 */
function del(id,requestUrl,responseUrl) {
    swal({
            title: "Are you sure?",
            text: "You will not be able to recover this imaginary file!",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "删除！",
            closeOnConfirm: false
        },
        function () {
            $.ajax(
                {
                    type: "get",
                    url: requestUrl,
                    contentType: 'application/json;charset=UTF-8',
                    dataType: "json",
                    traditional: true,
                    async: false,
                    data: {"id": id},
                    success: function (data) {
//                                console.log(data.data.goods_id)
                        swal({
                                title: '操作成功',
                                text: '2秒后自动关闭。',
                                timer: 2000
                            },
                            function () {
                                window.location.href = responseUrl;
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
                                window.location.href = responseUrl;
                            });
//                                    swal("OMG", "删除操作失败了!", "error");
//                                    window.location.href="goodsList";
                    }
                }
            )
        });
}


/**
 *
 * @param idName    主键名称
 * @param requestUrl    请求地址
 * @param responseUrl    刷新地址
 */
//批量删除
function delMore(idName,requestUrl,responseUrl){
    var ids = new Array();
    $("input[name="+idName+"]:checked").each(function() {
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
                window.location.href=responseUrl;
            });
        // handling the promise rejection

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
                        url: requestUrl,
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
                                    window.location.href=responseUrl;
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
                                    window.location.href=responseUrl;
                                });
//                                    swal("OMG", "删除操作失败了!", "error");
//                                    window.location.href="goodsList";
                        }
                    }
                )
            });
    }
}