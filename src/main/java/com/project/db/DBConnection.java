package com.project.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConnection() {
        Connection con = null;

        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Correct JDBC URL
            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/ComplaintPortal?useSSL=false&allowPublicKeyRetrieval=true",
                "root",  // your MySQL username
                "root"       // your MySQL password
            );

            System.out.println("Database connected successfully");

        } catch (Exception e) {
            e.printStackTrace();
        }

        return con;
    }
}