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
	strSQL_add = "Select * from users where Email = '"&Request("emels")&"'"

	cmd_add.CommandText = strSQL_add
	cmd_add.Prepared = True

	Set dr_add = cmd_add.Execute()

	if NOT dr_add.EOF then
      resetPass()
      notifyresetPass()
			response.write "x"
			Else
      response.write "y"

			end if


	'****************************
  function resetPass()
	'Initialize Variables
	Dim cmd_rem, dr_rem, strSQL_rem

	'Create Objects
	Set cmd_rem= Server.CreateObject("ADODB.Command")
	cmd_rem.ActiveConnection =  codemngt
	'QUERY COMMAND
	strSQL_rem = "UPDATE  users  SET Password=SHA1('"&Request("passnew")&"') WHERE Username='"&Request("userR")&"'"

	cmd_rem.CommandText = strSQL_rem
	cmd_rem.Prepared = True

	'EXECUTE COMMAND
	Set dr_rem= cmd_rem.Execute()

  end function



  function notifyresetPass()
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