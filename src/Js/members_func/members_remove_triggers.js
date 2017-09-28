$(function(){

	$(document).ready(function(){
	$(".modalYESremove").bind({
	 click:function(){
		 var Remm = $("#usntor").val();
		 memREM(Remm);
		 aidentifier = "Member Removed";
		 
	 }
 });

	}); // End of document ready]
});
/**********
FUNCTIONS
**********/
//check_fields
//validate to server
function memREM(yow){
	//Set Ajax Status
	var s="0";
	var datastring;
	datastring= {usns: yow,
								status:s,
				};

	$.ajax({
		type: "POST",
		url: "../../Vb/commands/members/command_member_remove.asp"
,
		data: datastring,
		async: false,
		success: function(data){;
			deact_state(data);
			$('#RemoveMemberModal').modal('hide');
			 window.setTimeout(function(){window.location="../../pages/loginpage.asp"
},2000);
			},
		error:  function(){
			toastr.warning("Member not removed!", "Failed");}
		})
}

//redirect login
  function deact_state(state){

    	switch (state){
    		case "y": toastr.warning("Deactivate Error", "Failed");
    				break;
    		case "z": toastr.success("Deactivate Sucess", "Success");
    				break;
    		case "x":toastr.success("You Deactivated your account", "Goodbye");
    				 NProgress.start();
   				 	 setTimeout(function() {NProgress.done();  window.location="Index/index.asp"; }, 2000);
    				break;


    	}
 }