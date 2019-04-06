<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home - Brand</title>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:400,400i,700,700i,600,600i">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.min.css">
</head>

<body>
    <main class="page landing-page">
        <section class="clean-block clean-hero" style="background-image:url(&quot;assets/img/tech/image4.jpg&quot;);color:rgba(9, 162, 255, 0.85);">
            <div class="text">
                <h1>Disbursal Detail Screen</h1>
                <p>Congratulations to the customer, your work here is done, now after submitting the mentioned documents the loan will be sanctioned as soon as possible.</p>
            </div>
        </section>
        <section class="clean-block clean-info dark">
            <div class="container">
                <div class="block-heading">
                    <h2 class="text-info">Info</h2>
                    <p>email has been send to the email id ${email}, the customer will receive the loan amount of Rs ${amt} ,the type of loan customer has opted for is ${tol} loan</p>
                </div>
            </div>
        </section>
        <section class="clean-block features">
            <div class="container">
                <div class="block-heading">
                    <h2 class="text-info">Documents</h2>
                </div>
                <div class="row justify-content-center">
                    <ul class="list-group">
                        <li class="list-group-item"><span><br>Proof of identity. These can include photocopies of any one of voter ID card, Passport, Aadhar card, Driving license or PAN card<br><br></span></li>
                        <li class="list-group-item"><span><br>Residence proof. These can include photocopy of one of the following documents such as recent telephone bill, electricity bill, bank statement or property tax receipt<br><br></span></li>
                        <li class="list-group-item"><span><br>Bank account statement or updated passbook of the previous 6 months<br><br></span></li>
                        <li class="list-group-item"><span><br>Signature identification from the individual present bankers<br><br></span></li>
                        <li class="list-group-item"><span><br>An original salary statement or a salary certificate from the individual employer<br><br></span></li>
                        <li class="list-group-item"><span><br>TDS certification on Form 16 or copy of IT returns for the last 2 financial years, duly acknowledged by the Income Tax department<br><br></span></li>
                    </ul>
                </div>
            </div>
        </section>
    </main>
    <c:url var="newapplicationlink" value="application.jsp">
    </c:url>
    
    <div style="text-align: center"><a href="${newapplicationlink}"><button class="btn btn-primary">Home</button></a></div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.0/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/theme.js"></script>
</body>

</html>