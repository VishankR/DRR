<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Customer</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/Pretty-Registration-Form.css">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="assets/css/TD-BS4-Simple-Contact-Form.css">
    <link rel="stylesheet" href="assets/css/TD-BS4-Simple-Contact-Form.css">
</head>

<body>
    <div class="row register-form">
        <div class="col-md-8 offset-md-2">
            <form class="custom-form" style="color:#ffffff;background-color:rgba(252,252,250,0.1);" method="post" action="NewApplicationServlet">
                <h1>Update Credentials</h1>
                <input type="hidden" name="id" value="${customer.id}">
                <input type="hidden" name="gender" value="${customer.gender}">
                <input type="hidden" name="command" value="EDIT">
                <div class="form-row form-group">
                    <div class="col-sm-4 label-column"><label class="col-form-label" for="name-input-field">First Name </label></div>
                    <div class="col-sm-6 input-column"><input class="form-control" type="text" name="first_name" value="${customer.first_name}"></div>
                </div>
                <div class="form-row form-group">
                    <div class="col-sm-4 label-column"><label class="col-form-label" for="name-input-field">Last Name </label></div>
                    <div class="col-sm-6 input-column"><input class="form-control" type="text"  name="last_name" value="${customer.last_name}"></div>
                </div>
                <div class="form-row form-group">
                    <div class="col-sm-4 label-column"><label class="col-form-label" for="name-input-field">Address</label></div>
                    <div class="col-sm-6 input-column"><textarea class="form-control" name="address">${customer.address}</textarea></div>
                </div>
                <div class="form-row form-group">
                    <div class="col-sm-4 label-column"><label class="col-form-label" for="name-input-field">Phn no.</label></div>
                    <div class="col-sm-6 input-column"><input class="form-control" type="text" name="phn" value="${customer.phn}"><p style="color:red">${msg1}</p></div>         
                </div>
                <div class="form-row form-group">
                    <div class="col-sm-4 label-column"><label class="col-form-label" for="email-input-field">Email </label></div>
                    <div class="col-sm-6 input-column"><input class="form-control" type="email" name="email" value="${customer.email}"><p style="color:red">${msg2}</p></div>
                </div>
                <div class="form-row form-group">
                    <div class="col-sm-4 label-column"><label class="col-form-label" for="aadhar">Aadhar Card No.</label></div>
                    <div class="col-sm-6 input-column"><input class="form-control" type="text" name="aadhar_card" value="${customer.aadhar_card}"><p style="color:red">${msg3}</p></div>                
                </div>
                <div class="form-row form-group">
                    <div class="col-sm-4 label-column"><label class="col-form-label" for="pan">Pan Card No.</label></div>
                    <div class="col-sm-6 input-column"><input class="form-control" type="text" name="pan_card" value="${customer.pan_card}"> <p style="color:red;">${msg4}</p></div>
                   
                </div>
                <div class="form-row form-group">
                    <div class="col-sm-4 label-column"><label class="col-form-label" for="incomes">Annual Income</label></div>
                    <div class="col-sm-6 input-column"><input class="form-control" type="text" name="income" value="${customer.income}"></div>
                   
                </div><button class="btn btn-light submit-button" type="submit">Save</button></form>
        </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.0/js/bootstrap.bundle.min.js"></script>
</body>

</html>