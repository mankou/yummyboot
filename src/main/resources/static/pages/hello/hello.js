$(document).ready(function(){
   console.log('hello12');
    var url = "/helloJson/queryUser";
    $.ajax({
        url: url,
        // data: data,
        dataType: "json",
        contentType: 'application/json',
        async: true,
        type: "GET",
        success: function (result) {
            console.log(JSON.stringify(result));
            var resultStr=JSON.stringify(result)
           $('.result').text(resultStr);
        },
        error: function (msg) {
            alert("查询异常");
        }
    });
})