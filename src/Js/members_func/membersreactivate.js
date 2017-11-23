$(function(){

	$(document).ready(function(){
	$(".modalYESreactivate").bind({
	 click:function(){
		 var Remm = $("#usntor").val();
		 memREM(Remm);
		 aidentifier = "Member Reactivated";
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
	var s="1";
	var datastring;
	datastring= {usns: yow,
								status:s,
				};

	$.ajax({
		type: "POST",
		url: "../../Vb/commands/members/reactivate.asp"
,
		data: datastring,
		async: false,
		success: function(data){;
			toastr.success("Member Reactivated!", "Success");
			$('#ReactivateModal').modal('toggle');
			 tblmembers.ajax.reload();
},2000);
			},
		error:  function(){
			toastr.warning("Member not Reactivated!", "Failed");}
		})
}

//redirect login
