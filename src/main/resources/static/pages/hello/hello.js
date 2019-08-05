$(document).ready(function(){
    var hello={
        init:function(){
            hello.initEvent();
            hello.queryUser();
        },
        queryUser:function(){
            var data={
                userName:'张三',
                userCode:'testCode'
            };

            //这是一个 post 请求,着重观察其传参方式
            var url = "/user/queryUser/";
            $.ajax({
                url: url,
                dataType: "json",
                data:JSON.stringify(data),
                contentType: 'application/json;charset=utf-8',
                async: true,
                type: "POST",
                success: function (result) {
                    console.log("后台返回结果:"+JSON.stringify(result));
                    var status=result.STATUS;
                    if(status=='0000'||status=='0'){
                        var data=result.DATA;
                        var resultStr=JSON.stringify(data);
                        console.debug("data:"+resultStr);
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
        queryUserByUserName:function(){

            //这是一个 get 请求,着重观察其传参方式

            var userName=$('#userName').val();
            var data={
                userName:userName
            }
            var url = "/user/queryUserByUserName";
            $.ajax({
                url: url,
                contentType: 'application/json;charset=utf-8',
                async: true,
                type: "GET",
                data:data,
                success: function (result) {
                    console.log("后台返回结果:"+JSON.stringify(result));
                    var status=result.STATUS;
                    if(status=='0000'||status=='0'){
                        var data=result.DATA;
                        var resultStr=JSON.stringify(data);
                        console.debug("data:"+resultStr);
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
            $('#table1').bootstrapTable('destroy');
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
        },

        initEvent:function(){
            $('#btn-userQuery').on('click',function(){
                hello.queryUserByUserName();
            })
        }
    }


    hello.init();
});