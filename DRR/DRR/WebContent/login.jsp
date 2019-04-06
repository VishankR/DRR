<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="assets/css/Google-Style-Login.css">
    <link rel="stylesheet" href="assets/css/Navigation-Clean.css">
    <link rel="stylesheet" href="assets/css/Navigation-with-Button.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>

<body>
    <div></div>
    <div>
       <nav class="navbar navbar-default">
    <div class="container">
        <div class="navbar-header"><a href="#" class="navbar-brand">DRR-Demand Receive Return</a><button data-toggle="collapse" data-target="#navcol-1" class="navbar-toggle collapsed"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button></div>
        <div
            class="collapse navbar-collapse" id="navcol-1">
            <ul class="nav navbar-nav navbar-right">
                <li role="presentation"><a href="adminLogin.jsp">Admin Login</a></li>
            </ul>
    </div>
    </div>
</nav>
    </div>
    <h2 class="text-center text-muted">Employee Login</h2>
    <div class="login-card"><img src="assets/img/avatar_2x.png" class="profile-img-card">
        <p class="profile-name-card"> </p>
        <form class="form-signin" method="post" action="EmployeeLoginServlet"><span class="reauth-email"> </span><input class="form-control" type="text" required placeholder="Username" id="inputEmail" name="employee_name"><input class="form-control" type="password" required name="employee_password" placeholder="Password" id="inputPassword">
		<button class="btn btn-primary btn-block btn-lg btn-signin" type="submit">Sign in</button>
		<div>${msg1}</div>
		<div>${msg}</div>
		</form>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>

</html>