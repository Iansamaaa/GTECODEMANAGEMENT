<%
if Request.Cookies("USERNAME")="" then
	Response.Write "0"
	Response.End()
Elseif Request.Cookies("USERTYPE")="USER" then
	Response.Cookies("USERNAME").Expires = DateAdd("d",-1,now())
	Response.Cookies("USERTYPE").Expires = DateAdd("d",-1,now())
	Response.Cookies("FIRSTNAME").Expires = DateAdd("d",-1,now())
	Response.Cookies("USERID").Expires = DateAdd("d",-1,now())
	Response.write "2"
	Response.End()
Else 
	Response.Write "1"
	Response.End()
End if

%>s