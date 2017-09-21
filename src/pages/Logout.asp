<!--#include file="../connections/dsn.asp"-->
<% 
For Each USERNAME in Response.Cookies
    Response.Cookies(USERNAME).Expires = DateAdd("d",-1,now())

Next
  activity_logs() 		
  Response.Redirect"Index/index.asp"

function activity_logs()
Dim cmd_act, dr_act, strSQL_act
	
	'Create Objects
	Set cmd= Server.CreateObject("ADODB.Command")
	cmd.ActiveConnection =  codemngt
	
	'QUERY COMMAND

	strSQL_act = "INSERT into actlogs (ACTuser, ACTdate, ACTdescription) values ('"&Request.Cookies("USERNAME")&"', NOW(), 'Has logged out')"

	cmd.CommandText = strSQL_act
	
	cmd.Prepared = True
	
	
	Set dr_add = cmd.Execute()
end function 
%>