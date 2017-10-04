<!--#include file="../../../connections/dsn.asp"-->


<%

	
'Initialize Variables
	Dim cmd_add, dr_add, strSQL_add
	
	'Create Objects
	Set cmd_add = Server.CreateObject("ADODB.Command")

	cmd_add.ActiveConnection =  codemngt
	
	'QUERY COMMAND
	strSQL_add = "Select * from code_language_reference where Language = '"&Request("lang")&"'"
	
	cmd_add.CommandText = strSQL_add
	cmd_add.Prepared = True
	
	
	Set dr_add = cmd_add.Execute()

	if NOT dr_add.EOF then
			response.write "y"
			else
			add_lang()
			activity_logs()
			response.write "x"

	end if
	
	

function add_lang()
	'****************************
	
	'This code will be used
	'for addixng members 
	
	'****************************
	
	'Initialize Variables
	Dim cmd, dr_add, strSQL_add, strSQL_activity
	
	'Create Objects
	Set cmd= Server.CreateObject("ADODB.Command")
	cmd.ActiveConnection =  codemngt
	
	'QUERY COMMAND

	strSQL_add = "INSERT INTO code_language_reference(Language) values ('"&Request("lang")&"')"

	cmd.CommandText = strSQL_add
	
	cmd.Prepared = True
	
	
	Set dr_add = cmd.Execute()

end function	

function activity_logs()
Dim cmd_act, dr_act, strSQL_act
	
	'Create Objects
	Set cmd= Server.CreateObject("ADODB.Command")
	cmd.ActiveConnection =  codemngt
	
	'QUERY COMMAND

	strSQL_act = "INSERT into actlogs (ACTuser, ACTdate, ACTdescription) values ('"&Request.Cookies("USERNAME")&"', NOW(), 'Added a code')"

	cmd.CommandText = strSQL_act
	
	cmd.Prepared = True
	
	
	Set dr_add = cmd.Execute()
end function 
%>
