$(function(){

	$(document).ready(function(){
		$("#btnSEARCH").bind({
		click:function(){
		$('#usern').enable();
		$('#fstn').disable();
		$('#lstn').disable();
		$('#btnEDIT').hide();
		$('#btnREMOVE').hide();
    	if($('#usern').val()=='')
		{
			toastr.warning("Input Username", "Check Fields"); 
			return false;
		}
		else if(($('#fstn').val()!='') || ($('#lstn').val()!=''))
		{
			$('#usern').val("");
			$('#fstn').val("");
			$('#lstn').val("");
			return false;
		}
		else 
		{
			searchMembers();
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
function searchMembers(){
	//Set Ajax Status
	var datastring;
	datastring= {usern: $("#usern").val(),
				};
	
	$.ajax({
		type: "POST",
		url: "../Vb/commands/command_member_search.asp",
		data: datastring,
		async: false,
		success: function(data){
				if (data=='y')
				{
					$('#btnEDIT').hide();
					toastr.warning("Failed to search Username", "Failed");
					$('#fstn').val("");
					$('#lstn').val("");
					$('#usern').val("");

				}
				else
				{
				ASDF(data);
				toastr.success("Members Searched!", "Sucess");
				$('#btnEDIT').show();
				$('#btnREMOVE').show();
				}
			}, 
		error:  function(){
			toastr.warning("Failed to search Username", "Submission Failed");

		}
		})				
}

function ASDF(FUFUFU)
{
var splitdata;
splitdata = FUFUFU.split(",");

$('#fstn').val((splitdata[0]));
$('#lstn').val((splitdata[1]));
}
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

