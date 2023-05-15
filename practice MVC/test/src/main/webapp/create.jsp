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
        width: 30%;
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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<body>

<h1 style="text-align: center;margin-top:50px ">ADD PRODUCT</h1>
<h6 style="text-align: center; color: darkgreen">
    <c:if test="${check}" >
        ADDED SUCCESSFULLY
    </c:if>
</h6>
<div class="col-lg-2 col-sm-1"></div>
<div class="col-lg-8 col-sm-10 " id="add">
    <form action="/Product?action=create" method="post" class="text_left">
        <div class="form-outline mb-4">
            <input name="name" type="text" id="form6Example3" class="form-control" required/>
            <label class="form-label" for="form6Example3">Product Name</label>
        </div>
        <div class="form-outline mb-4">
            <input name="price" type="number" id="form6Example4" class="form-control" required/>
            <label class="form-label" for="form6Example4">Product Price</label>
        </div>
        <div class="form-outline mb-4">
            <input name="brand" type="text" id="form6Example5" class="form-control" required />
            <label class="form-label" for="form6Example5">Brand of Product</label>
        </div>
        <div class="form-outline mb-4">
            <input name="image" type="text" id="form6Example6" class="form-control" required/>
            <label class="form-label" for="form6Example6">Image URL </label>
        </div>

        <div class="form-outline mb-4">
            <textarea style="border: 1px solid #CCCCCC" name="description" class="form-control" id="form6Example7" rows="4"></textarea>
            <label class="form-label" for="form6Example7">Additional description</label>
        </div>
        <button type="submit" class="btn btn-dark btn-block mb-4 " >Create</button>


        <!-- Modal -->
        <%--        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">--%>
        <%--            <div class="modal-dialog">--%>
        <%--                <div class="modal-content">--%>
        <%--                    <div class="modal-header">--%>
        <%--                        <h1 class="modal-title fs-5" id="exampleModalLabel">Create new product</h1>--%>
        <%--                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--%>
        <%--                    </div>--%>
        <%--                    <div class="modal-body">--%>
        <%--                        Are you sure to add this product?--%>
        <%--                    </div>--%>
        <%--                    <div class="modal-footer">--%>
        <%--                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>--%>
        <%--                        <button type="submit" class="btn btn-primary">Save changes</button>--%>
        <%--                    </div>--%>
        <%--                </div>--%>
        <%--            </div>--%>
        <%--        </div>--%>

    </form>
</div>
<div class="col-lg-2 col-sm-1"></div>
<script
        type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.js"
></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>


</body>
</html>

<%--<script>--%>
<%--    let check = ${check};--%>
<%--    if (check===true){--%>
<%--        alert("ADDED SUCCESSFULLY");--%>
<%--    }else {--%>
<%--        alert("CAN'T ADD THIS PRODUCT");--%>
<%--    }--%>
<%--</script>--%>



