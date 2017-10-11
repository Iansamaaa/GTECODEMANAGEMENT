<!--#include file='..\..\..\connections\dsn.asp'-->

<%
	'****************************
	'This code will be used
	'for login validation
  Dim cmd_add, dr_add, strSQL_add
	'Create Objects
	Set cmd_add = Server.CreateObject("ADODB.Command")
	cmd_add.ActiveConnection =  codemngt
	'QUERY COMMAND
	strSQL_add = "Select * from users where Username = '"&Request("userR")&"'"

	cmd_add.CommandText = strSQL_add
	cmd_add.Prepared = True

	Set dr_add = cmd_add.Execute()

	if NOT dr_add.EOF then

      resetPass()
      notifyresetPass()
      response.write "x"
      activity_logs()
			Else
      response.write "y"

			end if


    dr_add.Close
    Set cmd_add = Nothing
    Set strsql_add = Nothing

	'****************************
  function resetPass()
	'Initialize Variables
	Dim cmd_rem, strSQL_rem

	'Create Objects
	Set cmd_rem= Server.CreateObject("ADODB.Command")
	cmd_rem.ActiveConnection =  codemngt
	'QUERY COMMAND
	strSQL_rem = "UPDATE  users  SET Password=SHA1('"&Request("passnew")&"') WHERE Username='"&Request("userR")&"'"

	cmd_rem.CommandText = strSQL_rem
	cmd_rem.Prepared = True

	'EXECUTE COMMAND
	cmd_rem.Execute()
  Set cmd_rem = Nothing
  Set strSql_rem = Nothing

  end function



  function notifyresetPass()
  	'****************************
  	'This code will be used
  	'for addixng members
  	'****************************
  	'Initialize Variables
  	Dim cmd, strSQL_add
  	'Create Objects
  	Set cmd= Server.CreateObject("ADODB.Command")
  	cmd.ActiveConnection =  codemngt

  	'QUERY COMMAND
  	strSQL_add = "INSERT INTO notifications_queue(UserID,Details,Action,Status)values('"&Request.Cookies("USERID")&"','"&Request("firstnamexml")&"','"&Request("act")&"','"&Request("status1")&"')"
  	cmd.CommandText = strSQL_add
  	cmd.Prepared = True
  	cmd.Execute()

    Set strSQL_add = Nothing
    Set cmd = Nothing
  end function


function activity_logs()
Dim cmd_act, dr_act, strSQL_act

	'Create Objects
	Set cmd= Server.CreateObject("ADODB.Command")
	cmd.ActiveConnection =  codemngt

	'QUERY COMMAND

	strSQL_act = "INSERT into actlogs (ACTuser, ACTdate, ACTdescription) values ('"&Request.Cookies("USERNAME")&"', NOW(), 'Has reseted a password')"

	cmd.CommandText = strSQL_act

	cmd.Prepared = True


 cmd.Execute()

  Set cmd = Nothing
  Set strSQL_act = Nothing
end function
%>
