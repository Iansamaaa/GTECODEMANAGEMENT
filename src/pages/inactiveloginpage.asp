<!DOCTYPE html>
<html lang="en">
  <head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <meta name="description" content="">
    <meta name="author" content="">
    <title>Code Management System</title>
    <link rel="SHORTCUT ICON" href="Index/css/img03.ico" type="image/x-icon">

    <!--DataTables JS JSON-->

    <script src="../Js/plugins/jquery-3.2.1.min.js"></script>
    <script src='..\Js\members_func\members_edit_triggers.js'>
    </script>
    <script src='..\Js\members_func\inmembersOverride.js'>
    </script>
    <script src='..\Js\members_func\members_add_triggers.js'>
    </script>
    <script src='..\Js\notification\notification.js'></script>
    <script src='..\Js\members_func\membersreactivate.js'
>  </script>

   <!-- FILES INCLUDED FOR BUTTONS -->
<!-- FILES INCLUDED FOR TABLES -->

<!-- JQUERY -->
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


<!-- TOAST FILES -->
<link href="../Js/plugins/toastr/build/toastr.min.css" rel="stylesheet"/>
<script src="../Js/plugins/toastr/build/toastr.min.js"></script>
<script src="../Js/members_func/toast_members.js"></script>

<!-- SESSIONS -->
<script src="../Js/sessions/sessions.pages.js"></script>

<!-- LOADINGPLUGINS -->
    <script src="../Js/plugins/nprogress-master/nprogress.js"></script>
    <link rel="stylesheet" href="../Js/plugins/nprogress-master/nprogress.css">
</head>
  <body class="fixed-nav" id="page-top">
    <!-- Modal Style -->
    <link rel="stylesheet" href='pagedesigns\css\externalfont.css'/>
    <link rel="stylesheet" href='pagedesigns\css\modalstyle.css' />

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
      <a class="navbar-brand" href="homepage.asp"><i class="fa fa-television" aria-hidden="true"></i> Code Management System</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav navbar-sidenav">
              <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Codes">
            <a id=" cde" class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseComponents" aria-expanded="false">
              <i class="fa fa-code" aria-hidden="true"></i>
              <span class="nav-link-text">
                Codes</span>
            </a>
            <ul class="sidenav-second-level collapse" id="collapseComponents">
              <li>
                <a href="homepage.asp" class="nav-item active">&nbsp;View all Codes</a>
              </li>
                 <li>
                <a href="language.a.asp" class="nav-item active">&nbsp;Languages</a>
              </li>
            </ul>
          </li>
          <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Members">
            <a id="mems" class="nav-link nav-link-collapse" data-toggle="collapse" href="#collapseMultimember" aria-expanded="true">
              <i class="fa fa-users" aria-hidden="true"></i>
              <span class="nav-link-text">
                Members</span>
            </a>
            <ul class="sidenav-second-level collapse show" id="collapseMultimember">
              <li>
                <a href="loginpage.asp">Active Members</a>
              </li>
              <li class="active">
                <a href="inactiveloginpage.asp">Inactive Members</a>
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
            <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseMulti">
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
            <a class="nav-link" href="#" id="cookieValue">
              <i  class="fa fa-user-o" aria-hidden="true"></i></i>
              <%  fname=Request.Cookies("USERNAME")
                response.write(fname) %></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="modal" data-target="#exampleModal">
              <i class="fa fa-fw fa-sign-out"></i>
              Logout</a>
          </li>
        </ul> <!--End of UL-->
      </div>
    </nav>
    <div class="content-wrapper py-3"><!--Start of the Content-->
      <div class="container-fluid" id="CONTAINER3">
        <!-- Example Tables Card -->
        <div class="card mb-3" id="tablecardsmembersinactive" style="display:none">
        <div class="card-header gray"><h3><i class="fa fa-users" aria-hidden="true"></i>Inactive Members</h3>
          </div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="memberinactiveTable"  width="inherit" cellspacing="0">
                <thead>
                  <tr>
                    <th></th>
                    <th></th>
                    <th width="20%">UserName</th>
                    <th width="20%">First Name</th>
                    <th width="25%">Last Name</th>
                   <th width="20%">Type</th>
                  </tr>
                </thead>

              </table>
            </div>
          </div>
          <div class="card-footer small text-muted">
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

    <!--Edit Modal-->
<div id="editModal" class="modal fade editsModal editModal " role="dialog" >

  <div class="modal-dialog modalSIZE">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header modal-backgroundHeader modal-header-height" >
          <h5 class="modal-title ">Edit Member</h5>
      </div>
      <div class="modal-body modal-dialog-background">
          <input disabled  type="text" class="form-control inputModalMarginTop inputModalWidth style_prevu_kit_input"  name="UserName" id="usern"    placeholder="UserName"></input>

          <input  type="text" class="form-control inputModalMarginTop inputModalWidth style_prevu_kit_input" align-self="middle" name="FirstName" id="firstn"   placeholder="Firstname"></input>

          <input   type="text" class="form-control inputModalMarginTop inputModalWidth style_prevu_kit_input"  name="LastName" id="lastn"   placeholder="LastName"></input>

      </div>
      <div class="modal-footer modal-backgroundHeader modal-footer-height ">
        <Button id="modalBan" type="submit" class="btn fa fa-ban animationButton style_prevu_kit" aria-hidden="true" data-dismiss="modal">Cancel</Button>
          <Button id="modalSubmit" type="submit" class="btn fa fa-check animationButton style_prevu_kit submitMargin modalSubmit" aria-hidden="true">Confirm</Button>
      </div>
    </div>

  </div>
</div>

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

<!--"REMOVEMODAL"-->
<div id="ReactivateModal" class="modal fade ReactivateModal editsModal " role="dialog" >
<div class="modal-dialog modalSIZE">
<!-- Modal content-->
<div class="modal-content">
  <div class="modal-header modal-backgroundHeader modal-header-height" >
      <h5 class="modal-title">Reactivating Member</h5>
  </div>
  <div class="modal-body">
    <input type="text" class="form-control" id="usntor" style="display:none">
    <h3> Do you wish to Reactivate this member? </h3>
  </div>
  <div class="modal-footer modal-backgroundHeader modal-footer-height ">
    <Button id="modalBan" type="submit" class="btn fa fa-ban animationButton style_prevu_kit" aria-hidden="true" data-dismiss="modal">Cancel</Button>
      <Button id="modalYESreactivate" type="submit" class="btn fa fa-check animationButton modalYESreactivate style_prevu_kit submitMargin" aria-hidden="true">Confirm</Button>

  </div>
</div>

</div>
</div>
<!-- END OF REMOVE MODAL -->

<!-- END OF MODALS -->

    <!-- Bootstrap core JavaScript -->
    <script src='pagedesigns\vendor\jquery\jquery.min.js'
></script>
    <script src='pagedesigns\vendor\popper\popper.min.js'
></script>
    <script src='pagedesigns\vendor\bootstrap\js\bootstrap.min.js'
></script>

    <!-- Plugin JavaScript -->
    <script src='pagedesigns\vendor\jquery-easing\jquery.easing.min.js'
></script>
    <script src='pagedesigns\vendor\datatables\jquery.dataTables.js'
></script>
    <script src='pagedesigns\vendor\datatables\dataTables.bootstrap4.js'
></script>

    <!-- Custom scripts for this template -->
    <script src='pagedesigns\js\sb-admin.min.js'
></script>




  </body>

</html>
