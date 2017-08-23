$(function(){

$(document).ready(function(){

  $(".editModalButton").bind({
    click:function(){
      var FirstName = $(this).closest('tr').find('td:eq(1)').text();
      $('#firstn').val(FirstName);
      var LastName = $(this).closest('tr').find('td:eq(2)').text();
      $('#lastn').val(LastName);
      var UserName = $(this).closest('tr').find('td:eq(0)').text();
      $('#usern').val(UserName);
    } 
  });
});

});
