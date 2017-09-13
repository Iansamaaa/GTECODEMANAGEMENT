// JavaScript Document

//This javascript contains
//the code to check if
//the server session is still alive.
//This also holds the no back history code.

$(function(){
  $(document).ready(function(){
     checkSessionPage();
  });
  
})


//Check Session
function checkSessionPage(){
  
  $.ajax({
    type: "POST",
    url: "../Vb/session/checksession.pages1.asp",
    data: {e: Number(new Date())},
    success: function(data){evaluate_stat(data)}
    })
    
  }
  
//Evaluate Status
function evaluate_stat(stat){
  
  switch (stat){
    case '0': window.location="Index/index.asp";
        break;
    case '2': window.setTimeout(function(){location.reload()},500);
        break;
  } 
  
  }