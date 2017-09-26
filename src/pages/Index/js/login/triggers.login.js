$(function(){
	NProgress.start();
	$(document).ready(function(){



		$("#userinput").on('keypress', function (event) {
    var regex = new RegExp("^[a-zA-Z0-9]+$");
    var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
    if (!regex.test(key)) {
       event.preventDefault();
       return false;
    }
				});

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
			toastr.warning("Account not found");}
	})

}

//redirect login
function redirect_login(loginstat){

	switch (loginstat){
		case 'x':NProgress.start();
   				 setTimeout(function() { NProgress.done(); toastr.warning("Username or Password is Incorrect", "Check Fields"); }, 500);
				 break;
		case 'y':NProgress.start();
   				 setTimeout(function() { NProgress.done(); window.location="../homepage.asp"; }, 4000);
				 break;
		case 'z':NProgress.start();
   				 setTimeout(function() { NProgress.done(); window.location="../homepage.user.asp"; }, 4000);
				 break;
		case 'k':NProgress.start();
   				 setTimeout(function() { NProgress.done(); toastr.warning("Your account is Deactivated Please ask your administrator about this issue", "Account validation"); }, 500);
				 break;
}
}
