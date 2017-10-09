$(document).ready(function(){
NProgress.start();
setTimeout(function() { NProgress.done(); $('#tablecardsmembersinactive').show();}, 1000);
  tblpending = $("#memberinactiveTable").DataTable( {
      dom: "Bfrtip",
        //"processing": true,
        //"serverSide": true,
       ajax: {
      url: '../../Vb/commands/members/membersviewinactive.asp'
,
      dataSrc: ""
      //"dataType": "jsonp"
      //"contentType": 'application/json; charset=utf-8',
      //'data': function (data) { return data = JSON.stringify(data); }
      },
    "order": [[ 2, "desc" ]],
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
                "className":      'details-control4',
                "orderable":      false,
                "data":           null,
                "defaultContent": '',
                 "render": function () {
                         return '<i class="fa fa-check" aria-hidden="true"></i>';
                     },
                 width:"15px"
            },

            { data: "Username" },
            { data: "FirstName" },
            { data: "LastName" },
            { data: "Accounttype"},

        ],
    select: 'single',
     });


     $('#memberinactiveTable tbody').on('click', 'td.details-control3', function () {
       var F = $(this).closest('tr').find('td:eq(3)').text();
       $('#firstn').val(F);
       var L = $(this).closest('tr').find('td:eq(4)').text();
       $('#lastn').val(L);
       var U = $(this).closest('tr').find('td:eq(2)').text();
       $('#usern').val(U);
       $('#editModal').modal('toggle');

     });
     $('#memberinactiveTable tbody').on('click', 'td.details-control4', function () {
       var U = $(this).closest('tr').find('td:eq(2)').text();
       $('#usntor').val(U);
       $('#ReactivateModal').modal('toggle');

     });



  });
