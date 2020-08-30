package com.toDo.app.servlet;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.toDo.app.model.Task;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/addTasks")
public class taskServlet extends HttpServlet {
    //GET method
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //instantiate servlet context to be used everywhere
        ServletContext servletContext=getServletContext();
        //get connection from other context on database connection from database bootstrap
        Connection dbConnection=(Connection)servletContext.getAttribute("dbConnection");
        response.setContentType("text/plain");
        //create array list of Tasks
        List<Task> TaskList=new ArrayList<Task>();
        try {
            //get data from database
            PreparedStatement preparedStatement = dbConnection.prepareStatement("SELECT * FROM task");
            preparedStatement.execute();
            ResultSet resultSet = preparedStatement.getResultSet();
            while (resultSet.next()){
                Task Task=new Task();
                Task.setName(resultSet.getString("name"));
                Task.setDescription(resultSet.getString("description"));
                Task.setStatus(resultSet.getString("status"));

                TaskList.add(Task);
            }



        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        //map the object using object mapper(jackson) to be handles as html

        ObjectMapper objectMapper=new ObjectMapper();
        response.getWriter().print(objectMapper.writeValueAsString(TaskList));


    }
    protected  void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        ServletContext scx = getServletContext();
        Connection dbConnection = (Connection) scx.getAttribute("dbConnection");

        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String dueDate = request.getParameter("dueDate");
        String status = "pending";

        try {
            PreparedStatement statement = dbConnection.prepareStatement("insert into todos(title,description,status,dueDate) values(?,?,?,?)");
            statement.setString(1, title);
            statement.setString(2, description);
            statement.setString(3, status);
            statement.setString(4, dueDate);
            statement.executeUpdate();

            response.getWriter().print("to do added successfully");

            response.sendRedirect("index.jsp");

        }catch (SQLException sqlEx){
            sqlEx.printStackTrace();
        }

    }


}
