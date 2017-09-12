
<!--#include file="../../connections/dsn.asp"-->

<%
	'****************************

	'This code will be used
	'for login validation

	'****************************

	'Initialize Variables
<<<<<<< HEAD
	Dim cmd_login, dr_login, strSQL_login, actchecker
=======
	Dim cmd_login, dr_login, strSQL_login, actchecker,cget
>>>>>>> b3c73e478dd9de912e4ec695d04cec0317952df4

	'Create Objects
	Set cmd_login = Server.CreateObject("ADODB.Command")
	cmd_login.ActiveConnection =  codemngt

	'QUERY COMMAND
	strSQL_login = "SELECT * FROM users WHERE Username='"&Request("user")&"' AND Password=SHA1('"&Request("user")&""&Request("pass")&"') OR Username='"&Request("user")&"' AND Password=SHA1('"&Request("pass")&"')"

	cmd_login.CommandText = strSQL_login
	cmd_login.Prepared = True

	'EXECUTE COMMAND
	Set dr_login= cmd_login.Execute()

	if NOT dr_login.EOF then
		'set sessions
		Response.Cookies("USERNAME") = Request("user")
		Response.Cookies("FIRSTNAME") = dr_login("FirstName")
<<<<<<< HEAD

		Response.Write "y"
	Else if dr_login("Accounttype") = "ADMIN"
	
		Response.Cookies("USERNAME") = Request("user")
		Response.Cookies("FIRSTNAME") = dr_login("FirstName")

		Response.Write "z"
=======
		Response.Cookies("USERTYPE") = dr_login("Accounttype")
		if dr_login("Accounttype")="ADMIN" then
			Response.Write "y"
		else
			Response.Write "z"
		End if
>>>>>>> b3c73e478dd9de912e4ec695d04cec0317952df4
	Else
		'Return Unidentified credentials
		Response.Buffer = True
        Response.ExpiresAbsolute = Now() - 1
        Response.Expires = 0
        Response.CacheControl = "no-cache"
		Response.Write "x"
	End if

	'Destroy Objects
	dr_login.close()
	Set dr_login = Nothing
	Set cmd_login = Nothing
%>
