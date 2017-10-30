// JavaScript Document
$(function(){

	$(document).ready(function(){
		$("#btnAdd").bind({
			click:function(){
			 if($('#ctype').val()=='' || $('#fname').val()=='' || $('#codedesc').val()=='' || $('#version').val()==''|| $('#added').val()=='' || $('#codedescc').val()=='')
			{
				toastr.warning("Fill out Required Fields", "Check Fields");
				return false;
			}
			else if(!($('#version').val()).match(/^[0-9.]{1,10}$/))
			{
			toastr.warning("Type in version Number", "Check Fields");
			return false;
			}
			else if(!($('#fname').val()).match(/^[a-zA-Z!@#$&()-`.+,/\ "]{2,25}$/))
			{
			toastr.warning("Type valid Function Name", "Check Fields");
			return false;
			}
			else
			{
				$('#rnModal').modal('toggle');
				$('#addModal1').modal('toggle');
			}
			}

		});
		//Keypress Enter
		// ADDING RELEASENOTES ON CODE ADDING
			$("#gg").bind({
			click:function(){
			 if($('#ctype').val()=='' || $('#fname').val()=='' || $('#codedesc').val()=='' || $('#version').val()==''|| $('#added').val()=='' || $('#rnc').val()=='')
			{
				toastr.warning("Fill out Required Fields", "Check Fields");
				return false;
			}
			else if(!($('#version').val()).match(/^[0-9.]{1,10}$/))
			{
			toastr.warning("Type in version Number", "Check Fields");
			return false;
			}
			else if(!($('#fname').val()).match(/^[a-zA-Z!@#$&()-`.+,/\ "]{2,25}$/))
			{
			toastr.warning("Type valid Function Name", "Check Fields");
			return false;
			}
			else if($('#rnc').val()=='')
			{
			toastr.warning("Type valid Release Notes", "Check Fields");
			return false;
			}
			else
			{
				code_adding();
			}
			}

		});

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
	datastring= {rnotes: ($("#rnc").val()),
				ctypes: $("#ctype").val(),
				fnames: $("#fname").val(),
				descs: btoa($("#codedesc").val()),
				descsc: btoa($("#codedescc").val()),
				addedby:  $('#added').val(),
				};
		$.ajax({
		type: "POST",
		url: "../Vb/commands/codes/code_func.asp",
		data: datastring,
		async: false,
		success: function(data){code_status(data)
			$('#rnModal').modal('hide');
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
