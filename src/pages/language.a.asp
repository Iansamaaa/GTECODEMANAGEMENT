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
    <script type= "text/javascript" src="../Js/UserCodesJs/addlanguage.js"></script>
    <script type= "text/javascript" src="../Js/langjs/langremove.js"></script>


    <!-- PLUGINS -->
    <script src="../Js/plugins/nprogress-master/nprogress.js"></script>
    <link rel="stylesheet" href="../Js/plugins/nprogress-master/nprogress.css">
      <script src="../Js/plugins/moment.js"></script>




    <!-- JS -->
    <script src="../Js/UserCodesJs/language.js"></script>
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
              <li>
                <a href="homepage.asp" class="nav-item active">&nbsp;View all Codes</a>
              </li>
                 <li class="active">
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

    <div class="content-wrapper py-3" style="width:inherit;"><!--Start of the Content-->
      <div class="container-fluid">
        <!-- Example Tables Card -->
       <center><div class="card mb-4" style="display:none;" id="tablecard">
          <div class="card-header blue" align="left"><button type="submit" class="btn btn-primary btn-md" data-toggle="modal" data-target="#addModal1" title="Add codes"><i class="fa fa-plus" aria-hidden="true"></i> Language</button>
          </div>
          <div class="card-body" id="TableBODY" >
            <div class="table-responsive">
              <table class="table table-bordered" width="inherit" id="dataTable" cellspacing="0">
                <thead>
                  <tr>
                    <th ></th>
                    <th >ID</th>
                    <th >Language</th>
                    <th width="120px">Added By</th>
                  </tr>
                </thead>
              </table>
            </div>
          </div>
          <div class="card-footer small text-muted">
            Made by #GTE OJT
          </div>
        </div></center>

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
       <div class="modal fade" id="addModal1" tabindex="-1" role="dialog" aria-labelledby="addModallabel1" aria-hidden="true">
      <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5>Add Language</h5>
          </div>
          <div class="modal-body">
          <input type="text" class="form-control" id="langlang" placeholder="Enter Language" width="80px" maxlength="10">
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
            <button type="button" class="btn btn-primary" id="addLANG">Add</button>
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
            <h5 class="modal-title" id="exampleModalLabel">Delete Language</h5>

          </div>
          <div class="modal-body">
            Are you sure you want to delete Record?

          <form class="form-inline">
          <input type="text" class="form-control" id="IDrecord" style="display:none">
          </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
            <button type="submit" class="btn btn-primary" id="btnREMOVElang">Remove</button>
          </div>
        </div>
      </div>
    </div>
    <!-- END OF Delete MODAL -->
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
