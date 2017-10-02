$(function(){

  $(document).ready(function(){

  $(".btnED").bind({
    click:function(){
      var KAFOY = $(this).closest('tr').find('td:eq(0)').text();
      var A = $(this).closest('tr').find('td:eq(1)').text();
      var B = $(this).closest('tr').find('td:eq(2)').text();
      var C = $(this).closest('tr').find('td:eq(3)').text();
      $('#viewED').val(KAFOY);
      $('#edit_ctype').val(A);
      $('#edit_fname').val(B);
      $('#edit_version').val(C);

      Modalview1();
    }
  });

   $("#btnEDIT").bind({
    click:function(){
       if($('#edit_ctype').val()=='' || $('#edit_fname').val()=='' || $('#edit_codedesc').val()=='' || $('#edit_version').val()==''|| $('#edited').val()=='')
      {
        toastr.warning("Fill out Required Fields", "Check Fields");
        return false;
      }
      else if(!($('#edit_version').val()).match(/^[0-9.]{1,6}$/))
      {
      toastr.warning("Type in version Number", "Check Fields");
      return false;
      }
      else if(!($('#edit_ctype').val()).match(/^[a-zA-Z. ]{1,10}$/))
      {
      toastr.warning("Type valid Code type", "Check Fields");
      return false;
      }
      else if(!($('#edit_fname').val()).match(/^[a-zA-Z!@#$&()-`.+,/\"]{3,20}$/))
      {
      toastr.warning("Type valid Function Name", "Check Fields");
      return false;
      }
      else
      {
        code_edit();
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
function Modalview1(value){
  //Set Ajax Status
  var datastring;
  datastring= {VIEWN: $('#viewED').val(),
        };
  $.ajax({
    type: "POST",
    url: "../Vb/commands/codes/command_codes_viewn.asp",
    data: datastring,
    async: false,
    success: function(data){

      $('#edit_codedesc').val(atob(data));

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
        descs: btoa($("#edit_codedesc").val()),
        edit: ($("#edited").val()),
        versions: $('#edit_version').val(),
        };
    $.ajax({
    type: "POST",
    url: "../Vb/commands/codes/command_codes_edit.asp",
    data: datastring,
    async: false,
    success: function(data){
      toastr.success("Code Edited!", "Sucess");
      $('#editModal').modal('toggle');
      window.setTimeout(function(){location.reload()},2000);

    },
    error:  function(){
      toastr.warning("Submission Failed");}
  })
}
