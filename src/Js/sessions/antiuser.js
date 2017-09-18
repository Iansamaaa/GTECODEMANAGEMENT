// JavaScript Document

//This javascript contains
//the code to check if
//the server session is still alive.
//This also holds the no back history code.

$(function(){
  $(document).ready(function(){
    //Disable Back History 
    checkuserSession();
  });
  
})


//Check Session
function checkuserSession(){
  
  $.ajax({
    type: "POST",
    url: "../Vb/session/userchecker.asp",
    data: {e: Number(new Date())},
    success: function(data){evaluate_stat(data)}
    })
    
  }
  
//Evaluate Status
function evaluate_stat(stat){
  


  switch (stat){
    case 'x': window.location="homepage.user.asp";
        break;
  } 
  


  }