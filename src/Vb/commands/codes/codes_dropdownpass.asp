<%
Dim cmd_list, dr_list, strSQL_list
  'Create Objects
  Set cmd_list= Server.CreateObject("ADODB.Command")
  cmd_list.ActiveConnection =  codemngt

  'QUERY COMMAND
  strSQL_list = "SELECT LANGUAGE FROM code_language_reference"
  cmd_list.CommandText = strSQL_list
  cmd_list.Prepared = True

  'EXECUTE COMMAND
  Set dr_list= cmd_list.Execute()


%>
