<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Change Password</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
    <link rel="stylesheet" href="assets/css/Fixed-Navbar.css">
    <link rel="stylesheet" href="assets/css/Fixed-Navbar.css">
    <link rel="stylesheet" href="assets/css/Fixed-Navbar.css">
    <link rel="stylesheet" href="assets/css/Google-Style-Login.css">
    <link rel="stylesheet" href="assets/css/MUSA_navbar.css">
    <link rel="stylesheet" href="assets/css/MUSA_navbar.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>

<body>
    <div class="login-card">
        <h2 class="text-center">Change Password</h2>
        <p>${msg}</p>
        <form class="form-signin" action="AdminChangePasswordServlet" method="post" ><span class="reauth-email"> </span><input class="form-control" type="password" required="" placeholder="Old Password" name="old" id="inputPassword"><input class="form-control" type="password" required="" placeholder="New Password" name="new" id="inputPassword">
            <div
                class="checkbox"></div><button class="btn btn-primary btn-block btn-lg btn-signin" type="submit">Change</button></form>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.0/js/bootstrap.bundle.min.js"></script>
</body>

</html>