<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Repayment Detail Screen</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/Data-Table.css">
    <link rel="stylesheet" href="assets/css/Data-Table.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.15/css/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>

<body>
<h2 style="text-align:center">Repayment Detail Screen</h2>
<br/>
<table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th>Date</th>
                <th>EMI Amount</th>
                <th>Interest</th>
              <th>Balance</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="temp" items="${details}">
            <tr>
                <td>${temp.date}</td>
                <td><fmt:formatNumber type="number" maxFractionDigits="2" value="${emi}"/></td>
                <td><fmt:formatNumber type="number" maxFractionDigits="2" value="${temp.interest}"/></td>
                <td><fmt:formatNumber type="number" maxFractionDigits="2" value="${temp.balance}"/></td>
            </tr>
            </c:forEach>
        </tbody>
    </table>
    <c:url var="disbursallink" value="disbursal.jsp">
    </c:url>
    
    <div style="text-align: center"><a href="${disbursallink}"><button class="btn btn-primary">Next</button></a></div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.0/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script>
</body>

</html>