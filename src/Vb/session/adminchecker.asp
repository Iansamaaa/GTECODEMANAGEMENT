<%
if Request.Cookies("USERTYPE")="ADMIN" then
	Response.Write "x"
	Response.End()
Else
	Response.Write "1"
	Response.End()
End if
%>