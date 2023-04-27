<%--
  Created by IntelliJ IDEA.
  User: uthoa
  Date: 04/27/23
  Time: 10:41 a.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Customer List</title>
</head>
<style>

    td{
        padding: 20px;
    }
    img{
        width: 50px;
        height: 50px;
        padding: 0;
    }
</style>
<body>
<h1>Customer List</h1>
<br>
<table border="1" >
    <tr>
        <th colspan="5">Customer</th>
    </tr>
    <tr>
        <th>Number</th>
        <th>Name</th>
        <th>Birth Day</th>
        <th>Address</th>
        <th>Image</th>
    </tr>

        <c:forEach var="customer" items="${customerList}" varStatus="status">
    <tr>
        <td>${status.count}</td>
        <td>${customer.name}</td>
        <td>${customer.birthday}</td>
        <td>${customer.address}</td>
        <td><img src="${customer.img}"></td>
    </tr>
        </c:forEach>

</table>
</body>
</html>
