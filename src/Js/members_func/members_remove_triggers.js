var MemRem = $("#usntor").val();
$(function(){

	$(document).ready(function(){
		$(".RemoveMemberButton").bind({
		click:function(){
			var toRemovemem = $(this).closest('tr').find('td:eq(1)').text();
			$('#usntor').val(toRemovemem);
	}
	});

	$("#modalYESremove").bind({
	 click:function(){
		 var Remm = $("#usntor").val();
		 memREM(Remm);
	 }
 });

	}); // End of document ready]
});

/**********
FUNCTIONS
**********/
//check_fields
//validate to server
function memREM(yow){
	//Set Ajax Status
	var datastring;
	datastring= {usns: yow,
				};

	$.ajax({
		type: "POST",
		url: "../../Vb/commands/members/command_member_remove.asp"
,
		data: datastring,
		async: false,
		success: function(data){;
			toastr.success("Member Removed!", "Success");
			$('#RemoveMemberModal').modal('toggle');
			 window.setTimeout(function(){location.reload()},2000);
			},
		error:  function(){
			toastr.warning("Member not removed!", "Failed");}
		})
}

//redirect login
