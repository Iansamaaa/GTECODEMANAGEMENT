$(function(){

  $(document).ready(function(){
  
  $(".btnEN").bind({
    click:function(){
      var HAHA = $(this).closest('tr').find('td:eq(1)').text();
      $('#viewC').val(HAHA);
      Modalview(HAHA);
    }
  });

  }); // End of document ready]
});


/**********
FUNCTIONS
**********/

//check_fields
//validate to server
function Modalview(labad){
  //Set Ajax Status
  var datastring;
  datastring= {VIEWM: labad, 
        };
  
  $.ajax({
    type: "POST",
    url: "../Vb/commands/codes/command_codes_viewm.asp",
    data: datastring,
    async: false,
    success: function(data){
      $('#codeTA').text(atob(data));

      }, 
    error:  function(){
      toastr.success("Delete Failed", "Failed");}
    })        

}


