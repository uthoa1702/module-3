<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1>Calculator Online</h1>
<br/>
<form action="/CalculatorServlet" method="post">
    <fieldset>
        <legend>Calculator</legend>
        <table>
            <tr>
                <td>First operand:</td>
                <td><input type="text" name="first" placeholder="input number"></td>
            </tr>
            <tr>
                <td>Operator:</td>
                <td><select name="operator" id="operator">
                    <option value="+">+</option>
                    <option value="-">-</option>
                    <option value="x">x</option>
                    <option value="/">/</option>
                </select></td>
            </tr>
            <tr>
                <td>Second operand:</td>
                <td><input type="text" name="second" placeholder="input number"></td>
            </tr>
            <tr>
                <td></td>
                <td><button type="submit">Calculate</button></td>
            </tr>

        </table>
    </fieldset>
    <h4> ${a} ${c} ${b} = ${result}</h4>
</form>

</body>
</html>