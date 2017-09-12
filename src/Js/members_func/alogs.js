

$(function(){
	$(document).ready(function(){
		$(".modalSubmitMem").bind({
		click:function(){
       aidentifier = "Member Added";
      AddMembersLOGS();
		}
	});
	}); // End of document ready]
});


function AddMembersLOGS(){
	//Set Ajax Status
	var datastring;

	 datastring= {actionM: aidentifier,

				};

        $.ajax({
          type: "POST",
          url: "../../Vb/commands/members/logs.asp",
          data: datastring,
          async: false,
          })
}
