<!DOCTYPE html>
<html lang="en">
  <head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!--#include file='../connections/dsn.asp'-->
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Code Management System</title>
    <link rel="SHORTCUT ICON" href="Index/css/img03.ico" type="image/x-icon">
    <!-- FILES INCLUDED -->
    <!-- JQUERY -->
    <script src="../Js/plugins/jquery-3.2.1.min.js"></script>

    <!-- Bootstrap core CSS -->
    <link href="pagedesigns/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="pagedesigns/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- Plugin CSS -->
    <link href="pagedesigns/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">


    <!-- Custom styles for this template -->
    <link href="pagedesigns/css/sb-admin.css" rel="stylesheet">
    <link href="pagedesigns/css/buttons.css" rel="stylesheet">

    <!-- TableSizeandContentsIzes -->
    <link href="pagedesigns/css/tablesizes.css" rel="stylesheet">

    <!-- SESSIONS -->
    <script src="../Js/sessions/sessions.pages.js"></script>



    <!-- TOAST FILES -->
    <link href="../Js/plugins/toastr/build/toastr.min.css" rel="stylesheet"/>
    <script src="../Js/plugins/toastr/build/toastr.min.js"></script>
    <script src="../Js/members_func/toast_members.js"></script>

    <!-- TRIGGERS -->
    <script type= "text/javascript" src="../Js/CodesJs/codeaddjs.js"></script>
    <script type= "text/javascript" src="../Js/CodesJs/coderemove.js"></script>
    <script type= "text/javascript" src="../Js/CodesJs/codeview.js"></script>
    <script type= "text/javascript" src="../Js/CodesJs/codeedit.js"></script>

    <!-- PLUGINS -->
    <script src="../Js/plugins/nprogress-master/nprogress.js"></script>
    <link rel="stylesheet" href="../Js/plugins/nprogress-master/nprogress.css">
      <script src="../Js/plugins/moment.js"></script>




    <!-- JS -->
    <script src="../Js/CodesJs/codesview.js"></script>
  </head>

  <body class="fixed-nav" id="page-top">

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
      <a class="navbar-brand" href="homepage.asp"><i class="fa fa-television" aria-hidden="true"></i> Code Management System</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav navbar-sidenav">
             <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Codes">
            <a id=" cde" class="nav-link nav-link-collapse" data-toggle="collapse" href="#collapseComponents" aria-expanded="true">
              <i class="fa fa-code" aria-hidden="true"></i>
              <span class="nav-link-text">
                Codes</span>
            </a>
            <ul class="sidenav-second-level collapse show" id="collapseComponents">
              <li class="active">
                <a href="homepage.asp" class="nav-item active">&nbsp;View all Codes</a>
              </li>
                 <li>
                <a href="language.a.asp" class="nav-item active">&nbsp;Languages</a>
              </li>
            </ul>
          </li>
          <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Members">
            <a id="mems" class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseMultimember">
              <i class="fa fa-users" aria-hidden="true"></i>
              <span class="nav-link-text">
                Members</span>
            </a>
            <ul class="sidenav-second-level collapse" id="collapseMultimember">
              <li>
                <a href="loginpage.asp">Active Members</a>
              </li>
              <li>
                <a href="inactiveloginpage.asp">Inactive   Members</a>
              </li>
            </ul>
          </li>
           <li class="nav-item " data-toggle="tooltip" data-placement="right" title="Activity Logs">
            <a class="nav-link" href="activitylogs.asp">
              <i class="fa fa-file-text-o" aria-hidden="true"></i>
              <span class="nav-link-text">
                Activity Logs</span>
            </a>
          </li>
          <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Settings">
            <a id="settingst" class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseMulti">
              <i class="fa fa-cog" aria-hidden="true"></i>
              <span class="nav-link-text">
                Settings</span>
            </a>
            <ul class="sidenav-second-level collapse" id="collapseMulti">
              <li>
                <a href="settingschangepass.asp">Change Password</a>
              </li>
                <li>
                <a href="DeactivateAcc.asp">Deactivate Account</a>
              </li>
            </ul>
          </li>
        </ul>
        <ul class="navbar-nav sidenav-toggler">
          <li class="nav-item">
            <a class="nav-link text-center" id="sidenavToggler">
              <i class="fa fa-fw fa-angle-left"></i>
            </a>
          </li>
        </ul>
        <ul class="navbar-nav ml-auto"><!--Start of UL-->
        <li class="nav-item">
            <a class="nav-link" href="#">
              <i class="fa fa-user-o" aria-hidden="true"></i>
              <% fname=Request.Cookies("USERNAME")
                response.write(fname) %></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="modal" data-target="#exampleModal">
              <i class="fa fa-fw fa-sign-out"></i>
              Logout</a>
          </li>
          </ul>
      </div>
    </nav>


    <!-- END OF NAVIGATION -->

    <div class="content-wrapper py-3" id="WRAPPER"><!--Start of the Content-->
      <div class="container-fluid" id="CONTAINER">
        <!-- Example Tables Card -->
        <div class="card mb-4" style="display:none" id="tablecard">
         <div class="card-header blue" ><button type="submit" class="btn btn-primary btn-md" data-toggle="modal" data-target="#addModal1" title="Add codes"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;Codes</button>&nbsp;
            <button type="submit" class="btn btn-primary btn-md" id="refreshtab"><i class="fa fa-refresh" aria-hidden="true"></i>&nbsp;Refresh</button>
          </div>
          <div class="card-body" id="TableBODY" >
            <div class="table-responsive">
              <table class="table table-bordered" width="100%" id="dataTable" cellspacing="0">
                <thead>
                  <tr>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th>Code # </th>
                    <th>Code Type</th>
                    <th>Function Name</th>
                    <th>Version #</th>
                    <th>Date Added</th>
                    <th>Added By</th>
                    <th>Date Updated</th>
                    <th>Updated By</th>
                    <th></th>

                  </tr>
                </thead>
              </table>
            </div>
          </div>
          <div class="card-footer small text-muted">
            Made by #GTE OJT
          </div>
        </div>

      </div>
      <!-- /.container-fluid -->

    </div>
    <!-- /.content-wrapper -->

    <!-- Scroll to Top Button -->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fa fa-angle-up"></i>
    </a>

