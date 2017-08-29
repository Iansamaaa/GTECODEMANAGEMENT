$(function(){

$(document).ready(function(){

  $(".editModalButton").bind({
    click:function(){
      var FirstName = $(this).closest('tr').find('td:eq(2)').text();
      $('#firstn').val(FirstName);
      var LastName = $(this).closest('tr').find('td:eq(3)').text();
      $('#lastn').val(LastName);
      var UserName = $(this).closest('tr').find('td:eq(1)').text();
      $('#usern').val(UserName);
    } 
  });


    $(".ViewModalButton").bind({
    click:function(){
      var FirstName = $(this).closest('tr').find('td:eq(2)').text();
      $('#firstnview').val(FirstName);
      var LastName = $(this).closest('tr').find('td:eq(3)').text();
      $('#lastnview').val(LastName);
      var UserName = $(this).closest('tr').find('td:eq(1)').text();
      $('#usernview').val(UserName);
    } 
  });
});

});
