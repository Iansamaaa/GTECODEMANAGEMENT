<%
sEcho = Cint(Request("sEcho"))
iDisplayLength = Cint(Request("iDisplayLength"))
iDisplayStart = Cint(Request("iDisplayStart"))
sSearch = Request("sSearch")


'SEARCH - here we make the Where clause that will be used in the SQL query. You only put here the fields you want to search
strWhere = " WHERE engine LIKE '%" & sSearch & "%' OR "
    strWhere = strWhere &  " browser LIKE '%" & sSearch & "%' OR "
    strWhere = strWhere &  " platform LIKE '%" & sSearch & "%' OR "
    strWhere = strWhere &  " version LIKE '%" & sSearch & "%' OR "
    strWhere = strWhere &  " grade LIKE '%" & sSearch & "%'"


%>
