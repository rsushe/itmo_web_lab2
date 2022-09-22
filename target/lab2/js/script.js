// $(document).ready(function () {
//     $("#form input[name='clientDate']").val(new Date().toLocaleString());
    // $.ajax({
    //     type: 'GET',
    //     url: 'php/handler.php',
    //     success: (data) => $("#result_table tbody").html(data)
    // });

    // $("#form #submit").click(function (event) {
    //     if (!validate_form()) {
    //         return false;
    //     }
    //
    //     let formData = $("#form").serializeArray();
    //     formData.push({"name": "local_time", "value" : new Date().toLocaleString()});
    //     // console.log(formData);
    //
    //     $.ajax({
    //         type: 'POST',
    //         url: 'ControllerServlet',
    //         data: {
    //             x: $('input[name="x"]:checked').val(),
    //             y: $('input[name="y"]').val(),
    //             r: $('input[name="r"]:checked').val(),
    //             clientDate: new Date().toLocaleString()
    //         }
    //         // success: (data) => alert(data)
    //     });
    //     event.preventDefault();
    // });

    // $("#form #clear").click(function (event) {
        // var formData = new Array();
        // formData.push({"name" : "type", "value" : "clear"});
        // console.log(formData);

//         $.ajax({
//             type: 'DELETE',
//             url: 'php/handler.php'
//             // data: formData,
//             // success: (data) => $("#result_table tbody").html(data)
//         });
//         event.preventDefault();
//     });
// });
