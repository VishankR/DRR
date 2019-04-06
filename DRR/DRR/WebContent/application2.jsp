<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>New Application</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
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
    <style>
    .field, .actions {
    margin-bottom: 15px;
  }
  .field label {
    float: left;
    width: 45%;
    text-align: right;
    padding-right: 0px;
    margin: 0px 0px 0px 0px;
  }
  .field input {
    width: 0%;
    margin: 0px;
  }
     body 
      {
          font: 400 15px Lato, sans-serif;
          line-height: 1.8;
          color: black;
          font-color:black;
      }
      .jumbotron
      {
      
          background-color: powderblue;
          color: #fff;
          padding: 100px 25px;
          font-family: Montserrat, sans-serif;
      }
     .container-fluid 
     {
        padding:60px 50px;
      }
      .navbar 
      {
          font-family: Montserrat, sans-serif;
      }
      .navbar 
      {
          margin-bottom: 0;
          background-color: powderblue;
          z-index: 9999;
          border: 0;
         font-size: 14px;
         line-height: 1.42857143;
         letter-spacing: 4px;
         border-radius: 0;
       }

     .navbar li a, .navbar .navbar-brand 
     {
          color: black;
     }

     .navbar-nav li a:hover, .navbar-nav li.active a 
     {
        color: powderblue;
       background-color: #fff;
     }
     .navbar-default .navbar-toggle 
     {
        border-color: transparent;
        color: #fff ;
     }
     .bg-grey 
     {
         background-color: #f6f6f6;
     }
     .logo 
     {
         font-size: 200px;
     }
     @media screen and (max-width: 768px) 
     {
       .col-sm-4
        {
           text-align: center;
           margin: 25px 0;
        }
     }
     .logo-small 
     {
         color:powderblue;
        font-size: 50px;
     }
     .logo
      {
        color: powderblue;
        font-size: 200px;
      }
      h2 
      {
           font-size: 24px;
           text-transform: uppercase;
           color: #303030;
           font-weight: 600;
           margin-bottom: 30px;
      }
     h4 
     {
         font-size: 19px;
         line-height: 1.375em;
         color: #303030;
         font-weight: 400;
         margin-bottom: 30px;
      }  
      p
      {
        color: #303030;
      }
      label
      {
        color: #303030;
      }
      slideanim {visibility:hidden;}
.slide {
    /* The name of the animation */
    animation-name: slide;
    -webkit-animation-name: slide; 
    /* The duration of the animation */
    animation-duration: 1s; 
    -webkit-animation-duration: 1s;
    /* Make the element visible */
    visibility: visible; 
}

