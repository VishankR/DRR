<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin_login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="assets/css/Google-Style-Login.css">
    <link rel="stylesheet" href="assets/css/login-form.css">
    <link rel="stylesheet" href="assets/css/login-form.css">
    <link rel="stylesheet" href="assets/css/Navigation-Clean.css">
    <link rel="stylesheet" href="assets/css/Navigation-with-Button.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>

<body>
    <div></div>
    <div></div>
    <h2 class="text-center text-muted">Admin Login</h2>
    <div class="login-card"><img src="assets/img/avatar_2x.png" class="profile-img-card">
        <p class="profile-name-card"> </p>
        <form method="post" action="AdminLoginServlet" class="form-signin"><span class="reauth-email"> </span><input type="text" required value="admin" readOnly autofocus class="form-control" id="inputEmail" 
       name="admin_name"/><input type="password" required placeholder="Password" class="form-control" id="inputPassword" 
       name="admin_password"/>
        <button class="btn btn-primary btn-block btn-lg btn-signin" type="submit">Sign in</button>
        <div style="color:red;">${msg1}</div>
        <div style="color:red;">${msg}</div>
        </form>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>