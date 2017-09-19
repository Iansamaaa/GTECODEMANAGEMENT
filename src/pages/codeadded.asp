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
    <script src="../Js/sessions/usersession.js"></script>

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


    <!-- JS -->
    <script src="../Js/UserCodesJs/addedcodesview.user.js"></script>
  </head>

  <body class="fixed-nav" id="page-top">

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
      <a class="navbar-brand" href="#"><i class="fa fa-television" aria-hidden="true"></i> Code Management System</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav navbar-sidenav">
          <li class="nav-item " data-toggle="tooltip" data-placement="right" title="Settings">
          <a class="nav-link nav-link-collapse" data-toggle="collapse" href="#collapseComponents">
            <i class="fa fa-code " aria-hidden="true"></i>
            <span class="nav-link-text">Codes
              </span>
          </a>
          <ul class="sidenav-second-level" id="collapseComponents">
            <li>
              <a href="homepage.user.asp">View Codes</a>
            </li>
            <li class = "active">
              <a href="codeadded.asp">Added Codes</a>
            </li>
          </ul>
        </li>
           <li class="nav-item " data-toggle="tooltip" data-placement="right" title="Activity Logs">
            <a class="nav-link" href="activitylogs.user.asp">
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
                <a href="settingschangepassuser.asp">Change Password</a>
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
          <div class="card-header white" ><h4><i class="fa fa-plus-square-o" aria-hidden="true"></i>&nbsp;Codes you Added</h4>
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
                    <th>Update By</th>

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
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
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
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">

          <div class="container">

          <form class="form-inline">

          <div class="form-group">
          <input type="text" class="form-control smallInput" id="ctype" Placeholder="Code Type">&nbsp;
          </div>
          <div class="form-group">
          <input type="text" class="form-control smallInput" id="fname" placeholder="Function Name">&nbsp;
          </div>
          <div class="form-group">
          <input type="text" class="form-control smallInput" id="version" placeholder="Version">
          </div>
          </form>
          <br>
          <form class="form-horizontal">
          <div class="form-group">
          <textarea class="form-control codeTS" id="codedesc" Placeholder="Code Description"></textarea>
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
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
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
            <h5 class="modal-title" id="exampleModalLabel">CODE VIEW</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
          <textarea class="form-control" id="codeTA" Placeholder="Code Description" disabled></textarea>

          <form class="form-inline">
          <input type="text" class="form-control" id="viewC" style="display:none">
          </form>
          </div>
          <div class="modal-footer">
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
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">

          <div class="container">

          <form class="form-inline">
          <input type="text" class="form-control" id="viewED" style="display:none">
          <div class="form-group">
          <input type="text" class="form-control" id="edit_ctype" Placeholder="Code Type" disabled>&nbsp;
          </div>
          <div class="form-group">
          <input type="text" class="form-control" id="edit_fname" placeholder="Function Name">&nbsp;
          </div>
          <div class="form-group">
          <input type="text" class="form-control" id="edit_version" placeholder="Version">
          </div>
          </form>
          <br>
          <form class="form-horizontal">
          <div class="form-group">
          <textarea class="form-control codeTS" id="edit_codedesc" Placeholder="Code Description"></textarea>
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
            <button type="submit" class="btn btn-primary" id="btnEDIT">Edit</button>
          </div>
        </div>
      </div>
    </div>
    <!-- END OF EDIT MODAL -->






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
