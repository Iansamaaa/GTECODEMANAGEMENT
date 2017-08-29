
$(function(){
$(document).ready(function(){

$("#modalClearMem").bind({

  click:function(){
   $("#frstn").val("")
   $("#lstn").val("")
   $("#pwd").val("")
   $("#usn").val("")
  }

});


$("#modalBan").bind({

  click:function(){
   $("#firstn").val("")
   $("#lastn").val("")
  }

});


$("#enableModalEdit").bind({

  click:function(){

      document.getElementById('firstn').removeAttribute('disabled');
      document.getElementById('lastn').removeAttribute('disabled');


  }

});

});
});
