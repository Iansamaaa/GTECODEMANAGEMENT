$(function(){

  $(document).ready(function(){
  
  $(".btnED").bind({
    click:function(){
      var KAFOY = $(this).closest('tr').find('td:eq(1)').text();
      var A = $(this).closest('tr').find('td:eq(2)').text();
      var B = $(this).closest('tr').find('td:eq(3)').text();
      var C = $(this).closest('tr').find('td:eq(4)').text();
      $('#viewED').val(KAFOY);
      $('#edit_ctype').val(A);
      $('#edit_fname').val(B);
      $('#edit_version').val(C);
      Modalview1();
    }
  });

   $("#btnEDIT").bind({
    click:function(){
      code_edit();
    }
  });

  }); // End of document ready]
});


/**********
FUNCTIONS
**********/

//check_fields
//validate to server
function Modalview1(value){
  //Set Ajax Status
  var datastring;
  datastring= {VIEWN: $('#viewED').val(), 
        };
  $.ajax({
    type: "POST",
    url: "../Vb/commands/command_codes_viewn.asp",
    data: datastring,
    async: false,
    success: function(data){

      $('#edit_codedesc').val(data);

      }, 
    error:  function(){
      toastr.success("Delete Failed", "Failed");}
    })        

}

function code_edit(){
  //Set Ajax Status
  var datastring;
  datastring= { ayd: $('#viewED').val(),
    fnames: $("#edit_fname").val(),
        descs: $("#edit_codedesc").val(),
        versions: $('#edit_version').val(),
        };
    $.ajax({
    type: "POST",
    url: "../Vb/commands/command_codes_edit.asp",
    data: datastring,
    async: false,
    success: function(data){
      toastr.success("CodeEdited Edited!", "Sucess");
      $('#editModal').modal('toggle');
      window.setTimeout(function(){location.reload()},2000);

    }, 
    error:  function(){
      toastr.warning("Submission Failed");}
  })          
}


