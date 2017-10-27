$(function(){

  $(document).ready(function(){


   $("#btnREMOVElang").bind({
    click:function(){
      var Rem = $("#IDrecord").val();
      RemoveLanguage(Rem);
    }
  });

  }); // End of document ready]
});


/**********
FUNCTIONS
**********/

//check_fields
//validate to server
function RemoveLanguage(labad){
  //Set Ajax Status
  var datastring;
  datastring= {IDREC: labad,
        };

  $.ajax({
    type: "POST",
    url: "../Vb/commands/codes/languageremove.asp",
    data: datastring,
    async: false,
    success: function(data){;

      toastr.success("Language Deleted", "Sucess");
      $('#removeModal').modal('toggle');
      window.setTimeout(function(){location.reload()},2000);


      },
    error:  function(){
      toastr.warning("Delete Failed", "Failed");}
    })

}
