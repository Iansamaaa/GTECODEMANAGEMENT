<%
if Request.Cookies("USERNAME")="" AND Request.Cookies("FIRSTNAME")="" AND Request.Cookies("USERTYPE")="" then
	Response.Write "0"
	Response.End()
Elseif Request.Cookies("USERTYPE")="USER" then 
	Response.Write "2"
	Response.End()
Else
	Response.Write "1"
	Response.End()
End if
%>