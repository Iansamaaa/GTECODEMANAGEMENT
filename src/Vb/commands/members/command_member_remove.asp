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
	Set dr_rem= cmd_rem.Execute()

	activity_logs()

	function activity_logs()
	Dim cmd_act, dr_act, strSQL_act
	
	'Create Objects
	Set cmd= Server.CreateObject("ADODB.Command")
	cmd.ActiveConnection =  codemngt
	
	'QUERY COMMAND

	strSQL_act = "INSERT into actlogs (ACTuser, ACTdate, ACTdescription) values ('"&Request.Cookies("USERNAME")&"', NOW(), 'Has deactivated a member')"

	cmd.CommandText = strSQL_act
	
	cmd.Prepared = True
	
	
	Set dr_add = cmd.Execute()
end function 
%>
%>
