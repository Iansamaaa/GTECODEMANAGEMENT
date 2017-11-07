<!--#include file="../../../connections/dsn.asp"-->

<%
	'****************************
	'This code will be used
	'for login validation
	'****************************
	'Initialize Variables
	addpreviousversion()
	Dim cmd_edit, strSQL_edit
	'Create Objects
	Set cmd_edit= Server.CreateObject("ADODB.Command")
	cmd_edit.ActiveConnection =  codemngt
	'QUERY COMMAND
	strSQL_edit = "UPDATE codes_masterlist SET FunctionName='"&Request("fnames")&"',Version='"&Request("versions")&"',ContentScript='"&Request("descs")&"',UpdatedBy='"&Request("edit")&"',DateTimeUpdated=NOW(),Description = '"&Request("desc")&"',Status = 1 WHERE IDcode='"&Request("ayd")&"'"

	Response.Write strSQL_edit
	cmd_edit.CommandText = strSQL_edit
	cmd_edit.Prepared = True
	'EXECUTE COMMAND
	cmd_edit.Execute()
	appendreleasenotes()
	activity_logs()


	set cmd_edit = nothing


function activity_logs()
Dim cmd, strSQL_act
	'Create Objects
	Set cmd= Server.CreateObject("ADODB.Command")
	cmd.ActiveConnection =  codemngt
	'QUERY COMMAND
	strSQL_act = "INSERT into actlogs (ACTuser, ACTdate, ACTdescription) values ('"&Request.Cookies("USERNAME")&"', NOW(), 'Edited a code')"

	cmd.CommandText = strSQL_act
	cmd.Prepared = True

    cmd.Execute()

    set cmd = nothing
end function

function addpreviousversion()
Dim cmd, strSQL_act
	'Create Objects
	Set cmd= Server.CreateObject("ADODB.Command")
	cmd.ActiveConnection =  codemngt
	'QUERY COMMAND
	strSQL_act = "INSERT into codes_masterlist(Language,FunctionName,Version,DateTimeAdded,ContentScript,ReleaseNotes,Description,AddedBy,UpdatedBy,DateTimeUpdated,Status) values ('"&Request("ctype")&"','"&Request("addfn")&"','"&Request("addver")&"','"&Request("addda")&"','"&Request("addcs")&"','"&Request("addrn")&"','"&Request("addds")&"','"&Request("addab")&"','"&Request("addub")&"','"&Request("adddu")&"', 0 )"

	cmd.CommandText = strSQL_act
	cmd.Prepared = True

    cmd.Execute()

    set cmd = nothing
end function

function appendreleasenotes()
Dim cmd, strSQL_act
	'Create Objects
	Set cmd= Server.CreateObject("ADODB.Command")
	cmd.ActiveConnection =  codemngt
	'QUERY COMMAND
	strSQL_act = "UPDATE codes_masterlist SET ReleaseNotes =  CONCAT('Version "&Request("versions")&"','\n', NOW(), '\n', '"&request("rna")&"','\n', '----"&Request.Cookies("USERNAME")&"----','\n','\n',ReleaseNotes) WHERE IDcode='"&Request("ayd")&"'"

	cmd.CommandText = strSQL_act
	cmd.Prepared = True

    cmd.Execute()

    set cmd = nothing
end function



%>
