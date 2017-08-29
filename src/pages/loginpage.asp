<!DOCTYPE html>
<html lang="en">
  <head>
  <!--#include file='..\Vb\commands\members\members.view.asp'
-->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <meta name="description" content="">
    <meta name="author" content="">
    <title>Code Management System</title>

    <!-- JQUERY -->
    <script src='..\Js\plugins\jquery-3.2.1.min.js'

></script>
   <!-- FILES INCLUDED FOR BUTTONS -->
<script src='..\Js\members_func\ModalJS\ModalViewEdit.js'
></script>
<script src='..\Js\members_func\members_edit_triggers.js'
></script>
<script src='..\Js\members_func\members_add_triggers.js'
></script>
<script src='..\Js\members_func\members_remove_triggers.js'
></script>
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

<!-- TableSizeandContentsIzes -->
<link href="pagedesigns/css/tablesizes.css" rel="stylesheet">


<!-- TOAST FILES -->
<link href="../Js/plugins/toastr/build/toastr.min.css" rel="stylesheet"/>
<script src="../Js/plugins/toastr/build/toastr.min.js"></script>
<script src="../Js/members_func/toast_members.js"></script>

</head>
  <body class="fixed-nav" id="page-top">
    <!-- Modal Style -->
    <link rel="stylesheet" href='pagedesigns\css\externalfont.css'/>
    <link rel="stylesheet" href='pagedesigns\css\modalstyle.css' />

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
            <a class="nav-link" href="#">
              <i class="fa fa-user-o" aria-hidden="true"></i></i>
              <% fname=Request.Cookies("USERNAME")
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
      <div class="container-fluid">
        <!-- Example Tables Card -->
        <div class="card mb-3">
        <div class="card-header blue"><button id="AddMemberFunc" type="submit" class="btn btn-default btn-xs" data-toggle="modal" data-target="#AddMemberModal" title="Add codes"><i class="fa fa-plus" aria-hidden="true"></i>Add Members</button>
          </div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" width="100%" id="dataTable" cellspacing="0">
                <thead>
                  <tr>
                   <th>Actions</th>
                    <th>UserName</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                   
                  </tr>
                </thead>
                <tbody>
                 <%
                  While not dr.EOF
                 %>
                <tr>
                              <td>

        <button type="submit" class="btn btn-default ViewModalButton fa fa-eye" data-toggle="modal" data-target="#ViewModal"></button>
        <button type="submit" class="btn btn-default editModalButton fa fa-pencil-square-o" data-toggle="modal" data-target="#editModal"></button>
   
        <button type="submit" class="btn btn-default RemoveMemberButton fa fa-times" data-toggle="modal" data-target="#RemoveMemberModal"></button>
                </td>
                <td><%=dr("Username")%></td>
                <td><%=dr("FirstName")%></td>
                <td><%=dr("LastName")%></td>
  

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

    <!--Edit Modal-->
<div id="editModal" class="modal fade editsModal editModal " role="dialog" >

  <div class="modal-dialog modalSIZE">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header modal-backgroundHeader modal-header-height" >
          <h5 class="modal-title ">Edit Member</h5>

          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
      </div>
      <div class="modal-body modal-dialog-background">
          <input disabled  type="text" class="form-control inputModalMarginTop inputModalWidth style_prevu_kit_input"  name="UserName" id="usern"   value="<%=Request("Username")%>" placeholder="UserName"></input>

          <input  type="text" class="form-control inputModalMarginTop inputModalWidth style_prevu_kit_input" align-self="middle" name="FirstName" id="firstn"  value="<%=Request("FirstName")%>" placeholder="Firstname"></input>

          <input   type="text" class="form-control inputModalMarginTop inputModalWidth style_prevu_kit_input"  name="LastName" id="lastn"  value="<%=Request("LastName")%>" placeholder="LastName"></input>

      </div>
      <div class="modal-footer modal-backgroundHeader modal-footer-height ">
        <Button id="modalBan" type="submit" class="btn fa fa-ban animationButton style_prevu_kit" aria-hidden="true"></Button>
          <Button id="modalSubmit" type="submit" class="btn fa fa-check animationButton style_prevu_kit submitMargin" aria-hidden="true"></Button>
      </div>
    </div>

  </div>
