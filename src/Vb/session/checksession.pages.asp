<%
if Request.Cookies("USERNAME")="" then
	Response.Write "x"
	Response.End()
Elseif Request.Cookies("USERTYPE")="USER" then
	Response.Write "y"
	Response.End()
Else 
	Response.Write "1"
	Response.End()
End if

%>