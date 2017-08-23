<!--#include file="../../connections/dsn.asp"-->

<%
	'****************************

	'This code will be used
	'for login validation

	'****************************

	'Initialize Variables
	Dim cmd_edit, dr_edit, strSQL_edit

	'Create Objects
	Set cmd_edit= Server.CreateObject("ADODB.Command")
	cmd_edit.ActiveConnection =  codemngt

	'QUERY COMMAND
	strSQL_edit = "UPDATE users SET FirstName='"&Request("firstns")&"',LastName='"&Request("lastns")&"'WHERE Username='"&Request("usns")&"'"

	cmd_edit.CommandText = strSQL_edit
	cmd_edit.Prepared = True

	'EXECUTE COMMAND
	Set dr_edit= cmd_edit.Execute()


%>
