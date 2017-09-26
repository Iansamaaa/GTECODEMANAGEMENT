<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Code Management System</title>
  <link rel="SHORTCUT ICON" href="css/img03.ico" type="image/x-icon">



      <style>
      /* NOTE: The styles were added inline because Prefixfree needs access to your styles and they must be inlined if they are on local disk! */
      @import url(https://fonts.googleapis.com/css?family=Exo:100,200,400);
	  @import url(https://fonts.googleapis.com/css?family=Source+Sans+Pro:700,400,300);

body{
	margin: 0;
	padding: 0;
	background: #fff;

	color: #fff;
	font-family: Arial;
	font-size: 12px;
}

.body{
	position: absolute;
	top: -20px;
	left: -20px;
	right: -40px;
	bottom: -40px;
	width: auto;
	height: auto;
	background-image: url(css/img01.jpg);
	background-size: cover;
	-webkit-filter: blur(5px);
	z-index: 0;
}

.grad{
	position: absolute;
	top: -20px;
	left: -20px;
	right: -40px;
	bottom: -40px;
	width: auto;
	height: auto;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(0,0,0,0)), color-stop(100%,rgba(0,0,0,0.65))); /* Chrome,Safari4+ */
	z-index: 1;
	opacity: 0.7;
}

.header{
	position: absolute;
	top: calc(45% - 35px);
	left: calc(35% - 255px);
	z-index: 2;
}

.header div{
	float: left;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 35px;
	font-weight: 200;
}

.header div span{
	color: #5379fa !important;
}

.login{
	position: absolute;
	top: calc(50% - 75px);
	left: calc(50% - 50px);
	height: 150px;
	width: 350px;
	padding: 10px;
	z-index: 2;
}

.login input[type=text]{
	width: 250px;
	height: 30px;
	background: transparent;
	border: 1px solid rgba(255,255,255,0.6);
	border-radius: 2px;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 4px;
}

.login input[type=password]{
	width: 250px;
	height: 30px;
	background: transparent;
	border: 1px solid rgba(255,255,255,0.6);
	border-radius: 2px;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 4px;
	margin-top: 10px;
}

.login input[type=button]{
	width: 260px;
	height: 35px;
	background: #fff;
	border: 1px solid #fff;
	cursor: pointer;
	border-radius: 2px;
	color: #a18d6c;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 6px;
	margin-top: 10px;
}

.login input[type=button]:hover{
	opacity: 0.8;
}

.login input[type=button]:active{
	opacity: 0.6;
}

.login input[type=text]:focus{
	outline: none;
	border: 1px solid rgba(255,255,255,0.9);
}

.login input[type=password]:focus{
	outline: none;
	border: 1px solid rgba(255,255,255,0.9);
}

.login input[type=button]:focus{
	outline: none;
}

::-webkit-input-placeholder{
   color: rgba(255,255,255,0.6);
}

::-moz-input-placeholder{
   color: rgba(255,255,255,0.6);
}
    </style>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
   <!-- JQUERY -->
    <script src="../../Js/plugins/jquery-3.2.1.min.js"></script>

    <!-- TRIGGERS -->
    <script src="js/login/triggers.login.js"></script>

    <!-- SESSIONS -->
    <script src="../../Js/sessions/sessions.js"></script>

    <!-- TOAST -->
    <script src=../../Js/plugins/toastr/build/toastr.min.js></script>
    <link rel="stylesheet" href="../../Js/plugins/toastr/build/toastr.min.css">
    <script src=../../Js/members_func/toast_members.js></script>

    <!-- Plugins -->
    <script src="../../Js/plugins/nprogress-master/nprogress.js"></script>
    <link rel="stylesheet" href="../../Js/plugins/nprogress-master/nprogress.css">



</head>

<body>
  <div class="body"></div>
		<div class="grad"></div>
		<div class="header">
			<div>Code&nbsp;<br><span>Management</span><br>System</div>
		</div>

		<div class="login">
				<input type="text" maxlength="15"  class="usernameinput" onkeyup="this.value = this.value.replace(/[^A-Za-z0-9]  /, '')"  onkeypress="this.value = this.value.replace(/[^A-Za-z0-9]/, '')" placeholder="username" name="user" id="username"><br>
				<input type="password" placeholder="password" name="password" id="password"><br>
				<input type="button" value="Login" id="subINDEX">
		</div>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>


</body>
</html>
