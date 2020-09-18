<%--
  Created by IntelliJ IDEA.
  User: symoh
  Date: 30/08/2020
  Time: 08:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>add a to do</title>
    <style>
        body{
            background-image: url("add.jpg");
        }
    </style>
</head>
<body style="padding-top: 100px">
<div class="current_date"></div>
<!-- Material form contact -->
<div class=" card container-fluid col-sm-8 text-left text-center" >

    <h5 class="card-header info-color white-text text-center py-4">
        <strong>add a to do</strong>
    </h5>

    <!--Card content-->
    <div class="card-body px-lg-5 pt-0">

        <!-- Form -->
        <form class="text-center" style="color: #757575;" method="post" action="addTasks" >

            <!-- Name -->
            <div class="md-form mt-3">
                <input type="text" id="materialContactFormName" class="form-control" name="title">
                <label for="materialContactFormName">task name</label>
            </div>

            <!-- description -->
            <div class="md-form mt-3">
                <textarea id="materialContactFormMessage" class="form-control md-textarea" rows="3" name="description"></textarea>
                <label for="materialContactFormMessage">task description</label>
            </div>

            <!-- due date -->
            <div class="md-form mt-3">
                <input type="date" id="materialContactFormDate" class="form-control" name="dueDate">
                <label for="materialContactFormDate">task name</label>
            </div>

            <!-- Send button -->
            <button class="btn btn-outline-info btn-rounded btn-block z-depth-0 my-4 waves-effect" type="submit">save</button>

        </form>
        <!-- Form -->

    </div>

</div>
<!-- Material form contact -->

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<%--<script src="./assets/js/jquery.min.js"></script>
<script src="./assets/js/popper.js"></script>--%>
<script src="./bootstrap/js/bootstrap.min.js"></script>
<!-- Bootstrap core CSS -->
<link href="mdb/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="mdb/css/mdb.min.css" rel="stylesheet">
<!-- SCRIPTS -->
<!-- JQuery -->
<script type="text/javascript" src="mdb/js/jquery.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="mdb/js/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="mdb/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="mdb/js/mdb.min.js"></script>
<script>
    var d = new Date();
    document.getElementById("current_date").innerHTML = d.toString();

</script>

</body>
</html>
