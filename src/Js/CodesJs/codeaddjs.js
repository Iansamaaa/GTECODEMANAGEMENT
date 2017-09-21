// JavaScript Document
$(function(){

	$(document).ready(function(){
		$("#btnAdd").bind({
			click:function(){
			 if($('#ctype').val()=='' || $('#fname').val()=='' || $('#codedesc').val()=='' || $('#version').val()==''|| $('#added').val()=='')
			{
				toastr.warning("Fill out Required Fields", "Check Fields");
				return false;
			}
			else if(!($('#version').val()).match(/^[0-9.]{1,6}$/))
			{
			toastr.warning("Type in version Number", "Check Fields");
			return false;
			}
			else if(!($('#ctype').val()).match(/^[a-zA-Z. ]{1,10}$/))
			{
			toastr.warning("Type valid Code type", "Check Fields");
			return false;
			}
			else if(!($('#fname').val()).match(/^[a-zA-Z!@#$&()-`.+,/\"]{3,20}$/))
			{
			toastr.warning("Type valid Function Name", "Check Fields");
			return false;
			}
			else
			{
				code_adding();
			}
			}

		});
		//Keypress Enter

	}); // End of document ready

}); // End of jQuery function

/**********
FUNCTIONS
**********/
//check_fields
//validate to server
function code_adding(){
	//Set Ajax Status
	var datastring;
	datastring= {ctypes: $("#ctype").val(),
				fnames: $("#fname").val(),
				descs: btoa($("#codedesc").val()),
				versions: $('#version').val(),
				addedby:  $('#added').val(),
				};
		$.ajax({
		type: "POST",
		url: "../Vb/commands/codes/code_func.asp",
		data: datastring,
		async: false,
		success: function(data){code_status(data)
			$('#addModal1').modal('toggle');
			 window.setTimeout(function(){location.reload()},2000);

		},
		error:  function(){
			toastr.warning("Submission Failed");}
	})
}
//redirect login
function code_status(codestat){

	switch (codestat){

		case 'x': toastr.success("Add Success");

				break;
		case 'y': toastr.warning("Function Name Already Exists")
				break;
		default: toastr.warning("Code not Added");
	}
}
