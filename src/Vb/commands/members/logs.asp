<!--#include file='..\..\..\connections\dsn.asp'-->

<%
	'****************************
	'This code will be used
	'for login validation
	'****************************




	'Initialize Variables
	Dim cmd_log, dr_log, strSQL_log

	'Create Objects
	Set cmd_log= Server.CreateObject("ADODB.Command")
	cmd_log.ActiveConnection =  codemngt

	'QUERY COMMAND
	strSQL_log = "INSERT INTO ActivityLogs(ByUser,Descript,Action)values('"&Request.Cookies("USERNAME")&"','has','"&Request("actionM")&"')"


	cmd_log.CommandText = strSQL_log
	cmd_log.Prepared = True



	'EXECUTE COMMAND
	Set dr_log= cmd_log.Execute()

%>
