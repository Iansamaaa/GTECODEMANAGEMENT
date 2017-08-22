<!DOCTYPE html>
<html lang="en">

  <head>
  <!--#include file="../Vb/commands/members.view.asp"-->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <meta name="description" content="">
    <meta name="author" content="">
    <title>Code Management System</title>

    <!-- JQUERY -->
    <script src="../Js/jquery-3.2.1.min.js"></script>
    <!-- FILES INCLUDED FOR BUTTONS -->
<script src='..\js\ModalJS\ModalViewEdit.js'></script>

<script src='..\js\members_func\members_edit_triggers.js'></script>
<script src='..\js\members_func\members_add_triggers.js'></script>

    <!-- Bootstrap core CSS -->
    <link href="../plugins/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href='..\plugins\font-awesome-4.7.0\css\font-awesome.min.css'
    rel="stylesheet" type="text/css">
    <link rel="stylesheet" href='..\css\externalfont.css' />
    <!-- Plugin CSS -->
    <link href="../plugins/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../plugins/css/sb-admin.css" rel="stylesheet">

    <!-- TOAST FILES -->
    <link href="../Js/toastr/build/toastr.min.css" rel="stylesheet"/>
    <script src="../Js/toastr/build/toastr.min.js"></script>
    <script src="../Js/members_func/toast_members.js"></script>


  </head>
  <body class="fixed-nav" id="page-top">

    <script src='..\js\members_func\members_add_triggers.js'></script>
    <!-- Modal Style -->
    <link href='..\plugins\font-awesome-4.7.0\css\font-awesome.css'
    rel="stylesheet" type="text/css">
    <link rel="stylesheet" href='..\css\externalfont.css' />
    <link rel="stylesheet" href='..\css\modalstyle.css' />
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
      <a class="navbar-brand" href="#"><i class="fa fa-television" aria-hidden="true"></i> Code Management System</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav navbar-sidenav">
          <li class="nav-item " data-toggle="tooltip" data-placement="right" title="Codes">
            <a class="nav-link" href="homepage.asp">
              <i class="fa fa-code" aria-hidden="true"></i>
              <span class="nav-link-text">
                Codes</span>
            </a>
          </li>
          <li class="nav-item active" data-toggle="tooltip" data-placement="right" title="Members">
            <a class="nav-link" href="loginpage.asp">
              <i class="fa fa-users" aria-hidden="true"></i>
              <span class="nav-link-text">
                Members</span>
            </a>
          </li>
          <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Settings">
            <a class="nav-link" href="#">
              <i class="fa fa-cog" aria-hidden="true"></i>
              <span class="nav-link-text">
               Settings</span>
            </a>
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
            <a class="nav-link" data-toggle="modal" data-target="#exampleModal">
              <i class="fa fa-fw fa-sign-out"></i>
              Logout</a>
          </li>
        </ul> <!--End of UL-->
      </div>
    </nav>

    <div class="content-wrapper py-3"><!--Start of the Content-->
      <div class="container-fluid">
        <!-- Example Tables Card -->
        <div class="card mb-3">
          <div class="card-header"><button id="AddMemberFunc" type="submit" class="btn btn-default btn-xs" data-toggle="modal" data-target="#AddMemberModal" title="Add codes"><i class="fa fa-plus" aria-hidden="true"></i>Add Members</button>
          </div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" width="100%" id="dataTable" cellspacing="0">
                <thead>
                  <tr>
                    <th>UserName</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Actions</th>
                  </tr>
                </thead>
                <tbody>
                 <%
                  While not dr.EOF
                 %>
                <tr>
                <td><%=dr("Username")%></td>
                <td><%=dr("FirstName")%></td>
                <td><%=dr("LastName")%></td>
                <td>
        <button type="submit" class="btn btn-default editModalButton fa fa-pencil-square-o" data-toggle="modal" data-target="#editModal"></button>

                </td>
                </tr>
                <%
                dr.Movenext()
                Wend
                %>

                <%
                dr.Close()
                Set dr = nothing
                Set cmd = nothing
                %>
                </tbody>
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
    <!--Edit Modal -->