/* Go from 0% to 100% opacity (see-through) and specify the percentage from when to slide in the element along the Y-axis */
@keyframes slide {
    0% {
        opacity: 0;
        transform: translateY(70%);
    } 
    100% {
        opacity: 1;
        transform: translateY(0%);
    } 
}
@-webkit-keyframes slide {
    0% {
        opacity: 0;
        -webkit-transform: translateY(70%);
    } 
    100% {
        opacity: 1;
        -webkit-transform: translateY(0%);
    }
}
    </style>
  </head>
  <body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
      <nav class="navbar navbar-default navbar-fixed-top">
         <div class="container">
           <div class="navbar-header">
             <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>                        
             </button>
             <a class="navbar-brand" href=""><span class="glyphicon glyphicon-piggy-bank" aria-hidden="true"></span>DRR-Demand Recieve Return</a>
          </div>
          <div class="collapse navbar-collapse" id="myNavbar">
             <ul class="nav navbar-nav navbar-right">
               <li><a href="#home">HOME</a></li>
               <li><a href="#about">ABOUT</a></li>
               <li><a href="#contact">CONTACT</a></li>
             </ul>
          </div>
        </div>
      </nav>      
    <div class="jumbotron text-center" id="home">
        <h1 style="color:#303030">New Application</h1> 
        <p>Basic Detail</p>
        <div class="container form-center">
        <p>${msg0}</p>
        <form  name="RegForm" action="NewApplicationServlet" method="post" onsubmit="return validateForm()" class="form-inline">
        
             <input type="hidden" name="command" value="INSERT"> 

			<table class="form-group">
				<tr>
                  <td><label for="FName" class="control-label">First Name:</label></td>
                  <td><input type="text" class="form-control" id="FName" name="first_name" value="${param.first_name}" required></td>
                </tr>

				<tr>
                  <td>
                  <label for="LName">Last name:</label>
                  </td>
                  <td><input type="text" class="form-control" id="LName" required value="${param.last_name}" name="last_name"></td>
                  </tr>
            </table>
            <br>
            <br>
             <div class="form-group">
                  <label for="gender">Gender.:</label>
                  <input type="radio" name="gender" value="M" style="color:#303030" ><b> Male</b>
                  <input type="radio" name="gender" value="F" style="color:#303030"><b> Female</b>
                  <input type="radio" name="gender" value="O" style="color:#303030"> <b>Other</b>
             </div>
             <br>
             <br>
             
            <div class="form-group">
                  <label for="address">Address:</label>
                  <input type="text" class="form-control" id="address" name="address" value="${param.address}"  required>
             </div>
             <br>
             <br>
             <div class="form-group">
                  <label for="phone">phn no:</label>
                  <input type="text" class="form-control" id="phone" name="phn" value="${param.phn}" required>
                  <br/>
                  ${msg1}
             </div>
             <br>
             <br>
             <div class="form-group">
                  <label for="email">Email Id:</label>
                  <input type="email" class="form-control" id="email" name="email" value="${param.email}" required>
                  <br/>
                  ${msg2}
             </div>
             <br>
             <br>
             <div class="form-group">
                  <label for="aadhar">Aadhar Card no.:</label>
                  <input type="text" class="form-control" id="aadhar" name="aadhar_card" value="${param.aadhar_card}" required>
                  <br/>
                  ${msg3}
             </div>
             <br>
             <br>
             <div class="form-group">
                  <label for="pan">Pan Card No.:</label>
                  <input type="text" class="form-control" id="pan" name="pan_card" value="${param.pan_card}"  required>
                  <br/>
                  ${msg4}
             </div>
             <br>
             <br>
             <div class="form-group">
                  <label for="income">Annual Income Details:</label>
                  <input type="text" class="form-control" id="income" name="income" value="${param.income}"  required>
                  <br/>
                  ${msg5}
             </div>
             <br>
             <br>
            <button type="submit" class="btn btn-default"><b>Submit</b></button>
        </form>
        </div>
        <br>
        <br>
        <br>
        <div id="about" class="container-fluid bg-grey">
           <div class="row">
              <div class="col-sm-8">
                <h2>About the product</h2>
                <h4>.</h4> 
                <p>Loan Origination System will help the bank employees to input the details of the customer and tell him how much loan
                    is he eligible for by checking his monthly salary after that the repayment schedule
                    is shared with the customer and when he agrees, the amount is disbursed to the
                    customer. All the mandatory documents like aadhar card, bank details and pan
                    card are captured into the system. The system checks that if he is not a defaulter,
                    only then the amount is disbursed to him. The system provides two types of loans
                    the auto loan and home loan.</p>
              </div>
              <div class="col-sm-4">
                <span class="glyphicon glyphicon-signal logo"></span>
              </div>
            </div>
        </div> 
        <div id="contact" class="container-fluid bg-grey">
           <h2 class="text-center">
          <c:out value="${sessionScope.currentSessionUser.employee_name}"></c:out>
           </h2>
              <form method="post" action="EmployeeLogoutServlet">
              <button type="submit" class="btn btn-default"><b>Logout</b></button>
              </form>
          </div>
          <script>
$(document).ready(function(){
  // Add smooth scrolling to all links in navbar + footer link
  $(".navbar a, footer a[href='#myPage']").on('click', function(event) {
    // Make sure this.hash has a value before overriding default behavior
    if (this.hash !== "") {
      // Prevent default anchor click behavior
      event.preventDefault();

      // Store hash
      var hash = this.hash;

      // Using jQuery's animate() method to add smooth page scroll
      // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
      $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 900, function(){
   
        // Add hash (#) to URL when done scrolling (default click behavior)
        window.location.hash = hash;
      });
    } // End if
  });
  
  $(window).scroll(function() {
    $(".slideanim").each(function(){
      var pos = $(this).offset().top;

      var winTop = $(window).scrollTop();
        if (pos < winTop + 600) {
          $(this).addClass("slide");
        }
    });
  });
})
</script>
          
  </body>
</html>
