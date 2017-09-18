<%
	'number of data u want to display
   pageSize = 15
   
   if Request("numpage") <> "" then
      pageSize = cdbl(Request("numpage"))
   end if
   
   if(len(Request("page"))=0)then
      currentPage = 1
   else
      currentPage = cdbl(Request("page"))
   end if

   If Not IsNumeric (currentPage) Then currentpage = 1
   If currentPage < 1 Then currentPage = 1 

   start = ((currentPage - 1) * pageSize)
   If start < 0 Then start = 0 
%>
