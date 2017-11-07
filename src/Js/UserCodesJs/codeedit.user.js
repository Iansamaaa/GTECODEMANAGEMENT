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
      if($('#edit_ctype').val()=='' || $('#edit_fname').val()=='' || $('#edit_codedesc').val()=='' || $('#edit_version').val()==''|| $('#edited').val()=='' || $('#edit_desc').val()=='')
      {
        toastr.warning("Fill out Required Fields", "Check Fields");
        return false;
      }
      else if(!($('#edit_version').val()).match(/^[0-9.]{1,6}$/))
      {
      toastr.warning("Type in version Number", "Check Fields");
      return false;
      }
      else if(!($('#edit_fname').val()).match(/^[a-zA-Z!@#$&()-`.+,/\ "]{3,20}$/))
      {
      toastr.warning("Type valid Function Name", "Check Fields");
      return false;
      }
      else
      {
        $('#rnaModal').modal('show');
        $('#editModal').modal('toggle');
      }
    }
  });

   $("#wp").bind({
      click:function(){
       if($('#edit_ctype').val()=='' || $('#edit_fname').val()=='' || $('#edit_codedesc').val()=='' || $('#edit_version').val()==''|| $('#edited').val()=='' || $('#edit_desc').val()=='' || $('#rna').val()=='')
      {
        toastr.warning("Fill out Required Fields", "Check Fields");
        return false;
      }
      else if(!($('#edit_version').val()).match(/^[0-9.]{1,6}$/))
      {
      toastr.warning("Type in version Number", "Check Fields");
      return false;
      }
      else if(!($('#edit_fname').val()).match(/^[a-zA-Z!@#$&()-`.+,/\ "]{3,20}$/))
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

  $("#rnacancel").bind({
      click:function(){
        $('#rnaModal').modal('hide');
        $('#editModal').modal('show');
      }



  });


  }); // End of document ready]
});


/**********
FUNCTIONS
**********/

//check_fields
//validate to server
function code_edit(){
  //Set Ajax Status
  var datastring;
  datastring= { ayd: $('#viewED').val(),
  ctype: $('#edit_ctype').val(),
    fnames: $("#edit_fname").val(),
        descs: btoa($("#edit_codedesc").val()),
        rna: $('#rna').val(),
        edit: ($("#edited").val()),
        versions: passversion,
        desc: btoa($("#edit_desc").val()),
        addver: ($("#edit_version").val()),
        addrn:  ($('#rnrnrn').val()),
        addda:  ($('#dtad').val()),
        adddu:  ($('#dtup').val()),
        addab:  ($('#addbyy').val()),
        addub:  ($('#uppbyy').val()),
        addfn:   $('#pfunc').val(),
        addcs:   btoa($('#pcont').val()),
        addds:   btoa($('#pdesc').val()),
        };
    $.ajax({
    type: "POST",
    url: "../Vb/commands/codes/command_codes_edit.asp",
    data: datastring,
    async: false,
    success: function(data){
      toastr.success("Code Edited!", "Sucess");
      $('#rnaModal').modal('toggle');
      window.setTimeout(function(){location.reload()},2000);


    },
    error:  function(){
      toastr.warning("Submission Failed");}
  })
}
