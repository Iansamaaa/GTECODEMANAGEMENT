$(function(){

	$(document).ready(function(){
		NProgress.start();
		for(var i=0;i<2;i++){
				document.getElementById("sett").click();
		}

		setTimeout(function() { NProgress.done(); $('.contentColor').show();}, 1000);
		$(".confirmingDeactivate").bind({
		click:function(){
    	var regx = /^[0-9 ]/;
		if($('#currentPass').val()=='')
		{
			toastr.warning("Fill out Required Fields", "Check Fields");

		}
		else
		{
				 deactacct();
		}
		}






	});
	$(".currentpass").bind({
				keypress: function(e){
					if (e.which == 13){
						$('#deactivateModal').modal('toggle');
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
function deactacct(){
	//Set Ajax Status
	var datastring;
	datastring= {
				current: $("#currentPass").val(),
				};
		$.ajax({
		type: "POST",
		url: "../Vb/commands/members/deactmember.asp",
		data: datastring,
		async: false,
		success: function(data){deact_status(data)
		},
		error:  function(){
			toastr.warning("Submission Failed");}

	})
}
//redirect login
function deact_status(changep){

	switch (changep){

		case 'x':
				$('#deactivateModal').modal('toggle'); 
				toastr.success("Deactivation Success","Thank you");
				 NProgress.start();
   				 setTimeout(function() { NProgress.done(); window.location="Index/index.asp"; }, 2000);
				break;
		case 'y':NProgress.start();
				setTimeout(function() { NProgress.done();toastr.warning("Deactivation Failed, Check Current Password"); }, 1000);
				break;
		default: toastr.warning("Deactivation Unsuccessful");
	}
}
