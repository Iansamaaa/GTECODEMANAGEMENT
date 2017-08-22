$(function(){

$(document).ready(function(){

  $(".editModalButton").bind({
    click:function(){
      var FirstName = $(this).closest('tr').find('td:eq(1)').text();
      $('#FirstName').val(FirstName);
      var LastName = $(this).closest('tr').find('td:eq(2)').text();
      $('#LastName').val(LastName);
      var UserName = $(this).closest('tr').find('td:eq(3)').text();
      $('#UserName').val(UserName);
    }
  });
});

});
