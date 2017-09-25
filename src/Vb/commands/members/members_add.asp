<!--#include file='..\..\..\connections\dsn.asp'-->

<%
'Initialize Variables
	Dim cmd_add, dr_add, strSQL_add

	'Create Objects
	Set cmd_add = Server.CreateObject("ADODB.Command")
	cmd_add.ActiveConnection =  codemngt

	'QUERY COMMAND
	strSQL_add = "Select * from users where Username = '"&Request("usn")&"' OR Email = '"&Request("email")&"'"

	cmd_add.CommandText = strSQL_add
	cmd_add.Prepared = True

	Set dr_add = cmd_add.Execute()

	if NOT dr_add.EOF then
			response.write "y"
			Else
			add()
			notify()
			response.write "x"
			end if

function add()
	'****************************
	'This code will be used
	'for addixng members
	'****************************
	'Initialize Variables
	Dim cmd, dr_add, strSQL_add
	'Create Objects
	Set cmd= Server.CreateObject("ADODB.Command")
	cmd.ActiveConnection =  codemngt

	'QUERY COMMAND
	strSQL_add = "INSERT INTO users(FirstName,AccountType,LastName,Username,`Password`,Email,Status)values('"&Request("firstn")&"','"&Request("atype")&"','"&Request("lastn")&"','"&Request("usn")&"',SHA1('"&Request("user")&""&Request("pwds")&"'),'"&Request("email")&"','"&Request("status")&"')"
	cmd.CommandText = strSQL_add
	cmd.Prepared = True
	Set dr_add = cmd.Execute()


end function


function notify()
	'****************************
	'This code will be used
	'for addixng members
	'****************************
	'Initialize Variables
	Dim cmd, dr_add, strSQL_add
	'Create Objects
	Set cmd= Server.CreateObject("ADODB.Command")
	cmd.ActiveConnection =  codemngt

	'QUERY COMMAND
	strSQL_add = "INSERT INTO notifications_queue(UserID,Details,Action)values('"&Request.Cookies("USERID")&"','"&Request("firstnamexml")&"','"&Request("act")&"')"
	cmd.CommandText = strSQL_add
	cmd.Prepared = True
	Set dr_add = cmd.Execute()


end function



%>
