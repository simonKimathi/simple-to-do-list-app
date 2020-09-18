package com.toDo.app.utilities.Listener;


import com.toDo.app.utilities.DbConnection;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;

@WebListener
public class DatabaseBootstrap implements ServletContextListener {

    public void contextInitialized(ServletContextEvent sce) {
        DbConnection dbConnection = new DbConnection("jdbc:mysql://localhost:3306/","root",
                "camoncxair");

        System.out.println("INFO: Creating database if it does not exist....");

        Statement createDbStatement = null;
        //Statement userTbStatement = null;
        Statement taskTbStatement = null;

        try {
            createDbStatement = dbConnection.connect().createStatement();
            createDbStatement.execute("CREATE DATABASE IF NOT EXISTS to_Do");

            System.out.println("INFO: db created or updated successfully...");

            System.out.println("INFO: Connection to database just created or existing");
            DbConnection dbConnection2 = new DbConnection("jdbc:mysql://localhost:3306/to_Do","root","camoncxair");

            //connect statement to connection
           // userTbStatement = dbConnection2.connect().createStatement();

            taskTbStatement = dbConnection2.connect().createStatement();

            //create tables if not exists
            System.out.println("INFO: Creating tables");

           // userTbStatement.execute("create table if not exists user(id int(3) NOT NULL AUTO_INCREMENT,firstName varchar(255),lastName varchar(255), userName varchar(255), password varchar(255),PRIMARY KEY (`id`))");

            taskTbStatement.execute("create table if not exists todos(id bigint(20) NOT NULL AUTO_INCREMENT, title varchar(255), description varchar(255), status varchar(255),dueDate varchar(255) DEFAULT 'pending',PRIMARY KEY (`id`))");


            sce.getServletContext().setAttribute("dbConnection", dbConnection2.connect());


        }catch (SQLException sqEx){
            sqEx.printStackTrace();
        }finally {
            try {
                if (createDbStatement != null)
                    createDbStatement.close();

                /*if (userTbStatement != null)
                    userTbStatement.close();*/

            }catch (SQLException sqlEx2){
                sqlEx2.printStackTrace();
            }
        }
    }

    public void contextDestroyed(ServletContextEvent sce) {
        Connection connection = (Connection) sce.getServletContext().getAttribute("dbConnection");

        if (connection != null){
            try{
                connection.close();
            }catch (SQLException sqlEx){
                sqlEx.printStackTrace();
            }
        }

    }
    public static Date getSQLDate(LocalDate date) {
        return Date.valueOf(date);
    }

    public static LocalDate getUtilDate(Date sqlDate) {
        return sqlDate.toLocalDate();
    }
}