<!--                                                       MODALS                                              -->
    <!-- Logout Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          </div>
          <div class="modal-body">
            Select "Logout" below if you are ready to end your current session.
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
            <form action="Logout.asp">
            <button type="submit" class="btn btn-primary">Logout</button>
            </form>
          </div>
        </div>
      </div>
    </div>
    <!-- END OF LOGOUT MODAL -->
     <!-- ADD MODAL -->
    <div class="modal fade" id="addModal1" tabindex="-1" role="dialog" aria-labelledby="addModalLabel1" aria-hidden="true">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Add Codes</h5>
          </div>
          <div class="modal-body">

          <div class="container">

          <form class="form-inline">

          <div class="form-group">

          <select type="text" class="form-control smallInput" id="ctype" Placeholder="Code Type">
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

            do while not dr_list.eof%>
            <option value="<%= dr_list.Fields(0)%>"><%= dr_list.Fields(0)%></option>
            <% dr_list.MoveNext
            Loop
            dr_list.Close
            set cmd_list = nothing
            set strSQL_list = nothing %>
          </select>&nbsp;
          </div>
          <div class="form-group">
          <input type="text" class="form-control smallInput" id="fname" placeholder="Function Name" maxlength="15">&nbsp;
          </div>
          <div class="form-group">
          <input type="text" class="form-control smallInput" style="width:80px;"  id="version" placeholder="Version" value="1.0" disabled>
          </div>
          </form>
          <br>
          <form class="form-horizontal">
          <div class="form-group">
          <textarea class="form-control codeTSA" id="codedescc" Placeholder="Code Description"></textarea><br>
          <textarea class="form-control codeTS" id="codedesc" Placeholder="Code Content"></textarea>
          </div>

          <div class="form-group col-xs-2">
          <input class="form-control smallInput" id="added" Placeholder="Added By" style="display:none" value="<% fname=Request.Cookies("USERNAME")
                response.write(fname) %>">


          </input>
          </div>

          </form>

          </div>
          </div>
          <!-- HAYS -->
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
            <button type="submit" class="btn btn-primary" id="btnAdd">Add</button>
          </div>
        </div>
      </div>
    </div>
    <!-- END OF ADD MODAL -->

    <!-- Delete Modal -->
    <div class="modal fade" id="removeModal" tabindex="-1" role="dialog" aria-labelledby="removeModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Delete Code?</h5>

          </div>
          <div class="modal-body">
            Are you sure you want to delete Record?

          <form class="form-inline">
          <input type="text" class="form-control" id="IDrecord" style="display:none">
          </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
            <button type="submit" class="btn btn-primary" id="btnREMOVE">Remove</button>
          </div>
        </div>
      </div>
    </div>
    <!-- END OF Delete MODAL -->

      <!-- View Modal -->
    <div class="modal fade" id="viewModal" tabindex="-1" role="dialog" aria-labelledby="viewModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title" id="FunctionNameView"></h4>
            <h4 id="current_version"></h4>
          </div>
          <div class="modal-body">
            <textarea class="form-control desc" id="codeTA" style="height:300px;" Placeholder="Code Description" disabled><p><label id="descview"></label></p></textarea>
            <textarea class="form-control " id="codedescript" style="height:110px; margin-top:5px;" Placeholder="Code Description" disabled></textarea>
          <form class="form-inline">
          <input type="text" class="form-control" id="viewC" style="display:none">
          </form>
          </div>
          <div class="modal-footer">
           <p style="position:absolute;left:40px;display:inline-block;font-size:15px;">Code Type:<p style="position:absolute;left:120px;font-size:12px;font-weight:bold;" id="CodeTypeView"></p></p>
           <button type="button" class="btn btn-secondary" id="viewreleasenotes">Release Notes</button>
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
          </div>
        </div>
      </div>
    </div>
    <!-- END OF View MODAL -->

    <!-- Edit Modal MODAL -->
    <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Edit Codes</h5>
          </div>
          <div class="modal-body">

          <div class="container">

          <form class="form-inline">
          <input type="text" class="form-control" id="viewED" placeholder="ID" style="display:none">
          <textarea class="form-control" id="rnrnrn"  placeholder="RELEASENOTES" style="display:none"></textarea>
          <input type="text" class="form-control" id="addbyy" placeholder="ADDBY" style="display:none">
          <input type="text" class="form-control" id="uppbyy" placeholder="UPBY" style="display:none">
          <input type="text" class="form-control" id="dtup" placeholder="DATEUP" style="display:none">
          <input type="text" class="form-control" id="dtad"  placeholder="ADDDATE" style="display:none">
           <input type="text" class="form-control" id="pdesc"  placeholder="PREVDESC" style="display:none">
            <input type="text" class="form-control" id="pcont"  placeholder="PREVCONT" style="display:none">
             <input type="text" class="form-control" id="pfunc"  placeholder="PREVFUNC" style="display:none">
          <div class="form-group">
          <input type="text" class="form-control" id="edit_ctype" Placeholder="Code Type" disabled>&nbsp;
          </div>
          <div class="form-group">
          <input type="text" class="form-control" id="edit_fname" placeholder="Function Name" maxlength="15">&nbsp;
          </div>
          <div class="form-group">
          <input type="text" class="form-control" style="width:70px;" id="edit_version" placeholder="Version" disabled>
          </div>
          <div class="form-group"><br>
          <input type="text" class="form-control" style="width:70px;" id="next_version" placeholder="Next Version" disabled>
          </div>
          </form>
          <br>
          <form class="form-horizontal">
          <div class="form-group">
          <textarea class="form-control codeTSA" id="edit_desc" Placeholder="Code Description"></textarea><br>
          <textarea class="form-control codeTS" id="edit_codedesc" Placeholder="Code Script"></textarea>
          </div>
          <div class="form-group col-xs-2">
          <input class="form-control smallInput" id="edited" Placeholder="Edited By" style="display:none" value="<%fname=Request.Cookies("USERNAME")
                response.write(fname)%>">
          </input>
          </div>
          </form>



          </div>
          </div>
          <!-- HAYS -->
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
            <button type="submit" class="btn btn-primary" id="btnEDIT">Save</button>
          </div>
        </div>
      </div>
    </div>
    <!-- END OF EDIT MODAL -->

