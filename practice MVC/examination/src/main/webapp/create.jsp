<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: uthoa
  Date: 05/13/23
  Time: 5:31 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

</head>
<body>
<div style="justify-content: center">
<form style="justify-content: center ; width: 40%"  action="/student?action=create" method="post">
  <div class="mb-3">
    <label  class="form-label">name</label>
    <input required name="name" type="text" class="form-control"  aria-describedby="emailHelp">
    <div  class="form-text"></div>
  </div>
  <div class="mb-3">
    <label  class="form-label">age</label>
    <input required name="age" type="number" min="1" max="200" class="form-control"  aria-describedby="emailHelp">
    <div  class="form-text"></div>
  </div>
  <div class="mb-3">
    <label class="form-label">country</label>
    <input required name="country" type="text" class="form-control"  aria-describedby="emailHelp">
    <div  class="form-text"></div>
  </div>
  <select name="levelId" required class="form-select" aria-label="Default select example">
    <option selected>Open this select menu</option>
    <c:forEach var="level" items="${levelList}">
      <option name="levelId" value="${level.id}">${level.name}</option>

    </c:forEach>

  </select>

  <button type="submit" class="btn btn-primary">Submit</button>
</form>
</div>
</body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js" integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous"></script>
</html>
