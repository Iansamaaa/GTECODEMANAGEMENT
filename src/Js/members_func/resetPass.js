  var a = "Reset Password"

$(function(){
	$(document).ready(function(){
		$("#confirmReset").bind({
		click:function(){
      resetPassword();
      $('#resetMod').modal('hide');
		}
	});
	}); // End of document ready]
});

function resetPassword(){
	//Set Ajax Status

	var f = $(".firstR").val();
	var u = $(".userR").val();
	var e = $(".emailR").val();
	var s= "1";
	var datastring;

	datastring= {
        userR: u,
        firstR: f,
				firstnamexml:"<firstname>"+f+"</firstname>"+"<email>"+e+"</email>"+"<username>"+u+"</username>"+"<password>"+passgen+"</password>",
				status:s,
        status1:stat,
        emels:e,
        act:a,
				passnew: passgen,
				};

	$.ajax({
		type: "POST",
		url: "../../Vb/commands/members/resetPass.asp",
		data: datastring,
		async: false,
		success: function(data){
			SuccessfulChange(data)
			window.setTimeout(function(){location.reload()},1500);
			},
		error:  function(){
			}
		})

    function SuccessfulChange(changePass){

    	switch (changePass){
    		case "y": (toastr.warning("Change Error", "Submission Failed"))
    								;
    				break;
    		case "x": (toastr.success("Successfully Change!", "Success"));
    				break;


    	}
    }


}
