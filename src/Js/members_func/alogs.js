var aidentifier;
var identity=$("#usn").val();
$(function(){

	$(document).ready(function(){
		$(".modalSubmitMem").bind({
		click:function(){
       aidentifier = "Added Member ";
      MembersLOGS();
		}
	});
	}); // End of document ready]
});

function MembersLOGS(){
	//Set Ajax Status
	var datastring;
	 datastring= {target: identity,
		 						actionM: aidentifier,
				};
        $.ajax({
          type: "POST",
          url: "../../Vb/commands/members/logs.asp",
          data: datastring,
          async: false,
          })
}