<!-- ADVANCE SEARCH MODALS -->
       <div class="modal fade" id="sModal" tabindex="-1" role="dialog" aria-labelledby="sModallabel" aria-hidden="true">
      <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5>Advance Search</h5>
          </div>
          <div class="modal-body">
          <input type="text" class="form-control topff" id="sctype" placeholder="Code Type..." width="80px" maxlength="10">
          <input type="text" class="form-control topff" id="sfuncn" placeholder="Function Name..." width="80px" maxlength="10">
          <input type="text" class="form-control topff" id="sdadd" placeholder="Date Added..." width="80px">
          <input type="text" class="form-control topff" id="saddb" placeholder="Added by..." width="80px" maxlength="10">
           <input type="text" class="form-control topff" id="supb" placeholder="Updated by..." width="80px" maxlength="10">
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
            <button type="button" class="btn btn-primary" id="aSEARCH">Search</button>
          </div>
        </div>
      </div>
    </div>
<!-- END A SEARCH MODALS -->

<!-- View Release notes -->
       <div class="modal fade" id="vrnModal" tabindex="-1" role="dialog" aria-labelledby="vrnModallabel" aria-hidden="true">
      <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5>Release Notes</h5>
          </div>
          <div class="modal-body">
          <textarea class="form-control codeTS" id="viewrnc" Placeholder="Release notes" disabled></textarea>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
          </div>
        </div>
      </div>
    </div>
