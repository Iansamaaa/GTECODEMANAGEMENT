$(function(){
	$(document).ready(function(){
		$(".confirmchangepass").bind({
		click:function(){
    	var regx = /^[0-9 ]/;
		if($('.currentpass').val()==''  || $('#newPass').val()=='' || $('#confirmPass').val()=='')
		{
			toastr.warning("Fill out Required Fields", "Check Fields");
		}
		else
		{
				changepass();
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
function changepass(){
	//Set Ajax Status
	var datastring;
	datastring= {current: $(".currentPass").val(),
				new: $("#newPass").val(),
				confirm: $("#confirmPass").val(),
				};
		$.ajax({
		type: "POST",
		url: "../Vb/commands/members/user.settings.asp",
		data: datastring,
		async: false,
		success: function(data){change_status(data)
			setTimeout(function () {
			 window.location.reload(true)
		 }, 1500);
		},
		error:  function(){
			toastr.warning("Submission Failed");}

	})
}
//redirect login
function change_status(changep){

	switch (changep){

		case 'x': toastr.success("Change Success");
				break;
		case 'y': toastr.warning("Password not updated: Check Current Password")
				break;
		default: toastr.warning("ChangePass Unsuccessful");
	}
}
