<!--#include file="../../../connections/dsn.asp"-->


<%

	
'Initialize Variables
	Dim cmd_add, dr_add, strSQL_add
	
	'Create Objects
	Set cmd_add = Server.CreateObject("ADODB.Command")

	cmd_add.ActiveConnection =  codemngt
	
	'QUERY COMMAND
	strSQL_add = "Select * from codes_masterlist where FunctionName = '"&Request("fnames")&"'"
	
	cmd_add.CommandText = strSQL_add
	cmd_add.Prepared = True
	
	
	Set dr_add = cmd_add.Execute()

	if NOT dr_add.EOF then
			response.write "y"
			else
			add_code()
			activity_logs()
			response.write "x"

	end if

	dr_add.close()

	Set dr_add = nothing
	set cmd_add = nothing
	
	

function add_code()
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

	strSQL_add = "INSERT INTO codes_masterlist (Language,FunctionName,Version,ContentScript,DateTimeAdded,DateTimeUpdated,UpdatedBy,AddedBy) values('"&Request("ctypes")&"','"&Request("fnames")&"','"&Request("versions")&"','"&Request("descs")&"',NOW(),NOW(),'"&Request("addedby")&"','"&Request("addedby")&"')"

	cmd.CommandText = strSQL_add
	
	cmd.Prepared = True
	
	cmd.Execute()

end function	

function activity_logs()
Dim cmd, strSQL_act
	
	'Create Objects
	Set cmd= Server.CreateObject("ADODB.Command")
	cmd.ActiveConnection =  codemngt
	
	'QUERY COMMAND

	strSQL_act = "INSERT into actlogs (ACTuser, ACTdate, ACTdescription) values ('"&Request.Cookies("USERNAME")&"', NOW(), 'Added a code')"

	cmd.CommandText = strSQL_act
	
	cmd.Prepared = True
	
	
    cmd.Execute()
end function 
%>
