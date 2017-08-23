<!--#include file="../../../connections/dsn.asp"-->

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
	strSQL_edit = "UPDATE codes_masterlist SET FunctionName='"&Request("fnames")&"',Version='"&Request("versions")&"',ContentScript='"&Request("descs")&"' WHERE IDcode='"&Request("ayd")&"'"
	
	cmd_edit.CommandText = strSQL_edit
	cmd_edit.Prepared = True
	
	'EXECUTE COMMAND
	Set dr_edit= cmd_edit.Execute()

	
%>