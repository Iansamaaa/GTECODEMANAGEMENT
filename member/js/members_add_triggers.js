$(function(){

	$(document).ready(function(){
		$("#modalSubmitMem").bind({
		click:function(){
    	var regx = /^[0-9 ]/;
		if($('#usn').val()=='' || $('#pwd').val()=='' || $('#frstn').val()=='' || $('#lstn').val()=='')
		{
			toastr.warning("Fill out Required Fields", "Check Fields");
		}
		else if((!($('#frstn').val()).match(/^[A-Za-z ]+$/)) || (!($('#lstn').val()).match(/^[A-Za-z ]+$/)))
		{
			toastr.warning("No alphanumeric in Firstname or Lastname", "Check Fields");

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
	datastring= {firstn: $("#frstn").val(),
				lastn: $("#lstn").val(),
				usn: $("#usn").val(),
				pwd: $("#pwd").val(),
				};

	$.ajax({
		type: "POST",
		url: "../Vb/session/members_add.asp",
		data: datastring,
		async: false,
		success: function(data){
			SuccessfulAdd(data)
			},
		error:  function(){
			}
		})
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
function ValidationAlpha(){
    var regx = /^[A-Za-z0-9]+$/;
}
