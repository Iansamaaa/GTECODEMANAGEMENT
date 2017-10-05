var editor;
var tblcodes,tblgg;
var modal;

$(document).ready(function(){
NProgress.start();
setTimeout(function() { NProgress.done(); $('#tablecard').show();}, 1000);
// DATA IN THE DATA TABLES
  vartblpending = $("#dataTable").DataTable( {
      dom: '<"toolbar">frtip',
        processing: "true",
       ajax: {
      url: '../Vb/commands/codes/codes.view.asp',
      dataSrc: ""
      //"dataType": "jsonp"
      //"contentType": 'application/json; charset=utf-8',
      //'data': function (data) { return data = JSON.stringify(data); }
      },
    order: [[ 7, 'desc' ]],
    "aLengthMenu": [[5, 10, 15, 25, 50, 100 , -1], [5, 10, 15, 25, 50, 100, "All"]],
    "iDisplayLength" : 5,
    "order": [[ 9, "desc" ]],
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
        targets: 3,
      render: function ( data, type, row ) {
        return type === 'display' && data.length > 35 ?
          data.substr( 0, 35 ) +'…' :
          data;
      }
       } ],
    select: 'single',
     });

// VIEWW FUNCTION
    $('#dataTable tbody').on('click', 'td.details-control', function () {
      var HAHA = $(this).closest('tr').find('td:eq(3)').text();
      var CTV = $(this).closest('tr').find('td:eq(4)').text();
      var FNV = $(this).closest('tr').find('td:eq(5)').text();
      $('#viewC').text(HAHA);
      Modalview(HAHA);
      $('#viewModal').modal('toggle');
      $('#CodeTypeView').text(CTV);
      $('#FunctionNameView').text(FNV);
  });
// REMOVE CODE FUNCTION

      $('#dataTable tbody').on('click', 'td.details-control2', function () {
      var KAFOY = $(this).closest('tr').find('td:eq(3)').text();
      $('#IDrecord').val(KAFOY);
      $('#removeModal').modal('toggle');
  });
// EDIT CODE FUNCTION
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
 $("div.toolbar").html('<select id="hays"><option value="4">Code Type</option><option value="5">Function Name</option><option value="8">Added By</option><option value="10">Updated by</option></select>&nbsp;<input type="text" placeholder="Advance Search..." id="asearch"></input>');
 var table = $('#dataTable').DataTable();
$('#asearch').on( 'keyup', function () {
    table
        .columns($('#hays').val())
        .search( this.value )
        .draw();
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