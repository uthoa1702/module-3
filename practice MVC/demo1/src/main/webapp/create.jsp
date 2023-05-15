<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/28/2023
  Time: 11:41 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Create</title>

</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- Font Awesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
      rel="stylesheet"/>
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
      rel="stylesheet"/>
<!-- MDB -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.css"
      rel="stylesheet"/>

<style>
    #add {
        width: 40vw;
        margin: 0 auto;
        text-align: center;
    }

    input {
        width: 200vw;
    }

    .text_left {
        text-align: left;
    }

    label {
        left: 10%;
    }
</style>
</head>


<h2 style="text-align: center;margin-top:50px ">Add New Customer</h2>
<c:if test="${check}">
    <h5 style="color:green;text-align: center">ADDED SUCCESSFULLY</h5>
</c:if>
<div id="add">
    <form action="/customer?action=create" method="post" class="text_left">
        <div class="form-outline mb-4">
            <input required oninput="checkName()" type="text" id="form6Example3" name="name" class="form-control"/>
            <label class="form-label" for="form6Example3">Name</label>
        </div>
        <div id="checkName" class="invalid-feedback" style="display: block;margin-top: -1.5%"></div>

        <div class="form-outline mb-4">
            <input required oninput="checkPhone()" type="text" id="form6Example4" name="phone" class="form-control"/>
            <label class="form-label" for="form6Example4">Phone Number</label>
        </div>

        <div id="checkPhone" class="invalid-feedback" style="display: block;margin-top: -1.5%"></div>

        <div class="form-outline mb-4">
            <input required type="text" id="form6Example5" name="address" class="form-control"/>
            <label class="form-label" for="form6Example5">Address</label>
        </div>
        <div class="form-outline mb-4">
            <input required  oninput="checkEmail()" type="text" id="form6Example6" name="email" class="form-control"/>
            <label class="form-label" for="form6Example6">Email</label>
        </div>
        <div id="checkEmail" class="invalid-feedback" style="display: block;margin-top: -1.5%"></div>
<%--        <div class="form-outline mb-4">--%>
<%--            <input  required type="text" id="form6Example7" name="user" class="form-control"/>--%>
<%--            <small style="color: red" id="checkUser"></small>--%>
<%--            <label class="form-label" for="form6Example7">Account </label>--%>
<%--        </div>--%>
<%--        <div class="form-outline mb-4">--%>
<%--            <input  required oninput="checkPass()" type="text" id="form6Example8" name="pass" class="form-control"/>--%>
<%--            <small style="color: red" id="checkPass"></small>--%>
<%--            <label class="form-label" for="form6Example8">PassWord</label>--%>
<%--        </div>--%>
        <button type="submit" class="btn btn-dark btn-block mb-4">Create</button>

    </form>
</div>

<script
        type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.js"
></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
<script>
    // let form = document.querySelector('form');
    // let nameCustomer = document.querySelector('#name');
    // let phoneCustomer = document.querySelector('#phone');
    // let addressCustomer = document.querySelector('#address');
    // let emailCustomer = document.querySelector('#email');
    // let userCustomer = document.querySelector('#user');
    // let passCustomer = document.querySelector('#pass');

    function checkName() {
        let name = document.getElementById("form6Example3").value;
        let regexName = /^[A-Z][a-z]*(\s[A-Z][a-z]*)+$/;
        if (regexName.test(name)) {
            document.getElementById("checkName").innerText = "";
        } else {
            document.getElementById("checkName").innerText = "The Name is not in the correct format";
        }
    }
    function checkPhone(){
        let phone=document.getElementById("form6Example4").value;
        let regexPhone=/^((\+84)|0)[0-9]{9}$/;
        if (regexPhone.test(phone)){
            document.getElementById("checkPhone").innerText="";
        }else {
            document.getElementById("checkPhone").innerText="The Phone Number is not in the correct format";
        }
    }
    function checkEmail() {
        let email = document.getElementById("form6Example6").value;
        let regexName = /^[a-z]\w{5,}\@[a-z]{3,5}\.[a-z]{2,5}$/;
        if (regexName.test(email)) {
            document.getElementById("checkEmail").innerText = "";
        } else {
            document.getElementById("checkEmail").innerText = "The Email is not in the correct format";
        }
    }

    function checkUser() {
        let email = document.getElementById("form6Example7").value;
        let regexName = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,10}$/;
        if (regexName.test(email)) {
            document.getElementById("checkUser").innerText = "";
        } else {
            document.getElementById("checkUser").innerText = "The Account Email is not in the correct format";
        }
    }
    // KT PASS có ít nhất 6 kí tự tỏng đó có 1 chữ cái và số
    function checkPass() {
        let email = document.getElementById("form6Example8").value;
        let regexName = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$/;
        if (regexName.test(email)) {
            document.getElementById("checkPass").innerText = "";
        } else {
            document.getElementById("checkPass").innerText = "The Pass Word is not in the correct format";
        }

    }

</script>
</body>
</html>