<div id="editModal" class="modal fade editModal " role="dialog" >
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header modal-backgroundHeader modal-header-height" >
          <h5 class="modal-title textMarginLeft"><Button id="enableModalEdit" type="submit" class=" btn btn-default editbuttonMargin fa fa-pencil-square-o" aria-hidden="true"></Button></h5>
      </div>
      <div class="modal-body modal-dialog-background">
          <input disabled  type="text" class="form-control inputModalMarginTop inputModalWidth style_prevu_kit_input"  name="UserName" id="usern"   value="<%=Request("Username")%>" placeholder="UserName"></input>

          <input disabled type="text" class="form-control inputModalMarginTop inputModalWidth style_prevu_kit_input" align-self="middle" name="FirstName" id="firstn"  value="<%=Request("FirstName")%>" placeholder="Firstname"></input>

          <input disabled  type="text" class="form-control inputModalMarginTop inputModalWidth style_prevu_kit_input"  name="LastName" id="lastn"  value="<%=Request("LastName")%>" placeholder="LastName"></input>

      </div>
      <div class="modal-footer modal-backgroundHeader modal-footer-height ">
        <Button id="modalBan" type="submit" class="btn fa fa-ban animationButton style_prevu_kit" aria-hidden="true"></Button>
          <Button id="modalSubmit" type="submit" class="btn fa fa-check animationButton style_prevu_kit submitMargin" aria-hidden="true"></Button>
      </div>
    </div>

  </div>
</div>

<!--"ADD MODAL"-->
<div id="AddMemberModal" class="modal fade AddMemberModal " role="dialog" >
<div class="modal-dialog">
<!-- Modal content-->
<div class="modal-content">
  <div class="modal-header modal-backgroundHeader modal-header-height" >
      <h5 class="modal-title textMarginLeft">Input Member Data</h5>
  </div>
  <div class="modal-body modal-dialog-background">
      <input  type="text" class="form-control inputModalMarginTop inputModalWidth style_prevu_kit_input"  name="UserName" id="usn"  placeholder="UserName"></input>

      <input  type="text" class="form-control inputModalMarginTop inputModalWidth style_prevu_kit_input" align-self="middle" name="FirstName" id="frstn" placeholder="Firstname"></input>

      <input  type="text" class="form-control inputModalMarginTop inputModalWidth style_prevu_kit_input" name="LastName" id="lstn" " placeholder="LastName"></input>

      <input  type="text" class="form-control inputModalMarginTop inputModalWidth style_prevu_kit_input" name="Password" id="pwd" " placeholder="Password"></input>

  </div>
  <div class="modal-footer modal-backgroundHeader modal-footer-height ">
    <Button id="modalClearMem" type="submit" class="btn fa fa-ban animationButton style_prevu_kit" aria-hidden="true"></Button>
      <Button id="modalSubmitMem" type="submit" class="btn fa fa-check animationButton style_prevu_kit submitMargin" aria-hidden="true"></Button>
  </div>
</div>

</div>
</div>

    <!-- Bootstrap core JavaScript -->
    <script src="../plugins/vendor/jquery/jquery.min.js"></script>
    <script src="../plugins/vendor/popper/popper.min.js"></script>
    <script src="../plugins/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="../plugins/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="../plugins/vendor/chart.js/Chart.min.js"></script>
    <script src="../plugins/vendor/datatables/jquery.dataTables.js"></script>
    <script src="../plugins/vendor/datatables/dataTables.bootstrap4.js"></script>

    <!-- Custom scripts for this template -->
    <script src="../plugins/js/sb-admin.min.js"></script>
    <script src='..\js\modalEdit.js'></script>




  </body>

</html>
