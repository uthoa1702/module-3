<%--
  Created by IntelliJ IDEA.
  User: uthoa
  Date: 04/28/23
  Time: 11:36 a.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<head>
    <title>Create new product</title>
</head>
<style>
    form{
        margin: 0 auto;
        width: 400px;
    }
</style>
<body>
<form action="/Product" method="post">
    <div class="mb-3">
        <label class="form-label">Enter product ID</label>
        <input type="number" class="form-control" name="id" aria-describedby="emailHelp" required>
    </div>

    <div class="mb-3">
        <label class="form-label">Enter product name</label>
        <input type="text" class="form-control" name="name" aria-describedby="emailHelp" required>
    </div>

    <div class="mb-3">
        <label  class="form-label">Enter product price</label>
        <input type="number" class="form-control" name="price" aria-describedby="emailHelp" required>
    </div>

    <div class="mb-3">
        <label class="form-label">Enter product description</label>
        <input type="text" class="form-control" name="description" aria-describedby="emailHelp" required>
    </div>

    <div class="mb-3">
        <label  class="form-label">Enter product brand</label>
        <input type="text" class="form-control" name="brand" aria-describedby="emailHelp" required>
    </div>

    <button type="submit" class="btn btn-primary">Submit</button>
</form>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</html>
