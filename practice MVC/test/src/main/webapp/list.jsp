
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Product List</title>
    <link rel="stylesheet" href="bootstrap520/css/bootstrap.min.css" />
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap5.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- Font Awesome -->
    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
            rel="stylesheet"
    />
    <!-- Google Fonts -->
    <link
            href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
            rel="stylesheet"
    />
    <!-- MDB -->
    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.css"
            rel="stylesheet"
    />
</head>
<style>
    th{
        font-size: 20px;
    }
    .img-product{
        width: 100px;
        height: 100px;
    }
    a{
        color: black;
    }
    a:hover{
        color: #0a53be;
    }

</style>
<body>



<nav class="navbar navbar-light bg-light" style="position: sticky; top: 0; height: 80px; border: 1px solid #DDDDDD">
    <div class="container-fluid">
        <div style="display: flex; margin: 8px;position: relative">
            <div>
                <button style="font-size: 15px" class="btn btn-success" style=" background-color: #1c651c; color: white" onclick="window.location.href='/Product?action=create'">Add Product</button>
            </div>


        </div>


    </div>
</nav>

<h1 style=" margin-top: 30px; margin-bottom: 15px;text-align: center;">Product Management</h1>

<table id="tableProduct" class="table table-striped">
    <thead>

    </thead>
    <tbody>

    </tbody>
</table>



<!-- Modal -->
<%--<button style="font-size: 15px" onclick="inforDelete('${product.id}','${product.name}')" type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">--%>
<%--    <b>Delete</b>--%>
<%--</button>--%>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="" method="post">
                <div class="modal-body">
                    <input  hidden id="deleteId" name="deleteId">
                    <span>Are you sure to delete </span> <span style="color: red" id="deleteName"></span> <span>?</span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button style="font-size: 1rem" type="submit" class="btn btn-danger">Delete</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    function inforDelete(id,name){

        document.getElementById("deleteId").value=id;
        document.getElementById("deleteName").innerText=name;
    }
</script>
</body>
</html>
<!-- MDB -->
<script
        type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.js"
></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/yourcode.js"></script>

<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function() {
        $('#tableProduct').dataTable( {
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        } );
    } );
</script>
<%--<script>--%>
<%--    let check = ${checkCreate};--%>
<%--    if (check===true){--%>
<%--        console.log("ADDED SUCCESSFULLY")--%>
<%--    }--%>
<%--</script>--%>
<%--<script>--%>
<%--    let check = ${check};--%>
<%--    if (check===true){--%>
<%--        alert("EDITED SUCCESSFULLY");--%>
<%--    }else {--%>
<%--        alert("CAN'T EDIT THIS PRODUCT");--%>
<%--    }--%>
<%--</script>--%>