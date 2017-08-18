$(function(){

	$(document).ready(function(){
	
		$("#subINDEX").bind({
		
			click:function(){
			 validate_login();
			}
		
		});
		
		//Keypress Enter
		$("#username, #password").bind({
			keypress: function(e){
				if (e.which == 13){
					validate_login()
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
function validate_login(){
	
	//Set Ajax Status
	var datastring;
	datastring= {user: $("#username").val(), 
				pass: $("#password").val(), 
				e: Number(new Date())};
	
	$.ajax({
		type: "POST",
		url: "../Vb/session/login.asp",
		data: datastring,
		async: false,
		success: function(data){redirect_login(data);
			}, 
		error:  function(){
			alert("error");}
	})
						
}

//redirect login
function redirect_login(loginstat){
	
	switch (loginstat){
		
		case 'x': toastr.warning("Username/Password/SPIN did not match. (Please check CAPS LOCK)", "Authentication Failed");
				break;
		case 'y': window.location="homepage.asp";
				break;
		default:  toastr.warning("Username/Password/SPIN did not match. (Please check CAPS LOCK)", "Authentication Failed");
		
	}	
}