// JavaScript Document

//This javascript contains
//the code to check if
//the server session is still alive.
//This also holds the no back history code.

$(function(){
  checkSessionPage();
  $(document).ready(function(){
    //Disable Back History 
    window.history.forward(1);
    return false;
  });
})


//Check Session
function checkSessionPage(){
  
  $.ajax({
    type: "POST",
    url: "../../Vb/session/checksession.asp",
    data: {e: Number(new Date())},
    success: function(data){evaluate_stat(data)}
    })
    
  }
  
//Evaluate Status
function evaluate_stat(stat){
  
  if (stat=='1'){
    window.top.location.href="../homepage.asp";
    return false;
    }
  else if (stat=='2'){
    window.top.location.href="../homepage.user.asp";
    return false;
    }
}