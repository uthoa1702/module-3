<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: uthoa
  Date: 04/28/23
  Time: 10:47 a.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<body>
<h1>Product Application Management</h1>
<br>
<button onclick="window.location.href='/Product?action=create'" type="button" class="btn btn-primary">Add new product</button>
<table class="table table-dark table-striped">
    <thead>
    <tr>
        <th colspan="8">Product List</th>
    </tr>
    <tr>
        <th>Number</th>
        <th>ID</th>
        <th>Name</th>
        <th>Price</th>
        <th>Description</th>
        <th>Brand</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="product" items="${productList}" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${product.id}</td>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td>${product.description}</td>
            <td>${product.brand}</td>
            <th><button onclick="window.location.href='/Product?action=edit&id=${product.id}'" type="button" class="btn btn-secondary">Edit</button></th>
            <th><button onclick="window.location.href='/Product?action=delete&id=${product.id}'" type="button" class="btn btn-danger">Delete</button>
            </th>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</html>
