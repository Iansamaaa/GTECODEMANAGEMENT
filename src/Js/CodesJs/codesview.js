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
      url: '../Vb/commands/codes/codes.view.asp',
      dataSrc: ""
      //"dataType": "jsonp"
      //"contentType": 'application/json; charset=utf-8',
      //'data': function (data) { return data = JSON.stringify(data); }
      },
    order: [[ 2, 'asc' ]],
    "aLengthMenu": [[5, 10, 15, 25, 50, 100 , -1], [5, 10, 15, 25, 50, 100, "All"]],
    "iDisplayLength" : 5,
    columns: [
             {
                "className":      'details-control3',
                "orderable":      false,
                "data":           null,
                "defaultContent": '',
                 "render": function () {
                         return '<i class="fa fa-pencil-square-o" aria-hidden="true">';
                     },
                 width:"15px"
            },
            {
                "className":      'details-control2',
                "orderable":      false,
                "data":           null,
                "defaultContent": '',
                 "render": function () {
                         return '<i class="fa fa-times" aria-hidden="true"></i>';
                     },
                 width:"15px"
            },
            {
                "className":      'details-control',
                "orderable":      false,
                "data":           null,
                "defaultContent": '',
                 "render": function () {
                         return '<i class="fa fa-eye" aria-hidden="true"></i>';
                     },
                 width:"15px"
            },
            { data: "IDCode", "orderable": false},
            { data: "Language"},
            { data: "FunctionName"},
            { data: "Version", "orderable": false},
            { data: "DateTimeAdded", "orderable": false},
            { data: "AddedBy", "orderable": false},
            { data: "DateTimeUpdated", "orderable": false},
            { data: "UpdatedBy","orderable": false},
        ], 

    "columnDefs": [ {
      width: "10%",
      targets: 3,
      render: function ( data, type, row ) {
        return type === 'display' && data.length > 35 ?
          data.substr( 0, 35 ) +'…' :
          data;
      }
       } ],
    select: 'single',
     });

    $('#dataTable tbody').on('click', 'td.details-control', function () {
      var HAHA = $(this).closest('tr').find('td:eq(3)').text();
      $('#viewC').text(HAHA);
      Modalview(HAHA);
      $('#viewModal').modal('toggle');
  });

      $('#dataTable tbody').on('click', 'td.details-control2', function () {
      var KAFOY = $(this).closest('tr').find('td:eq(3)').text();
      $('#IDrecord').val(KAFOY);
      $('#removeModal').modal('toggle');
  });

     $('#dataTable tbody').on('click', 'td.details-control3', function () {
      var KAFOY = $(this).closest('tr').find('td:eq(3)').text();
      var A = $(this).closest('tr').find('td:eq(4)').text();
      var B = $(this).closest('tr').find('td:eq(5)').text();
      var C = $(this).closest('tr').find('td:eq(6)').text();
      $('#viewED').val(KAFOY);
      $('#edit_ctype').val(A);
      $('#edit_fname').val(B);
      $('#edit_version').val(C);
      Modalview1();
      $('#editModal').modal('toggle');
  });

  });



function Modalview(labad){
  //Set Ajax Status
  var datastring;
  datastring= {VIEWM: labad,
        };

  $.ajax({
    type: "POST",
    url: "../Vb/commands/codes/command_codes_viewm.asp",
    data: datastring,
    async: false,
    success: function(data){
      $('#codeTA').text(atob(data));

      },
    error:  function(){
      toastr.success("Delete Failed", "Failed");}
    })

}

function Modalview1(value){
  //Set Ajax Status
  var datastring;
  datastring= {VIEWN: $('#viewED').val(),
        };
  $.ajax({
    type: "POST",
    url: "../Vb/commands/codes/command_codes_viewn.asp",
    data: datastring,
    async: false,
    success: function(data){

      $('#edit_codedesc').val(atob(data));

      },
    error:  function(){
      toastr.success("Delete Failed", "Failed");}
    })

}
