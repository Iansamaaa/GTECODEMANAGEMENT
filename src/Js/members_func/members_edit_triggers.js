$(function(){

	$(document).ready(function(){
		var i=true;
		$("#btnEDIT").bind({
		click:function(){
		if($('#usern').val()=='' || $('#fstn').val()=='' || $('#lstn').val()=='')
		{
			$('#fstn').disable();
    		$('#lstn').disable();
    		$('#usern').enable();
			toastr.warning("Some Fields are empty", "Check Fields"); 
			return false;
		}
		else if(!$('#lstn').enable() && !$('#fstn').enable())
		{
			$('#fstn').enable();
    		$('#lstn').enable();
    		$('#usern').disable();
			toastr.success("Member can be Edited", "Edit"); 
			$("#btnCONFIRM").show();
			$("#btnSEARCH").hide();
			return false;
		}
		}
	});
	$("#btnCONFIRM").bind({
		click:function(){
		if((!($('#fstn').val()).match(/^[A-Za-z ]+$/)) || (!($('#lstn').val()).match(/^[A-Za-z ]+$/)))
		{
			toastr.warning("No alphanumeric in Firstname or Lastname", "Check Fields"); 
			return false;
		}
		else
		{
			EditMember();

		}
		}
	});
	$(".editclass").bind({
		click:function(){
			var LastName = $(this).closest('tr').find('td:eq(1)').text();
			$('#FirstName').val(LastName);
			alert(LastName);


		}

	});
	$('#searrch').bind({
		click:function(){
			var searchALL = $('#searchALL').val();


			//"src",'../../pages/homepage.asp?searchALL='+searchALL+'';
			//document.location.href('homepage.asp?searchALL='+searchALL+'')
			alert("1");
		}
	});		
	}); // End of document ready]
});


/**********
FUNCTIONS
**********/

//check_fields
//validate to server
function EditMember(){
	//Set Ajax Status
	var datastring;
	datastring= {firstn: $("#fstn").val(), 
				lastn: $("#lstn").val(),
				usn: $("#usern").val(),
				};
	
	$.ajax({
		type: "POST",
		url: "../Vb/commands/command_member_edit.asp",
		data: datastring,
		async: false,
		success: function(data){;
			toastr.success("Member Edited!", "Sucess");
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
			toastr.success("Edit", "Editsssss Now!");}
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