
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Loan Details</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
       .jumbotron 
       { 
             background-color:powderblue; 
             color: #ffffff;
       } 
       .panel {
    border: 1px solid powderblue; 
    border-radius:0;
    transition: box-shadow 0.5s;
}

.panel:hover {
    box-shadow: 5px 0px 40px rgba(0,0,0, .2);
}

.panel-footer .btn:hover {
    border: 1px solid powderblue;
    background-color: #fff ;
    color: #f4511e;
}

.panel-heading
{
    background-color: powderblue; 
     
    padding: 25px;
   
    
}

.panel-footer {
    background-color: #fff;
}

.panel-footer h3 {
    font-size: 32px;
}

.panel-footer h4 {
    color: #aaa;
    font-size: 14px;
}

.panel-footer .btn {
    margin: 15px 0;
    background-color: powderblue;
    color: #fff;
}
body{background-color: grey;}
</style>
    
   </head>
   <body>
   <div class="jumbotron text-center">
    <h1 style="color:#303030">Types of loan</h1> 
    <p style="color:#303030">We Provide</p> 
  </div>
<div class="container-fluid">
  <div class="text-center">
    <h2><b>Pricing</b></h2>
    <h4><b>Choose a type of loan</b></h4>
  </div>
  <div class="row"  style="margin-left:400px;">
    <div class="col-sm-4">
      <div class="panel panel-default text-center">
        <div class="panel-heading" style="background-color:f4511e">
          <h1>AUTO</h1>
        </div>
        <div class="panel-body">
             <form  name="AutoForm" action="LoanServlet" method="post" onsubmit="" class="form-inline">
             <input type=hidden name="id" value="${customer_id}">
             <input type=hidden name="email" value="${email}">
             <input type=hidden name="tol" value="auto">
             <div class="form-group">
                  <label for="date">first payement date</label>
                  <input type="date" class="form-control" id="date" name="date" value="" required>
             </div>
             <br>
             <br>
         
             <div class="form-group">
                  <label for="loan">Loan Amount:</label>
                  <input type="number" class="form-control" id="amount" name="loan_amount" min=0 max="${maxLoan}" value="${maxLoan}" required>
             </div>
             <br>
             <br>
    
            <div class="form-group">
                  <label for="interest">Interest Rate:</label>
                  <input type="decimal" class="form-control" id="interest" name="interest" value="${interest}" readonly required>
             </div>
        </div>
        <div class="panel-footer">
          <label for="years">Tenure in years:</label>
                  <select name="tenure">
                  <c:forEach var="temp" items="${maxTenure}">      
                  <option>${temp}</option>
                  </c:forEach>      
				  </select>   
          <button type="submit" class="btn btn-lg">Next</button>
        </div>
        </form>
      </div> 
    </div> 
    <div class="col-sm-4">
      <div class="panel panel-default text-center">
        <div class="panel-heading">
          <h1>HOME</h1>
        </div>
        <div class="panel-body">
             <form  name="HomeForm" action="LoanServlet" method="post" onsubmit="" class="form-inline">
             <input type=hidden name="id" value="${customer_id2}">
             <input type=hidden name="email" value="${email2}">
             <input type=hidden name="tol" value="home">
             <div class="form-group">
                  <label for="date">first payement date</label>
                  <input type="date" class="form-control" id="date" name="date" value="" required>
             </div>
             <br>
             <br>
         
             <div class="form-group">
                  <label for="loan">Loan Amount:</label>
                  <input type="number" class="form-control" id="amount" name="loan_amount" min=0 max="${maxLoan2}" value="${maxLoan2}" required>
             </div>
             <br>
             <br>
    
            <div class="form-group">
                  <label for="interest">Interest Rate:</label>
                  <input type="decimal" class="form-control" id="interest" name="interest" value="${interest2}" readonly required>
             </div>
        </div>
  		<div class="panel-footer">
          <label for="years">Tenure in years:</label>
                  <select name="tenure">
                  <c:forEach var="temp" items="${maxTenure2}">      
                  <option>${temp}</option>
                  </c:forEach>      
				  </select>   
          <button type="submit" class="btn btn-lg">Next</button>
        </div>
        </form>
      </div> 
    </div> 
   
  </div>
</div>
  
   
   </body>
   </html>
    
