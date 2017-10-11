var editor;
var tblcodes,tblgg;
var modal;

$(document).ready(function(){
NProgress.start();
setTimeout(function() { NProgress.done(); $('#tablecard').show();}, 1000);


// DATA IN THE DATA TABLES
  tblpending = $("#dataTable").DataTable( {
      dom: '<"toolbar">frtip',
        //"processing": true,
        //"serverSide": true,
       ajax: {
      url: '../Vb/commands/codes/codes.view.asp',
      dataSrc: ""
      //"dataType": "jsonp"
      //"contentType": 'application/json; charset=utf-8',
      //'data': function (data) { return data = JSON.stringify(data); }
      },
    order: [[ 8,'desc' ]],
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
            { data: "Language", "orderable": false},
            { data: "FunctionName", "orderable": false},
            { data: "Version", "orderable": false},
            { data: "DateTimeAdded",
               render: function(data, type, row){
            //You need to have moment.js to parse the date into a local date
              return moment(data).format('MMMM Do YYYY, h:mm A');
              },
              "type": "moment-js-date"
            },
            { data: "AddedBy", "orderable": false},
            { data: "DateTimeUpdated",
              render: function(data, type, row){
            //You need to have moment.js to parse the date into a local date
              return moment(data).format('MMMM Do YYYY, h:mm A');
              },
              "type": "moment-js-date"
            },
            { data: "UpdatedBy","orderable": false},
        ],

    "columnDefs": [ {
        className: "hide_column",
        width: "10%",
        targets: 2,
      render: function ( data, type, row ) {
        return type === 'display' && data.length > 35 ?
          data.substr( 0, 35 ) +'…' :
          data;
      }
       } ],
    select: 'single',
     });
$('#refreshtab').on( 'click', function () {
    window.setTimeout(function(){location.reload()},100);
} );

// VIEWW FUNCTION
    $('#dataTable tbody').on('click', 'td.details-control', function () {
      var HAHA = $(this).closest('tr').find('td:eq(2)').text();
      var CTV = $(this).closest('tr').find('td:eq(3)').text();
      var FNV = $(this).closest('tr').find('td:eq(4)').text();
      $('#viewC').text(HAHA);
      Modalview(HAHA);
      $('#viewModal').modal('toggle');
      $('#CodeTypeView').text(CTV);
      $('#FunctionNameView').text(FNV);
  });
// EDIT CODE FUNCTION
     $('#dataTable tbody').on('click', 'td.details-control3', function () {
      var KAFOY = $(this).closest('tr').find('td:eq(2)').text();
      var A = $(this).closest('tr').find('td:eq(3)').text();
      var B = $(this).closest('tr').find('td:eq(4)').text();
      var C = $(this).closest('tr').find('td:eq(5)').text();
      $('#viewED').val(KAFOY);
      $('#edit_ctype').val(A);
      $('#edit_fname').val(B);
      $('#edit_version').val(C);
      Modalview1();
      $('#editModal').modal('toggle');
  });
   $("#dataTable_filter").addClass('pull-left');
     $("div.toolbar").html('<button type="submit" class="btn btn-default btn-md " id="asearchbtn"><i class=" fa fa-search-plus" aria-hidden="true"></i>&nbsp;Advance search</button><br>');
 $('#asearchbtn').on( 'click', function () {
    $('#sModal').modal('toggle');
} );

$('#aSEARCH').on( 'click', function () {
    table
        .columns(3)
        .search($('#sctype').val())
        .draw();
    table
        .columns(4)
        .search($('#sfuncn').val())
        .draw();
    table
        .columns(7)
        .search($('#saddb').val())
        .draw();
    table
        .columns(9)
        .search($('#supb').val())
        .draw();
    table
        .columns(6)
        .search($('#sdadd').val())
        .draw();
 $('#sModal').modal('hide');
 $('#sctype').val("");
 $('#sfuncn').val("");
 $('#saddb').val("");
 $('#supb').val("");
 $('#tablecard').hide()
 NProgress.start();
setTimeout(function() { NProgress.done(); $('#tablecard').show();}, 2000);
} );
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
