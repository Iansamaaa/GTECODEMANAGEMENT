<!--#include file="../../../connections/dsn.asp"-->
<!--#include file="../../../libs/ASPJSON/JSON_2.0.4.asp"-->
<!--#include file="../../../libs/ASPJSON/JSON_UTIL_0.1.1.asp"-->
<!--#include file="../../../libs/ASPJSON/aspJSON.asp"-->

<%

	Response.AddHeader "Content-Type", "application/json"
	
	Dim cmd, strsql
	
	strsql ="SELECT * FROM actlogs"


	'Create Objects
	Set cmd= Server.CreateObject("ADODB.Command")
	cmd.ActiveConnection =  codemngt

	cmd.CommandText=strsql
	cmd.Prepared = true
	
	QueryToJSON(cmd).Flush	
	
	Set cmd = Nothing
%>