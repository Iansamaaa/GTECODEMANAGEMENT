$(function(){
	NProgress.start();
	$(document).ready(function(){
	
   	setTimeout(function() { NProgress.done(); }, 1000);
  
	
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
		url: "../../../Vb/session/login.asp",
		data: datastring,
		async: false,
		success: function(data){redirect_login(data);
			}, 
		error:  function(){
			toastr.warning("error");}
	})
						
}

//redirect login
function redirect_login(loginstat){
	
	switch (loginstat){
		
<<<<<<< HEAD
		case 'x': toastr.warning("Username or Password is Incorrect", "Check Fields").css("height","100px").css("font-size","12pt").css("padding-top","30px");
				break;
		case 'y': window.location="../homepage.asp";
				break;
		case 'z': window.location="../userpages/homepage.user.asp"
				break;
		default:  alert("HAYS");
		
=======
		case 'x':NProgress.start();
   				 setTimeout(function() { NProgress.done(); toastr.warning("Username or Password is Incorrect", "Check Fields").css("height","100px").css("font-size","12pt").css("padding-top","30px"); }, 500);
				 break;
		case 'y':NProgress.start();
   				 setTimeout(function() { NProgress.done(); window.location="../homepage.asp"; }, 4000);
				 break;
		case 'z':NProgress.start();
   				 setTimeout(function() { NProgress.done(); window.location="../homepage.user.asp"; }, 4000);
				 break;
>>>>>>> b3c73e478dd9de912e4ec695d04cec0317952df4
	}	
}