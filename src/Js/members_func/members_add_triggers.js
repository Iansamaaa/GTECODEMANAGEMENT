var radio="ADMIN";
var i=0;
$(function(){
	$(document).ready(function(){
		$("#modalSubmitMem").bind({
		click:function(){
			RadioUserType();
    	var regx = /^[0-9 ]/;
		if($('#usn').val()==''  || $('#pwd').val()=='' || $('#frstn').val()=='' || $('#lstn').val()=='')
		{
			toastr.warning("Fill out Required Fields", "Check Fields");
		}
		else if((!($('#frstn').val()).match(/^[A-Za-z ]+$/)) || (!($('#lstn').val()).match(/^[A-Za-z ]+$/)))
		{
			toastr.warning("No alphanumeric in Firstname or Lastname", "Check Fields");

		}
		else if($('#usn').val().indexOf(' ')>=0)
		{
				toastr.warning("Invalid: Username has space")

		}
		else
		{
			
				AddMembers();
			

		}
		}
	});
	}); // End of document ready]
});


/**********
FUNCTIONS
**********/


//check_fields
//validate to server
function AddMembers(){
	//Set Ajax Status
	

	var datastring;
	for (i=0;i<1;i++){
	datastring= {firstn: $("#frstn").val(),
				lastn: $("#lstn").val(),
				usn: $("#usn").val(),
				pwds: $("#pwd").val(),
				atype: radio,
				};

	$.ajax({
		type: "POST",
		url: "../../Vb/commands/members/members_add.asp",
		data: datastring,
		async: false,
		success: function(data){
			SuccessfulAdd(data)
			$('#AddMemberModal').modal('toggle');
			window.setTimeout(function(){location.reload()},2000);
			},
		error:  function(){
			}
		})
}
}







function RadioUserType(){

	if($('#atype').is(':checked'))
	{
		radio="ADMIN"
	}
	else
	{
		radio="USER"
	}
}






//redirect login
function SuccessfulAdd(loginstats){

	switch (loginstats){
		case "y": (toastr.warning("Username has been taken", "Submission Failed"))
								;
				break;
		case "x": (toastr.success("Member added!", "Success"));
				break;
		default:  toastr.warning("Username/Password/SPIN did not match. (Please check CAPS LOCK)", "Authentication Failed");

	}
}
