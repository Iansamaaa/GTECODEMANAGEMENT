$(document).ready(function(){
NProgress.start();
setTimeout(function() { NProgress.done(); $('#tablecard').show();}, 1000);

  tblpending = $("#dataTable").DataTable( {

      dom: "Bfrtip",
        //"processing": true,
        //"serverSide": true,
       ajax: {
      url: '../Vb/commands/codes/language.command.asp',
      dataSrc: ""
      //"dataType": "jsonp"
      //"contentType": 'application/json; charset=utf-8',
      //'data': function (data) { return data = JSON.stringify(data); }
      },
	 bAutoWidth:false,
    "aLengthMenu": [[5, 10, 15, 25, 50, 100 , -1], [5, 10, 15, 25, 50, 100, "All"]],
    "iDisplayLength" : 10,
    columns: [
              {
                "className":      'details-control2',
                "orderable":      false,
                 "render": function () {
                         return '<i class="fa fa-times" aria-hidden="true"></i>';
                     },
                 width:"15px",

              },
            {data:"ID", "orderable": false},
            { data: "Language", "orderable": false},
            { data: "AddedBy", "orderable": false},
        ],
  "columnDefs": [ {
        className: "hide_column",
        width: "10%",
        targets: 1,
      } ],
    select: 'single',
     });

  // REMOVE CODE FUNCTION

      $('#dataTable tbody').on('click', 'td.details-control2', function () {
      var KAFOY = $(this).closest('tr').find('td:eq(1)').text();
      $('#IDrecord').val(KAFOY);
      $('#removeModal').modal('toggle');
  });

  });
