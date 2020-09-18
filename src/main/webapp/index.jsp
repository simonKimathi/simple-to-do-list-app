<%@ page import="com.toDo.app.utilities.DbConnection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>a to do app</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        body {
            background-image: url("background.jpg");
        }
        /* Remove the navbar's default margin-bottom and rounded borders */
        .navbar {
            margin-bottom: 0;
            border-radius: 0;
        }

        /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
        .row.content {height: 450px}

        /* Set gray background color and 100% height */
        .sidenav {
            padding-top: 20px;
            background-color: #f1f1f1;
            height: 100%;
        }

        /* Set black background color, white text and some padding */
        footer {
            background-color: #555;
            color: white;
            padding: 15px;
        }

        /* On small screens, set height to 'auto' for sidenav and grid */
        @media screen and (max-width: 767px) {
            .sidenav {
                height: auto;
                padding: 15px;
            }
            .row.content {height:auto;}
        }
    </style>
</head>
<body>

<%--<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <img class="navbar-brand" src="logo.png" alt="my to do app" />
            <div class="current_date"></div>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            &lt;%&ndash;<ul class="nav navbar-nav">
              <li class="active"><a href="#">Home</a></li>
              <li><a href="#">About</a></li>
              <li><a href="#">Projects</a></li>
              <li><a href="#">Contact</a></li>
            </ul>&ndash;%&gt;
            &lt;%&ndash;<ul class="nav navbar-nav navbar-right">
              <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
            </ul>&ndash;%&gt;
        </div>
    </div>
</nav>--%>

<div class="container-fluid text-center">
    <div class="row content">
        <%--        <div class="col-sm-2 sidenav">
                </div>--%>
        <div class=”row” >
            <div class="align-items-center" style="padding-top: 40px;margin-left: 40px;margin-right: 40px">
                <h1>Welcome</h1><br>
                <a href="add.jsp"><button type="button"  class="btn btn-primary" onclick="return confirm('Are you sure you want to add a new todo?')" >Add a To Do Task</button></a><br><br>
                <div class="panel-group" id="accordion" >
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title h4-responsive">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">to do tasks</a>
                            </h4>
                        </div>
                        <div id="collapse1" class="panel-collapse collapsed in">
                            <div class="panel-body">
                                <%--start of first section--%>
                                <a href="#pending" class="btn btn-primary btn-block pg5" role="Toggle" data-toggle="collapse">pending to do task</a>
                                <div class="collapsed in" id="pending">

                                    <table class = "table table-bordered table-stripped table-condensed" align = "center">
                                        <tr>
                                            <thead class="thead-dark">
                                            <%-- <th scope="col">task no</th>--%>
                                            <th scope="col">task name</th>
                                            <th scope="col">task description</th>
                                            <th scope="col">due date</th>
                                            <th scope="col">Actions</th>
                                            </thead>
                                        </tr>
                                        <%
                                            try
                                            {
                                                DbConnection dbConnection2 = new DbConnection("jdbc:mysql://localhost:3306/to_Do","root","camoncxair");
                                                String query ="pending";
                                                PreparedStatement statement = dbConnection2.connect().prepareStatement("Select * from todos where status=?");
                                                statement.setString(1,query);
                                                ResultSet result = statement.executeQuery();
                                                int count=0;
                                                while(result.next())
                                                {
                                                    count++;
                                        %>
                                        <tr>
                                            <%--<td><%=count%></td>--%>
                                            <td><%=result.getString("title")%></td>
                                            <td><%=result.getString("description")%></td>
                                            <td><%=result.getString("dueDate")%></td>
                                            <td>
                                                <a href="update.jsp?id=<%=result.getString("id") %>"><button type="button" class="btn btn-success" onclick="return confirm('are you sure the task is complete?')">complete task</button></a>
                                                <a href="delete.jsp?id=<%=result.getString("id") %>"><button type="button" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete?')">Delete task</button></a>
                                            </td>

                                        </tr>
                                        <%
                                                }
                                                session.setAttribute("count",count);
                                            }
                                            catch(Exception ex)
                                            {
                                                out.println("Exception:" +ex.getMessage());
                                                ex.printStackTrace();
                                            }
                                        %>


                                    </table>
                                </div>
                                <%--end of first section--%>
                                <%--start of second section--%>

                                <a href="#complete" class="btn btn-primary btn-block pg5" role="Toggle" data-toggle="collapse">complete to do task</a>
                                <div class="collapsed in" id="complete">
                                    <table class = "table table-bordered table-stripped table-condensed" align = "center">
                                        <tr>
                                            <thead class="thead-dark">
                                            <%-- <th scope="col">task no</th>--%>
                                            <th scope="col">task name</th>
                                            <th scope="col">task description</th>
                                            <th scope="col">due date</th>
                                            <th scope="col">Actions</th>
                                            </thead>
                                        </tr>
                                        <%
                                            try
                                            {
                                                DbConnection dbConnection2 = new DbConnection("jdbc:mysql://localhost:3306/to_Do","root","camoncxair");
                                                String query ="complete";
                                                PreparedStatement statement = dbConnection2.connect().prepareStatement("Select * from todos where status=?");
                                                statement.setString(1,query);
                                                ResultSet result = statement.executeQuery();
                                                int count1=0;
                                                while(result.next())
                                                {
                                                    count1++;
                                        %>
                                        <tr>
                                            <%--<td><%=count%></td>--%>
                                            <td><%=result.getString("title")%></td>
                                            <td><%=result.getString("description")%></td>
                                            <td><%=result.getString("dueDate")%></td>
                                            <td>
                                                <a href="delete.jsp?id=<%=result.getString("id") %>"><button type="button" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete?')">Delete task</button></a>
                                            </td>

                                        </tr>
                                        <%
                                                }
                                                session.setAttribute("count1",count1);
                                            }
                                            catch(Exception ex)
                                            {
                                                out.println("Exception:" +ex.getMessage());
                                                ex.printStackTrace();
                                            }
                                        %>


                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>



                </div>
            </div>
        </div>
        <%--<div class="col-sm-2 sidenav">
        </div>--%>
    </div>
</div>


<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="./assets/js/jquery.min.js"></script>
<script src="./assets/js/popper.js"></script>
<script src="./bootstrap/js/bootstrap.min.js"></script>
<script>
    var d = new Date();
    document.getElementById("current_date").innerHTML = d.toString();

</script>

</body>
</html>
