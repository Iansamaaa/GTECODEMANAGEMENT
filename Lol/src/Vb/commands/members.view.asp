<!--#include file="../../connections/dsn.asp"-->

<%
	'****************************
	
	'This code will be used
	'for login validation
	
	'****************************
	
	'Initialize Variables
	Dim cmd, dr, strsql, firstname


	searchall = Request("searchALL")
	
	'Create Objects
	Set cmd= Server.CreateObject("ADODB.Command")
	cmd.ActiveConnection =  codemngt
	
	'QUERY COMMAND
	strsql = "SELECT * FROM users"
	

	If Request("searchALL")<>"" then 
		strsql = strsql & "AND (FirstName LIKE '%"&searchall&"%' OR LastName LIKE '%"&searchall&"%')"
	End if 
	cmd.CommandText = strsql
	cmd.Prepared = True
	
	'EXECUTE COMMAND
	Set dr= cmd.Execute()

	
%>