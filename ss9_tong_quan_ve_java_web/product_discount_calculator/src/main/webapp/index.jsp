<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1>Product Discount Calculator</h1>
<form action="/CalculatorServlet" method="post">
    <div id="data">
        <label>Product Description </label>
        <input type="text" name="description" size="30"  placeholder="description" />
        <br>
        <br>
        <label>List Price </label>
        <input type="text" name="price" size="30" placeholder="price" />
        <br>
        <br>
        <label>Discount Percent</label>
        <input type="text" name="discount" placeholder="discount"/>
    </div>
    <div>
        <br>
        <input type="submit" value="Calculate Discount">
    </div>
</form>
</body>
</html>