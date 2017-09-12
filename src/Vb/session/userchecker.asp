<%
if Request.Cookies("USERTYPE")="USER" then
	Response.Write "x"
	Response.End()
Else
	Response.Write "1"
	Response.End()
End if
%>