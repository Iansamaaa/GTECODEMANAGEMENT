
<!--#include file="../../connections/dsn.asp"-->

<%
	'****************************
	
	'This code will be used
	'for login validation
	
	'****************************
	
	'Initialize Variables
	Dim cmd_search, dr_search, strSQL_search
	
	'Create Objects
	Set cmd_search= Server.CreateObject("ADODB.Command")
	cmd_search.ActiveConnection =  codemngt
	
	'QUERY COMMAND
	strSQL_search = "SELECT FirstName,LastName FROM users WHERE Username='"&Request("usern")&"'"
	
	cmd_search.CommandText = strSQL_search
	cmd_search.Prepared = True
	
	'EXECUTE COMMAND
	Set dr_search= cmd_search.Execute()

	if NOT dr_search.EOF then
		Response.Write dr_search("FirstName") &","& dr_search("LastName")
		
	Else
		'Return Unidentified credentials
		Response.Write "y"	
	End if
		
	'Destroy Objects
	dr_search.close()
	Set dr_search = Nothing
	Set cmd_search= Nothing
	
%>