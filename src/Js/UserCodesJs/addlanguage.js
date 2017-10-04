// JavaScript Document
$(function(){

	$(document).ready(function(){
		$("#addLANG").bind({
			click:function(){
			 if($('#langlang').val()=='')
			{
				toastr.warning("Fill out Required Fields", "Check Fields");
				return false;
			}
			else if(!($('#langlang').val()).match(/^[a-zA-Z!@#$&()-`.+,/\"]{3,10}$/))
			{
			toastr.warning("Type valid Code type", "Check Fields");
			return false;
			}
			else
			{
				lang_adding();
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
function lang_adding(){
	//Set Ajax Status
	var datastring;
	datastring= {
					lang: $("#langlang").val(),
				};
		$.ajax({
		type: "POST",
		url: "../Vb/commands/codes/addlang.asp",
		data: datastring,
		async: false,
		success: function(data){
			$('#addModal1').modal('toggle');
			code_status(data)
			 

		},
		error:  function(){
			toastr.warning("Submission Failed");}
	})
}
//redirect login
function code_status(codestat){

	switch (codestat){

		case 'x': toastr.success("Add Success");
				 window.setTimeout(function(){location.reload()},2000);
				break;
		case 'y': toastr.warning("Language already exists")
				break;
		default: toastr.warning("Language not Added");
	}
}
