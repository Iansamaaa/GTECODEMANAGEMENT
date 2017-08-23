
<!--#include file="../../connections/dsn.asp"-->

<%
	'****************************
	
	'This code will be used
	'for login validation
	
	'****************************
	
	'Initialize Variables
	Dim cmd_login, dr_login, strSQL_login
	
	'Create Objects
	Set cmd_login = Server.CreateObject("ADODB.Command")
	cmd_login.ActiveConnection =  codemngt
	
	'QUERY COMMAND
	strSQL_login = "SELECT * FROM users WHERE Username='"&Request("user")&"' AND Password=SHA1('"&Request("user")&""&Request("pass")&"')"
	
	cmd_login.CommandText = strSQL_login
	cmd_login.Prepared = True
	
	'EXECUTE COMMAND
	Set dr_login= cmd_login.Execute()

	if NOT dr_login.EOF then

		'set sessions
		Response.Cookies("USERNAME") = Request("user")
		Response.Cookies("FIRSTNAME") = dr_login("FirstName")
		
		Response.Write "y"
	Else
		'Return Unidentified credentials
		Response.Write "x"		
	End if
		
	'Destroy Objects
	dr_login.close()
	Set dr_login = Nothing
	Set cmd_login = Nothing
	
%>