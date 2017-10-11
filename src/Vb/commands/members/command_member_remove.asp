<!--#include file='..\..\..\connections\dsn.asp'-->

<%
	'****************************

	'This code will be used
	'for login validation

	'****************************

	'Initialize Variables
	Dim cmd_rem, dr_rem, strSQL_rem

	'Create Objects
	Set cmd_rem= Server.CreateObject("ADODB.Command")
	cmd_rem.ActiveConnection =  codemngt

	'QUERY COMMAND
	strSQL_rem = "UPDATE  users  SET Status='"&Request("status")&"' WHERE Username='"&Request("usns")&"'"

	cmd_rem.CommandText = strSQL_rem
	cmd_rem.Prepared = True

	'EXECUTE COMMAND
	cmd_rem.Execute()

	activity_logs()
	If Request("usns")=Request.cookies("USERNAME") then
		Response.Cookies("USERNAME").Expires = DateAdd("d",-1,now())
		Response.Cookies("USERTYPE").Expires = DateAdd("d",-1,now())
		Response.Cookies("FIRSTNAME").Expires = DateAdd("d",-1,now())
		Response.Cookies("USERID").Expires = DateAdd("d",-1,now())
		response.write "x"
	Else
		response.write "z"
	End if


	Set cmd_rem = Nothing
	Set strSQL_rem = Nothing

	function activity_logs()
	Dim cmd, strSQL_act

	'Create Objects
	Set cmd= Server.CreateObject("ADODB.Command")
	cmd.ActiveConnection =  codemngt

	'QUERY COMMAND

	strSQL_act = "INSERT into actlogs (ACTuser, ACTdate, ACTdescription) values ('"&Request.Cookies("USERNAME")&"', NOW(), 'Has deactivated a member')"

	cmd.CommandText = strSQL_act

	cmd.Prepared = True


	cmd.Execute()

	Set cmd = Nothing
	Set strSql_act = Nothing
end function
%>
