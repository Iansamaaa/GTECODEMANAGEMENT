$(function(){

  $(document).ready(function(){
  
  $(".btnRECORD").bind({
    click:function(){
      var KAFOY = $(this).closest('tr').find('td:eq(1)').text();
      $('#IDrecord').val(KAFOY);
    }
  });
  
   $("#btnREMOVE").bind({
    click:function(){
      var Rem = $("#IDrecord").val();
      RemoveMember(Rem);
    }
  });

  }); // End of document ready]
});


/**********
FUNCTIONS
**********/

//check_fields
//validate to server
function RemoveMember(labad){
  //Set Ajax Status
  var datastring;
  datastring= {IDREC: labad, 
        };
  
  $.ajax({
    type: "POST",
    url: "../Vb/commands/codes/command_codes_remove.asp",
    data: datastring,
    async: false,
    success: function(data){;

      toastr.success("Code Deleted", "Sucess");
      $('#removeModal').modal('toggle');
      window.setTimeout(function(){location.reload()},2000);

      }, 
    error:  function(){
      toastr.success("Delete Failed", "Failed");}
    })        

}


