var stat="Pending";
$(function(){
	$(document).ready(function(){
		$(".modalSubmitMem").bind({
		click:function(){
			RadioUserType();
    	var regx = /^[0-9 ]/;
		if($('#usn').val()=='' || $('#email').val()=='' || $('#pwd').val()=='' || $('#frstn').val()=='' || $('#lstn').val()=='' || !($('#usn').val()).match(/^[A-Za-z0-9]{3,25}$/))
		{
			toastr.warning("Fill out Required Fields", "Check Fields");
		}
		else if(!($('#frstn').val()).match(/^[A-Za-z ]{3,13}$/) || !($('#lstn').val()).match(/^[A-Za-z ]{3,13}$/))
		{
			toastr.warning("No alphanumeric in Firstname or Lastname", "Check Fields");
		}
		else if(!($('#email').val()).match(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/))
		{
			toastr.warning("Invalid Email");
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
				$('#AddMemberModal').modal('hide');


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
	a="Members Add"
	var f = $("#frstn").val();
	var u = $("#usn").val();
	var e = $("#email").val();
	var s= "1";

	var datastring;

	datastring= {firstn: $("#frstn").val(),
				firstnamexml:"<firstname>"+f+"</firstname>"+"<email>"+e+"</email>"+"<username>"+u+"</username>"+"<password>"+passgen+"</password>",
				lastn: $("#lstn").val(),
				email:$("#email").val(),
				usn: $("#usn").val(),
				status:s,
				status1:stat,
				act:a,
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
		case "y": (toastr.warning("Username or Email has been taken", "Submission Failed"))
								;
				break;
		case "x": (toastr.success("Member added!", "Success"));
		tblmembers.ajax.reload();
				break;
		default:  toastr.warning("Username/Password/SPIN did not match. (Please check CAPS LOCK)", "Authentication Failed");

	}
}
