<!--#include file='..\..\..\connections\dsn.asp'-->

<%
'Initialize Variables
	Dim cmd_add, dr_add, strSQL_add

	'Create Objects
	Set cmd_add = Server.CreateObject("ADODB.Command")
	cmd_add.ActiveConnection =  codemngt

	'QUERY COMMAND
	strSQL_add = "Select * from users where Username = '"&Request("usn")&"'"

	cmd_add.CommandText = strSQL_add
	cmd_add.Prepared = True

	Set dr_add = cmd_add.Execute()

	if NOT dr_add.EOF then
			response.write "y"
			Else
			add()
			notify()
			activity_logs()
			response.write "x"
			end if

dr_add.Close
Set strsql_add = Nothing
Set dr_add = Nothing


function add()
	'****************************
	'This code will be used
	'for addixng members
	'****************************
	'Initialize Variables
	Dim cmd_add, strSQL_add
	'Create Objects
	Set cmd_add= Server.CreateObject("ADODB.Command")
	cmd_add.ActiveConnection =  codemngt

	'QUERY COMMAND
	strSQL_add = "INSERT INTO users(FirstName,AccountType,LastName,Username,`Password`,Email,Status)values('"&Request("firstn")&"','"&Request("atype")&"','"&Request("lastn")&"','"&Request("usn")&"',SHA1('"&Request("user")&""&Request("pwds")&"'),'"&Request("email")&"','"&Request("status")&"')"
	cmd_add.CommandText = strSQL_add
	cmd_add.Prepared = True
	 cmd_add.Execute()

	 Set cmd_add = Nothing
	 Set strSQL_add = Nothing

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
	strSQL_add = "INSERT INTO notifications_queue(UserID,Details,Action,Status)values('"&Request.Cookies("USERID")&"','"&Request("firstnamexml")&"','"&Request("act")&"','"&Request("status1")&"')"
	cmd.CommandText = strSQL_add
	cmd.Prepared = True
	cmd.Execute()


	Set cmd = Nothing
	Set strsql_add = Nothing

end function



function activity_logs()
Dim cmd_log, dr_log, strSQL_log

	'Create Objects
	Set cmd_log= Server.CreateObject("ADODB.Command")
	cmd_log.ActiveConnection =  codemngt

	'QUERY COMMAND

	strSQL_log = "INSERT into actlogs (ACTuser, ACTdate, ACTdescription) values ('"&Request.Cookies("USERNAME")&"', NOW(), 'Has added a member')"

	cmd_log.CommandText = strSQL_log

	cmd_log.Prepared = True


	cmd_log.Execute()

	Set cmd_log = Nothing
	Set strsql_log = Nothing
 end function
%>
