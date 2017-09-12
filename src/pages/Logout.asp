<% 
For Each USERNAME in Response.Cookies
    Response.Cookies(USERNAME).Expires = DateAdd("d",-1,now())

Next 		
  Response.Redirect"Index/index.asp"
%>