<%@ page import="com.toDo.app.utilities.DbConnection" %>
<%@ page import="java.sql.Statement" %>
<%--
  Created by IntelliJ IDEA.
  User: symoh
  Date: 30/08/2020
  Time: 08:15
  To change this template use File | Settings | File Templates.
--%>
<%
    String id=request.getParameter("id");
    try
    {
        DbConnection dbConnection2 = new DbConnection("jdbc:mysql://localhost:3306/to_Do","root","camoncxair");
        Statement statement = dbConnection2.connect().createStatement();
        int i=statement.executeUpdate("DELETE FROM todos WHERE id="+id);
        out.println("Data Deleted Successfully!");
        response.sendRedirect("index.jsp");
    }
    catch(Exception e)
    {
        System.out.print(e);
        e.printStackTrace();
    }
%>