</div>


<!-- View Modal-->
<div id="ViewModal" class="modal fade editsModal ViewModal " role="dialog" >

  <div class="modal-dialog modalSIZE">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header modal-backgroundHeader modal-header-height" >
        <button type="button" class="btn btn-default close" data-dismiss="modal"></button>
        <h5 class="modal-title">View</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
      </div>
      <div class="modal-body modal-dialog-background">
          <input disabled  type="text" class="form-control inputModalMarginTop inputModalWidth style_prevu_kit_input"  name="UserName" id="usernview"   value="<%=Request("Username")%>" placeholder="UserName"></input>

          <input disabled type="text" class="form-control inputModalMarginTop inputModalWidth style_prevu_kit_input" align-self="middle" name="FirstName" id="firstnview"  value="<%=Request("FirstName")%>" placeholder="Firstname"></input>

          <input disabled  type="text" class="form-control inputModalMarginTop inputModalWidth style_prevu_kit_input"  name="LastName" id="lastnview"  value="<%=Request("LastName")%>" placeholder="LastName"></input>


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

<!--"ADD MODAL"-->
<div id="AddMemberModal" class="modal fade AddMemberModal" role="dialog" > 
<div class="modal-dialog modalSIZE">

<!-- Modal content-->
<div class="modal-content">

  <div class="modal-header modal-backgroundHeader modal-header-height" >
      <h5 class="modal-title textMarginLeft">Input Member Data</h5>
      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
  </div>
  <div class="modal-body modal-dialog-background">

  <div class="container">

  <form class="form-horizontal">

      <div class="form-group">
      <input  type="text" class="form-control inputModalMarginTop inputModalWidth style_prevu_kit_input"  name="UserName" id="usn"  placeholder="UserName"></input>
      </div>

      <div class="form-group">
      <input  type="text" class="form-control inputModalMarginTop inputModalWidth style_prevu_kit_input" align-self="middle" name="FirstName" id="frstn" placeholder="Firstname"></input>
      </div>

      <div class="form-group">
      <input  type="text" class="form-control inputModalMarginTop inputModalWidth style_prevu_kit_input" name="LastName" id="lstn"  placeholder="LastName"></input>
      </div>

      <div class="form-group">
      <input  type="password" class="form-control inputModalMarginTop inputModalWidth style_prevu_kit_input" name="Password" id="pwd"  placeholder="Password"></input>
      </div>

  </form>

  </div>

  </div>

  <div class="modal-footer modal-backgroundHeader modal-footer-height ">
    <Button id="modalClearMem" type="button" class="btn fa fa-ban animationButton style_prevu_kit" aria-hidden="true" data-dismiss="modal"></Button>
      <Button id="modalSubmitMem" type="submit" class="btn fa fa-check animationButton style_prevu_kit submitMargin"></Button>
  </div>

</div>

</div>
</div>
<!-- END OF ADD MODAL -->

<!--"REMOVEMODAL"-->
<div id="RemoveMemberModal" class="modal fade RemoveMemberModal editsModal " role="dialog" >
<div class="modal-dialog modalSIZE">
<!-- Modal content-->
<div class="modal-content">
  <div class="modal-header modal-backgroundHeader modal-header-height" >
      <h5 class="modal-title">Removing Member</h5>
      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
  </div>
  <div class="modal-body">
    <input type="text" class="form-control" id="usntor" style="display:none">
    <h3> Do you wish to remove this member? </h3>
  </div>
  <div class="modal-footer modal-backgroundHeader modal-footer-height ">
      <Button id="modalYESremove" type="submit" class="btn fa fa-check animationButton style_prevu_kit submitMargin" aria-hidden="true"></Button>
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
    <script src='..\Js\members_func\modalmembersEdit.js'
></script>




  </body>

</html>
