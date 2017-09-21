$(function(){
	$(document).ready(function(){
		$(".modalSubmit").bind({
		click:function(){
			identity=$("#usern").val();
			var regx = /^[0-9 ]/;
		 if((!($("#firstn").val()).match(/^[A-Za-z ]+$/)) || (!($("#lastn").val()).match(/^[A-Za-z ]{3,25}$/)))
		{
			toastr.warning("No alphanumeric in Firstname or Lastname", "Check Fields");
		}
		else
		{
			aidentifier = "Member Edited";
			EditMember();
			MembersLOGS();

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
		url: "../../Vb/commands/members/command_member_edit.asp"
,
		data: datastring,
		async: false,
		success: function(data){;

			toastr.success("Member Edited!", "Sucess");
			setTimeout(function () {
			 window.location.reload(true)
			}, 1500);
			},
		error:  function(){
			toastr.warning("Error", "It's Error!");}
		})
}
