<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="assets/css/styles.min.css">
</head>

<body>
    <div class="wrapper">
        <div class="sidebar" data-color="purple" data-image="" style="background-image:url(&quot;assets/img/sidebar-4.jpg&quot;);"><div class="sidebar-wrapper">
    <div class="logo"><a href="#" class="simple-text">Details</a></div>
    <ul class="nav">
        <li class="active"><a href="AddEmployeeServlet?command=ADD"><i class="glyphicon glyphicon-user"></i><p>Employee details</p></a></li>
        <li><a href="NewApplicationServlet?command=LIST"><i class="glyphicon glyphicon-user"></i><p>Customer Details</p></a></li>
    </ul>
</div></div>
        <div class="main-panel">
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <div class="navbar-header"><a class="navbar-brand" href="#">Admin Dashboard</a><button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button></div>
                    <div
                        class="collapse navbar-collapse" id="navcol-1">
                        <ul class="nav navbar-nav navbar-left"></ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li role="presentation"><a href="changepassword.jsp">Change Password</a></li>
                            <li role="presentation"><a href="AdminLogoutServlet">Logout</a></li>
                        </ul>
                </div>
        </div>
        </nav>
        <div class="content">
            <div class="row login-form">
                <div class="col-md-6 col-md-offset-3">
                    <h3 class="text-center text-muted form-heading">Add Employee</h3>
                    <form class="custom-form" method="post" action="AddEmployeeServlet">
                        <div class="form-group"><input class="form-control" type="text" name="employee_name" value="${param.employee_name}" required placeholder="Employee Name" autofocus=""></div>
                        <div class="form-group"><input class="form-control" type="password" id="password" name="employee_password" required placeholder="Password" minlength="4"></div>
                        <div class="form-group"><input class="form-control" type="password" name="confirm_password" id="confirm_password" required placeholder="Confirm Password" minlength="4"></div>
                        <p id="message"></p>
                            <button class="btn btn-default btn-block submit-button" type="submit">Submit Form</button>
                            </form>
                            <br>
                            <p style="text-align:center;color:red">${msg}</p>
                            <p style="text-align:center;color:green">${msg1}</p>
                </div>
            </div>
        </div>
        <footer class="footer">
            <div class="container-fluid">
                <p class="copyright pull-right">DRR-Demand Receive Return</p>
            </div>
        </footer>
    </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="assets/js/script.min.js"></script>
    <script>
    $(document).ready(function(){
    $('#password, #confirm_password').on('keyup', function (){
   if ($('#password').val() != $('#confirm_password').val()){
    $('#message').html('Not Matching').css('color', 'red');
     }
   else
	   $('#message').html('Matching').css('color', 'green');
    });});</script>
</body>

</html>