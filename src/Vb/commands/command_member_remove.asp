<!--#include file="../../connections/dsn.asp"-->

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
	strSQL_rem = "DELETE from users WHERE Username='"&Request("usn")&"'"
	
	cmd_rem.CommandText = strSQL_rem
	cmd_rem.Prepared = True
	
	'EXECUTE COMMAND
	Set dr_rem= cmd_rem.Execute()

	
%>