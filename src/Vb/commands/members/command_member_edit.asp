<!--#include file='..\..\..\connections\dsn.asp'-->

<%
	'****************************
	'This code will be used
	'for login validation
	'****************************
	'Initialize Variables
	Dim cmd_edit, strSQL_edit
	'Create Objects
	Set cmd_edit= Server.CreateObject("ADODB.Command")
	cmd_edit.ActiveConnection =  codemngt

	'QUERY COMMAND
	strSQL_edit = "UPDATE users SET FirstName='"&Request("firstns")&"',LastName='"&Request("lastns")&"'WHERE Username='"&Request("usns")&"'"

	cmd_edit.CommandText = strSQL_edit
	cmd_edit.Prepared = True

	'EXECUTE COMMAND
	cmd_edit.Execute()
	activity_logs()


	Set cmd_edit = Nothing
	Set strSQL_edit = Nothing

function activity_logs()
Dim cmd, dr_act, strSQL_act

	'Create Objects
	Set cmd= Server.CreateObject("ADODB.Command")
	cmd.ActiveConnection =  codemngt

	'QUERY COMMAND

	strSQL_act = "INSERT into actlogs (ACTuser, ACTdate, ACTdescription) values ('"&Request.Cookies("USERNAME")&"', NOW(), 'Has edited a Member')"

	cmd.CommandText = strSQL_act
	cmd.Prepared = True


	cmd.Execute()
	Set cmd = Nothing
	Set strSql_act = Nothing
end function
%>
