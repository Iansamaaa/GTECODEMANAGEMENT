<%
if Request.Cookies("USERNAME")="" AND Request.Cookies("USERTYPE")="USER" then
	Response.Write "0"
	Response.End()
Else
	Response.Write "1"
	Response.End()
End if

%>