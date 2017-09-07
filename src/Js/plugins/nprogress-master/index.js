var editor;
var tblpending,tblchecked; 
var modal;
  
$(document).ready(function(){ 
 

  // getPendingRequest();  
  var d = new Date();
  var strDate = d.getFullYear() + "/" + (d.getMonth()+1) + "/" + d.getDate();
  $("#reqamount").iouFilter({type:'money',maxlength:'10'}); 
  $("#purpose").iouFilter({type:'alphanum',maxlength:'100'}); 
   
  
  tblpending = $("#pendingdatatables").DataTable( {
      dom: "Bfrtip",
       "processing": true,
        "serverSide": true, 
         
       ajax: {
      "type": "POST",
      url: '../inc/vb/iou/requestpending.asp',
      dataSrc: ""
      //"dataType": "jsonp"
      //"contentType": 'application/json; charset=utf-8',
      //'data': function (data) { return data = JSON.stringify(data); }
      },
    order: [[ 2, 'asc' ]],
    "aLengthMenu": [[5, 10, 15, 25, 50, 100 , -1], [5, 10, 15, 25, 50, 100, "All"]],
    "iDisplayLength" : 5,
    columns: [ 
            { data: "ID",
        "visible": false},
      { data: "RequestNumber" },
            { data: "RequestDateTime" },
            { data: "Purpose" },
            { data: "RequestedAmount",
        className: "dt-right", "targets": [3,5],
        render: $.fn.dataTable.render.number( ',', '.', 2, '' )},
      { data: "UserID" },
            { data: "DateRequiredFrom" },
            { data: "DateRequiredTo"  }
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
        buttons: [   
       { extend: "print",   exportOptions: {
                        columns: "thead th:not(.noExport)"
                    } },
       { extend: "excel",   exportOptions: {
                        columns: "thead th:not(.noExport)"
                    } },
       {
        text: 'Reload',
        action: function ( e, dt, node, config ) {
          // Will reset all input text values to nothing.
          $("input:text").val('');
          // Will trigger a "change" event in order for datatables to refresh the filtering. 
          //This is because DataTables uses the change event to perform filtering.
          $("input:text").trigger("change");
          $("#pendingdatatables").DataTable().search("").draw()          
        }
      },
       { extend: "selectedSingle",
         text: "Check Request",
                 action: function ( e, dt, node, config ) {   
            
            var d = tblpending.row({selected: true}).data()
            window.parent.openRequestMdl(d.RequestNumber);
            window.parent.viewReqIOUimg(d.RequestNumber,"FR");
            window.parent.$("#cancelrqst").css("display","none"); 
            window.parent.$("#declinerqst,#approverqst").css("display","block");  
             
                } } ,
      
    
        ], 
    
  });
    
    
  tblchecked = $("#checkeddatatables").DataTable( {
      dom: "Bfrtip",       
       ajax: { 
      url: '../inc/vb/iou/checkedrequests.asp',
      dataSrc: "" 
      },
    order: [[ 1, 'asc' ]],    
    "aLengthMenu": [[5, 10, 15, 25, 50, 100 , -1], [5, 10, 15, 25, 50, 100, "All"]],
    "iDisplayLength" : 5,
    columns: [  
      { data: "ID",
        "visible": false},
      { data: "RequestNumber" },
            { data: "RequestDateTime" },
            { data: "Purpose" },
            { data: "RequestedAmount",
        className: "dt-right", "targets": [3,5],
        render: $.fn.dataTable.render.number( ',', '.', 2, '' )},
      { data: "UserID" },
            { data: "DateRequiredFrom" },
            { data: "DateRequiredTo"  },
            { data: "CheckedBy"  },
        ],  
    "columnDefs": [ {
      width: "20%",
      targets: 3,
      render: function ( data, type, row ) {
        return type === 'display' && data.length > 35 ?
          data.substr( 0, 35 ) +'…' :
          data;
      },
            
       } ],
     
    select: true,
        buttons: [  
          { extend: "print",   exportOptions: {
                        columns: "thead th:not(.noExport)"
                    } },
      { extend: "excel",   exportOptions: {
                        columns: "thead th:not(.noExport)"
                    } },   
      {
        text: 'Reload',
        action: function ( e, dt, node, config ) {
          // Will reset all input text values to nothing.
          $("input:text").val('');
          // Will trigger a "change" event in order for datatables to refresh the filtering. 
          //This is because DataTables uses the change event to perform filtering.
          $("input:text").trigger("change");
          $("#checkeddatatables").DataTable().search("").draw()          
        }
      },
      
    
    { extend: "selectedSingle",
       text: "View",
       action: function ( e, dt, node, config ) {   
          //  OpenModal();
          var d = tblchecked.row({selected: true}).data()
          window.parent.openRequestMdl(d.RequestNumber);
          window.parent.viewReqIOUimg(d.RequestNumber,"FR");    
          window.parent.$("#cancelrqst").css("display","block");  
          window.parent.$("#declinerqst,#approverqst").css("display","none");  
           
      } } , 
        ], 
      
  });
    
    
}); // end page reload

/**********************************
      FUNCTION
**********************************/


function verifiedRequest(){
  openLoader();

  var values = {
    
    cmd:"approvedreq",
    
    requestno:window.parent.$("#ioureqnum").html(),
    companyid:window.parent.$("#ioucompid").html(),
    branchid:window.parent.$("#ioubranchid").html(),
    daterequested:window.parent.$("#ioudaterequested").html(),
    reqamount:window.parent.$("#ioureqamt").html(),
    datereqfrom:window.parent.$("#ioudatereqfr").html(),
    datereqto:window.parent.$("#ioudatereqto").html(),
    purpose:window.parent.$("#ioupurpose").html(),
    requestedby:window.parent.$("#ioureqby").html(),
    lqduedate:window.parent.$("#lqduedate").val()
  }

  $.ajax({
    type:"POST",
    url: "../inc/vb/requests/request.module.asp",
    data: values,
    success: function(data){EvaluateResult(data)},
    error:function(){}
    
  })
}

function declinedIOU(){
  openLoader();
  
  var values = {
    
    cmd:"declinedreq",
    
    requestno:window.parent.$("#dciounum").val(),
    reason:window.parent.$("#dcioureason").val()
  }

  $.ajax({
    type:"POST",
    url: "../inc/vb/requests/request.module.asp",
    data: values,
    success: function(data){EvaluateResult(data)},
    error:function(){}
    
  })
}

function EvaluateResult(data){
  switch (data){
    
    case "0": window.parent.$().toastmessage('showSuccessToast', "Request successfully approved.");
          hideModal();     
          window.location.reload(true);
          break;
          
    case "1": window.parent.$().toastmessage('showSuccessToast', "Request successfully declined.");
          hideModal();     
          window.parent.$("#dcioureason,#dciounum").val("");
          window.location.reload(true);
          break;
  
    default: window.parent.$().toastmessage('showWarningToast', "Server Error.Please contact Admin.");
        break;
  }
}

