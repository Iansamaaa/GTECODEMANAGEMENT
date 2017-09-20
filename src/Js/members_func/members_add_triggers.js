$(function(){
	$(document).ready(function(){
		$(".modalSubmitMem").bind({
		click:function(){
			RadioUserType();
    	var regx = /^[0-9 ]/;
		if($('#usn').val()==''  || $('#pwd').val()=='' || $('#frstn').val()=='' || $('#lstn').val()=='' || !($('#usn').val()).match(/^[A-Za-z0-9]{3,25}$/))
		{
			toastr.warning("Fill out Required Fields", "Check Fields");
		}
		else if(!($('#frstn').val()).match(/^[A-Za-z ]{3,13}$/) || !($('#lstn').val()).match(/^[A-Za-z ]{3,13}$/))
		{
			toastr.warning("No alphanumeric in Firstname or Lastname", "Check Fields");
		}
		else if($('#usn').val().indexOf(' ')>=0)
		{
				toastr.warning("Invalid: Username has space");

		}
		else if(!($('#usn').val()).match(/^[a-zA-Z0-9]{1,10}$/))
		{
				toastr.warning("Username format invalid");
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

	var f = $("#frstn").val();
	var u = $("#usn").val()
	var datastring;

	datastring= {firstn: $("#frstn").val(),
				firstnamexml:"<firstname>"+f+"</firstname>"+"<username>"+u+"</username>"+"<password>"+passgen+"</password>",
				lastn: $("#lstn").val(),
				usn: $("#usn").val(),
				pwds: passgen,
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
