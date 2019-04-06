<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NewApplication</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
    <link rel="stylesheet" href="assets/css/-Fixed-Navbar-start-with-transparency-background-BS4-.css">
    <link rel="stylesheet" href="assets/css/Customizable-Background--Overlay.css">
    <link rel="stylesheet" href="assets/css/Formulario-Farmacia.css">
    <script>
         function validateForm() 
         {
        	 var email = document.forms["RegForm"]["email"].value;
        	 var phn = document.getElementById("phone").value;
        	 
        	 var aad = document.forms["RegForm"]["aadhar"].value;
        	 var pan = document.forms["RegForm"]["pan"].value;
        	 var ann = document.forms["RegForm"]["income"].value;
        	 
        	    if(isNaN(phn))
        	    {
            	    
        	       alert("Enter the valid Mobile Number(Like : 9566137117)");
        	       phone.focus();
        	       return false;
        	    }
        	    if((phn.length < 1) || (phn.length > 10))
        	    {
        	       alert(" Your Mobile Number must be 1 to 10 Integers");
        	       phone.focus();
        	       return false;
        	    }
        	    if(isNaN(aad))
        	    {
        	       alert("Enter the valid Aadhar Number");
        	       aadhar.focus();
        	       return false;
        	    }
        	    if((aad.length < 1) || (aad.length > 12))
        	    {
        	       alert(" Your Aadhaar Number must be 1 to 12 Integers");
        	       aadhar.focus();
        	       return false;
        	    }
        	    if((pan.length < 1) || (pan.length > 10))
        	    {
        	       alert(" Your Pan Number must be 1 to 10 Integers");
        	       pan.focus();
        	       return false;
        	    }
        	    if(isNaN(ann))
        	    {
        	       alert(" Enter the valid income");
        	       income.focus();
        	       return false;
        	    }
        }
</script>
</head>

