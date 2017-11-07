var editor;
var tblcodes,tblgg;
var modal;
var passversion;
$(document).ready(function(){
NProgress.start();
setTimeout(function() { NProgress.done(); $('#tablecard').show();}, 1000);
// DATA IN THE DATA TABLES

  $("#dataTable").DataTable( {
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
      order : [[11, 'desc']],
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
            { data: "Description", "orderable": false},
            { data: "Version", "orderable": false},
            { data: "DateTimeAdded",
              type: "date",
               render: function(data){
            //You need to have moment.js to parse the date into a local date
              return moment(data).format('lll');
              },
              "type": "moment-js-date"
            },
            { data: "AddedBy", "orderable": false},
            { data: "DateTimeUpdated",
              orderable: false,
              type: "date",
            render: function(data){

            //You need to have moment.js to parse the date into a local date
              return moment(data).format('lll');
              },
              "type": "moment-js-date"
          },
            { data: "UpdatedBy","orderable": false},
            { data: "DateTimeUpdated"},
            { data: "ReleaseNotes"},
            { data: "DateTimeAdded"},
        ],

    "columnDefs": [ {
        className: "hide_column",
        width: "10%",
        targets: [2,11,5,12,13],
       } ],

    select: 'single'
     });
$('#refreshtab').on( 'click', function () {
    window.setTimeout(function(){location.reload()},100);
} );

// VIEW FUNCTION
    $('#dataTable tbody').on('click', 'td.details-control', function () {
      var HAHA = $(this).closest('tr').find('td:eq(2)').text();
      var CTV = $(this).closest('tr').find('td:eq(3)').text();
      var FNV = $(this).closest('tr').find('td:eq(4)').text();
      var C = parseFloat($(this).closest('tr').find('td:eq(6)').text());
      var DV = $(this).closest('tr').find('td:eq(5)').text();
      $('#viewC').text(HAHA);
      Modalview(HAHA);
      RNview(HAHA);
      commentView(HAHA);
      $('#viewModal').modal('toggle');
      $('#CodeTypeView').text(CTV);
      $('#FunctionNameView').text(FNV);
      $('#descview').text(DV);
      $('#current_version').text(C+0.0);

  });
//View EDIT CODE FUNCTION
     $('#dataTable tbody').on('click', 'td.details-control3', function () {
      var KAFOY = $(this).closest('tr').find('td:eq(2)').text();
      var A = $(this).closest('tr').find('td:eq(3)').text();
      var B = $(this).closest('tr').find('td:eq(4)').text();
      var C = parseFloat($(this).closest('tr').find('td:eq(6)').text());
      var D = $(this).closest('tr').find('td:eq(5)').text();
      var SS = parseFloat(C*1.0+1.0).toFixed(2);

      // FOR ADD P VERSION
      var E= $(this).closest('tr').find('td:eq(12)').text();
      var F= $(this).closest('tr').find('td:eq(11)').text();
      var G= $(this).closest('tr').find('td:eq(13)').text();
      var H= $(this).closest('tr').find('td:eq(8)').text();
      var I= $(this).closest('tr').find('td:eq(10)').text();

      // FOR UPDATE
      $('#viewED').val(KAFOY);
      $('#edit_ctype').val(A);
      $('#edit_fname').val(B);
      $('#edit_version').val(C);
      $('#next_version').val(SS);
      $('#edit_desc').val(atob(D));

      // ADD PREVIOUS VERSION
      $('#rnrnrn').val(E);
      $('#dtad').val(G);
      $('#dtup').val(F);
      $('#addbyy').val(H);
      $('#uppbyy').val(I);
      $('#pdesc').val(atob(D));
      $('#pfunc').val(B);


      passversion=SS;
      codeview_edit();
      $('#editModal').modal('toggle');
  });


   $("#dataTable_filter").addClass('pull-left');
     $("div.toolbar").html('<button type="submit" class="btn btn-default btn-md " id="asearchbtn"><i class=" fa fa-search-plus" aria-hidden="true"></i>&nbsp;Advance search</button><br>');
 $('#asearchbtn').on( 'click', function () {
    $('#sModal').modal('toggle');
} );
 var table = $('#dataTable').DataTable()

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
        .columns(8)
        .search($('#saddb').val())
        .draw();
    table
        .columns(10)
        .search($('#supb').val())
        .draw();
    table
        .columns(7)
        .search($('#sdadd').val())
        .draw();
 $('#tablecard').hide()
 $('#sModal').modal('hide');
 $('#sctype').val("");
 $('#sfuncn').val("");
 $('#saddb').val("");
 $('#supb').val("");
 $('#tablecard').hide()
 NProgress.start();
setTimeout(function() { NProgress.done(); $('#tablecard').show();}, 2000);
});

$('#viewreleasenotes').on( 'click', function () {
      $('#vrnModal').modal('toggle');
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

function RNview(labad){
  //Set Ajax Status
  var datastring;
  datastring= {VIEWM: labad,
        };

  $.ajax({
    type: "POST",
    url: "../Vb/commands/codes/releasenotesview.asp",
    data: datastring,
    async: false,
    success: function(data){
      $('#viewrnc').text(data);

      },
    error:  function(){
      toastr.success("Delete Failed", "Failed");}
    })

}

function commentView(labad){
  //Set Ajax Status
  var datastring;
  datastring= {VIEWM: labad,
        };

  $.ajax({
    type: "POST",
    url: "../Vb/commands/codes/commentsView.asp",
    data: datastring,
    async: false,
    success: function(data){
      $('#codedescript').text(atob(data));

      },
    error:  function(){
      toastr.success("View Failed", "Failed");}
    })

}





function codeview_edit(value){
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
      $('#pcont').val(atob(data));



      },
    error:  function(){
      toastr.success("Delete Failed", "Failed");}
    })

}
