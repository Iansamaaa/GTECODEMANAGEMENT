$(function(){

	$(document).ready(function(){
		$("#modalSubmit").bind({
		click:function(){
			var regx = /^[0-9 ]/;
		 if((!($("#firstn").val()).match(/^[A-Za-z ]+$/)) || (!($("#lastn").val()).match(/^[A-Za-z ]+$/)))
		{
			toastr.warning("No alphanumeric in Firstname or Lastname", "Check Fields");
		}
		else
		{
			EditMember();
			 setTimeout(function () {
			 	window.location.reload(true)
			 }, 1500);
		}
		}
	});
});
});


function EditMember(){
	//Set Ajax Status
	var datastring;
	datastring= {
		Id :$("#ID").val(),
		firstns: $("#firstn").val(),
				lastns: $("#lastn").val(),
				usns: $("#usern").val(),
				};

	$.ajax({
		type: "POST",
		url: "../Vb/commands/command_member_edit.asp",
		data: datastring,
		async: false,
		success: function(data){;

			toastr.success("Member Edited!", "Sucess");
			},
		error:  function(){
			toastr.success("Edit", "Editsssss Now!");}
		})
}