<body style="background-color:#f8fcf9;">
    <div>
        <div>
            <header>
                <nav class="navbar navbar-light navbar-expand-lg fixed-top bg-white transparency border-bottom border-light" id="transmenu">
                    <div class="container"><a class="navbar-brand text-success" href="#header">&nbsp;Tata-Consultancy-Services</a><button class="navbar-toggler collapsed" data-toggle="collapse" data-target="#navcol-1"><span></span><span></span><span></span></button>
                        <div class="collapse navbar-collapse"
                            id="navcol-1">
                            <ul class="nav navbar-nav ml-auto">
                                <li class="nav-item" role="presentation"><a class="nav-link" href="application.jsp">home</a></li>
                                <li class="nav-item" role="presentation"><a class="nav-link" href="application.jsp"><c:out value="${sessionScope.currentSessionUser.employee_name}"></c:out></a></li>
                                <li class="nav-item" role="presentation"><a class="nav-link" href="EmployeeLogoutServlet">logout</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <div class="bg-success d-flex align-items-center" style="height:100vh;">
                    <div class="text-center w-100 text-white">
                        <h1>Demand-Receive-Return</h1>
                        <h2 class="font-weight-normal"><em>A Loan Origination System</em></h2>
                    </div>
                </div>
            </header>
        </div>
        <h1 class="text-center text-muted">New Application</h1>
    </div>
    <div class="container">
        <div>
            <form action="NewApplicationServlet" method="post" onsubmit="return validateForm()">
                <div class="form-group">
                    <div id="formdiv">
                        <div class="form-row" style="margin-right:0px;margin-left:0px;padding-top:24px;">
                        	<input type="hidden" name="command" value="INSERT">
                        	<p>${msg0}</p>
                            <div class="col-md-8 offset-md-1">
                                <p style="margin-left:2%;font-family:Roboto, sans-serif;font-size:24px;"><strong>First Name </strong></p>
                            </div>
                            <div class="col-md-10 offset-md-1"><input class="form-control" type="text" id="FName" name="first_name" value="${param.first_name}" required style="margin-left:0px;font-family:Roboto, sans-serif;"></div>
                        </div>
                        <div class="form-row" style="margin-right:0px;margin-left:0px;padding-top:24px;">
                            <div class="col-md-8 offset-md-1">
                                <p style="margin-left:2%;font-family:Roboto, sans-serif;font-size:24px;"><strong>Last Name </strong></p>
                            </div>
                            <div class="col-md-10 offset-md-1"><input class="form-control" type="text" id="LName" required value="${param.last_name}" name="last_name" style="margin-left:0px;font-family:Roboto, sans-serif;"></div>
                        </div>
                        <div class="form-row" style="margin-right:0px;margin-left:0px;padding-top:24px;margin-top:-16px;">
                            <div class="col-md-8 offset-md-1">
                                <p style="margin-left:2%;font-family:Roboto, sans-serif;font-size:24px;"><strong>Gender </strong></p>
                            </div>
                            <div class="col-md-10 offset-md-1"><select class="form-control" name="gender" style="font-family:Roboto, sans-serif;"><option value="M" selected="">male</option><option value="F">female</option><option value="O">other</option></select></div>
                        </div>
                        <div class="form-row" style="margin-right:0px;margin-left:0px;padding-top:24px;">
                            <div class="col-md-8 offset-md-1">
                                <p style="margin-left:2%;font-family:Roboto, sans-serif;font-size:24px;"><strong>Address</strong></p>
                            </div>
                            <div class="col-md-10 offset-md-1"><textarea class="form-control" id="address" name="address" value="${param.address}"  required></textarea></div>
                        </div>
                        <div class="form-row" style="margin-right:0px;margin-left:0px;padding-top:24px;">
                            <div class="col-md-8 offset-md-1">
                                <p style="margin-left:2%;font-family:Roboto, sans-serif;font-size:24px;"><strong>Phone Number</strong></p>
                            </div>
                            <div class="col-md-10 offset-md-1"><input class="form-control" type="tel" id="phone" name="phn" value="${param.phn}" required></div>
                             ${msg1}
                        </div>
                        <div class="form-row" style="margin-right:0px;margin-left:0px;padding-top:24px;">
                            <div class="col-md-8 offset-md-1">
                                <p style="margin-left:2%;font-family:Roboto, sans-serif;font-size:24px;"><strong>Email</strong></p>
                            </div>
                            <div class="col-md-10 offset-md-1" style="font-family:Roboto, sans-serif;"><input class="form-control" type="email" id="email" name="email" value="${param.email}" required style="margin-left:0px;"></div>
                        	 ${msg2}
                        </div>
                        <div class="form-row" style="margin-right:0px;margin-left:0px;padding-top:24px;">
                            <div class="col-md-8 offset-md-1">
                                <p style="margin-left:2%;font-family:Roboto, sans-serif;font-size:24px;"><strong>Aadhar Card Number</strong></p>
                            </div>
                            <div class="col-md-10 offset-md-1"><input class="form-control" type="text" id="aadhar" name="aadhar_card" value="${param.aadhar_card}" required style="margin-left:0px;font-family:Roboto, sans-serif;"></div>
                             ${msg3}
                        </div>
                        <div class="form-row" style="margin-right:0px;margin-left:0px;padding-top:24px;">
                            <div class="col-md-8 offset-md-1">
                                <p style="margin-left:2%;font-family:Roboto, sans-serif;font-size:24px;"><strong>Pan Card Number</strong></p>
                            </div>
                            <div class="col-md-10 offset-md-1"><input class="form-control" type="text" id="pan" name="pan_card" value="${param.pan_card}"  required></div>
                        	 ${msg4}
                        </div>
                        <div class="form-row" style="margin-right:0px;margin-left:0px;padding-top:24px;">
                            <div class="col-md-8 offset-md-1">
                                <p style="margin-left:2%;font-family:Roboto, sans-serif;font-size:24px;"><strong>Annual Income</strong></p>
                            </div>
                            <div class="col-md-10 offset-md-1"><input class="form-control" type="number" id="income" name="income" value="${param.income}"  required></div>
                        </div>
                        <div class="form-row" style="margin-right:0px;margin-left:0px;padding-top:24px;">
                            <div class="col-md-4 offset-md-4"><button class="btn btn-outline-primary btn-block btn-lg" type="submit" style="margin-left:16px;">Submit </button></div>
                        </div>
                    </div>
                </div>
                <footer id="myFooter" style="padding:0px;"></footer>
            </form>
        </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.0/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/-Fixed-Navbar-start-with-transparency-background-BS4-.js"></script>
    <script src="assets/js/Contact-FormModal-Contact-Form-with-Google-Map.js"></script>
</body>

</html>