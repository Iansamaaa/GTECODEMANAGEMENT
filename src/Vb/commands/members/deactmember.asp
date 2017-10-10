<!--#include file='..\..\..\connections\dsn.asp'-->
<%




    Dim cmd_add, dr_add, strSQL_add
    Dim currentlogin

	'Create Objects
	Set cmd_add = Server.CreateObject("ADODB.Command")
	cmd_add.ActiveConnection =  codemngt

	'QUERY COMMAND
	strSQL_add = "Select * from users where Password = SHA1('"&Request("current")&"')"
	cmd_add.CommandText = strSQL_add
	cmd_add.Prepared = True
	Set dr_add = cmd_add.Execute()
	if NOT dr_add.EOF then
     		deactmember()
     		activity_logs()
     		Response.Cookies("USERNAME").Expires = DateAdd("d",-1,now())
			Response.Cookies("USERTYPE").Expires = DateAdd("d",-1,now())
			Response.Cookies("FIRSTNAME").Expires = DateAdd("d",-1,now())
			Response.Cookies("USERID").Expires = DateAdd("d",-1,now())
			response.write "x"
			Else
			response.write "y"
			end if


      dr_add.Close
    Set cmd_add = Nothing
    Set strSql_add = Nothing
	'****************************
	'This code will be used
        'for changepass validation

	'****************************
function deactmember()
	'Initialize Variables
	Dim cmd_deact, dr_deact, strSQL_deact

	'Create Objects
	Set cmd_deact= Server.CreateObject("ADODB.Command")
	cmd_deact.ActiveConnection =  codemngt
	'QUERY COMMAND
	strSQL_deact= "UPDATE users SET Status='0' WHERE Username='"&Request.Cookies("USERNAME")&"'"

	cmd_deact.CommandText = strSQL_deact
	cmd_deact.Prepared = True

	'EXECUTE COMMAND
	cmd_deact.Execute()

  Set cmd_deact = Nothing
  Set strSql_deact = Nothing
end function

function activity_logs()
Dim cmd, dr_act, strSQL_act

	'Create Objects
	Set cmd= Server.CreateObject("ADODB.Command")
	cmd.ActiveConnection =  codemngt

	'QUERY COMMAND

	strSQL_act = "INSERT into actlogs (ACTuser, ACTdate, ACTdescription) values ('"&Request.Cookies("USERNAME")&"', NOW(), 'Has deactivated')"

	cmd.CommandText = strSQL_act

	cmd.Prepared = True


	cmd.Execute()
  Set cmd = Nothing
  Set strSQL_act = Nothing
end function
%>
