$(document).ready(function(){

  $(".details-control").bind({
    click:function(){
    	alert("kafoy");
      var HAHA = $(this).closest('tr').find('td:eq(2)').text();
      $('#codeTA').text(atob(HAHA));
	  $('#viewModal').modal('toggle');
    }
  });

 }); // End of document ready]
