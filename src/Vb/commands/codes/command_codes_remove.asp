<!--#include file="../../../connections/dsn.asp"-->

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
	strSQL_rem = "DELETE from codes_masterlist WHERE FunctionName='"&Request("IDREC")&"'"

	cmd_rem.CommandText = strSQL_rem
	cmd_rem.Prepared = True

	'EXECUTE COMMAND
	cmd_rem.Execute()
	activity_logs()

	set cmd_rem = Nothing



function activity_logs()
Dim cmd, strSQL_act

	'Create Objects
	Set cmd= Server.CreateObject("ADODB.Command")
	cmd.ActiveConnection =  codemngt

	'QUERY COMMAND

	strSQL_act = "INSERT into actlogs (ACTuser, ACTdate, ACTdescription) values ('"&Request.Cookies("USERNAME")&"', NOW(), 'Has remove a code')"

	cmd.CommandText = strSQL_act

	cmd.Prepared = True


	cmd.Execute()
end function
%>
