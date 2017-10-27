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
    order: [[ 0, 'desc' ]],
    "aLengthMenu": [[5, 10, 15, 25, 50, 100 , -1], [5, 10, 15, 25, 50, 100, "All"]],
    "iDisplayLength" : 10,
    columns: [
            {data:"ID", "orderable": false},
            { data: "Language", "orderable": false},
            { data: "AddedBy", "orderable": false},
        ], 
  "columnDefs": [ {
        className: "hide_column",
        width: "10%",
        targets: 0,
      render: function ( data, type, row ) {
        return type === 'display' && data.length > 35 ?
          data.substr( 0, 35 ) +'…' :
          data;
      }
       } ],
    select: 'single',
    ordering: 'true',
     });
  });



 
