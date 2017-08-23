
$(function(){
$(document).ready(function(){

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
