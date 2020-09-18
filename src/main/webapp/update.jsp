<%@ page import="com.toDo.app.utilities.DbConnection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.PreparedStatement" %><%--
  Created by IntelliJ IDEA.
  User: symoh
  Date: 30/08/2020
  Time: 08:02
  To change this template use File | Settings | File Templates.
--%>
<%
    String id=request.getParameter("id");
    String status="complete";
    try
    {
        DbConnection dbConnection2 = new DbConnection("jdbc:mysql://localhost:3306/to_Do","root","camoncxair");
        PreparedStatement preparedStatement=dbConnection2.connect().prepareStatement("UPDATE todos SET `status`=? WHERE id=?");
        preparedStatement.setString(1,status);
        preparedStatement.setString(2,id);
        preparedStatement.execute();
        out.println("status updated Successfully!");
        response.sendRedirect("index.jsp");
    }
    catch(Exception e)
    {
        System.out.print(e);
        e.printStackTrace();
    }
%>
