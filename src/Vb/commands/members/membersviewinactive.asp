<!--#include file='..\..\..\connections\dsn.asp'
-->
<!--#include file='..\..\..\libs\ASPJSON\JSON_2.0.4.asp'
-->
<!--#include file='..\..\..\libs\ASPJSON\JSON_UTIL_0.1.1.asp'
-->
<!--#include file='..\..\..\libs\ASPJSON\aspJSON.asp'
-->

<%
	'****************************
	Response.AddHeader "Content-Type", "application/json"
	'This code will be used
	'for login validation

	'****************************

	'Initialize Variables
	Dim cmd, dr, strsql



	'Create Objects
	Set cmd= Server.CreateObject("ADODB.Command")
	cmd.ActiveConnection =  codemngt

	'QUERY COMMAND
	strsql = "SELECT * FROM users WHERE Status='0' "
	cmd.CommandText = strsql
	cmd.Prepared = True
	'EXECUTE COMMAND
	Set dr= cmd.Execute()
	QueryToJSON(cmd).Flush


	dr.Close
	Set strsql = Nothing
	Set cmd = Nothing
%>
