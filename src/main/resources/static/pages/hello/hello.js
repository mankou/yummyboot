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
                        title: 'id'
                    },
                    {
                        field: 'code',
                        title: '编码'
                    },
                    {
                        field: 'name',
                        title: '姓名'
                    },
                    {
                        field: 'createDate',
                        title: '创建时间'
                    }
                ],
            });
        }
    }


    hello.init();
});