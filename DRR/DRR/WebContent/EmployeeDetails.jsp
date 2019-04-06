<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Details</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/MUSA_panel-table.css">
    <link rel="stylesheet" href="assets/css/MUSA_panel-table.css">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel='stylesheet' type='text/css'>
</head>

<body>

<div class="container">
<h1 style="text-align:center">Employee Details</h1>
<br>
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="panel panel-default panel-table">
              <div class="panel-heading">
              </div>
              <div class="panel-body">
                <table class="table table-striped table-bordered table-list">
                  <thead>
                    <tr>
                        <th><em class="fa fa-cog"></em></th>
                        <th class="hidden-xs">ID</th>
                        <th>Name</th>
                    </tr> 
                  </thead>
                  <tbody>
                  		<c:forEach var="temp" items="${Employees}">
                  		
                  		<c:url var="deletelink" value="AddEmployeeServlet">
                  		<c:param name="command" value="DELETE"></c:param>
                  		<c:param name="id" value="${temp.id}"></c:param>
                  		</c:url>
                  		
                          <tr>
                            <td align="center">
                              <a class="btn btn-danger" href="${deletelink}" onclick="if(!(confirm('Are you sure you want to delete this employee'))) return false"><em class="fa fa-trash"></em></a>
                            </td>
                            <td class="hidden-xs">${temp.id}</td>
                            <td>${temp.employee_name}</td>
                          </tr>
                          </c:forEach>
                        </tbody>
                </table>
            </div>
            </div>

</div></div></div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.0/js/bootstrap.bundle.min.js"></script>
</body>

</html>