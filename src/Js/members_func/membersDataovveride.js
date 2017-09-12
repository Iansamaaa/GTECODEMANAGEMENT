
$(document).ready(function(){

  tblpending = $("#memberTable").DataTable( {
      dom: "Bfrtip",
        //"processing": true,
        //"serverSide": true,
       ajax: {
      url: '../../Vb/commands/members/members.view.asp'
,
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

            { data: "Username" },
            { data: "FirstName" },
            { data: "LastName" },
            { data: "Accounttype"},

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


     $('#memberTable tbody').on('click', 'td.details-control3', function () {
       var F = $(this).closest('tr').find('td:eq(3)').text();
       $('#firstn').val(F);
       var L = $(this).closest('tr').find('td:eq(4)').text();
       $('#lastn').val(L);
       var U = $(this).closest('tr').find('td:eq(2)').text();
       $('#usern').val(U);
       $('#editModal').modal('toggle');

     });
     $('#memberTable tbody').on('click', 'td.details-control2', function () {
       var U = $(this).closest('tr').find('td:eq(2)').text();
       $('#usntor').val(U);
       $('#RemoveMemberModal').modal('toggle');

     });



  });


  function ViewEdit(){
  	//Set Ajax Status
  	var datastring;
  	datastring= {
  		Id :$("#ID").val(),
  		firstns: $("#firstn").val(),
  				lastns: $("#lastn").val(),
  				usns: $("#usern").val(),
  				};

  	$.ajax({
  		type: "POST",
  		url: "../../Vb/commands/members/members.view.asp"
  ,
  		data: datastring,
  		async: false,
  		success: function(data){;

  			toastr.success("Member Edited!", "Sucess");
  			},
  		error:  function(){
  			toastr.warning("Error", "It's Error!");}
  		})
  }
