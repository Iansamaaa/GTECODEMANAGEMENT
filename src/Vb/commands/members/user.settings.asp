<!--#include file='..\..\..\connections\dsn.asp'-->

<%




    Dim cmd_add, dr_add, strSQL_add
    Dim currentlogin

	'Create Objects
	Set cmd_add = Server.CreateObject("ADODB.Command")
	cmd_add.ActiveConnection =  codemngt

	'QUERY COMMAND
	strSQL_add = "Select * from users where Password = SHA1('"&Request("current")&"')"
	cmd_add.CommandText = strSQL_add
	cmd_add.Prepared = True
	Set dr_add = cmd_add.Execute()
	if NOT dr_add.EOF then
      changepass()
      activity_logs()
			response.write "x"
			Else
			response.write "y"
			end if

  dr_add.Close
  Set cmd_add = Nothing
  set strsql_add = Nothing
	'****************************
	'This code will be used
        'for changepass validation

	'****************************


function changepass()
	'Initialize Variables
	Dim cmd_change, strSQL_change

	'Create Objects
	Set cmd_change= Server.CreateObject("ADODB.Command")
	cmd_change.ActiveConnection =  codemngt
	'QUERY COMMAND
	strSQL_change = "UPDATE users SET Password=SHA1('"&Request("confirm")&"') WHERE Username='"&Request.Cookies("USERNAME")&"'"

	cmd_change.CommandText = strSQL_change
	cmd_change.Prepared = True

	'EXECUTE COMMAND
	cmd_change.Execute()
  Set cmd_change = Nothing
  Set strSQL_change = Nothing

end function

function activity_logs()
Dim cmd, strSQL_act

	'Create Objects
	Set cmd= Server.CreateObject("ADODB.Command")
	cmd.ActiveConnection =  codemngt

	'QUERY COMMAND

	strSQL_act = "INSERT into actlogs (ACTuser, ACTdate, ACTdescription) values ('"&Request.Cookies("USERNAME")&"', NOW(), 'Has changed password')"

	cmd.CommandText = strSQL_act

	cmd.Prepared = True


	cmd.Execute()

  Set cmd = Nothing
  Set strSQL_act = Nothing
end function
%>
