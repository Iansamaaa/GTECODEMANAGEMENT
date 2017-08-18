$(function(){

	$(document).ready(function(){
		$("#btnREMOVE").bind({
		click:function(){
		if($('#usern').val()=='' || $('#fstn').val()=='' || $('#lstn').val()=='')
		{
			toastr.warning("Some Fields are empty", "Check Fields"); 
			return false;
		}
		else
		{
			memREM();		
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
function memREM(){
	//Set Ajax Status
	var datastring;
	datastring= {usn: $("#usern").val(),
				};
	
	$.ajax({
		type: "POST",
		url: "../Vb/commands/command_member_remove.asp",
		data: datastring,
		async: false,
		success: function(data){;
			toastr.success("Member Removed!", "Sucess");
			$('#fstn').val("");
    		$('#lstn').val("");
    		$('#usern').val("");
    		$('#usern').enable();
			$('#fstn').disable();
			$('#lstn').disable();
			$("#btnCONFIRM").hide();
			$("#btnSEARCH").show();
			$("#btnEDIT").hide();
			$("#btnREMOVE").hide();


			}, 
		error:  function(){
			toastr.warning("Member not removed!", "Failed");}
		})				
}

//redirect login

$.prototype.enable = function () {
    $.each(this, function (index, el) {
        $(el).removeAttr('disabled');
    });
}

$.prototype.disable = function () {
    $.each(this, function (index, el) {
        $(el).attr('disabled', 'disabled');
    });
}