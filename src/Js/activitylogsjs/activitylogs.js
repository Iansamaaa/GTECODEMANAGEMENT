var editor;
var tblcodes,tblgg;
var modal;

$(document).ready(function(){
NProgress.start();
setTimeout(function() { NProgress.done(); $('#tablecardact').show();}, 1000);

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
    order: [[ 0, 'desc' ]],
    "aLengthMenu": [[5, 10, 15, 25, 50, 100 , -1], [5, 10, 15, 25, 50, 100, "All"]],
    "iDisplayLength" : 10,
    columns: [
            {data:"ACTnum", "orderable": false},
            { data: "ACTuser", "orderable": false},
            { 
              data: "ACTdate",
              render: function(data, type, row){
            //You need to have moment.js to parse the date into a local date
              return moment(data).format('MMMM Do YYYY, h:mm a');
              },
              "type": "moment-js-date"
            },
            { data: "ACTdescription", "orderable": false},
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



 
