

$(function(){
	$(document).ready(function(){
		$(".modalSubmitMem").bind({
		click:function(){
       aidentifier = "Member Added";
       alert("aidentifier");
      AddMembersLOGS();
		}
	});
	}); // End of document ready]
});


function AddMembersLOGS(){
	//Set Ajax Status
	var datastring;
alert(datastring);
	 datastring= {actionM: aidentifier,

				};

        $.ajax({
          type: "POST",
          alert(datastring);
          url: "../../Vb/commands/members/logs.asp",
          data: datastring,
          async: false,
          })
}
