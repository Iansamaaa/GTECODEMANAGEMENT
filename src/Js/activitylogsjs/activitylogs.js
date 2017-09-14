var editor;
var tblcodes,tblgg;
var modal;

$(document).ready(function(){
NProgress.start();
setTimeout(function() { NProgress.done(); $('#tablecard').show();}, 1000);



  tblpending = $("#dataTable").DataTable( {
      dom: "Bfrtip",
        //"processing": true,
        //"serverSide": true,
       ajax: {
      url: '../Vb/commands/actlog/actlogs.asp',
      dataSrc: ""
      //"dataType": "jsonp"
      //"contentType": 'application/json; charset=utf-8',
      //'data': function (data) { return data = JSON.stringify(data); }
      },
    order: [[ 3, 'asc' ]],
    "aLengthMenu": [[5, 10, 15, 25, 50, 100 , -1], [5, 10, 15, 25, 50, 100, "All"]],
    "iDisplayLength" : 5,
    columns: [
            {data:"ACTnum", "visible": false, "orderable": false},
            { data: "ACTuser", "orderable": false},
            { data: "ACTdate", "orderable": false},
            { data: "ACTdescription", "orderable": false},
        ], 
    select: 'single',
     });

  });



 