<!-- End releasenotes modal -->

<!-- Append Release notes -->
       <div class="modal fade" id="rnaModal" tabindex="-1" role="dialog" aria-labelledby="rnModallabel" aria-hidden="true">
      <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5>Release Notes</h5>
          </div>
          <div class="modal-body">
          <textarea class="form-control codeTS" id="rna" Placeholder="Release notes"></textarea>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" id="rnacancel" data-dismiss="modal">Cancel</button>
            <button type="button" class="btn btn-primary" id="wp">Add</button>
          </div>
        </div>
      </div>
    </div>
<!-- End releasenotes modal -->


<!-- Add Release notes -->
       <div class="modal fade" id="rnModal" tabindex="-1" role="dialog" aria-labelledby="rnModallabel" aria-hidden="true">
      <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5>Release Notes</h5>
          </div>
          <div class="modal-body">
          <textarea class="form-control codeTS" id="rnc" Placeholder="Release notes"></textarea>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" id="rncancel" data-dismiss="modal">Cancel</button>
            <button type="button" class="btn btn-primary" id="gg">Add</button>
          </div>
        </div>
      </div>
    </div>
<!-- End releasenotes modal -->



<!--                                                END OF MODALS                                              -->

    <!-- Bootstrap core JavaScript -->
    <script src="pagedesigns/vendor/jquery/jquery.min.js"></script>
    <script src="pagedesigns/vendor/popper/popper.min.js"></script>
    <script src="pagedesigns/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="pagedesigns/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="pagedesigns/vendor/datatables/jquery.dataTables.js"></script>
    <script src="pagedesigns/vendor/datatables/dataTables.bootstrap4.js"></script>

    <!-- Custom scripts for this template -->
    <script src="pagedesigns/js/sb-admin.min.js"></script>


  </body>

</html>
