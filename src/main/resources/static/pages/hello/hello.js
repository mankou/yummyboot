$(document).ready(function(){
    var hello={
        init:function(){
            hello.queryUser();
        },
        queryUser:function(){
            var url = "/user/selectAll";
            $.ajax({
                url: url,
                dataType: "json",
                contentType: 'application/json',
                async: true,
                type: "GET",
                success: function (result) {
                    console.log("后台返回结果:"+JSON.stringify(result));
                    var status=result.STATUS;
                    if(status=='0000'){
                        var data=result.DATA;
                        var resultStr=JSON.stringify(data);
                        console.debug("查询结果:"+resultStr);
                        // $('.result').text(resultStr);
                        hello.drawTable(data);

                    }else{
                        alert("查询出错,返回错误码:")
                    }

                },
                error: function (msg) {
                    alert("查询异常");
                }
            });
        },
        drawTable:function(data){
            $('#table1').bootstrapTable({
                striped: false,                      //是否显示行间隔色
                sortable: true,                    //是否启用排序
                sortName:'code',
                sortOrder: "asc",                 //排序方式
                data: data,
                columns: [
                    {
                        field: 'id',
                        title: 'id',
                        sortable:true,
                    },
                    {
                        field: 'code',
                        title: '编码',
                        sortable:true,
                    },
                    {
                        field: 'name',
                        title: '姓名',
                        sortable:true,
                    },
                    {
                        field: 'createDate',
                        title: '创建时间',
                        sortable:true,
                    }
                ],
            });
        }
    }


    hello.init();
});