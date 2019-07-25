$(document).ready(function(){
    alert('hello');

    var url = "/helloJson/getDate";
    $.ajax({
        url: url,
        // data: data,
        dataType: "json",
        contentType: 'application/json',
        async: true,
        type: "GET",
        success: function (result) {
           $('.result').text(result);
        },
        error: function (msg) {
            alert("查询异常");
        }
    });
})